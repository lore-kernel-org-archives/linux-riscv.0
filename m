Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64344C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Mar 2022 04:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=faR1DsfutCC/02isRDBNHtO6De8cT0N9OG/GXjsUAs8=; b=fkJGQUChqBtgDt
	ZGLX5b4fW+XXfZVaqpgkm8L1iONRkDMGDumbmxSA9c79ll43HALFnGtMMtcUXJOnAsfERPMocgUKS
	Zf/iFvX01AP/FpVX4EE/Zq8cQKfo5LJZnRNoHwnM4yqKhMgzkgNYpyI9v17/4pKaQUIpxAsPDqpLo
	goCY7m2H0YF/0nqyVj1nAi6WS7KelLRMeNHRDPgqzgVfrbNBJQxqU9/2bL+v7FshwtAxaVCcan6lL
	lkNrJLqyqnGi6Cy1HbiOg7EQQTg9MGsxsw2eEsT7Yps91aL072DsvhngqS0ofJCShgSAT7SJDGzNj
	WM5uKhkLmyMcY4bMPm/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOu86-00EtIq-K6; Tue, 01 Mar 2022 04:28:54 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOu7q-00EtAN-SV
 for linux-riscv@lists.infradead.org; Tue, 01 Mar 2022 04:28:40 +0000
Received: by mail-wr1-x431.google.com with SMTP id e10so894162wro.13
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 20:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gulBS1a3GDwTjV3gPNI1Ld+RqIL2YPtNwx+Ha/YsDb0=;
 b=Puv3jS3yxYrmy/Wq1z55hOwBixDPaWB5vIsJA4yUcPkgKDUfxuUneL//cTo6BYz6W0
 fjaokoL7mTjnxa3jrd7iXtqi67wMGZSiPLkTZKJpV7987CzhUOxERZ2PvLKxM+gwe8Ku
 ZGNQrKEySnzIQg+6dqrc06N4+hH2foqVE9RZHs9PK9Ac+Q6AJJxFxextFCypPGvZdDBS
 EdKnMjOJWJDjS75e1JGInEYgt7uULhpYLx8yS/+Mu4I/QA2A5ss9fhp4VnzxZ2a+nwj5
 Yia9Fj0izkecTCaYt+aMGrTQv6pRGUPA1ZTnI9hhr+w3MYX51mBBegLYxDJHyLF4n+Ae
 6a3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gulBS1a3GDwTjV3gPNI1Ld+RqIL2YPtNwx+Ha/YsDb0=;
 b=fvY4Vb0Wz7g0fewMewb00Wkum8HOHtmTRZGsWkSJgfoap3b8kVF0JvperKjbBZ+q2j
 R5mjmKhCX19jiblNRZhDmQgyhkfWx9EODryE6txxQWyrdRtDcQ2nu8eCjEteNJjOnhXJ
 LtdfMrmY6tP32ehXsrbYro6rcT2mekmELUQAVjOge87nZ33vffS6hvbGF5cZGJY/Bx8W
 ClNvcsARFFGw8KCET+X3/xoKW8BYvjtg+u3i/TjJlc0FxHbxdNwo+uKPeOLMw3PGPKip
 qV6mHFPZpPR3lSgt7jArCw5iw7a2kX6ryFkTND8dbdvtVyasxHhuoXp+AaA+zydThtgz
 JUxA==
X-Gm-Message-State: AOAM531gRCF9bh5qz+DWXVoDPUdB6/mCFlO/Tn7emzk6drZO/7XdzEWl
 xSg8aWuNQBxpwA6V5v7qQGH8hQ==
X-Google-Smtp-Source: ABdhPJwI6DiDysV89Auh+g1ZzDOJsVAU15rOTyJCda1Rc/WZjA/Z0U3Frp4Wjlfxki88Csf75xDTrw==
X-Received: by 2002:a5d:50c5:0:b0:1f0:2111:8f74 with SMTP id
 f5-20020a5d50c5000000b001f021118f74mr2051wrt.211.1646108917693; 
 Mon, 28 Feb 2022 20:28:37 -0800 (PST)
Received: from localhost.localdomain ([122.179.35.69])
 by smtp.gmail.com with ESMTPSA id
 2-20020a1c1902000000b00380d3873d6asm1209107wmz.43.2022.02.28.20.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 20:28:37 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 5/6] RISC-V: Use IPIs for remote TLB flush when possible
Date: Tue,  1 Mar 2022 09:57:21 +0530
Message-Id: <20220301042722.401113-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301042722.401113-1-apatel@ventanamicro.com>
References: <20220301042722.401113-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_202839_016398_E7AE34CB 
X-CRM114-Status: GOOD (  13.67  )
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

If we have specialized interrupt controller (such as AIA IMSIC) which
allows supervisor mode to directly inject IPIs without any assistance
from M-mode or HS-mode then using such specialized interrupt controller,
we can do remote TLB flushes directly from supervisor mode instead of
using the SBI RFENCE calls.

This patch extends remote TLB flush functions to use supervisor mode
IPIs whenever direct supervisor mode IPIs.are supported by interrupt
controller.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/mm/tlbflush.c | 93 +++++++++++++++++++++++++++++++++-------
 1 file changed, 78 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 37ed760d007c..27a7db8eb2c4 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -23,14 +23,62 @@ static inline void local_flush_tlb_page_asid(unsigned long addr,
 			: "memory");
 }
 
+static inline void local_flush_tlb_range(unsigned long start,
+		unsigned long size, unsigned long stride)
+{
+	if (size <= stride)
+		local_flush_tlb_page(start);
+	else
+		local_flush_tlb_all();
+}
+
+static inline void local_flush_tlb_range_asid(unsigned long start,
+		unsigned long size, unsigned long stride, unsigned long asid)
+{
+	if (size <= stride)
+		local_flush_tlb_page_asid(start, asid);
+	else
+		local_flush_tlb_all_asid(asid);
+}
+
+static void __ipi_flush_tlb_all(void *info)
+{
+	local_flush_tlb_all();
+}
+
 void flush_tlb_all(void)
 {
-	sbi_remote_sfence_vma(NULL, 0, -1);
+	if (riscv_use_ipi_for_rfence())
+		on_each_cpu(__ipi_flush_tlb_all, NULL, 1);
+	else
+		sbi_remote_sfence_vma(NULL, 0, -1);
+}
+
+struct flush_tlb_range_data {
+	unsigned long asid;
+	unsigned long start;
+	unsigned long size;
+	unsigned long stride;
+};
+
+static void __ipi_flush_tlb_range_asid(void *info)
+{
+	struct flush_tlb_range_data *d = info;
+
+	local_flush_tlb_range_asid(d->start, d->size, d->stride, d->asid);
+}
+
+static void __ipi_flush_tlb_range(void *info)
+{
+	struct flush_tlb_range_data *d = info;
+
+	local_flush_tlb_range(d->start, d->size, d->stride);
 }
 
-static void __sbi_tlb_flush_range(struct mm_struct *mm, unsigned long start,
-				  unsigned long size, unsigned long stride)
+static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
+			      unsigned long size, unsigned long stride)
 {
+	struct flush_tlb_range_data ftd;
 	struct cpumask *cmask = mm_cpumask(mm);
 	unsigned int cpuid;
 	bool broadcast;
@@ -45,19 +93,34 @@ static void __sbi_tlb_flush_range(struct mm_struct *mm, unsigned long start,
 		unsigned long asid = atomic_long_read(&mm->context.id);
 
 		if (broadcast) {
-			sbi_remote_sfence_vma_asid(cmask, start, size, asid);
-		} else if (size <= stride) {
-			local_flush_tlb_page_asid(start, asid);
+			if (riscv_use_ipi_for_rfence()) {
+				ftd.asid = asid;
+				ftd.start = start;
+				ftd.size = size;
+				ftd.stride = stride;
+				on_each_cpu_mask(cmask,
+						 __ipi_flush_tlb_range_asid,
+						 &ftd, 1);
+			} else
+				sbi_remote_sfence_vma_asid(cmask,
+							   start, size, asid);
 		} else {
-			local_flush_tlb_all_asid(asid);
+			local_flush_tlb_range_asid(start, size, stride, asid);
 		}
 	} else {
 		if (broadcast) {
-			sbi_remote_sfence_vma(cmask, start, size);
-		} else if (size <= stride) {
-			local_flush_tlb_page(start);
+			if (riscv_use_ipi_for_rfence()) {
+				ftd.asid = 0;
+				ftd.start = start;
+				ftd.size = size;
+				ftd.stride = stride;
+				on_each_cpu_mask(cmask,
+						 __ipi_flush_tlb_range,
+						 &ftd, 1);
+			} else
+				sbi_remote_sfence_vma(cmask, start, size);
 		} else {
-			local_flush_tlb_all();
+			local_flush_tlb_range(start, size, stride);
 		}
 	}
 
@@ -66,23 +129,23 @@ static void __sbi_tlb_flush_range(struct mm_struct *mm, unsigned long start,
 
 void flush_tlb_mm(struct mm_struct *mm)
 {
-	__sbi_tlb_flush_range(mm, 0, -1, PAGE_SIZE);
+	__flush_tlb_range(mm, 0, -1, PAGE_SIZE);
 }
 
 void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 {
-	__sbi_tlb_flush_range(vma->vm_mm, addr, PAGE_SIZE, PAGE_SIZE);
+	__flush_tlb_range(vma->vm_mm, addr, PAGE_SIZE, PAGE_SIZE);
 }
 
 void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		     unsigned long end)
 {
-	__sbi_tlb_flush_range(vma->vm_mm, start, end - start, PAGE_SIZE);
+	__flush_tlb_range(vma->vm_mm, start, end - start, PAGE_SIZE);
 }
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 			unsigned long end)
 {
-	__sbi_tlb_flush_range(vma->vm_mm, start, end - start, PMD_SIZE);
+	__flush_tlb_range(vma->vm_mm, start, end - start, PMD_SIZE);
 }
 #endif
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
