Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4582EC4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 13:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vd4Zyq9BuGgeWaLl/pcTV4HPGOCQZAQ0P+7+zRDDETg=; b=FSMBdAb6p0aLkV
	+MOz7HIgxtHe9+fKfpF07F/bsBaI76tbeSPllRKtvKlyJUy+ZPjlIgNqCnEb3Eh06QBF8+vdbZRiU
	BKGrIGNuGvwFxlkkKGHZsOLD8Vw7gXLvtrD25RqJ89rEcKHbZNsQYIGlVhwQHBCnMa7fSsIN5x704
	lBEMNj0YsP8LCuQdagWt/9tWVVVGdtZLdMyW0YkUK+IzFQ+/yesKP1gJr1w0fUeHYV2mLhS8dUT+7
	5u5ECFcJiU5LXUcn7JzDBV224/R7VWimBBsSQx7pBVf58+QVratOsZkTtaclr7m8E/CGdddLU7yKT
	XHQPfGwT/s22QQhyqoWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p00Vd-008kx3-6k; Tue, 29 Nov 2022 13:18:49 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p00VZ-008kwU-Py
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 13:18:47 +0000
Received: by mail-ej1-x62c.google.com with SMTP id ho10so33729131ejc.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 05:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K7o6l2EmZdCkceUITAPp1SqZ6bx5q8H+55ImVCCUnC0=;
        b=Mp4bjDyd2p/oJbagmAHfFlcaTKzR9r1cKaG+qayaTGKrjhEYflAwEELTPlfTdWr3AF
         S5z1nib8c3wnfMXAlDM+EtbaJeH7Ctz4PjJJjLavyRTYgEPSR71DIt04p1qgoTauCBIx
         DgqEjscasEOEwzenJZCDpvzzfic/kb9mWrsNrTJmmqpsN6Z/R1tS4Bni+sUFOf5D+7rQ
         nW6QI0CPJiHyDCgnXoZMz75lIuBXCWWDfgEnT6iSzCeQjYdq74YuV9CE3dv5L0MFo3N0
         Pc90dvatvtLxgYCmX3qCaS01q/+L5jp0lD0tUNsI0df1nGP+7LKNnk1xZultlkAhj7O+
         BSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7o6l2EmZdCkceUITAPp1SqZ6bx5q8H+55ImVCCUnC0=;
        b=ubGTYl6k91sVRvdq09Qyp/luhCMg48iKqc5zBlbh0J8hjxF0JFEu5tKp9Jf/E39LRV
         OsEL5ArPAzG7CMhtjjzPiYdTIIWXnFpYstu7DjmAVTejB2sizA4spRt27RBeM69dQjVG
         lsKWBm5A9GYCg+wWBPTmp+LtzdVuNhxkosLUzQxIToHMS9uMFKybvRROfUBnGbFes6vz
         9SstMSGNBpLwgDdwY1Fp0I3slVYwmVjTuyDHYwLpYx/cbMbmXL2f5JS9LrsJe4FaqAt+
         hYnzWtfJZixhZ9t7u2uHllR2BdnIqbFDUWFUIysee2sxIFduS0mhImYGzCxD6Sh0clAi
         SLsQ==
X-Gm-Message-State: ANoB5pkUZVhoVhYdTAhOF3ZqbE6HDTqahxTvxPkPROLiCwZmo7XaL4Pn
	R5HCCej2r1e8oKdWl7+z1LRqnA==
X-Google-Smtp-Source: AA0mqf6lRPCmozrHDqDViKzs8j5bSGbVWpfFkBlTliOyb1Z2xC3o/U1RJstcE9IjoZYag8eEGTtmFA==
X-Received: by 2002:a17:906:40f:b0:7bb:8647:e0e4 with SMTP id d15-20020a170906040f00b007bb8647e0e4mr22631210eja.652.1669727921439;
        Tue, 29 Nov 2022 05:18:41 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906200a00b00781dbdb292asm6136197ejo.155.2022.11.29.05.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 05:18:41 -0800 (PST)
Date: Tue, 29 Nov 2022 14:18:39 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: panqinglin2020@iscas.ac.cn
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
	xuyinan@ict.ac.cn, conor@kernel.org, alex@ghiti.fr
Subject: Re: [PATCH v8 3/3] riscv: mm: support Svnapot in huge vmap
Message-ID: <20221129131839.axu6yvrv3kum6pdc@kamzik>
References: <20221128022719.328770-1-panqinglin2020@iscas.ac.cn>
 <20221128022719.328770-4-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128022719.328770-4-panqinglin2020@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_051845_865358_2FE3E9AF 
X-CRM114-Status: GOOD (  21.47  )
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

On Mon, Nov 28, 2022 at 10:27:19AM +0800, panqinglin2020@iscas.ac.cn wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> As HAVE_ARCH_HUGE_VMAP and HAVE_ARCH_HUGE_VMALLOC is supported, we can
> implement arch_vmap_pte_range_map_size and arch_vmap_pte_supported_shift
> for Svnapot to support huge vmap about napot size.
> 
> It can be tested by huge vmap used in pci driver. Huge vmalloc with svnapot
> can be tested by changing test_vmalloc module to use vmalloc_huge in it,
> and probe this module to run tests.

It'd be nice to get your changes to test_vmalloc posted where the switch
between vmalloc and vmalloc_huge is controlled by a module parameter.

> 
> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> diff --git a/arch/riscv/include/asm/vmalloc.h b/arch/riscv/include/asm/vmalloc.h
> index 48da5371f1e9..99b89ab445e2 100644
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
> +		if (size & napot_cont_mask(order))
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

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
