Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88553C44501
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 13:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BVX7kmasUA/hBh4zXPKa2zDYkY2TIw5Y+z7ZxF4c3/M=; b=q9UO2MXtpY6e1S
	k32j4VNDshGdDSfZ+DVEY35/2dPbA+YoGR1fXQO6B/geuDVsuqE2fur8OHwqTCU7B7aRZVDbiik/d
	F+BkFgxNumdSHgNxXhtdtN09khKdz07np//xcxB+PPuj+KLeFPJpNkiA3JCjHaWo5KPZLnOi6dRAt
	7MqZqV2gvnu7I9FjU9VrQ1Y9gfgDvvu4vvEEU6yH+02BK6zZLnEasRHbVVjXw6b8DQwpNydaO93xh
	qjNAFeVaAEvGQeOydWMYGZEOLrFYJNBDWmByAt1x2dIdrc2sF/b1zqHF1ecArktX795E9qTkJ/9K2
	GO0ST5C4PRvOC/0IqNFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzXL-0000000EvDD-0zez;
	Wed, 15 Jul 2026 13:20:31 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzXI-0000000EvAh-09W4
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 13:20:29 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cacf197759so33902165ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2026 06:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784121627; x=1784726427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ls7fw2fiB7Zvr+LqQASlN6vhjFF7oWi5zE1mfIWRWyE=;
        b=LpuYPkTB7H7uryBjq0A6QNGBy/s17NbjQqCsZQ9mDiyQ18/7WBWIuHCY4FrDPt138m
         kAHerA0RwUMkSQ2FRr8HehBklbwPc1ri7pmo8Fa/Lb+26DfwGksLyE6DwOF+KnSg5aSS
         //WoOP1LhmkokLmgrk1lFYZhKkE5wV15/DDhBNNBsfFi9eczd1WB7r+1QwrYDa5qcvim
         ACjWZ1O114GTgPJXxYzhmq/6dVtZGEHVMZWDuAecZ7arK+7HdR9NOFIuCCl7iI4Ad7N3
         FhCwkN8Xgt+eK5mxTBOqvUk4u/VFc71LvcK+n7PsG3bLst2a1EkIaJUfl0eU6h+R5NEP
         bBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784121627; x=1784726427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ls7fw2fiB7Zvr+LqQASlN6vhjFF7oWi5zE1mfIWRWyE=;
        b=d3e1Cr5CrfDqFhCruWJN3oF5L1yecMBLSIijvs/78gLOrbsOGtBS+++GXDrp9aQ2PQ
         LrYEqPXmd1f/0IC2bi8Ud39LG1uXgchPj5i1pyJ3Iu4F3twfis7VOmLpm/g2arxnhhXc
         xboSL/OW68ug/uzsP+4cgQQnbVa3uNHQFCitO6jcKu87RO3VxP0eHyBjM9SOP3AwK7R0
         JGlXmrznm2gMAGy2Ez59yRWKeUTVNoLlzF8VHVvDY//vTKggWhbIM5e1+0dvb3EoUc5p
         QLqMiDJm8InU8622i9jkc5ji6PCJIFm3IC0PlNO3BSTVJ2pW2jv7JyWQKxYqbD5Q4QJv
         FWkw==
X-Gm-Message-State: AOJu0Yx6hlM5fUY8LLXaJMYdGbPAt2vGGfV36PB3jArL8FPPtZ7Xr/9K
	Z3dSmEvqpxPlcJPBKAenIZzhwrrA9EGJtGuYwAIHMzIrU4TgCZaVc+wcL0Niycep1uE=
X-Gm-Gg: AfdE7clQ3YGnfX5sspWoatXezL3elOhCH6rrIndZwFSQTRDtKn5n6qhGXseCjp8z9kH
	h366L6iVgwFLo8wtvS/u7gaj4SfPXUOWG7q786oAK5hmAKv/VB580KtDtEkpiSOPhAAVIvgQdzi
	z7xLFzfgYsW5iKwBmJGw6vTz0tO0R1KB5z23y9NDu6XC0ONXvVTjwAS2iun8AL2R7CTFNAWXO4j
	/lFrhsxxFEKGW0dBI98PO6rgKAI8B828B7vlcQDDOtFkwJV42LyYvj86tIr73i7cCzOYOB6/PY7
	k4ywFRxS3uxTUTUpHMtkO4wTyspPPXszHdl0tCHEjrvkjKeOPMaD1x/WNa+u1KFJG4/VsmhjYyE
	Wc1uee5+MYNKLR9OjwagSzTGn8JZu72+q+d/PW6z79fDvALJgM5u80TauSsnS0nqCZLpC73saoG
	dDilICJFpwsNcflsOqYbb5ugIR04M7vNwbzS5QSthj6FVK6pDI2I9L1pPE31inc9/az48nTH3xk
	iXsonW6j9MK9cVtk8uGM0u+WSai7baR3+lKNYHKzhfFHA==
X-Received: by 2002:a17:903:240c:b0:2c8:1c05:16bb with SMTP id d9443c01a7336-2ce9ec0f108mr163542875ad.24.1784121626921;
        Wed, 15 Jul 2026 06:20:26 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf100e42c6sm2465085ad.9.2026.07.15.06.20.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 15 Jul 2026 06:20:26 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	klarasmodin@gmail.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v2 3/3] riscv: mm: Clear cpu in mm_cpumask after local_flush_tlb_all_asid
Date: Wed, 15 Jul 2026 21:20:09 +0800
Message-ID: <20260715132009.10634-4-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260715132009.10634-1-luxu.kernel@bytedance.com>
References: <20260715132009.10634-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_062028_085330_8D5646F6 
X-CRM114-Status: GOOD (  12.97  )
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

Clear corresponding bit of current cpu in mm_cpumask after executing
local_flush_tlb_all_asid().

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/mm/tlbflush.c | 41 ++++++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 962db300a166..571358f38587 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -17,7 +17,8 @@
  */
 unsigned long tlb_flush_all_threshold __read_mostly = 64;
 
-static void local_flush_tlb_range_threshold_asid(unsigned long start,
+static void local_flush_tlb_range_threshold_asid(struct mm_struct *mm,
+						 unsigned long start,
 						 unsigned long size,
 						 unsigned long stride,
 						 unsigned long asid)
@@ -27,6 +28,8 @@ static void local_flush_tlb_range_threshold_asid(unsigned long start,
 
 	if (nr_ptes_in_range > tlb_flush_all_threshold) {
 		local_flush_tlb_all_asid(asid);
+		if (mm && mm != current->active_mm)
+			cpumask_clear_cpu(raw_smp_processor_id(), mm_cpumask(mm));
 		return;
 	}
 
@@ -46,21 +49,28 @@ static void local_flush_tlb_range_threshold_asid(unsigned long start,
 	}
 }
 
-static inline void local_flush_tlb_range_asid(unsigned long start,
-		unsigned long size, unsigned long stride, unsigned long asid)
+static inline void local_flush_tlb_range_mm(struct mm_struct *mm,
+					    unsigned long start,
+					    unsigned long size,
+					    unsigned long stride)
 {
-	if (size <= stride)
+	unsigned long asid = get_mm_asid(mm);
+
+	if (size <= stride) {
 		local_flush_tlb_page_asid(start, asid);
-	else if (size == FLUSH_TLB_MAX_SIZE)
+	} else if (size == FLUSH_TLB_MAX_SIZE) {
 		local_flush_tlb_all_asid(asid);
-	else
-		local_flush_tlb_range_threshold_asid(start, size, stride, asid);
+		if (mm && mm != current->active_mm)
+			cpumask_clear_cpu(raw_smp_processor_id(), mm_cpumask(mm));
+	} else {
+		local_flush_tlb_range_threshold_asid(mm, start, size, stride, asid);
+	}
 }
 
 /* Flush a range of kernel pages without broadcasting */
 void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
 {
-	local_flush_tlb_range_asid(start, end - start, PAGE_SIZE, FLUSH_TLB_NO_ASID);
+	local_flush_tlb_range_mm(NULL, start, end - start, PAGE_SIZE);
 }
 
 static void __ipi_flush_tlb_all(void *info)
@@ -79,17 +89,17 @@ void flush_tlb_all(void)
 }
 
 struct flush_tlb_range_data {
-	unsigned long asid;
+	struct mm_struct *mm;
 	unsigned long start;
 	unsigned long size;
 	unsigned long stride;
 };
 
-static void __ipi_flush_tlb_range_asid(void *info)
+static void __ipi_flush_tlb_range_mm(void *info)
 {
 	struct flush_tlb_range_data *d = info;
 
-	local_flush_tlb_range_asid(d->start, d->size, d->stride, d->asid);
+	local_flush_tlb_range_mm(d->mm, d->start, d->size, d->stride);
 }
 
 static void __flush_tlb_range(struct mm_struct *mm,
@@ -97,7 +107,6 @@ static void __flush_tlb_range(struct mm_struct *mm,
 			      unsigned long start, unsigned long size,
 			      unsigned long stride)
 {
-	unsigned long asid = get_mm_asid(mm);
 	unsigned int cpu;
 
 	if (cpumask_empty(cmask))
@@ -107,17 +116,17 @@ static void __flush_tlb_range(struct mm_struct *mm,
 
 	/* Check if the TLB flush needs to be sent to other CPUs. */
 	if (cpumask_any_but(cmask, cpu) >= nr_cpu_ids) {
-		local_flush_tlb_range_asid(start, size, stride, asid);
+		local_flush_tlb_range_mm(mm, start, size, stride);
 	} else if (riscv_use_sbi_for_rfence()) {
-		sbi_remote_sfence_vma_asid(cmask, start, size, asid);
+		sbi_remote_sfence_vma_asid(cmask, start, size, get_mm_asid(mm));
 	} else {
 		struct flush_tlb_range_data ftd;
 
-		ftd.asid = asid;
+		ftd.mm = mm;
 		ftd.start = start;
 		ftd.size = size;
 		ftd.stride = stride;
-		on_each_cpu_mask(cmask, __ipi_flush_tlb_range_asid, &ftd, 1);
+		on_each_cpu_mask(cmask, __ipi_flush_tlb_range_mm, &ftd, 1);
 	}
 
 	put_cpu();
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
