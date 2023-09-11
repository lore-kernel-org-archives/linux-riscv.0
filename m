Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECBDEE7FF4
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 13:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w4Dfo/r5Rjwqx9lqoWoF4a0FWcMGu45aYZ6Vk33eU8Q=; b=cYDkaYHkHaaDJ8
	T3ki4vJJLVOS6fUAw8n8OiQxFXZpeMCcoa1dI6x9+eUboMxABbUycAKS/xWvzVLBIhVn3uYEjgtwP
	qc2aTDhYq4Bq/+loeGhdDy1l1XUp3GsqN8KPTIxsDj5hAhVV6HU44WH9otEXu3KFgFNlJOrq/o9/F
	TflbD5GSztdh9iApYAcpnYlZHk0VDci9G+9siov6sn9zddA3ubHvSuhpg7Ukh0IgmdjQvnnibcDiV
	wv5bAWrAhA0LjO5BeQicABM4juLhKLcNQTxhnQ4sjxR5nClmOZ9kg9rCsYlv3ZwnL4VEgHZ1t9zFW
	ZEvaPyszkVcOl+DhlpHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfgkM-000a4P-30;
	Mon, 11 Sep 2023 13:14:34 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfgkK-000a1t-0r
	for linux-riscv@lists.infradead.org;
	Mon, 11 Sep 2023 13:14:33 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-401da71b85eso48335765e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 Sep 2023 06:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694438070; x=1695042870; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTDHLs2EOQtTQ3uvgmHng/nVHNHrVDMEJR/1UpGvkHQ=;
        b=G81u1xj9uHwGAfMKXdEaEbFiwFI1xo9Mz7jRWwxJMjD8egua02owISFtQyYPLhMO6L
         Z+CPabTKUG4LG10Jot4QbJt3DZWANuPyNHtm+w4oH52HPPiHmuZO4Xk0CwKKJFCCKJ19
         O3vhlAF04u4WnxsrdrKIckc+w5R8cy9RVCPNUpfrQKu0ZFGnLn4QrqZPPdg7qrqknE2s
         n1m0uK+jHyJcXmNqXf1rOlshyunG0q+/IoMFzKyCafJD0LMQaUZ+bFFbfcJK7rEC60oZ
         9msvL0HjwrTHoNPyPaks9JjxAdkhoCS8pkgi4TMmF/hZwFVel8jUUiiqy/6lVHDp+RYA
         Yl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694438070; x=1695042870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jTDHLs2EOQtTQ3uvgmHng/nVHNHrVDMEJR/1UpGvkHQ=;
        b=Y65cxHvV0sWdUvYO0grkx2ATkKMJ4SuVsPTGAedMn6UBx/J/VICFznUFLNJuPQTTMh
         185T4PmVN/cmnjkisMEPm4eN6P4KLhNT46T69++n7OLnedL60bKKohUO+94IwPFJynQN
         E03w3k6x14lClRlUhFz74JhOu4JgaNjNFuNHVfCe+BFwZIlrLFbaHBe7CyFfQ/UTmO6I
         W5SFuDXWShxQuj1z2RFQuVxsBLzcd1SRVclwWG1pHqAqkEUsilGnXgSXJCUFYZVaVV+L
         Z5TiNWoyBGAw5GcINgR5S9pOtcO0zqGgMLXmOyD6ZJadvD2o52JXJUFbMBoN44L0uM7E
         NFkw==
X-Gm-Message-State: AOJu0Yxym1QhdkxyK4oDV9d3vg1ciK8XmJZ8KNrNb5vezrTAuMm7Z6BI
	GJTTkB6QmQoI6CfMWD4Sif+t+A==
X-Google-Smtp-Source: AGHT+IGYcFnpNiP+FLLZHYSCC5nHXUyn1lvxXozVLynaGkKKRW3cVE8D6L3lkbbcr2jik100ZVPpZw==
X-Received: by 2002:a5d:6510:0:b0:317:ec04:ee0c with SMTP id x16-20020a5d6510000000b00317ec04ee0cmr8022431wru.47.1694438069661;
        Mon, 11 Sep 2023 06:14:29 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id v11-20020a1cf70b000000b00401d8810c8bsm13230128wmh.15.2023.09.11.06.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 06:14:29 -0700 (PDT)
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
Subject: [PATCH v4 2/4] riscv: Improve flush_tlb_range() for hugetlb pages
Date: Mon, 11 Sep 2023 15:12:22 +0200
Message-Id: <20230911131224.61924-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230911131224.61924-1-alexghiti@rivosinc.com>
References: <20230911131224.61924-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_061432_322128_B5FD02B0 
X-CRM114-Status: GOOD (  14.72  )
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

flush_tlb_range() uses a fixed stride of PAGE_SIZE and in its current form,
when a hugetlb mapping needs to be flushed, flush_tlb_range() flushes the
whole tlb: so set a stride of the size of the hugetlb mapping in order to
only flush the hugetlb mapping. However, if the hugepage is a NAPOT region,
all PTEs that constitute this mapping must be invalidated, so the stride
size must actually be the size of the PTE.

Note that THPs are directly handled by flush_pmd_tlb_range().

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/mm/tlbflush.c | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index fa03289853d8..5bda6d4fed90 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -3,6 +3,7 @@
 #include <linux/mm.h>
 #include <linux/smp.h>
 #include <linux/sched.h>
+#include <linux/hugetlb.h>
 #include <asm/sbi.h>
 #include <asm/mmu_context.h>
 
@@ -147,7 +148,43 @@ void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		     unsigned long end)
 {
-	__flush_tlb_range(vma->vm_mm, start, end - start, PAGE_SIZE);
+	unsigned long stride_size;
+
+	stride_size = is_vm_hugetlb_page(vma) ?
+				huge_page_size(hstate_vma(vma)) :
+				PAGE_SIZE;
+
+#ifdef CONFIG_RISCV_ISA_SVNAPOT
+	/*
+	 * As stated in the privileged specification, every PTE in a NAPOT
+	 * region must be invalidated, so reset the stride in that case.
+	 */
+	if (has_svnapot()) {
+		unsigned long order, napot_size;
+
+		for_each_napot_order(order) {
+			napot_size = napot_cont_size(order);
+
+			if (stride_size != napot_size)
+				continue;
+
+			if (napot_size >= PGDIR_SIZE)
+				stride_size = PGDIR_SIZE;
+			else if (napot_size >= P4D_SIZE)
+				stride_size = P4D_SIZE;
+			else if (napot_size >= PUD_SIZE)
+				stride_size = PUD_SIZE;
+			else if (napot_size >= PMD_SIZE)
+				stride_size = PMD_SIZE;
+			else
+				stride_size = PAGE_SIZE;
+
+			break;
+		}
+	}
+#endif
+
+	__flush_tlb_range(vma->vm_mm, start, end - start, stride_size);
 }
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
