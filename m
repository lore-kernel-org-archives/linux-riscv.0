Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5620ED14893
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 03:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VAEPmVi64E5CuUN+08CwABT/KwSIdnEEV4h5i0Ef490=; b=IxIvePktc2/RGn
	E4KjwOp+zJQ7eQNbDPxNa5vzri/qnxtXNXTMTQWWRdfbsqR1/C9IicJR4C+n0gWkXOL6N3kerBBSD
	KAaNze1qaDMP1FQW2wsbXNWdrkbjigDYAGAgM45qZfj6Wh/RZEnOBUxZ/J2XHR2zRiaLQkpKQxhRv
	qo1dTzTLbUjgdy1QI158nu4Pr8Y9P7FSEsiZnIs0tiHAjGqvMriSz9/jmXRepl9pblyluFd3LJJkb
	6O36HJ403K3R8GJRYxYWMXvWBpi86YMbERHgu8kmgaN4MH4ly3rnK7ua0Na+OXlraMbeF/t+jKzX/
	pHA8CB7mevwb7UNWYNCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdggA-0000000Fsgk-0zoN;
	Thu, 08 Jan 2026 03:27:18 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdgg7-0000000FsgK-3Vz3
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 03:27:17 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-29f102b013fso28635405ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 07 Jan 2026 19:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767842834; x=1768447634; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mu7Pr1Fsv537lLh/d+ZgA1WZ3a8Wch+LwtiH0stf88o=;
        b=Y33n1J8lADJAlwjuGj7EYf8dRk0kc4n6ge/pwo3Mi28O7e4WXUXC/hCatA9z7sKDCs
         P8sLlQ6CYv5zp12lrwyz5ga0r8yzRGnC+5pUaTU/xCuspEQyOHT09vqjIPdNccZVh+PM
         hJmO81S2aYr6IbbWwwdZ2LFDqVlK9ePuoV2QnFarqGbiWwwZSJeVbdGvpwsmhmTljv58
         A9Gw7OLSmgmDz3aBkxqy7oKpE7lGfl++F5ru3c4PyHOb/issfen++BC1elAfXYw8nTf9
         lQsGEXHejdq40U2w6llngnyCEXY+1X/JUPBFXnKGRWfG8Tfnym60IBSl6rv/p4csgyvk
         3fPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767842834; x=1768447634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mu7Pr1Fsv537lLh/d+ZgA1WZ3a8Wch+LwtiH0stf88o=;
        b=HZXXykVzimR5wNGa4IVasO/PN+dt6i2hxOdlOtuN+Nj9i9e9ORrWS8sPfvSPRXzm7n
         0CPD5Cq7Mh1ldYsxitKkxbUSQ4vNwigoI9PzOMDHgzH9tPM6lEt8vQH+syGlTVnAToh8
         OA1+exz3T613RqXeMYtjxTMHKvshZcUwBUfB55nh69mt8Cr6C5ZYlyz/yPRNfrwG/BG5
         X1L9rn9RMqFLAwjJNiy94PfjDEpO3FeGwr0f34Klq3/Dd4mpyMWUYrM7oTYU+jdARQHk
         aEhY8bYcG8flNA45NJCbDeNBwkjOyloxxCTQeEZ3wH1H41xVCCmr5kxmy7emf39C59kC
         D7lQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQU5NBtABh5ayNO4z5STAw9l9GSIttoL4IREkSdGIR3k8LIImX4ylro+RCi/LHs6zxjd9cMSbXn2pTlA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi5Cmdo++EPej9oXia7+Eoah1WWiLF108zwA893IoBZ+Y9uIqy
	xea+u+mxjvzts+rzBb01+vsUPcElMEgMOG1M21peMD4J6+ec9YPttmtWl0Cgw08GxjU=
X-Gm-Gg: AY/fxX5pObrZGmd4n7W/kSB5+EfbzaRVqr3IYeYsNbcxnwFDk6uIo6qIuzjnbqypDl/
	1cgyLVnAnkVqud8w42WRNilDx6Uxuy0t3UnilkCRVVztnXgWhtb10+QcvJhu25+BeqvkVMXOgcb
	PK9gYVsxTZZSW6NuFS5tFM3FUV79deWvUpReMqYgsIP4KUNKukUoQM6mMOfDMAt1ltN2q+HzYzO
	+5aZ8zQ0frLTnqhopibenz3aLXWh1Q7fRTKW12bdZ3reMdlGRZ3DsQtDffAmaLY8+aPJuC+dYQ6
	im432NspfOXQwavweeGqjzT8p0F4uw4JtcAiYCXwmL4Pa+op9TkrxTozLQkhlD9WgZYMkjWt/sZ
	Bpqh5kua8Wq6lAIz+hPgy3JIuUcK7I+WM6rBo9yoIGB9lZcjgU5LQ3jf5/PxqwuZs0PpSwJ8N0N
	iKGvclYvfZnR8=
X-Google-Smtp-Source: AGHT+IGWi0WECARHC8sh1t7xnHsqYiwxnwYeP+AKv4h6c8GciQupJD36kPRYTo6CbK8YPrm4jsg9uw==
X-Received: by 2002:a17:903:1b4c:b0:26c:2e56:ec27 with SMTP id d9443c01a7336-2a3ee43653cmr44865905ad.19.1767842834139;
        Wed, 07 Jan 2026 19:27:14 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bb0dfd29sm6063479b3a.25.2026.01.07.19.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 19:27:13 -0800 (PST)
Date: Thu, 8 Jan 2026 08:57:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: rahul@summations.net, anup@brainfault.org, 
	leyfoon.tan@starfivetech.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	rafael@kernel.org, sboyd@kernel.org, jms@oss.tenstorrent.com, 
	darshan.prajapati@einfochips.com, charlie@rivosinc.com, dfustini@oss.tenstorrent.com, 
	michal.simek@amd.com, cyy@cyyself.name, jassisinghbrar@gmail.com, 
	andriy.shevchenko@linux.intel.com, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 4/5] cpufreq: Add cpufreq driver for the RISC-V RPMI
 performance service group
Message-ID: <5nfljdaewlmafydt5a3jijjlr2krszbnadmjkpkgo7in364yzy@tiejhive2siv>
References: <20260106092117.3727152-1-joshua.yeong@starfivetech.com>
 <20260106092117.3727152-5-joshua.yeong@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260106092117.3727152-5-joshua.yeong@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_192715_887846_F964DCC0 
X-CRM114-Status: GOOD (  21.90  )
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

On 06-01-26, 17:21, Joshua Yeong wrote:
> diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
> index 78702a08364f..9aaa1f71000e 100644
> --- a/drivers/cpufreq/Kconfig
> +++ b/drivers/cpufreq/Kconfig
> @@ -4,8 +4,8 @@ menu "CPU Frequency scaling"
>  config CPU_FREQ
>  	bool "CPU Frequency scaling"
>  	help
> -	  CPU Frequency scaling allows you to change the clock speed of 
> -	  CPUs on the fly. This is a nice method to save power, because 
> +	  CPU Frequency scaling allows you to change the clock speed of
> +	  CPUs on the fly. This is a nice method to save power, because
>  	  the lower the CPU clock speed, the less power the CPU consumes.
>  
>  	  Note that this driver doesn't automatically change the CPU
> @@ -65,7 +65,7 @@ config CPU_FREQ_DEFAULT_GOV_USERSPACE
>  	select CPU_FREQ_GOV_USERSPACE
>  	help
>  	  Use the CPUFreq governor 'userspace' as default. This allows
> -	  you to set the CPU frequency manually or when a userspace 
> +	  you to set the CPU frequency manually or when a userspace
>  	  program shall be able to set the CPU dynamically without having
>  	  to enable the userspace governor manually.
>  
> @@ -134,7 +134,7 @@ config CPU_FREQ_GOV_USERSPACE
>  	help
>  	  Enable this cpufreq governor when you either want to set the
>  	  CPU frequency manually or when a userspace program shall
> -	  be able to set the CPU dynamically, like on LART 
> +	  be able to set the CPU dynamically, like on LART
>  	  <http://www.lartmaker.nl/>.
>  
>  	  To compile this driver as a module, choose M here: the
> @@ -147,11 +147,11 @@ config CPU_FREQ_GOV_ONDEMAND
>  	select CPU_FREQ_GOV_COMMON
>  	help
>  	  'ondemand' - This driver adds a dynamic cpufreq policy governor.
> -	  The governor does a periodic polling and 
> +	  The governor does a periodic polling and
>  	  changes frequency based on the CPU utilization.
>  	  The support for this governor depends on CPU capability to
>  	  do fast frequency switching (i.e, very low latency frequency
> -	  transitions). 
> +	  transitions).
>  
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called cpufreq_ondemand.
> @@ -367,4 +367,18 @@ config ACPI_CPPC_CPUFREQ_FIE
>  
>  endif

Unrelated changes ?

> +++ b/drivers/cpufreq/riscv-rpmi-cpufreq.c
> +static int rpmi_cpufreq_probe(struct platform_device *pdev)
> +{

> +fail_free_channel:
> +	mbox_free_channel(mpxy_ctx->chan);
> +
> +	return ret;
> +}
> +
> +static void rpmi_cpufreq_remove(struct platform_device *pdev)
> +{
> +	cpufreq_unregister_driver(&rpmi_perf_cpufreq_driver);

Don't need to free mpxy_ctx->chan ?

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
