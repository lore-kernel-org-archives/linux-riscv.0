From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 19 Apr 2018 15:59:27 -0700 (PDT)
Subject: [PATCH] riscv: there is no <asm/handle_irq.h>
In-Reply-To: <20180416065752.5176-1-hch@lst.de>
Message-ID: <mhng-2838fe82-881e-4c76-b360-5c35baa9a8a8@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sun, 15 Apr 2018 23:57:52 PDT (-0700), Christoph Hellwig wrote:
> So don't list it as generic-y.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/include/asm/Kbuild | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
> index 1e5fd280fb4d..4286a5f83876 100644
> --- a/arch/riscv/include/asm/Kbuild
> +++ b/arch/riscv/include/asm/Kbuild
> @@ -15,7 +15,6 @@ generic-y += fcntl.h
>  generic-y += futex.h
>  generic-y += hardirq.h
>  generic-y += hash.h
> -generic-y += handle_irq.h
>  generic-y += hw_irq.h
>  generic-y += ioctl.h
>  generic-y += ioctls.h

Thanks!
