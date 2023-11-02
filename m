Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECFBC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 09:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OvLDD9z4OEEJMsTyPP4tM6cANC9Qylm0k2ZvhuQsLek=; b=1QhypzPPZ6miXy
	Pwe0giH2bM2/yL/Z3TqrYHPbDlyet28lezZI8KqE5q/ipstjdswQ16GKpc/jUN7y0jBNv7wL4qjdK
	hIY7W5CdGHzvi90kMyYpUTz4XNValgVf/Js+YkLej0flQgKoa3aQUmwh22bVW62dCq+BKvBCFS6Hb
	EnaU0LE4+08SqYiU6EL3TNvfHMpMgbUPFUqpfWpMcI2AbtvQCr3bm4YCkoRKpdh5T1MdBAnrcep44
	EXXogJlrMyP22k1CrMIWAIeBtQb5GEk8azNY7HW92xL8W2OriFx+fTWy6IrFMSfSJcjshujO4okxF
	GyQkCvW2eDI/dlpj7rUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyTfS-0090Ru-1z;
	Thu, 02 Nov 2023 09:07:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyTfO-0090QM-1p;
	Thu, 02 Nov 2023 09:07:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC0E02F4;
	Thu,  2 Nov 2023 02:07:42 -0700 (PDT)
Received: from [10.34.100.114] (e126645.nice.arm.com [10.34.100.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7638D3F67D;
	Thu,  2 Nov 2023 02:06:56 -0700 (PDT)
Message-ID: <89b5db0e-1121-4d0c-a8f4-1202465f5251@arm.com>
Date: Thu, 2 Nov 2023 10:06:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] cpufreq/cppc: set the frequency used for computing
 the capacity
To: Vincent Guittot <vincent.guittot@linaro.org>, linux@armlinux.org.uk,
 catalin.marinas@arm.com, will@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, sudeep.holla@arm.com,
 gregkh@linuxfoundation.org, rafael@kernel.org, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 bristot@redhat.com, vschneid@redhat.com, viresh.kumar@linaro.org,
 lenb@kernel.org, robert.moore@intel.com, lukasz.luba@arm.com,
 ionela.voinescu@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org,
 acpica-devel@lists.linuxfoundation.org
Cc: conor.dooley@microchip.com, suagrfillet@gmail.com,
 ajones@ventanamicro.com, lftan@kernel.org
References: <20231027080400.56703-1-vincent.guittot@linaro.org>
 <20231027080400.56703-7-vincent.guittot@linaro.org>
Content-Language: en-US
From: Pierre Gondois <pierre.gondois@arm.com>
In-Reply-To: <20231027080400.56703-7-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_020706_716141_26CD621D 
X-CRM114-Status: GOOD (  16.36  )
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

On 10/27/23 10:03, Vincent Guittot wrote:
> Save the frequency associated to the performance that has been used when
> initializing the capacity of CPUs.
> Also, cppc cpufreq driver can register an artificial energy model. In such
> case, it needs the frequency for this compute capacity.
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>   drivers/base/arch_topology.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 9a073c2d2086..d4bef370feb3 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -349,6 +349,7 @@ bool __init topology_parse_cpu_capacity(struct device_node *cpu_node, int cpu)
>   
>   void topology_init_cpu_capacity_cppc(void)
>   {
> +	u64 capacity, capacity_scale = 0;
>   	struct cppc_perf_caps perf_caps;
>   	int cpu;
>   
> @@ -365,6 +366,10 @@ void topology_init_cpu_capacity_cppc(void)
>   		    (perf_caps.highest_perf >= perf_caps.nominal_perf) &&
>   		    (perf_caps.highest_perf >= perf_caps.lowest_perf)) {
>   			raw_capacity[cpu] = perf_caps.highest_perf;
> +			capacity_scale = max_t(u64, capacity_scale, raw_capacity[cpu]);
> +
> +			per_cpu(capacity_ref_freq, cpu) = cppc_perf_to_khz(&perf_caps, raw_capacity[cpu]);
> +

To continue Beata's point, I think there is an issue with the following:
cppc_perf_to_khz() and cppc_khz_to_perf() were previously used with a struct containing
frequencies in KHz, cf. [1].
In the original _CPC object, frequencies are in MHz. It means that the perf_caps struct
here contains frequencies in MHz, and per_cpu(capacity_ref_freq, cpu) is in MHz aswell.

[1] https://github.com/torvalds/linux/blob/master/drivers/cpufreq/cppc_cpufreq.c#L682


>   			pr_debug("cpu_capacity: CPU%d cpu_capacity=%u (raw).\n",
>   				 cpu, raw_capacity[cpu]);
>   			continue;
> @@ -375,7 +380,15 @@ void topology_init_cpu_capacity_cppc(void)
>   		goto exit;
>   	}
>   
> -	topology_normalize_cpu_scale();
> +	for_each_possible_cpu(cpu) {
> +		capacity = raw_capacity[cpu];
> +		capacity = div64_u64(capacity << SCHED_CAPACITY_SHIFT,
> +				     capacity_scale);
> +		topology_set_cpu_scale(cpu, capacity);
> +		pr_debug("cpu_capacity: CPU%d cpu_capacity=%lu\n",
> +			cpu, topology_get_cpu_scale(cpu));
> +	}
> +
>   	schedule_work(&update_topology_flags_work);
>   	pr_debug("cpu_capacity: cpu_capacity initialization done\n");
>   

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
