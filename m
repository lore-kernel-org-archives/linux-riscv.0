Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899A5C4321E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 17:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=B3RWrNc+lB7b275flyG3U8mybGagsjp0yH23MZ17vTs=; b=k6vL7wgwsyP7EXqyQzwhYrChcB
	5SqbBUz1qV2tvb4aCzooLNNxlJjTB9w4Wptu8gztWvXY3Az6FbiHCOMOaSl7WRNEMcREl9tWCCb9n
	f7teVcvDTpGY+Kvq8pRdTBndbtxq7yob6JlfCK5u2dWiSqsSQNAC7xnpnPUWnuf+jwZQgP/7kD1fj
	8glPxj9UWDL/EfANPM8xd5mv3nwowdheqpuFk8bKAymwz8kDdRcIjg3OgMx0q5lZsM7dedOPWRLzQ
	4IC7HzixTrhZuS56pvStz4AjObEusOaScSqam7k4S+xgQ0BlOdURHJGXmnwfRP+CTcMnz/bH1zCjO
	JlgMNubw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1AIL-000U5F-IB; Fri, 02 Dec 2022 17:57:53 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1AII-000U3Y-O2
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 17:57:52 +0000
Received: by mail-pg1-x531.google.com with SMTP id f9so4969901pgf.7
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 09:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QpV6FtlGJmbPG4Gl6DlIwigphMAcM3UTUgrO4+lemWs=;
        b=AkdsJdvyIzbTuxBG/JKnklHpRXvVoLQA+8QI40Wz8FNvV41nXCSqsOQRPDxX0N6mEy
         cJaZXq8mcQuxRYKeGkHP9JyRcNbOSAtl0KGE1cYX+PntDHTqVls2XiM3BUxBXugnEgPg
         DvaeP/WTKdcCR/FStVwt2fHfvEW68ZeigiLiaw/i6bJA08q4Px7GR93qwKjVSzpz5RS3
         HJh2cHG24Lm+5FYDTZGw9tb5zsKbY0KtZk+ryW+JL3iJPo406PUQi1NHt/59+1wHFdIE
         vsht164Xjq3jDzr/OqP3UtRBAdGb//TTH8L2h/ew4aaJR7YNleU7PvgmnnB6ETBPnARP
         rdpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpV6FtlGJmbPG4Gl6DlIwigphMAcM3UTUgrO4+lemWs=;
        b=oU4Ll7fkHYjb+8thGA4dRzc+sIui0e/ubfDCl7VZNJg5cNxs4braNsNKotsG+voBWa
         rpfC01LkDc+aXi8JHiW+cQg7I5OJ6i7/25oaCs5IuQeW2XCtstn7AKh0YF9hrJODsGS3
         yOHij76fZD4/FiTaquVvzXvT12mr4LYTj/gSE9ghitzjhDNapPK7LoqPAkWibsTZaXxs
         VVsn67FUE4p0EwOBBiglwu/SaYL3teUM/c5BtVhn4pMJVayjxbBYZjQoxoScefJuvcfl
         idKSzcsqoWbP1Ezn4dQL8JBjOzdBUA9A+oQWiXwBMiw6fv2wiKU4CBwUPTM2rMG4sfS4
         jdXg==
X-Gm-Message-State: ANoB5pk/YTnUo9cdfHgabHFceOpCxdK5dGOtqvx7KPHVRlu5q/3WGrhK
	l9zCEpF5FSWtF6RAcf9/RmYAmA==
X-Google-Smtp-Source: AA0mqf6tDVB0CBWC9FT//8hYKJadLUBKQvQlKGnAljbWEkPH2FhmEmO8yFibfCHNjYT0HqGFeeM8yA==
X-Received: by 2002:a62:3882:0:b0:56b:9ce2:891f with SMTP id f124-20020a623882000000b0056b9ce2891fmr58857615pfa.43.1670003869850;
        Fri, 02 Dec 2022 09:57:49 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b00189812a5397sm5802867plb.180.2022.12.02.09.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 09:57:49 -0800 (PST)
Date: Fri, 02 Dec 2022 09:57:49 -0800 (PST)
X-Google-Original-Date: Fri, 02 Dec 2022 09:57:35 PST (-0800)
Subject: Re: [PATCH v2 1/5] cacheinfo: Use RISC-V's init_cache_level() as generic OF implementation
In-Reply-To: <20221121171217.3581004-2-pierre.gondois@arm.com>
CC: linux-kernel@vger.kernel.org, Ionela.Voinescu@arm.com, Rob.Herring@arm.com,
  pierre.gondois@arm.com, Conor Dooley <conor.dooley@microchip.com>, sudeep.holla@arm.com,
  catalin.marinas@arm.com, Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, rafael@kernel.org, lenb@kernel.org, Greg KH <gregkh@linuxfoundation.org>,
  jeremy.linton@arm.com, gshan@redhat.com, kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
  linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: pierre.gondois@arm.com
Message-ID: <mhng-386efd8d-215e-4e3a-bbaa-ea03c843ab96@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_095750_804690_7D5DC436 
X-CRM114-Status: GOOD (  23.08  )
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

On Mon, 21 Nov 2022 09:12:09 PST (-0800), pierre.gondois@arm.com wrote:
> RISC-V's implementation of init_of_cache_level() is following
> the Devicetree Specification v0.3 regarding caches, cf.:
> - s3.7.3 'Internal (L1) Cache Properties'
> - s3.8 'Multi-level and Shared Cache Nodes'
>
> Allow reusing the implementation by moving it.
>
> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  arch/riscv/kernel/cacheinfo.c | 39 +------------------------------
>  drivers/base/cacheinfo.c      | 44 +++++++++++++++++++++++++++++++++++
>  include/linux/cacheinfo.h     |  1 +
>  3 files changed, 46 insertions(+), 38 deletions(-)
>
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index 90deabfe63ea..440a3df5944c 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -115,44 +115,7 @@ static void fill_cacheinfo(struct cacheinfo **this_leaf,
>
>  int init_cache_level(unsigned int cpu)
>  {
> -	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
> -	struct device_node *np = of_cpu_device_node_get(cpu);
> -	struct device_node *prev = NULL;
> -	int levels = 0, leaves = 0, level;
> -
> -	if (of_property_read_bool(np, "cache-size"))
> -		++leaves;
> -	if (of_property_read_bool(np, "i-cache-size"))
> -		++leaves;
> -	if (of_property_read_bool(np, "d-cache-size"))
> -		++leaves;
> -	if (leaves > 0)
> -		levels = 1;
> -
> -	prev = np;
> -	while ((np = of_find_next_cache_node(np))) {
> -		of_node_put(prev);
> -		prev = np;
> -		if (!of_device_is_compatible(np, "cache"))
> -			break;
> -		if (of_property_read_u32(np, "cache-level", &level))
> -			break;
> -		if (level <= levels)
> -			break;
> -		if (of_property_read_bool(np, "cache-size"))
> -			++leaves;
> -		if (of_property_read_bool(np, "i-cache-size"))
> -			++leaves;
> -		if (of_property_read_bool(np, "d-cache-size"))
> -			++leaves;
> -		levels = level;
> -	}
> -
> -	of_node_put(np);
> -	this_cpu_ci->num_levels = levels;
> -	this_cpu_ci->num_leaves = leaves;
> -
> -	return 0;
> +	return init_of_cache_level(cpu);
>  }
>
>  int populate_cache_leaves(unsigned int cpu)
> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> index 4b5cd08c5a65..a4308b48dd3e 100644
> --- a/drivers/base/cacheinfo.c
> +++ b/drivers/base/cacheinfo.c
> @@ -224,8 +224,52 @@ static int cache_setup_of_node(unsigned int cpu)
>
>  	return 0;
>  }
> +
> +int init_of_cache_level(unsigned int cpu)
> +{
> +	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
> +	struct device_node *np = of_cpu_device_node_get(cpu);
> +	struct device_node *prev = NULL;
> +	int levels = 0, leaves = 0, level;
> +
> +	if (of_property_read_bool(np, "cache-size"))
> +		++leaves;
> +	if (of_property_read_bool(np, "i-cache-size"))
> +		++leaves;
> +	if (of_property_read_bool(np, "d-cache-size"))
> +		++leaves;
> +	if (leaves > 0)
> +		levels = 1;
> +
> +	prev = np;
> +	while ((np = of_find_next_cache_node(np))) {
> +		of_node_put(prev);
> +		prev = np;
> +		if (!of_device_is_compatible(np, "cache"))
> +			break;
> +		if (of_property_read_u32(np, "cache-level", &level))
> +			break;
> +		if (level <= levels)
> +			break;
> +		if (of_property_read_bool(np, "cache-size"))
> +			++leaves;
> +		if (of_property_read_bool(np, "i-cache-size"))
> +			++leaves;
> +		if (of_property_read_bool(np, "d-cache-size"))
> +			++leaves;
> +		levels = level;
> +	}
> +
> +	of_node_put(np);
> +	this_cpu_ci->num_levels = levels;
> +	this_cpu_ci->num_leaves = leaves;
> +
> +	return 0;
> +}
> +
>  #else
>  static inline int cache_setup_of_node(unsigned int cpu) { return 0; }
> +int init_of_cache_level(unsigned int cpu) { return 0; }
>  #endif
>
>  int __weak cache_setup_acpi(unsigned int cpu)
> diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
> index 00b7a6ae8617..ff0328f3fbb0 100644
> --- a/include/linux/cacheinfo.h
> +++ b/include/linux/cacheinfo.h
> @@ -80,6 +80,7 @@ struct cpu_cacheinfo {
>
>  struct cpu_cacheinfo *get_cpu_cacheinfo(unsigned int cpu);
>  int init_cache_level(unsigned int cpu);
> +int init_of_cache_level(unsigned int cpu);
>  int populate_cache_leaves(unsigned int cpu);
>  int cache_setup_acpi(unsigned int cpu);
>  bool last_level_cache_is_valid(unsigned int cpu);

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
