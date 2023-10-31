Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FDEC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 00:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QdvvfBaSlWwKpzhjKPk3U+ZzFg6vsunAe6Tiyh23m4s=; b=37msnSnvATNkrx
	wiHLCMfb5mB0VcIX/0UYNYtjPL1oOsANOeu1oEW3OFWB8hlPrcCfvsuhW7mATEi8vFqgHSL29QuCT
	xPBh/CZtA7jLYRPuNDf4GPlYpog4UdnEvOgClF+z6B493UvJJqcJeBtKwC4xe2LLWyo9jKZkf5HOn
	F5b1HiOGjj1qfDNBmHqDoXksKPoclDZfm4aJrNWfbHrbTHgZYGQpZLHPFfp7Av4uz089I28s+jCzv
	ZR5K5V3FVPPmpnwyR0lhZyjZdZo4Nqa+AUuWVrYAMAq4QDsc+v382Tw32tvepbBlWgWImPqwrIa20
	HD1th2rW0z4NYCPUl0nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxyeQ-006Lo8-0f;
	Wed, 01 Nov 2023 00:00:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxyeM-006Lmj-0P;
	Wed, 01 Nov 2023 00:00:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D0E81FB;
	Tue, 31 Oct 2023 17:00:32 -0700 (PDT)
Received: from e129154.nice.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 963DB3F738;
	Tue, 31 Oct 2023 16:59:42 -0700 (PDT)
Date: Wed, 1 Nov 2023 00:58:53 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	viresh.kumar@linaro.org, lenb@kernel.org, robert.moore@intel.com,
	lukasz.luba@arm.com, ionela.voinescu@arm.com,
	pierre.gondois@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linuxfoundation.org, conor.dooley@microchip.com,
	suagrfillet@gmail.com, ajones@ventanamicro.com, lftan@kernel.org
Subject: Re: [PATCH v4 7/7] arm64/amu: use capacity_ref_freq to set AMU ratio
Message-ID: <ZUGUvdjrpw9NHSex@e129154.nice.arm.com>
References: <20231027080400.56703-1-vincent.guittot@linaro.org>
 <20231027080400.56703-8-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231027080400.56703-8-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_165958_283542_D27E4594 
X-CRM114-Status: GOOD (  25.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Oct 27, 2023 at 10:04:00AM +0200, Vincent Guittot wrote:
> Use the new capacity_ref_freq to set the ratio that is used by AMU for
> computing the arch_scale_freq_capacity().
> This helps to keep everything aligned using the same reference for
> computing CPUs capacity.
> 
> The default value of the ratio (stored in per_cpu(arch_max_freq_scale)
> ensures that arch_scale_freq_capacity() returns max capacity until it is
> set to its correct value with the cpu capacity and capacity_ref_freq.
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>  arch/arm64/kernel/topology.c  | 26 ++++++++++++++------------
>  drivers/base/arch_topology.c  | 12 +++++++++++-
>  include/linux/arch_topology.h |  1 +
>  3 files changed, 26 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 817d788cd866..626031076b75 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -82,7 +82,12 @@ int __init parse_acpi_topology(void)
>  #undef pr_fmt
>  #define pr_fmt(fmt) "AMU: " fmt
>  
> -static DEFINE_PER_CPU_READ_MOSTLY(unsigned long, arch_max_freq_scale);
> +/*
> + * Ensure that amu_scale_freq_tick() will return SCHED_CAPACITY_SCALE until
> + * the CPU capacity and its assosciated frequency have been correctly
> + * initialized.
> + */
> +static DEFINE_PER_CPU_READ_MOSTLY(unsigned long, arch_max_freq_scale) =  1UL << (2 * SCHED_CAPACITY_SHIFT);
>  static DEFINE_PER_CPU(u64, arch_const_cycles_prev);
>  static DEFINE_PER_CPU(u64, arch_core_cycles_prev);
>  static cpumask_var_t amu_fie_cpus;
> @@ -112,14 +117,14 @@ static inline bool freq_counters_valid(int cpu)
>  	return true;
>  }
>  
> -static int freq_inv_set_max_ratio(int cpu, u64 max_rate, u64 ref_rate)
> +void freq_inv_set_max_ratio(int cpu, u64 max_rate)
>  {
> -	u64 ratio;
> +	u64 ratio, ref_rate = arch_timer_get_rate();
>  
>  	if (unlikely(!max_rate || !ref_rate)) {
> -		pr_debug("CPU%d: invalid maximum or reference frequency.\n",
> +		WARN_ONCE(1, "CPU%d: invalid maximum or reference frequency.\n",
>  			 cpu);
> -		return -EINVAL;
> +		return;
>  	}
>  
>  	/*
> @@ -139,12 +144,12 @@ static int freq_inv_set_max_ratio(int cpu, u64 max_rate, u64 ref_rate)
>  	ratio = div64_u64(ratio, max_rate);
>  	if (!ratio) {
>  		WARN_ONCE(1, "Reference frequency too low.\n");
> -		return -EINVAL;
> +		return;
>  	}
>  
> -	per_cpu(arch_max_freq_scale, cpu) = (unsigned long)ratio;
> +	WRITE_ONCE(per_cpu(arch_max_freq_scale, cpu), (unsigned long)ratio);
>  
> -	return 0;
> +	return;
>  }
>  
>  static void amu_scale_freq_tick(void)
> @@ -195,10 +200,7 @@ static void amu_fie_setup(const struct cpumask *cpus)
>  		return;
>  
>  	for_each_cpu(cpu, cpus) {
> -		if (!freq_counters_valid(cpu) ||
> -		    freq_inv_set_max_ratio(cpu,
> -					   cpufreq_get_hw_max_freq(cpu) * 1000ULL,
> -					   arch_timer_get_rate()))
> +		if (!freq_counters_valid(cpu))
>  			return;
>  	}
>  
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index d4bef370feb3..3cba7dc753b3 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -344,6 +344,10 @@ bool __init topology_parse_cpu_capacity(struct device_node *cpu_node, int cpu)
>  	return !ret;
>  }
>  
> +void __weak freq_inv_set_max_ratio(int cpu, u64 max_rate)
> +{
> +}
> +
>  #ifdef CONFIG_ACPI_CPPC_LIB
>  #include <acpi/cppc_acpi.h>
>  
> @@ -381,6 +385,9 @@ void topology_init_cpu_capacity_cppc(void)
>  	}
>  
>  	for_each_possible_cpu(cpu) {
> +		freq_inv_set_max_ratio(cpu,
> +				       per_cpu(capacity_ref_freq, cpu) * HZ_PER_KHZ);
> +
The capacity_ref_freq set earlier will still lead to units mismatch,
as at the point of calling topology_init_cpu_capacity_cppc the lowest & nominal
frequencies will be provided in MHz (unless I have missed smth).
This means that use of both, the capacity_ref_freq and the arch_freq_scale
will generate unexpected results, so I guess this should get amended in the
preceding patch (?) [1]

---
BR
B.

[1] https://lore.kernel.org/linux-arm-kernel/20231027080400.56703-4-vincent.guittot@linaro.org/T/#m42daa167097edc190b1cfc05382c385ed801d909

>  		capacity = raw_capacity[cpu];
>  		capacity = div64_u64(capacity << SCHED_CAPACITY_SHIFT,
>  				     capacity_scale);
> @@ -422,8 +429,11 @@ init_cpu_capacity_callback(struct notifier_block *nb,
>  
>  	cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cpus);
>  
> -	for_each_cpu(cpu, policy->related_cpus)
> +	for_each_cpu(cpu, policy->related_cpus) {
>  		per_cpu(capacity_ref_freq, cpu) = policy->cpuinfo.max_freq;
> +		freq_inv_set_max_ratio(cpu,
> +				       per_cpu(capacity_ref_freq, cpu) * HZ_PER_KHZ);
> +	}
>  
>  	if (cpumask_empty(cpus_to_visit)) {
>  		topology_normalize_cpu_scale();
> diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
> index 38ca6c76af56..ffdf0b7c55fa 100644
> --- a/include/linux/arch_topology.h
> +++ b/include/linux/arch_topology.h
> @@ -99,6 +99,7 @@ void update_siblings_masks(unsigned int cpu);
>  void remove_cpu_topology(unsigned int cpuid);
>  void reset_cpu_topology(void);
>  int parse_acpi_topology(void);
> +void freq_inv_set_max_ratio(int cpu, u64 max_rate);
>  #endif
>  
>  #endif /* _LINUX_ARCH_TOPOLOGY_H_ */
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
