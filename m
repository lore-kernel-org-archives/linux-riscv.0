Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24698C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 06:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OGiE4hc5XE4tDVDWjbnoVrl4Ms/faXMq4asDWgXMAhk=; b=TfVlJQgu55u31k
	JKAeSWpPD30jqZhnnuCeaPSOfZWLjcirBxcPCB8x6VjW58kAxkXbt6u35IBJhpFt//dWTkQnYjE6o
	iWcyANtHTLkn2m5qxjubfHT2AlD1aiywu9tw90F0nifFTWS+jtVfSZSiiEwNZG5ucQ5c5R7t/lPnG
	EKsdgNIJ75Mn58+evKX3GPeRt/5kxJwyrilI/dAjKO8HQ5s9NUlHKu8LoIW9ByHpLcAkbpfl62c/x
	kGPkBv/ra8bPN07I2ZBnKQ2WmeuQU+N4mYUIdExyL3CyArzJlfhQAeIZF/4dLduxIWccuC7xbZmfZ
	f+67gfg83zAsnAtEHxzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSt74-006iU2-10;
	Thu, 25 Jan 2024 06:21:22 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSt70-006iPQ-1U
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 06:21:20 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5d5ce6a0e5fso678038a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 22:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1706163673; x=1706768473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8deh7BuQ3ts/uLqk4/wq+JNmxtV0Ltxd2gA+4lq+yEo=;
        b=GXpf1CF0vZXhXV46DC4XBeTuGpvoMahW3VCiJZ0X1K3f/Hezsa+qB1jUCt6GrCObE4
         eX2mEos+VWZ5DeMokOdCAqGMopapt5hANEmQpBiWsx0MHGwAUO8l4kdGfclFdgHIKyaS
         kzDmxMwoJQCVX2Y9n8LnLQ64QkSm1A8//1vWw34m7bZgjUGVmhQk1ZwjWAVWu+ECPcw7
         BcZ9dCSEOL+1OTFURklX+K3yOZ4dU2Qav7yNJ3syrx4QKMaT8N4+Fmcr89aRG1qb5SLo
         4hjpZlhdFoItz6GoydJ9DaZL6qQ/+epPe7HpO4pJLBuYOAfd6hbLKlUOBqolEhZ60rpy
         LGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706163673; x=1706768473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8deh7BuQ3ts/uLqk4/wq+JNmxtV0Ltxd2gA+4lq+yEo=;
        b=PK9WIymL9BfOQuWdkfBxhbVQBei0sAnxm2cIaUoSuYA//i/eOQgFOIcFrCS5dVpcU/
         ZuhF5T7hoXRp11rkzijYpQ+ohiby/MW0EooEF4OdR+t484lHS/OCSRZfboKDq2GU4RWv
         OUm3SvGPvHJw4fAtburNKlNw0C5q7j02k2d0zd8rHIsS8YDnKWAVWj+7rfPBYHpKfdaS
         DVYJFcj4RTChMawk67SiHWuFGLb0P56MkvmubrioPJtOiKZT/LOWobEIaHAvdaF5+dOU
         ItEtoSw/PZmEoZezu92GUMZNOp++igaN2KBQiqgs9/oPs4QJNhrjJum6PIvU2+LCD3fg
         1bkA==
X-Gm-Message-State: AOJu0YymaQPElb0FxbBIrtMipX5QHyJwus0tlboMg6nn/0ghP2nujMsL
	Rahp0979aMCkvwHW+rzca29tG8U+C5dr54m4Zc8whDN+MwNPlO/oFbCNTqZ1XOw=
X-Google-Smtp-Source: AGHT+IH46YRis6VxF4OPTBhmquFzd7OOMDXdftqgNuUXP+2HmAoBvyd9StGt2p3s+V98j2j3v1iekw==
X-Received: by 2002:a05:6a20:3caa:b0:19c:4ebc:126c with SMTP id b42-20020a056a203caa00b0019c4ebc126cmr490378pzj.86.1706163673232;
        Wed, 24 Jan 2024 22:21:13 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.231])
        by smtp.gmail.com with ESMTPSA id ev7-20020a17090aeac700b0029105d49b2dsm701779pjb.20.2024.01.24.22.21.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 24 Jan 2024 22:21:12 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	ajones@ventanamicro.com,
	mchitale@ventanamicro.com,
	dylan@andestech.com,
	cuiyunhui@bytedance.com,
	sergey.matyukevich@syntacore.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jszhang@kernel.org,
	apatel@ventanamicro.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: add uniprocessor flush_tlb_range() support
Date: Thu, 25 Jan 2024 14:20:44 +0800
Message-Id: <20240125062044.63344-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_222118_518225_9C8CB703 
X-CRM114-Status: GOOD (  17.12  )
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

Add support for flush_tlb_range() to improve TLB performance for
UP systems. In order to avoid the mutual inclusion of tlbflush.h
and hugetlb.h, the UP part is also implemented in tlbflush.c.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/tlbflush.h |  61 ++++++----
 arch/riscv/mm/Makefile            |   2 +-
 arch/riscv/mm/tlbflush.c          | 195 ++++++++++++++++++------------
 3 files changed, 156 insertions(+), 102 deletions(-)

diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 928f096dca21..426f043fb450 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -10,12 +10,21 @@
 #include <linux/mm_types.h>
 #include <asm/smp.h>
 #include <asm/errata_list.h>
+#include <asm/tlbbatch.h>
 
 #define FLUSH_TLB_MAX_SIZE      ((unsigned long)-1)
 #define FLUSH_TLB_NO_ASID       ((unsigned long)-1)
 
 #ifdef CONFIG_MMU
 extern unsigned long asid_mask;
+DECLARE_STATIC_KEY_FALSE(use_asid_allocator);
+
+struct flush_tlb_range_data {
+	unsigned long asid;
+	unsigned long start;
+	unsigned long size;
+	unsigned long stride;
+};
 
 static inline void local_flush_tlb_all(void)
 {
@@ -27,12 +36,40 @@ static inline void local_flush_tlb_page(unsigned long addr)
 {
 	ALT_FLUSH_TLB_PAGE(__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory"));
 }
+
+static inline void local_flush_tlb_all_asid(unsigned long asid)
+{
+	if (asid != FLUSH_TLB_NO_ASID)
+		__asm__ __volatile__ ("sfence.vma x0, %0"
+				:
+				: "r" (asid)
+				: "memory");
+	else
+		local_flush_tlb_all();
+}
+
+static inline void local_flush_tlb_page_asid(unsigned long addr,
+		unsigned long asid)
+{
+	if (asid != FLUSH_TLB_NO_ASID)
+		__asm__ __volatile__ ("sfence.vma %0, %1"
+				:
+				: "r" (addr), "r" (asid)
+				: "memory");
+	else
+		local_flush_tlb_page(addr);
+}
+
+static inline unsigned long get_mm_asid(struct mm_struct *mm)
+{
+	return static_branch_unlikely(&use_asid_allocator) ?
+			atomic_long_read(&mm->context.id) & asid_mask : FLUSH_TLB_NO_ASID;
+}
 #else /* CONFIG_MMU */
 #define local_flush_tlb_all()			do { } while (0)
 #define local_flush_tlb_page(addr)		do { } while (0)
 #endif /* CONFIG_MMU */
 
-#if defined(CONFIG_SMP) && defined(CONFIG_MMU)
 void flush_tlb_all(void);
 void flush_tlb_mm(struct mm_struct *mm);
 void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
@@ -55,26 +92,4 @@ void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
 void arch_flush_tlb_batched_pending(struct mm_struct *mm);
 void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);
 
-#else /* CONFIG_SMP && CONFIG_MMU */
-
-#define flush_tlb_all() local_flush_tlb_all()
-#define flush_tlb_page(vma, addr) local_flush_tlb_page(addr)
-
-static inline void flush_tlb_range(struct vm_area_struct *vma,
-		unsigned long start, unsigned long end)
-{
-	local_flush_tlb_all();
-}
-
-/* Flush a range of kernel pages */
-static inline void flush_tlb_kernel_range(unsigned long start,
-	unsigned long end)
-{
-	local_flush_tlb_all();
-}
-
-#define flush_tlb_mm(mm) flush_tlb_all()
-#define flush_tlb_mm_range(mm, start, end, page_size) flush_tlb_all()
-#endif /* !CONFIG_SMP || !CONFIG_MMU */
-
 #endif /* _ASM_RISCV_TLBFLUSH_H */
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 2c869f8026a8..7c6c4c858a6b 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -19,7 +19,7 @@ obj-y += context.o
 obj-y += pmem.o
 
 ifeq ($(CONFIG_MMU),y)
-obj-$(CONFIG_SMP) += tlbflush.o
+obj-y += tlbflush.o
 endif
 obj-$(CONFIG_HUGETLB_PAGE) += hugetlbpage.o
 obj-$(CONFIG_PTDUMP_CORE) += ptdump.o
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 8d12b26f5ac3..4765603fa08a 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -6,28 +6,36 @@
 #include <linux/hugetlb.h>
 #include <asm/sbi.h>
 #include <asm/mmu_context.h>
+#include <asm/tlbflush.h>
 
-static inline void local_flush_tlb_all_asid(unsigned long asid)
+static unsigned long get_stride_size(struct vm_area_struct *vma)
 {
-	if (asid != FLUSH_TLB_NO_ASID)
-		__asm__ __volatile__ ("sfence.vma x0, %0"
-				:
-				: "r" (asid)
-				: "memory");
-	else
-		local_flush_tlb_all();
-}
+	unsigned long stride_size;
 
-static inline void local_flush_tlb_page_asid(unsigned long addr,
-		unsigned long asid)
-{
-	if (asid != FLUSH_TLB_NO_ASID)
-		__asm__ __volatile__ ("sfence.vma %0, %1"
-				:
-				: "r" (addr), "r" (asid)
-				: "memory");
-	else
-		local_flush_tlb_page(addr);
+	if (!is_vm_hugetlb_page(vma))
+		return PAGE_SIZE;
+
+	stride_size = huge_page_size(hstate_vma(vma));
+
+	/*
+	 * As stated in the privileged specification, every PTE in a
+	 * NAPOT region must be invalidated, so reset the stride in that
+	 * case.
+	 */
+	if (has_svnapot()) {
+		if (stride_size >= PGDIR_SIZE)
+			stride_size = PGDIR_SIZE;
+		else if (stride_size >= P4D_SIZE)
+			stride_size = P4D_SIZE;
+		else if (stride_size >= PUD_SIZE)
+			stride_size = PUD_SIZE;
+		else if (stride_size >= PMD_SIZE)
+			stride_size = PMD_SIZE;
+		else
+			stride_size = PAGE_SIZE;
+	}
+
+	return stride_size;
 }
 
 /*
@@ -66,31 +74,12 @@ static inline void local_flush_tlb_range_asid(unsigned long start,
 		local_flush_tlb_range_threshold_asid(start, size, stride, asid);
 }
 
-void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
-{
-	local_flush_tlb_range_asid(start, end, PAGE_SIZE, FLUSH_TLB_NO_ASID);
-}
-
+#ifdef CONFIG_SMP
 static void __ipi_flush_tlb_all(void *info)
 {
 	local_flush_tlb_all();
 }
 
-void flush_tlb_all(void)
-{
-	if (riscv_use_ipi_for_rfence())
-		on_each_cpu(__ipi_flush_tlb_all, NULL, 1);
-	else
-		sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE, FLUSH_TLB_NO_ASID);
-}
-
-struct flush_tlb_range_data {
-	unsigned long asid;
-	unsigned long start;
-	unsigned long size;
-	unsigned long stride;
-};
-
 static void __ipi_flush_tlb_range_asid(void *info)
 {
 	struct flush_tlb_range_data *d = info;
@@ -138,10 +127,18 @@ static void __flush_tlb_range(struct cpumask *cmask, unsigned long asid,
 		put_cpu();
 }
 
-static inline unsigned long get_mm_asid(struct mm_struct *mm)
+void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 {
-	return static_branch_unlikely(&use_asid_allocator) ?
-			atomic_long_read(&mm->context.id) & asid_mask : FLUSH_TLB_NO_ASID;
+	__flush_tlb_range(mm_cpumask(vma->vm_mm), get_mm_asid(vma->vm_mm),
+			  addr, PAGE_SIZE, PAGE_SIZE);
+}
+
+void flush_tlb_all(void)
+{
+	if (riscv_use_ipi_for_rfence())
+		on_each_cpu(__ipi_flush_tlb_all, NULL, 1);
+	else
+		sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE, FLUSH_TLB_NO_ASID);
 }
 
 void flush_tlb_mm(struct mm_struct *mm)
@@ -158,41 +155,12 @@ void flush_tlb_mm_range(struct mm_struct *mm,
 			  start, end - start, page_size);
 }
 
-void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
-{
-	__flush_tlb_range(mm_cpumask(vma->vm_mm), get_mm_asid(vma->vm_mm),
-			  addr, PAGE_SIZE, PAGE_SIZE);
-}
-
 void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		     unsigned long end)
 {
 	unsigned long stride_size;
 
-	if (!is_vm_hugetlb_page(vma)) {
-		stride_size = PAGE_SIZE;
-	} else {
-		stride_size = huge_page_size(hstate_vma(vma));
-
-		/*
-		 * As stated in the privileged specification, every PTE in a
-		 * NAPOT region must be invalidated, so reset the stride in that
-		 * case.
-		 */
-		if (has_svnapot()) {
-			if (stride_size >= PGDIR_SIZE)
-				stride_size = PGDIR_SIZE;
-			else if (stride_size >= P4D_SIZE)
-				stride_size = P4D_SIZE;
-			else if (stride_size >= PUD_SIZE)
-				stride_size = PUD_SIZE;
-			else if (stride_size >= PMD_SIZE)
-				stride_size = PMD_SIZE;
-			else
-				stride_size = PAGE_SIZE;
-		}
-	}
-
+	stride_size = get_stride_size(vma);
 	__flush_tlb_range(mm_cpumask(vma->vm_mm), get_mm_asid(vma->vm_mm),
 			  start, end - start, stride_size);
 }
@@ -203,6 +171,12 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end)
 			  start, end - start, PAGE_SIZE);
 }
 
+void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
+{
+	__flush_tlb_range(&batch->cpumask, FLUSH_TLB_NO_ASID, 0,
+			  FLUSH_TLB_MAX_SIZE, PAGE_SIZE);
+}
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 			unsigned long end)
@@ -212,6 +186,77 @@ void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 }
 #endif
 
+#else
+static void __flush_tlb_range_up(struct mm_struct *mm, unsigned long start,
+				 unsigned long size, unsigned long stride)
+{
+	unsigned long asid = FLUSH_TLB_NO_ASID;
+
+	if (mm)
+		asid = get_mm_asid(mm);
+
+	local_flush_tlb_range_asid(start, size, stride, asid);
+}
+
+void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
+{
+	local_flush_tlb_page(addr);
+}
+
+void flush_tlb_all(void)
+{
+	local_flush_tlb_all();
+}
+
+void flush_tlb_mm(struct mm_struct *mm)
+{
+	__flush_tlb_range_up(mm, 0, FLUSH_TLB_MAX_SIZE, PAGE_SIZE);
+}
+
+void flush_tlb_mm_range(struct mm_struct *mm,
+			unsigned long start, unsigned long end,
+			unsigned int page_size)
+{
+	__flush_tlb_range_up(mm, start, end - start, page_size);
+}
+
+void flush_tlb_range(struct vm_area_struct *vma,
+		unsigned long start, unsigned long end)
+{
+	unsigned long stride_size;
+
+	stride_size = get_stride_size(vma);
+	__flush_tlb_range_up(vma->vm_mm, start, end - start, stride_size);
+}
+
+/* Flush a range of kernel pages */
+void flush_tlb_kernel_range(unsigned long start,
+	unsigned long end)
+{
+	__flush_tlb_range_up(NULL, start, end - start, PAGE_SIZE);
+}
+
+void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
+{
+	__flush_tlb_range_up(NULL, 0, FLUSH_TLB_MAX_SIZE, PAGE_SIZE);
+}
+
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
+			unsigned long end)
+{
+	__flush_tlb_range_up(vma->vm_mm, start, end - start, PMD_SIZE);
+}
+#endif
+
+#endif
+
+void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
+{
+	local_flush_tlb_range_asid(start, end - start, PAGE_SIZE,
+				   FLUSH_TLB_NO_ASID);
+}
+
 bool arch_tlbbatch_should_defer(struct mm_struct *mm)
 {
 	return true;
@@ -228,9 +273,3 @@ void arch_flush_tlb_batched_pending(struct mm_struct *mm)
 {
 	flush_tlb_mm(mm);
 }
-
-void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
-{
-	__flush_tlb_range(&batch->cpumask, FLUSH_TLB_NO_ASID, 0,
-			  FLUSH_TLB_MAX_SIZE, PAGE_SIZE);
-}
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
