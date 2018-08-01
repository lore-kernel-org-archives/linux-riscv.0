From: alankao@andestech.com (Alan Kao)
Date: Thu, 2 Aug 2018 07:09:38 +0800
Subject: [PATCH v2] riscv: Add support to no-FPU systems
In-Reply-To: <mhng-47d9ea80-a0c6-4cde-be65-75046c5d49d2@palmer-si-x1c4>
References: <1530073346-5341-1-git-send-email-alankao@andestech.com>
 <mhng-47d9ea80-a0c6-4cde-be65-75046c5d49d2@palmer-si-x1c4>
Message-ID: <20180801230936.GA19815@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Aug 01, 2018 at 10:55:28AM -0700, Palmer Dabbelt wrote:
> On Tue, 26 Jun 2018 21:22:26 PDT (-0700), alankao at andestech.com wrote:
> >This patch adds an option, CONFIG_FPU, to enable/disable floating
> >procedures.  Also, some style issues are fixed.
> >
> >Signed-off-by: Alan Kao <alankao@andestech.com>
> >Cc: Greentime Hu <greentime@andestech.com>
> >Cc: Zong Li <zong@andestech.com>
> >---
> > arch/riscv/Kconfig                 |  9 ++++
> > arch/riscv/Makefile                | 19 +++----
> > arch/riscv/include/asm/switch_to.h |  6 +++
> > arch/riscv/kernel/entry.S          |  3 +-
> > arch/riscv/kernel/process.c        |  7 ++-
> > arch/riscv/kernel/signal.c         | 82 +++++++++++++++++++++---------
> > 6 files changed, 90 insertions(+), 36 deletions(-)
> >
> >diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> >index 6debcc4afc72..6069597ba73f 100644
> >--- a/arch/riscv/Kconfig
> >+++ b/arch/riscv/Kconfig
> >@@ -232,6 +232,15 @@ config RISCV_BASE_PMU
> >
> > endmenu
> >
> >+config FPU
> >+	bool "FPU support"
> >+	default y
> >+	help
> >+	  Say N here if you want to disable all floating-point related procedure
> >+	  in the kernel.
> >+
> >+	  If you don't know what to do here, say Y.
> >+
> > endmenu
> 
> Sorry for letting this slide for a bit.  While I'm not opposed to a solution
> that requires a FPU Kconfig option, it'd be a bit better if we could detect
> this at boot time.  I think this should be possible because at one point
> this actually worked and we could boot the same kernel on FPU and no-FPU
> systems.
> 
> If that's not possible then we'll have to take something like this.  There
> were some comments on this v2 but I don't see a v3, did I miss one?

I have been refatoring this into a patchset containing logically
indenpendent patches.  It will be sent soon after some sanity checks.
