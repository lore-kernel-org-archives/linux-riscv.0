Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BBFC3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 19:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q3UNiEOVmx8Spnc33TzhMbVyAi2/ToOCaki/croznoQ=; b=ELhT+cPFcm9mTE
	KqfxIdUzIgIaqgH/kIzpsuwNgT85Qbo2+EP0hWqoGyjdmwzeauab0tsiiKE6NYc9HRjOy1PZqeWcZ
	mmtd3Dz9jvxMld3oO686JK3yeVt6I325g4WgGE648r9pa5JaBsfw8A7CaWmx05oXJvO5qPfSsqsPc
	g9VbgnRogCInke63s7+plwkhYEQvgsli0LUnBWX6SWWvaDP3ECBOaMhzEVVhF+BITumT0babAmaQx
	hSXvrDB3+se96vE/RekM1r41Sb+Pb87KEbSZvoRFOT1mVnK7UEXbW+hxEbZxGMP87sdwhbk9PGLzv
	mnlHB1Jm8zt3VwGCdZSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMvQi-00644p-2P;
	Mon, 08 Jan 2024 19:37:00 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMvQf-00643P-13
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 19:36:59 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-33687627ad0so2084886f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jan 2024 11:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704742615; x=1705347415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0A3ryeyMJZpg1Hmx8jjfMszJRDq8kxjkrAWUket3WHU=;
        b=ZIPZ+u+NGwtfasV+mflAzbz1S2lJ8MU1f+7U0D8JtxQhgzl9SaqT0slV/6UAelixUy
         mNT1x2ADGFQmv06G1Ayzj9qRSgLjP5tRin0JrftaajyfmbcRD1PahCaNodqqUIk1bO0b
         C27Tls7aTFjNB/sVAS7ohFMrTGaTnvWC7V7Wfex3Nm1bQ3Ou+YLZN+48cqhAKXwDJh2I
         bILIPf3NHmncgQ8hmxCNo2bMWy516TR6E1Fk23yCRktk/1v+Y9Bz4VqEmLm35ugjO9qb
         dNk3umFKv7keZh97e60OvD6p0EI9bF0/veTTdchTPPabFa57q0Lfp0z/i8AztE5phTYS
         N/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704742615; x=1705347415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0A3ryeyMJZpg1Hmx8jjfMszJRDq8kxjkrAWUket3WHU=;
        b=g88LMPlun3wUqEYcj97fufydKVn3akTjOeNGUeoDmlqSM+GvTmRtuvdAhER+ZVHynv
         2o2DWS8WEn1uoMnniCEujvauU0I3OfuiUgI7UtyR4cK6YL/fGT/pDlglCmrTL1D9t8pG
         3v6myv0iInz2HrF/5MWqkjFcDZImLJoaNoX77g/WP8U+Jzt+DabJTW75/lnd0YAR04Bg
         hDBFm8KbKXfcL11OGJpknPNua0Cum0ab2SjUHmtCYNWgm8zzMIkEuatlwfmT3/YRf4t1
         aS6Rfknq9baJ8iTCo8hqqdBHIlrMcH2cW91FvFPDBtuHGKsPhPw1pj5IdAKbtAbOA/sO
         qEGw==
X-Gm-Message-State: AOJu0YzmT2XYRetgz/Yx6LbAdiNP7ia9Jh9gh3MzeuuiVkov1ZpkYHNG
	qohFKMMgUYJP4CJfg9VhODChVCedEtTtvg==
X-Google-Smtp-Source: AGHT+IFeaTPgStGBhJQLs2Nw3aNSwPRuL9Q2GuNFmE0jdNUvpPkz+XlothoadPGhyALtQp3/Om+r1w==
X-Received: by 2002:adf:cc85:0:b0:336:7bd3:9520 with SMTP id p5-20020adfcc85000000b003367bd39520mr2487583wrj.43.1704742614984;
        Mon, 08 Jan 2024 11:36:54 -0800 (PST)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id g18-20020adff3d2000000b00336aac53e75sm412040wrp.97.2024.01.08.11.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 11:36:54 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH v2] riscv: Add support for BATCHED_UNMAP_TLB_FLUSH
Date: Mon,  8 Jan 2024 20:36:40 +0100
Message-Id: <20240108193640.344929-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_113657_366948_13C42E92 
X-CRM114-Status: GOOD (  23.07  )
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

Allow to defer the flushing of the TLB when unmapping pages, which allows
to reduce the numbers of IPI and the number of sfence.vma.

The ubenchmarch used in commit 43b3dfdd0455 ("arm64: support
batched/deferred tlb shootdown during page reclamation/migration") that
was multithreaded to force the usage of IPI shows good performance
improvement on all platforms:

* Unmatched: ~34%
* TH1520   : ~78%
* Qemu     : ~81%

In addition, perf on qemu reports an important decrease in time spent
dealing with IPIs:

Before:  68.17%  main     [kernel.kallsyms]            [k] __sbi_rfence_v02_call
After :   8.64%  main     [kernel.kallsyms]            [k] __sbi_rfence_v02_call

* Benchmark:

int stick_this_thread_to_core(int core_id) {
        int num_cores = sysconf(_SC_NPROCESSORS_ONLN);
        if (core_id < 0 || core_id >= num_cores)
           return EINVAL;

        cpu_set_t cpuset;
        CPU_ZERO(&cpuset);
        CPU_SET(core_id, &cpuset);

        pthread_t current_thread = pthread_self();
        return pthread_setaffinity_np(current_thread,
sizeof(cpu_set_t), &cpuset);
}

static void *fn_thread (void *p_data)
{
        int ret;
        pthread_t thread;

        stick_this_thread_to_core((int)p_data);

        while (1) {
                sleep(1);
        }

        return NULL;
}

int main()
{
        volatile unsigned char *p = mmap(NULL, SIZE, PROT_READ | PROT_WRITE,
                                         MAP_SHARED | MAP_ANONYMOUS, -1, 0);
        pthread_t threads[4];
        int ret;

        for (int i = 0; i < 4; ++i) {
                ret = pthread_create(&threads[i], NULL, fn_thread, (void *)i);
                if (ret)
                {
                        printf("%s", strerror (ret));
                }
        }

        memset(p, 0x88, SIZE);

        for (int k = 0; k < 10000; k++) {
                /* swap in */
                for (int i = 0; i < SIZE; i += 4096) {
                        (void)p[i];
                }

                /* swap out */
                madvise(p, SIZE, MADV_PAGEOUT);
        }

        for (int i = 0; i < 4; i++)
        {
                pthread_cancel(threads[i]);
        }

        for (int i = 0; i < 4; i++)
        {
                pthread_join(threads[i], NULL);
        }

        return 0;
}

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
Tested-by: Jisheng Zhang <jszhang@kernel.org> # Tested on TH1520
---

Changes in v2:
- Remove #ifdef CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH as suggested by
  Samuel
- Update Documentation as pointed by Jisheng
- Update commit log with Unmatched and TH1520 results (Jisheng) with new
  ubenchmarks

 .../features/vm/TLB/arch-support.txt          |  2 +-
 arch/riscv/Kconfig                            |  1 +
 arch/riscv/include/asm/tlbbatch.h             | 15 ++++
 arch/riscv/include/asm/tlbflush.h             |  8 +++
 arch/riscv/mm/tlbflush.c                      | 69 +++++++++++++------
 5 files changed, 74 insertions(+), 21 deletions(-)
 create mode 100644 arch/riscv/include/asm/tlbbatch.h

diff --git a/Documentation/features/vm/TLB/arch-support.txt b/Documentation/features/vm/TLB/arch-support.txt
index 8fd22073a847..d222bd3ee749 100644
--- a/Documentation/features/vm/TLB/arch-support.txt
+++ b/Documentation/features/vm/TLB/arch-support.txt
@@ -20,7 +20,7 @@
     |    openrisc: |  ..  |
     |      parisc: | TODO |
     |     powerpc: | TODO |
-    |       riscv: | TODO |
+    |       riscv: |  ok  |
     |        s390: | TODO |
     |          sh: | TODO |
     |       sparc: | TODO |
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 060c2a4fa639..49a94a4f2f58 100644
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
index 8f3418c5f172..9c8a67b1285e 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -46,6 +46,14 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end);
 void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 			unsigned long end);
 #endif
+
+bool arch_tlbbatch_should_defer(struct mm_struct *mm);
+void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
+			       struct mm_struct *mm,
+			       unsigned long uaddr);
+void arch_flush_tlb_batched_pending(struct mm_struct *mm);
+void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);
+
 #else /* CONFIG_SMP && CONFIG_MMU */
 
 #define flush_tlb_all() local_flush_tlb_all()
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index e6659d7368b3..f0190f5fdd05 100644
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
@@ -185,18 +188,44 @@ void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
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
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
