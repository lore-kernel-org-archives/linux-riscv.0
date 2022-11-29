Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C436C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 15:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UELegYTABV4yxosxuNbUqcaTSIngR+6ckC0mqxiZhSw=; b=TqqW4+WxWbOQy2
	05j8BRs+mTw+ZsWgCyFS8dlhh5ElqgUz+I2wEtJZUgPh6eTuw++80L1GmukPFfZxVx1WJ99wUBbla
	3lfVe56RvMWCwRcuEYROZufXsnoF0KBXsGqADj3HhbjDbGERwatSUcjYQSkg6a5/Tjr1i53Lblc34
	JvzqBXMlc821Ui0CE3uRJETN3bOOCvOtXM6gcrMCm+yPLN2YVQH/7nCvy60RTr9yoeep5jlpMgCfl
	5wFQBCvgBqINxE5SNLXCFHU1WoBd8WVkzEasIRZZky+TsfHxm+dKaHTbaUK9APrurEzPXzc2ZF2h0
	836EHh4b0A/zktzYnh3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p02tx-009rbe-Ba; Tue, 29 Nov 2022 15:52:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p02tt-009ra9-Ew
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 15:52:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D14C46179C;
	Tue, 29 Nov 2022 15:52:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0271FC433D6;
	Tue, 29 Nov 2022 15:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669737120;
	bh=ovYzKs9TBmEU/tKrpPOfPeH0pt057Gaovf9mvf84Ye8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uMwGq3WJSfS6HU42TRRuMVFLAHi2MFnCqN43e1G0wQGNuoBHblAb8eJuBINOfWMut
	 vxi1hRabzlyLGFMKhN2heKe+O2Q3ZpTOXYsYJgp9S1a0OyaAn008uyYvghYVEDupXh
	 Dj18HegmoGFr4dSR/AKbQGiLOoqTBROSxx6fXeknOEN3fRGSO4DmFUKcDeoi+KoLsM
	 +H/sZRMRJpk/j7EHaWY7NEFnACtJQJ+2tju0nlbtO3EtzDLh22dc2kDy+474tJyWLh
	 ytOJyR4Vk5L1frzNefv09VjVt8H1zwMrw8Ps4y8ZpLlfESvgSoOQMOp0KP9U+ibv9K
	 kyJ6mNyAZUetg==
Date: Tue, 29 Nov 2022 23:42:06 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: panqinglin2020@iscas.ac.cn, palmer@dabbelt.com,
	linux-riscv@lists.infradead.org, jeff@riscv.org, xuyinan@ict.ac.cn,
	conor@kernel.org, alex@ghiti.fr
Subject: Re: [PATCH v8 1/3] riscv: mm: modify pte format for Svnapot
Message-ID: <Y4YoTlzZzcrox/6p@xhacker>
References: <20221128022719.328770-1-panqinglin2020@iscas.ac.cn>
 <20221128022719.328770-2-panqinglin2020@iscas.ac.cn>
 <20221129094946.efbjzr2hbs3ieeyk@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221129094946.efbjzr2hbs3ieeyk@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_075201_599558_E2F62085 
X-CRM114-Status: GOOD (  34.44  )
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

On Tue, Nov 29, 2022 at 10:49:46AM +0100, Andrew Jones wrote:
> On Mon, Nov 28, 2022 at 10:27:17AM +0800, panqinglin2020@iscas.ac.cn wrote:
> > From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> > 
> > Add one static key to enable/disable svnapot support, enable this static
> > key when "svnapot" is in the "riscv,isa" field of fdt and SVNAPOT compile
> > option is set. It will influence the behavior of has_svnapot. All code
> > dependent on svnapot should make sure that has_svnapot return true firstly.
> > 
> > Modify PTE definition for Svnapot, and creates some functions in pgtable.h
> > to mark a PTE as napot and check if it is a Svnapot PTE. Until now, only
> > 64KB napot size is supported in spec, so some macros has only 64KB version.
> > 
> > Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 3b41165a8b10..1671938f2f81 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -394,6 +394,20 @@ config RISCV_ISA_C
> >  
> >  	  If you don't know what to do here, say Y.
> >  
> > +config RISCV_ISA_SVNAPOT
> > +	bool "SVNAPOT extension support"
> > +	depends on 64BIT && MMU
> > +	select RISCV_ALTERNATIVE
> > +	default y
> > +	help
> > +	  Allow kernel to detect SVNAPOT ISA-extension dynamically in boot time
> > +	  and enable its usage.
> > +
> > +	  SVNAPOT extension helps to mark contiguous PTEs as a range
> > +	  of contiguous virtual-to-physical translations, with a naturally
> > +	  aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
> > +	  size.
> > +
> >  config RISCV_ISA_SVPBMT
> >  	bool "SVPBMT extension support"
> >  	depends on 64BIT && MMU
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > index b22525290073..15cda8f131aa 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -54,6 +54,7 @@ extern unsigned long elf_hwcap;
> >   */
> >  enum riscv_isa_ext_id {
> >  	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
> > +	RISCV_ISA_EXT_SVNAPOT,
> >  	RISCV_ISA_EXT_SVPBMT,
> >  	RISCV_ISA_EXT_ZICBOM,
> >  	RISCV_ISA_EXT_ZIHINTPAUSE,
> > @@ -69,6 +70,7 @@ enum riscv_isa_ext_id {
> >   */
> >  enum riscv_isa_ext_key {
> >  	RISCV_ISA_EXT_KEY_FPU,		/* For 'F' and 'D' */
> > +	RISCV_ISA_EXT_KEY_SVNAPOT,
> >  	RISCV_ISA_EXT_KEY_ZIHINTPAUSE,
> >  	RISCV_ISA_EXT_KEY_SVINVAL,
> >  	RISCV_ISA_EXT_KEY_MAX,
> > @@ -90,6 +92,8 @@ static __always_inline int riscv_isa_ext2key(int num)
> >  		return RISCV_ISA_EXT_KEY_FPU;
> >  	case RISCV_ISA_EXT_d:
> >  		return RISCV_ISA_EXT_KEY_FPU;
> > +	case RISCV_ISA_EXT_SVNAPOT:
> > +		return RISCV_ISA_EXT_KEY_SVNAPOT;
> >  	case RISCV_ISA_EXT_ZIHINTPAUSE:
> >  		return RISCV_ISA_EXT_KEY_ZIHINTPAUSE;
> >  	case RISCV_ISA_EXT_SVINVAL:
> > diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> > index ac70b0fd9a9a..349fad5e35de 100644
> > --- a/arch/riscv/include/asm/page.h
> > +++ b/arch/riscv/include/asm/page.h
> > @@ -16,11 +16,6 @@
> >  #define PAGE_SIZE	(_AC(1, UL) << PAGE_SHIFT)
> >  #define PAGE_MASK	(~(PAGE_SIZE - 1))
> >  
> > -#ifdef CONFIG_64BIT
> > -#define HUGE_MAX_HSTATE		2
> > -#else
> > -#define HUGE_MAX_HSTATE		1
> > -#endif
> >  #define HPAGE_SHIFT		PMD_SHIFT
> >  #define HPAGE_SIZE		(_AC(1, UL) << HPAGE_SHIFT)
> >  #define HPAGE_MASK              (~(HPAGE_SIZE - 1))
> > diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> > index dc42375c2357..598958cbda50 100644
> > --- a/arch/riscv/include/asm/pgtable-64.h
> > +++ b/arch/riscv/include/asm/pgtable-64.h
> > @@ -74,6 +74,40 @@ typedef struct {
> >   */
> >  #define _PAGE_PFN_MASK  GENMASK(53, 10)
> >  
> > +/*
> > + * [63] Svnapot definitions:
> > + * 0 Svnapot disabled
> > + * 1 Svnapot enabled
> > + */
> > +#define _PAGE_NAPOT_SHIFT	63
> > +#define _PAGE_NAPOT		BIT(_PAGE_NAPOT_SHIFT)
> > +/*
> > + * Only 64KB (order 4) napot ptes supported.
> > + */
> > +#define NAPOT_CONT_ORDER_BASE 4
> > +enum napot_cont_order {
> > +	NAPOT_CONT64KB_ORDER = NAPOT_CONT_ORDER_BASE,
> > +	NAPOT_ORDER_MAX,
> > +};
> > +
> > +#define for_each_napot_order(order)						\
> > +	for (order = NAPOT_CONT_ORDER_BASE; order < NAPOT_ORDER_MAX; order++)
> > +#define for_each_napot_order_rev(order)						\
> > +	for (order = NAPOT_ORDER_MAX - 1;					\
> > +	     order >= NAPOT_CONT_ORDER_BASE; order--)
> > +#define napot_cont_order(val)	(__builtin_ctzl((val.pte >> _PAGE_PFN_SHIFT) << 1))
> > +
> > +#define napot_cont_shift(order)	((order) + PAGE_SHIFT)
> > +#define napot_cont_size(order)	BIT(napot_cont_shift(order))
> > +#define napot_cont_mask(order)	(napot_cont_size(order) - 1UL)
> > +#define napot_pte_num(order)	BIT(order)
> > +
> > +#ifdef CONFIG_RISCV_ISA_SVNAPOT
> > +#define HUGE_MAX_HSTATE		(2 + (NAPOT_ORDER_MAX - NAPOT_CONT_ORDER_BASE))
> > +#else
> > +#define HUGE_MAX_HSTATE		2
> > +#endif
> > +
> >  /*
> >   * [62:61] Svpbmt Memory Type definitions:
> >   *
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index c61ae83aadee..af6174e3fd97 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -6,10 +6,12 @@
> >  #ifndef _ASM_RISCV_PGTABLE_H
> >  #define _ASM_RISCV_PGTABLE_H
> >  
> > +#include <linux/jump_label.h>
> >  #include <linux/mmzone.h>
> >  #include <linux/sizes.h>
> >  
> >  #include <asm/pgtable-bits.h>
> > +#include <asm/hwcap.h>
> >  
> >  #ifndef CONFIG_MMU
> >  #define KERNEL_LINK_ADDR	PAGE_OFFSET
> > @@ -264,10 +266,45 @@ static inline pte_t pud_pte(pud_t pud)
> >  	return __pte(pud_val(pud));
> >  }
> >  
> > +static __always_inline bool has_svnapot(void)
> > +{
> > +	return static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_SVNAPOT]);
> 
> I'm not sure if this should be likely or unlikely.
> 
> > +}
> > +
> > +#ifdef CONFIG_RISCV_ISA_SVNAPOT
> > +
> > +static inline unsigned long pte_napot(pte_t pte)
> > +{
> > +	return pte_val(pte) & _PAGE_NAPOT;
> > +}
> > +
> > +static inline pte_t pte_mknapot(pte_t pte, unsigned int order)
> > +{
> > +	int pos = order - 1 + _PAGE_PFN_SHIFT;
> > +	unsigned long napot_bit = BIT(pos);
> > +	unsigned long napot_mask = ~GENMASK(pos, _PAGE_PFN_SHIFT);
> > +
> > +	return __pte((pte_val(pte) & napot_mask) | napot_bit | _PAGE_NAPOT);
> > +}
> > +
> > +#else
> > +
> > +static inline unsigned long pte_napot(pte_t pte)
> > +{
> > +	return 0;
> > +}
> > +
> > +#endif /* CONFIG_RISCV_ISA_SVNAPOT */
> > +
> >  /* Yields the page frame number (PFN) of a page table entry */
> >  static inline unsigned long pte_pfn(pte_t pte)
> >  {
> > -	return __page_val_to_pfn(pte_val(pte));
> > +	unsigned long res  = __page_val_to_pfn(pte_val(pte));
> > +
> > +	if (has_svnapot() && pte_napot(pte))
> 
> We've been burned with static branches inside heavily used inline
> functions before (see [1]). There's a series[2] that was meant to
> help with this. I haven't seen a refresh of that though.
> 
> [1] https://lore.kernel.org/linux-riscv/20220922060958.44203-1-samuel@sholland.org/
> [2] https://lore.kernel.org/all/20221006070818.3616-1-jszhang@kernel.org/

I will send a refresh of [2] tomorrow.

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
