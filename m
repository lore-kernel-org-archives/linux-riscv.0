Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CAEE70708
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 10:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hr+K3EAF9fRdumtLFJcfehe0ARLXh1lV7Bk5+US07kA=; b=ZUQ8o19y6P+FCq
	6MKburTELtEpJCiOmPB5xrUweBl7PhTSgDDw+V9sl6Yu6tnq8U5wJUjyPpZQc/XlTNwaNDv3GAXB+
	c5d/HdjEWaIXiGk7JhtfVFfv/QcCiWr1dcsiwVzQBHlQBbdTKfktsH6VN+wlndjrpHtcc9Q6NX97/
	QkjaEvYY0nYPggHCLFbWRH7d+uVGuABZnJWZNhamOKj8SyjBlwBiAIRm8koZQn/b/nV75QT4z5h3y
	mtDvxlqgp8zCe1oAQv5Iz4P61S52+X5b7E6S8W23vG9BbYnvnOg5MK9SehR7kxfsnu/OEqfA67vhA
	X7ipb+4C+VxauWqAjrOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGfo-005gQB-18;
	Thu, 21 Sep 2023 10:12:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGfa-005gKc-3D;
	Thu, 21 Sep 2023 10:12:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A677D1596;
	Thu, 21 Sep 2023 03:13:01 -0700 (PDT)
Received: from localhost (ionvoi01-desktop.cambridge.arm.com [10.2.78.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27AD13F59C;
	Thu, 21 Sep 2023 03:12:24 -0700 (PDT)
Date: Thu, 21 Sep 2023 11:12:22 +0100
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
Subject: Re: [PATCH 4/4] energy_model: use a fixed reference frequency
Message-ID: <ZQwXBr/QXKUVJYBy@arm.com>
References: <20230901130312.247719-1-vincent.guittot@linaro.org>
 <20230901130312.247719-5-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230901130312.247719-5-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_031227_131957_8C249308 
X-CRM114-Status: GOOD (  21.15  )
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

On Friday 01 Sep 2023 at 15:03:12 (+0200), Vincent Guittot wrote:
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
>  include/linux/energy_model.h | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/energy_model.h b/include/linux/energy_model.h
> index b9caa01dfac4..7ee07be6928e 100644
> --- a/include/linux/energy_model.h
> +++ b/include/linux/energy_model.h
> @@ -204,6 +204,20 @@ struct em_perf_state *em_pd_get_efficient_state(struct em_perf_domain *pd,
>  	return ps;
>  }
>  
> +#ifdef arch_scale_freq_ref
> +static __always_inline
> +unsigned long  arch_scale_freq_ref_em(int cpu, struct em_perf_domain *pd)

The comments in patch 3/4 should be considered for this function and its
use as well.

Thanks,
Ionela.

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
>  /**
>   * em_cpu_energy() - Estimates the energy consumed by the CPUs of a
>   *		performance domain
> @@ -224,7 +238,7 @@ static inline unsigned long em_cpu_energy(struct em_perf_domain *pd,
>  				unsigned long max_util, unsigned long sum_util,
>  				unsigned long allowed_cpu_cap)
>  {
> -	unsigned long freq, scale_cpu;
> +	unsigned long freq, ref_freq, scale_cpu;
>  	struct em_perf_state *ps;
>  	int cpu;
>  
> @@ -241,11 +255,11 @@ static inline unsigned long em_cpu_energy(struct em_perf_domain *pd,
>  	 */
>  	cpu = cpumask_first(to_cpumask(pd->cpus));
>  	scale_cpu = arch_scale_cpu_capacity(cpu);
> -	ps = &pd->table[pd->nr_perf_states - 1];
> +	ref_freq = arch_scale_freq_ref_em(cpu, pd);
>  
>  	max_util = map_util_perf(max_util);
>  	max_util = min(max_util, allowed_cpu_cap);
> -	freq = map_util_freq(max_util, ps->frequency, scale_cpu);
> +	freq = map_util_freq(max_util, ref_freq, scale_cpu);
>  
>  	/*
>  	 * Find the lowest performance state of the Energy Model above the
> -- 
> 2.34.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
