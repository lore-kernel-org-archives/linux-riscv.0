From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 20 Aug 2018 15:22:57 -0700 (PDT)
Subject: [PATCH v4 0/5] riscv: Add support to no-FPU systems
In-Reply-To: <1533698685-18022-1-git-send-email-alankao@andestech.com>
Message-ID: <mhng-5f2b9f66-c5c6-428f-8440-db3bab15a183@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 07 Aug 2018 20:24:40 PDT (-0700), alankao at andestech.com wrote:
> This patchset adds an option, CONFIG_FPU, to enable/disable floating-
> point procedures.
>
> Kernel's new behavior will be as follows:
>
> * with CONFIG_FPU=y
>   All FPU codes are reserved.  If no FPU is found during booting, a
>   global flag will be set, and those functions will be bypassed with
>   condition check to that flag.
>
> * with CONFIG_FPU=n
>   No floating-point instructions in kernel and all related settings
>   are excluded.
>
> Changes in v4:
>  - Append a new patch to detect existence of FPU and followups.
>  - Add SPDX header to newly created fpu.S.
>  - Fix a build error, sorry for that.
>  - Fix wording, style, etc.
>
> Changes in v3:
>  - Refactor the whole patch into independent ones.
>
> Changes in v2:
>  - Various code cleanups and style fixes.
>
> Alan Kao (5):
>   Extract FPU context operations from entry.S
>   Refactor FPU code in signal setup/return procedures
>   Cleanup ISA string setting
>   Allow to disable FPU support
>   Auto-detect whether a FPU exists
>
>  arch/riscv/Kconfig                 |   9 +++
>  arch/riscv/Makefile                |  19 +++---
>  arch/riscv/include/asm/hwcap.h     |   3 +
>  arch/riscv/include/asm/switch_to.h |  21 ++++++
>  arch/riscv/kernel/Makefile         |   1 +
>  arch/riscv/kernel/cpufeature.c     |  11 +++
>  arch/riscv/kernel/entry.S          |  87 -----------------------
>  arch/riscv/kernel/fpu.S            | 106 +++++++++++++++++++++++++++++
>  arch/riscv/kernel/process.c        |   4 +-
>  arch/riscv/kernel/signal.c         |  79 +++++++++++++--------
>  10 files changed, 214 insertions(+), 126 deletions(-)
>  create mode 100644 arch/riscv/kernel/fpu.S

Aside from the CFLAGS issue this looks good.  I've queued this up in 
kernel.org/palmer/linux.git/next-nofpu, but I'm not going to put this on 
for-next until after the merge window closes.

Thanks!
