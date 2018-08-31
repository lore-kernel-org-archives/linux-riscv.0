From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 30 Aug 2018 23:03:52 -0700
Subject: [PATCH v2 1/3] RISC-V: Add logical CPU indexing for RISC-V
In-Reply-To: <1535445370-19004-2-git-send-email-atish.patra@wdc.com>
References: <1535445370-19004-1-git-send-email-atish.patra@wdc.com>
 <1535445370-19004-2-git-send-email-atish.patra@wdc.com>
Message-ID: <20180831060352.GA19292@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Aug 28, 2018 at 01:36:08AM -0700, Atish Patra wrote:
> Currently, both linux cpu id and hardware cpu id are same.
> This is not recommended as it will lead to discontinuous cpu
> indexing in Linux. Moreover, kdump kernel will run from CPU0
> which would be absent if we follow existing scheme.
> 
> Implement a logical mapping between Linux cpu id and hardware
> cpuid to decouple these two. Always mark the boot processor as
> cpu0 and all other cpus get the logical cpu id based on their
> booting order.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/include/asm/smp.h | 18 +++++++++++++++++-
>  arch/riscv/kernel/setup.c    |  2 ++
>  arch/riscv/kernel/smp.c      | 19 +++++++++++++++++++
>  3 files changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
> index 36016845..a5c257b3 100644
> --- a/arch/riscv/include/asm/smp.h
> +++ b/arch/riscv/include/asm/smp.h
> @@ -22,6 +22,13 @@
>  #include <linux/cpumask.h>
>  #include <linux/irqreturn.h>
>  
> +#define INVALID_HARTID -1
> +/*
> + * Mapping between linux logical cpu index and hartid.
> + */
> +extern unsigned long __cpu_logical_map[NR_CPUS];
> +#define cpu_logical_map(cpu)    __cpu_logical_map[cpu]

How about naming this cpuid_to_hardid_map to make things a little
more obvious?  Also shouldn't this be signed given your INVALID_HARTID
definition above.

> +static inline int riscv_hartid_to_cpuid(int hartid) { return 0 ; }
> +static inline void riscv_cpuid_to_hartid_mask(const struct cpumask *in,
> +				       struct cpumask *out) {
> +	cpumask_set_cpu(cpu_logical_map(0), out);
> +}

Please use normal coding style even for stubs:

static inline int riscv_hartid_to_cpuid(int hartid)
{
	return 0;
}

static inline void riscv_cpuid_to_hartid_mask(const struct cpumask *in,
			struct cpumask *out)
{
	cpumask_set_cpu(cpu_logical_map(0), out);
}

> +unsigned long __cpu_logical_map[NR_CPUS] = { [0 ... NR_CPUS-1] = INVALID_HARTID };

Please break the line into the usual format:

unsigned long __cpu_logical_map[NR_CPUS] = {
	[0 ... NR_CPUS-1]	= INVALID_HARTID,
};
