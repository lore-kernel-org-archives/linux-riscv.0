From: palmer@sifive.com (Palmer Dabbelt)
Date: Tue, 25 Sep 2018 10:19:24 -0700 (PDT)
Subject: [PATCH 1/2] riscv/bitops: Remove smp_mb__{before,
 after}_clear_bit()
In-Reply-To: <20180925121225.9917-2-andrea.parri@amarulasolutions.com>
Message-ID: <mhng-2c59d90d-9cf9-4462-bfb6-5c90ffa0c6d0@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 25 Sep 2018 05:12:24 PDT (-0700), andrea.parri at amarulasolutions.com wrote:
> The barriers are unused; remove their definition.
>
> Signed-off-by: Andrea Parri <andrea.parri@amarulasolutions.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: <linux-riscv@lists.infradead.org>
> ---
>  arch/riscv/include/asm/bitops.h | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
> index f30daf26f08f4..01db98dfd0435 100644
> --- a/arch/riscv/include/asm/bitops.h
> +++ b/arch/riscv/include/asm/bitops.h
> @@ -23,11 +23,6 @@
>  #include <asm/barrier.h>
>  #include <asm/bitsperlong.h>
>
> -#ifndef smp_mb__before_clear_bit
> -#define smp_mb__before_clear_bit()  smp_mb()
> -#define smp_mb__after_clear_bit()   smp_mb()
> -#endif /* smp_mb__before_clear_bit */
> -
>  #include <asm-generic/bitops/__ffs.h>
>  #include <asm-generic/bitops/ffz.h>
>  #include <asm-generic/bitops/fls.h>

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

Do you want me to take this via the RISC-V tree?  I only ended up with patch 
1/2 in my inbox, and I probably shouldn't take both.

Thanks!
