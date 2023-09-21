Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9600E706F8
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 09:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0CHIfB663FyX/Wuvk/PJijgnY2UcYzbq6z0yxsZ1UeI=; b=xH+Rr7lfzYh/s+
	j69OpvWi3eVlRepGHHvdH7BFLZgin0Z0UCSYQQNlbgFNrleDeGpebpHRRR+s8RX5ocwuZCnG1bGUY
	rf4Qi+kOoD4qnoN2f8S9wBJ7/6wCbbOP848AxC+AjYn7dRnfJE8fJ5UCRG2eNCM3INFasfgdWAl9w
	5z9LJ7mPne/oNjAZ5mdedQQU5uW8AnKyly0wm3+I7UMzOHMBXOID2l93+9nKQAnB5fQlvgsyJhE4+
	vBDuisFpOPyi+1kp1PyOCsUsPQbLfrlKK5o+Go09Q/eHF07kY4rWZfP3MvT9RUqtxLczoCX++rIji
	Sy3Q4tLN+K77zFg/KQZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjFqf-005ZqH-2p;
	Thu, 21 Sep 2023 09:19:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjFqc-005Zou-1M;
	Thu, 21 Sep 2023 09:19:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AC3114BF;
	Thu, 21 Sep 2023 02:20:19 -0700 (PDT)
Received: from localhost (ionvoi01-desktop.cambridge.arm.com [10.2.78.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E5C33F59C;
	Thu, 21 Sep 2023 02:19:41 -0700 (PDT)
Date: Thu, 21 Sep 2023 10:19:40 +0100
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	viresh.kumar@linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org, conor.dooley@microchip.com,
	suagrfillet@gmail.com, ajones@ventanamicro.com, lftan@kernel.org
Subject: Re: [PATCH 3/4] cpufreq/schedutil: use a fixed reference frequency
Message-ID: <ZQwKnnXbjLOYUSjO@arm.com>
References: <20230901130312.247719-1-vincent.guittot@linaro.org>
 <20230901130312.247719-4-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230901130312.247719-4-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_021946_554501_DC800DDF 
X-CRM114-Status: GOOD (  26.13  )
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

On Friday 01 Sep 2023 at 15:03:11 (+0200), Vincent Guittot wrote:
> cpuinfo_max_freq can change at runtime because of boost as example. This
> implies that the value could not be the same than the one that has been
> used when computing the capacity of a CPU.
> 
> The new arch_scale_freq_ref() returns a fixed and coherent frequency
> reference that can be used when computing a frequency based on utilization.
> 
> Use this arch_scale_freq_ref() when available and fallback to
> cpuinfo.max_freq otherwise.
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>  kernel/sched/cpufreq_schedutil.c | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
> index 4492608b7d7f..9996ef429e2b 100644
> --- a/kernel/sched/cpufreq_schedutil.c
> +++ b/kernel/sched/cpufreq_schedutil.c
> @@ -114,6 +114,31 @@ static void sugov_deferred_update(struct sugov_policy *sg_policy)
>  	}
>  }
>  
> +#ifdef arch_scale_freq_ref
> +/**
> + * arch_scale_freq_ref_policy - get the reference frequency of a given CPU that
> + * has been used to correlate frequency and compute capacity.
> + * @cpu: the CPU in question.
> + *
> + * Return: the reference CPU frequency.
> + */
> +static __always_inline
> +unsigned long  arch_scale_freq_ref_policy(struct cpufreq_policy *policy)

This should not be an arch_ function as it's only a wrapper over an
arch_ function and not a function that different architectures might
implement differently usually in architecture specific code.

> +{
> +	return arch_scale_freq_ref(policy->cpu);

It might make it easier to read if arch_scale_freq_ref() had a default
implementation that returned 0.

Then this code would simply become:

freq = arch_scale_freq_ref(policy->cpu);
if (freq)
	return freq;
else if (arch_scale_freq_invariant())
	return ..
..

This approach is similar to the use of arch_freq_get_on_cpu() in
cpufreq.c, and, as there, having a chosen maximum frequency of 0 would
not be a valid value.

> +}
> +#else
> +static __always_inline
> +unsigned long  arch_scale_freq_ref_policy(struct cpufreq_policy *policy)
> +{
> +	if (arch_scale_freq_invariant())
> +		return policy->cpuinfo.max_freq;
> +
> +
> +	return policy->cur;
> +}
> +#endif
> +
>  /**
>   * get_next_freq - Compute a new frequency for a given cpufreq policy.
>   * @sg_policy: schedutil policy object to compute the new frequency for.
> @@ -139,11 +164,11 @@ static void sugov_deferred_update(struct sugov_policy *sg_policy)
>  static unsigned int get_next_freq(struct sugov_policy *sg_policy,
>  				  unsigned long util, unsigned long max)
>  {
> +	unsigned int freq;
>  	struct cpufreq_policy *policy = sg_policy->policy;
> -	unsigned int freq = arch_scale_freq_invariant() ?
> -				policy->cpuinfo.max_freq : policy->cur;
>  
>  	util = map_util_perf(util);
> +	freq = arch_scale_freq_ref_policy(policy);

Given its single use here, it would likely be better to place the code
above directly here, rather than create a wrapper over a few lines of
code.

Hope it helps,
Ionela.

>  	freq = map_util_freq(util, freq, max);
>  
>  	if (freq == sg_policy->cached_raw_freq && !sg_policy->need_freq_update)
> -- 
> 2.34.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
