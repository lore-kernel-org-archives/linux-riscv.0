Return-Path: <SRS0=9QI1=LA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30353C4743D
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 15:21:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E59F260FF0
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 15:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E59F260FF0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2GVqaFaIKUAm4vRrjWlLyVWBEcEel2yqwOXAlDFRr40=; b=O1WcZmW+N/6f/O
	IAxez9XoKW5NHOALq6pbDqlDWWma2I9PWfonWCAb+/SKNpEAwGAHrXQ1/9MPIZHxVqYkleLYRwIDK
	dl/jSpN40al4K5VvD9BUr4zHDJOmxr5s9FzhU22rDuAhtCE62XXRsSFOltcYC6f+hqd+AC4H2GUuy
	vsn7DTM4JuLtmXtBo4m+VQmebIlkkpX0aKfZ7qXJimfblWnSvYOanhK44SaVJOHmWU5eCO5UWlTfL
	9OakNtaNyyAMweavZC+cjTRCNYzb0z63LpgQdkm6awuC1fCvt0LqibmjprlD/oMAGcJiWi1DDa1QB
	a70NtDzL+6ywxvf8/+bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpuaC-000TZV-KL; Sun, 06 Jun 2021 15:21:00 +0000
Received: from [2001:4bb8:192:ff5f:a26e:bb8d:e917:2d71] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpuaA-000TYj-OO; Sun, 06 Jun 2021 15:20:59 +0000
From: Christoph Hellwig <hch@lst.de>
To: guoren@kernel.org,
	palmerdabbelt@google.com
Cc: anup.patel@wdc.com,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/2] riscv: pass the mm_struct to __sbi_tlb_flush_range
Date: Sun,  6 Jun 2021 17:20:49 +0200
Message-Id: <20210606152050.636038-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210606152050.636038-1-hch@lst.de>
References: <20210606152050.636038-1-hch@lst.de>
MIME-Version: 1.0
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

Move the call mm_cpumask from the callers into __sbi_tlb_flush_range to
reduce a bit of duplicate code and prepare for future changes.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/mm/tlbflush.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index fea45af91f53..b458949fa8df 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -10,13 +10,10 @@ void flush_tlb_all(void)
 	sbi_remote_sfence_vma(NULL, 0, -1);
 }
 
-/*
- * This function must not be called with cmask being null.
- * Kernel may panic if cmask is NULL.
- */
-static void __sbi_tlb_flush_range(struct cpumask *cmask, unsigned long start,
+static void __sbi_tlb_flush_range(struct mm_struct *mm, unsigned long start,
 				  unsigned long size, unsigned long stride)
 {
+	struct cpumask *cmask = mm_cpumask(mm);
 	struct cpumask hmask;
 	unsigned int cpuid;
 
@@ -41,23 +38,23 @@ static void __sbi_tlb_flush_range(struct cpumask *cmask, unsigned long start,
 
 void flush_tlb_mm(struct mm_struct *mm)
 {
-	__sbi_tlb_flush_range(mm_cpumask(mm), 0, -1, PAGE_SIZE);
+	__sbi_tlb_flush_range(mm, 0, -1, PAGE_SIZE);
 }
 
 void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 {
-	__sbi_tlb_flush_range(mm_cpumask(vma->vm_mm), addr, PAGE_SIZE, PAGE_SIZE);
+	__sbi_tlb_flush_range(vma->vm_mm, addr, PAGE_SIZE, PAGE_SIZE);
 }
 
 void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		     unsigned long end)
 {
-	__sbi_tlb_flush_range(mm_cpumask(vma->vm_mm), start, end - start, PAGE_SIZE);
+	__sbi_tlb_flush_range(vma->vm_mm, start, end - start, PAGE_SIZE);
 }
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 			unsigned long end)
 {
-	__sbi_tlb_flush_range(mm_cpumask(vma->vm_mm), start, end - start, PMD_SIZE);
+	__sbi_tlb_flush_range(vma->vm_mm, start, end - start, PMD_SIZE);
 }
 #endif
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
