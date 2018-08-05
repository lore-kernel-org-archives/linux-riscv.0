From: alankao@andestech.com (Alan Kao)
Date: Mon, 6 Aug 2018 07:32:01 +0800
Subject: [PATCH v2] riscv: Add support to no-FPU systems
In-Reply-To: <mhng-d4977eb5-94cc-4b3f-b548-e27158814ed7@palmer-si-x1c4>
References: <CA++6G0AMXC0ZeTZ+tkLh_5QGoPMR+3YD8Ed=DR8-G=6FL1yDSw@mail.gmail.com>
 <mhng-d4977eb5-94cc-4b3f-b548-e27158814ed7@palmer-si-x1c4>
Message-ID: <20180805233201.GA15062@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, Aug 03, 2018 at 09:03:00PM -0700, Palmer Dabbelt wrote:
> On Wed, 01 Aug 2018 11:23:43 PDT (-0700), Andrew Waterman wrote:
> >On Wed, Aug 1, 2018 at 10:55 AM, Palmer Dabbelt <palmer@sifive.com> wrote:
> >>On Tue, 26 Jun 2018 21:22:26 PDT (-0700), alankao at andestech.com wrote:
> >>>
> >>>This patch adds an option, CONFIG_FPU, to enable/disable floating
> >>>procedures.  Also, some style issues are fixed.
> >>>
> >>>Signed-off-by: Alan Kao <alankao@andestech.com>
> >>>Cc: Greentime Hu <greentime@andestech.com>
> >>>Cc: Zong Li <zong@andestech.com>
> >>>---
> >>> arch/riscv/Kconfig                 |  9 ++++
> >>> arch/riscv/Makefile                | 19 +++----
> >>> arch/riscv/include/asm/switch_to.h |  6 +++
> >>> arch/riscv/kernel/entry.S          |  3 +-
> >>> arch/riscv/kernel/process.c        |  7 ++-
> >>> arch/riscv/kernel/signal.c         | 82 +++++++++++++++++++++---------
> >>> 6 files changed, 90 insertions(+), 36 deletions(-)
> >>>
> >>>diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> >>>index 6debcc4afc72..6069597ba73f 100644
> >>>--- a/arch/riscv/Kconfig
> >>>+++ b/arch/riscv/Kconfig
> >>>@@ -232,6 +232,15 @@ config RISCV_BASE_PMU
> >>>
> >>> endmenu
> >>>
> >>>+config FPU
> >>>+       bool "FPU support"
> >>>+       default y
> >>>+       help
> >>>+         Say N here if you want to disable all floating-point related
> >>>procedure
> >>>+         in the kernel.
> >>>+
> >>>+         If you don't know what to do here, say Y.
> >>>+
> >>> endmenu
> >>
> >>
> >>Sorry for letting this slide for a bit.  While I'm not opposed to a solution
> >>that requires a FPU Kconfig option, it'd be a bit better if we could detect
> >>this at boot time.  I think this should be possible because at one point
> >>this actually worked and we could boot the same kernel on FPU and no-FPU
> >>systems.
> >
> >I believe it would suffice to have start_thread set sstatus.FS to OFF
> >for no-FPU systems (vs. INITIAL for systems with FPU).   The ISA
> >string in the devicetree should indicate whether F/D extensions are
> >present.
> >
> >That said, it makes sense to me to additionally provide the Kconfig
> >option.  This would elide the sstatus.SD check for no-FPU systems,
> >shaving a couple instructions off the context-switch path.  It would
> >also enable mimicking the behavior of a no-FPU system even when the
> >FPU is present.
> 
> That sounds like a good argument.  Do you mind submitting a two-part patch
> set, to:
> 
> * Allow FPU kernels to detect and run correctly on non-FPU systems.  You
> should  be able to detect these very early by writing to sstatus, or later
> by looking  at the device tree.
> * Add a Kconfig option to disable the FPU entirely (which is pretty much
> this  patch).
> 
> Thanks!
> 

Thanks for the feedback from all of you.

We will fix v3 according to Christph's suggestions,
and append a new patch of the auto-detecting feature.
