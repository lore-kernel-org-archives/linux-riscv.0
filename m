From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 30 Aug 2018 23:11:04 -0700
Subject: [PATCH v2 2/3] RISC-V: Use Linux logical cpu number instead of
 hartid
In-Reply-To: <1535445370-19004-3-git-send-email-atish.patra@wdc.com>
References: <1535445370-19004-1-git-send-email-atish.patra@wdc.com>
 <1535445370-19004-3-git-send-email-atish.patra@wdc.com>
Message-ID: <20180831061104.GB19292@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

> -#define flush_tlb_all() sbi_remote_sfence_vma(NULL, 0, -1)
> +static inline void remote_sfence_vma(struct cpumask *cmask, unsigned long start,
> +				     unsigned long size)
> +{
> +	struct cpumask hmask;
> +
> +	riscv_cpuid_to_hartid_mask(cmask, &hmask);
> +	sbi_remote_sfence_vma(hmask.bits, start, size);
> +}
> +
> +#define flush_tlb_all() remote_sfence_vma(NULL, 0, -1)

flush_tlb_all passed NULL to sbi_remote_sfence_vma before, so this
changes what we pass.  I think we should keep the existing behavior.

> @@ -93,10 +94,11 @@ static inline void plic_toggle(int ctxid, int hwirq, int enable)
>  static inline void plic_irq_toggle(struct irq_data *d, int enable)
>  {
>  	int cpu;
> +	struct plic_handler *handler;
>  
>  	writel(enable, plic_regs + PRIORITY_BASE + d->hwirq * PRIORITY_PER_ID);
>  	for_each_cpu(cpu, irq_data_get_affinity_mask(d)) {
> -		struct plic_handler *handler = per_cpu_ptr(&plic_handlers, cpu);
> +		handler = per_cpu_ptr(&plic_handlers, cpu);

This looks like a spurious change.
