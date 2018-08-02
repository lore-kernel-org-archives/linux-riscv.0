From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 01 Aug 2018 17:38:00 -0700 (PDT)
Subject: [PATCH] RISC-V: Add the directive for alignment of stvec's value
In-Reply-To: <1529545207-26999-1-git-send-email-zong@andestech.com>
Message-ID: <mhng-38cc8366-10dd-4ea1-993f-bd453640aa66@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, 20 Jun 2018 18:40:07 PDT (-0700), zong at andestech.com wrote:
> The stvec's value must be 4 byte alignment by specification definition.
> This directive avoids to stvec be set the non-alignment value by the
> following code in head.S
>
>  /* Point stvec to virtual address of intruction after satp write */
> la a0, 1f
> add a0, a0, a1
> csrw stvec, a0
>
> Signed-off-by: Zong Li <zong@andestech.com>
> ---
>  arch/riscv/kernel/head.S | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 396ec7b349ce..ae7b204f531c 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -94,6 +94,7 @@ relocate:
>  	or a0, a0, a1
>  	sfence.vma
>  	csrw sptbr, a0
> +.align 2
>  1:
>  	/* Set trap vector to spin forever to help debug */
>  	la a0, .Lsecondary_park

I don't think this is actually correct: you shouldn't be aligning the address 
at which stvec is set, but the address that stvec is set to.  If this is fixing 
anything then it's probably just by coincidence as it's causing 
.Lsecondary_park to be aligned.

I think this patch is the correct fix

    diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
    index 6e07ed37bbff..d1beecf1d060 100644
    --- a/arch/riscv/kernel/head.S
    +++ b/arch/riscv/kernel/head.S
    @@ -143,6 +143,7 @@ relocate:
     	tail smp_callin
     #endif

    +.align 2
     .Lsecondary_park:
     	/* We lack SMP support or have too many harts, so park this hart */
     	wfi

Thanks for pointing this out!
