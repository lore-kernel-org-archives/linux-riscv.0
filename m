Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC57C433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Nov 2022 18:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VgjU9XY5UIGvYcN9A/Ltg2C0OzS+fhQgAyshGiaDkY0=; b=xxO9DJsSAJjSGk
	dR2gu/onlXyW2wi3g73MCVLA7y2JKMRq/sSzc+B+HFylaKQQby5F3NSPvsU581KmHGQA+eN0eWP4e
	v3Zt7x56vLtironMecDWY+k4Dbr6DMmglMhH2wt8LcQmZWzgPWQq8eNaI0FqWue2NT4gPyu8JA3x4
	Rt+phvtUhLAgcFxwr8Rh7rYGqb9bTXhM64nif/uORIMhk8tlBppdCeOyR20yNPkNn3NCWezVuibqA
	lxYPKyCfSDQ9hUS2ryMVt/0Vg0QTas9QEe3JyJ6StYYrFYxJ64OJlOu7lsxUV8+Y0GhFpM3xYnQIx
	PW0aJFT2DefiQjm1VcHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owSQJ-00FrB6-RZ; Sat, 19 Nov 2022 18:18:39 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owSQF-00Fr9H-Vi
	for linux-riscv@lists.infradead.org; Sat, 19 Nov 2022 18:18:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id E0EFDCE0A6A;
	Sat, 19 Nov 2022 18:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD619C433C1;
	Sat, 19 Nov 2022 18:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668881912;
	bh=+sIGCkzvoGFdMi5ImYoY7sUj7IltypI/53CGis6Bm6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LVJmLKb1W0D+ite+b5pe2s/G/P/TjCHkIv07d/mQGZSziVXryMNOwGw1uWQrR/G2e
	 mxL+1nMXwFfS8k2KqrRkhbxp3k58WLs3j+uhOJCy7q9ZO1D0Y4fxs6ntMGkAx8WdKY
	 LG+VRv4b3dMIdVROPMU7rzfilVEgAu6Dy8Dtv1F5Fpr/JThoA2b/aEOUmkYlqf3VXw
	 igbvP8kr8NvOIr+ReZ8jOZWYxXx9a2hy75/wfr4D8ybSMA/fexb0iJPMyZP3jZV9on
	 3Nqt+vIRB/4wiCLAj52daTGF+SA+mWHfMmqWtnvZ4sMYl1LnN0hyJzdmvMVq78L55r
	 r5H/auoRgbuhw==
Date: Sat, 19 Nov 2022 18:18:28 +0000
From: Conor Dooley <conor@kernel.org>
To: panqinglin2020@iscas.ac.cn
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
	xuyinan@ict.ac.cn, ajones@ventanamicro.com
Subject: Re: [PATCH v7 1/3] riscv: mm: modify pte format for Svnapot
Message-ID: <Y3kd9C29IM7ySuaz@spud>
References: <20221119112242.3593646-1-panqinglin2020@iscas.ac.cn>
 <20221119112242.3593646-2-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221119112242.3593646-2-panqinglin2020@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221119_101836_427939_BC4B2708 
X-CRM114-Status: GOOD (  31.55  )
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

On Sat, Nov 19, 2022 at 07:22:40PM +0800, panqinglin2020@iscas.ac.cn wrote:
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

Hey Qinglin,

Looks like this patch breaks the rv32 build:
  CC      arch/riscv/kernel/asm-offsets.s
In file included from ../arch/riscv/kernel/asm-offsets.c:10:
In file included from ../include/linux/mm.h:29:
In file included from ../include/linux/pgtable.h:6:
../arch/riscv/include/asm/pgtable.h:298:30: error: use of undeclared identifier '_PAGE_NAPOT_SHIFT'
                res = res & (res - (val >> _PAGE_NAPOT_SHIFT));
                                           ^
In file included from ../arch/riscv/kernel/asm-offsets.c:10:

(rv32_defconfig + clang-15)

> 
> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 7cd981f96f48..31f9a5a160a0 100644
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
> index c61ae83aadee..5b8301586518 100644
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
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
