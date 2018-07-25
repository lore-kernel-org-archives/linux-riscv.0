From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 25 Jul 2018 14:44:35 -0700 (PDT)
Subject: [PATCH 2/6] RISC-V: remove INTERRUPT_CAUSE_* defines from
 asm/irq.h
In-Reply-To: <20180725093649.32332-3-hch@lst.de>
Message-ID: <mhng-a0410fc4-7f2e-4818-acf0-6a7616ba0010@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, 25 Jul 2018 02:36:45 PDT (-0700), Christoph Hellwig wrote:
> These are only of use to the local irq controller driver, so add them in
> that driver implementation instead, which will be submitted soon.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/include/asm/irq.h | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
> index 4dee9d4c13c0..93eb75eac4ff 100644
> --- a/arch/riscv/include/asm/irq.h
> +++ b/arch/riscv/include/asm/irq.h
> @@ -17,10 +17,6 @@
>
>  #define NR_IRQS         0
>
> -#define INTERRUPT_CAUSE_SOFTWARE    1
> -#define INTERRUPT_CAUSE_TIMER       5
> -#define INTERRUPT_CAUSE_EXTERNAL    9
> -
>  void riscv_timer_interrupt(void);
>
>  #include <asm-generic/irq.h>

Acked-by: Palmer Dabbelt <palmer@sifive.com>
