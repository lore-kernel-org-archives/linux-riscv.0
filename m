From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 10 Sep 2018 06:46:59 -0700
Subject: [PATCH] RISC-V: Show IPI stats
In-Reply-To: <20180907124429.31407-1-anup@brainfault.org>
References: <20180907124429.31407-1-anup@brainfault.org>
Message-ID: <20180910134659.GA30774@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, Sep 07, 2018 at 06:14:29PM +0530, Anup Patel wrote:
> This patch provides arch_show_interrupts() implementation to
> show IPI stats via /proc/interrupts.
> 
> Now the contents of /proc/interrupts" will look like below:
>            CPU0       CPU1       CPU2       CPU3
>   8:         17          7          6         14  SiFive PLIC   8  virtio0
>  10:         10         10          9         11  SiFive PLIC  10  ttyS0
> IPI0:       170        673        251         79  Rescheduling interrupts
> IPI1:         1         12         27          1  Function call interrupts
> IPI2:         0          0          0          0  CPU wake-up interrupts
> 
> Signed-off-by: Anup Patel <anup@brainfault.org>

Thanks, this looks pretty sensible to me.  Maybe we want to also show
timer interrupts if we do this?

> --- a/arch/riscv/kernel/irq.c
> +++ b/arch/riscv/kernel/irq.c
> @@ -8,6 +8,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/irqchip.h>
>  #include <linux/irqdomain.h>
> +#include <linux/seq_file.h>
>  
>  /*
>   * Possible interrupt causes:
> @@ -24,6 +25,14 @@
>   */
>  #define INTERRUPT_CAUSE_FLAG	(1UL << (__riscv_xlen - 1))
>  
> +int arch_show_interrupts(struct seq_file *p, int prec)
> +{
> +#ifdef CONFIG_SMP
> +	show_ipi_stats(p, prec);
> +#endif
> +	return 0;
> +}

If we don't also add timer stats I'd just move arch_show_interrupts
to smp.c and make it conditional.  If we don't this split might make
more sense.

> +static const char *ipi_names[IPI_MAX] = {
> +	[IPI_RESCHEDULE] = "Rescheduling interrupts",
> +	[IPI_CALL_FUNC] = "Function call interrupts",
> +	[IPI_CALL_WAKEUP] = "CPU wake-up interrupts",
> +};

No need for the explicit array size.  Also please use a few tabs to
align this nicely:

static const char *ipi_names[] = {
	[IPI_RESCHEDULE]	= "Rescheduling interrupts",
	[IPI_CALL_FUNC]		= "Function call interrupts",
	[IPI_CALL_WAKEUP]	= "CPU wake-up interrupts",
};
