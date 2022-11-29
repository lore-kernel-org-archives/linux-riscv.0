Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359DFC4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 14:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h+EYL22R1N0a7vgGn4szFB/0FtKg1J3QNlW1Dw6iLSk=; b=iF+MZAur8Vf95R
	EaglcKDW5bOhNnJhVRdwDVCimy02fBC3h2Nig600kFiSyB7qAF3VhRl8qzPWMeKc1+k7999XLnGbf
	YcZBlOsCb4LRIPQHh5yFkirBXYSsZa+9KDnvVeCItxqAmiaJz4y+5ZlhALJy5w8nM/+L45ExKg/J2
	L5xURO51CX4gdNFecjEDutKzrH6a/M4FsuAeoYDMJBdWjR1fzYuOe3oXaycLXzimM1Q0166m+RNDL
	t4/5r5oAGh4QBAp6vimRPpad5ZOEWdCmQByZPw9F8tkEAGOJipS7jctYC6mo9ShX8g3cXpJk9uaZb
	UEFSTtUV69C5Yn2sZTFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01k1-009KQO-3F; Tue, 29 Nov 2022 14:37:45 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01jq-009KIm-Vn
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 14:37:38 +0000
Received: by mail-ej1-x634.google.com with SMTP id ho10so34307140ejc.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 06:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4YVKuLwC4xCmFT+HC5GiuhPwvPK5wfmJbvPYVOkABWY=;
        b=ou1PgejI8ywK4yzrFO9uw4R9JSIdq6JKiCZw8EnCBaU01oMjgTWTDdlgOJPIqXqxhR
         ibqa5QJ27LDcyjjhtaAMw+Bp1aw+O3JirYcvpBl1hDUSO33/8AcOx4LrteotxhnUod7X
         8oKXe+NMZZDfChHuobKfulj0A0bS5Geb1aqzdGmDJ9GNaqHb3xAcPH0zYwuHkmLq6VS0
         fM4yWcI/kSwmELrBuiq0URpCTJpTVjRgIQErXxwEQbs9/Zzr1SRjvfB0p/KZ9tqDYvdR
         ixODJfFhoSwRNqr33nSWLPRBBYu5cGQ1EFCz80KdJqGiR4KlQj+gMgSO7McKiILqLH5U
         5Yaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YVKuLwC4xCmFT+HC5GiuhPwvPK5wfmJbvPYVOkABWY=;
        b=r6j3dDcNGwEuPbdJOYdgZRQo+t93mnLz4A4TnQO0CZHunZoEiqSEnzaAq8Gk4ZoNu6
         jzxdzSkDKb4oGCO5pV2W92uXUre3ZlqQSifsZf61/AP5tzG8XZEe3ZFUixfEElgLaByy
         Iis6jFxVsUcWXU84Ktcz0zZiao86tBsF16pYbymwFvABSZLMNf949beAvVnxKdnOuSnv
         1Yn5HJPz5KRCGsda/JKBHQEAwhvavdWsS9EyniQXOckKI4+cot8t7LIrOSnw4rzQkBJz
         6RlqGZlpBGiPzFudD9UWn1bq0oRsD+Br4Rz9xLfzx6soN8f0rDYbRMnr7VmOl/KT2him
         GuAQ==
X-Gm-Message-State: ANoB5plRfxLrQAFJMyaJXCdSVVFkvnsAKEPzk2VxFxS5xUfY/+Lz1RxA
	tfVDnun3TiWWkhy4FIw/ixD0gA==
X-Google-Smtp-Source: AA0mqf4w/IU+7bJuPV0ga5LrgWq/E6vlIb/AsXnPCA+kjHJpbIL6iPf79A8aTbLg3PERUt3S4LTk/Q==
X-Received: by 2002:a17:906:6ac1:b0:7c0:9a3:87ff with SMTP id q1-20020a1709066ac100b007c009a387ffmr8617084ejs.505.1669732651165;
        Tue, 29 Nov 2022 06:37:31 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id va11-20020a17090711cb00b007c08439161dsm991282ejb.50.2022.11.29.06.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 06:37:30 -0800 (PST)
Date: Tue, 29 Nov 2022 15:37:29 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: panqinglin2020@iscas.ac.cn
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
	xuyinan@ict.ac.cn, conor@kernel.org, alex@ghiti.fr
Subject: Re: [PATCH v8 1/3] riscv: mm: modify pte format for Svnapot
Message-ID: <20221129143729.lzpknmdygw4thn3z@kamzik>
References: <20221128022719.328770-1-panqinglin2020@iscas.ac.cn>
 <20221128022719.328770-2-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128022719.328770-2-panqinglin2020@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_063735_070991_CA6CBA46 
X-CRM114-Status: GOOD (  29.39  )
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

On Mon, Nov 28, 2022 at 10:27:17AM +0800, panqinglin2020@iscas.ac.cn wrote:
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
> index 3b41165a8b10..1671938f2f81 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -394,6 +394,20 @@ config RISCV_ISA_C
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
> index b22525290073..15cda8f131aa 100644
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
> @@ -69,6 +70,7 @@ enum riscv_isa_ext_id {
>   */
>  enum riscv_isa_ext_key {
>  	RISCV_ISA_EXT_KEY_FPU,		/* For 'F' and 'D' */
> +	RISCV_ISA_EXT_KEY_SVNAPOT,
>  	RISCV_ISA_EXT_KEY_ZIHINTPAUSE,
>  	RISCV_ISA_EXT_KEY_SVINVAL,
>  	RISCV_ISA_EXT_KEY_MAX,
> @@ -90,6 +92,8 @@ static __always_inline int riscv_isa_ext2key(int num)
>  		return RISCV_ISA_EXT_KEY_FPU;
>  	case RISCV_ISA_EXT_d:
>  		return RISCV_ISA_EXT_KEY_FPU;
> +	case RISCV_ISA_EXT_SVNAPOT:
> +		return RISCV_ISA_EXT_KEY_SVNAPOT;

BTW, while you're touching this, can you make this opportunistic cleanup?

@@ -87,7 +87,6 @@ static __always_inline int riscv_isa_ext2key(int num)
 {
        switch (num) {
        case RISCV_ISA_EXT_f:
-               return RISCV_ISA_EXT_KEY_FPU;
        case RISCV_ISA_EXT_d:
                return RISCV_ISA_EXT_KEY_FPU;
        case RISCV_ISA_EXT_ZIHINTPAUSE:

Thanks,
drew


>  	case RISCV_ISA_EXT_ZIHINTPAUSE:
>  		return RISCV_ISA_EXT_KEY_ZIHINTPAUSE;
>  	case RISCV_ISA_EXT_SVINVAL:
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index ac70b0fd9a9a..349fad5e35de 100644
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
> index dc42375c2357..598958cbda50 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -74,6 +74,40 @@ typedef struct {
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
> +#define napot_cont_mask(order)	(napot_cont_size(order) - 1UL)
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
> index c61ae83aadee..af6174e3fd97 100644
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
> @@ -264,10 +266,45 @@ static inline pte_t pud_pte(pud_t pud)
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
> +
> +#else
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
> index bf9dd6764bad..88495f5fcafd 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -165,6 +165,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> +	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 694267d1fe81..ad12fb5363c3 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -205,6 +205,7 @@ void __init riscv_fill_hwcap(void)
>  				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
>  				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
>  				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
> +				SET_ISA_EXT_MAP("svnapot", RISCV_ISA_EXT_SVNAPOT);
>  			}
>  #undef SET_ISA_EXT_MAP
>  		}
> -- 
> 2.37.4
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
