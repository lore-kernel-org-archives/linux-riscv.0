Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C09C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 14:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T7Ch72EdVJn9O9yx54ctt6O0ddSq2QrnXubeI17/CG8=; b=M/tr34RSphFWCr
	j/9DP05rzn4pj55R2veDnwkFG/E0sMu+seSvdpkWuHQOZFFDEaYYNr6FR5NsdQS5BlS4aSX9cRYCT
	JTz6C9Pt2zbnjMnY7xwv2jfrFIxsZ75upZNNUg/dQ9XsxoWWcslPMM0EEE2Nex/0gj2WAikNIkoI+
	xg41CP4nTM9Ny8mIxNhFUYfuY+8o1/J7jZbMg0e+vV6O1XfWQCLFO5EBgwnPmvDLwvWa8SC8IysZ0
	vwagX/UjXBJiPhOLrx179UGezqH8Wl1RJtZWPdtyXkxjqKPeFQwUcv0IHeD90DXLE+WNmIs2xUR74
	taxbwFKX5Eez5tE/h7VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKfbh-008DOH-1e;
	Tue, 02 Jan 2024 14:19:01 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKfbe-008DNj-0B
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 14:19:00 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3373a30af67so1952505f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jan 2024 06:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704205135; x=1704809935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wMN809tankXeln0SghaIn8Kql+3yxJkVpIyb/WVy4mE=;
        b=m8aSqE4NioHE7Utd96cLJQFZC61/90j0ZaPIoKaU+i1Poe9/iPRZ3sKFPy82bBRirD
         7Fwf3RH3bl8Ivv/OANa53/xY86YnSayWft3UMUsMwmqSFRBRSAbc+RWMV2JZQOMceyd2
         9WymHsr2DN0uWsb8FKxac8KZVq52kNM7duQ0RtYqvHRXGY8qxAdIrB2vvQd2epBbtQX5
         XdqdvPXpTzPIbvtKVQYovzmW/ZFVQAkwoe5elIyaMrFH667F/q13X0cgt057jA1dAybU
         i83LvnUFxFfmTjLjqAopr/l1e73aC/dR5nMp6Ikjk4hi+atWhd4jx/HvM6p8Dq3QA2eC
         hLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704205135; x=1704809935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wMN809tankXeln0SghaIn8Kql+3yxJkVpIyb/WVy4mE=;
        b=IZghNffPeids+GCC3xnqwVF2oci6yqoAkqQCIhCqCBvrbEj1TPbDg6UD/9/KAC8tyi
         gfw7RiJ7aVn1aQeilMrYvC9+2K+VlOOhqIPagp7k/q5oFcHfUzBEZ8K13/RqVBYccDSR
         3chOZXA8VlA7bWvfSmHJWi7+iXkVaCBZ1OppyDESYaKeegwwGYHEh6wQXkKxt86ui+Ze
         WpU6YJMCCqAgblN7DI1r4ZYKu1rhUpqkPNdg/s0JBh9u7Gky4ggINSayLf+8gRPZxOf/
         HB3RwhvGtt08U4gZoHpsFsxDKtZeyEJ46uNxHAAc2jyHx/ZD1tMWhqlUI0q9Eby09nK3
         YaUQ==
X-Gm-Message-State: AOJu0Yy58zWx8+xudbJvO7bR7UH6ilFI3ef9y4vJznjZM++8CoXrcJmK
	d5oS+El/bfMD6rg0wXFG45avIRqtrZ2lx3iZRVd1r6o/LDo=
X-Google-Smtp-Source: AGHT+IHuu8YHzUPNDkHHX9vez11aS4PONT163xT3HgL6zasNPiQtGDoJ4rm+KyN+vnhxYydK/VbwAw==
X-Received: by 2002:adf:eb0c:0:b0:336:d9cc:3050 with SMTP id s12-20020adfeb0c000000b00336d9cc3050mr4083761wrn.126.1704205134756;
        Tue, 02 Jan 2024 06:18:54 -0800 (PST)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id b14-20020adff90e000000b003373fe3d345sm5412159wrr.65.2024.01.02.06.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 06:18:54 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] riscv: Add support for BATCHED_UNMAP_TLB_FLUSH
Date: Tue,  2 Jan 2024 15:18:51 +0100
Message-Id: <20240102141851.105144-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_061858_285703_F277AA64 
X-CRM114-Status: GOOD (  19.81  )
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

Allow to defer the flushing of the TLB when unmapping pges, which allows
to reduce the numbers of IPI and the number of sfence.vma.

The ubenchmarch used in commit 43b3dfdd0455 ("arm64: support
batched/deferred tlb shootdown during page reclamation/migration") shows
good performance improvement and perf reports an important decrease in
time spent flushing the tlb (results come from qemu):

Before this patch:

real	2m1.135s
user	0m0.980s
sys	2m0.096s

4.83%  batch_tlb  [kernel.kallsyms]            [k] __flush_tlb_range

After this patch:

real	1m0.543s
user	0m1.059s
sys	0m59.489s

0.14%  batch_tlb  [kernel.kallsyms]            [k] __flush_tlb_range

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/Kconfig                |  1 +
 arch/riscv/include/asm/tlbbatch.h | 15 +++++++
 arch/riscv/include/asm/tlbflush.h | 10 +++++
 arch/riscv/mm/tlbflush.c          | 71 ++++++++++++++++++++++---------
 4 files changed, 77 insertions(+), 20 deletions(-)
 create mode 100644 arch/riscv/include/asm/tlbbatch.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7603bd8ab333..aa07bd43b138 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -53,6 +53,7 @@ config RISCV
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USES_CFI_TRAPS if CFI_CLANG
+	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH if SMP && MMU
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_GENERAL_HUGETLB if !RISCV_ISA_SVNAPOT
diff --git a/arch/riscv/include/asm/tlbbatch.h b/arch/riscv/include/asm/tlbbatch.h
new file mode 100644
index 000000000000..46014f70b9da
--- /dev/null
+++ b/arch/riscv/include/asm/tlbbatch.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 Rivos Inc.
+ */
+
+#ifndef _ASM_RISCV_TLBBATCH_H
+#define _ASM_RISCV_TLBBATCH_H
+
+#include <linux/cpumask.h>
+
+struct arch_tlbflush_unmap_batch {
+	struct cpumask cpumask;
+};
+
+#endif /* _ASM_RISCV_TLBBATCH_H */
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 8f3418c5f172..f0b731ccc0c2 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -46,6 +46,16 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end);
 void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 			unsigned long end);
 #endif
+
+#ifdef CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
+bool arch_tlbbatch_should_defer(struct mm_struct *mm);
+void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
+			       struct mm_struct *mm,
+			       unsigned long uaddr);
+void arch_flush_tlb_batched_pending(struct mm_struct *mm);
+void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);
+#endif /* CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH */
+
 #else /* CONFIG_SMP && CONFIG_MMU */
 
 #define flush_tlb_all() local_flush_tlb_all()
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index e6659d7368b3..bb623bca0a7d 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -93,29 +93,23 @@ static void __ipi_flush_tlb_range_asid(void *info)
 	local_flush_tlb_range_asid(d->start, d->size, d->stride, d->asid);
 }
 
-static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
-			      unsigned long size, unsigned long stride)
+static void __flush_tlb_range(struct cpumask *cmask, unsigned long asid,
+			      unsigned long start, unsigned long size,
+			      unsigned long stride)
 {
 	struct flush_tlb_range_data ftd;
-	const struct cpumask *cmask;
-	unsigned long asid = FLUSH_TLB_NO_ASID;
 	bool broadcast;
 
-	if (mm) {
-		unsigned int cpuid;
+	if (cpumask_empty(cmask))
+		return;
 
-		cmask = mm_cpumask(mm);
-		if (cpumask_empty(cmask))
-			return;
+	if (cmask != cpu_online_mask) {
+		unsigned int cpuid;
 
 		cpuid = get_cpu();
 		/* check if the tlbflush needs to be sent to other CPUs */
 		broadcast = cpumask_any_but(cmask, cpuid) < nr_cpu_ids;
-
-		if (static_branch_unlikely(&use_asid_allocator))
-			asid = atomic_long_read(&mm->context.id) & asid_mask;
 	} else {
-		cmask = cpu_online_mask;
 		broadcast = true;
 	}
 
@@ -135,25 +129,34 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
 		local_flush_tlb_range_asid(start, size, stride, asid);
 	}
 
-	if (mm)
+	if (cmask != cpu_online_mask)
 		put_cpu();
 }
 
+static inline unsigned long get_mm_asid(struct mm_struct *mm)
+{
+	return static_branch_unlikely(&use_asid_allocator) ?
+			atomic_long_read(&mm->context.id) & asid_mask : FLUSH_TLB_NO_ASID;
+}
+
 void flush_tlb_mm(struct mm_struct *mm)
 {
-	__flush_tlb_range(mm, 0, FLUSH_TLB_MAX_SIZE, PAGE_SIZE);
+	__flush_tlb_range(mm_cpumask(mm), get_mm_asid(mm),
+			  0, FLUSH_TLB_MAX_SIZE, PAGE_SIZE);
 }
 
 void flush_tlb_mm_range(struct mm_struct *mm,
 			unsigned long start, unsigned long end,
 			unsigned int page_size)
 {
-	__flush_tlb_range(mm, start, end - start, page_size);
+	__flush_tlb_range(mm_cpumask(mm), get_mm_asid(mm),
+			  start, end - start, page_size);
 }
 
 void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 {
-	__flush_tlb_range(vma->vm_mm, addr, PAGE_SIZE, PAGE_SIZE);
+	__flush_tlb_range(mm_cpumask(vma->vm_mm), get_mm_asid(vma->vm_mm),
+			  addr, PAGE_SIZE, PAGE_SIZE);
 }
 
 void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
@@ -185,18 +188,46 @@ void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		}
 	}
 
-	__flush_tlb_range(vma->vm_mm, start, end - start, stride_size);
+	__flush_tlb_range(mm_cpumask(vma->vm_mm), get_mm_asid(vma->vm_mm),
+			  start, end - start, stride_size);
 }
 
 void flush_tlb_kernel_range(unsigned long start, unsigned long end)
 {
-	__flush_tlb_range(NULL, start, end - start, PAGE_SIZE);
+	__flush_tlb_range((struct cpumask *)cpu_online_mask, FLUSH_TLB_NO_ASID,
+			  start, end - start, PAGE_SIZE);
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 			unsigned long end)
 {
-	__flush_tlb_range(vma->vm_mm, start, end - start, PMD_SIZE);
+	__flush_tlb_range(mm_cpumask(vma->vm_mm), get_mm_asid(vma->vm_mm),
+			  start, end - start, PMD_SIZE);
 }
 #endif
+
+#ifdef CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
+bool arch_tlbbatch_should_defer(struct mm_struct *mm)
+{
+	return true;
+}
+
+void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
+			       struct mm_struct *mm,
+			       unsigned long uaddr)
+{
+	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
+}
+
+void arch_flush_tlb_batched_pending(struct mm_struct *mm)
+{
+	flush_tlb_mm(mm);
+}
+
+void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
+{
+	__flush_tlb_range(&batch->cpumask, FLUSH_TLB_NO_ASID, 0,
+			  FLUSH_TLB_MAX_SIZE, PAGE_SIZE);
+}
+#endif /* CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
