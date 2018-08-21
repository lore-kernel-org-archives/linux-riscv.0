From: hch@infradead.org (Christoph Hellwig)
Date: Tue, 21 Aug 2018 00:54:52 -0700
Subject: [RFC PATCH 5/5] RISC-V: Support cpu hotplug.
In-Reply-To: <1534377377-70108-6-git-send-email-atish.patra@wdc.com>
References: <1534377377-70108-1-git-send-email-atish.patra@wdc.com>
 <1534377377-70108-6-git-send-email-atish.patra@wdc.com>
Message-ID: <20180821075452.GC28079@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

>  	if (!err) {
> +
> +#ifdef CONFIG_HOTPLUG_CPU
> +		arch_send_call_function_single_ipi(cpu);
> +#endif

Please just provide a stub version of arch_send_call_function_single_ipi
for the !CONFIG_HOTPLUG_CPU case instead of the ifdef here.

> +#ifdef CONFIG_HOTPLUG_CPU
> +int can_hotplug_cpu(void)

This should be a bool.

> +{
> +	if (cpu_ops.cpu_die)
> +		return 1;
> +	else
> +		return 0;
> +}

	return cpu_ops.cpu_die != NULL;

> +void default_cpu_die(unsigned int cpu)
> +{
> +	int sipval, sieval, scauseval;
> +
> +	/* clear all pending flags */
> +	csr_write(sip, 0);
> +	/* clear any previous scause data */
> +	csr_write(scause, 0);
> +
> +	do {
> +		wait_for_interrupt();
> +		sipval = csr_read(sip);
> +		sieval = csr_read(sie);
> +		scauseval = csr_read(scause);
> +	/* only break if wfi returns for an enabled interrupt */
> +	} while ((sipval & sieval) == 0 &&
> +		 scauseval != INTERRUPT_CAUSE_SOFTWARE);
> +
> +	boot_sec_cpu();
> +}

I suspect all of this except for the boot_sec_cpu() should go into
a helper in irq.c.  Also as-is this probably doesn't work as scauseval
will have INTERRUPT_CAUSE_FLAG set, making the comparism never true.
