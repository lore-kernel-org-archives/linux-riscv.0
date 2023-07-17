Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDF7C0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 13:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7vsVvyj3N3SBoXNkJ+KR+Kb59qKBhNtuRR51Mq+coFE=; b=zraHICWuKX4Zu0
	ukScse8CSQtn0uCM32VYCILiWIojAS61NyDjD8XI5UtFbd9fLc6SUGi27AlB80nlYVzs1PNWEpGlS
	k0Gx9OMaoP20wlKctdH85XMyyBhnK0y+/si+BMQW+6CVq4PnED4kp3AC/97AbtEjauS83kkWbqvju
	GECprGO0gOmC/JYYIg06DUIiDdgUL4Z1LttkTKYA+auuTmEEYP2jp1hHZ/TFabZ7YjTE/Mo0UiU8p
	crDBQg1wgnaG+RYoJwCYsmDiQ4UjUBwemuo6qrTRnoUkBEvNl6H0LyQ+iGr6sE7Yj+52sZh1UXtMH
	QLFJL3RrAmu6/b1GwR/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLO1h-0044la-0v;
	Mon, 17 Jul 2023 13:12:33 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLO1T-0044fA-1W;
	Mon, 17 Jul 2023 13:12:22 +0000
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4R4Mps5c95zNmN0;
	Mon, 17 Jul 2023 21:08:53 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 21:12:12 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <akpm@linux-foundation.org>, <catalin.marinas@arm.com>,
	<linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
	<x86@kernel.org>, <mark.rutland@arm.com>, <ryan.roberts@arm.com>,
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
Subject: [PATCH v11 3/4] mm/tlbbatch: Introduce arch_flush_tlb_batched_pending()
Date: Mon, 17 Jul 2023 21:10:03 +0800
Message-ID: <20230717131004.12662-4-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20230717131004.12662-1-yangyicong@huawei.com>
References: <20230717131004.12662-1-yangyicong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
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

Currently we'll flush the mm in flush_tlb_batched_pending() to
avoid race between reclaim unmaps pages by batched TLB flush
and mprotect/munmap/etc. Other architectures like arm64 may
only need a synchronization barrier(dsb) here rather than
a full mm flush. So add arch_flush_tlb_batched_pending() to
allow an arch-specific implementation here. This intends no
functional changes on x86 since still a full mm flush for
x86.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/x86/include/asm/tlbflush.h | 5 +++++
 mm/rmap.c                       | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index 1c7d3a36e16c..837e4a50281a 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -284,6 +284,11 @@ static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *b
 	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
 }
 
+static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
+{
+	flush_tlb_mm(mm);
+}
+
 extern void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);
 
 static inline bool pte_flags_need_flush(unsigned long oldflags,
diff --git a/mm/rmap.c b/mm/rmap.c
index 9699c6011b0e..3a16c91be7e2 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -717,7 +717,7 @@ void flush_tlb_batched_pending(struct mm_struct *mm)
 	int flushed = batch >> TLB_FLUSH_BATCH_FLUSHED_SHIFT;
 
 	if (pending != flushed) {
-		flush_tlb_mm(mm);
+		arch_flush_tlb_batched_pending(mm);
 		/*
 		 * If the new TLB flushing is pending during flushing, leave
 		 * mm->tlb_flush_batched as is, to avoid losing flushing.
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
