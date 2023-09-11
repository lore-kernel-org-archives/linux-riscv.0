Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F5AEE7FF4
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 13:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xvPssDdJukon7hD4Uae+pM2D8Ejlkd5TTqQVuQK+sUw=; b=iO1C0cPhVtR/C4
	MT0/RFeRdCaWPRJ65klFsmFWO9u2JeSWfeLiu3N5drofkOj5F07kcWTJ5v+ilADCHdnRjUSXuyT0Q
	fJa5UpthQag1GoLeUTwVbK+8a4NYAv13ZEsxLPSKt/MUyNgTF62kmhZDafGnNdqadtWIyveVKMB+T
	GbGWSTBRIpm2X8OpYWFOgz0SmD3buScTJkVVssPrjKyPtIXJm+pPGu0kZ8MQ/rQJb5NR/s2nM5T0o
	zcqn/R8laYgtMefQs00vM3yuWWPCYQthhha0fQehZwx43tDdVYwLjkJnfYrxxHUVHIiNC7kSgWO2M
	mig1PZ5XzHkKUm7KDf9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfglO-000aJa-2q;
	Mon, 11 Sep 2023 13:15:38 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfglK-000aHg-2Z
	for linux-riscv@lists.infradead.org;
	Mon, 11 Sep 2023 13:15:36 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-401ec23be82so49514615e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 Sep 2023 06:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694438131; x=1695042931; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqYb5Vu8dCDUBKbfeLnWwY3UtdJspJqfkbvYUWs56pc=;
        b=oNy6E7JNbFQAvckDcPsWjHdFuxpFLCKGRNidZLC+j2oq1E8w3QxOtP8gzkdQY9bYsx
         cHeKIoMsidVnFtX7x8bKuWUxqmSfLNGui4GgrYJxsbEBc1LC9t6RcakSM8u2x1lx3Cwo
         iTnYnMhXduTrewl/rSjRdDS4hGF4wo8MITFdmiLmZM1RQJBOMul2CCyh0sIsb1EFQXa3
         aEX0ll1cPiD5s5MBuR5G9z4wVOdR913sJDCwXYYLsNWPyL5QD5H6gg7ZV+71MWZ2r+q0
         s272XxZXyGzDMKi2tAh9rGATvP8+p2law1PsQ4YB37jKzW4IB7+K/yaE2mvJ2USOG0/D
         PA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694438131; x=1695042931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqYb5Vu8dCDUBKbfeLnWwY3UtdJspJqfkbvYUWs56pc=;
        b=bapckxuxgdW3vzWrXkyy46QalRg5tM0AowyPGSymEa51FevGOadZy3UhGlhg5lyECA
         HiU2oJE89Cmvt5cgKs+D7IgEMHs7UI8oCQBA9v653jrlyGChooosX+PHhxm4W7yr134P
         ssGKNcvYbq1XkmT/BGQFimQGc2adVUTWzs+M58c6S9aup8ruzKib11kdBXpqVY1eMp4J
         SH26LWAnrQp+c2MMrX1el2nHw4vfVf7D7edicTStRhewMxtu/CtRDMOsQsU7oUClSEnE
         XOG4dEQnOHdsF02kOMDBfcgnny7CePhBsQUN/guNerviZBD8fpw/9QkBeUNb/TEoJUOt
         CJXA==
X-Gm-Message-State: AOJu0YxezTdW0VvjTS4vj682W5XFQunEgMek06m4wBIQ3F2RrJTlSyXK
	fQZX24ihZhs7zlR4aH8KIQr4Kg==
X-Google-Smtp-Source: AGHT+IGSM7mk4P/JNlSdasDtYzZnQXEd3SbuOn7pwwi1IoVXpt21uzh3Nx2y9SMVd5/QCh9kvlN/TA==
X-Received: by 2002:a05:600c:2301:b0:400:ce4f:f184 with SMTP id 1-20020a05600c230100b00400ce4ff184mr8883368wmo.41.1694438130933;
        Mon, 11 Sep 2023 06:15:30 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id m31-20020a05600c3b1f00b00402f7e473b7sm9878654wms.15.2023.09.11.06.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 06:15:30 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>,
	Lad Prabhakar <prabhakar.csengg@gmail.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 3/4] riscv: Make __flush_tlb_range() loop over pte instead of flushing the whole tlb
Date: Mon, 11 Sep 2023 15:12:23 +0200
Message-Id: <20230911131224.61924-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230911131224.61924-1-alexghiti@rivosinc.com>
References: <20230911131224.61924-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_061534_831472_3F8711AC 
X-CRM114-Status: GOOD (  23.16  )
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
---
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
index 5bda6d4fed90..2c1136d73411 100644
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
+	u16 nr_ptes_in_range = DIV_ROUND_UP(size, stride);
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
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
