Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30069C54E64
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 07:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NQ3fZNCKk6RZe9eDnYyBxzqUJMjJN2c7maGeyp7UFw8=; b=I+OfiynPUan8cK
	47yK/G84VCRV3WMlkUf6XfQ9m253dPxZAc8NuzERrv8uIgK4Nd48STpp4w9moQ+ckNJl5KQo/oHu1
	qK4JORzUT6gI4UQ5BbrKF3cw5ztCqOFbArlx5ba2hhqxx9CjIwubNWGbUDQaqaO/SranWyfsBdLbg
	vlNMxDATF+ho8GoMRymTzLxy4CIsbD4xQ2Rmr3m+hdaWnlpFRJr3zxvbEv4yiYmaH8TZuuqLZ+vth
	b3V5/pxBpfneSR+/lSVq1UzsCTuvL+y1wqFzgsgVTC9fHjLdPSEjSIffnOE3n7XtcQUVugmv6n1M7
	9FTqIbBvo/qbQd9ZugQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpkLe-0000000Cu25-0qDa;
	Thu, 28 Mar 2024 07:38:54 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpkLY-0000000Cu0E-1XWP
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 07:38:52 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-515a86daf09so745691e87.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 00:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711611521; x=1712216321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fPLIncRw2+PuZW9Omz7FzGCNHvO8e2LeyJVag/haJag=;
        b=HT+euaK7TTqs93E3s++wZLkEXNHbXnnQC0tNzMhRjRfqom0Z6JmQz+ewPJzjkSJmGP
         G2/5EDqxOExiQBwve3Kt8RmrlvxttlTy0F+w1rEzIFb03N1D8eYVqYmra5woPnMyxgUH
         iVMADF1IO6O2yP+KwgwqMifU/osjPGVd96ntelwoILy49dfoZGu5234a5nN3fsD0qbgZ
         Ig3mjOzvMXC3V2TIWShOIb1Bz99FaX1ok5OtvxGRWngJ8mvC5qiC8gHfH1M6zld4xq5p
         KAve+Mf/4ehyNQe/j5c+N763O9OiAQbahq8tQjvJLVTRRR6qK8mYVshVPtDFLCQ/UYxP
         UDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711611521; x=1712216321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPLIncRw2+PuZW9Omz7FzGCNHvO8e2LeyJVag/haJag=;
        b=qmNt+dzm34SfxRBlgqtfCIocTwi1gaXtuINkIaKExeS8FY8H2PmX+WhcUww97ufyUb
         WKoBaQPFGmBmstKmwrVgQXwYKLMbz9Kkk/EUn75iHqe+7/qZihiTH8R5ps1r+ejd0UXx
         6AWPc3WgJd9OYmd+94mGlZb1nbHxQfQp1HnhysUJ4ZJsrMn10AM52gyu3BpulTNMy6sb
         ovqCcdjfRq+aqcd1CxksUBppD5XA+tFVUFGpagTLevbqiQDM825oszEPViKHQfD2ZLha
         Vqu5RZqueDwPBNTsFoazS3hEWcOzOcYVOcpee6Z+cZJvKvR9z574+pR6FkZ1keZc77tD
         fakQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeqjZXzRuVDGP+zasmPjFchSkoHi3OQd5tTO1B/5Nw7pC3SJE6K1N51MNOwEuRdkE5eq2wO9q0A63CqdcGgcCLO3WNB18ZzDGXQpK4J/AE
X-Gm-Message-State: AOJu0Ywlr7dLUHTRXvHzi0OaZpx6HtaaEfnxkSLOuGZFQJj3YcPCpOnZ
	RbzHCD09wRl1SBK3jPeeV3g3UgpldO5iiUaIz1pG1/5vsCI6+y4avUdPQCN2d60=
X-Google-Smtp-Source: AGHT+IFd/4meCvAsnvSLu4U6ayqsOQ6K+Buq7tZPS/mDr1Y/tbxrxjDdT/lg+/xLeoD+YX8SRtIN5A==
X-Received: by 2002:a2e:a0ca:0:b0:2d2:206a:2f2a with SMTP id f10-20020a2ea0ca000000b002d2206a2f2amr1651907ljm.17.1711611521459;
        Thu, 28 Mar 2024 00:38:41 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id f10-20020a05600c154a00b004154596db0esm878248wmg.19.2024.03.28.00.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 00:38:41 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2] riscv: Call secondary mmu notifier when flushing the tlb
Date: Thu, 28 Mar 2024 08:38:38 +0100
Message-Id: <20240328073838.8776-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_003848_616310_7B016D33 
X-CRM114-Status: GOOD (  11.38  )
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

This is required to allow the IOMMU driver to correctly flush its own
TLB.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---

Changes in v2:
- Rebase on top of 6.9-rc1

 arch/riscv/mm/tlbflush.c | 39 +++++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 893566e004b7..854d984deb07 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -4,6 +4,7 @@
 #include <linux/smp.h>
 #include <linux/sched.h>
 #include <linux/hugetlb.h>
+#include <linux/mmu_notifier.h>
 #include <asm/sbi.h>
 #include <asm/mmu_context.h>
 
@@ -99,11 +100,19 @@ static void __ipi_flush_tlb_range_asid(void *info)
 	local_flush_tlb_range_asid(d->start, d->size, d->stride, d->asid);
 }
 
-static void __flush_tlb_range(struct cpumask *cmask, unsigned long asid,
+static inline unsigned long get_mm_asid(struct mm_struct *mm)
+{
+	return (mm && static_branch_unlikely(&use_asid_allocator)) ?
+			atomic_long_read(&mm->context.id) & asid_mask : FLUSH_TLB_NO_ASID;
+}
+
+static void __flush_tlb_range(struct mm_struct *mm,
+			      struct cpumask *cmask,
 			      unsigned long start, unsigned long size,
 			      unsigned long stride)
 {
 	struct flush_tlb_range_data ftd;
+	unsigned long asid = get_mm_asid(mm);
 	bool broadcast;
 
 	if (cpumask_empty(cmask))
@@ -137,31 +146,26 @@ static void __flush_tlb_range(struct cpumask *cmask, unsigned long asid,
 
 	if (cmask != cpu_online_mask)
 		put_cpu();
-}
 
-static inline unsigned long get_mm_asid(struct mm_struct *mm)
-{
-	return static_branch_unlikely(&use_asid_allocator) ?
-			atomic_long_read(&mm->context.id) & asid_mask : FLUSH_TLB_NO_ASID;
+	if (mm)
+		mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, start + size);
 }
 
 void flush_tlb_mm(struct mm_struct *mm)
 {
-	__flush_tlb_range(mm_cpumask(mm), get_mm_asid(mm),
-			  0, FLUSH_TLB_MAX_SIZE, PAGE_SIZE);
+	__flush_tlb_range(mm, mm_cpumask(mm), 0, FLUSH_TLB_MAX_SIZE, PAGE_SIZE);
 }
 
 void flush_tlb_mm_range(struct mm_struct *mm,
 			unsigned long start, unsigned long end,
 			unsigned int page_size)
 {
-	__flush_tlb_range(mm_cpumask(mm), get_mm_asid(mm),
-			  start, end - start, page_size);
+	__flush_tlb_range(mm, mm_cpumask(mm), start, end - start, page_size);
 }
 
 void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 {
-	__flush_tlb_range(mm_cpumask(vma->vm_mm), get_mm_asid(vma->vm_mm),
+	__flush_tlb_range(vma->vm_mm, mm_cpumask(vma->vm_mm),
 			  addr, PAGE_SIZE, PAGE_SIZE);
 }
 
@@ -194,13 +198,13 @@ void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		}
 	}
 
-	__flush_tlb_range(mm_cpumask(vma->vm_mm), get_mm_asid(vma->vm_mm),
+	__flush_tlb_range(vma->vm_mm, mm_cpumask(vma->vm_mm),
 			  start, end - start, stride_size);
 }
 
 void flush_tlb_kernel_range(unsigned long start, unsigned long end)
 {
-	__flush_tlb_range((struct cpumask *)cpu_online_mask, FLUSH_TLB_NO_ASID,
+	__flush_tlb_range(NULL, (struct cpumask *)cpu_online_mask,
 			  start, end - start, PAGE_SIZE);
 }
 
@@ -208,7 +212,7 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end)
 void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 			unsigned long end)
 {
-	__flush_tlb_range(mm_cpumask(vma->vm_mm), get_mm_asid(vma->vm_mm),
+	__flush_tlb_range(vma->vm_mm, mm_cpumask(vma->vm_mm),
 			  start, end - start, PMD_SIZE);
 }
 #endif
@@ -222,7 +226,10 @@ void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
 			       struct mm_struct *mm,
 			       unsigned long uaddr)
 {
+	unsigned long start = uaddr & PAGE_MASK;
+
 	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
+	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, start + PAGE_SIZE);
 }
 
 void arch_flush_tlb_batched_pending(struct mm_struct *mm)
@@ -232,7 +239,7 @@ void arch_flush_tlb_batched_pending(struct mm_struct *mm)
 
 void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 {
-	__flush_tlb_range(&batch->cpumask, FLUSH_TLB_NO_ASID, 0,
-			  FLUSH_TLB_MAX_SIZE, PAGE_SIZE);
+	__flush_tlb_range(NULL, &batch->cpumask,
+			  0, FLUSH_TLB_MAX_SIZE, PAGE_SIZE);
 	cpumask_clear(&batch->cpumask);
 }
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
