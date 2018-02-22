From: paulmck@linux.vnet.ibm.com (Paul E. McKenney)
Date: Thu, 22 Feb 2018 12:02:37 -0800
Subject: [RFC PATCH] riscv/locking: Strengthen spin_lock() and
 spin_unlock()
In-Reply-To: <20180222182717.GS25181@hirez.programming.kicks-ass.net>
References: <1519301990-11766-1-git-send-email-parri.andrea@gmail.com>
 <20180222134004.GN25181@hirez.programming.kicks-ass.net>
 <20180222141249.GA14033@andrea>
 <82beae6a-2589-6136-b563-3946d7c4fc60@nvidia.com>
 <20180222181317.GI2855@linux.vnet.ibm.com>
 <20180222182717.GS25181@hirez.programming.kicks-ass.net>
Message-ID: <20180222200237.GK2855@linux.vnet.ibm.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Feb 22, 2018 at 07:27:17PM +0100, Peter Zijlstra wrote:
> On Thu, Feb 22, 2018 at 10:13:17AM -0800, Paul E. McKenney wrote:
> > So we have something that is not all that rare in the Linux kernel
> > community, namely two conflicting more-or-less concurrent changes.
> > This clearly needs to be resolved, either by us not strengthening the
> > Linux-kernel memory model in the way we were planning to or by you
> > strengthening RISC-V to be no weaker than PowerPC for these sorts of
> > externally viewed release-acquire situations.
> > 
> > Other thoughts?
> 
> Like said in the other email, I would _much_ prefer to not go weaker
> than PPC, I find that PPC is already painfully weak at times.

And here are the four PowerPC litmus tests.  As expected, a
release-acquire pair within a given process orders everything except
for prior stores against later loads, from the viewpoint of some other
process.

And yes, a few of the filenames are unfortunate.

							Thanx, Paul

------------------------------------------------------------------------

PPC MP+o-r-a-o+o-rmb-o
""
(* 22-Feb-2018: ppcmem says "Never" *)
{
0:r1=1; 0:r4=x; 0:r5=y; 0:r6=z;
1:r1=1; 1:r4=x; 1:r5=y; 1:r6=z;
}
 P0           | P1           ;
 stw r1,0(r4) | lwz r7,0(r6) ;
 lwsync       | lwsync       ;
 stw r1,0(r5) | lwz r8,0(r4) ;
 lwz r7,0(r5) |              ;
 lwsync       |              ;
 stw r1,0(r6) |              ;


exists
(1:r7=1 /\ 1:r8=0)

------------------------------------------------------------------------

PPC SB+o-r-a-o+o-rmb-o
""
(* 22-Feb-2018: ppcmem says "Sometimes" *)
{
0:r1=1; 0:r4=x; 0:r5=y; 0:r6=z;
1:r1=1; 1:r4=x; 1:r5=y; 1:r6=z;
}
 P0           | P1           ;
 stw r1,0(r4) | stw r1,0(r6) ;
 lwsync       | lwsync       ;
 stw r1,0(r5) | lwz r7,0(r4) ;
 lwz r8,0(r5) |              ;
 lwsync       |              ;
 lwz r7,0(r6) |              ;


exists
(0:r7=0 /\ 1:r7=0)

------------------------------------------------------------------------

PPC LB+o-r-a-o+o-rmb-o
""
(* 22-Feb-2018: ppcmem says "Never" *)
{
0:r1=1; 0:r4=x; 0:r5=y; 0:r6=z;
1:r1=1; 1:r4=x; 1:r5=y; 1:r6=z;
}
 P0           | P1           ;
 lwz r7,0(r4) | lwz r7,0(r6) ;
 lwsync       | lwsync       ;
 stw r1,0(r5) | stw r1,0(r4) ;
 lwz r8,0(r5) |              ;
 lwsync       |              ;
 stw r1,0(r6) |              ;


exists
(0:r7=1 /\ 1:r7=1)

------------------------------------------------------------------------

PPC MP+o-rmb-o+o-r-a-o.litmus
""
(* 22-Feb-2018: ppcmem says "Never" *)
{
0:r1=1; 0:r4=x; 0:r5=y; 0:r6=z;
1:r1=1; 1:r4=x; 1:r5=y; 1:r6=z;
}
 P0           | P1           ;
 lwz r7,0(r4) | stw r1,0(r6) ;
 lwsync       | lwsync       ;
 stw r1,0(r5) | stw r1,0(r4) ;
 lwz r8,0(r5) |              ;
 lwsync       |              ;
 lwz r9,0(r6) |              ;


exists
(0:r7=1 /\ 0:r9=0)
