Return-Path: <SRS0=5xGv=KY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D13C47082
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 06:32:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 376DC613B6
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 06:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 376DC613B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XdY5uB+AQeqJfoitmqQyTB+oxSaJxBCTq6vnHngEoFU=; b=pDWDAuUzKFeq0x
	/sLIvObOYLO9mRPjMonHhr1c5vYBSC8BRQxkudf7WL85sLtQ+/iq8FCbsA1dtjN13l6vBO4f9lF7t
	p54xvO2D4GJZIFyxA+dNldIx2fFpB603tZ8h4pTJMtmIVQfFm6pbsBqNEY9vzBd9K+UAxe99VNaGq
	wI3fVi00EgJGABhOp4ll3J8gN8bF5SHbcC54YqRG+cyvQhS/x8Ql4P8Jzpq7HrW/NIwC/3wlFKr3J
	rc4qFWid8EgN20grfRgvsfnd7ceE41vUGh/LNxjuD/pXO02NFQWRNbd8DD2A8CInsPAx/KBriT829
	Lc8GfjcAu3rTbufnzu4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmsWO-003ZCu-A8; Sat, 29 May 2021 06:32:32 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmsWK-003ZBO-87
 for linux-riscv@lists.infradead.org; Sat, 29 May 2021 06:32:30 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FsWqm1H3bzYr5j;
 Sat, 29 May 2021 14:29:40 +0800 (CST)
Received: from dggpemm500004.china.huawei.com (7.185.36.219) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 29 May 2021 14:32:21 +0800
Received: from huawei.com (10.174.28.241) by dggpemm500004.china.huawei.com
 (7.185.36.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Sat, 29 May
 2021 14:32:20 +0800
From: Bixuan Cui <cuibixuan@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <vincent.chen@sifive.com>, <sunnanyong@huawei.com>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Bixuan Cui
 <cuibixuan@huawei.com>
Subject: [PATCH -next v2] riscv: fix build error when CONFIG_SMP is disabled
Date: Sat, 29 May 2021 14:31:22 +0800
Message-ID: <20210529063122.5258-1-cuibixuan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.174.28.241]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500004.china.huawei.com (7.185.36.219)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_233228_519424_4E3C565C 
X-CRM114-Status: UNSURE (   8.78  )
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

Fix build error when disable CONFIG_SMP:
mm/pgtable-generic.o: In function `.L19':
pgtable-generic.c:(.text+0x42): undefined reference to `flush_pmd_tlb_range'
mm/pgtable-generic.o: In function `pmdp_huge_clear_flush':
pgtable-generic.c:(.text+0x6c): undefined reference to `flush_pmd_tlb_range'
mm/pgtable-generic.o: In function `pmdp_invalidate':
pgtable-generic.c:(.text+0x162): undefined reference to `flush_pmd_tlb_range'

Fixes: e88b333142e4 ("riscv: mm: add THP support on 64-bit")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
---
Changes from v2:
Move the declaration of flush_pmd_tlb_rang to tlbflush.h

 arch/riscv/include/asm/pgtable.h  |  5 -----
 arch/riscv/include/asm/tlbflush.h | 11 +++++++++++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 29e2c836848d..eda31002c4b1 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -622,11 +622,6 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 {
 	return __pmd(atomic_long_xchg((atomic_long_t *)pmdp, pmd_val(pmd)));
 }
-
-#define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
-void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
-			unsigned long end);
-
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 /*
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index c84218ad7afc..6f78ac4601c9 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -33,6 +33,11 @@ void flush_tlb_mm(struct mm_struct *mm);
 void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr);
 void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		     unsigned long end);
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+#define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
+void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
+			unsigned long end);
+#endif
 #else /* CONFIG_SMP && CONFIG_MMU */
 
 #define flush_tlb_all() local_flush_tlb_all()
@@ -44,6 +49,12 @@ static inline void flush_tlb_range(struct vm_area_struct *vma,
 	local_flush_tlb_all();
 }
 
+static inline void flush_pmd_tlb_range(struct vm_area_struct *vma,
+		unsigned long start, unsigned long end)
+{
+	local_flush_tlb_all();
+}
+
 #define flush_tlb_mm(mm) flush_tlb_all()
 #endif /* !CONFIG_SMP || !CONFIG_MMU */
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
