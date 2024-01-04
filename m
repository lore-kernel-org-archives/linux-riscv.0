Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188FBC47074
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 10:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HrnUkruabmYa8Vsb1W+de5+TmWFfWhdgowUT22KPTZQ=; b=C5f+Xz+Z/CoemD
	lCIir7e+SW0hURnU2MZfyEZdTkSQPVjscaLvAxK9Ar1FM8TUiMamLVAzqozA9QkUr3SDt64SCBJ9N
	8ruTsFE75TgGJ/d6lv8arCOCLdmgGJF94v7ASqDklQCUM8EEMWwdbbjatCJgKJCKf+vMk0Uz+k0lf
	z9/mhgyJt/98Lf8Ua/c1afBfYnpzt/O2PrFNATWHKdKPo1mksA0fEezS9d4lQMLyO39h5umIZw8Ts
	kwdi++xDRcZkOgao0MwTYOifs/iiUsMxmMC0GKkpyPdcqeTHPwxLjbU3rgLjdam4AEw8I7V3yk7Zm
	82TD2U/wZf3cR9rKlMNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLLEy-00DZem-1t;
	Thu, 04 Jan 2024 10:46:20 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLLEv-00DZbv-2i
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 10:46:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D55FC0006;
	Thu,  4 Jan 2024 10:46:14 +0000 (UTC)
Message-ID: <509f3dd7-1c38-4b98-b21b-28d50399a344@ghiti.fr>
Date: Thu, 4 Jan 2024 11:46:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] riscv: enable HAVE_FAST_GUP if MMU
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Will Deacon <will@kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org
References: <20231219175046.2496-1-jszhang@kernel.org>
 <20231219175046.2496-5-jszhang@kernel.org>
 <3d36ca3c-9a91-41a7-9e68-288982c2c8a8@ghiti.fr> <ZZOCRZjBch1grrFp@xhacker>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <ZZOCRZjBch1grrFp@xhacker>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_024618_026555_DA85DDFC 
X-CRM114-Status: GOOD (  13.07  )
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

On 02/01/2024 04:25, Jisheng Zhang wrote:
> On Sun, Dec 31, 2023 at 07:37:33AM +0100, Alexandre Ghiti wrote:
>> On 19/12/2023 18:50, Jisheng Zhang wrote:
>>> Activate the fast gup for riscv mmu platforms. Here are some
>>> GUP_FAST_BENCHMARK performance numbers:
>>>
>>> Before the patch:
>>> GUP_FAST_BENCHMARK: Time: get:53203 put:5085 us
>>>
>>> After the patch:
>>> GUP_FAST_BENCHMARK: Time: get:17711 put:5060 us
>>
>> On which platform did you run this benchmark?
> T-HEAD th1520(cpufreq isn't enabled since the clk/pll isn't upstreamed,
> so cpu is running at the default freq set by u-boot)
>>
>>> The get time is reduced by 66.7%! IOW, 3x get speed!
>>
>> Well done!
>>
>> Thanks,
>>
>> Alex
>>
>>
>>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>>> ---
>>>    arch/riscv/Kconfig               | 1 +
>>>    arch/riscv/include/asm/pgtable.h | 6 ++++++
>>>    2 files changed, 7 insertions(+)
>>>
>>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>>> index d3555173d9f4..04df9920282d 100644
>>> --- a/arch/riscv/Kconfig
>>> +++ b/arch/riscv/Kconfig
>>> @@ -119,6 +119,7 @@ config RISCV
>>>    	select HAVE_FUNCTION_GRAPH_RETVAL if HAVE_FUNCTION_GRAPH_TRACER
>>>    	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
>>>    	select HAVE_EBPF_JIT if MMU
>>> +	select HAVE_FAST_GUP if MMU
>>>    	select HAVE_FUNCTION_ARG_ACCESS_API
>>>    	select HAVE_FUNCTION_ERROR_INJECTION
>>>    	select HAVE_GCC_PLUGINS
>>> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>>> index ab00235b018f..c6eb214139e6 100644
>>> --- a/arch/riscv/include/asm/pgtable.h
>>> +++ b/arch/riscv/include/asm/pgtable.h
>>> @@ -673,6 +673,12 @@ static inline int pmd_write(pmd_t pmd)
>>>    	return pte_write(pmd_pte(pmd));
>>>    }
>>> +#define pud_write pud_write
>>> +static inline int pud_write(pud_t pud)
>>> +{
>>> +	return pte_write(pud_pte(pud));
>>> +}
>>> +
>>>    static inline int pmd_dirty(pmd_t pmd)
>>>    {
>>>    	return pte_dirty(pmd_pte(pmd));


Thanks, you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
