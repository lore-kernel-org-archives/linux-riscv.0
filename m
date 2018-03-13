From: palmer@sifive.com (Palmer Dabbelt)
Date: Tue, 13 Mar 2018 11:35:54 -0700 (PDT)
Subject: [PATCH 00/11] RISC-V: Resolve the issue of loadable module on
 64-bit
In-Reply-To: <cover.1520928420.git.zong@andestech.com>
Message-ID: <mhng-dcc790fc-8fd7-41c8-84c8-cc4b8bd662ea@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 13 Mar 2018 01:35:05 PDT (-0700), zong at andestech.com wrote:
> These patches resolve the some issues of loadable module.
>   - symbol out of ranges
>   - unknown relocation types
>
> The reference of external variable and function symbols
> cannot exceed 32-bit offset ranges in kernel module.
> The module only can work on the 32-bit OS or the 64-bit
> OS with sv32 virtual addressing.
>
> These patches will generate the .got, .got.plt and
> .plt sections during loading module, let it can refer
> to the symbol which locate more than 32-bit offset.
> These sections depend on the relocation types:
>  - R_RISCV_GOT_HI20
>  - R_RISCV_CALL_PLT
>
> These patches also support more relocation types
>  - R_RISCV_CALL
>  - R_RISCV_HI20
>  - R_RISCV_LO12_I
>  - R_RISCV_LO12_S
>  - R_RISCV_RVC_BRANCH
>  - R_RISCV_RVC_JUMP
>  - R_RISCV_ALIGN
>  - R_RISCV_ADD32
>  - R_RISCV_SUB32
>
> Zong Li (11):
>   RISC-V: Add sections of PLT and GOT for kernel module
>   RISC-V: Add section of GOT.PLT for kernel module
>   RISC-V: Support GOT_HI20/CALL_PLT relocation type in kernel module
>   RISC-V: Support CALL relocation type in kernel module
>   RISC-V: Support HI20/LO12_I/LO12_S relocation type in kernel module
>   RISC-V: Support RVC_BRANCH/JUMP relocation type in kernel modulewq
>   RISC-V: Support ALIGN relocation type in kernel module
>   RISC-V: Support ADD32 relocation type in kernel module
>   RISC-V: Support SUB32 relocation type in kernel module
>   RISC-V: Enable module support in defconfig
>   RISC-V: Add definition of relocation types
>
>  arch/riscv/Kconfig                  |   5 ++
>  arch/riscv/Makefile                 |   3 +
>  arch/riscv/configs/defconfig        |   2 +
>  arch/riscv/include/asm/module.h     | 112 +++++++++++++++++++++++
>  arch/riscv/include/uapi/asm/elf.h   |  24 +++++
>  arch/riscv/kernel/Makefile          |   1 +
>  arch/riscv/kernel/module-sections.c | 156 ++++++++++++++++++++++++++++++++
>  arch/riscv/kernel/module.c          | 175 ++++++++++++++++++++++++++++++++++--
>  arch/riscv/kernel/module.lds        |   8 ++
>  9 files changed, 480 insertions(+), 6 deletions(-)
>  create mode 100644 arch/riscv/include/asm/module.h
>  create mode 100644 arch/riscv/kernel/module-sections.c
>  create mode 100644 arch/riscv/kernel/module.lds

This is the second set of patches that turn on modules, and it has the same
R_RISCV_ALIGN problem as the other one

    http://lists.infradead.org/pipermail/linux-riscv/2018-February/000081.html

It looks like this one uses shared libraries for modules instead of static
objects.  I think using shared objects is the right thing to do, as it'll allow
us to place modules anywhere in the address space by having multiple GOTs and
PLTs.  That's kind of complicated, though, so we can start with something
simpler like this.
