Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CECC77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 07:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L2Hhozvisb2lIrAcMZzLKnzX8q1NjQZZJhDcKPfBFtE=; b=WtXeJJL6l0Ic+M
	/y6gM0rIiI4Ww9Gs3tnQ8jkCIrukg9suP/0EhNJR6tZqquuyJYY2fqWfQjoHx0SwgDWyQ+Jrq3Sn8
	DGxHStwfvAb6I6hpOfUrivMnXNcgGB5ZCZVoDa38WXNOu4tAR8zcUBCtd7XWFHADj3W0AxPHTZkCB
	6xFewoOrTBNeXELJgW54aER/WurhOIHXDIymiPmJyDN9w+h610x/zSlHFSXKavQGNe0cg8+Dj+kz8
	u+qqUcy9wh37yOa7xqYUm1HtVQHAxjlX2IuP2gbq3lm0kngCYdfP0JCkMjxMxsBT9yjaPq3xXTwdN
	FzPCwMwZpUXIpsY5mTWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzXdL-00C9K5-0s;
	Thu, 18 May 2023 07:01:07 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzXdF-00C9EN-29;
	Thu, 18 May 2023 07:01:04 +0000
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4QMLNt5ymqz18Lk1;
	Thu, 18 May 2023 14:56:30 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 15:00:51 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<catalin.marinas@arm.com>, <mark.rutland@arm.com>, <ryan.roberts@arm.com>,
	<will@kernel.org>, <anshuman.khandual@arm.com>, <linux-doc@vger.kernel.org>
CC: <corbet@lwn.net>, <peterz@infradead.org>, <arnd@arndb.de>,
	<punit.agrawal@bytedance.com>, <linux-kernel@vger.kernel.org>,
	<darren@os.amperecomputing.com>, <yangyicong@hisilicon.com>,
	<huzhanyuan@oppo.com>, <lipeifeng@oppo.com>, <zhangshiming@oppo.com>,
	<guojian@oppo.com>, <realmz6@gmail.com>, <linux-mips@vger.kernel.org>,
	<openrisc@lists.librecores.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>, Barry Song
	<21cnbao@gmail.com>, <wangkefeng.wang@huawei.com>, <xhao@linux.alibaba.com>,
	<prime.zeng@hisilicon.com>, <Jonathan.Cameron@Huawei.com>
Subject: [RESEND PATCH v9 0/2] arm64: support batched/deferred tlb shootdown during page reclamation/migration
Date: Thu, 18 May 2023 14:59:32 +0800
Message-ID: <20230518065934.12877-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_000102_990247_5F54A3F2 
X-CRM114-Status: GOOD (  10.97  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

Though ARM64 has the hardware to do tlb shootdown, the hardware
broadcasting is not free.
A simplest micro benchmark shows even on snapdragon 888 with only
8 cores, the overhead for ptep_clear_flush is huge even for paging
out one page mapped by only one process:
5.36%  a.out    [kernel.kallsyms]  [k] ptep_clear_flush

While pages are mapped by multiple processes or HW has more CPUs,
the cost should become even higher due to the bad scalability of
tlb shootdown.

The same benchmark can result in 16.99% CPU consumption on ARM64
server with around 100 cores according to Yicong's test on patch
2/2.

This patchset leverages the existing BATCHED_UNMAP_TLB_FLUSH by
1. only send tlbi instructions in the first stage -
	arch_tlbbatch_add_mm()
2. wait for the completion of tlbi by dsb while doing tlbbatch
	sync in arch_tlbbatch_flush()
Testing on snapdragon shows the overhead of ptep_clear_flush
is removed by the patchset. The micro benchmark becomes 5% faster
even for one page mapped by single process on snapdragon 888.

This support also optimize the page migration more than 50% with support
of batched TLB flushing [*].

[*] https://lore.kernel.org/linux-mm/20230213123444.155149-1-ying.huang@intel.com/

-v9:
1. Using a runtime tunable to control batched TLB flush, per Catalin in v7.
   Sorry for missing this on v8.
Link: https://lore.kernel.org/all/20230329035512.57392-1-yangyicong@huawei.com/

-v8:
1. Rebase on 6.3-rc4
2. Tested the optimization on page migration and mentioned it in the commit
3. Thanks the review from Anshuman.
Link: https://lore.kernel.org/linux-mm/20221117082648.47526-1-yangyicong@huawei.com/

-v7:
1. rename arch_tlbbatch_add_mm() to arch_tlbbatch_add_pending() as suggested, since it
   takes an extra address for arm64, per Nadav and Anshuman. Also mentioned in the commit.
2. add tags from Xin Hao, thanks.
Link: https://lore.kernel.org/lkml/20221115031425.44640-1-yangyicong@huawei.com/

-v6:
1. comment we don't defer TLB flush on platforms affected by ARM64_WORKAROUND_REPEAT_TLBI
2. use cpus_have_const_cap() instead of this_cpu_has_cap()
3. add tags from Punit, Thanks.
4. default enable the feature when cpus >= 8 rather than > 8, since the original
   improvement is observed on snapdragon 888 with 8 cores.
Link: https://lore.kernel.org/lkml/20221028081255.19157-1-yangyicong@huawei.com/

-v5:
1. Make ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH depends on EXPERT for this stage on arm64.
2. Make a threshold of CPU numbers for enabling batched TLP flush on arm64
Link: https://lore.kernel.org/linux-arm-kernel/20220921084302.43631-1-yangyicong@huawei.com/T/

-v4:
1. Add tags from Kefeng and Anshuman, Thanks.
2. Limit the TLB batch/defer on systems with >4 CPUs, per Anshuman
3. Merge previous Patch 1,2-3 into one, per Anshuman
Link: https://lore.kernel.org/linux-mm/20220822082120.8347-1-yangyicong@huawei.com/

-v3:
1. Declare arch's tlbbatch defer support by arch_tlbbatch_should_defer() instead
   of ARCH_HAS_MM_CPUMASK, per Barry and Kefeng
2. Add Tested-by from Xin Hao
Link: https://lore.kernel.org/linux-mm/20220711034615.482895-1-21cnbao@gmail.com/

-v2:
1. Collected Yicong's test result on kunpeng920 ARM64 server;
2. Removed the redundant vma parameter in arch_tlbbatch_add_mm()
   according to the comments of Peter Zijlstra and Dave Hansen
3. Added ARCH_HAS_MM_CPUMASK rather than checking if mm_cpumask
   is empty according to the comments of Nadav Amit

Thanks, Peter, Dave and Nadav for your testing or reviewing
, and comments.

-v1:
https://lore.kernel.org/lkml/20220707125242.425242-1-21cnbao@gmail.com/

Anshuman Khandual (1):
  mm/tlbbatch: Introduce arch_tlbbatch_should_defer()

Barry Song (1):
  arm64: support batched/deferred tlb shootdown during page
    reclamation/migration

 .../features/vm/TLB/arch-support.txt          |  2 +-
 arch/arm64/Kconfig                            |  1 +
 arch/arm64/include/asm/tlbbatch.h             | 12 ++++
 arch/arm64/include/asm/tlbflush.h             | 33 ++++++++-
 arch/arm64/mm/flush.c                         | 69 +++++++++++++++++++
 arch/x86/include/asm/tlbflush.h               | 17 ++++-
 include/linux/mm_types_task.h                 |  4 +-
 mm/rmap.c                                     | 21 +++---
 8 files changed, 139 insertions(+), 20 deletions(-)
 create mode 100644 arch/arm64/include/asm/tlbbatch.h

-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
