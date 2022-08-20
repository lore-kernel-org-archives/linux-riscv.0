Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D888EC32772
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Aug 2022 06:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fo4uBLeY1CKENfSjbL6+jBCG+dg5CSVXAkXMz8AY260=; b=u4HORb4sVAn1pn
	enEpdCWVidXK9odacQq4zqdYg1AL37Ash/uabtDM8bm8q0TVyoFrB0/UsjpHheFO/+PDErgv8TLSj
	WgmTFr6/7541omXnWudJzoRHJMPwqnRx4fMs/wrMTYWizfQ4GyBS1v82soCrHKt0eavIyI1KjbsD8
	QrmOxmWBDtgV6LSdND73Yo3Co6Ank6BgMprmXfVF0DslgRlRIs/yqdhKkju+PB4aPmOi3oXB/koKC
	4RTCO1amwTDV7cO/NKa6I+9oi31H9Syf3z9qt1j+DfQkum+s0F005i0SRHDU1tOV42wJfs4Gu4YD+
	BH30mTf0Z1uesdKydjqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPIP5-003umP-5f; Sat, 20 Aug 2022 06:56:19 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPIP0-003uQO-Nl
	for linux-riscv@lists.infradead.org; Sat, 20 Aug 2022 06:56:16 +0000
Received: by mail-oi1-x22b.google.com with SMTP id w196so6949198oiw.10
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 23:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=BjmiwAV+qkEddhUojBQVUbZIbS/TIGSArMUYW9Y9o7E=;
        b=ke50uMDbvR6TR8jTctSoQUUFZ4uWRDpb2TBPkcm72JfcDAy2vcsrV1bwBq9fW6cRmH
         Ft+KbVyVomoxjrpzCs4vN2YQB0FKHyWmiyJKBC+hxZX5+hgr8+mswTFOTbU2ST38lG3P
         tjcXo19TZpK9Vbgb69vYKj3FQGCQuWHEiHwC9gZUBdUQt3yrS94eh6Dxg0CPGAs0C661
         qNwWH4Ar6G0fDPUVtm7uNoD6DGIanAUo5ek71iM1u+yPilnZDnVWoHM9zz57OHpbYryv
         s44h3UUhPahaDEb6d4nQ1K/OIKot03usdgpmGt3XG+f/OZL2e/cZYlDOq4SfO82UxZ8p
         hzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=BjmiwAV+qkEddhUojBQVUbZIbS/TIGSArMUYW9Y9o7E=;
        b=pFswBst5nvb29+uD/b5sKKMm4yXIqZ4qEFIx+ZMFqtlEtSt5uUvIoIdM9yQg605u0K
         cj1OqSaVdewHUMReItT+vL9rUykQgV0pHxDIthP2QZrww0ZSPi6HMYFql9VtxWp5jFVN
         pvbdB+wxvmlMwtflrhWx2G76ty4/fHS0Ro8ofZEAL6IqpDp4lxUWX+OEK9KrWj6pOevX
         WZ0OW4HvQsoe1chswdbfJUB8kNZj4q9NCCh7Thqz/a5Ojs2qbsCOfUL2qGsKgwjVpcMl
         y0KIv1djrJzkNVnCe3ljXFen4YPsh7Lx3yq/R9o4DbbBHohtSwEOFgfi3kxYwhTLcTyL
         /FNA==
X-Gm-Message-State: ACgBeo28yqIOluIWm/G/OejF0uqZIf8rPhVCJDn192kfYY72aFWSWitZ
	7zaH3rzJfjd7Dl6buvzbJ1+tuA==
X-Google-Smtp-Source: AA6agR77yKrj6rrlDl1Dapu8IarhKw8BUnBluIJ+l2drA7Otr3OgkV+I/+PscH3BzI6N9bgfpsOFLA==
X-Received: by 2002:a05:6808:1441:b0:333:3929:d079 with SMTP id x1-20020a056808144100b003333929d079mr4973466oiv.21.1660978574361;
        Fri, 19 Aug 2022 23:56:14 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.82.68])
        by smtp.gmail.com with ESMTPSA id h26-20020a9d641a000000b00636faf5e2d9sm1661098otl.39.2022.08.19.23.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 23:56:13 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v8 6/7] RISC-V: Use IPIs for remote TLB flush when possible
Date: Sat, 20 Aug 2022 12:24:45 +0530
Message-Id: <20220820065446.389788-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220820065446.389788-1-apatel@ventanamicro.com>
References: <20220820065446.389788-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_235614_826982_376F017F 
X-CRM114-Status: GOOD (  12.63  )
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
