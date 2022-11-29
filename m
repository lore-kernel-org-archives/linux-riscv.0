Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CDDC4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 11:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:CC:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3DjATfLITk1aVtP0GpyOBgMmzvlFosE2vmM2ifIFMks=; b=QxSqamvkAt1QWYVFerYzk1EHvO
	gBPr97Hgw98FWMuffzfeFdTH+b5DBE2BjeENtpTGxgKRmXU7cC/Nt9HdO/Fr9wPP2eY67Cam1MIy2
	LmSOadrZ6ImotBLoqQFUGejC3WVoJxVF/QZH5K7bJHJgjofw5/vxtUCX8j7dmyJ2LU1jq6hoA1thJ
	qFPv8pwZxj5IrqiD4MNF6juuM9u9veAuGYpPGK5QSx1eLsycSIVhbWnhwlAc9SfDJY9DvLZ0gqiVQ
	xUZEB6skRSuSZmxNwAJZXkOjHPbFnouWDRa+3iDK5GVhrWPxhIl48qS8V3dbg2v7PLYm3krSuD/ua
	2j5DJkZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozyUu-008PUa-TA; Tue, 29 Nov 2022 11:09:56 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozyUj-008PLR-98; Tue, 29 Nov 2022 11:09:47 +0000
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NM02T6VXhzRpc6;
	Tue, 29 Nov 2022 19:08:49 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 29 Nov 2022 19:09:28 +0800
CC: <anshuman.khandual@arm.com>, <corbet@lwn.net>, <peterz@infradead.org>,
	<arnd@arndb.de>, <punit.agrawal@bytedance.com>,
	<linux-kernel@vger.kernel.org>, <darren@os.amperecomputing.com>,
	<yangyicong@hisilicon.com>, <huzhanyuan@oppo.com>, <lipeifeng@oppo.com>,
	<zhangshiming@oppo.com>, <guojian@oppo.com>, <realmz6@gmail.com>,
	<linux-mips@vger.kernel.org>, <openrisc@lists.librecores.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, Barry Song <21cnbao@gmail.com>,
	<wangkefeng.wang@huawei.com>, <xhao@linux.alibaba.com>,
	<prime.zeng@hisilicon.com>, <linux-mm@kvack.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: Re: [PATCH v7 0/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
From: Yicong Yang <yangyicong@huawei.com>
To: <akpm@linux-foundation.org>, <catalin.marinas@arm.com>, <will@kernel.org>
References: <20221117082648.47526-1-yangyicong@huawei.com>
Message-ID: <938c4c00-8cf9-b37a-d70e-04262d86f01c@huawei.com>
Date: Tue, 29 Nov 2022 19:09:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20221117082648.47526-1-yangyicong@huawei.com>
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_030945_669367_5D08DD16 
X-CRM114-Status: GOOD (  19.17  )
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

a gentle ping...

Hi Andrew, Will and Catalin,

is it ok to pick this series?

Thanks.

On 2022/11/17 16:26, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Though ARM64 has the hardware to do tlb shootdown, the hardware
> broadcasting is not free.
> A simplest micro benchmark shows even on snapdragon 888 with only
> 8 cores, the overhead for ptep_clear_flush is huge even for paging
> out one page mapped by only one process:
> 5.36%  a.out    [kernel.kallsyms]  [k] ptep_clear_flush
> 
> While pages are mapped by multiple processes or HW has more CPUs,
> the cost should become even higher due to the bad scalability of
> tlb shootdown.
> 
> The same benchmark can result in 16.99% CPU consumption on ARM64
> server with around 100 cores according to Yicong's test on patch
> 4/4.
> 
> This patchset leverages the existing BATCHED_UNMAP_TLB_FLUSH by
> 1. only send tlbi instructions in the first stage -
> 	arch_tlbbatch_add_mm()
> 2. wait for the completion of tlbi by dsb while doing tlbbatch
> 	sync in arch_tlbbatch_flush()
> Testing on snapdragon shows the overhead of ptep_clear_flush
> is removed by the patchset. The micro benchmark becomes 5% faster
> even for one page mapped by single process on snapdragon 888.
> 
> With this support we're possible to do more optimization for memory
> reclamation and migration[*].
> 
> [*] https://lore.kernel.org/lkml/393d6318-aa38-01ed-6ad8-f9eac89bf0fc@linux.alibaba.com/
> 
> -v7:
> 1. rename arch_tlbbatch_add_mm() to arch_tlbbatch_add_pending() as suggested, since it
>    takes an extra address for arm64, per Nadav and Anshuman. Also mentioned in the commit.
> 2. add tags from Xin Hao, thanks.
> Link: https://lore.kernel.org/lkml/20221115031425.44640-1-yangyicong@huawei.com/
> 
> -v6:
> 1. comment we don't defer TLB flush on platforms affected by ARM64_WORKAROUND_REPEAT_TLBI
> 2. use cpus_have_const_cap() instead of this_cpu_has_cap()
> 3. add tags from Punit, Thanks.
> 4. default enable the feature when cpus >= 8 rather than > 8, since the original
>    improvement is observed on snapdragon 888 with 8 cores.
> Link: https://lore.kernel.org/lkml/20221028081255.19157-1-yangyicong@huawei.com/
> 
> -v5:
> 1. Make ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH depends on EXPERT for this stage on arm64.
> 2. Make a threshold of CPU numbers for enabling batched TLP flush on arm64
> Link: https://lore.kernel.org/linux-arm-kernel/20220921084302.43631-1-yangyicong@huawei.com/T/
> 
> -v4:
> 1. Add tags from Kefeng and Anshuman, Thanks.
> 2. Limit the TLB batch/defer on systems with >4 CPUs, per Anshuman
> 3. Merge previous Patch 1,2-3 into one, per Anshuman
> Link: https://lore.kernel.org/linux-mm/20220822082120.8347-1-yangyicong@huawei.com/
> 
> -v3:
> 1. Declare arch's tlbbatch defer support by arch_tlbbatch_should_defer() instead
>    of ARCH_HAS_MM_CPUMASK, per Barry and Kefeng
> 2. Add Tested-by from Xin Hao
> Link: https://lore.kernel.org/linux-mm/20220711034615.482895-1-21cnbao@gmail.com/
> 
> -v2:
> 1. Collected Yicong's test result on kunpeng920 ARM64 server;
> 2. Removed the redundant vma parameter in arch_tlbbatch_add_mm()
>    according to the comments of Peter Zijlstra and Dave Hansen
> 3. Added ARCH_HAS_MM_CPUMASK rather than checking if mm_cpumask
>    is empty according to the comments of Nadav Amit
> 
> Thanks, Peter, Dave and Nadav for your testing or reviewing
> , and comments.
> 
> -v1:
> https://lore.kernel.org/lkml/20220707125242.425242-1-21cnbao@gmail.com/
> 
> Anshuman Khandual (1):
>   mm/tlbbatch: Introduce arch_tlbbatch_should_defer()
> 
> Barry Song (1):
>   arm64: support batched/deferred tlb shootdown during page reclamation
> 
>  .../features/vm/TLB/arch-support.txt          |  2 +-
>  arch/arm64/Kconfig                            |  6 +++
>  arch/arm64/include/asm/tlbbatch.h             | 12 +++++
>  arch/arm64/include/asm/tlbflush.h             | 52 ++++++++++++++++++-
>  arch/x86/include/asm/tlbflush.h               | 17 +++++-
>  include/linux/mm_types_task.h                 |  4 +-
>  mm/rmap.c                                     | 19 +++----
>  7 files changed, 93 insertions(+), 19 deletions(-)
>  create mode 100644 arch/arm64/include/asm/tlbbatch.h
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
