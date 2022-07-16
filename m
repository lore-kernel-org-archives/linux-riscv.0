Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACA2C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jul 2022 12:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DF8rhhHFmqmEUzztdf3L8MlyFGenQouHhdB8a5Wdd3Y=; b=lqcA4becD4+AMX
	Z8m+10I1lRYspMFOznQvEmg777kDdrISXNZ0imU5Wyj8bIEi5pFbBKcMSi4jYe5Ga7zFpsiWt/eAU
	cKLUSxklQGznO0coUOoDiZjTiak2N2xiq46V+oXrCW0g5V0QFkQnNil3b7mxnkvcCsQU9SsxeIabQ
	dfQuRTT0EJCGopHp1nYEt0kmEyA2GVLJJWNyY7T0nRlBTrtcvoUWUaBYG01cmjxc30TaNhe0CYKiZ
	VzEVn8yK6Nra1UGBpWnWDIv72RxIps8n+QWRMEIKBHHHEHJGogJU/subvntWxUeRJ7SV22E8KAVde
	yErXcAXtCCWQB+4IxJIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCh9o-00G4wj-U1; Sat, 16 Jul 2022 12:44:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCh9l-00G4uK-5o
	for linux-riscv@lists.infradead.org; Sat, 16 Jul 2022 12:44:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1F65E60FF7;
	Sat, 16 Jul 2022 12:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B24CC34114;
	Sat, 16 Jul 2022 12:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657975463;
	bh=5TX1mvexbvZNqP+jGJAnJRswtTXv+4lgbKlimg77lLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fDJbeOczRSDOybBViMRoRCFHOm84wxyy98St/W180dDTuUENYyMT+3CGglgB3d3au
	 f3KFRqD04OdlPlZ6+DDxP/6E9qysoW7k832flK1fKpMDPP8y/wbbzOGrqjuyEt7qVZ
	 M6SZmkKWOb71nudhZYMNuqpHN8ECti6OMDe2a82AXjOS4hKlSSEfNAF9aA0IpoZshZ
	 t4iAk5swTe45vN+mNC8SY97WTE4JsY9afRRBGzwut5AbhAkEgUDHKY5J0RciYqk7nx
	 75TblWIjv0ykxZexw7AmZMS15ToLEmFQ2HK/WON1uvVveiR2aXz9wwH3asEm81gTXB
	 WtPInfuNNBqJg==
Date: Sat, 16 Jul 2022 20:35:26 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: panqinglin2020@iscas.ac.cn
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
	xuyinan@ict.ac.cn
Subject: Re: [PATCH v2 1/4] riscv, mm: detect svnapot cpu support at runtime
Message-ID: <YtKwjmbQmIMm4gEo@xhacker>
References: <20220716085648.4156408-1-panqinglin2020@iscas.ac.cn>
 <20220716085648.4156408-2-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220716085648.4156408-2-panqinglin2020@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_054425_329532_A5D1D72D 
X-CRM114-Status: GOOD (  31.83  )
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

On Sat, Jul 16, 2022 at 04:56:45PM +0800, panqinglin2020@iscas.ac.cn wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> This patch add two erratas to enable/disable svnapot support, patches code
> dynamicly when "svnapot" is in the "riscv,isa" field of fdt and SVNAPOT compile
> option is set. It will influence the behavior of has_svnapot function and
> pte_pfn function. All code dependent on svnapot should make sure that has_svnapot
> return true firstly.
> 
> Also, this patch modifies PTE definition for Svnapot, and creates some functions in
> pgtable.h to mark a PTE as napot and check if it is a Svnapot PTE.
> Until now, only 64KB napot size is supported in draft spec, so some macros
> has only 64KB version.
> 
> Yours,
> Qinglin

hmm, this "Yours ..." should be removed in commit msg
> 
> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index b17fd4666b0c..c5e1629a6033 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -385,6 +385,13 @@ config FPU
>  
>  	  If you don't know what to do here, say Y.
>  
> +config SVNAPOT
> +	bool "Svnapot support"

Do we add an config opition for each isa extension? That's not
necessary. I think we'd better remove this CONFIG option and keep
unified Image in mind.

> +	default n
> +	help
> +	  Select if your CPU supports Svnapot and you want to enable it when
> +	  kernel is booting.
> +
>  endmenu # "Platform type"
>  menu "Kernel features"
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index 9e2888dbb5b1..84ad32075637 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -20,7 +20,8 @@
>  #endif
>  
>  #define	CPUFEATURE_SVPBMT 0
> -#define	CPUFEATURE_NUMBER 1
> +#define	CPUFEATURE_SVNAPOT 1
> +#define	CPUFEATURE_NUMBER 2
>  
>  #ifdef __ASSEMBLY__
>  
> @@ -93,6 +94,27 @@ asm volatile(ALTERNATIVE(						\
>  #define ALT_THEAD_PMA(_val)
>  #endif
>  
> +#define ALT_SVNAPOT(_val)						\

I believe SVNAPOT can be supported w/o ALTERNATIVE, static key mechanism
would be much simpler.

> +asm(ALTERNATIVE("li %0, 0", "li %0, 1", 0,				\
> +		CPUFEATURE_SVNAPOT, CONFIG_SVNAPOT)			\
> +		: "=r"(_val) :)
> +
> +#define ALT_SVNAPOT_PTE_PFN(_val, _napot_shift, _pfn_mask, _pfn_shift)	\
> +asm(ALTERNATIVE("and %0, %1, %2\n\t"					\
> +		"srli %0, %0, %3\n\t"					\
> +		"nop\n\tnop\n\tnop",					\
> +		"srli t3, %1, %4\n\t"					\
> +		"and %0, %1, %2\n\t"					\
> +		"srli %0, %0, %3\n\t"					\
> +		"sub  t4, %0, t3\n\t"					\
> +		"and  %0, %0, t4",					\
> +		0, CPUFEATURE_SVNAPOT, CONFIG_SVNAPOT)			\
> +		: "+r"(_val)						\
> +		: "r"(_val),						\
> +		  "r"(_pfn_mask),					\
> +		  "i"(_pfn_shift),					\
> +		  "i"(_napot_shift))
> +
>  #endif /* __ASSEMBLY__ */
>  
>  #endif
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index e48eebdd2631..292ab93321e3 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -54,6 +54,7 @@ extern unsigned long elf_hwcap;
>  enum riscv_isa_ext_id {
>  	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
>  	RISCV_ISA_EXT_SVPBMT,
> +	RISCV_ISA_EXT_SVNAPOT,
>  	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> index 5c2aba5efbd0..e8463515a46c 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -74,6 +74,20 @@ typedef struct {
>   */
>  #define _PAGE_PFN_MASK  GENMASK(53, 10)
>  
> +/*
> + * [63] Svnapot definitions:
> + * 0 Svnapot disabled
> + * 1 Svnapot enabled
> + */
> +#define _PAGE_NAPOT_SHIFT 63
> +#define _PAGE_NAPOT      (1UL << _PAGE_NAPOT_SHIFT)
> +#define NAPOT_CONT64KB_ORDER 4UL
> +#define NAPOT_CONT64KB_SHIFT (NAPOT_CONT64KB_ORDER + PAGE_SHIFT)
> +#define NAPOT_CONT64KB_SIZE (1UL << NAPOT_CONT64KB_SHIFT)
> +#define NAPOT_CONT64KB_MASK (NAPOT_CONT64KB_SIZE - 1)
> +#define NAPOT_64KB_PTE_NUM (1UL << NAPOT_CONT64KB_ORDER)
> +#define NAPOT_64KB_MASK (7UL << _PAGE_PFN_SHIFT)
> +
>  /*
>   * [62:61] Svpbmt Memory Type definitions:
>   *
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 1d1be9d9419c..34c4be9de79e 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -284,10 +284,38 @@ static inline pte_t pud_pte(pud_t pud)
>  	return __pte(pud_val(pud));
>  }
>  
> +static inline bool has_svnapot(void) {
> +	u64 _val;
> +	ALT_SVNAPOT(_val);
> +	return _val;
> +}
> +
> +#ifdef CONFIG_SVNAPOT
> +
> +static inline unsigned long pte_napot(pte_t pte)
> +{
> +	return pte_val(pte) & _PAGE_NAPOT;
> +}
> +
> +static inline pte_t pte_mknapot(pte_t pte, unsigned int order)
> +{
> +	unsigned long napot_bits = (1UL << (order - 1)) << _PAGE_PFN_SHIFT;
> +	unsigned long lower_prot =
> +		pte_val(pte) & ((1UL << _PAGE_PFN_SHIFT) - 1UL);
> +	unsigned long upper_prot = (pte_val(pte) >> _PAGE_PFN_SHIFT)
> +				   << _PAGE_PFN_SHIFT;
> +
> +	return __pte(upper_prot | napot_bits | lower_prot | _PAGE_NAPOT);
> +}
> +#endif /* CONFIG_SVNAPOT */
> +
>  /* Yields the page frame number (PFN) of a page table entry */
>  static inline unsigned long pte_pfn(pte_t pte)
>  {
> -	return __page_val_to_pfn(pte_val(pte));
> +	unsigned long _val  = pte_val(pte);
> +	ALT_SVNAPOT_PTE_PFN(_val, _PAGE_NAPOT_SHIFT,
> +			_PAGE_PFN_MASK, _PAGE_PFN_SHIFT);
> +	return _val;
>  }
>  
>  #define pte_page(x)     pfn_to_page(pte_pfn(x))
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index fba9e9f46a8c..9f1113fa2b96 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -89,6 +89,7 @@ int riscv_of_parent_hartid(struct device_node *node)
>  static struct riscv_isa_ext_data isa_ext_arr[] = {
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> +	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>  	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
>  };
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 1b3ec44e25f5..9f38b7d02f2a 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -198,6 +198,7 @@ void __init riscv_fill_hwcap(void)
>  			} else {
>  				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
>  				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
> +				SET_ISA_EXT_MAP("svnapot", RISCV_ISA_EXT_SVNAPOT);
>  			}
>  #undef SET_ISA_EXT_MAP
>  		}
> @@ -259,6 +260,20 @@ static bool __init_or_module cpufeature_probe_svpbmt(unsigned int stage)
>  	return false;
>  }
>  
> +static bool __init_or_module cpufeature_probe_svnapot(unsigned int stage)
> +{
> +#ifdef CONFIG_SVNAPOT
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
> @@ -273,6 +288,9 @@ static u32 __init_or_module cpufeature_probe(unsigned int stage)
>  	if (cpufeature_probe_svpbmt(stage))
>  		cpu_req_feature |= (1U << CPUFEATURE_SVPBMT);
>  
> +	if (cpufeature_probe_svnapot(stage))
> +		cpu_req_feature |= (1U << CPUFEATURE_SVNAPOT);
> +
>  	return cpu_req_feature;
>  }
>  
> -- 
> 2.35.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
