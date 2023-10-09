Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34729E95A96
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 11:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mlgx66Owd8dNghUFgcJMEI5y+k77MS2fieRxD7XxaEM=; b=3G0L33ZxGZtxVE
	nnGeQbfM5HtGFd2YD8uXphkOodlcTJRzK6+eywEq8svAG7ztlJXus7Wmmw2StpwXS3eg4jcRdbvdH
	A6JmSxP1aeAu63BjRZddKTnnTcLdLkfHEkpMKKZ+1XlpdkyU4+ZERHz8ApODHnMGT4xkCVD1v8658
	Af5ub6LlMBMNjSc8by6WpAVOB+3pfqQfXDyfP2LDLw+qA6nAnE9EGX5H3ae48BxJCl6OjMkM17c8E
	fgrOjr5x6TuTCZsuMg84uk51B9UmFzAeyG9UfyxcfWadffFykRtHE8MygaBZte9haEaz5SQp6qPuQ
	RPFheM7/qKFF9b5K9GoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpo0l-00APAn-2R;
	Mon, 09 Oct 2023 11:01:19 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpo0h-00AP8a-1l
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 11:01:17 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-690d8fb3b7eso3915141b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Oct 2023 04:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696849274; x=1697454074; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=20UBSnZ21RVqEDRJGZ13WLMQlN/IzJeVLBl1dR+JWvA=;
        b=wMf6DYkk804nLdOAfdyD0NvCN1ug7u7al70DJVJyRErSjPDqGP9+ER+avVuedc/dbU
         SkZ5NWZEi/2uJsibvO/U2uZUw15+prAWs1K33YPmtwEqYXAOi709CcAmc8c1zY+nvu8G
         5L1t4WORHk5bq4i+INS9YyO6TKChafglxs+OJGO0fcAE2SsiPmQkndQtXrh6YCTH6hr5
         la4RAaTTDk29Q7dpYZano4Sn1B39bsImGrVTG7NfEhP5Dyovm23gyPtpUJtuWcDPoA1B
         H32gYS/w+Jbo6j5bes/v753Ijslo1tNaRLRbloqTOoy/2iwyIIcaBLcIKdDjPAQdZFnS
         eRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696849274; x=1697454074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20UBSnZ21RVqEDRJGZ13WLMQlN/IzJeVLBl1dR+JWvA=;
        b=UBT1mjpNphdUoTgT7U+lB8Rx9N+c1AC3Ob2IzO7vL4IfviDS9O+++YJeMitDx/hOXr
         e4xuT7YpIM9uGKu0lzcdq3AiNx3D9qijB0nIGaY3/kNA2dVrjJHWAZO1PpN7JTyh4236
         o1bcbAggA2j56pTyazmsJR7wxMWSgM8oW0mY2wnwL0Jz0qIUi64X1w5+Hf6FUZl4zGwn
         wRDWJbE4XI58DfDovsnLMuD4oSdSE9LKPt0xJr7UaR1b02vBwUeQ3FpvfAvR1iCmpPj7
         WxxJ//CtBxHpcj/ViBL+srgizjPkp98DcJ6t3XuNVjm2iaBd7r59K/BzDEVObfdGacIX
         s33w==
X-Gm-Message-State: AOJu0YxGLcRiwIw4M+M2/p2fn8BaAHDLGX0giMbMo12KJKf6os0y3VaK
	pqxg5pJRtv0Pf6YZ9AHpntKsFw==
X-Google-Smtp-Source: AGHT+IHe1jCSbOpGTUJ7WuGxCNpKASE8C+Y2DxHdiDOD36WoYmFY8Ro/O/Bx/pkU+uFk/jP4FO5q8Q==
X-Received: by 2002:a05:6a00:2da2:b0:68f:cc47:fcd7 with SMTP id fb34-20020a056a002da200b0068fcc47fcd7mr17093067pfb.28.1696849273710;
        Mon, 09 Oct 2023 04:01:13 -0700 (PDT)
Received: from localhost ([122.172.81.92])
        by smtp.gmail.com with ESMTPSA id gu21-20020a056a004e5500b00690c2cd7e0esm6146001pfb.49.2023.10.09.04.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 04:01:13 -0700 (PDT)
Date: Mon, 9 Oct 2023 16:31:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	lukasz.luba@arm.com, ionela.voinescu@arm.com,
	pierre.gondois@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org, conor.dooley@microchip.com,
	suagrfillet@gmail.com, ajones@ventanamicro.com, lftan@kernel.org
Subject: Re: [PATCH v2 3/6] cpufreq: use the fixed and coherent frequency for
 scaling capacity
Message-ID: <20231009110111.tdehkpammwyigzia@vireshk-i7>
References: <20231009103621.374412-1-vincent.guittot@linaro.org>
 <20231009103621.374412-4-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231009103621.374412-4-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_040115_584919_8FF4C24D 
X-CRM114-Status: GOOD (  18.94  )
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

On 09-10-23, 12:36, Vincent Guittot wrote:
> cpuinfo.max_freq can change at runtime because of boost as an example. This
> implies that the value could be different from the frequency that has been
> used to compute the capacity of a CPU.
> 
> The new arch_scale_freq_ref() returns a fixed and coherent frequency
> that can be used to compute the capacity for a given frequency.
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>  drivers/cpufreq/cpufreq.c | 4 ++--
>  include/linux/cpufreq.h   | 9 +++++++++
>  2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 60ed89000e82..8c4f9c2f9c44 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -454,7 +454,7 @@ void cpufreq_freq_transition_end(struct cpufreq_policy *policy,
>  
>  	arch_set_freq_scale(policy->related_cpus,
>  			    policy->cur,
> -			    policy->cpuinfo.max_freq);
> +			    arch_scale_freq_ref(policy->cpu));
>  
>  	spin_lock(&policy->transition_lock);
>  	policy->transition_ongoing = false;
> @@ -2174,7 +2174,7 @@ unsigned int cpufreq_driver_fast_switch(struct cpufreq_policy *policy,
>  
>  	policy->cur = freq;
>  	arch_set_freq_scale(policy->related_cpus, freq,
> -			    policy->cpuinfo.max_freq);
> +			    arch_scale_freq_ref(policy->cpu));
>  	cpufreq_stats_record_transition(policy, freq);
>  
>  	if (trace_cpu_frequency_enabled()) {
> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> index 71d186d6933a..bbc483b4b6e5 100644
> --- a/include/linux/cpufreq.h
> +++ b/include/linux/cpufreq.h
> @@ -1211,6 +1211,15 @@ void arch_set_freq_scale(const struct cpumask *cpus,
>  {
>  }
>  #endif
> +
> +#ifndef arch_scale_freq_ref
> +static __always_inline
> +unsigned int arch_scale_freq_ref(int cpu)
> +{
> +	return 0;
> +}
> +#endif
> +
>  /* the following are really really optional */
>  extern struct freq_attr cpufreq_freq_attr_scaling_available_freqs;
>  extern struct freq_attr cpufreq_freq_attr_scaling_boost_freqs;

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
