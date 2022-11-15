Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C995DC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 03:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:CC:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=u+aHze1E4+4BNDZn5bYP++2sfUQsV0WBAPM8E8NBY0E=; b=nKtQFXtE/o1vWTTjnTioiptUvE
	Ad+itb3HJ9HoyzMlsaZD/0fTOplGeMH5ArGMM7m5L5g1cOPsrtFd1ITuobscuz6fBFu1kzaZhFfKd
	yykqrmTSwYZTpxuUMK+EqjDjjSj1wEy8crcBfKwSK3F+sQUUhHpSsAth7dcT0JqDxyfU5u5n6uaCK
	3UMtW6e14CE69M9VqHOsNz8itR+B7axKo39FRo41XA0bYCQK4rIARn9YTMyzv4J614QbXh4AWeLPK
	81CZBdGmRuEUsPJnV9dP8WfIccphr9KMZs7NqyPQ3XtW5VM4B/qw0YQGTEXRUVBlR4rs0Cw9EoifT
	QYgjUSLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oumj0-007Ddm-Ia; Tue, 15 Nov 2022 03:35:02 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oumil-007DY8-6t; Tue, 15 Nov 2022 03:34:49 +0000
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NBBXf463pzqSRP;
	Tue, 15 Nov 2022 11:30:58 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 11:34:44 +0800
CC: <yangyicong@hisilicon.com>, <corbet@lwn.net>, <peterz@infradead.org>,
	<arnd@arndb.de>, <punit.agrawal@bytedance.com>,
	<linux-kernel@vger.kernel.org>, <darren@os.amperecomputing.com>,
	<huzhanyuan@oppo.com>, <lipeifeng@oppo.com>, <zhangshiming@oppo.com>,
	<guojian@oppo.com>, <realmz6@gmail.com>, <linux-mips@vger.kernel.org>,
	<openrisc@lists.librecores.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>, Barry Song
	<21cnbao@gmail.com>, <wangkefeng.wang@huawei.com>, <xhao@linux.alibaba.com>,
	<prime.zeng@hisilicon.com>, Barry Song <v-songbaohua@oppo.com>, Nadav Amit
	<namit@vmware.com>, Mel Gorman <mgorman@suse.de>
Subject: Re: [PATCH v5 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
To: Anshuman Khandual <anshuman.khandual@arm.com>,
	<akpm@linux-foundation.org>, <linux-mm@kvack.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <linux-doc@vger.kernel.org>
References: <20221028081255.19157-1-yangyicong@huawei.com>
 <20221028081255.19157-3-yangyicong@huawei.com>
 <86fbdc8c-0dcb-9b8f-d843-63460d8b1d6a@arm.com>
 <9982dac0-9f2e-112a-d440-467c8e8f8aa4@huawei.com>
 <40f1b5ad-2165-bb81-1ff5-89786373fa14@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <5bbd5364-fcec-5fc2-4780-e9b44f2ab135@huawei.com>
Date: Tue, 15 Nov 2022 11:34:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <40f1b5ad-2165-bb81-1ff5-89786373fa14@arm.com>
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_193447_665471_82B640BC 
X-CRM114-Status: GOOD (  18.20  )
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

On 2022/11/14 22:19, Anshuman Khandual wrote:
> 
> 
> On 11/14/22 14:16, Yicong Yang wrote:
>> On 2022/11/14 11:29, Anshuman Khandual wrote:
>>>
>>> On 10/28/22 13:42, Yicong Yang wrote:
>>>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>>>> +{
>>>> +	/*
>>>> +	 * TLB batched flush is proved to be beneficial for systems with large
>>>> +	 * number of CPUs, especially system with more than 8 CPUs. TLB shutdown
>>>> +	 * is cheap on small systems which may not need this feature. So use
>>>> +	 * a threshold for enabling this to avoid potential side effects on
>>>> +	 * these platforms.
>>>> +	 */
>>>> +	if (num_online_cpus() <= CONFIG_ARM64_NR_CPUS_FOR_BATCHED_TLB)
>>>> +		return false;
>>>> +
>>>> +#ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
>>>> +	if (unlikely(this_cpu_has_cap(ARM64_WORKAROUND_REPEAT_TLBI)))
>>>> +		return false;
>>>> +#endif
>>> should_defer_flush() is immediately followed by set_tlb_ubc_flush_pending() which calls
>>> arch_tlbbatch_add_mm(), triggering the actual TLBI flush via __flush_tlb_page_nosync().
>>> It should be okay to check capability with this_cpu_has_cap() as the entire call chain
>>> here is executed on the same cpu. But just wondering if cpus_have_const_cap() would be
>>> simpler, consistent, and also cost effective ?
>>>
>> ok. Checked cpus_have_const_cap() I think it matches your words.
>>
>>> Regardless, a comment is needed before the #ifdef block explaining why it does not make
>>> sense to defer/batch when __tlbi()/__tlbi_user() implementation will execute 'dsb(ish)'
>>> between two TLBI instructions to workaround the errata.
>>>
>> The workaround for the errata mentioned the affected platforms need the tlbi+dsb to be done
>> twice, so I'm not sure if we defer the final dsb will cause any problem so I think the judgement
>> here is used for safety. I have no such platform to test if it's ok to defer the last dsb.
> 
> We should not defer TLB flush on such systems, as ensured by the above test and 'false'
> return afterwards. The only question is whether this decision should be taken at a CPU
> level (which is affected by the errata) or the whole system level.
> 
> What is required now
> 
> - Replace this_cpu_has_cap() with cpus_have_const_cap ?
> - Add the following comment before the #ifdef check
> 

Have respin the series according to the above comments:
https://lore.kernel.org/lkml/20221115031425.44640-3-yangyicong@huawei.com/

Thanks.

> /*
>  * TLB flush deferral is not required on systems, which are affected with
>  * ARM64_WORKAROUND_REPEAT_TLBI, as __tlbi()/__tlbi_user() implementation
>  * will have two consecutive TLBI instructions with a dsb(ish) in between
>  * defeating the purpose (i.e save overall 'dsb ish' cost).
>  */
> 
> .
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
