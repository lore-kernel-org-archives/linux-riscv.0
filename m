Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89569C83F2C
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 12:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UtgC2AyrsI91r3xvyBCeItwr/km1vmuOlxgozAQx5fc=; b=UWmT2W2cNF2d47
	9U0luYgl9GVT8WdWkQHkBqlUDRWvYigu3FSnMHdE4t38ilq+XkFtcQcorYFuy5jsEGCppazzW0U9P
	GJzK0Tu+KhK9+/ZTD2XGW/1Ag6xNaLFcZ7G20xMfhZEBItsJaKEL3u3fsIZ50rlkqSAKfyJUSaYTQ
	5Isvblht8P4M6kd9jfcC28T8dIGETTFrN6mGrm2dn3bnXu4oyIL8GGGOCSNc0RJIGjnMAFQRj9w0k
	zZV7n0rZ4mwn5I1cYyN+pfCyxxrJ3Aaky98dNY19RWAs42HH2w5PlAquwuibqhU7z6lsoM+OPxllm
	fevJb3U5cm96Dl2vrbig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qd8s0-0046ND-19;
	Mon, 04 Sep 2023 12:39:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qd8rw-0046Lu-2p;
	Mon, 04 Sep 2023 12:39:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83C091474;
	Mon,  4 Sep 2023 05:40:26 -0700 (PDT)
Received: from [10.57.93.88] (unknown [10.57.93.88])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9EFCD3F793;
	Mon,  4 Sep 2023 05:39:43 -0700 (PDT)
Message-ID: <1a349a05-d351-c2e0-615f-ed503563da5c@arm.com>
Date: Mon, 4 Sep 2023 13:40:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/4] energy_model: use a fixed reference frequency
Content-Language: en-US
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: conor.dooley@microchip.com, suagrfillet@gmail.com,
 ajones@ventanamicro.com, catalin.marinas@arm.com, lftan@kernel.org,
 will@kernel.org, juri.lelli@redhat.com, peterz@infradead.org,
 mingo@redhat.com, sudeep.holla@arm.com, rostedt@goodmis.org,
 vschneid@redhat.com, linux@armlinux.org.uk, linux-riscv@lists.infradead.org,
 mgorman@suse.de, bsegall@google.com, dietmar.eggemann@arm.com,
 linux-pm@vger.kernel.org, bristot@redhat.com, rafael@kernel.org,
 gregkh@linuxfoundation.org, viresh.kumar@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, aou@eecs.berkeley.edu
References: <20230901130312.247719-1-vincent.guittot@linaro.org>
 <20230901130312.247719-5-vincent.guittot@linaro.org>
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20230901130312.247719-5-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_053953_031119_9069672E 
X-CRM114-Status: GOOD (  20.90  )
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



On 9/1/23 14:03, Vincent Guittot wrote:
> The last item of a performance domain is not always the performance point
> that has been used to compute CPU's capacity. This can lead to different
> target frequency compared with other part of the system like schedutil and
> would result in wrong energy estimation.
> 
> a new arch_scale_freq_ref() is available to return a fixed and coherent
> frequency reference that can be used when computing the CPU's frequency
> for an level of utilization. Use this function when available or fallback
> to the last performance domain item otherwise.
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>   include/linux/energy_model.h | 20 +++++++++++++++++---
>   1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/energy_model.h b/include/linux/energy_model.h
> index b9caa01dfac4..7ee07be6928e 100644
> --- a/include/linux/energy_model.h
> +++ b/include/linux/energy_model.h
> @@ -204,6 +204,20 @@ struct em_perf_state *em_pd_get_efficient_state(struct em_perf_domain *pd,
>   	return ps;
>   }
>   
> +#ifdef arch_scale_freq_ref
> +static __always_inline
> +unsigned long  arch_scale_freq_ref_em(int cpu, struct em_perf_domain *pd)
> +{
> +	return arch_scale_freq_ref(cpu);
> +}
> +#else
> +static __always_inline
> +unsigned long  arch_scale_freq_ref_em(int cpu, struct em_perf_domain *pd)
> +{
> +	return pd->table[pd->nr_perf_states - 1].frequency;
> +}
> +#endif
> +
>   /**
>    * em_cpu_energy() - Estimates the energy consumed by the CPUs of a
>    *		performance domain
> @@ -224,7 +238,7 @@ static inline unsigned long em_cpu_energy(struct em_perf_domain *pd,
>   				unsigned long max_util, unsigned long sum_util,
>   				unsigned long allowed_cpu_cap)
>   {
> -	unsigned long freq, scale_cpu;
> +	unsigned long freq, ref_freq, scale_cpu;
>   	struct em_perf_state *ps;
>   	int cpu;
>   
> @@ -241,11 +255,11 @@ static inline unsigned long em_cpu_energy(struct em_perf_domain *pd,
>   	 */
>   	cpu = cpumask_first(to_cpumask(pd->cpus));
>   	scale_cpu = arch_scale_cpu_capacity(cpu);
> -	ps = &pd->table[pd->nr_perf_states - 1];
> +	ref_freq = arch_scale_freq_ref_em(cpu, pd);
>   
>   	max_util = map_util_perf(max_util);
>   	max_util = min(max_util, allowed_cpu_cap);
> -	freq = map_util_freq(max_util, ps->frequency, scale_cpu);
> +	freq = map_util_freq(max_util, ref_freq, scale_cpu);
>   
>   	/*
>   	 * Find the lowest performance state of the Energy Model above the

LGTM,

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

FYI, I'm going to send my v4 for the EM hopefully in next days, so those
changes might collide. But we can sort this out later (when both would
be ready).

Regards,
Lukasz

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
