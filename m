Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE72FC83F3F
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 12:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WvqDpzajO21plVvNm7ahSMSrNbsTkSnA6nI29E0gmss=; b=p4ma2fNcatiOTi
	2y6zzoE/rAKUoJSh5DRkymjYklN2V+bfFT/pAjFMCrtUVIQOQY1vtv7WqIQAjkn15PICr8ncjl25I
	ZgAYl/iX3kY98ujBzEdny6w2uVqFMFfFtj+p2vjLPE+3hZjM/yXUtYAPeuyVyxccrqsJjwcvEPCwE
	dVGFo9+PLwykk0idH18b6NTZ6iqA+aXtXY4RHPT8/vICt9s7CY380pKglrEqabYhNOXlRiaifflBL
	oXIujE00vmUEYwGpDtm/wjlugSrwgq5aQr8hi1stg4nP29HXGCWbQEtEUDmr5SEMYFuV1pCgozRwj
	5Gt614erF8JLlU0ZRtPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qd8n0-0045n2-0S;
	Mon, 04 Sep 2023 12:34:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qd8mv-0045mF-02;
	Mon, 04 Sep 2023 12:34:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B4AB143D;
	Mon,  4 Sep 2023 05:35:10 -0700 (PDT)
Received: from [10.57.93.88] (unknown [10.57.93.88])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5B373F793;
	Mon,  4 Sep 2023 05:34:27 -0700 (PDT)
Message-ID: <840cb103-8ffb-9798-05a3-a557f78f7f7a@arm.com>
Date: Mon, 4 Sep 2023 13:35:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/4] topology: add a new arch_scale_freq_reference
Content-Language: en-US
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: conor.dooley@microchip.com, linux-arm-kernel@lists.infradead.org,
 suagrfillet@gmail.com, juri.lelli@redhat.com, sudeep.holla@arm.com,
 palmer@dabbelt.com, linux-riscv@lists.infradead.org,
 ajones@ventanamicro.com, lftan@kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux@armlinux.org.uk, bristot@redhat.com,
 catalin.marinas@arm.com, bsegall@google.com, will@kernel.org,
 vschneid@redhat.com, rostedt@goodmis.org, rafael@kernel.org,
 dietmar.eggemann@arm.com, aou@eecs.berkeley.edu, mingo@redhat.com,
 paul.walmsley@sifive.com, mgorman@suse.de, gregkh@linuxfoundation.org,
 peterz@infradead.org, viresh.kumar@linaro.org
References: <20230901130312.247719-1-vincent.guittot@linaro.org>
 <20230901130312.247719-3-vincent.guittot@linaro.org>
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20230901130312.247719-3-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_053441_168388_0AF6FBAA 
X-CRM114-Status: GOOD (  24.70  )
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

Hi Vincent,


On 9/1/23 14:03, Vincent Guittot wrote:
> Create a new method to get a unique and fixed max frequency. Currently
> cpuinfo.max_freq or last item of performance domain are used as the max
> frequency when computing the frequency for a level of utilization but:
> - cpuinfo_max_freq can change at runtime. boost is one example of
>    such change.
> - cpuinfo.max_freq and last item of the PD can be different leading to
>    different results betwen cpufreq and energy model.
> 
> We need to save the max frequency that has been used when computing the
> CPUs capacity and use this fixed and coherent value to convert between
> frequency and CPU's capacity.
> 
> In fact, we already save the frequency that has been used when computing
> the capacity of each CPU. We extend the precision to save khZ instead of
> Mhz currently and we modify the type to be aligned with other variables
> used when converting frequency to capacity and the other way.

I do like this 'kHz' change. We also use kHz in the EM, so better
aligned now.

> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>   arch/arm/include/asm/topology.h   | 1 +
>   arch/arm64/include/asm/topology.h | 1 +
>   arch/riscv/include/asm/topology.h | 1 +
>   drivers/base/arch_topology.c      | 9 +++------
>   include/linux/arch_topology.h     | 7 +++++++
>   5 files changed, 13 insertions(+), 6 deletions(-)
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
> index b741b5ba82bd..75fa67477a9d 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -26,7 +26,7 @@
>   static DEFINE_PER_CPU(struct scale_freq_data __rcu *, sft_data);
>   static struct cpumask scale_freq_counters_mask;
>   static bool scale_freq_invariant;
> -static DEFINE_PER_CPU(u32, freq_factor) = 1;
> +DEFINE_PER_CPU(unsigned long, freq_factor) = 1;

Why it's not static now?

>   
>   static bool supports_scale_freq_counters(const struct cpumask *cpus)
>   {
> @@ -183,10 +183,7 @@ void topology_update_thermal_pressure(const struct cpumask *cpus,
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
> @@ -411,7 +408,7 @@ init_cpu_capacity_callback(struct notifier_block *nb,
>   	cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cpus);
>   
>   	for_each_cpu(cpu, policy->related_cpus)
> -		per_cpu(freq_factor, cpu) = policy->cpuinfo.max_freq / 1000;
> +		per_cpu(freq_factor, cpu) = policy->cpuinfo.max_freq;
>   
>   	if (cpumask_empty(cpus_to_visit)) {
>   		topology_normalize_cpu_scale();
> diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
> index a07b510e7dc5..7a2dba9c3dc0 100644
> --- a/include/linux/arch_topology.h
> +++ b/include/linux/arch_topology.h
> @@ -27,6 +27,13 @@ static inline unsigned long topology_get_cpu_scale(int cpu)
>   
>   void topology_set_cpu_scale(unsigned int cpu, unsigned long capacity);
>   
> +DECLARE_PER_CPU(unsigned long, freq_factor);
> +
> +static inline unsigned long topology_get_freq_ref(int cpu)
> +{
> +	return per_cpu(freq_factor, cpu);
> +}
> +
>   DECLARE_PER_CPU(unsigned long, arch_freq_scale);
>   
>   static inline unsigned long topology_get_freq_scale(int cpu)

Apart from that 'static' missing, that looks good.

Regards,
Lukasz

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
