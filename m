From: peterz@infradead.org (Peter Zijlstra)
Date: Thu, 22 Feb 2018 14:40:04 +0100
Subject: [RFC PATCH] riscv/locking: Strengthen spin_lock() and
 spin_unlock()
In-Reply-To: <1519301990-11766-1-git-send-email-parri.andrea@gmail.com>
References: <1519301990-11766-1-git-send-email-parri.andrea@gmail.com>
Message-ID: <20180222134004.GN25181@hirez.programming.kicks-ass.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Feb 22, 2018 at 01:19:50PM +0100, Andrea Parri wrote:

> C unlock-lock-read-ordering
> 
> {}
> /* s initially owned by P1 */
> 
> P0(int *x, int *y)
> {
> 	WRITE_ONCE(*x, 1);
> 	smp_wmb();
> 	WRITE_ONCE(*y, 1);
> }
> 
> P1(int *x, int *y, spinlock_t *s)
> {
> 	int r0;
> 	int r1;
> 
> 	r0 = READ_ONCE(*y);
> 	spin_unlock(s);
> 	spin_lock(s);
> 	r1 = READ_ONCE(*y);
> }
> 
> exists (1:r0=1 /\ 1:r1=0)
> 
> RISCV RISCV-unlock-lock-read-ordering
> {
> 0:x2=x; 0:x4=y;
> 1:x2=y; 1:x4=x; 1:x6=s;
> s=1;
> }
>  P0           |  P1                      ;
>  ori x1,x0,1  | lw x1,0(x2)              ;
>  sw x1,0(x2)  | amoswap.w.rl x0,x0,(x6)  ;
>  fence w,w    | ori x5,x0,1              ;
>  ori x3,x0,1  | amoswap.w.aq x0,x5,(x6)  ;
>  sw x3,0(x4)  | lw x3,0(x4)              ;
> exists
> (1:x1=1 /\ 1:x3=0)

So I would indeed expect this to be forbidden. Could someone please
explain how this could be allowed?

> C unlock-lock-write-ordering
> 
> {}
> /* s initially owned by P0 */
> 
> P0(int *x, int *y, spinlock_t *s)
> {
> 	WRITE_ONCE(*x, 1);
> 	spin_unlock(s);
> 	spin_lock(s);
> 	WRITE_ONCE(*y, 1);
> }
> 
> P1(int *x, int *y)
> {
> 	int r0;
> 	int r1;
> 
> 	r0 = READ_ONCE(*y);
> 	smp_rmb();
> 	r1 = READ_ONCE(*y);
> }
> 
> exists (1:r0=1 /\ 1:r1=0)
> 
> RISCV RISCV-unlock-lock-write-ordering
> {
> 0:x2=x; 0:x4=y; 0:x6=s;
> 1:x2=y; 1:x4=x;
> s=1;
> }
>  P0                       | P1           ;
>  ori x1,x0,1              | lw x1,0(x2)  ;
>  sw x1,0(x2)              | fence r,r    ;
>  amoswap.w.rl x0,x0,(x6)  | lw x3,0(x4)  ;
>  ori x5,x0,1              |              ;
>  amoswap.w.aq x0,x5,(x6)  |              ;
>  ori x3,x0,1              |              ;
>  sw x3,0(x4)              |              ;
> exists
> (1:x1=1 /\ 1:x3=0)

And here I think the RISCV conversion is flawed, there should be a ctrl
dependency. The second store-word in P0 should depend on the result of
amoswap.w.aq being 0.

(strictly speaking there should be a ctrl-dep in the read example too,
except it'd be pointless for ordering reads, so I accept it being left
out)

Again, I cannot see how this could be allowed.
