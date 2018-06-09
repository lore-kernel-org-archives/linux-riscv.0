From: luc.vanoostenryck@gmail.com (Luc Van Oostenryck)
Date: Sat, 9 Jun 2018 23:42:12 +0200
Subject: [PATCH 3/3] riscv: fix __user annotation for __copy_user()
In-Reply-To: <mhng-34378b5f-fa64-4886-b454-a2cb319d6abb@palmer-si-x1c4>
References: <20180609001310.jxzcqtdacu4uiz6b@ltop.local>
 <mhng-34378b5f-fa64-4886-b454-a2cb319d6abb@palmer-si-x1c4>
Message-ID: <20180609214211.u42vfrddl75ow7bb@ltop.local>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sat, Jun 09, 2018 at 01:00:08PM -0700, Palmer Dabbelt wrote:
> On Fri, 08 Jun 2018 17:13:12 PDT (-0700), luc.vanoostenryck at gmail.com wrote:
> > I tried it and ... the preprocessed asm is as expected:
> > 	.globl __asm_copy_to_user ; .balign 4 ; __asm_copy_to_user:
> > 	.globl __asm_copy_from_user ; .balign 4 ; __asm_copy_from_user:
> > 
> > 
> > 	 li t6, 0x00040000
> > 	 csrs sstatus, t6
> > 	 ...
> > 
> > But the nm -S returns different sizes for them:
> > 	0000000000000004 000000000000006c T __asm_copy_from_user
> > 	0000000000000002 000000000000006e T __asm_copy_to_user
> > 
> > and the object code is:
> > 	0000000000000000 <__asm_copy_to_user-0x2>:
> > 	   0:   0001                    nop
> > 
> > 	0000000000000002 <__asm_copy_to_user>:
> > 	   2:   0001                    nop
> > 
> > 	0000000000000004 <__asm_copy_from_user>:
> > 	   4:   00040fb7                lui     t6,0x40
> > 	   8:   100fa073                csrs    sstatus,t6
> > 	   ...
> > 
> > Why these unnneded nops?
> > Is this a known problem of my toolchain (I use a plain gcc 7.3 +
> > binutils 2.29, both configured as riscv64-none-elf)?
> > 
> > If I remove the two ENTRY() and use instead:
> > 	.globl __asm_copy_to_user ; __asm_copy_to_user:
> > 	.globl __asm_copy_from_user ; __asm_copy_from_user:
> > (IOW, I drop the .balign) then I get the expected result.
> > But well, this seems unrelated to the double ENTRY.
> > 
> > I can't test it more for now because I've some link errors (which,
> > I understand are probably solved in the riscv tree of binutils).
> > 
> > I'll send you the patch anyway since, as far as I understand the changes
> > specific to this copy_to/from_user is OK.
> 
> I think it's probably a bug in binutils-2.29 that should be fixed by
> 2.30 -- IIRC we had some bugs that looked like this and they got
> fixed, though it might be just in master (so 2.31).

I've tried binutils-2.30 and riscv-binutils-gdb, both still have
the problem and master binutils-gdb doesn't compile for me.
OTOH, everything is fine if I disabled CONFIG_RISCV_ISA_C.

> Either way it looks innocuous WRT the patch.

Indeed.
With this, the RISC-V arch should be sparse clean.
I'll recheck after -rc1.

Cheers,
-- Luc
