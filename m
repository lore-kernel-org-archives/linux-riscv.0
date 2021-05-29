Return-Path: <SRS0=5xGv=KY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9572C4708E
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 02:05:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E76161355
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 02:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E76161355
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=THCLGOcc4Gr6GSpRZwvZ9A1b9OX6Z6TGBkv5fHpmxDI=; b=lbaOWAuY0lVwNj
	67O5D9UhtjRtXo+uYSbD13hpEGTidBfOj2oCRtwZxOktmXdnW4BcXxzR9Vp45Du6p+HnXohQ+UUaI
	aNZ3yJRTskqxVq/N0sfhprXJSVTEiFVqvLzVqBnO6pJK5JCvtDy5LPdHxaPvJ0ObFnfQwU+XpbEH7
	cYQxB0VwEAEsb/fOdKESiLdqSXF0a2b5M6szEtOKp4QgM2Kujj7rCeTnSTIrkEnv7AUtPJQbH3WFZ
	DckcirdBZ/vtXlJ/YuKkceJbkhEU8lomTqLko2VWVXUKG0L+f7J5ekhtrlhe2uvsu6CzZXu8vxeaJ
	UbKDYvwgtQE4peO2r/sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmoLE-002ZCv-A7; Sat, 29 May 2021 02:04:44 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmoLB-002Z9V-9k
 for linux-riscv@lists.infradead.org; Sat, 29 May 2021 02:04:42 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FsPsX6bGRz66Gh;
 Sat, 29 May 2021 10:00:48 +0800 (CST)
Received: from dggpemm500004.china.huawei.com (7.185.36.219) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 29 May 2021 10:04:27 +0800
Received: from huawei.com (10.174.28.241) by dggpemm500004.china.huawei.com
 (7.185.36.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Sat, 29 May
 2021 10:04:27 +0800
From: Bixuan Cui <cuibixuan@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <vincent.chen@sifive.com>, <sunnanyong@huawei.com>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Bixuan Cui
 <cuibixuan@huawei.com>
Subject: [PATCH -next] module: fix build error when CONFIG_SMP is disabled
Date: Sat, 29 May 2021 10:03:28 +0800
Message-ID: <20210529020328.36863-1-cuibixuan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.174.28.241]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500004.china.huawei.com (7.185.36.219)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_190441_528250_76BDDDC9 
X-CRM114-Status: UNSURE (   6.86  )
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
 arch/riscv/include/asm/tlbflush.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index c84218ad7afc..9d5801f6e2c3 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -44,6 +44,12 @@ static inline void flush_tlb_range(struct vm_area_struct *vma,
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
