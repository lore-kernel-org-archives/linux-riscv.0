Return-Path: <SRS0=x9rf=L6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC82CC07E99
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jul 2021 02:51:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8622561466
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jul 2021 02:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8622561466
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=3SER18fJFPBA4oFGOs4gqSVpSZaN4vsukQWP+PoXaqQ=; b=UuFZ6PhN1P1wP2pAz0U4DrX9jq
	kXaCzl7bI3v7hwq0QHdLp5+Hc2tve1QYOjSlZXykXxM/XYdAa9PUij3/sg3zgTz80pH62rDCTkAqJ
	SiAQB8rxN1ug/joQsAoVSEsLhLfgblq42S/QBc+jNOjWQXEVsRLBnFda+Q85fQzxLcWoSJJ4XEz9f
	OpCssW9W1QOxqIR70oXgAC8Hh2h07H1whnIjsT9htsBzS6zYDq8jbd6oA7sUzbljsKqeeWbbc5mEV
	Zc2u6HNgRpvWGT371NIQW/z5z4WujNjlfwyY2p4XyWfOi6IzihhKjDte5hB6uPTQLwPgorh4MzW9x
	6Dc/gQUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0bAq-00AB4S-S7; Tue, 06 Jul 2021 02:51:00 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0bAl-00AB34-Of
 for linux-riscv@lists.infradead.org; Tue, 06 Jul 2021 02:50:59 +0000
Received: by mail-pg1-x534.google.com with SMTP id a2so20056157pgi.6
 for <linux-riscv@lists.infradead.org>; Mon, 05 Jul 2021 19:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=aAumG8loxWBg0YCddQ8wmZZlwLMJsBOBHpIVAqqaaHI=;
 b=uI+qlQC8Q7cUkNM0Ne6nIs5Bgn8RbRmM47Q7douT1F70vKi/8LtSAXR7G01yRIKt+L
 EsS4gtkZ5smlA0Rfhu0oaeZdWM/B9WLvkdxCix6VzQCUVBqMDJ1cKlfgsoz3bqpFvnUx
 oJD32G0amzaN/zDp3ZLSenOTYbcukOrxnLS09rZrcK9M7r6tZ7SQYADc8JaS+KfmLlq+
 Givg1ZD4eN75FUSMRneBUbbM55gtcs5iT3o1d1/iXPxifSqTS1t4m1zffIe4qn6moBRa
 qMyi8s7i2vH7zZPMpw6wvsnjyrrJczF/4SV+ws18YmV6vTsouLTDHXhpDgvr7hiMpigJ
 z1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=aAumG8loxWBg0YCddQ8wmZZlwLMJsBOBHpIVAqqaaHI=;
 b=pkmuf69RP9UK6UAhuWmCRPA2Ybe5dmdZ25zOgXbp54ndXDdCtLIs5hjr0GCcp9F0iA
 Ma466sYfAstosKe8C112y5KKPmhldvmNvqgkp/Uq6TszaO2yA7vv3+XRa2Um/AHhSkBK
 LEEPzZSF/9zZW5QySOj74yzKxOW7jx8ZK4PfsFOySR0lJoB4xsco/68atiQUwKZL+lEB
 eSMXbLnYVV/OSRR+eFJqe8rkSM7cQ1GvlSVPrv2W2WE0AZU1PZLWG75/LNqIbhmJyDkq
 6qD4m3hhykAhzqThsC77gioYRnPdtwJsgi6KmOqPfAnYd8umFbXEiXYKQPI6g9YBFoeQ
 t/uQ==
X-Gm-Message-State: AOAM5311UULo/mqhLHhHwVS8E+Yq01JQTBo82KH/IrirS6uH5z/5+ONz
 lQuy5vZooILRItebnTibrExRqw==
X-Google-Smtp-Source: ABdhPJxLWWPlrfKlCz1SsK6JAmb63yvPAVRCWENawgnzp5NCG+ImxvO8x30bEQRsX6rJbw/j3IwRng==
X-Received: by 2002:a63:7d5:: with SMTP id 204mr18579496pgh.309.1625539854984; 
 Mon, 05 Jul 2021 19:50:54 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 92sm831957pjv.29.2021.07.05.19.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 19:50:54 -0700 (PDT)
Date: Mon, 05 Jul 2021 19:50:54 -0700 (PDT)
X-Google-Original-Date: Mon, 05 Jul 2021 19:32:45 PDT (-0700)
Subject: Re: [PATCH v2 -next] riscv: mm: fix build errors caused by mk_pmd()
In-Reply-To: <20210617095831.2398438-1-sunnanyong@huawei.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, 
 wangkefeng.wang@huawei.com, sunnanyong@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: sunnanyong@huawei.com
Message-ID: <mhng-baa33662-8457-4b94-8307-87f326fefe36@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_195055_843625_B20C14E9 
X-CRM114-Status: GOOD (  20.09  )
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

On Thu, 17 Jun 2021 02:58:31 PDT (-0700), sunnanyong@huawei.com wrote:
> With "riscv: mm: add THP support on 64-bit", mk_pmd() function
> introduce build errors,
> 1.build with CONFIG_ARCH_RV32I=y:
> arch/riscv/include/asm/pgtable.h: In function 'mk_pmd':
> arch/riscv/include/asm/pgtable.h:513:9: error: implicit declaration of function 'pfn_pmd';
>  did you mean 'pfn_pgd'? [-Werror=implicit-function-declaration]
>
> 2.build with CONFIG_SPARSEMEM=y && CONFIG_SPARSEMEM_VMEMMAP=n
> arch/riscv/include/asm/pgtable.h: In function 'mk_pmd':
> include/asm-generic/memory_model.h:64:14: error: implicit declaration of function 'page_to_section';
>  did you mean 'present_section'? [-Werror=implicit-function-declaration]
>
> Move the definition of mk_pmd to pgtable-64.h to fix the first error.
> Use macro definition instead of inline function for mk_pmd
> to fix the second problem. It is similar to the mk_pte macro.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Nanyong Sun <sunnanyong@huawei.com>
> ---
> Changes in v2:
> - Move mk_pmd to pgtable-64.h
> ---
>  arch/riscv/include/asm/pgtable-64.h | 2 ++
>  arch/riscv/include/asm/pgtable.h    | 5 -----
>  2 files changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> index 1439017b16f8..228261aa9628 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -79,6 +79,8 @@ static inline unsigned long _pmd_pfn(pmd_t pmd)
>  	return pmd_val(pmd) >> _PAGE_PFN_SHIFT;
>  }
>
> +#define mk_pmd(page, prot)    pfn_pmd(page_to_pfn(page), prot)
> +
>  #define pmd_ERROR(e) \
>  	pr_err("%s:%d: bad pmd %016lx.\n", __FILE__, __LINE__, pmd_val(e))
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 5ae51e6bd5ab..6bc2582f82e9 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -516,11 +516,6 @@ static inline unsigned long pmd_pfn(pmd_t pmd)
>  	return ((__pmd_to_phys(pmd) & PMD_MASK) >> PAGE_SHIFT);
>  }
>
> -static inline pmd_t mk_pmd(struct page *page, pgprot_t prot)
> -{
> -	return pfn_pmd(page_to_pfn(page), prot);
> -}
> -
>  static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
>  {
>  	return pte_pmd(pte_modify(pmd_pte(pmd), newprot));

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
