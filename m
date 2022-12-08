Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC222C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 04:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CfM9sJhAxqcQatTg2KLe1HVwHmbnGZR9JJuRn/eobJ0=; b=2VW4PoNJnTJX22
	1NsQW4sZU9RjWs+JEEVgGW/hoSroUq9Os1/Ii6F6gM85VabbNGLypMJNNcOjcH5q0YSK8x99yUWeA
	AaUWNL0hCmlgNqnzli/MKqdLSWKW7VudwXLAMcGac+ATDB5VW1/XTXnOY98lJGWT7+2mz7uT2DUUo
	qJMu1jafB0PVUG2QuMvK3DYS4lNOdtcO+6/elOEn5jhF8cRYj0Jflvt5ZwEwhEGpkMSU3rSgrFJ3n
	HimGWEXFLEciwrw8RtVmDl4OiD2MdjRRUbfY3pElT7azeBdLeWVxpfXjvrjkwLQt4cTCNur2VZnPh
	zOkXBQoAh6oYMt5qti8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p38yl-001uZf-BA; Thu, 08 Dec 2022 04:57:51 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p38yh-001uVr-Tb
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 04:57:50 +0000
Received: from [198.18.0.1] (unknown [59.59.28.153])
	by APP-05 (Coremail) with SMTP id zQCowAB3fe3EbpFjqJO5BQ--.30540S2;
	Thu, 08 Dec 2022 12:57:40 +0800 (CST)
Message-ID: <0a5063d6-a9c9-e809-ce7b-d461b8683258@iscas.ac.cn>
Date: Thu, 8 Dec 2022 12:57:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v9 3/3] riscv: mm: support Svnapot in huge vmap
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
 xuyinan@ict.ac.cn, ajones@ventanamicro.com, alex@ghiti.fr, jszhang@kernel.org
References: <20221204141137.691790-1-panqinglin2020@iscas.ac.cn>
 <20221204141137.691790-4-panqinglin2020@iscas.ac.cn> <Y5DihlKTtRFTil+S@spud>
From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
In-Reply-To: <Y5DihlKTtRFTil+S@spud>
X-CM-TRANSID: zQCowAB3fe3EbpFjqJO5BQ--.30540S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCF4kJw1UXw4xtw4UZw4UCFg_yoW5ZF1kpF
	48CFs7CFW8tryYk3yjvr1jgFn0vr15Cw4jv343tFykA34qyF4fur95Ga4F9348Ar95JF47
	Ar4DWF97Wwn8AFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Sb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVWxJr0_GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8I
	j28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF
	1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY
	jI0SjxkI62AI1cAE67vIY487MxkIecxEwVAFwVW8XwCF04k20xvY0x0EwIxGrwCFx2IqxV
	CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
	6r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
	WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG
	6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UYxBIdaVFxhVjvjDU0xZFpf9x07boHUgUUUUU=
X-Originating-IP: [59.59.28.153]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiBwUODGORPzGN3QAAss
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_205748_358996_8CA30F71 
X-CRM114-Status: GOOD (  14.08  )
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

On 2022/12/8 02:59, Conor Dooley wrote:
> On Sun, Dec 04, 2022 at 10:11:37PM +0800, panqinglin2020@iscas.ac.cn wrote:
>> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>>
>> As HAVE_ARCH_HUGE_VMAP and HAVE_ARCH_HUGE_VMALLOC is supported, we can
>> implement arch_vmap_pte_range_map_size and arch_vmap_pte_supported_shift
>> for Svnapot to support huge vmap about napot size.
>>
>> It can be tested by huge vmap used in pci driver. Huge vmalloc with svnapot
>> can be tested by changing test_vmalloc module like [1], and probe this
>> module to run fix_size_alloc_test with use_huge true.
>>
>> [1]https://github.com/RV-VM/linux-vm-support/commit/33f4ee399c36d355c412ebe5334ca46fd727f8f5
> 
> Please make this one a standard Link: tag.

Got it.

> 
>>
>> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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
>> +
>> +	if (!has_svnapot())
>> +		return map_size;
> 
> These ones are obvious about what you're gonna do if !has_svnapot()
> though, nice :)
> With a proper Link: tag
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Qinglin.

> 
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
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
