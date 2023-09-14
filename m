Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48160EEAA71
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 21:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SFkUscZ/CmwyFDrrBsVms6B/qHS8sfP/Dm2QfXbP2MI=; b=UbvBfe83JRO410
	RSrPXBVe7c1IdXaoirq9dZlXd/JInksO/tOfNKxGm0Yb+3eTbXyuy/Gn5/mrt56GW8KVhgtAspvgB
	xMaNuwWM+MX0b3nmOdwk2y06OpfbLPTGVaWvk3i0sR8V/aDI6Kox5DidR3VGAvzwfl8rI/W1tCLKo
	4ry7mxhSj0R7Ly4zE1bEU+h9Rum6+WL7hpdoOoAipktc1KUQtaPUsGBBlgYL7B6ghpOL5i1zwXn6z
	u72L4oPAN3KpZwoIGoumTMGzy8BsO4QLlX3O1AhiabNzigm20PMac7nKo5S3QlGGRSc0jDkH6buNw
	/y5PiClC9Q4GB71+IJqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgtYk-009HfE-2U;
	Thu, 14 Sep 2023 21:07:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgtYg-009Hdx-2c;
	Thu, 14 Sep 2023 21:07:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82B791FB;
	Thu, 14 Sep 2023 14:08:05 -0700 (PDT)
Received: from [192.168.178.6] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 875B13F738;
	Thu, 14 Sep 2023 14:07:24 -0700 (PDT)
Message-ID: <8cfa9edb-67f9-80f9-0a5c-1920f95b338a@arm.com>
Date: Thu, 14 Sep 2023 23:07:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/4] energy_model: use a fixed reference frequency
Content-Language: en-US
To: Vincent Guittot <vincent.guittot@linaro.org>, linux@armlinux.org.uk,
 catalin.marinas@arm.com, will@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, sudeep.holla@arm.com,
 gregkh@linuxfoundation.org, rafael@kernel.org, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, bristot@redhat.com,
 vschneid@redhat.com, viresh.kumar@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org
Cc: conor.dooley@microchip.com, suagrfillet@gmail.com,
 ajones@ventanamicro.com, lftan@kernel.org
References: <20230901130312.247719-1-vincent.guittot@linaro.org>
 <20230901130312.247719-5-vincent.guittot@linaro.org>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <20230901130312.247719-5-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_140730_900348_E08B9488 
X-CRM114-Status: GOOD (  11.58  )
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

On 01/09/2023 15:03, Vincent Guittot wrote:

[...]

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

Why is this function named with the arch prefix?

So far we have 5 arch functions (arch_scale_freq_tick() <->
arch_scale_freq_ref()) and e.g. Arm/Arm64 defines them with there
topology_foo implementations.

Isn't arch_scale_freq_ref_em() (as well as arch_scale_freq_ref_policy())
different in this sense and so a proper EM function which should
manifest in its name?

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

[...]

> @@ -241,11 +255,11 @@ static inline unsigned long em_cpu_energy(struct em_perf_domain *pd,
>  	 */
>  	cpu = cpumask_first(to_cpumask(pd->cpus));
>  	scale_cpu = arch_scale_cpu_capacity(cpu);
> -	ps = &pd->table[pd->nr_perf_states - 1];
> +	ref_freq = arch_scale_freq_ref_em(cpu, pd);

Why not using existing `unsigned long freq` here like in schedutil's
get_next_freq()?

>  
>  	max_util = map_util_perf(max_util);

[...]


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
