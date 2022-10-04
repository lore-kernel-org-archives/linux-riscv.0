Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34EFC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 17:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JY0F75yTaxto/y7LEuwqnFITLaMwCi1dVzypyS218+M=; b=JbURAk1If1woUI
	uNCuTR2jK41HeezLnov5nbXMnOJO+V9zLxAxMVEzESV2N9PUQvNm7v7gT9ICGG71Yrv40fjeoHE1q
	uwBgjBylKWO6iM7ndIAm/Q1vQtPBavPKKztIt8P1f5E9Uy1jmCcc4C/m/iedSYdZT611gWz6+zW3o
	O/YYrMCu5ffTcN/caIYXB6mK5o6gJnJ3sexKc4H5tvawY3JJfFdLvCAUyBB4EoCgg08sA6BHTY/oC
	D7755I/MxMWuoZczA0eMMEySzBDonoZJ6bocGpWG1qpKkOmSX5aROy27+z74gYS6OWe9oZpxKno4g
	h/H9bSXasT27gS5jVr8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oflHZ-00AG2c-CB; Tue, 04 Oct 2022 17:00:37 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oflHV-00AG1a-Sz
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 17:00:35 +0000
Received: by mail-ej1-x62c.google.com with SMTP id z23so13465254ejw.12
        for <linux-riscv@lists.infradead.org>; Tue, 04 Oct 2022 10:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=hrCtd6fz0/amLWPPmwreXO0GFm7sHDpGBVXaJmwnZGk=;
        b=lJVIDX3joR+OmqONs24AU8agd43PLz/36OqD+x0p3ufLItoI4axQO6TkL0YaJBcfGP
         PaXmw3SN0NODGlAOnOeOWu9VGmdErhBF3wtNzBKbBsp7Vjg356wC8DHtBLFaiMEqACNU
         VGUJ8Q4Xi+O3JrNW1IEdZN02ehdb3SK2DGzAUXZtq+nQDMOWRY3JwXJR40OpJfWp2apz
         OpIY4V2LI849ZpFD56KsQrDfXXS8FUZDLNs8B0AEgph16MqVfzmCXwS5KMFWEdkn2si5
         ouv7uDd3KAilJOBTLCLjmAmIJ19fmtmtQ8UawfzablakVT9INHuMISRP8qa5z52/1gUj
         GXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=hrCtd6fz0/amLWPPmwreXO0GFm7sHDpGBVXaJmwnZGk=;
        b=euwK6JYfSyMRW2obnWzWmZC7czwl7UiUSyV47FGGt/iGhqZsgODOq9E/AM+3S719dv
         cwnW2aWDwhH98/o/UUwUBrPHIuuSMO0LIZtgMEpupG4aOZ79lXGaQC5NpK0YFTZRZCto
         glWpQorSRs9uYF19k5naAektfSSYhDASGBSMQl3YR6u0D5oLHGgm4y9reiwkjJTE/V8z
         ykvAdwL1TuQv73fnBRUeisvBgkB2PLFfk8gWKPRZFeivsHzLgwLoM2fyRd90LAKV1hpB
         4O8OAVR3juSJ8nEyOcJCBhHYkaBXVD8IELYPOPqWfezrfZ6MRoPDGFtMBKUwgwgxBM4F
         5O6Q==
X-Gm-Message-State: ACrzQf2ZEIDAd24C72xJHDPPuItTw+ElpqjF0hGq/kM5Q1ciXQJ95RQS
	oq54J/naS3sgOwgMl2n1AccX4g==
X-Google-Smtp-Source: AMsMyM5NrVgS36HLUS3IDSegdNrCMJL3bU54mDn3yh8nfu+sjbRP1MQXNJ8/f0NTABiHNRVBWChR9w==
X-Received: by 2002:a17:906:9bdc:b0:78a:49c4:410f with SMTP id de28-20020a1709069bdc00b0078a49c4410fmr10730638ejc.275.1664902828849;
        Tue, 04 Oct 2022 10:00:28 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id e6-20020a170906314600b007389c5a45f0sm7417154eje.148.2022.10.04.10.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 10:00:28 -0700 (PDT)
Date: Tue, 4 Oct 2022 19:00:27 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: panqinglin2020@iscas.ac.cn
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
	xuyinan@ict.ac.cn
Subject: Re: [PATCH v5 1/4] mm: modify pte format for Svnapot
Message-ID: <20221004170027.duk2nc6pq52d4vcf@kamzik>
References: <20221003134721.1772455-1-panqinglin2020@iscas.ac.cn>
 <20221003134721.1772455-2-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221003134721.1772455-2-panqinglin2020@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_100033_973478_6F5DD455 
X-CRM114-Status: GOOD (  39.01  )
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

On Mon, Oct 03, 2022 at 09:47:18PM +0800, panqinglin2020@iscas.ac.cn wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> This commit adds two erratas to enable/disable svnapot support, patches
> code dynamicly when "svnapot" is in the "riscv,isa" field of fdt and
> SVNAPOT compile option is set. It will influence the behavior of
> has_svnapot function and pte_pfn function. All code dependent on svnapot
> should make sure that has_svnapot return true firstly.
> 
> Also, this commit modifies PTE definition for Svnapot, and creates some
> functions in pgtable.h to mark a PTE as napot and check if it is a Svnapot
> PTE. Until now, only 64KB napot size is supported in draft spec, so some
> macros has only 64KB version.
> 
> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d557cc50295d..4354024aae21 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -383,6 +383,20 @@ config RISCV_ISA_C
>  
>  	  If you don't know what to do here, say Y.
>  
> +config RISCV_ISA_SVNAPOT
> +	bool "SVNAPOT extension support"
> +	depends on 64BIT && MMU
> +	select RISCV_ALTERNATIVE
> +	default n

What's the reason for this to be default no? If there's a trade-off to be
made which requires opt-in, then it should be described in the text below.

> +	help
> +	  Say Y if you want to allow kernel to detect SVNAPOT ISA-extension
> +	  dynamically in boot time and enable its usage.
> +
> +	  SVNAPOT extension helps to mark contiguous PTEs as a range
> +	  of contiguous virtual-to-physical translations, with a naturally
> +	  aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
> +	  size.
> +
>  config RISCV_ISA_SVPBMT
>  	bool "SVPBMT extension support"
>  	depends on 64BIT && MMU
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index 19a771085781..f3aff5ef52e4 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -22,7 +22,8 @@
>  
>  #define	CPUFEATURE_SVPBMT 0
>  #define	CPUFEATURE_ZICBOM 1
> -#define	CPUFEATURE_NUMBER 2
> +#define	CPUFEATURE_SVNAPOT 2
> +#define	CPUFEATURE_NUMBER 3

nit: Maybe take the opportunity to tab out the numbers to get them all
lined up. And tab enough for future longer names too.

>  
>  #ifdef __ASSEMBLY__
>  
> @@ -142,6 +143,26 @@ asm volatile(ALTERNATIVE_2(						\
>  	    "r"((unsigned long)(_start) + (_size))			\
>  	: "a0")
>  
> +#define ALT_SVNAPOT(_val)						\
> +asm(ALTERNATIVE("li %0, 0", "li %0, 1", 0,				\
> +		CPUFEATURE_SVNAPOT, CONFIG_RISCV_ISA_SVNAPOT)		\
> +		: "=r"(_val) :)
> +
> +#define ALT_SVNAPOT_PTE_PFN(_val, _napot_shift, _pfn_mask, _pfn_shift)	\
> +asm(ALTERNATIVE("and %0, %0, %1\n\t"					\
> +		"srli %0, %0, %2\n\t"					\
> +		__nops(3),						\
> +		"srli t3, %0, %3\n\t"					\
> +		"and %0, %0, %1\n\t"					\
> +		"srli %0, %0, %2\n\t"					\
> +		"sub  t4, %0, t3\n\t"					\
> +		"and  %0, %0, t4",					\

This implements

  temp = ((pte & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT);
  pfn = temp & (temp - (pte >> _PAGE_NAPOT_SHIFT));

which for a non-napot pte just returns the same as the non-napot
case would, but for a napot pte we return the same as the non-napot
case but with its first set bit cleared, wherever that first set
bit was. Can you explain to me why that's what we want to do?

> +		0, CPUFEATURE_SVNAPOT, CONFIG_RISCV_ISA_SVNAPOT)	\
> +		: "+r"(_val)						\
> +		: "r"(_pfn_mask),					\
> +		  "i"(_pfn_shift),					\
> +		  "i"(_napot_shift))

Should add t3 and t4 to clobbers list.

> +
>  #endif /* __ASSEMBLY__ */
>  
>  #endif
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 6f59ec64175e..83b8e21a3573 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -54,10 +54,11 @@ extern unsigned long elf_hwcap;
>   */
>  enum riscv_isa_ext_id {
>  	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
> +	RISCV_ISA_EXT_SSTC,
> +	RISCV_ISA_EXT_SVNAPOT,
>  	RISCV_ISA_EXT_SVPBMT,
>  	RISCV_ISA_EXT_ZICBOM,
>  	RISCV_ISA_EXT_ZIHINTPAUSE,
> -	RISCV_ISA_EXT_SSTC,

Opportunistic alphabetizing an enum is a bit risky. It'd be better if this
was a separate patch, because, even though nothing should care about the
order, if something does care about the order, then it'd be easier to
debug when this when changed alone.

>  	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> index dc42375c2357..25ec541192e5 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -74,6 +74,19 @@ typedef struct {
>   */
>  #define _PAGE_PFN_MASK  GENMASK(53, 10)
>  
> +/*
> + * [63] Svnapot definitions:
> + * 0 Svnapot disabled
> + * 1 Svnapot enabled
> + */
> +#define _PAGE_NAPOT_SHIFT 63
> +#define _PAGE_NAPOT      BIT(_PAGE_NAPOT_SHIFT)
> +#define NAPOT_CONT64KB_ORDER 4UL
> +#define NAPOT_CONT64KB_SHIFT (NAPOT_CONT64KB_ORDER + PAGE_SHIFT)
> +#define NAPOT_CONT64KB_SIZE BIT(NAPOT_CONT64KB_SHIFT)
> +#define NAPOT_CONT64KB_MASK (NAPOT_CONT64KB_SIZE - 1UL)
> +#define NAPOT_64KB_PTE_NUM BIT(NAPOT_CONT64KB_ORDER)

Please make three lined up columns out of these defines.

#define DEF		VAL

> +
>  /*
>   * [62:61] Svpbmt Memory Type definitions:
>   *
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 7ec936910a96..c3fc3c661699 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -264,10 +264,39 @@ static inline pte_t pud_pte(pud_t pud)
>  	return __pte(pud_val(pud));
>  }
>  
> +static inline bool has_svnapot(void)
> +{
> +	u64 _val;
> +
> +	ALT_SVNAPOT(_val);

Why aren't we using the isa extension static key framework for this?

> +	return _val;
> +}
> +
> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
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
> +#endif /* CONFIG_RISCV_ISA_SVNAPOT */
> +
>  /* Yields the page frame number (PFN) of a page table entry */
>  static inline unsigned long pte_pfn(pte_t pte)
>  {
> -	return __page_val_to_pfn(pte_val(pte));
> +	unsigned long _val  = pte_val(pte);
> +
> +	ALT_SVNAPOT_PTE_PFN(_val, _PAGE_NAPOT_SHIFT,
> +			    _PAGE_PFN_MASK, _PAGE_PFN_SHIFT);
> +	return _val;
>  }
>  
>  #define pte_page(x)     pfn_to_page(pte_pfn(x))
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 0be8a2403212..d2a61122c595 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -96,6 +96,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
>  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> +	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),

If we want to do a separate isa extension alphabetizing patch, then this
array would be a good one to do since it's the output order.

>  	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
>  };
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 553d755483ed..3557c5cc6f04 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -204,6 +204,7 @@ void __init riscv_fill_hwcap(void)
>  				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
>  				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
>  				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
> +				SET_ISA_EXT_MAP("svnapot", RISCV_ISA_EXT_SVNAPOT);

Could alphabetize this too, even though it doesn't matter.

>  			}
>  #undef SET_ISA_EXT_MAP
>  		}
> @@ -284,6 +285,20 @@ static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
>  	return false;
>  }
>  
> +static bool __init_or_module cpufeature_probe_svnapot(unsigned int stage)
> +{
> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
> +	switch (stage) {
> +	case RISCV_ALTERNATIVES_EARLY_BOOT:
> +		return false;
> +	default:
> +		return riscv_isa_extension_available(NULL, SVNAPOT);
> +	}
> +#endif
> +
> +	return false;
> +}
> +
>  /*
>   * Probe presence of individual extensions.
>   *
> @@ -301,6 +316,9 @@ static u32 __init_or_module cpufeature_probe(unsigned int stage)
>  	if (cpufeature_probe_zicbom(stage))
>  		cpu_req_feature |= (1U << CPUFEATURE_ZICBOM);
>  
> +	if (cpufeature_probe_svnapot(stage))
> +		cpu_req_feature |= BIT(CPUFEATURE_SVNAPOT);
> +
>  	return cpu_req_feature;
>  }
>  
> -- 
> 2.35.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
