Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA76C04FDE
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 07:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LpBCYWibmTO0ovMxk5ZDSidTFqHZqm0zQhSfDYMcL28=; b=S8GL9btMxcPw4c
	vFvl2sjIVv2e9DdGRArC7rMJh+5O5ZsLg1xzbUQc5+IpKhjU17bKhvnUNlXqua2VWUAU2sIT4uZ22
	V4RHWnvpb0Th7r/MO/tyyiSlN27rG34oMLMez2bL96TKrdId29R2SU7LnhgahwPCD99DowgmFMahu
	DGqBrnlj+FUd0SaQ2rYhGrG5MazOdhoRLPe/B57VrEu2gGTzF9zWFuhPYCONMsZoKk5d8lFRzjw44
	upN1ifQKyN1DhRuGXzI4yf528UdjR4G4ufqjgdIdwKMfRhMO64UQ6Q3n+bEvbSpUfpJiwCESGiFj/
	hE20QVoiWoE5+cmGeKyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4dLw-009V9a-To; Mon, 12 Dec 2022 07:35:57 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4dLo-009V1V-Q3
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 07:35:54 +0000
Received: from [198.18.0.1] (unknown [59.59.28.169])
	by APP-01 (Coremail) with SMTP id qwCowAA3PjbS2ZZjy22eBg--.38321S2;
	Mon, 12 Dec 2022 15:35:46 +0800 (CST)
Message-ID: <a9168a87-1f71-8e48-4528-983323e2f85d@iscas.ac.cn>
Date: Mon, 12 Dec 2022 15:35:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v10 3/3] riscv: mm: support Svnapot in huge vmap
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
 xuyinan@ict.ac.cn, conor@kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20221212065526.805233-1-panqinglin2020@iscas.ac.cn>
 <20221212065526.805233-4-panqinglin2020@iscas.ac.cn>
 <20221212072004.jk2h3xspbrgf7hlz@kamzik>
From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
In-Reply-To: <20221212072004.jk2h3xspbrgf7hlz@kamzik>
X-CM-TRANSID: qwCowAA3PjbS2ZZjy22eBg--.38321S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGF18uF17Kw1ruFW5uFW8tFb_yoW5Ww47pF
	4UCFs7CayrtryYkrWjvr1rXFn0qr15Ka1jv343tryrAw1qkrs3uryrGasY9ry8Ar95AF47
	ArsrXF93Wwn8AFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Sb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVWxJr0_GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8I
	j28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_Jr
	ylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY
	jI0SjxkI62AI1cAE67vIY487MxkIecxEwVAFwVW8CwCF04k20xvY0x0EwIxGrwCFx2IqxV
	CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
	6r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
	WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG
	6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UYxBIdaVFxhVjvjDU0xZFpf9x07j0ksDUUUUU=
X-Originating-IP: [59.59.28.169]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiCQUSDGOWle-NxgAAsW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221211_233552_783474_42B9D0B1 
X-CRM114-Status: GOOD (  12.67  )
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



On 2022/12/12 15:20, Andrew Jones wrote:
> On Mon, Dec 12, 2022 at 02:55:26PM +0800, panqinglin2020@iscas.ac.cn wrote:
>> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>>
>> As HAVE_ARCH_HUGE_VMAP and HAVE_ARCH_HUGE_VMALLOC is supported, we can
>> implement arch_vmap_pte_range_map_size and arch_vmap_pte_supported_shift
>> for Svnapot to support huge vmap about napot size.
>>
>> It can be tested by huge vmap used in pci driver. Huge vmalloc with svnapot
>> can be tested by test_vmalloc with [1] applied, and probe this
>> module to run fix_size_alloc_test with use_huge true.
>>
>> [1]https://lore.kernel.org/all/20221212055657.698420-1-panqinglin2020@iscas.ac.cn/
>>
>> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>>
>> diff --git a/arch/riscv/include/asm/vmalloc.h b/arch/riscv/include/asm/vmalloc.h
>> index 48da5371f1e9..6f7447d563ab 100644
>> --- a/arch/riscv/include/asm/vmalloc.h
>> +++ b/arch/riscv/include/asm/vmalloc.h
>> @@ -17,6 +17,65 @@ static inline bool arch_vmap_pmd_supported(pgprot_t prot)
>>   	return true;
>>   }
>>   
>> -#endif
>> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
>> +#include <linux/pgtable.h>
>>   
>> +#define arch_vmap_pte_range_map_size arch_vmap_pte_range_map_size
>> +static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr, unsigned long end,
>> +							 u64 pfn, unsigned int max_page_shift)
>> +{
>> +	unsigned long size, order;
>> +	unsigned long map_size = PAGE_SIZE;
> 
> Missed this conversion to reverse-xmas tree.

Got it. Will fix it in later resent v10 patchset. :)

> 
>> +
>> +	if (!has_svnapot())
>> +		return map_size;
>> +
>> +	for_each_napot_order_rev(order) {
>> +		if (napot_cont_shift(order) > max_page_shift)
>> +			continue;
>> +
>> +		size = napot_cont_size(order);
>> +		if (end - addr < size)
>> +			continue;
>> +
>> +		if (!IS_ALIGNED(addr, size))
>> +			continue;
>> +
>> +		if (!IS_ALIGNED(PFN_PHYS(pfn), size))
>> +			continue;
>> +
>> +		map_size = size;
>> +		break;
>> +	}
>> +
>> +	return map_size;
>> +}
>> +
>> +#define arch_vmap_pte_supported_shift arch_vmap_pte_supported_shift
>> +static inline int arch_vmap_pte_supported_shift(unsigned long size)
>> +{
>> +	int shift = PAGE_SHIFT;
>> +	unsigned long order;
>> +
>> +	if (!has_svnapot())
>> +		return shift;
>> +
>> +	WARN_ON_ONCE(size >= PMD_SIZE);
>> +
>> +	for_each_napot_order_rev(order) {
>> +		if (napot_cont_size(order) > size)
>> +			continue;
>> +
>> +		if (!IS_ALIGNED(size, napot_cont_size(order)))
>> +			continue;
>> +
>> +		shift = napot_cont_shift(order);
>> +		break;
>> +	}
>> +
>> +	return shift;
>> +}
>> +
>> +#endif /* CONFIG_RISCV_ISA_SVNAPOT */
>> +#endif /* CONFIG_HAVE_ARCH_HUGE_VMAP */
>>   #endif /* _ASM_RISCV_VMALLOC_H */
>> -- 
>> 2.37.4
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
