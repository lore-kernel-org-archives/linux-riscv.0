Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526B8CD6E59
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 10:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=71iuxwCdMVlCiH8VQU4oPXOdTKuAAi9iddc+mtuTQvk=; b=Vn13kfi+NOu33n
	R6NEni/0G+MCU0b8uFt3D3HyJiClDDbf/N7lVLYuESjvCs0YtokqOCSq+JtQp5h1S4E7rX3qTJiUy
	xxr+3UIZiqvTbmd56S0EmeER3NbtEyH4GrL7XbkOi97ahC16nZ0XhzczJKscQxzULywl8h3HyhK0Z
	4/i/i6QGGU8ib0s1G4jH+QM1SWMV6ug0H1lgsD4HszhECPCGPupKxJkq0kngwzpfdjktj6Bd3UMd/
	W0Wwt6Aof/SuhnLNMde9iedjse24FS+M9wftXy+gzt1pZYCoYfKZk6JUq4jhFXTcq7DU/4niYU4tf
	OopRGBSP/CCNKOthkKKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqWRX-00FT9z-2M;
	Wed, 11 Oct 2023 10:27:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqWRT-00FT86-1z;
	Wed, 11 Oct 2023 10:27:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B6D6106F;
	Wed, 11 Oct 2023 03:28:28 -0700 (PDT)
Received: from [192.168.1.13] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 296953F762;
	Wed, 11 Oct 2023 03:27:41 -0700 (PDT)
Message-ID: <142277eb-766e-4524-b507-c75bbc143ade@arm.com>
Date: Wed, 11 Oct 2023 12:27:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] topology: add a new arch_scale_freq_reference
Content-Language: en-US
To: Vincent Guittot <vincent.guittot@linaro.org>, linux@armlinux.org.uk,
 catalin.marinas@arm.com, will@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, sudeep.holla@arm.com,
 gregkh@linuxfoundation.org, rafael@kernel.org, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 bristot@redhat.com, vschneid@redhat.com, viresh.kumar@linaro.org,
 lukasz.luba@arm.com, ionela.voinescu@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org
Cc: conor.dooley@microchip.com, suagrfillet@gmail.com,
 ajones@ventanamicro.com, lftan@kernel.org
References: <20231009103621.374412-1-vincent.guittot@linaro.org>
 <20231009103621.374412-3-vincent.guittot@linaro.org>
From: Pierre Gondois <pierre.gondois@arm.com>
In-Reply-To: <20231009103621.374412-3-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_032751_772252_36EB2E05 
X-CRM114-Status: GOOD (  32.20  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello Vincent,

On 10/9/23 12:36, Vincent Guittot wrote:
> Create a new method to get a unique and fixed max frequency. Currently
> cpuinfo.max_freq or the highest (or last) state of performance domain are
> used as the max frequency when computing the frequency for a level of
> utilization but:
> - cpuinfo_max_freq can change at runtime. boost is one example of
>    such change.
> - cpuinfo.max_freq and last item of the PD can be different leading to
>    different results between cpufreq and energy model.
> 
> We need to save the reference frequency that has been used when computing
> the CPUs capacity and use this fixed and coherent value to convert between
> frequency and CPU's capacity.
> 
> In fact, we already save the frequency that has been used when computing
> the capacity of each CPU. We extend the precision to save khZ instead of
> Mhz currently and we modify the type to be aligned with other variables
> used when converting frequency to capacity and the other way.
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>   arch/arm/include/asm/topology.h   |  1 +
>   arch/arm64/include/asm/topology.h |  1 +
>   arch/riscv/include/asm/topology.h |  1 +
>   drivers/base/arch_topology.c      | 29 ++++++++++++++---------------
>   include/linux/arch_topology.h     |  7 +++++++
>   5 files changed, 24 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm/include/asm/topology.h b/arch/arm/include/asm/topology.h
> index c7d2510e5a78..853c4f81ba4a 100644
> --- a/arch/arm/include/asm/topology.h
> +++ b/arch/arm/include/asm/topology.h
> @@ -13,6 +13,7 @@
>   #define arch_set_freq_scale topology_set_freq_scale
>   #define arch_scale_freq_capacity topology_get_freq_scale
>   #define arch_scale_freq_invariant topology_scale_freq_invariant
> +#define arch_scale_freq_ref topology_get_freq_ref
>   #endif
>   
>   /* Replace task scheduler's default cpu-invariant accounting */
> diff --git a/arch/arm64/include/asm/topology.h b/arch/arm64/include/asm/topology.h
> index 9fab663dd2de..a323b109b9c4 100644
> --- a/arch/arm64/include/asm/topology.h
> +++ b/arch/arm64/include/asm/topology.h
> @@ -23,6 +23,7 @@ void update_freq_counters_refs(void);
>   #define arch_set_freq_scale topology_set_freq_scale
>   #define arch_scale_freq_capacity topology_get_freq_scale
>   #define arch_scale_freq_invariant topology_scale_freq_invariant
> +#define arch_scale_freq_ref topology_get_freq_ref
>   
>   #ifdef CONFIG_ACPI_CPPC_LIB
>   #define arch_init_invariance_cppc topology_init_cpu_capacity_cppc
> diff --git a/arch/riscv/include/asm/topology.h b/arch/riscv/include/asm/topology.h
> index e316ab3b77f3..61183688bdd5 100644
> --- a/arch/riscv/include/asm/topology.h
> +++ b/arch/riscv/include/asm/topology.h
> @@ -9,6 +9,7 @@
>   #define arch_set_freq_scale		topology_set_freq_scale
>   #define arch_scale_freq_capacity	topology_get_freq_scale
>   #define arch_scale_freq_invariant	topology_scale_freq_invariant
> +#define arch_scale_freq_ref		topology_get_freq_ref
>   
>   /* Replace task scheduler's default cpu-invariant accounting */
>   #define arch_scale_cpu_capacity	topology_get_cpu_scale
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index b741b5ba82bd..9a073c2d2086 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -19,6 +19,7 @@
>   #include <linux/init.h>
>   #include <linux/rcupdate.h>
>   #include <linux/sched.h>
> +#include <linux/units.h>
>   
>   #define CREATE_TRACE_POINTS
>   #include <trace/events/thermal_pressure.h>
> @@ -26,7 +27,8 @@
>   static DEFINE_PER_CPU(struct scale_freq_data __rcu *, sft_data);
>   static struct cpumask scale_freq_counters_mask;
>   static bool scale_freq_invariant;
> -static DEFINE_PER_CPU(u32, freq_factor) = 1;
> +DEFINE_PER_CPU(unsigned long, capacity_ref_freq) = 1;
> +EXPORT_PER_CPU_SYMBOL_GPL(capacity_ref_freq);
>   
>   static bool supports_scale_freq_counters(const struct cpumask *cpus)
>   {
> @@ -170,9 +172,9 @@ DEFINE_PER_CPU(unsigned long, thermal_pressure);
>    * operating on stale data when hot-plug is used for some CPUs. The
>    * @capped_freq reflects the currently allowed max CPUs frequency due to
>    * thermal capping. It might be also a boost frequency value, which is bigger
> - * than the internal 'freq_factor' max frequency. In such case the pressure
> - * value should simply be removed, since this is an indication that there is
> - * no thermal throttling. The @capped_freq must be provided in kHz.
> + * than the internal 'capacity_ref_freq' max frequency. In such case the
> + * pressure value should simply be removed, since this is an indication that
> + * there is no thermal throttling. The @capped_freq must be provided in kHz.
>    */
>   void topology_update_thermal_pressure(const struct cpumask *cpus,
>   				      unsigned long capped_freq)
> @@ -183,10 +185,7 @@ void topology_update_thermal_pressure(const struct cpumask *cpus,
>   
>   	cpu = cpumask_first(cpus);
>   	max_capacity = arch_scale_cpu_capacity(cpu);
> -	max_freq = per_cpu(freq_factor, cpu);
> -
> -	/* Convert to MHz scale which is used in 'freq_factor' */
> -	capped_freq /= 1000;
> +	max_freq = arch_scale_freq_ref(cpu);
>   
>   	/*
>   	 * Handle properly the boost frequencies, which should simply clean
> @@ -279,13 +278,13 @@ void topology_normalize_cpu_scale(void)
>   
>   	capacity_scale = 1;
>   	for_each_possible_cpu(cpu) {
> -		capacity = raw_capacity[cpu] * per_cpu(freq_factor, cpu);
> +		capacity = raw_capacity[cpu] * per_cpu(capacity_ref_freq, cpu);
>   		capacity_scale = max(capacity, capacity_scale);
>   	}
>   
>   	pr_debug("cpu_capacity: capacity_scale=%llu\n", capacity_scale);
>   	for_each_possible_cpu(cpu) {
> -		capacity = raw_capacity[cpu] * per_cpu(freq_factor, cpu);
> +		capacity = raw_capacity[cpu] * per_cpu(capacity_ref_freq, cpu);
>   		capacity = div64_u64(capacity << SCHED_CAPACITY_SHIFT,
>   			capacity_scale);
>   		topology_set_cpu_scale(cpu, capacity);
> @@ -321,15 +320,15 @@ bool __init topology_parse_cpu_capacity(struct device_node *cpu_node, int cpu)
>   			cpu_node, raw_capacity[cpu]);
>   
>   		/*
> -		 * Update freq_factor for calculating early boot cpu capacities.
> +		 * Update capacity_ref_freq for calculating early boot cpu capacities.
>   		 * For non-clk CPU DVFS mechanism, there's no way to get the
>   		 * frequency value now, assuming they are running at the same
> -		 * frequency (by keeping the initial freq_factor value).
> +		 * frequency (by keeping the initial capacity_ref_freq value).
>   		 */
>   		cpu_clk = of_clk_get(cpu_node, 0);
>   		if (!PTR_ERR_OR_ZERO(cpu_clk)) {
> -			per_cpu(freq_factor, cpu) =
> -				clk_get_rate(cpu_clk) / 1000;
> +			per_cpu(capacity_ref_freq, cpu) =
> +				clk_get_rate(cpu_clk) / HZ_PER_KHZ;
>   			clk_put(cpu_clk);
>   		}
>   	} else {
> @@ -411,7 +410,7 @@ init_cpu_capacity_callback(struct notifier_block *nb,
>   	cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cpus);
>   
>   	for_each_cpu(cpu, policy->related_cpus)
> -		per_cpu(freq_factor, cpu) = policy->cpuinfo.max_freq / 1000;
> +		per_cpu(capacity_ref_freq, cpu) = policy->cpuinfo.max_freq;

It seems init_cpu_capacity_callback() is only called when a policy is created
(cf. CPUFREQ_CREATE_POLICY). This means that CPU capacities are only updated
in this specific case, eluding the cases where:
- boost is enabled. 'policy->cpuinfo.max_freq' is updated in the cpufreq driver,
   but it seems it doesn't have any consequence regarding CPU capacities.
- a cpufreq driver is unplugged (e.g. rmmod cpufreq_driver.ko). In this case
   the CPU capacities are only updated when plugging in the driver (e.g. insmod
   cpufreq_driver.ko).

Regards,
Pierre


>   
>   	if (cpumask_empty(cpus_to_visit)) {
>   		topology_normalize_cpu_scale();
> diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
> index a07b510e7dc5..38ca6c76af56 100644
> --- a/include/linux/arch_topology.h
> +++ b/include/linux/arch_topology.h
> @@ -27,6 +27,13 @@ static inline unsigned long topology_get_cpu_scale(int cpu)
>   
>   void topology_set_cpu_scale(unsigned int cpu, unsigned long capacity);
>   
> +DECLARE_PER_CPU(unsigned long, capacity_ref_freq);
> +
> +static inline unsigned long topology_get_freq_ref(int cpu)
> +{
> +	return per_cpu(capacity_ref_freq, cpu);
> +}
> +
>   DECLARE_PER_CPU(unsigned long, arch_freq_scale);
>   
>   static inline unsigned long topology_get_freq_scale(int cpu)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
