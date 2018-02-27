From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 26 Feb 2018 17:28:53 -0800 (PST)
Subject: [PATCH RFC] riscv/barrier: Define __smp_{mb,rmb,wmb}
In-Reply-To: <20180226103552.GA9138@andrea>
Message-ID: <mhng-48f70f62-ce5a-4093-914b-626c204b493e@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, 26 Feb 2018 02:35:52 PST (-0800), parri.andrea at gmail.com wrote:
> On Thu, Feb 22, 2018 at 03:14:52PM -0800, Palmer Dabbelt wrote:
>> On Tue, 20 Feb 2018 02:17:28 PST (-0800), parri.andrea at gmail.com wrote:
>> >Introduce __smp_{mb,rmb,wmb}, and rely on the generic definitions
>> >for smp_{mb,rmb,wmb}. A first consequence is that smp_{mb,rmb,wmb}
>> >map to a compiler barrier on !SMP (while their definition remains
>> >unchanged on SMP). As a further consequence, smp_load_acquire and
>> >smp_store_release have "fence rw,rw" instead of "fence iorw,iorw".
>> >
>> >Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
>> >---
>> > arch/riscv/include/asm/barrier.h | 6 +++---
>> > 1 file changed, 3 insertions(+), 3 deletions(-)
>> >
>> >diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
>> >index c0319cbf1eec5..5510366d169ae 100644
>> >--- a/arch/riscv/include/asm/barrier.h
>> >+++ b/arch/riscv/include/asm/barrier.h
>> >@@ -34,9 +34,9 @@
>> > #define wmb()		RISCV_FENCE(ow,ow)
>> >
>> > /* These barriers do not need to enforce ordering on devices, just memory. */
>> >-#define smp_mb()	RISCV_FENCE(rw,rw)
>> >-#define smp_rmb()	RISCV_FENCE(r,r)
>> >-#define smp_wmb()	RISCV_FENCE(w,w)
>> >+#define __smp_mb()	RISCV_FENCE(rw,rw)
>> >+#define __smp_rmb()	RISCV_FENCE(r,r)
>> >+#define __smp_wmb()	RISCV_FENCE(w,w)
>> >
>> > /*
>> >  * This is a very specific barrier: it's currently only used in two places in
>>
>> Thanks!  I'm going to take this for the next RC.
>
> Thank you, Palmer.  I'm planning to post more changes to the file,
> but I'd like to build on top of this change: could you point me to
> the appropriate branch/repo for this?

Here's the canonical RISC-V Linux git repo

    https://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git/

Your branch is now the HEAD of the "for-linus" branch, which means it'll be 
sent to Linus the next time I send patches.  I generate and tag "for-linus" on 
Monday mornings and then send it out on Wednesday mornings, just to make sure 
everything has time to bake.

    https://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git/

Additionally, I mantain a "for-next" branch that contains everything that's 
been sufficiently reviewed to be made part of Linux, but that is being staged 
for a bit longer than what's in for-linus for one reason or another (usually 
it's just not RC material and is targeted for the next merge window).  There is 
also a RISC-V integration branch named "riscv-all" that contains all our work 
in progress patches.  This is likely to be unstable, but it's best to check 
there to see if anything interesting is going on related to what you're working 
on to avoid duplicating work.

These branches are all generated from my personal git tree

    https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/

There's a bunch of branches in here tracking each change set (yours is called 
"fix-smp_mb", to indicate it can go in during an RC) that's still in flight.  
There's some scripts to generate some of these branches, but the commits I 
actually send upstream are merged by hand

    https://github.com/riscv/riscv-linux-infra

"for-next" and "riscv-all" are rebased regularly, so it's probably best to 
track commits back to their original WIP branch and work from there to avoid 
major headaches.
