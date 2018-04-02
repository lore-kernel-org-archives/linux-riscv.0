From: alankao@andestech.com (Alan Kao)
Date: Mon, 2 Apr 2018 20:34:03 +0800
Subject: [PATCH v2 0/2] perf: riscv: Preliminary Perf Event Support on
 RISC-V
In-Reply-To: <1522672284-29593-1-git-send-email-alankao@andestech.com>
References: <1522672284-29593-1-git-send-email-alankao@andestech.com>
Message-ID: <20180402123403.GA30097@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Sorry for the lack of version prefix in the title.  This patchset should be
version 2.

On Mon, Apr 02, 2018 at 08:31:22PM +0800, Alan Kao wrote:
> This implements the baseline PMU for RISC-V platforms.
> 
> To ease future PMU portings, a guide is also written, containing
> perf concepts, arch porting practices and some hints.
> 
> Changes in v2:
>  - Fix the bug reported by Alex, which was caused by not sufficient
>    initialization.  Check https://lkml.org/lkml/2018/3/31/251 for the
>    discussion.
> 
> Alan Kao (2):
>   perf: riscv: preliminary RISC-V support
>   perf: riscv: Add Document for Future Porting Guide
> 
>  Documentation/riscv/pmu.txt         | 249 +++++++++++++++++++
>  arch/riscv/Kconfig                  |  12 +
>  arch/riscv/include/asm/perf_event.h |  76 +++++-
>  arch/riscv/kernel/Makefile          |   1 +
>  arch/riscv/kernel/perf_event.c      | 468 ++++++++++++++++++++++++++++++++++++
>  5 files changed, 802 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/riscv/pmu.txt
>  create mode 100644 arch/riscv/kernel/perf_event.c
> 
> -- 
> 2.16.2
> 
