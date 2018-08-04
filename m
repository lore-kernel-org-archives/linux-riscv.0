From: palmer@sifive.com (Palmer Dabbelt)
Date: Fri, 03 Aug 2018 21:38:19 -0700 (PDT)
Subject: [PATCH] RISC-V: Add the directive for alignment of stvec's value
In-Reply-To: <CA+ZOyag=bAB6p_mah+g2DzffsABV3uig0qxMvTWZjunYAtrfkg@mail.gmail.com>
Message-ID: <mhng-9a679556-1e7c-4948-b8e0-dc8f38d3ad05@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, 01 Aug 2018 18:26:48 PDT (-0700), zongbox at gmail.com wrote:
> Palmer Dabbelt <palmer@sifive.com> ? 2018?8?2? ?? ??8:38???
>>
>> On Wed, 20 Jun 2018 18:40:07 PDT (-0700), zong at andestech.com wrote:
>> > The stvec's value must be 4 byte alignment by specification definition.
>> > This directive avoids to stvec be set the non-alignment value by the
>> > following code in head.S
>> >
>> >  /* Point stvec to virtual address of intruction after satp write */
>> > la a0, 1f
>> > add a0, a0, a1
>> > csrw stvec, a0
>> >
>> > Signed-off-by: Zong Li <zong@andestech.com>
>> > ---
>> >  arch/riscv/kernel/head.S | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
>> > index 396ec7b349ce..ae7b204f531c 100644
>> > --- a/arch/riscv/kernel/head.S
>> > +++ b/arch/riscv/kernel/head.S
>> > @@ -94,6 +94,7 @@ relocate:
>> >       or a0, a0, a1
>> >       sfence.vma
>> >       csrw sptbr, a0
>> > +.align 2
>> >  1:
>> >       /* Set trap vector to spin forever to help debug */
>> >       la a0, .Lsecondary_park
>>
>> I don't think this is actually correct: you shouldn't be aligning the address
>> at which stvec is set, but the address that stvec is set to.  If this is fixing
>> anything then it's probably just by coincidence as it's causing
>> .Lsecondary_park to be aligned.
>>
>> I think this patch is the correct fix
>>
>>     diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
>>     index 6e07ed37bbff..d1beecf1d060 100644
>>     --- a/arch/riscv/kernel/head.S
>>     +++ b/arch/riscv/kernel/head.S
>>     @@ -143,6 +143,7 @@ relocate:
>>         tail smp_callin
>>      #endif
>>
>>     +.align 2
>>      .Lsecondary_park:
>>         /* We lack SMP support or have too many harts, so park this hart */
>>         wfi
>>
>> Thanks for pointing this out!
>>
> The position which I set in this patch is also be set to stvec for jumping to
> correct VA at satp enabling. The label .Lsecondary_park is also be set to stvec,
> I don't notice it because as you said, this label address is correct
> just by coincidence.
> I think there are two places need to be aligned.
>
> The first setting as following:
> relocate:
>         ...
>         /* Point stvec to virtual address of intruction after satp write */
>         la a0, 1f
>         add a0, a0, a1
>         csrw stvec, a0    <-----------  first set
>         ...
>         sfence.vma
>         csrw sptbr, a0
> 1:
>         /* Set trap vector to spin forever to help debug */
>         la a0, .Lsecondary_park
>         csrw stvec, a0

I agree.  I think this should do it:

    commit a8c5f596bcd528c5468d621bc84cd901632a912a
    gpg: Signature made Fri 03 Aug 2018 09:13:56 PM PDT
    gpg:                using RSA key 00CE76D1834960DFCE886DF8EF4CA1502CCBAB41
    gpg:                issuer "palmer at dabbelt.com"
    gpg: Good signature from "Palmer Dabbelt <palmer@dabbelt.com>" [ultimate]
    gpg:                 aka "Palmer Dabbelt <palmer@sifive.com>" [ultimate]
    Author: Palmer Dabbelt <palmer@sifive.com>
    Date:   Wed Aug 1 17:38:30 2018 -0700
    
        RISC-V: Align early stvec targets
        
        The ISA mandantes that stvec is 4-byte aligned, but we weren't actually
        respecting in the early boot code.  These trap vector are never expected
        to actually be used unless there's a bug in early in the boot process of
        the kernel, which explains why the bug wasn't noticed until recently.
        
        Thanks to Zong for finding the bug!
        
        CC: zong at andestech.com
        Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
    
    diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
    index 6e07ed37bbff..c4d2c63f9a29 100644
    --- a/arch/riscv/kernel/head.S
    +++ b/arch/riscv/kernel/head.S
    @@ -94,6 +94,7 @@ relocate:
     	or a0, a0, a1
     	sfence.vma
     	csrw sptbr, a0
    +.align 2
     1:
     	/* Set trap vector to spin forever to help debug */
     	la a0, .Lsecondary_park
    @@ -143,6 +144,7 @@ relocate:
     	tail smp_callin
     #endif
     
    +.align 2
     .Lsecondary_park:
     	/* We lack SMP support or have too many harts, so park this hart */
     	wfi
