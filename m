From: zongbox@gmail.com (Zong Li)
Date: Mon, 15 Oct 2018 20:33:17 +0800
Subject: [PATCH v4 0/5] Fix some bugs on RV32 build fail and issue
In-Reply-To: <cover.1538535527.git.zongbox@gmail.com>
References: <cover.1538535527.git.zongbox@gmail.com>
Message-ID: <CA+ZOyaig6dwzfhUn5CQ92P__yay2-aAgA4Nh+VxTs50FCbECwQ@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Zong Li <zongbox@gmail.com> ? 2018?10?3? ?? ??11:12???
>
> This patches contain the modificaion as follows:
> 1. Fix up the building fail on RV32.
> 2. Add umoddi3 and udivmoddi4 functions for RV32.
> 3. Fix ioremap problem on RV32.
>
> Thanks all for review these code and modify the copyright description.
>
> Changes in v4:
>  - Retain the complete copyright description.
>  - Modify commit message.
>  - Rebase upstream code.
>
> Changes in v3:
>  - Change the copyright notices to GPLv2 from  gcc 4.2.1.
>
> Changes in v2:
>  - Retain the copyright notices from libgcc in umoddi3.c and udivmoddi4.c.
>
> Vincent Chen (1):
>   RISC-V: Avoid corrupting the upper 32-bit of phys_addr_t in ioremap
>
> Zong Li (4):
>   RISC-V: Build tishift only on 64-bit
>   RISC-V: Add preprocessor directive for swiotlb
>   lib: Add umoddi3 and udivmoddi4 of GCC library routines
>   RISC-V: Select GENERIC_LIB_UMODDI3 on RV32
>
>  arch/riscv/Kconfig        |   1 +
>  arch/riscv/kernel/setup.c |   3 +
>  arch/riscv/lib/Makefile   |   3 +-
>  arch/riscv/mm/ioremap.c   |   2 +-
>  lib/Kconfig               |   3 +
>  lib/Makefile              |   1 +
>  lib/udivmoddi4.c          | 326 ++++++++++++++++++++++++++++++++++++++++++++++
>  lib/umoddi3.c             |  48 +++++++
>  8 files changed, 385 insertions(+), 2 deletions(-)
>  create mode 100644 lib/udivmoddi4.c
>  create mode 100644 lib/umoddi3.c
>
> --
> 2.7.4
>

ping
