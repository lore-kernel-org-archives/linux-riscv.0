Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AA0C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 14:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hgu2M7nyUcKbJChHHA+qQKZ10a41fI+s0Sme0vYsMfs=; b=WRXGgUmFAgSSTE
	llbvw2B3n3RyOcBHfn8IKk2VzPepMv7DqvSvWwlFN1JRNkUFVgOTw2urQ0qDa1qesREilDb6kSCQO
	pXxXKdSENJDfOCUrXuJPDCy3l3Aq0orEcYGuKujfEc292Pub1u83I5uQW1i5ebtmWVHtmZ5gOnzOz
	PJ9XgDe6auapOlyp+a6/unWhsLrmlDHayvMMbRVrrzhxIF4wrVrcou2h33MyNDPyAXK8qOt07uT2+
	SSCKqrY7bW6+xaMLgS/Q8boUjc91NbFgzsK59S8xJ6LpmkBPTJx2uyVXGcsY8YlOmD9ryVsqijXmK
	egN82YILVJgjP2pjLrGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyZaW-00GzSG-M4; Fri, 25 Nov 2022 14:21:56 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyZaT-00GzNe-0T
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 14:21:55 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id ACE501C0003;
	Fri, 25 Nov 2022 14:21:38 +0000 (UTC)
Message-ID: <8dab35cd-070b-519f-b435-c2f01287cf53@ghiti.fr>
Date: Fri, 25 Nov 2022 15:21:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 1/3] riscv: mm: modify pte format for Svnapot
To: panqinglin2020@iscas.ac.cn, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org
Cc: jeff@riscv.org, xuyinan@ict.ac.cn, conor@kernel.org,
 ajones@ventanamicro.com
References: <20221119112242.3593646-1-panqinglin2020@iscas.ac.cn>
 <20221119112242.3593646-2-panqinglin2020@iscas.ac.cn>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20221119112242.3593646-2-panqinglin2020@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_062153_483228_772B90E8 
X-CRM114-Status: GOOD (  28.46  )
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

Hi Qinglin,

On 11/19/22 12:22, panqinglin2020@iscas.ac.cn wrote:
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
> index 7cd981f96f48..31f9a5a160a0 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -394,6 +394,20 @@ config RISCV_ISA_C
>   
>   	  If you don't know what to do here, say Y.
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
>   config RISCV_ISA_SVPBMT
>   	bool "SVPBMT extension support"
>   	depends on 64BIT && MMU
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index b22525290073..15cda8f131aa 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -54,6 +54,7 @@ extern unsigned long elf_hwcap;
>    */
>   enum riscv_isa_ext_id {
>   	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
> +	RISCV_ISA_EXT_SVNAPOT,
>   	RISCV_ISA_EXT_SVPBMT,
>   	RISCV_ISA_EXT_ZICBOM,
>   	RISCV_ISA_EXT_ZIHINTPAUSE,
> @@ -69,6 +70,7 @@ enum riscv_isa_ext_id {
>    */
>   enum riscv_isa_ext_key {
>   	RISCV_ISA_EXT_KEY_FPU,		/* For 'F' and 'D' */
> +	RISCV_ISA_EXT_KEY_SVNAPOT,
>   	RISCV_ISA_EXT_KEY_ZIHINTPAUSE,
>   	RISCV_ISA_EXT_KEY_SVINVAL,
>   	RISCV_ISA_EXT_KEY_MAX,
> @@ -90,6 +92,8 @@ static __always_inline int riscv_isa_ext2key(int num)
>   		return RISCV_ISA_EXT_KEY_FPU;
>   	case RISCV_ISA_EXT_d:
>   		return RISCV_ISA_EXT_KEY_FPU;
> +	case RISCV_ISA_EXT_SVNAPOT:
> +		return RISCV_ISA_EXT_KEY_SVNAPOT;
>   	case RISCV_ISA_EXT_ZIHINTPAUSE:
>   		return RISCV_ISA_EXT_KEY_ZIHINTPAUSE;
>   	case RISCV_ISA_EXT_SVINVAL:
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index ac70b0fd9a9a..349fad5e35de 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -16,11 +16,6 @@
>   #define PAGE_SIZE	(_AC(1, UL) << PAGE_SHIFT)
>   #define PAGE_MASK	(~(PAGE_SIZE - 1))
>   
> -#ifdef CONFIG_64BIT
> -#define HUGE_MAX_HSTATE		2
> -#else
> -#define HUGE_MAX_HSTATE		1


It looks like the definition for the 32-bit case disappeared in your 
patchset.


> -#endif
>   #define HPAGE_SHIFT		PMD_SHIFT
>   #define HPAGE_SIZE		(_AC(1, UL) << HPAGE_SHIFT)
>   #define HPAGE_MASK              (~(HPAGE_SIZE - 1))
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> index dc42375c2357..598958cbda50 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -74,6 +74,40 @@ typedef struct {
>    */
>   #define _PAGE_PFN_MASK  GENMASK(53, 10)
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


Maybe nit but I would have added + 1 instead of shifting by 1 here, it 
sounds clearer to me.


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
>   /*
>    * [62:61] Svpbmt Memory Type definitions:
>    *
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index c61ae83aadee..5b8301586518 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -6,10 +6,12 @@
>   #ifndef _ASM_RISCV_PGTABLE_H
>   #define _ASM_RISCV_PGTABLE_H
>   
> +#include <linux/jump_label.h>
>   #include <linux/mmzone.h>
>   #include <linux/sizes.h>
>   
>   #include <asm/pgtable-bits.h>
> +#include <asm/hwcap.h>
>   
>   #ifndef CONFIG_MMU
>   #define KERNEL_LINK_ADDR	PAGE_OFFSET
> @@ -264,10 +266,38 @@ static inline pte_t pud_pte(pud_t pud)
>   	return __pte(pud_val(pud));
>   }
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
>   /* Yields the page frame number (PFN) of a page table entry */
>   static inline unsigned long pte_pfn(pte_t pte)
>   {
> -	return __page_val_to_pfn(pte_val(pte));
> +	unsigned long val  = pte_val(pte);
> +	unsigned long res  = __page_val_to_pfn(val);
> +
> +	if (has_svnapot())
> +		res = res & (res - (val >> _PAGE_NAPOT_SHIFT));
> +
> +	return res;
>   }
>   
>   #define pte_page(x)     pfn_to_page(pte_pfn(x))
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index bf9dd6764bad..88495f5fcafd 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -165,6 +165,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
>   	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>   	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>   	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> +	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>   	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>   	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>   	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 694267d1fe81..ad12fb5363c3 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -205,6 +205,7 @@ void __init riscv_fill_hwcap(void)
>   				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
>   				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
>   				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
> +				SET_ISA_EXT_MAP("svnapot", RISCV_ISA_EXT_SVNAPOT);
>   			}
>   #undef SET_ISA_EXT_MAP
>   		}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
