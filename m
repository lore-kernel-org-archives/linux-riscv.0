From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 20 Aug 2018 15:10:40 -0700
Subject: Post-4.19 WIP Branch Cleanup, riscv-linux-4.18, and 4.20 plans
In-Reply-To: <mhng-b2f871a4-be9c-4107-baef-52a6258dbe45@palmer-si-x1c4>
References: <mhng-b2f871a4-be9c-4107-baef-52a6258dbe45@palmer-si-x1c4>
Message-ID: <20180820221040.GA12269@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Aug 20, 2018 at 02:04:47PM -0700, Palmer Dabbelt wrote:
> * fix-delete_compat, fix-noinc: Suitable for this MW, in my PR.

The fix-noinc one still has some outstanding issues, see my comments
posted last week.  fix-delete_compat looks fine.

> * review-init_halt_cleanups: I need to review these before sending them out,
>
> but I think they're suitable for RCs.

At lot of this is probably going to clash with the hotplug updates from
Atish (which I need to find some time to review).

> * wip-32bit_dma: I think this branch is defunct, but I haven't gotten a
> chance  to give it a proper check yet.  This is the patch set (from
> Christoph) that I  think obseletes this branch
> <https://lkml.org/lkml/2018/5/25/477>.

> * wip-dma: I think we need the functionality here, but the code is a mess --
> it's a hodge-podge of a proper patch from Christoph and some hackery of mine
> that I think can be dropped now in favor of the generic support.

These two belong together.  What is still missing upstream to support
the same functionality would be:

http://lists.infradead.org/pipermail/linux-riscv/2018-August/000920.html

but the conclusion of that thread seems like we'd be better off to
just add a proper dma-ranges property to the DT and not require kernel
changes.


> * wip-fespi: This needs review, but is at least well split out so that's
> feasible to do now.

>From a quick look the code looks sensible.  Add proper SPDX tags and
send it off for an inclusion attempt I'd ?ay.

> * wip-futex_cmpxchg: Not sure what to do with this, but at least it's small.
> If it's still necessary then I'm not opposed to throwing this in as it
> stands  (and during an RC), but if providing an SMP implementation is as
> quick as it  seems to be then we should fix it correctly.

It's more of an optimization.  Note that the lack of a proper
futex_cmpxchg implementation for SMP will also need to be sorted out,
without that glibc locking primitives can't be made fully race free.

> * wip-gemgxl_clock_driver: Another one that's stand-alone and therefor
> suitable  for review.

Needs a good changelog and an SPXD tag, and then off to the maintainer.

> * wip-prci_clock: Another one that's stand-alone and therefor suitable for
> review.

Needs a good changelog and an SPXD tag, and then off to the maintainer.

> * wip-seccomp: This looks fine, I'll send it for review after the merge
> window  and target it for 4.20.

SPDX tags need to be in the first line of the file.
bool + promt in Kconfig is rather unusal, should use the normal
form.

Otherwise looks fine to me.

> * wip-sifive_serial: Another one that's stand-alone and therefor suitable
> for  review.  Paul is at SiFive now, so he'll be taking it over.
> * wip-timer: Here's another one that's a mess.  Christoph cleaned up the
> driver and Atish has a better version out on the mailing list of what's
> left,  so my hope is that we're in decent shape for 4.20 here.

Note that we dropped the patch to support the per-hart timebase patch
from the irq series, so that will need a resubmission together with
the DT changes.

> If your patches aren't on one of these branches then they're probably in my
> inbox.  If so then there's no reason to re-send it, but if it's not in my
> inbox then please re-send your patches as I must have lost them.  Assuming
> my list is complete, I think we've got a decent shot to get this all fixed
> up and in for 4.20.  It looks like the major issues are the DMA mess (which
> Christoph might have mostly fixed already) and the timer mess (which Atish
> has a patch set out for) -- thanks for the help!

Here is some older stuff that needs a re-review (and/or re-posting):

commit 3bf523445a4fe1cd178edc97646e2a1fcfc1f480
Author: Wesley W. Terpstra <wesley@sifive.com>
Date:   Wed Mar 14 23:56:54 2018 -0700

    riscv_timer: add support for sched_clock

(will need some major work to apply to the current codebase)

commit 9a6b5bc1cdf424d4ddda993d4b0121f619093429
Author: Palmer Dabbelt <palmer@sifive.com>
Date:   Mon Jun 25 13:23:12 2018 -0700

    Move EM_RISCV into elf-em.h

(should easily apply as-is)
