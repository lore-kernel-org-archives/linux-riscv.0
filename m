From: palmer@sifive.com (Palmer Dabbelt)
Date: Sat, 09 Jun 2018 13:00:08 -0700 (PDT)
Subject: [PATCH 3/3] riscv: fix __user annotation for __copy_user()
In-Reply-To: <20180609001310.jxzcqtdacu4uiz6b@ltop.local>
Message-ID: <mhng-34378b5f-fa64-4886-b454-a2cb319d6abb@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, 08 Jun 2018 17:13:12 PDT (-0700), luc.vanoostenryck at gmail.com wrote:
> On Fri, Jun 08, 2018 at 03:33:36PM -0700, Palmer Dabbelt wrote:
>> On Thu, 07 Jun 2018 09:51:33 PDT (-0700), luc.vanoostenryck at gmail.com wrote:
>> > On Thu, Jun 07, 2018 at 09:30:19AM -0700, Palmer Dabbelt wrote:
>> > > diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
>> > > index 58fb2877c865..bd51e47ebd44 100644
>> > > --- a/arch/riscv/lib/uaccess.S
>> > > +++ b/arch/riscv/lib/uaccess.S
>> > > @@ -13,7 +13,15 @@ _epc:
>> > > 	.previous
>> > > 	.endm
>> > >
>> > > -ENTRY(__copy_user)
>> > > +/* __asm_copy_to_user and __asm_copy_from_user are actually the same function,
>> > > + * they're just provided as two different symbols to C code so sparse doesn't
>> > > + * yell about casting between two different address spaces. */
>> > > +.global __asm_copy_to_user
>> > > +.set __asm_copy_to_user,__asm_copy_tofrom_user
>> > > +.global __asm_copy_from_user
>> > > +.set __asm_copy_from_user,__asm_copy_tofrom_user
>> > > +
>> > > +ENTRY(__asm_copy_tofrom_user)
>> >
>> > I don't think that the size (as reported by objdump, for example) will
>> > be correct or even present for __asm_copy_to_user & __asm_copy_to_user.
>> >
>> > What can be done is:
>> > 	ENTRY(__asm_copy_to_user)
>> > 	ENTRY(__asm_copy_from_user)
>> >
>> > 	<function definition>
>> >
>> > 	ENDPROC(__asm_copy_to_user)
>> > 	ENDPROC(__asm_copy_from_user)
>> >
>> Thanks.  Do you mind checking to make sure this works and submitting a patch?
>
> Not at all.
> I should have done it already when I sent the previous email.
>
> I tried it and ... the preprocessed asm is as expected:
> 	.globl __asm_copy_to_user ; .balign 4 ; __asm_copy_to_user:
> 	.globl __asm_copy_from_user ; .balign 4 ; __asm_copy_from_user:
>
>
> 	 li t6, 0x00040000
> 	 csrs sstatus, t6
> 	 ...
>
> But the nm -S returns different sizes for them:
> 	0000000000000004 000000000000006c T __asm_copy_from_user
> 	0000000000000002 000000000000006e T __asm_copy_to_user
>
> and the object code is:
> 	0000000000000000 <__asm_copy_to_user-0x2>:
> 	   0:   0001                    nop
>
> 	0000000000000002 <__asm_copy_to_user>:
> 	   2:   0001                    nop
>
> 	0000000000000004 <__asm_copy_from_user>:
> 	   4:   00040fb7                lui     t6,0x40
> 	   8:   100fa073                csrs    sstatus,t6
> 	   ...
>
> Why these unnneded nops?
> Is this a known problem of my toolchain (I use a plain gcc 7.3 +
> binutils 2.29, both configured as riscv64-none-elf)?
>
> If I remove the two ENTRY() and use instead:
> 	.globl __asm_copy_to_user ; __asm_copy_to_user:
> 	.globl __asm_copy_from_user ; __asm_copy_from_user:
> (IOW, I drop the .balign) then I get the expected result.
> But well, this seems unrelated to the double ENTRY.
>
> I can't test it more for now because I've some link errors (which,
> I understand are probably solved in the riscv tree of binutils).
>
> I'll send you the patch anyway since, as far as I understand the changes
> specific to this copy_to/from_user is OK.

I think it's probably a bug in binutils-2.29 that should be fixed by 2.30 -- 
IIRC we had some bugs that looked like this and they got fixed, though it might 
be just in master (so 2.31).

Either way it looks innocuous WRT the patch.

Thanks!
