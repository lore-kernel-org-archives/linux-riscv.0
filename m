Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4B0C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 07:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1PsHh61mwwIKdhYYqKkitDXuLyYwEealLC5TeGR/X48=; b=0bO1aaryBDfMSL
	LjXs5iAm0pY8VH2Nn1w2sQSuQNxK+5Qj4w2cwpfvYY4TGmToADXo63uodamXw4PJ1h7e0JSjxy9GV
	Sf5LPrmTpwWVh0mO8ksreiPuTHU+xPQ4bW2cbU91kRGq6nYFqYy0HwtP5+QOtEm63Kn71Rmivvtcx
	ufl25ZiI5bPG+ymGcfS5VFc5CYef31vB9Lax1i2JtzAzSbV7lh0xQg3+vjJSb96yg33alOz9amiwZ
	ubUyQxAo9++KbcaNPogmliVXKSNKd+43rRvVxYom5eGGc2ia1thfo2JI20Mt9bczgBh4A410sUsMH
	to9JaV30C/EZeo22ZtuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4d6m-009Lpu-FT; Mon, 12 Dec 2022 07:20:16 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4d6e-009Lk3-Dh
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 07:20:14 +0000
Received: by mail-ej1-x62e.google.com with SMTP id n20so25690188ejh.0
        for <linux-riscv@lists.infradead.org>; Sun, 11 Dec 2022 23:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qlyToiR3VH2ULJATIse4FD7Hptset0LZG6mRlnpWpl4=;
        b=BY3IKT4gxYWFip2VIA2eFtCGmseqdKffxwNWhaZwFTmDcS+uHXwtARv6OFjY3GS6oJ
         +reiVN5CqHFIIu6UIF6qO42R3f+JRpIR29SKbJNmhKEs0W2LmjOUIZMPimPOuvLhlo93
         vaoXOc0PB6kkO5mXmUA6kKF6BuJzKCuq2PZLA5uvrE/NVbCXqxr1eygX6OobuoroegRY
         h95s4FfrZcKnX5FlHDmJSYHoB6bTitS8WKXwPFnXhTsYzBzjxdLodW+KQ38WBhRdq1an
         PjAYOpBo4glRLXtLr4mC3Xw6iWLFe5VWTSVPmaPqRlSRyzD1HV63yM0XGM/4AW6LyKPS
         FxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlyToiR3VH2ULJATIse4FD7Hptset0LZG6mRlnpWpl4=;
        b=gDkXqT8+qaYQBfQGplJxEgmRofJQwVGPNC1WCXZ/MFa0l6mVbaa5FcIVekYYygCVT6
         Yo/eaymHGI19upOcJOfg+M0Q5ZBrlORvCMke0F1RXdIvhhge0qnM1UcUDa1LeZybr6hH
         6Sn7UObZmsItQOZopxEVHUd/Z7QMdEc11lddItNcJ5JdNxySYOBJJcZOg0iqc7C17GCD
         H05CZXIEpbXdTygWifcD4Z5neOH/7BpZGqyQ04DosBkgxSG+rwlZAF5hXxo1iF9AYhK/
         rTtyFwYoDhQ98eS/XVcEIq4R2+LJrArn95p0TMzUXTC+iWtaa2mZfOdazTTUIRmqjKR+
         MFeQ==
X-Gm-Message-State: ANoB5pmt6mqkGBw2ccrYxuSGKw4sYcmD8BZvkTvLJkNaVJl/hdlf3NNl
	/2UVdTuU3+ebWpNQVyK8KDRNPg==
X-Google-Smtp-Source: AA0mqf428QrgPD63ouPeRekMjK1l3c5DUUW93+6w423IELqP+7cUI3WfocsMkqqkrFRlSIsknTqS2A==
X-Received: by 2002:a17:906:b159:b0:78d:f454:ba46 with SMTP id bt25-20020a170906b15900b0078df454ba46mr12548957ejb.69.1670829606391;
        Sun, 11 Dec 2022 23:20:06 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id 11-20020a170906308b00b007b43ef7c0basm2893251ejv.134.2022.12.11.23.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 23:20:06 -0800 (PST)
Date: Mon, 12 Dec 2022 08:20:04 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: panqinglin2020@iscas.ac.cn
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
	xuyinan@ict.ac.cn, conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v10 3/3] riscv: mm: support Svnapot in huge vmap
Message-ID: <20221212072004.jk2h3xspbrgf7hlz@kamzik>
References: <20221212065526.805233-1-panqinglin2020@iscas.ac.cn>
 <20221212065526.805233-4-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221212065526.805233-4-panqinglin2020@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221211_232012_204124_14106C0B 
X-CRM114-Status: GOOD (  18.96  )
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

On Mon, Dec 12, 2022 at 02:55:26PM +0800, panqinglin2020@iscas.ac.cn wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> As HAVE_ARCH_HUGE_VMAP and HAVE_ARCH_HUGE_VMALLOC is supported, we can
> implement arch_vmap_pte_range_map_size and arch_vmap_pte_supported_shift
> for Svnapot to support huge vmap about napot size.
> 
> It can be tested by huge vmap used in pci driver. Huge vmalloc with svnapot
> can be tested by test_vmalloc with [1] applied, and probe this
> module to run fix_size_alloc_test with use_huge true.
> 
> [1]https://lore.kernel.org/all/20221212055657.698420-1-panqinglin2020@iscas.ac.cn/
> 
> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> diff --git a/arch/riscv/include/asm/vmalloc.h b/arch/riscv/include/asm/vmalloc.h
> index 48da5371f1e9..6f7447d563ab 100644
> --- a/arch/riscv/include/asm/vmalloc.h
> +++ b/arch/riscv/include/asm/vmalloc.h
> @@ -17,6 +17,65 @@ static inline bool arch_vmap_pmd_supported(pgprot_t prot)
>  	return true;
>  }
>  
> -#endif
> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
> +#include <linux/pgtable.h>
>  
> +#define arch_vmap_pte_range_map_size arch_vmap_pte_range_map_size
> +static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr, unsigned long end,
> +							 u64 pfn, unsigned int max_page_shift)
> +{
> +	unsigned long size, order;
> +	unsigned long map_size = PAGE_SIZE;

Missed this conversion to reverse-xmas tree.

> +
> +	if (!has_svnapot())
> +		return map_size;
> +
> +	for_each_napot_order_rev(order) {
> +		if (napot_cont_shift(order) > max_page_shift)
> +			continue;
> +
> +		size = napot_cont_size(order);
> +		if (end - addr < size)
> +			continue;
> +
> +		if (!IS_ALIGNED(addr, size))
> +			continue;
> +
> +		if (!IS_ALIGNED(PFN_PHYS(pfn), size))
> +			continue;
> +
> +		map_size = size;
> +		break;
> +	}
> +
> +	return map_size;
> +}
> +
> +#define arch_vmap_pte_supported_shift arch_vmap_pte_supported_shift
> +static inline int arch_vmap_pte_supported_shift(unsigned long size)
> +{
> +	int shift = PAGE_SHIFT;
> +	unsigned long order;
> +
> +	if (!has_svnapot())
> +		return shift;
> +
> +	WARN_ON_ONCE(size >= PMD_SIZE);
> +
> +	for_each_napot_order_rev(order) {
> +		if (napot_cont_size(order) > size)
> +			continue;
> +
> +		if (!IS_ALIGNED(size, napot_cont_size(order)))
> +			continue;
> +
> +		shift = napot_cont_shift(order);
> +		break;
> +	}
> +
> +	return shift;
> +}
> +
> +#endif /* CONFIG_RISCV_ISA_SVNAPOT */
> +#endif /* CONFIG_HAVE_ARCH_HUGE_VMAP */
>  #endif /* _ASM_RISCV_VMALLOC_H */
> -- 
> 2.37.4
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
