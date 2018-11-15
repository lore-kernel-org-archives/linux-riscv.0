From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Wed, 14 Nov 2018 23:50:04 -0800
Subject: [RFC/RFT 2/2] RISC-V: kprobes/kretprobe support
In-Reply-To: <05082ba4-33d6-a95c-e049-78791dafc009@packi.ch>
References: <20181113195804.22825-1-me@packi.ch>
 <20181113195804.22825-3-me@packi.ch>
 <20181114003730.06f810517a270070734df4ce@kernel.org>
 <20181114074951.0902699286fdf8652f2878a4@kernel.org>
 <05082ba4-33d6-a95c-e049-78791dafc009@packi.ch>
Message-ID: <20181114235004.1d57d911e15efaa8f18fa75e@kernel.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, 14 Nov 2018 22:10:52 +0100
Patrick Staehlin <me@packi.ch> wrote:

> On 14.11.18 16:49, Masami Hiramatsu wrote:
> > On Wed, 14 Nov 2018 00:37:30 -0800
> > Masami Hiramatsu <mhiramat@kernel.org> wrote:
> > 
> >>> +
> >>> +static int __kprobes patch_text(kprobe_opcode_t *addr, u32 opcode)
> >>> +{
> >>> +	if (is_compressed_insn(opcode))
> >>> +		*(u16 *)addr = cpu_to_le16(opcode);
> >>> +	else
> >>> +		*addr = cpu_to_le32(opcode);
> >>> +
> > 
> > BTW, don't RISC-V need any i-cache flush and per-core serialization
> > for patching the text area? (and no text_mutex protection?)
> 
> Yes, we should probably call flush_icache_all. This code works on
> QEMU/virt but I guess on real hardware you may run into problems,
> especially when disarming the kprobe. I'll have a look at the arm64 code
> again to see what's missing.

Note that self code-modifying is a special case for any processors, especially
if that is multi-processor. In general, this may depend on the circuit desgin,
not ISA.
Some processor implementation will do in-order and no i-cache, no SMP, that will
be simple, but if it is out-of-order, deep pipeline, huge i-cache, and many-core,
you might have to care many things. We have to talk with someone who is designing
real hardware, and maybe better to make the patch_text pluggable for variants.
(or choose the safest way)

> >>> diff --git a/arch/riscv/kernel/probes/kprobes_trampoline.S b/arch/riscv/kernel/probes/kprobes_trampoline.S
> >>> new file mode 100644
> >>> index 000000000000..c7ceda9556a3
> >>> --- /dev/null
> >>> +++ b/arch/riscv/kernel/probes/kprobes_trampoline.S
> >>> @@ -0,0 +1,91 @@
> >>> +/* SPDX-License-Identifier: GPL-2.0+ */
> >>> +
> >>> +#include <linux/linkage.h>
> >>> +
> >>> +#include <asm/asm.h>
> >>> +#include <asm/asm-offsets.h>
> >>> +
> >>> +	.text
> >>> +	.altmacro
> >>> +
> >>> +	.macro save_all_base_regs
> >>> +	REG_S x1,  PT_RA(sp)
> >>> +	REG_S x3,  PT_GP(sp)
> >>> +	REG_S x4,  PT_TP(sp)
> >>> +	REG_S x5,  PT_T0(sp)
> >>> +	REG_S x6,  PT_T1(sp)
> >>> +	REG_S x7,  PT_T2(sp)
> >>> +	REG_S x8,  PT_S0(sp)
> >>> +	REG_S x9,  PT_S1(sp)
> >>> +	REG_S x10, PT_A0(sp)
> >>> +	REG_S x11, PT_A1(sp)
> >>> +	REG_S x12, PT_A2(sp)
> >>> +	REG_S x13, PT_A3(sp)
> >>> +	REG_S x14, PT_A4(sp)
> >>> +	REG_S x15, PT_A5(sp)
> >>> +	REG_S x16, PT_A6(sp)
> >>> +	REG_S x17, PT_A7(sp)
> >>> +	REG_S x18, PT_S2(sp)
> >>> +	REG_S x19, PT_S3(sp)
> >>> +	REG_S x20, PT_S4(sp)
> >>> +	REG_S x21, PT_S5(sp)
> >>> +	REG_S x22, PT_S6(sp)
> >>> +	REG_S x23, PT_S7(sp)
> >>> +	REG_S x24, PT_S8(sp)
> >>> +	REG_S x25, PT_S9(sp)
> >>> +	REG_S x26, PT_S10(sp)
> >>> +	REG_S x27, PT_S11(sp)
> >>> +	REG_S x28, PT_T3(sp)
> >>> +	REG_S x29, PT_T4(sp)
> >>> +	REG_S x30, PT_T5(sp)
> >>> +	REG_S x31, PT_T6(sp)
> >>> +	.endm
> >>> +
> >>> +	.macro restore_all_base_regs
> >>> +	REG_L x3,  PT_GP(sp)
> >>> +	REG_L x4,  PT_TP(sp)
> >>> +	REG_L x5,  PT_T0(sp)
> >>> +	REG_L x6,  PT_T1(sp)
> >>> +	REG_L x7,  PT_T2(sp)
> >>> +	REG_L x8,  PT_S0(sp)
> >>> +	REG_L x9,  PT_S1(sp)
> >>> +	REG_L x10, PT_A0(sp)
> >>> +	REG_L x11, PT_A1(sp)
> >>> +	REG_L x12, PT_A2(sp)
> >>> +	REG_L x13, PT_A3(sp)
> >>> +	REG_L x14, PT_A4(sp)
> >>> +	REG_L x15, PT_A5(sp)
> >>> +	REG_L x16, PT_A6(sp)
> >>> +	REG_L x17, PT_A7(sp)
> >>> +	REG_L x18, PT_S2(sp)
> >>> +	REG_L x19, PT_S3(sp)
> >>> +	REG_L x20, PT_S4(sp)
> >>> +	REG_L x21, PT_S5(sp)
> >>> +	REG_L x22, PT_S6(sp)
> >>> +	REG_L x23, PT_S7(sp)
> >>> +	REG_L x24, PT_S8(sp)
> >>> +	REG_L x25, PT_S9(sp)
> >>> +	REG_L x26, PT_S10(sp)
> >>> +	REG_L x27, PT_S11(sp)
> >>> +	REG_L x28, PT_T3(sp)
> >>> +	REG_L x29, PT_T4(sp)
> >>> +	REG_L x30, PT_T5(sp)
> >>> +	REG_L x31, PT_T6(sp)
> >>> +	.endm
> > 
> > 
> > It seems thses macros can be (partially?) shared with entry.S
> 
> Yes, I wanted to avoid somebody changing the shared code and breaking
> random things. But that's what reviews are for. I'll think of something
> for v2.

Ah, OK. So for the first version, we introduce this separated code until
someone complains it.


Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>
