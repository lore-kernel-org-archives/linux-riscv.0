Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE54EC6FA86
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Sep 2022 09:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:CC:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nrAFVV7lbVC9LsuydyxXB1RhIXFL2bO0n1AH5C4PRDs=; b=F4kOrZL1MsOH+T3F+p1Q4iAEnv
	s1rmhUcrhr4GtAD5arU9Zqge6AbYS5PDqzcpIPkemtFpDma9O6J6aUe1SbzuoEUcVa2HnrZmYFLG+
	CCTbdGV3vwUvqsf7B0Ox+/aNXY5zb4Y3wsxpfRGlWKX8fxgJDSD921zAvmysL2m0vaksyJk1QGTxJ
	DxZaIQ67m0yHg241VihOKmVqqNZxgD0L05N9J/7j3h6hjwIXoJyPxM7EJb1PienP9hQ0+K/d3h8Jt
	gS5I5zNcVPFyTQdmjSvxvfQTn/oQyZmgAivJWTWX6Tt3lDtC9kjJ4yLEgfOn1SrwiLAVc/1FN/KxL
	kzoosrXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od6hK-009S8a-LV; Tue, 27 Sep 2022 09:16:14 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od6gp-009Rw4-Dy; Tue, 27 Sep 2022 09:15:45 +0000
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4McDRd2xl3zpV3J;
	Tue, 27 Sep 2022 17:12:45 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 17:15:40 +0800
CC: <yangyicong@hisilicon.com>, <corbet@lwn.net>, <peterz@infradead.org>,
	<arnd@arndb.de>, <linux-kernel@vger.kernel.org>,
	<darren@os.amperecomputing.com>, <huzhanyuan@oppo.com>, <lipeifeng@oppo.com>,
	<zhangshiming@oppo.com>, <guojian@oppo.com>, <realmz6@gmail.com>,
	<linux-mips@vger.kernel.org>, <openrisc@lists.librecores.org>,
	<linux-mm@kvack.org>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linuxppc-dev@lists.ozlabs.org>,
	<akpm@linux-foundation.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, Barry Song <21cnbao@gmail.com>,
	<wangkefeng.wang@huawei.com>, <xhao@linux.alibaba.com>,
	<prime.zeng@hisilicon.com>, Barry Song <v-songbaohua@oppo.com>, Nadav Amit
	<namit@vmware.com>, Mel Gorman <mgorman@suse.de>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
To: Anshuman Khandual <anshuman.khandual@arm.com>
References: <20220921084302.43631-1-yangyicong@huawei.com>
 <20220921084302.43631-3-yangyicong@huawei.com>
 <168eac93-a6ee-0b2e-12bb-4222eff24561@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <8e391962-4e3a-5a56-64b4-78e8637e3b8c@huawei.com>
Date: Tue, 27 Sep 2022 17:15:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <168eac93-a6ee-0b2e-12bb-4222eff24561@arm.com>
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_021543_690869_95AF2B5C 
X-CRM114-Status: GOOD (  10.50  )
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

On 2022/9/27 14:16, Anshuman Khandual wrote:
> [...]
> 
> On 9/21/22 14:13, Yicong Yang wrote:
>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>> +{
>> +	/* for small systems with small number of CPUs, TLB shootdown is cheap */
>> +	if (num_online_cpus() <= 4)
> 
> It would be great to have some more inputs from others, whether 4 (which should
> to be codified into a macro e.g ARM64_NR_CPU_DEFERRED_TLB, or something similar)
> is optimal for an wide range of arm64 platforms.
> 

Do you prefer this macro to be static or make it configurable through kconfig then
different platforms can make choice based on their own situations? It maybe hard to
test on all the arm64 platforms.

Thanks.

>> +		return false;> +
>> +#ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
>> +	if (unlikely(this_cpu_has_cap(ARM64_WORKAROUND_REPEAT_TLBI)))
>> +		return false;
>> +#endif
>> +
>> +	return true;
>> +}
>> +
> 
> [...]
> 
> .
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
