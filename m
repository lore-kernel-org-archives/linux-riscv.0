Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF04FC001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 13:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dCijBQ8hEr+jP/EZKkm7a6ksKgsPMEzs8Ma8eg9Zjbc=; b=3Bl4JrFjdaTOuw
	97dEVyPJZMN7n6mglFivUSKzQ62ISGWEBAPzbPwd6UEMH8e+B+LQMdiQCWp4AlP8thIozI76btBqt
	OTh+3lpgrRrAlgtWsHlkySmUlzHCGzMjafIs8/AuD6t5n512XG0e/tGJrN6BU8xaWKAWf29XGBOSD
	e2CdFyBvFPi6m+PuxhLPQL2vCkMgHkV2sVUGS4a2cjOWYaQQWV6EWarHOgoE0WPoaEbZSIjmdAp1w
	Gg6a8FwkG5y/UH/1d7zVQgjsx+Sy4Pf3Mn2owE6OonKNWchgSZYJYknlA2zrvgccc3p//p3Iv6sZZ
	gJ5gByicC4+8uKsQLmfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPNaF-003XYY-2Q;
	Fri, 28 Jul 2023 13:32:43 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPNaC-003XXc-2y
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 13:32:42 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b9ab1725bbso33115651fa.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 06:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690551157; x=1691155957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yfPWFATzg2F/vGl+Rugnp8J3pij37XeUvwzh4yvIFCk=;
        b=SjWIgG6+pK5Kii8Yby+9NO7xIGyFBTEUn4+5wU/eQ5I0TU3hGh3GWvV9Scui3YYgFS
         AKpFsMUSp/P/TYQRDsiVUHZLauCM1MHhu2AkYu24OezBCBiGfpycIhgdfy/lx01Q8ia8
         7uNmyrFh2/3iUkHZmihu706TB82aCptMxg2JYUJ2EE+zFVkcWqKyzYjYKmf6dCaSJ/KV
         ozszfhbwpEQXwR66f9qjQPwxFF6KCTPtQ1HO3Qb8lDbpMCmmmYmGSBW01NcP6jXg49vy
         tVOTwgYAsDmTDYDWHz8TMg9gRXcZJ29nzcG4/l1+BM7IBkWJdefiASqT3FJht9c0rWsr
         cLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690551157; x=1691155957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfPWFATzg2F/vGl+Rugnp8J3pij37XeUvwzh4yvIFCk=;
        b=e23XAy7SpqmKEQtP05wcR86HU/j01z8pvmpaVxJYkxpMqlYpDFvJjX5ykOyDmXshtK
         FI0RG3C5T0EVwUFgkqVxBp2GzNZXjwhyGASDUfxROM8fvneVSz78h6aFyFupiZ4Q4KN3
         xl9ZgA9fOdBrhBurtSptE+h4jTAs71FOjaPE9G67KMOyjVOG+6Kaj2fF8ZcbDIZjwI2Q
         VNq+ZonhVgbsqVnOTSwAMwulDuKesqsVyIIlatCq18ihbferTSNh2R2lqU3x9ezCWjFZ
         HrlfMp5yOgEu+JDVvGbsmA/t+Gh8V4ZproOKhrZ7kKRt7bAXzy1lhgSYf6wspQ3/kEnx
         93hA==
X-Gm-Message-State: ABy/qLZEtY+Yi0NIyV2gd3zPb8nWXJqsoetSJaUNDxJsbe7yP0HSxLeT
	gHt7pkat3YkR4pItV6xAHmrUMQ==
X-Google-Smtp-Source: APBJJlHNHIiJYvgDvTPgNH06lQmbcxMDN4FEykHkmvVCH47PAaXmVTITjQ2d4Z+FSuew7Waq+UFM2g==
X-Received: by 2002:a2e:9444:0:b0:2b9:bbf5:7c6 with SMTP id o4-20020a2e9444000000b002b9bbf507c6mr1825736ljh.43.1690551156738;
        Fri, 28 Jul 2023 06:32:36 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id h19-20020a17090634d300b0098e422d6758sm2054351ejb.219.2023.07.28.06.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 06:32:36 -0700 (PDT)
Date: Fri, 28 Jul 2023 15:32:35 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Vincent Chen <vincent.chen@sifive.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] riscv: Make __flush_tlb_range() loop over pte
 instead of flushing the whole tlb
Message-ID: <20230728-f2cd8ddd252c2ece2e438790@orel>
References: <20230727185553.980262-1-alexghiti@rivosinc.com>
 <20230727185553.980262-4-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230727185553.980262-4-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_063240_960874_AC4FF278 
X-CRM114-Status: GOOD (  26.37  )
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

On Thu, Jul 27, 2023 at 08:55:52PM +0200, Alexandre Ghiti wrote:
> Currently, when the range to flush covers more than one page (a 4K page or
> a hugepage), __flush_tlb_range() flushes the whole tlb. Flushing the whole
> tlb comes with a greater cost than flushing a single entry so we should
> flush single entries up to a certain threshold so that:
> threshold * cost of flushing a single entry < cost of flushing the whole
> tlb.
> 
> This threshold is microarchitecture dependent and can/should be
> overwritten by vendors.
> 
> Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/mm/tlbflush.c | 41 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 3e4acef1f6bc..8017d2130e27 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -24,13 +24,48 @@ static inline void local_flush_tlb_page_asid(unsigned long addr,
>  			: "memory");
>  }
>  
> +/*
> + * Flush entire TLB if number of entries to be flushed is greater
> + * than the threshold below. Platforms may override the threshold
> + * value based on marchid, mvendorid, and mimpid.
> + */
> +static unsigned long tlb_flush_all_threshold __read_mostly = 64;
> +
> +static void local_flush_tlb_range_threshold_asid(unsigned long start,
> +						 unsigned long size,
> +						 unsigned long stride,
> +						 unsigned long asid)
> +{
> +	u16 nr_ptes_in_range = DIV_ROUND_UP(size, stride);
> +	int i;
> +
> +	if (nr_ptes_in_range > tlb_flush_all_threshold) {
> +		if (asid != -1)
> +			local_flush_tlb_all_asid(asid);
> +		else
> +			local_flush_tlb_all();
> +		return;
> +	}
> +
> +	for (i = 0; i < nr_ptes_in_range; ++i) {
> +		if (asid != -1)
> +			local_flush_tlb_page_asid(start, asid);
> +		else
> +			local_flush_tlb_page(start);
> +		start += stride;
> +	}
> +}
> +
>  static inline void local_flush_tlb_range(unsigned long start,
>  		unsigned long size, unsigned long stride)
>  {
>  	if (size <= stride)
>  		local_flush_tlb_page(start);
> -	else
> +	else if (size == (unsigned long)-1)

The more we scatter this -1 around, especially now that we also need to
cast it, the more I think we should introduce a #define for it.

>  		local_flush_tlb_all();
> +	else
> +		local_flush_tlb_range_threshold_asid(start, size, stride, -1);
> +
>  }
>  
>  static inline void local_flush_tlb_range_asid(unsigned long start,
> @@ -38,8 +73,10 @@ static inline void local_flush_tlb_range_asid(unsigned long start,
>  {
>  	if (size <= stride)
>  		local_flush_tlb_page_asid(start, asid);
> -	else
> +	else if (size == (unsigned long)-1)
>  		local_flush_tlb_all_asid(asid);
> +	else
> +		local_flush_tlb_range_threshold_asid(start, size, stride, asid);
>  }
>  
>  static void __ipi_flush_tlb_all(void *info)
> -- 
> 2.39.2
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
