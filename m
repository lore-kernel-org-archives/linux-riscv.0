Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36036CDB482
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 11:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=REBCQ5RrOpFkBynL36B1PUCt81E4V/V7lzGSgmDiUUM=; b=XGaHPVYyKytWGx
	qxTNmJDR0RZTHIOfkZTS+owre5qF98fGaLMsgBusCERQdA2+ieAanu7l/qzWRmFAYbCbQ5/eUhFKs
	6my7vD2+0jxvFtBYJVqS1Jx0DfWvJacZpLD+1Ux6reBr4G2c5RN0Ir3y1oeD2BZbVBRzNCrKhkVSc
	ArXZFvKjdCXYIe54OUA0yTnW96cVK1OYiVjQeAef2EyOV11UO9rxDAxc78bVNhu9uefXFhCdxZHBg
	MHVlfLqI0d3/S0EJFWVuR0Y75nnhcRm9Xn0zWNgzOuQ11SkVxef9aD7y/6GHjt2wsAoibFU/HKMfV
	cFLySZ460vGg/uts5cGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4by-00EXPr-2X;
	Wed, 18 Oct 2023 11:21:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4bv-00EXP1-0O;
	Wed, 18 Oct 2023 11:21:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 283602F4;
	Wed, 18 Oct 2023 04:21:49 -0700 (PDT)
Received: from [10.57.81.189] (unknown [10.57.81.189])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9534E3F762;
	Wed, 18 Oct 2023 04:21:03 -0700 (PDT)
Message-ID: <368c8a9f-b137-47a9-9468-ebeb04d4bab5@arm.com>
Date: Wed, 18 Oct 2023 12:21:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] cpufreq/schedutil: use a fixed reference frequency
Content-Language: en-US
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: conor.dooley@microchip.com, suagrfillet@gmail.com,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 vschneid@redhat.com, bsegall@google.com, dietmar.eggemann@arm.com,
 juri.lelli@redhat.com, peterz@infradead.org, rafael@kernel.org,
 gregkh@linuxfoundation.org, ajones@ventanamicro.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 sudeep.holla@arm.com, ionela.voinescu@arm.com, viresh.kumar@linaro.org,
 mgorman@suse.de, palmer@dabbelt.com, will@kernel.org, bristot@redhat.com,
 lftan@kernel.org, rostedt@goodmis.org, linux@armlinux.org.uk,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, mingo@redhat.com,
 catalin.marinas@arm.com, pierre.gondois@arm.com
References: <20231009103621.374412-1-vincent.guittot@linaro.org>
 <20231009103621.374412-5-vincent.guittot@linaro.org>
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20231009103621.374412-5-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_042111_256981_427D4315 
X-CRM114-Status: GOOD (  21.96  )
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



On 10/9/23 11:36, Vincent Guittot wrote:
> cpuinfo.max_freq can change at runtime because of boost as an example. This
> implies that the value could be different than the one that has been
> used when computing the capacity of a CPU.
> 
> The new arch_scale_freq_ref() returns a fixed and coherent reference
> frequency that can be used when computing a frequency based on utilization.
> 
> Use this arch_scale_freq_ref() when available and fallback to
> policy otherwise.
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>   kernel/sched/cpufreq_schedutil.c | 26 ++++++++++++++++++++++++--
>   1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
> index 4492608b7d7f..1fa7e74add8f 100644
> --- a/kernel/sched/cpufreq_schedutil.c
> +++ b/kernel/sched/cpufreq_schedutil.c
> @@ -114,6 +114,28 @@ static void sugov_deferred_update(struct sugov_policy *sg_policy)
>   	}
>   }
>   
> +/**
> + * cpufreq_get_capacity_ref_freq - get the reference frequency of a given CPU that
> + * has been used to correlate frequency and compute capacity.
> + * @policy: the cpufreq policy of the CPU in question.
> + * @use_current: Fallback to current freq instead of policy->cpuinfo.max_freq.
> + *
> + * Return: the reference CPU frequency to compute a capacity.
> + */
> +static __always_inline
> +unsigned long get_capacity_ref_freq(struct cpufreq_policy *policy)
> +{
> +	unsigned int freq = arch_scale_freq_ref(policy->cpu);
> +
> +	if (freq)
> +		return freq;

Looks good, for the platforms having this inline function returning 0,
this will be optimized out.

> +
> +	if (arch_scale_freq_invariant())
> +		return policy->cpuinfo.max_freq;
> +
> +	return policy->cur;
> +}
> +
>   /**
>    * get_next_freq - Compute a new frequency for a given cpufreq policy.
>    * @sg_policy: schedutil policy object to compute the new frequency for.
> @@ -140,10 +162,10 @@ static unsigned int get_next_freq(struct sugov_policy *sg_policy,
>   				  unsigned long util, unsigned long max)
>   {
>   	struct cpufreq_policy *policy = sg_policy->policy;
> -	unsigned int freq = arch_scale_freq_invariant() ?
> -				policy->cpuinfo.max_freq : policy->cur;
> +	unsigned int freq;
>   
>   	util = map_util_perf(util);
> +	freq = get_capacity_ref_freq(policy);
>   	freq = map_util_freq(util, freq, max);
>   
>   	if (freq == sg_policy->cached_raw_freq && !sg_policy->need_freq_update)


Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
