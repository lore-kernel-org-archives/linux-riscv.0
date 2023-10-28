Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4D1C001B5
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Oct 2023 23:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L4tN0TN3ID15AVAC7LlQmkCIlBCKKFoH9WygVxgM1Kk=; b=Dgp3QoNZ3T0Yzl
	qJVcC7ZiwK41auzyKhZ4WV2FGTezVgOFQuCgiSPMHbKSvmS6WOXihUKSC/YyuG6VBgp+hVQiN0uwx
	PIVxyIWo5hgGADkCLsPrCxzBA01Ti+TBKCmmzC2O1d0asHfuWKnYRkjRSIqpmNnwFLWEZNfQ16AiE
	9do6LHW/nxPDxzrZveB3XJ3ghkfF6ORMdCQDAsadU7mv+7Luy2yzDHYqTqI7zWQYPjymCK9jl3Y63
	X8wmiAE7bKei+cA4VgBf4TxkDgIFEDPAO86BeMmLqSTLKyMNHe2Pa4mr/MliLS9FhiJa6fexD5z/f
	UOQhUIROUbyqxBWgGKjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwsV6-000vVm-0d;
	Sat, 28 Oct 2023 23:13:52 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwsV0-000vSX-37
	for linux-riscv@lists.infradead.org;
	Sat, 28 Oct 2023 23:13:48 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1cc1e1e74beso17386075ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 28 Oct 2023 16:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698534826; x=1699139626; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KwX4pskItPHUM4maFDdS5O3Er1CtrhdQQ55njchpgeM=;
        b=U1vnSzAigMqB1xWWHECE7gV6jUF2OCklA/OFdTzKNGkvBGKbiT4H5yuTqNE35j4dJV
         sEBLNA8C7ZvBI2+iXeJ4v1skOKHOxjj3fzmU9gREc7GQr94h9uqO8LYuyfmTq+/asO6S
         uBIB3g/GjiSLcANTdsn36jX0v4vEW9gWJDq8lZN7Crsp3T8mp3OvEfuARC34IMLuVgPx
         /X9SB20qrtFn+Ty1ie8wh71IbLI8Y3cYtVI/KE1qBsBilnS/ro9klBnVkV3zTDIbrL4b
         3nxjFjK/KverzEAdhlcBd+AxS0f8bs2nhH8kYy1u46lVmrhpHKwC/ERFw9S3qFLPfa/4
         gryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698534826; x=1699139626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KwX4pskItPHUM4maFDdS5O3Er1CtrhdQQ55njchpgeM=;
        b=UrIPS8zwYrRj5ihzoljRBwjJWIeaLJv5F5iHU/TZglZMuskUPHinNT5e3CgQw3t/eg
         QqY7v/FXXoAzLK4nWllNqkdbyOAeqWJiet5nlL/OOLElb1LQWyiudi0Ai0G2WpeVlQNC
         POE07Q4D4YaQkUgLexBSv6UE+HF4MdM3/HXAy+AdNH3y8w7Pp25iipOizMD0QXXAPznf
         htfz3UGTX+D/dp+39+Ivconq/A5kf2eXKivt6bsMN9MP4dJsSK8cA3mkAdWO2CCBHWpr
         baxRTTn9uyg3x7SvR1PTayW8pas+77VS/YpYdUD9mUW02Tp9vdzS8LJOcnB3SKuWkkQo
         bXpg==
X-Gm-Message-State: AOJu0YxLtA9IvFYk6fh9dFslvRCOKLaMOYwi4t13a1QENN7VMjq8q6Ac
	Z0SR3IlLNs7MpPjC8x/FvmRRFs2J3CApsWrRnpw=
X-Google-Smtp-Source: AGHT+IEP1RLLbzkV6SDyhDMWypu6mUWTgp+BfL6QnGjrDAvgGu3DpZZT/BgKJhnh9HCZ+gZpZ5q05A==
X-Received: by 2002:a17:902:8c85:b0:1c9:c0fa:dfb7 with SMTP id t5-20020a1709028c8500b001c9c0fadfb7mr6367498plo.57.1698534825930;
        Sat, 28 Oct 2023 16:13:45 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u17-20020a17090341d100b001b8622c1ad2sm3679345ple.130.2023.10.28.16.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 16:13:45 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 03/11] riscv: Make __flush_tlb_range() loop over pte instead of flushing the whole tlb
Date: Sat, 28 Oct 2023 16:12:01 -0700
Message-ID: <20231028231339.3116618-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231028231339.3116618-1-samuel.holland@sifive.com>
References: <20231028231339.3116618-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_161347_019263_65DA4560 
X-CRM114-Status: GOOD (  22.02  )
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

From: Alexandre Ghiti <alexghiti@rivosinc.com>

Currently, when the range to flush covers more than one page (a 4K page or
a hugepage), __flush_tlb_range() flushes the whole tlb. Flushing the whole
tlb comes with a greater cost than flushing a single entry so we should
flush single entries up to a certain threshold so that:
threshold * cost of flushing a single entry < cost of flushing the whole
tlb.

Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # On RZ/Five SMARC
[Samuel: Fixed type of nr_ptes_in_range]
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Rebase on Alexandre's "riscv: tlb flush improvements" series v5

 arch/riscv/include/asm/sbi.h      |   3 -
 arch/riscv/include/asm/tlbflush.h |   3 +
 arch/riscv/kernel/sbi.c           |  32 +++------
 arch/riscv/mm/tlbflush.c          | 115 +++++++++++++++---------------
 4 files changed, 72 insertions(+), 81 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 5b4a1bf5f439..b79d0228144f 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -273,9 +273,6 @@ void sbi_set_timer(uint64_t stime_value);
 void sbi_shutdown(void);
 void sbi_send_ipi(unsigned int cpu);
 int sbi_remote_fence_i(const struct cpumask *cpu_mask);
-int sbi_remote_sfence_vma(const struct cpumask *cpu_mask,
-			   unsigned long start,
-			   unsigned long size);
 
 int sbi_remote_sfence_vma_asid(const struct cpumask *cpu_mask,
 				unsigned long start,
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index f5c4fb0ae642..170a49c531c6 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -11,6 +11,9 @@
 #include <asm/smp.h>
 #include <asm/errata_list.h>
 
+#define FLUSH_TLB_MAX_SIZE      ((unsigned long)-1)
+#define FLUSH_TLB_NO_ASID       ((unsigned long)-1)
+
 #ifdef CONFIG_MMU
 extern unsigned long asid_mask;
 
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index c672c8ba9a2a..5a62ed1da453 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -11,6 +11,7 @@
 #include <linux/reboot.h>
 #include <asm/sbi.h>
 #include <asm/smp.h>
+#include <asm/tlbflush.h>
 
 /* default SBI version is 0.1 */
 unsigned long sbi_spec_version __ro_after_init = SBI_SPEC_VERSION_DEFAULT;
@@ -376,32 +377,15 @@ int sbi_remote_fence_i(const struct cpumask *cpu_mask)
 }
 EXPORT_SYMBOL(sbi_remote_fence_i);
 
-/**
- * sbi_remote_sfence_vma() - Execute SFENCE.VMA instructions on given remote
- *			     harts for the specified virtual address range.
- * @cpu_mask: A cpu mask containing all the target harts.
- * @start: Start of the virtual address
- * @size: Total size of the virtual address range.
- *
- * Return: 0 on success, appropriate linux error code otherwise.
- */
-int sbi_remote_sfence_vma(const struct cpumask *cpu_mask,
-			   unsigned long start,
-			   unsigned long size)
-{
-	return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA,
-			    cpu_mask, start, size, 0, 0);
-}
-EXPORT_SYMBOL(sbi_remote_sfence_vma);
-
 /**
  * sbi_remote_sfence_vma_asid() - Execute SFENCE.VMA instructions on given
- * remote harts for a virtual address range belonging to a specific ASID.
+ * remote harts for a virtual address range belonging to a specific ASID or not.
  *
  * @cpu_mask: A cpu mask containing all the target harts.
  * @start: Start of the virtual address
  * @size: Total size of the virtual address range.
- * @asid: The value of address space identifier (ASID).
+ * @asid: The value of address space identifier (ASID), or FLUSH_TLB_NO_ASID
+ * for flushing all address spaces.
  *
  * Return: 0 on success, appropriate linux error code otherwise.
  */
@@ -410,8 +394,12 @@ int sbi_remote_sfence_vma_asid(const struct cpumask *cpu_mask,
 				unsigned long size,
 				unsigned long asid)
 {
-	return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID,
-			    cpu_mask, start, size, asid, 0);
+	if (asid == FLUSH_TLB_NO_ASID)
+		return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA,
+				    cpu_mask, start, size, 0, 0);
+	else
+		return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID,
+				    cpu_mask, start, size, asid, 0);
 }
 EXPORT_SYMBOL(sbi_remote_sfence_vma_asid);
 
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index b6d712a82306..e46fefc70927 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -9,28 +9,50 @@
 
 static inline void local_flush_tlb_all_asid(unsigned long asid)
 {
-	__asm__ __volatile__ ("sfence.vma x0, %0"
-			:
-			: "r" (asid)
-			: "memory");
+	if (asid != FLUSH_TLB_NO_ASID)
+		__asm__ __volatile__ ("sfence.vma x0, %0"
+				:
+				: "r" (asid)
+				: "memory");
+	else
+		local_flush_tlb_all();
 }
 
 static inline void local_flush_tlb_page_asid(unsigned long addr,
 		unsigned long asid)
 {
-	__asm__ __volatile__ ("sfence.vma %0, %1"
-			:
-			: "r" (addr), "r" (asid)
-			: "memory");
+	if (asid != FLUSH_TLB_NO_ASID)
+		__asm__ __volatile__ ("sfence.vma %0, %1"
+				:
+				: "r" (addr), "r" (asid)
+				: "memory");
+	else
+		local_flush_tlb_page(addr);
 }
 
-static inline void local_flush_tlb_range(unsigned long start,
-		unsigned long size, unsigned long stride)
+/*
+ * Flush entire TLB if number of entries to be flushed is greater
+ * than the threshold below.
+ */
+static unsigned long tlb_flush_all_threshold __read_mostly = 64;
+
+static void local_flush_tlb_range_threshold_asid(unsigned long start,
+						 unsigned long size,
+						 unsigned long stride,
+						 unsigned long asid)
 {
-	if (size <= stride)
-		local_flush_tlb_page(start);
-	else
-		local_flush_tlb_all();
+	unsigned long nr_ptes_in_range = DIV_ROUND_UP(size, stride);
+	int i;
+
+	if (nr_ptes_in_range > tlb_flush_all_threshold) {
+		local_flush_tlb_all_asid(asid);
+		return;
+	}
+
+	for (i = 0; i < nr_ptes_in_range; ++i) {
+		local_flush_tlb_page_asid(start, asid);
+		start += stride;
+	}
 }
 
 static inline void local_flush_tlb_range_asid(unsigned long start,
@@ -38,8 +60,10 @@ static inline void local_flush_tlb_range_asid(unsigned long start,
 {
 	if (size <= stride)
 		local_flush_tlb_page_asid(start, asid);
-	else
+	else if (size == FLUSH_TLB_MAX_SIZE)
 		local_flush_tlb_all_asid(asid);
+	else
+		local_flush_tlb_range_threshold_asid(start, size, stride, asid);
 }
 
 static void __ipi_flush_tlb_all(void *info)
@@ -52,7 +76,7 @@ void flush_tlb_all(void)
 	if (riscv_use_ipi_for_rfence())
 		on_each_cpu(__ipi_flush_tlb_all, NULL, 1);
 	else
-		sbi_remote_sfence_vma(NULL, 0, -1);
+		sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE, FLUSH_TLB_NO_ASID);
 }
 
 struct flush_tlb_range_data {
@@ -69,18 +93,12 @@ static void __ipi_flush_tlb_range_asid(void *info)
 	local_flush_tlb_range_asid(d->start, d->size, d->stride, d->asid);
 }
 
-static void __ipi_flush_tlb_range(void *info)
-{
-	struct flush_tlb_range_data *d = info;
-
-	local_flush_tlb_range(d->start, d->size, d->stride);
-}
-
 static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
 			      unsigned long size, unsigned long stride)
 {
 	struct flush_tlb_range_data ftd;
 	struct cpumask *cmask = mm_cpumask(mm);
+	unsigned long asid = FLUSH_TLB_NO_ASID;
 	unsigned int cpuid;
 	bool broadcast;
 
@@ -90,39 +108,24 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
 	cpuid = get_cpu();
 	/* check if the tlbflush needs to be sent to other CPUs */
 	broadcast = cpumask_any_but(cmask, cpuid) < nr_cpu_ids;
-	if (static_branch_unlikely(&use_asid_allocator)) {
-		unsigned long asid = atomic_long_read(&mm->context.id) & asid_mask;
-
-		if (broadcast) {
-			if (riscv_use_ipi_for_rfence()) {
-				ftd.asid = asid;
-				ftd.start = start;
-				ftd.size = size;
-				ftd.stride = stride;
-				on_each_cpu_mask(cmask,
-						 __ipi_flush_tlb_range_asid,
-						 &ftd, 1);
-			} else
-				sbi_remote_sfence_vma_asid(cmask,
-							   start, size, asid);
-		} else {
-			local_flush_tlb_range_asid(start, size, stride, asid);
-		}
+
+	if (static_branch_unlikely(&use_asid_allocator))
+		asid = atomic_long_read(&mm->context.id) & asid_mask;
+
+	if (broadcast) {
+		if (riscv_use_ipi_for_rfence()) {
+			ftd.asid = asid;
+			ftd.start = start;
+			ftd.size = size;
+			ftd.stride = stride;
+			on_each_cpu_mask(cmask,
+					 __ipi_flush_tlb_range_asid,
+					 &ftd, 1);
+		} else
+			sbi_remote_sfence_vma_asid(cmask,
+						   start, size, asid);
 	} else {
-		if (broadcast) {
-			if (riscv_use_ipi_for_rfence()) {
-				ftd.asid = 0;
-				ftd.start = start;
-				ftd.size = size;
-				ftd.stride = stride;
-				on_each_cpu_mask(cmask,
-						 __ipi_flush_tlb_range,
-						 &ftd, 1);
-			} else
-				sbi_remote_sfence_vma(cmask, start, size);
-		} else {
-			local_flush_tlb_range(start, size, stride);
-		}
+		local_flush_tlb_range_asid(start, size, stride, asid);
 	}
 
 	put_cpu();
@@ -130,7 +133,7 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
 
 void flush_tlb_mm(struct mm_struct *mm)
 {
-	__flush_tlb_range(mm, 0, -1, PAGE_SIZE);
+	__flush_tlb_range(mm, 0, FLUSH_TLB_MAX_SIZE, PAGE_SIZE);
 }
 
 void flush_tlb_mm_range(struct mm_struct *mm,
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
