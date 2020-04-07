Return-Path: <SRS0=q7Eq=5X=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA48C2BA16
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2020 05:12:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E60E206F7
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2020 05:12:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jnv806kM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E60E206F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:Subject:From:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eh+Ragx6cMrdIV92NsdyArN/rHbCMJQopzJN4+wc1gw=; b=jnv806kMC8E4an
	EM6Ok0riNECjTEBIyTYi0i4/6XpEomsr9qOL3acd33VWt9uH9CPHZ/yTm+gHbge8WilndTF/BqnAO
	VLX9exHT4X5KOLV0mGine4gzi6eQHrSN0x4STeIdkhu86zJsKrBY2gOSCVk7WoUUPAtTs0NvqzG5y
	Pnhk+CHTD/mbyHixJzeL3/b/GmrMNgAOofP80Ru2LMdy/lbC0QjKVXNcQGPpdKm1RaubFP/PWINJ8
	tq9maHoMVFT0QKMXdDS4H6V5gIT4esh3rsdssig51lHvOgil2f/GsmvpU2K0Z3HpgcliHoBBfY269
	RBXO956qcLqkendPY3SQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLgX7-0000ce-Fk; Tue, 07 Apr 2020 05:12:21 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLgX4-0000bj-IY
 for linux-riscv@lists.infradead.org; Tue, 07 Apr 2020 05:12:19 +0000
X-Originating-IP: 2.7.45.25
Received: from [192.168.1.101] (lfbn-lyo-1-453-25.w2-7.abo.wanadoo.fr
 [2.7.45.25]) (Authenticated sender: alex@ghiti.fr)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id BDA4920007;
 Tue,  7 Apr 2020 05:12:15 +0000 (UTC)
From: Alex Ghiti <alex@ghiti.fr>
Subject: Re: [RFC PATCH 1/7] riscv: Get rid of compile time logic with
 MAX_EARLY_MAPPING_SIZE
To: Palmer Dabbelt <palmer@dabbelt.com>
References: <mhng-ee39eb13-2567-479e-b0f4-5d23dff8496c@palmerdabbelt-glaptop1>
Message-ID: <befad912-5fab-897c-48d6-9a703a6b4240@ghiti.fr>
Date: Tue, 7 Apr 2020 01:12:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <mhng-ee39eb13-2567-479e-b0f4-5d23dff8496c@palmerdabbelt-glaptop1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200406_221218_749950_878369E5 
X-CRM114-Status: GOOD (  14.35  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: anup@brainfault.org, linux-kernel@vger.kernel.org, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 4/3/20 11:17 AM, Palmer Dabbelt wrote:
> On Sun, 22 Mar 2020 04:00:22 PDT (-0700), alex@ghiti.fr wrote:
>> There is no need to compare at compile time MAX_EARLY_MAPPING_SIZE value
>> with PGDIR_SIZE since MAX_EARLY_MAPPING_SIZE is set to 128MB which is 
>> less
>> than PGDIR_SIZE that is equal to 1GB: that allows to simplify early_pmd
>> definition.
>>
>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
>> ---
>>  arch/riscv/mm/init.c | 16 ++++------------
>>  1 file changed, 4 insertions(+), 12 deletions(-)
>>
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index 238bd0033c3f..18bbb426848e 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -247,13 +247,7 @@ static void __init create_pte_mapping(pte_t *ptep,
>>
>>  pmd_t trampoline_pmd[PTRS_PER_PMD] __page_aligned_bss;
>>  pmd_t fixmap_pmd[PTRS_PER_PMD] __page_aligned_bss;
>> -
>> -#if MAX_EARLY_MAPPING_SIZE < PGDIR_SIZE
>> -#define NUM_EARLY_PMDS        1UL
>> -#else
>> -#define NUM_EARLY_PMDS        (1UL + MAX_EARLY_MAPPING_SIZE / 
>> PGDIR_SIZE)
>> -#endif
>> -pmd_t early_pmd[PTRS_PER_PMD * NUM_EARLY_PMDS] __initdata 
>> __aligned(PAGE_SIZE);
>> +pmd_t early_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
>>
>>  static pmd_t *__init get_pmd_virt(phys_addr_t pa)
>>  {
>> @@ -267,14 +261,12 @@ static pmd_t *__init get_pmd_virt(phys_addr_t pa)
>>
>>  static phys_addr_t __init alloc_pmd(uintptr_t va)
>>  {
>> -    uintptr_t pmd_num;
>> -
>>      if (mmu_enabled)
>>          return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
>>
>> -    pmd_num = (va - PAGE_OFFSET) >> PGDIR_SHIFT;
>> -    BUG_ON(pmd_num >= NUM_EARLY_PMDS);
>> -    return (uintptr_t)&early_pmd[pmd_num * PTRS_PER_PMD];
>> +    BUG_ON((va - PAGE_OFFSET) >> PGDIR_SHIFT);
>> +
>> +    return (uintptr_t)early_pmd;
>>  }
>>
>>  static void __init create_pmd_mapping(pmd_t *pmdp,
> 
> My specific worry here was that allyesconfig kernels are quite large, 
> and that
> dropping the code to handle large kernels would make it even harder to boot
> them.  That said, I can't actually get one to boot so I'm happy to just 
> push
> that off until later and drop the code we can't practically use.
> 
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> 
> Thanks!
> 

Thanks,

Alex

