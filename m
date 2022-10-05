Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7913C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 14:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AObph1Sl8WQqXhCVxqK5XC1DwghvOB/+jCU19qwj/+I=; b=DF6M3NW0eFgCmZ
	r+0eakDiv7rNNgoVrVyJCxHnJ1KRgNgTt1F8ezqTqjEKEh1HQ7hZ4TlwqDm7n9GrfhjZVLexsMTNY
	Zv3SEc01Bn0LENEHn4ovxcf7jIgbpQ/2iZwo8iJShXSAe8tkI1jGJ2ZZeo8qElCIUg98MasZy8a6s
	FB8Gk8GgL/0N0sEsrtQ5c3zryMs7Lc6R4r0VOQpcG7PmIhjk8aKyMykMbTHag3LSUdLeGz93b5nJ4
	39tjyuwu5Rs33Zs9eYh16y9Wh0UFD1bPPzRAjpwUwCmo88bwn81T1VRjkMbpl44gNZOFjdibOaj9b
	cEU5iwixySIdRs7kgmSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og5fn-00Efqg-NO; Wed, 05 Oct 2022 14:46:59 +0000
Received: from smtp23.cstnet.cn ([159.226.251.23] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og5fi-00Efpw-Hb
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 14:46:57 +0000
Received: from [124.16.96.231] (unknown [124.16.96.231])
	by APP-03 (Coremail) with SMTP id rQCowACHOVnSmD1j72UTAw--.51055S3;
	Wed, 05 Oct 2022 22:46:43 +0800 (CST)
Message-ID: <071c426e-16be-2720-41c4-cede59e2d82b@iscas.ac.cn>
Date: Wed, 5 Oct 2022 22:46:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.1
Subject: Re: [PATCH v6 1/4] riscv: mm: modify pte format for Svnapot
To: Andrew Jones <ajones@ventanamicro.com>
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
 xuyinan@ict.ac.cn, conor@kernel.org
References: <20221005112926.3043280-1-panqinglin2020@iscas.ac.cn>
 <20221005112926.3043280-2-panqinglin2020@iscas.ac.cn>
 <20221005141700.yu7mf23ru4bkf43z@kamzik>
From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
In-Reply-To: <20221005141700.yu7mf23ru4bkf43z@kamzik>
X-CM-TRANSID: rQCowACHOVnSmD1j72UTAw--.51055S3
X-Coremail-Antispam: 1UD129KBjvJXoWxuFW8JFWfArWfuF18Ar13urg_yoW3Xry5pr
	4kGFZ3CF4kJw1xCayIvrn8Wr18Xw4DGwsxKw1I9rW8J34DAryxJ34DAa4akw1kXFWvqw10
	vFWrXF1fuanIyFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq
	07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r
	18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l
	c7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07bonQUUUUUU=
X-Originating-IP: [124.16.96.231]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiCQUKDGM9K9CZlgAAsg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_074654_992744_769F8BC3 
X-CRM114-Status: GOOD (  26.77  )
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

On 10/5/22 10:17 PM, Andrew Jones wrote:
> On Wed, Oct 05, 2022 at 07:29:23PM +0800, panqinglin2020@iscas.ac.cn wrote:
>> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>>
>> Add one static key to enable/disable svnapot support, enable this static
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
>> index d557cc50295d..69e88ab8fafd 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -383,6 +383,20 @@ config RISCV_ISA_C
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
>> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>> index 6f59ec64175e..2c45cc0d5d3c 100644
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
>> @@ -68,6 +69,7 @@ enum riscv_isa_ext_id {
>>    */
>>   enum riscv_isa_ext_key {
>>   	RISCV_ISA_EXT_KEY_FPU,		/* For 'F' and 'D' */
>> +	RISCV_ISA_EXT_KEY_SVNAPOT,
>>   	RISCV_ISA_EXT_KEY_ZIHINTPAUSE,
>>   	RISCV_ISA_EXT_KEY_MAX,
>>   };
>> @@ -88,6 +90,8 @@ static __always_inline int riscv_isa_ext2key(int num)
>>   		return RISCV_ISA_EXT_KEY_FPU;
>>   	case RISCV_ISA_EXT_d:
>>   		return RISCV_ISA_EXT_KEY_FPU;
>> +	case RISCV_ISA_EXT_SVNAPOT:
>> +		return RISCV_ISA_EXT_KEY_SVNAPOT;
>>   	case RISCV_ISA_EXT_ZIHINTPAUSE:
>>   		return RISCV_ISA_EXT_KEY_ZIHINTPAUSE;
>>   	default:
>> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
>> index dc42375c2357..1cd0ffbfbdaa 100644
>> --- a/arch/riscv/include/asm/pgtable-64.h
>> +++ b/arch/riscv/include/asm/pgtable-64.h
>> @@ -74,6 +74,19 @@ typedef struct {
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
>> +#define NAPOT_CONT64KB_ORDER	4UL
>> +#define NAPOT_CONT64KB_SHIFT	(NAPOT_CONT64KB_ORDER + PAGE_SHIFT)
>> +#define NAPOT_CONT64KB_SIZE	BIT(NAPOT_CONT64KB_SHIFT)
>> +#define NAPOT_CONT64KB_MASK	(NAPOT_CONT64KB_SIZE - 1UL)
>> +#define NAPOT_64KB_PTE_NUM	BIT(NAPOT_CONT64KB_ORDER)
> 
> I still wonder if we shouldn't future-proof a bit with something like
> 
> /*
>   * Only 64KB (order 4) napot ptes supported.
>   */
> #define napot_cont_order(pte)	4
> 
> #define napot_cont_shift(order)	((order) + PAGE_SHIFT)
> #define napot_cont_size(order)	BIT(napot_cont_shift(order))
> #define napot_cont_mask(order)	BIT(napot_cont_size(order) - 1)
> #define napot_pte_num(order)	BIT(order)

Maybe we can declare legal napot order in a enum, and use the enum with
these macros you have mentioned above. I will try to do this in the v8
patchset.

> 
>> +
>>   /*
>>    * [62:61] Svpbmt Memory Type definitions:
>>    *
>> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>> index 7ec936910a96..a8cab063fd05 100644
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
>> @@ -264,10 +266,38 @@ static inline pte_t pud_pte(pud_t pud)
>>   	return __pte(pud_val(pud));
>>   }
>>   
>> +static __always_inline bool has_svnapot(void)
>> +{
>> +	return static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_SVNAPOT]);
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
>> +#endif /* CONFIG_RISCV_ISA_SVNAPOT */
>> +
>>   /* Yields the page frame number (PFN) of a page table entry */
>>   static inline unsigned long pte_pfn(pte_t pte)
>>   {
>> -	return __page_val_to_pfn(pte_val(pte));
>> +	unsigned long val  = pte_val(pte);
>> +	unsigned long res  = __page_val_to_pfn(val);
>> +
>> +	if (has_svnapot())
>> +		res = res & (res - (val >> _PAGE_NAPOT_SHIFT));
> 
> nit: res &= ...

Will do it in the v8 patchset.

> 
> This is much easier to read. I presume the static key is doing its
> thing and the instructions come out the same as with the errata
> framework?
> 
> A comment explaining what it's doing and how it works would be good for
> new readers and for myself, since I'll probably forget by next week...
> 

Will add a explaining comment for it.

>> +
>> +	return res;
>>   }
>>   
>>   #define pte_page(x)     pfn_to_page(pte_pfn(x))
>> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
>> index 0be8a2403212..d2a61122c595 100644
>> --- a/arch/riscv/kernel/cpu.c
>> +++ b/arch/riscv/kernel/cpu.c
>> @@ -96,6 +96,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
>>   	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>>   	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>>   	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>> +	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>>   	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
>>   };
>>   
>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> index 553d755483ed..bc247844e42d 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -204,6 +204,7 @@ void __init riscv_fill_hwcap(void)
>>   				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
>>   				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
>>   				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
>> +				SET_ISA_EXT_MAP("svnapot", RISCV_ISA_EXT_SVNAPOT);
>>   			}
>>   #undef SET_ISA_EXT_MAP
>>   		}
>> -- 
>> 2.35.1
>>
> 
> Otherwise
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
