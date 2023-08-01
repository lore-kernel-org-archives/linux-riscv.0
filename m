Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7272EC001DF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 08:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uMMiHsKx1FR6m2z/q26uGiksckSBEEUqsgU9VC6SrHo=; b=XZHuxQNcNjveyk
	sB42gB2uBfpUBXyDyEKb7V3rwjCiAdAqoUgYsadorExFyC1oN3Mclw/uMpD0mBk5MpzFQiZQQt7ON
	8xUzUlLOK1m+B5S3SMaywYjN3bw+Q0wy8lfTzQqDZ9mZFVMG1Y9lUwHQO0OSsFETHMoCENxGoxk1p
	VK3MTV1VswBXG968MIjkXXKZU8pSbPQ/DdjOt3QInMVeAZ2BaHPgLM33Lv+SDsbndN1O8AVjEvibz
	sIGcf6+afU2Jv66Td/ELvLd5yU8/+YyJRI+wUG0aQ16HXkEfgq1SYktuNRuUoX3FYET0cRNJ3A/cm
	+zLMaDdsgRqonCzY/65A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQlBq-000hbB-37;
	Tue, 01 Aug 2023 08:57:14 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQlBn-000hZe-2c
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 08:57:13 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b9f0b7af65so22830461fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Aug 2023 01:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690880229; x=1691485029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8YprRlaP4W+8yj964kuFlSBdOjyOpODn6Kzt6jcAnQ=;
        b=qdlxfR2ULJ112i9MarbF8BcXMSwKtF7ipH3Z9ZNh4A1UrVCNFEubO08E+XypP1km40
         BIOw6IYnj6AuKJ5Ew5K2k8wdyrUOkb71v8AegiQ+nuqs2nVtNOMNaQypq6vvnPowPpkZ
         7Qg3miGQ6+x4e6LXFDodFyE5gWLzjaQHx8E1Z1Yv5J1iMlnH4lG2/0XWFrSIHswKYzyt
         efFuQOiJLROe9KB2N3hD8VR/lvvtDaF5plKwpbZAgbSmjQSTOUgsKYuP07QH5gjYtlT7
         vTiVHiET4IzE53WDZJ0ZMMONmiUAraIM9BVFchpD8Pilr9UwNzxd6uikBobHNhH/wO8t
         h/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690880229; x=1691485029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8YprRlaP4W+8yj964kuFlSBdOjyOpODn6Kzt6jcAnQ=;
        b=agmxI2aK5gDVbrmx4S1U40wfAgwwv3nBap+KGaHSqtGsD/zyqJdGQqQE0axek67zP/
         SeePCNSl35dvFuVAFWkfzxTUMtaGrOCZ6i152KVoCV7sK8ndfOjfi27QyFQagq2fsYD2
         ppRTpxJh9rNsb5JzhHUA5Dc9jWi4kOce8mDj9SbSHUb8mJaozggrB8N3HiQ4ixhsrC2U
         XNzUwOX1ZEfML0WjKBLtX+YuCpvehom0FEot/aCWUXcZbsc29nkBeXjsUwKc1ifc3VDS
         LBCxyfv8TzMHvBWfCC2GY+kY0eOwfOviXXwC/H62pJberQlfpZyWBBjmOectCjlKh4VR
         qpnA==
X-Gm-Message-State: ABy/qLaRHuvMCxoB5hrYxgDacat7Gq7sa9+MUssq4e13H60T07cpfHcU
	CdWVsQ1BhLQdRWGTk0OfhwQJtQ==
X-Google-Smtp-Source: APBJJlGXXGbZRFGts7ZT7QQ6Cb6DdfW/OsBud3Kp4VAMMf97raeOffyeVJ99hrx1DJ2As1NVk0KZbQ==
X-Received: by 2002:a2e:9054:0:b0:2b6:e625:ba55 with SMTP id n20-20020a2e9054000000b002b6e625ba55mr2048866ljg.41.1690880229621;
        Tue, 01 Aug 2023 01:57:09 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id l27-20020a05600c1d1b00b003fe1b3e0852sm2908793wms.0.2023.08.01.01.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 01:57:09 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3 3/4] riscv: Make __flush_tlb_range() loop over pte instead of flushing the whole tlb
Date: Tue,  1 Aug 2023 10:54:01 +0200
Message-Id: <20230801085402.1168351-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230801085402.1168351-1-alexghiti@rivosinc.com>
References: <20230801085402.1168351-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_015711_856955_27FFB531 
X-CRM114-Status: GOOD (  17.61  )
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
 arch/riscv/mm/tlbflush.c | 48 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index d883df0dee4a..0c955c474f3a 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -7,6 +7,9 @@
 #include <asm/sbi.h>
 #include <asm/mmu_context.h>
 
+#define FLUSH_TLB_MAX_SIZE	((unsigned long)-1)
+#define FLUSH_TLB_NO_ASID	((unsigned long)-1)
+
 static inline void local_flush_tlb_all_asid(unsigned long asid)
 {
 	__asm__ __volatile__ ("sfence.vma x0, %0"
@@ -24,13 +27,48 @@ static inline void local_flush_tlb_page_asid(unsigned long addr,
 			: "memory");
 }
 
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
+{
+	u16 nr_ptes_in_range = DIV_ROUND_UP(size, stride);
+	int i;
+
+	if (nr_ptes_in_range > tlb_flush_all_threshold) {
+		if (asid != FLUSH_TLB_NO_ASID)
+			local_flush_tlb_all_asid(asid);
+		else
+			local_flush_tlb_all();
+		return;
+	}
+
+	for (i = 0; i < nr_ptes_in_range; ++i) {
+		if (asid != FLUSH_TLB_NO_ASID)
+			local_flush_tlb_page_asid(start, asid);
+		else
+			local_flush_tlb_page(start);
+		start += stride;
+	}
+}
+
 static inline void local_flush_tlb_range(unsigned long start,
 		unsigned long size, unsigned long stride)
 {
 	if (size <= stride)
 		local_flush_tlb_page(start);
-	else
+	else if (size == FLUSH_TLB_MAX_SIZE)
 		local_flush_tlb_all();
+	else
+		local_flush_tlb_range_threshold_asid(start, size, stride,
+						     FLUSH_TLB_NO_ASID);
+
 }
 
 static inline void local_flush_tlb_range_asid(unsigned long start,
@@ -38,8 +76,10 @@ static inline void local_flush_tlb_range_asid(unsigned long start,
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
@@ -52,7 +92,7 @@ void flush_tlb_all(void)
 	if (riscv_use_ipi_for_rfence())
 		on_each_cpu(__ipi_flush_tlb_all, NULL, 1);
 	else
-		sbi_remote_sfence_vma(NULL, 0, -1);
+		sbi_remote_sfence_vma(NULL, 0, FLUSH_TLB_MAX_SIZE);
 }
 
 struct flush_tlb_range_data {
@@ -130,7 +170,7 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
 
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
