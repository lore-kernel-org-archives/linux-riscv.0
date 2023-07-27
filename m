Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF46C001DC
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 19:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aWSu79iIBQkPb8A6nda9tKiJ9PU/kAT1Yo0876etKrQ=; b=op856s+9W0qQ9x
	tyHZ/il4/6RhzRvLUpt9C+WhQaagJoW1Ukpt5t1OyxxkwBj0IMoiNtmmP1MnpliYoS5tUqm5sd8Qc
	HZOFHVCzQ+xvkpt/wGaRQef8NnFXM8HtM3rVINLc/AoKZ3H/VklDOfoz97N8oUUzwdOPih3njZG7I
	dhTl9QwrxBXLbxCq/wxAU/CvK/F98hlBYw0kAloQlH2c1U/i0qGNZQdZ8JH5bUdQN9IxhJsCgWnzN
	vugjS+PoGrZM4bv82TQcSre2ny3iaTUPt6Wh3DVbzV58AWHEY7Rn5jIX1G/flvoutPf3B8Jcx7T6M
	FBZBqR7v7Y5IM31QDCig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP6Db-000FKh-2K;
	Thu, 27 Jul 2023 19:00:11 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP6DZ-000FHK-0r
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 19:00:10 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b9b9f0387dso20697391fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jul 2023 12:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690484405; x=1691089205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNz5ULfyNJeCjPsvwCv5L4clxVFquhVEWOvSxelKP+w=;
        b=GSLEhl1R8oaK89GQOF+Pv24vQFwey5dkoAOjZEenIXfi01TU4C1AFY7vwTgG+IbUlF
         Bt6mSf5r0S5qnDSbj7fbdtGv7jJ9iOIgyrK6WLr9GeK+jc2ceGyLFhK5wvI+lwtOGyns
         czustvBmWlA/JC7ECm2Z0wVylVcw7vbMO0XeSmF1L7ausPlrs8/XAS6Xs65/CWeQ8Wfp
         tsRKYYdO/ryRUCT9y2Jg2iATmCj4AqgpipC57hi+IHiQ5cyV+qpL+Zjknvlp0yeTBYnd
         SQsKP9CGJ03Unrmv/tUdQbc4zK6ruo/AZl67eW8Md9grR2PmdteBl/N9wtoGp55xr42V
         jXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690484405; x=1691089205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RNz5ULfyNJeCjPsvwCv5L4clxVFquhVEWOvSxelKP+w=;
        b=k1tU2ZO5DG7JWOVnULekzTSpQxyxc7unUbuA+cLKacnlSXn2F+XfJ7kyLC+s1EtKGC
         fisinvG1F7Ojb0iRLQImbQeDJscbDe8q6e+h9g7jPQQam46N2LA6Qgz+L/WtdLNgEPaM
         9TzDxZ2T6+q6/3T2OPMXJ09WZsJH0tLqWTm4XBK+SSmkp8Hg/Ih+PFru4jVcywpRWzP+
         /kNTUNERJgOnkI/UCYL77mBR5YzLsb1VmhrEf9BrIgP6krADFZHV9j4aHbupkFu8uX3R
         yiuZsAd1cUticmNg7vuGgGkm3Hkf4iRSIcHcrot9ZPYQFAvtftgg+61HZjKwvFOtDmX8
         uuXQ==
X-Gm-Message-State: ABy/qLbGQREF8tO0QUKG817VJYuXqXPXxAyQC4OtRLhzUtoBTlpt29DY
	xiEQyrcszJx0L/AAgx0uBngoJg==
X-Google-Smtp-Source: APBJJlHJDmgCrOPWkDvISdqVBAhll7aGnu9u1uL1uj24Zj+LruMascb6qDrvCi38iKxywHDYgHx7iw==
X-Received: by 2002:a2e:9444:0:b0:2b6:da64:321 with SMTP id o4-20020a2e9444000000b002b6da640321mr2299474ljh.45.1690484405350;
        Thu, 27 Jul 2023 12:00:05 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id p1-20020a7bcc81000000b003fa96fe2bebsm2470792wma.41.2023.07.27.12.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 12:00:05 -0700 (PDT)
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 4/4] riscv: Improve flush_tlb_kernel_range()
Date: Thu, 27 Jul 2023 20:55:53 +0200
Message-Id: <20230727185553.980262-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727185553.980262-1-alexghiti@rivosinc.com>
References: <20230727185553.980262-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_120009_305072_5D712BB5 
X-CRM114-Status: GOOD (  17.65  )
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

This function used to simply flush the whole tlb of all harts, be more
subtile and try to only flush the range.

The problem is that we can only use PAGE_SIZE as stride since we don't know
the size of the underlying mapping and then this function will be improved
only if the size of the region to flush is < threshold * PAGE_SIZE.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/tlbflush.h | 11 +++++-----
 arch/riscv/mm/tlbflush.c          | 35 +++++++++++++++++++++++--------
 2 files changed, 32 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index f5c4fb0ae642..7426fdcd8ec5 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -37,6 +37,7 @@ void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
 void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr);
 void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		     unsigned long end);
+void flush_tlb_kernel_range(unsigned long start, unsigned long end);
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
 void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
@@ -53,15 +54,15 @@ static inline void flush_tlb_range(struct vm_area_struct *vma,
 	local_flush_tlb_all();
 }
 
-#define flush_tlb_mm(mm) flush_tlb_all()
-#define flush_tlb_mm_range(mm, start, end, page_size) flush_tlb_all()
-#endif /* !CONFIG_SMP || !CONFIG_MMU */
-
 /* Flush a range of kernel pages */
 static inline void flush_tlb_kernel_range(unsigned long start,
 	unsigned long end)
 {
-	flush_tlb_all();
+	local_flush_tlb_all();
 }
 
+#define flush_tlb_mm(mm) flush_tlb_all()
+#define flush_tlb_mm_range(mm, start, end, page_size) flush_tlb_all()
+#endif /* !CONFIG_SMP || !CONFIG_MMU */
+
 #endif /* _ASM_RISCV_TLBFLUSH_H */
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 8017d2130e27..96aeacb269d5 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -117,18 +117,27 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
 			      unsigned long size, unsigned long stride)
 {
 	struct flush_tlb_range_data ftd;
-	struct cpumask *cmask = mm_cpumask(mm);
-	unsigned int cpuid;
+	struct cpumask *cmask, full_cmask;
 	bool broadcast;
 
-	if (cpumask_empty(cmask))
-		return;
+	if (mm) {
+		unsigned int cpuid;
+
+		cmask = mm_cpumask(mm);
+		if (cpumask_empty(cmask))
+			return;
+
+		cpuid = get_cpu();
+		/* check if the tlbflush needs to be sent to other CPUs */
+		broadcast = cpumask_any_but(cmask, cpuid) < nr_cpu_ids;
+	} else {
+		cpumask_setall(&full_cmask);
+		cmask = &full_cmask;
+		broadcast = true;
+	}
 
-	cpuid = get_cpu();
-	/* check if the tlbflush needs to be sent to other CPUs */
-	broadcast = cpumask_any_but(cmask, cpuid) < nr_cpu_ids;
 	if (static_branch_unlikely(&use_asid_allocator)) {
-		unsigned long asid = atomic_long_read(&mm->context.id) & asid_mask;
+		unsigned long asid = mm ? atomic_long_read(&mm->context.id) & asid_mask : 0;
 
 		if (broadcast) {
 			if (riscv_use_ipi_for_rfence()) {
@@ -162,7 +171,8 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
 		}
 	}
 
-	put_cpu();
+	if (mm)
+		put_cpu();
 }
 
 void flush_tlb_mm(struct mm_struct *mm)
@@ -194,6 +204,13 @@ void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 	__flush_tlb_range(vma->vm_mm,
 			  start, end - start, 1 << stride_shift);
 }
+
+void flush_tlb_kernel_range(unsigned long start,
+			    unsigned long end)
+{
+	__flush_tlb_range(NULL, start, end, PAGE_SIZE);
+}
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 			unsigned long end)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
