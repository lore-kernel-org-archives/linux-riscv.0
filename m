Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9598EC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 14:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y0b90sRKMHzdRjchqCRDrQuUu69A4rydhnh3fEdsLLg=; b=Fjcm0AsFLzMQcg
	SlLSPwNZfBukx1/A8W+LDKDLND3kOh51TZuZMKSc3hTarv6F80LrsseWh0Y2eA7psJOQOWFyzEWmr
	wti5AkCgaADWIoFFHc/T8HvBaJpVGjEplF5UfBSTZCO0lrGAlKQ6Aj5gxms7B0x3G7OfcGu2qOTBl
	bcV51S2Soet/N37DXoWbeqCntzS1wsML8IOmS7gn85gPIqvUIxqAEgedsrHbw7pC5bFiK7jSZZPGO
	Bv/Ue4a8w387F8rkjyG2hyHTia2qxbn82Pw7zhSvexN4GP7G0F+CAqm7uFTNUqsQOpR0HNY4On+s2
	OfKZrNKCXvilaItq/eSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og5Cu-00ESzi-PQ; Wed, 05 Oct 2022 14:17:08 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og5Cs-00ESz1-4u
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 14:17:07 +0000
Received: by mail-ej1-x62e.google.com with SMTP id 13so35794441ejn.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Oct 2022 07:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=OYorjZrFsEijDL4JDivcX0rBY9R1Aqumt3OTklx208k=;
        b=EY09xL3oJKGJol75mIMKxcBoRljLNB9pCRdtrw3UKjMNIo8e/xD7ND4S7tIHSMlTQB
         W9FxieUSUQ/UpjwT2PMDIU7H69slthWA23wGhwKz9XVDAoHmIpIPJk/x5wucKMhFuCgV
         her3aR7hg2FBMhss6R4o2I5pbBv53N1B4bMBmv8qyaaseIuDklJlhz5UWqfvTDxFHalf
         OLLThbtme2YxlSP65yhf7KR5J/eEautC1r/s1eSqOtH3hqWMDLxuBPnWj1sqoOsO+X2/
         GWp550n476C3vTRXkkY8WsMk1c4f/QPyk/Q9BRczjVQNXYNz/H/uioXEqnWqdA38+uJ4
         zbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=OYorjZrFsEijDL4JDivcX0rBY9R1Aqumt3OTklx208k=;
        b=QKzFoy0+KpozykjA1xAVKE7PWu0njkDvvBuGWci1hDuDjALzdc8sD1I6XWyobdsBzy
         SV2wl8GPitGoBhU/HbyxJAOvj31hbFWzFW7Ry6cQSayAtK7uawgE+ZqyhRI+YqHhQ9F4
         iKxFBCMof+L3YJiL93B0D3fCmhAyVnMfaUiv7eT3vZUy6qA5cfTacUpMoA0OGcp4zP3f
         8VVFB8AK4GjM4N/4dxJGqshOxLzNet8W4JAyD+7FfNj9KtBn0n/TFFz92EQOoF9TrpQg
         N2FTDfrro/G4ppHMNjPIIdTgWth+7x/xKzHdqP3J7/45GLZcvwttBpEjR4DRRbcRw+Dj
         sg1Q==
X-Gm-Message-State: ACrzQf3ND+5mFtbfBjmu9lHILc++rl3yRfWUoup+FasxbTBlAV+/gvi5
	FIv8rxwhHaT1VkI/e6zF6jfZvFkcRfm2SQ==
X-Google-Smtp-Source: AMsMyM5aERJBNSvWw3MVTvjyUXvG+LR3jMJjiDwEzR7LeqJaYfQjdnmoq6xpFH+ctPhwIRW6DMGEUw==
X-Received: by 2002:a17:906:cc10:b0:77b:df70:efd2 with SMTP id ml16-20020a170906cc1000b0077bdf70efd2mr23999003ejb.590.1664979422606;
        Wed, 05 Oct 2022 07:17:02 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id d14-20020a056402516e00b00457b5ba968csm3855326ede.27.2022.10.05.07.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 07:17:01 -0700 (PDT)
Date: Wed, 5 Oct 2022 16:17:00 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: panqinglin2020@iscas.ac.cn
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
	xuyinan@ict.ac.cn, conor@kernel.org
Subject: Re: [PATCH v6 1/4] riscv: mm: modify pte format for Svnapot
Message-ID: <20221005141700.yu7mf23ru4bkf43z@kamzik>
References: <20221005112926.3043280-1-panqinglin2020@iscas.ac.cn>
 <20221005112926.3043280-2-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221005112926.3043280-2-panqinglin2020@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_071706_217633_E5F7369E 
X-CRM114-Status: GOOD (  30.79  )
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

On Wed, Oct 05, 2022 at 07:29:23PM +0800, panqinglin2020@iscas.ac.cn wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> Add one static key to enable/disable svnapot support, enable this static
> key when "svnapot" is in the "riscv,isa" field of fdt and SVNAPOT compile
> option is set. It will influence the behavior of has_svnapot. All code
> dependent on svnapot should make sure that has_svnapot return true firstly.
> 
> Modify PTE definition for Svnapot, and creates some functions in pgtable.h
> to mark a PTE as napot and check if it is a Svnapot PTE. Until now, only
> 64KB napot size is supported in spec, so some macros has only 64KB version.
> 
> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d557cc50295d..69e88ab8fafd 100644
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
> +	default y
> +	help
> +	  Allow kernel to detect SVNAPOT ISA-extension dynamically in boot time
> +	  and enable its usage.
> +
> +	  SVNAPOT extension helps to mark contiguous PTEs as a range
> +	  of contiguous virtual-to-physical translations, with a naturally
> +	  aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
> +	  size.
> +
>  config RISCV_ISA_SVPBMT
>  	bool "SVPBMT extension support"
>  	depends on 64BIT && MMU
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 6f59ec64175e..2c45cc0d5d3c 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -54,6 +54,7 @@ extern unsigned long elf_hwcap;
>   */
>  enum riscv_isa_ext_id {
>  	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
> +	RISCV_ISA_EXT_SVNAPOT,
>  	RISCV_ISA_EXT_SVPBMT,
>  	RISCV_ISA_EXT_ZICBOM,
>  	RISCV_ISA_EXT_ZIHINTPAUSE,
> @@ -68,6 +69,7 @@ enum riscv_isa_ext_id {
>   */
>  enum riscv_isa_ext_key {
>  	RISCV_ISA_EXT_KEY_FPU,		/* For 'F' and 'D' */
> +	RISCV_ISA_EXT_KEY_SVNAPOT,
>  	RISCV_ISA_EXT_KEY_ZIHINTPAUSE,
>  	RISCV_ISA_EXT_KEY_MAX,
>  };
> @@ -88,6 +90,8 @@ static __always_inline int riscv_isa_ext2key(int num)
>  		return RISCV_ISA_EXT_KEY_FPU;
>  	case RISCV_ISA_EXT_d:
>  		return RISCV_ISA_EXT_KEY_FPU;
> +	case RISCV_ISA_EXT_SVNAPOT:
> +		return RISCV_ISA_EXT_KEY_SVNAPOT;
>  	case RISCV_ISA_EXT_ZIHINTPAUSE:
>  		return RISCV_ISA_EXT_KEY_ZIHINTPAUSE;
>  	default:
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> index dc42375c2357..1cd0ffbfbdaa 100644
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
> +#define _PAGE_NAPOT_SHIFT	63
> +#define _PAGE_NAPOT		BIT(_PAGE_NAPOT_SHIFT)
> +#define NAPOT_CONT64KB_ORDER	4UL
> +#define NAPOT_CONT64KB_SHIFT	(NAPOT_CONT64KB_ORDER + PAGE_SHIFT)
> +#define NAPOT_CONT64KB_SIZE	BIT(NAPOT_CONT64KB_SHIFT)
> +#define NAPOT_CONT64KB_MASK	(NAPOT_CONT64KB_SIZE - 1UL)
> +#define NAPOT_64KB_PTE_NUM	BIT(NAPOT_CONT64KB_ORDER)

I still wonder if we shouldn't future-proof a bit with something like

/*
 * Only 64KB (order 4) napot ptes supported.
 */
#define napot_cont_order(pte)	4

#define napot_cont_shift(order)	((order) + PAGE_SHIFT)
#define napot_cont_size(order)	BIT(napot_cont_shift(order))
#define napot_cont_mask(order)	BIT(napot_cont_size(order) - 1)
#define napot_pte_num(order)	BIT(order)

> +
>  /*
>   * [62:61] Svpbmt Memory Type definitions:
>   *
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 7ec936910a96..a8cab063fd05 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -6,10 +6,12 @@
>  #ifndef _ASM_RISCV_PGTABLE_H
>  #define _ASM_RISCV_PGTABLE_H
>  
> +#include <linux/jump_label.h>
>  #include <linux/mmzone.h>
>  #include <linux/sizes.h>
>  
>  #include <asm/pgtable-bits.h>
> +#include <asm/hwcap.h>
>  
>  #ifndef CONFIG_MMU
>  #define KERNEL_LINK_ADDR	PAGE_OFFSET
> @@ -264,10 +266,38 @@ static inline pte_t pud_pte(pud_t pud)
>  	return __pte(pud_val(pud));
>  }
>  
> +static __always_inline bool has_svnapot(void)
> +{
> +	return static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_SVNAPOT]);
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
> +	unsigned long val  = pte_val(pte);
> +	unsigned long res  = __page_val_to_pfn(val);
> +
> +	if (has_svnapot())
> +		res = res & (res - (val >> _PAGE_NAPOT_SHIFT));

nit: res &= ...

This is much easier to read. I presume the static key is doing its
thing and the instructions come out the same as with the errata
framework?

A comment explaining what it's doing and how it works would be good for
new readers and for myself, since I'll probably forget by next week...

> +
> +	return res;
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
>  	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
>  };
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 553d755483ed..bc247844e42d 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -204,6 +204,7 @@ void __init riscv_fill_hwcap(void)
>  				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
>  				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
>  				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
> +				SET_ISA_EXT_MAP("svnapot", RISCV_ISA_EXT_SVNAPOT);
>  			}
>  #undef SET_ISA_EXT_MAP
>  		}
> -- 
> 2.35.1
>

Otherwise

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
