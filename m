From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 02 Apr 2018 20:15:44 -0700 (PDT)
Subject: [PATCH 0/2] perf: riscv: Preliminary Perf Event Support on RISC-V
In-Reply-To: <1522672284-29593-1-git-send-email-alankao@andestech.com>
Message-ID: <mhng-678de5a0-ca3d-48d1-848f-9a2431a874f2@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, 02 Apr 2018 05:31:22 PDT (-0700), alankao at andestech.com wrote:
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

I'm having some trouble pulling this into my tree.  I think you might have 
another patch floating around somewhere, as I don't have any 
arch/riscv/include/asm/perf_event.h right now.

Do you mind rebasing this on top of linux-4.16 so I can look properly?

Thanks!
