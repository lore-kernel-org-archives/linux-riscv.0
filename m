Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D91C46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 08:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YlKVZRe2ue9kdcSj6ThEUNr+b494/1AzpbayDVqaYXc=; b=ysNqKaEl4xsXff
	hvwKiSn+oJ/FxDBkf0hBJxvzsk9FrapebWiE9Q8OWvTnZ1KNP8erPzhFQqa5iv5on3wxGVbQia3UJ
	GU9ZaWzEmvinoKzvE8xnjOD1DpsicHU5yfUCokbliiqcaynNPZETml1+GRzqHmjfTNedjTOEjrv0b
	mRnqicV550Gx/VtNQGksUJk5Bc7fknYOSoEMjUD7Z54w+RvK/f0ycReaIyYSjW2V47wE2ZRoxWknt
	byYYZEhW1/ydNdLIPB7H7VwKbpsMpEs6HiQ16k51qcI7J085UIGIlhjpcP66Dg3/jkP8dNGhzTWuX
	T7Ol7okwFG5E+4tEMwlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSYEX-001x8A-08;
	Wed, 24 Jan 2024 08:03:41 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSYEU-001x7R-0q
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jan 2024 08:03:40 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-337d5480a6aso4893707f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 00:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706083414; x=1706688214; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GZy9WpZnhJvrQeE8AmDUs4sp0+DbG8sczVOvkF4cAt8=;
        b=gbzXmhh8wTm4PCma9KWJ03Wyk0aMjFWkguvaDw7fr4r+ZonSNvSzdxjEgRcsIpOy5J
         qkYD/P0kksJgvCxDbplfULVCzmRc/P8TbfNh2XrCmQE1mdZOR3ECxnwZa2iMfO0Di9vs
         ndwTwhblv+7AAPI09HbCUX1rQHvhb0dZ5Yxijm8Agf0SdHxXK7/3miAgLto9hcq9WYbT
         zFRJl3gvT9ufWy17R+xaSB5iykd47XAPIgoR4zPbe1fo7AqXTGgLfg47ytc1oRRjkJu5
         OzZIGvzhp1K2IB6o0Re/1uMP0d5/jKUPnje5GxB/9gNSRVX3mjP4wVVbv/p9poBEeT+T
         YrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706083414; x=1706688214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZy9WpZnhJvrQeE8AmDUs4sp0+DbG8sczVOvkF4cAt8=;
        b=eubOwobI0SwpfK1lALefyPey2MSsrSR4guSxOQmfFzaOtYrSbsHNE0SjOFwvW7LcfE
         PIkU7q5vjgfSsh6DllRi5BlsiYtRqyetnYlcR1D1lNiORT1GGfmJYY/dkFUs5zTZcwpa
         ehgULW+OoTO+mtWd/+zZM+wy4+jyQB3bd7sCj7EBMGOZQIAnj5ekxRcrr+69mKETGjCP
         rl++V3awLD0+gl8uOIF8N6EScza8BfVyXFvd9JQdCrnsXn2vaircaC0q2t6zgBaPHrfk
         tS6GiQxDZj+IM7BFaPQxT6aCeI30Y3Mb8ZE3NHJ60wp+enYMMvpjEbRnmK8PoyzMJ7fG
         uAXg==
X-Gm-Message-State: AOJu0YwBZ0XlxlQfUv8vPk9E0vrYDR2mvXlhfP2NozKlG0GIZPCr49G/
	txj1TdJc5Ed/n1CA7wSQwzpcNsiiMy0htVqt50tJik5f26nleeoO1Jw9Nm1SMB0=
X-Google-Smtp-Source: AGHT+IEwCglOT9kCUsrL9QV6qoywOPNiQgp6EwlC96xpmz3dFXkjkP38QsKvnDEjagMQzVxRLinzRQ==
X-Received: by 2002:a7b:cb8a:0:b0:40e:8c73:b205 with SMTP id m10-20020a7bcb8a000000b0040e8c73b205mr883048wmi.74.1706083414076;
        Wed, 24 Jan 2024 00:03:34 -0800 (PST)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id g7-20020a7bc4c7000000b0040d5c58c41dsm43655605wmk.24.2024.01.24.00.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 00:03:33 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] riscv: Call secondary mmu notifier when flushing the tlb
Date: Wed, 24 Jan 2024 09:03:25 +0100
Message-Id: <20240124080325.2324462-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_000338_848052_8C1F5B9F 
X-CRM114-Status: GOOD (  11.20  )
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
 arch/riscv/mm/tlbflush.c | 39 +++++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 8d12b26f5ac3..ad7c4205524d 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -4,6 +4,7 @@
 #include <linux/smp.h>
 #include <linux/sched.h>
 #include <linux/hugetlb.h>
+#include <linux/mmu_notifier.h>
 #include <asm/sbi.h>
 #include <asm/mmu_context.h>
 
@@ -98,11 +99,19 @@ static void __ipi_flush_tlb_range_asid(void *info)
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
@@ -136,31 +145,26 @@ static void __flush_tlb_range(struct cpumask *cmask, unsigned long asid,
 
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
 
@@ -193,13 +197,13 @@ void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
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
 
@@ -207,7 +211,7 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end)
 void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 			unsigned long end)
 {
-	__flush_tlb_range(mm_cpumask(vma->vm_mm), get_mm_asid(vma->vm_mm),
+	__flush_tlb_range(vma->vm_mm, mm_cpumask(vma->vm_mm),
 			  start, end - start, PMD_SIZE);
 }
 #endif
@@ -221,7 +225,10 @@ void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
 			       struct mm_struct *mm,
 			       unsigned long uaddr)
 {
+	unsigned long start = uaddr & PAGE_MASK;
+
 	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
+	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, start + PAGE_SIZE);
 }
 
 void arch_flush_tlb_batched_pending(struct mm_struct *mm)
@@ -231,6 +238,6 @@ void arch_flush_tlb_batched_pending(struct mm_struct *mm)
 
 void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 {
-	__flush_tlb_range(&batch->cpumask, FLUSH_TLB_NO_ASID, 0,
-			  FLUSH_TLB_MAX_SIZE, PAGE_SIZE);
+	__flush_tlb_range(NULL, &batch->cpumask,
+			  0, FLUSH_TLB_MAX_SIZE, PAGE_SIZE);
 }
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
