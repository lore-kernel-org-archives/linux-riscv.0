Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA09FC28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 08:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EIf7avmshxYqrQgcOV30Sc7soi71XAMpD50BUMmRcIY=; b=1WrRTtku+3lkVS
	0EoftyMaTIN1WI+y/8UDdVQJMEh/Gu7YaAS1kscyyy7Fjg+f9GZvbTNLZa9BeUYjJKOMd1ds606KM
	cnVUuCnB8wYaVxUQ4Qck5kf5K8CsDsMoZ4lZK1gRO4Po+KOuZiKk98bh+xuzlx8BLm3kywSFDvV5G
	cHmF6b70tzQNmsfpyoVLNSFf0kdJBDEQYrZr65K2g8SFnyV6c7ARgkFj36c57NOsBEUBlzKCB1utS
	zNJTb1o3F/PaVQy9uNPrfFLf0JxQXpG20KAZvx2DqgC+aygAdYJhNe8344DQtTuqk1Qrk7WvM1CRp
	2QZ1Zvh9panN2WtvfD+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ2zf-006Ztr-1H; Mon, 22 Aug 2022 08:41:11 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ2if-006QGO-EP; Mon, 22 Aug 2022 08:23:41 +0000
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MB50n281BznTgN;
	Mon, 22 Aug 2022 16:21:13 +0800 (CST)
Received: from localhost.localdomain (10.67.164.66) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 22 Aug 2022 16:23:29 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <linux-doc@vger.kernel.org>
CC: <corbet@lwn.net>, <peterz@infradead.org>, <arnd@arndb.de>,
	<linux-kernel@vger.kernel.org>, <darren@os.amperecomputing.com>,
	<yangyicong@hisilicon.com>, <huzhanyuan@oppo.com>, <lipeifeng@oppo.com>,
	<zhangshiming@oppo.com>, <guojian@oppo.com>, <realmz6@gmail.com>,
	<linux-mips@vger.kernel.org>, <openrisc@lists.librecores.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, Barry Song <21cnbao@gmail.com>,
	<wangkefeng.wang@huawei.com>, <xhao@linux.alibaba.com>,
	<prime.zeng@hisilicon.com>, <anshuman.khandual@arm.com>
Subject: [PATCH v3 0/4] mm: arm64: bring up BATCHED_UNMAP_TLB_FLUSH
Date: Mon, 22 Aug 2022 16:21:16 +0800
Message-ID: <20220822082120.8347-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-Originating-IP: [10.67.164.66]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_012338_137213_F2A15AD2 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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
4/4.

This patchset leverages the existing BATCHED_UNMAP_TLB_FLUSH by
1. only send tlbi instructions in the first stage -
	arch_tlbbatch_add_mm()
2. wait for the completion of tlbi by dsb while doing tlbbatch
	sync in arch_tlbbatch_flush()
My testing on snapdragon shows the overhead of ptep_clear_flush
is removed by the patchset. The micro benchmark becomes 5% faster
even for one page mapped by single process on snapdragon 888.

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

Barry Song (3):
  Revert "Documentation/features: mark BATCHED_UNMAP_TLB_FLUSH doesn't
    apply to ARM64"
  mm: rmap: Extend tlbbatch APIs to fit new platforms
  arm64: support batched/deferred tlb shootdown during page reclamation

 Documentation/features/arch-support.txt       |  1 -
 .../features/vm/TLB/arch-support.txt          |  2 +-
 arch/arm64/Kconfig                            |  1 +
 arch/arm64/include/asm/tlbbatch.h             | 12 ++++++++
 arch/arm64/include/asm/tlbflush.h             | 28 +++++++++++++++++--
 arch/x86/include/asm/tlbflush.h               | 15 +++++++++-
 mm/rmap.c                                     | 19 +++++--------
 7 files changed, 61 insertions(+), 17 deletions(-)
 create mode 100644 arch/arm64/include/asm/tlbbatch.h

-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
