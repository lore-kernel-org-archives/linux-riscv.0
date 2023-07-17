Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DCAC001DF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 12:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:CC:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wIt08kSAOkx7J/q0vsbwbClQhIZe2VeGUwT8pUIUPJM=; b=BQJ14HhMi8YNWGPtMDmMI/V95R
	U0vG3PCkC6QR+FFA0KNLVvUr2GsuW8Ezi5GbLQ4Kch4Ys9jD5uTQykOev7a1p8bsr8MaELvfDakT9
	TFgUvJGDox1aYOyVQB74Lzf/5rosI5bIj01RuSc2TsPM4zpRMNL65YkscGyaZAYN81mvcbe2CTYG0
	pW4QkvefGrWlxUhPAcnb0IonD63FC3eRX2Q9PVoucWyGlLnRnlFP4ZqQHbUth0Las5QSzalgRlpFh
	4AuKZflrDRdBkKuoQtfc/4k0MU9iS06TaDlwNM0lINO3/4fiSlv8fctMONdBAmTBgHtcNKpjFioHO
	VbFFA1eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLNJ9-003yhw-2M;
	Mon, 17 Jul 2023 12:26:31 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLNJ2-003yeC-2d;
	Mon, 17 Jul 2023 12:26:29 +0000
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4R4Lrp2BrKz18LY9;
	Mon, 17 Jul 2023 20:25:30 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 20:26:11 +0800
CC: <yangyicong@hisilicon.com>, <akpm@linux-foundation.org>,
	<linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
	<x86@kernel.org>, <mark.rutland@arm.com>, <ryan.roberts@arm.com>,
	<will@kernel.org>, <anshuman.khandual@arm.com>, <linux-doc@vger.kernel.org>,
	<corbet@lwn.net>, <peterz@infradead.org>, <arnd@arndb.de>,
	<punit.agrawal@bytedance.com>, <linux-kernel@vger.kernel.org>,
	<darren@os.amperecomputing.com>, <huzhanyuan@oppo.com>, <lipeifeng@oppo.com>,
	<zhangshiming@oppo.com>, <guojian@oppo.com>, <realmz6@gmail.com>,
	<linux-mips@vger.kernel.org>, <openrisc@lists.librecores.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, Barry Song <21cnbao@gmail.com>,
	<wangkefeng.wang@huawei.com>, <xhao@linux.alibaba.com>,
	<prime.zeng@hisilicon.com>, <Jonathan.Cameron@huawei.com>, Barry Song
	<v-songbaohua@oppo.com>, Nadav Amit <namit@vmware.com>, Mel Gorman
	<mgorman@suse.de>
Subject: Re: [PATCH v10 4/4] arm64: support batched/deferred tlb shootdown
 during page reclamation/migration
To: Catalin Marinas <catalin.marinas@arm.com>
References: <20230710083914.18336-1-yangyicong@huawei.com>
 <20230710083914.18336-5-yangyicong@huawei.com> <ZLQIvPpKvjWppc59@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <9438aa19-8eb5-a36a-c4a0-6c8333665637@huawei.com>
Date: Mon, 17 Jul 2023 20:26:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <ZLQIvPpKvjWppc59@arm.com>
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_052625_773489_123DEC74 
X-CRM114-Status: GOOD (  11.46  )
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

On 2023/7/16 23:11, Catalin Marinas wrote:
> On Mon, Jul 10, 2023 at 04:39:14PM +0800, Yicong Yang wrote:
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 7856c3a3e35a..f0ce8208c57f 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -96,6 +96,7 @@ config ARM64
>>  	select ARCH_SUPPORTS_NUMA_BALANCING
>>  	select ARCH_SUPPORTS_PAGE_TABLE_CHECK
>>  	select ARCH_SUPPORTS_PER_VMA_LOCK
>> +	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH if EXPERT
> 
> I don't want EXPERT to turn on a feature that's not selectable by the
> user. This would lead to different performance behaviour based on
> EXPERT. Just select it unconditionally.

Got it. will drop it and address the comment below.

Thanks.

> 
>> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
>> index 412a3b9a3c25..4bb9cec62e26 100644
>> --- a/arch/arm64/include/asm/tlbflush.h
>> +++ b/arch/arm64/include/asm/tlbflush.h
>> @@ -254,17 +254,23 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
>>  	dsb(ish);
>>  }
>>  
>> -static inline void flush_tlb_page_nosync(struct vm_area_struct *vma,
>> -					 unsigned long uaddr)
>> +static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
>> +					   unsigned long uaddr)
>>  {
>>  	unsigned long addr;
>>  
>>  	dsb(ishst);
>> -	addr = __TLBI_VADDR(uaddr, ASID(vma->vm_mm));
>> +	addr = __TLBI_VADDR(uaddr, ASID(mm));
>>  	__tlbi(vale1is, addr);
>>  	__tlbi_user(vale1is, addr);
>>  }
>>  
>> +static inline void flush_tlb_page_nosync(struct vm_area_struct *vma,
>> +					 unsigned long uaddr)
>> +{
>> +	return __flush_tlb_page_nosync(vma->vm_mm, uaddr);
>> +}
>> +
>>  static inline void flush_tlb_page(struct vm_area_struct *vma,
>>  				  unsigned long uaddr)
>>  {
>> @@ -272,6 +278,42 @@ static inline void flush_tlb_page(struct vm_area_struct *vma,
>>  	dsb(ish);
>>  }
>>  
>> +#ifdef CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
> 
> If it's selected unconditionally, we won't need this #ifdef here.
> 
>> +
>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>> +{
>> +#ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
>> +	/*
>> +	 * TLB flush deferral is not required on systems, which are affected with
> 
> "affected by" and drop the comma before "which".
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
