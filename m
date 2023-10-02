Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7740E784A4
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 07:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SiYx09T2IYZLr2f8YJiHhrUsKZ4KCosUsxLcfzlAr6w=; b=mZj/CHDaxdlnAD
	Mg5hqwFLJjyfuT3A8r4VE0n7e/nEcUEPm+ByXciW3v2zoPXnG7ykdtod1G3xS+/wKqHoVyKuTTXfe
	SKtz0zncwxffWIop6Fdsp+qo65NRmQgH2jM7IOlN2id22tRX7MM7xnDxvqiSYcQYH4vkehBnkvW7c
	x50hvhepBjH/Enm5VD6Al64lbWqF9v8/jMpDzZMfckg/47KRmBLiezIAa50QaIeYMnHW1clV8Zyhc
	2dCzmYSVF3P3zvFyJ4gKlJ/SCBbzzHu36Af5gOXqwkWXulN91zVtwDkxJ3lU0BkGJe5awjokyKeal
	r4vdFTqMv3oWuo4i2OlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnDCs-00C52c-0i;
	Mon, 02 Oct 2023 07:19:06 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnDCo-00C51N-2r
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 07:19:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3EE534000D;
	Mon,  2 Oct 2023 07:18:52 +0000 (UTC)
Message-ID: <96984fd2-2e3b-d861-5555-5b5a4e5c55d6@ghiti.fr>
Date: Mon, 2 Oct 2023 09:18:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH -fixes 2/2] riscv: Fix set_huge_pte_at() for NAPOT
 mappings when a swap entry is set
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Jones <ajones@ventanamicro.com>,
 Qinglin Pan <panqinglin2020@iscas.ac.cn>, Ryan Roberts
 <ryan.roberts@arm.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230928151846.8229-1-alexghiti@rivosinc.com>
 <20230928151846.8229-3-alexghiti@rivosinc.com>
 <20230930-unnoticed-slacked-0bf5696cc265@spud>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230930-unnoticed-slacked-0bf5696cc265@spud>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_001903_217074_4C06DD11 
X-CRM114-Status: GOOD (  23.07  )
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

Hi Conor,

On 30/09/2023 11:14, Conor Dooley wrote:
> On Thu, Sep 28, 2023 at 05:18:46PM +0200, Alexandre Ghiti wrote:
>> We used to determine the number of page table entries to set for a NAPOT
>> hugepage by using the pte value which actually fails when the pte to set is
>> a swap entry.
>>
>> So take advantage of a recent fix for arm64 reported in [1] which
>> introduces the size of the mapping as an argument of set_huge_pte_at(): we
>> can then use this size to compute the number of page table entries to set
>> for a NAPOT region.
>>
>> Fixes: 82a1a1f3bfb6 ("riscv: mm: support Svnapot in hugetlb page")
>> Reported-by: Ryan Roberts <ryan.roberts@arm.com>
>> Closes: https://lore.kernel.org/linux-arm-kernel/20230922115804.2043771-1-ryan.roberts@arm.com/ [1]
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Breaks the build. Your $subject marks this for -fixes, but this will not
> build there, as it relies on content that's not yet in that branch.
> AFAICT, you're going to have to resend this with akpm on CC, as the
> dependency is in his tree...


I see, but I still don't understand why -fixes does not point to the 
latest rcX instead of staying on rc1? The patch which this series 
depends on just made it to rc4.

Thanks,

Alex


> Thanks,
> Conor.
>
>> ---
>>   arch/riscv/mm/hugetlbpage.c | 19 +++++++++++++------
>>   1 file changed, 13 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
>> index e4a2ace92dbe..b52f0210481f 100644
>> --- a/arch/riscv/mm/hugetlbpage.c
>> +++ b/arch/riscv/mm/hugetlbpage.c
>> @@ -183,15 +183,22 @@ void set_huge_pte_at(struct mm_struct *mm,
>>   		     pte_t pte,
>>   		     unsigned long sz)
>>   {
>> +	unsigned long hugepage_shift;
>>   	int i, pte_num;
>>   
>> -	if (!pte_napot(pte)) {
>> -		set_pte_at(mm, addr, ptep, pte);
>> -		return;
>> -	}
>> +	if (sz >= PGDIR_SIZE)
>> +		hugepage_shift = PGDIR_SHIFT;
>> +	else if (sz >= P4D_SIZE)
>> +		hugepage_shift = P4D_SHIFT;
>> +	else if (sz >= PUD_SIZE)
>> +		hugepage_shift = PUD_SHIFT;
>> +	else if (sz >= PMD_SIZE)
>> +		hugepage_shift = PMD_SHIFT;
>> +	else
>> +		hugepage_shift = PAGE_SHIFT;
>>   
>> -	pte_num = napot_pte_num(napot_cont_order(pte));
>> -	for (i = 0; i < pte_num; i++, ptep++, addr += PAGE_SIZE)
>> +	pte_num = sz >> hugepage_shift;
>> +	for (i = 0; i < pte_num; i++, ptep++, addr += (1 << hugepage_shift))
>>   		set_pte_at(mm, addr, ptep, pte);
>>   }
>>   
>> -- 
>> 2.39.2
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
