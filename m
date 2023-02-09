Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C4AC05027
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 10:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vtnkNP3IuINwtN4WduccEIoXWEFIrSzPTd6jCxdpFQc=; b=WB5VtiDl4C0rTa
	yO7dn+XYdu16wZcqQpFOgUWEYNdUdbBlfBoEVEtfkWOrbElU0azsz81Sf/1soABafNe8eODghlh+E
	BsZ/ObvZn3ZPFzNQHK4cEgYoNLeuJNFLHISrj6tkoGvdcc0LlkWCJxl27uZoKjTFkjm1Fl7vUqdUP
	MnZtfv6yGmI3fwF92QYrQwYcBrtbqgmof0Kx5hd3u2WfqYd/wzpSQurN3InZtF0aNxDTucV6EEBvn
	DAFjMSroP5nspQHEojguSn+Oj3fN8xSpL7rYxs9C3Q6uUic4HJqK649IeH+p2VMcVbYErCHH+Sdvh
	CksSBYh3btuyUeArB2Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ3yN-000zYI-Tg; Thu, 09 Feb 2023 10:16:11 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ3yJ-000zX4-4R
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 10:16:10 +0000
Received: by mail-ej1-x631.google.com with SMTP id qb15so2775955ejc.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 02:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SsuY4/dlaY+xsAvT+2O3B0BVJibVYYbxYPZTGFQ8Gfg=;
        b=Hr9LjsJuIxRTeboIiSQsj4ECWW4nGHo+boN72hgUMZyCQqECphUU3ahN5/DKTVk5oM
         KD4yy/OLQQ8GIG49kDR61Rc/jqKXP6dUQpAT/8UgwXEhyIll3l1uKBos4AeIdUOwzSS8
         EdsQ2W1TF2n1Z4mantBwmqmc/eW3VYKzkzLzAOWp6FO4RISwS1CMRGrOtNvlhUlsjJI0
         PjF1y0LRO1TbuoxAF3QLUTeXN9BtwZJ+oWNCI245bHA+0dMRiPgqsGI9tpp4n/ms6czm
         C6vpAhxGUUOy6wt7qOIAdTFJmi76ZGZxvqsdojgE9PHx5F+oD0RMWsI7vviZ176QFAMP
         TSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SsuY4/dlaY+xsAvT+2O3B0BVJibVYYbxYPZTGFQ8Gfg=;
        b=AnYCUnbrOMY5MX37gK8tsV+PYxldvstLDrc4bgJJhwWySJW1w/Qk9EeukOqm3Uiqxr
         szLZhTT0Oz0sqDf/Mu2S2II+M7aqXLLX1pVS4Lq/dz0P3nCgJkMyakbl3WcukOrQM6wx
         lPH6s9JEXHir7L0w5KK3IZglIc7SuSnu4NBhWYepOp5I5/yf0INa8+c4rGNedqrb5JNE
         p7zYmdv62UkcBKvVqVfSerIMH1ZWM5w7olBW4dOCPRkTxPgzhryUF5tbaW36SgFZb2Ru
         qM62Ncb0DmHF1tBUlrNb/1LtApsmnbHZLIt17Srm33u9+jAVWtJHxsvI6ifEoooTxWz9
         w6hg==
X-Gm-Message-State: AO0yUKX4jneRQTHJJXVnlMDBnfIgV5U6fsdaK5N03+oJnWpGUqKl/O9F
	gytY2GXx22yoqY/X7G4FJVXFvA==
X-Google-Smtp-Source: AK7set8zwCXk7ou4WjPkpWhNVVoiV7X7Zh0jL0dcTYJyLQ+nmFSPIAoNlXo8vJTlSy2dczLK8y2HGg==
X-Received: by 2002:a17:906:5856:b0:86f:d0c9:4bdd with SMTP id h22-20020a170906585600b0086fd0c94bddmr11171542ejs.27.1675937763203;
        Thu, 09 Feb 2023 02:16:03 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id x24-20020a170906135800b00872a726783dsm658252ejb.217.2023.02.09.02.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 02:16:02 -0800 (PST)
Date: Thu, 9 Feb 2023 11:16:01 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Qinglin Pan <panqinglin00@gmail.com>
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
	xuyinan@ict.ac.cn, conor@kernel.org,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: Re: [PATCH v12 1/3] riscv: mm: modify pte format for Svnapot
Message-ID: <20230209101601.ppygtfm3kuk46k3g@orel>
References: <20230209035343.15282-1-panqinglin00@gmail.com>
 <20230209035343.15282-2-panqinglin00@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230209035343.15282-2-panqinglin00@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_021607_199386_59783D5E 
X-CRM114-Status: GOOD (  33.82  )
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

On Thu, Feb 09, 2023 at 11:53:41AM +0800, Qinglin Pan wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> Add one alternative to enable/disable svnapot support, enable this static
> key when "svnapot" is in the "riscv,isa" field of fdt and SVNAPOT compile
> option is set. It will influence the behavior of has_svnapot. All code
> dependent on svnapot should make sure that has_svnapot return true firstly.
> 
> Modify PTE definition for Svnapot, and creates some functions in pgtable.h
> to mark a PTE as napot and check if it is a Svnapot PTE. Until now, only
> 64KB napot size is supported in spec, so some macros has only 64KB version.
> 
> Signed-off-by: Qinglin Pan <panqinglin00@gmail.com>
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 7c814fbf9527..5b051ca93fa7 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -397,6 +397,25 @@ config RISCV_ISA_C
>  
>  	  If you don't know what to do here, say Y.
>  
> +config RISCV_ISA_SVNAPOT
> +	bool "SVNAPOT extension support"
> +	depends on 64BIT && MMU
> +	select RISCV_ALTERNATIVE
> +	default y
> +	help
> +	  Allow kernel to detect the SVNAPOT ISA-extension dynamically at boot
> +	  time and enable its usage.
> +
> +	  The SVNAPOT extension is used to mark contiguous PTEs as a range
> +	  of contiguous virtual-to-physical translations for a naturally
> +	  aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
> +	  size. When HUGETLBFS is also selected this option unconditionally
> +	  allocates some memory for each NAPOT page size supported by the kernel.
> +	  When optimizing for low memory consumption and for platforms without
> +	  the SVNAPOT extension, it may be better to say N here.
> +
> +	  If you don't know what to do here, say Y.
> +
>  config RISCV_ISA_SVPBMT
>  	bool "SVPBMT extension support"
>  	depends on 64BIT && MMU
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index ee9c80fe0062..6e368d3f6631 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -43,10 +43,11 @@
>  #define RISCV_ISA_EXT_SSCOFPMF         26
>  #define RISCV_ISA_EXT_SSTC             27
>  #define RISCV_ISA_EXT_SVINVAL          28
> -#define RISCV_ISA_EXT_SVPBMT           29
> -#define RISCV_ISA_EXT_ZBB              30
> -#define RISCV_ISA_EXT_ZICBOM           31
> -#define RISCV_ISA_EXT_ZIHINTPAUSE      32
> +#define RISCV_ISA_EXT_SVNAPOT          29
> +#define RISCV_ISA_EXT_SVPBMT           30
> +#define RISCV_ISA_EXT_ZBB              31
> +#define RISCV_ISA_EXT_ZICBOM           32
> +#define RISCV_ISA_EXT_ZIHINTPAUSE      33

We shouldn't reshuffle this every time we add a new extension, as that's
too error-prone. I'll send a patch to clarify that this list doesn't need
to be alphabetical.

>  
>  #ifndef __ASSEMBLY__
>  
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index 9f432c1b5289..24a3dd265183 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -16,11 +16,6 @@
>  #define PAGE_SIZE	(_AC(1, UL) << PAGE_SHIFT)
>  #define PAGE_MASK	(~(PAGE_SIZE - 1))
>  
> -#ifdef CONFIG_64BIT
> -#define HUGE_MAX_HSTATE		2
> -#else
> -#define HUGE_MAX_HSTATE		1
> -#endif
>  #define HPAGE_SHIFT		PMD_SHIFT
>  #define HPAGE_SIZE		(_AC(1, UL) << HPAGE_SHIFT)
>  #define HPAGE_MASK              (~(HPAGE_SIZE - 1))
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> index 42a042c0e13e..7a5097202e15 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -78,6 +78,40 @@ typedef struct {
>   */
>  #define _PAGE_PFN_MASK  GENMASK(53, 10)
>  
> +/*
> + * [63] Svnapot definitions:
> + * 0 Svnapot disabled
> + * 1 Svnapot enabled
> + */
> +#define _PAGE_NAPOT_SHIFT	63
> +#define _PAGE_NAPOT		BIT(_PAGE_NAPOT_SHIFT)
> +/*
> + * Only 64KB (order 4) napot ptes supported.
> + */
> +#define NAPOT_CONT_ORDER_BASE 4
> +enum napot_cont_order {
> +	NAPOT_CONT64KB_ORDER = NAPOT_CONT_ORDER_BASE,
> +	NAPOT_ORDER_MAX,
> +};
> +
> +#define for_each_napot_order(order)						\
> +	for (order = NAPOT_CONT_ORDER_BASE; order < NAPOT_ORDER_MAX; order++)
> +#define for_each_napot_order_rev(order)						\
> +	for (order = NAPOT_ORDER_MAX - 1;					\
> +	     order >= NAPOT_CONT_ORDER_BASE; order--)
> +#define napot_cont_order(val)	(__builtin_ctzl((val.pte >> _PAGE_PFN_SHIFT) << 1))
> +
> +#define napot_cont_shift(order)	((order) + PAGE_SHIFT)
> +#define napot_cont_size(order)	BIT(napot_cont_shift(order))
> +#define napot_cont_mask(order)	(~(napot_cont_size(order) - 1UL))
> +#define napot_pte_num(order)	BIT(order)
> +
> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
> +#define HUGE_MAX_HSTATE		(2 + (NAPOT_ORDER_MAX - NAPOT_CONT_ORDER_BASE))
> +#else
> +#define HUGE_MAX_HSTATE		2
> +#endif
> +
>  /*
>   * [62:61] Svpbmt Memory Type definitions:
>   *
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 2a88362dffa5..76502bc7bef2 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -264,10 +264,47 @@ static inline pte_t pud_pte(pud_t pud)
>  	return __pte(pud_val(pud));
>  }
>  
> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
> +
> +static __always_inline bool has_svnapot(void)
> +{
> +	return riscv_has_extension_likely(RISCV_ISA_EXT_SVNAPOT);
> +}
> +
> +static inline unsigned long pte_napot(pte_t pte)
> +{
> +	return pte_val(pte) & _PAGE_NAPOT;
> +}
> +
> +static inline pte_t pte_mknapot(pte_t pte, unsigned int order)
> +{
> +	int pos = order - 1 + _PAGE_PFN_SHIFT;
> +	unsigned long napot_bit = BIT(pos);
> +	unsigned long napot_mask = ~GENMASK(pos, _PAGE_PFN_SHIFT);
> +
> +	return __pte((pte_val(pte) & napot_mask) | napot_bit | _PAGE_NAPOT);
> +}
> +
> +#else
> +
> +static __always_inline bool has_svnapot(void) { return false; }
> +
> +static inline unsigned long pte_napot(pte_t pte)
> +{
> +	return 0;
> +}
> +
> +#endif /* CONFIG_RISCV_ISA_SVNAPOT */
> +
>  /* Yields the page frame number (PFN) of a page table entry */
>  static inline unsigned long pte_pfn(pte_t pte)
>  {
> -	return __page_val_to_pfn(pte_val(pte));
> +	unsigned long res  = __page_val_to_pfn(pte_val(pte));
> +
> +	if (has_svnapot() && pte_napot(pte))
> +		res = res & (res - 1UL);
> +
> +	return res;
>  }
>  
>  #define pte_page(x)     pfn_to_page(pte_pfn(x))
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 420228e219f7..5670909619c8 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -191,6 +191,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> +	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>  	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
>  };
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 21fb567e1b22..271e391d436d 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -223,6 +223,7 @@ void __init riscv_fill_hwcap(void)
>  				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
>  				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
>  				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
> +				SET_ISA_EXT_MAP("svnapot", RISCV_ISA_EXT_SVNAPOT);
>  				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
>  				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
>  				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
> -- 
> 2.39.1
>

FYI, I don't think these rebase changes were significant enough to drop my
r-b, but, anyway, here it is again

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
