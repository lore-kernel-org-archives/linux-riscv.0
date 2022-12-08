Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18FBC3A5A7
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 04:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0bp3u/fqfTgDim/+EysYDKxbNmVqYUzgnXSe3nt29yA=; b=1TE6QdZiJxsDsP
	ksY4YW9lyT974PE8vksftZ0E0KLHjBDGLzAKSN5ctM1gpDH0atAYXlt0n5cK3ULEYx+e26NUEtlds
	j03a8DmCL71GJhNqrKq6hoRLvLGn2EIBPDCkSO7hJKubC+IBjin+UdT+ZZ/aA29XhVr7rvY/QN/+9
	ksoCUMgh7gLbm66ZUzktaSbs7WiRUEm1N7baxT+YJMLyJayg2xNnh+uD3n6ih7LoOSqPFZKtvCq2L
	2Ep+tRsjUvpMrnIuiIpLi11p05ryfXuhgobS2HuI8d5CfqtP/aa6yWaOp2LdbZ3iy/JytBmX8Z+C2
	TZChF/8JANu2VhZk4a1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p38se-001q7L-Kz; Thu, 08 Dec 2022 04:51:32 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p38sZ-001pyA-SQ
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 04:51:30 +0000
Received: from [198.18.0.1] (unknown [59.59.28.153])
	by APP-05 (Coremail) with SMTP id zQCowADHze07bZFjhFa5BQ--.30660S2;
	Thu, 08 Dec 2022 12:51:09 +0800 (CST)
Message-ID: <ae8753cd-038c-ecaa-3a39-72cf1340d764@iscas.ac.cn>
Date: Thu, 8 Dec 2022 12:51:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v9 1/3] riscv: mm: modify pte format for Svnapot
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
 xuyinan@ict.ac.cn, ajones@ventanamicro.com, alex@ghiti.fr, jszhang@kernel.org
References: <20221204141137.691790-1-panqinglin2020@iscas.ac.cn>
 <20221204141137.691790-2-panqinglin2020@iscas.ac.cn> <Y5Dfog2HYhejuDX8@spud>
From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
In-Reply-To: <Y5Dfog2HYhejuDX8@spud>
X-CM-TRANSID: zQCowADHze07bZFjhFa5BQ--.30660S2
X-Coremail-Antispam: 1UD129KBjvJXoW3tF4UAryUtFWftFW3AF17GFg_yoWDtrW5pr
	4kCFZakFs8Jw1xC3yIvrn8GFnYqw4DGwn8Kw1j9r48AFWDAryxAr1qk3W3urykXFWvqw1I
	yFWrXF13uanxtFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVWxJr0_GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8I
	j28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr
	4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY
	jI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73Uj
	IFyTuYvjxUg8hLDUUUU
X-Originating-IP: [59.59.28.153]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiBwQODGORPzGLSwAAs9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_205128_341745_E9AC5B54 
X-CRM114-Status: GOOD (  31.81  )
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

Hey!

On 2022/12/8 02:46, Conor Dooley wrote:
> Hey!
> 
> Couple small remarks and questions for you.
> 
> On Sun, Dec 04, 2022 at 10:11:35PM +0800, panqinglin2020@iscas.ac.cn wrote:
>> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>>
>> Add one alternative to enable/disable svnapot support, enable this static
>> key when "svnapot" is in the "riscv,isa" field of fdt and SVNAPOT compile
>> option is set. It will influence the behavior of has_svnapot. All code
>> dependent on svnapot should make sure that has_svnapot return true firstly.
>>
>> Modify PTE definition for Svnapot, and creates some functions in pgtable.h
>> to mark a PTE as napot and check if it is a Svnapot PTE. Until now, only
>> 64KB napot size is supported in spec, so some macros has only 64KB version.
>>
>> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index ef8d66de5f38..1d8477c0af7c 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -395,6 +395,20 @@ config RISCV_ISA_C
>>   
>>   	  If you don't know what to do here, say Y.
>>   
>> +config RISCV_ISA_SVNAPOT
>> +	bool "SVNAPOT extension support"
>> +	depends on 64BIT && MMU
>> +	select RISCV_ALTERNATIVE
>> +	default y
>> +	help
>> +	  Allow kernel to detect SVNAPOT ISA-extension dynamically in boot time
>> +	  and enable its usage.
>> +
>> +	  SVNAPOT extension helps to mark contiguous PTEs as a range
>> +	  of contiguous virtual-to-physical translations, with a naturally
>> +	  aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
>> +	  size.
>> +
>>   config RISCV_ISA_SVPBMT
>>   	bool "SVPBMT extension support"
>>   	depends on 64BIT && MMU
>> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
>> index 4180312d2a70..beadb1126ed9 100644
>> --- a/arch/riscv/include/asm/errata_list.h
>> +++ b/arch/riscv/include/asm/errata_list.h
>> @@ -22,9 +22,10 @@
>>   #define	ERRATA_THEAD_NUMBER 3
>>   #endif
>>   
>> -#define	CPUFEATURE_SVPBMT 0
>> -#define	CPUFEATURE_ZICBOM 1
>> -#define	CPUFEATURE_NUMBER 2
>> +#define	CPUFEATURE_SVPBMT	0
>> +#define	CPUFEATURE_ZICBOM	1
>> +#define	CPUFEATURE_SVNAPOT	2
>> +#define	CPUFEATURE_NUMBER	3
>>   
>>   #ifdef __ASSEMBLY__
>>   
>> @@ -156,6 +157,14 @@ asm volatile(ALTERNATIVE(						\
>>   	: "=r" (__ovl) :						\
>>   	: "memory")
>>   
>> +#define ALT_SVNAPOT(_val)						\
>> +asm(ALTERNATIVE(							\
>> +	"li %0, 0",							\
>> +	"li %0, 1",							\
>> +		0, CPUFEATURE_SVNAPOT, CONFIG_RISCV_ISA_SVNAPOT)	\
>> +	: "=r" (_val) :							\
>> +	: "memory")
>> +
>>   #endif /* __ASSEMBLY__ */
>>   
>>   #endif
>> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>> index b22525290073..4cbc1f45ab26 100644
>> --- a/arch/riscv/include/asm/hwcap.h
>> +++ b/arch/riscv/include/asm/hwcap.h
>> @@ -54,6 +54,7 @@ extern unsigned long elf_hwcap;
>>    */
>>   enum riscv_isa_ext_id {
>>   	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
>> +	RISCV_ISA_EXT_SVNAPOT,
>>   	RISCV_ISA_EXT_SVPBMT,
>>   	RISCV_ISA_EXT_ZICBOM,
>>   	RISCV_ISA_EXT_ZIHINTPAUSE,
>> @@ -87,7 +88,6 @@ static __always_inline int riscv_isa_ext2key(int num)
>>   {
>>   	switch (num) {
>>   	case RISCV_ISA_EXT_f:
>> -		return RISCV_ISA_EXT_KEY_FPU;
>>   	case RISCV_ISA_EXT_d:
>>   		return RISCV_ISA_EXT_KEY_FPU;
>>   	case RISCV_ISA_EXT_ZIHINTPAUSE:
>> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
>> index ac70b0fd9a9a..349fad5e35de 100644
>> --- a/arch/riscv/include/asm/page.h
>> +++ b/arch/riscv/include/asm/page.h
>> @@ -16,11 +16,6 @@
>>   #define PAGE_SIZE	(_AC(1, UL) << PAGE_SHIFT)
>>   #define PAGE_MASK	(~(PAGE_SIZE - 1))
>>   
>> -#ifdef CONFIG_64BIT
>> -#define HUGE_MAX_HSTATE		2
>> -#else
>> -#define HUGE_MAX_HSTATE		1
>> -#endif
>>   #define HPAGE_SHIFT		PMD_SHIFT
>>   #define HPAGE_SIZE		(_AC(1, UL) << HPAGE_SHIFT)
>>   #define HPAGE_MASK              (~(HPAGE_SIZE - 1))
>> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
>> index dc42375c2357..9611833907ec 100644
>> --- a/arch/riscv/include/asm/pgtable-64.h
>> +++ b/arch/riscv/include/asm/pgtable-64.h
>> @@ -74,6 +74,40 @@ typedef struct {
>>    */
>>   #define _PAGE_PFN_MASK  GENMASK(53, 10)
>>   
>> +/*
>> + * [63] Svnapot definitions:
>> + * 0 Svnapot disabled
>> + * 1 Svnapot enabled
>> + */
>> +#define _PAGE_NAPOT_SHIFT	63
>> +#define _PAGE_NAPOT		BIT(_PAGE_NAPOT_SHIFT)
>> +/*
>> + * Only 64KB (order 4) napot ptes supported.
>> + */
>> +#define NAPOT_CONT_ORDER_BASE 4
>> +enum napot_cont_order {
>> +	NAPOT_CONT64KB_ORDER = NAPOT_CONT_ORDER_BASE,
>> +	NAPOT_ORDER_MAX,
>> +};
>> +
>> +#define for_each_napot_order(order)						\
>> +	for (order = NAPOT_CONT_ORDER_BASE; order < NAPOT_ORDER_MAX; order++)
>> +#define for_each_napot_order_rev(order)						\
> 
> Would it be terrible to do s/rev/reverse to make things more obvious?

Maybe we should just keep it in the same style as existing macros like
for_each_mem_range/for_each_mem_range_rev :)

> 
>> +	for (order = NAPOT_ORDER_MAX - 1;					\
>> +	     order >= NAPOT_CONT_ORDER_BASE; order--)
>> +#define napot_cont_order(val)	(__builtin_ctzl((val.pte >> _PAGE_PFN_SHIFT) << 1))
>> +
>> +#define napot_cont_shift(order)	((order) + PAGE_SHIFT)
>> +#define napot_cont_size(order)	BIT(napot_cont_shift(order))
>> +#define napot_cont_mask(order)	(~(napot_cont_size(order) - 1UL))
>> +#define napot_pte_num(order)	BIT(order)
>> +
>> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
>> +#define HUGE_MAX_HSTATE		(2 + (NAPOT_ORDER_MAX - NAPOT_CONT_ORDER_BASE))
>> +#else
>> +#define HUGE_MAX_HSTATE		2
>> +#endif
> 
> This is coming from a place of *complete* ignorance:
> If CONFIG_RISCV_ISA_SVNAPOT is enabled in the kernel but there is no
> support for it on a platform is it okay to change the value of
> HUGE_MAX_HSTATE? Apologies if I've missed something obvious.

:(
You are right. If CONFIG_RISCV_ISA_SVNAPOT is enabled, HUGE_MAX_HSTATE
will always be 3 whether has_svnapot() is true or false. I will try to
fix this.

> 
>> +
>>   /*
>>    * [62:61] Svpbmt Memory Type definitions:
>>    *
>> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>> index c61ae83aadee..99957b1270f2 100644
>> --- a/arch/riscv/include/asm/pgtable.h
>> +++ b/arch/riscv/include/asm/pgtable.h
>> @@ -6,10 +6,12 @@
>>   #ifndef _ASM_RISCV_PGTABLE_H
>>   #define _ASM_RISCV_PGTABLE_H
>>   
>> +#include <linux/jump_label.h>
>>   #include <linux/mmzone.h>
>>   #include <linux/sizes.h>
>>   
>>   #include <asm/pgtable-bits.h>
>> +#include <asm/hwcap.h>
>>   
>>   #ifndef CONFIG_MMU
>>   #define KERNEL_LINK_ADDR	PAGE_OFFSET
>> @@ -264,10 +266,49 @@ static inline pte_t pud_pte(pud_t pud)
>>   	return __pte(pud_val(pud));
>>   }
>>   
>> +static __always_inline bool has_svnapot(void)
>> +{
>> +	unsigned int _val;
>> +
>> +	ALT_SVNAPOT(_val);
>> +
>> +	return _val;
>> +}
>> +
>> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
>> +
>> +static inline unsigned long pte_napot(pte_t pte)
>> +{
>> +	return pte_val(pte) & _PAGE_NAPOT;
>> +}
>> +
>> +static inline pte_t pte_mknapot(pte_t pte, unsigned int order)
>> +{
>> +	int pos = order - 1 + _PAGE_PFN_SHIFT;
>> +	unsigned long napot_bit = BIT(pos);
>> +	unsigned long napot_mask = ~GENMASK(pos, _PAGE_PFN_SHIFT);
>> +
>> +	return __pte((pte_val(pte) & napot_mask) | napot_bit | _PAGE_NAPOT);
>> +}
>> +
>> +#else
>> +
>> +static inline unsigned long pte_napot(pte_t pte)
>> +{
>> +	return 0;
>> +}
>> +
>> +#endif /* CONFIG_RISCV_ISA_SVNAPOT */
>> +
>>   /* Yields the page frame number (PFN) of a page table entry */
>>   static inline unsigned long pte_pfn(pte_t pte)
>>   {
>> -	return __page_val_to_pfn(pte_val(pte));
>> +	unsigned long res  = __page_val_to_pfn(pte_val(pte));
> 
> nit: extra space before the =

Nice catch! Will remove this extra space :)

> 
>> +
>> +	if (has_svnapot() && pte_napot(pte))
>> +		res = res & (res - 1UL);
>> +
>> +	return res;
>>   }
>>   
>>   #define pte_page(x)     pfn_to_page(pte_pfn(x))
>> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
>> index bf9dd6764bad..88495f5fcafd 100644
>> --- a/arch/riscv/kernel/cpu.c
>> +++ b/arch/riscv/kernel/cpu.c
>> @@ -165,6 +165,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
>>   	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>>   	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>>   	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
>> +	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>>   	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>>   	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>>   	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> index 694267d1fe81..eeed66c3d497 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -205,6 +205,7 @@ void __init riscv_fill_hwcap(void)
>>   				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
>>   				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
>>   				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
>> +				SET_ISA_EXT_MAP("svnapot", RISCV_ISA_EXT_SVNAPOT);
>>   			}
>>   #undef SET_ISA_EXT_MAP
>>   		}
>> @@ -252,6 +253,17 @@ void __init riscv_fill_hwcap(void)
>>   }
>>   
>>   #ifdef CONFIG_RISCV_ALTERNATIVE
>> +static bool __init_or_module cpufeature_probe_svnapot(unsigned int stage)
>> +{
>> +	if (!IS_ENABLED(CONFIG_RISCV_ISA_SVNAPOT))
>> +		return false;
>> +
>> +	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
>> +		return false;
>> +
>> +	return riscv_isa_extension_available(NULL, SVNAPOT);
>> +}
>> +
>>   static bool __init_or_module cpufeature_probe_svpbmt(unsigned int stage)
>>   {
>>   	if (!IS_ENABLED(CONFIG_RISCV_ISA_SVPBMT))
>> @@ -289,6 +301,9 @@ static u32 __init_or_module cpufeature_probe(unsigned int stage)
>>   {
>>   	u32 cpu_req_feature = 0;
>>   
>> +	if (cpufeature_probe_svnapot(stage))
>> +		cpu_req_feature |= BIT(CPUFEATURE_SVNAPOT);
>> +
>>   	if (cpufeature_probe_svpbmt(stage))
>>   		cpu_req_feature |= BIT(CPUFEATURE_SVPBMT);
>>   
> 
> There's a bunch of stuff in this patch that may go away, depending on
> sequencing just FYI. See [1] for more. I wouldn't rebase on top of that,
> but just so that you're aware.

Thanks for the information! If this patchset will be merged firstly, 
Jisheng can easily replace implementation of has_svnapot with his 
interface. Otherwise I will do this replacement :)

Thanks,
Qinglin

> 
> 1 - https://patchwork.kernel.org/project/linux-riscv/cover/20221204174632.3677-1-jszhang@kernel.org/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
