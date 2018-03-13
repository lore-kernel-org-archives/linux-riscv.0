From: shea@shealevy.com (Shea Levy)
Date: Tue, 13 Mar 2018 17:26:01 -0400
Subject: [PATCH 00/11] RISC-V: Resolve the issue of loadable module on
 64-bit
In-Reply-To: <cover.1520928420.git.zong@andestech.com>
References: <cover.1520928420.git.zong@andestech.com>
Message-ID: <87vadzzmza.fsf@xps13.shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hello!

You may be interested in my recent patchset [1], which has known issues
but addresses the same problems yours does. It differs in the approach
taken here in that, rather than supporting GOT/PLT handling which we
can't really take advantage of anyway, we simply build non-PIC modules
instead [2]. Additionally, I see your patchset has the same concern mine
does, which is that ignoring ALIGN relaxations is not actually an option
[3]. The approach I plan to take is outlined by Palmer at [4].

As of now I hope to get back to my patchset this weekend, but if you're
close to a complete implementation by then maybe I can avoid duplicating
the work ;)

Thanks,
Shea

[1]: http://lists.infradead.org/pipermail/linux-riscv/2018-February/000081.html
[2]: http://lists.infradead.org/pipermail/linux-riscv/2018-February/000080.html
[3]: http://lists.infradead.org/pipermail/linux-riscv/2018-February/000105.html
[4]: http://lists.infradead.org/pipermail/linux-riscv/2018-March/000147.html
Zong Li <zong@andestech.com> writes:

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
>
> -- 
> 2.16.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 832 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20180313/634eefc4/attachment.sig>
