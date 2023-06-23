Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A70EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 12:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YOFk4KTmP8bxqpc3XdC78VIc+E/iZc81UU12n3L/d48=; b=12myxO6eS3eSWw
	beX+lA3H90rllNcCXhHg0cZVx/+SoC/2tJc1PryIGSTSfolGpkgU3+CwOk8AH0AX3sKuor4LCPE+M
	ObJIPZc9COj6Rr/naBNUu6C/XfNljlbToxsoiLMTIrPrpe8/WM88toRsc4kuK1a6dNRZQnPPzKwy2
	bO2+5c3tTmy1uwKqGLogI7havjyGmbrxMmMva89N103NYWVkLt2sopSm+Qr7JEojxT2WfxQPsS9Ns
	Yh1oh2Av6M2NSwVlO8xRb08KDSj4ntC7qCCfthth9IoYEOy4ZamZxtxFudbIvJuAh/ojllnQHASGC
	f3LqznOsmb0cYvegTAXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCg4L-003YVP-2z;
	Fri, 23 Jun 2023 12:39:17 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCg4I-003YUH-2n
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jun 2023 12:39:16 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-25eb401995aso311916a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jun 2023 05:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687523946; x=1690115946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQ18r1Hy95vQunMr6QVYonuRjFhGQCfGBZDsfWZbqhw=;
        b=Zlna2VZODxLIqte9dMbBAacs0qq9DHsw6ddbGJKZ729Nec3Jg6C1KGscDuyBrP7oDE
         ZEdud20r+E0FRKF32vxSehW1AhRqpYIXLdNXUE1tZD4L/UyV6y89ZTb1u1XzF1cC95Ds
         wwWfXxlNpiXf8QJJp+6oFACN+RVeUQ+IlXPM6lzqP3vHi4qK4H2sZlQSwtAnZKUREr8c
         FhAsDCHwD2d1qUdyVkiG6+Yp7Uu34s5bhZTS/YWE8MIM0EQxQPMMEbHJSbbD0CQL5maD
         vtQe5B17w5I/TV4vm3zKJkglILcmSJRCP51zLF7qxxJx0j8dAs7PQKoPTGnUgoWoZo4l
         p5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687523946; x=1690115946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aQ18r1Hy95vQunMr6QVYonuRjFhGQCfGBZDsfWZbqhw=;
        b=csBTHY+Z0FVXRvss3qiI5YQ/I5OkRwrDGEv/x+duhtD8Xk/S6/emE+rIVyk0txruth
         i898nRJHgNLK6yKHNxtrpyqijl78SswoRNiBFP44yj9eXSPDDgCaK3YYzN/1exGCdSzu
         x5zetnWnXvoZTMWGeDYjg6Lu/54ygj2iXbMIuDppS11mqXKwTYcpFBLCRHVIyscyyjCm
         ws4gzuDhXaayv47pdzmxtrrV7aA2asjYvvkSLKTypn4ni62fNzJk2QQhOmHBWpar5WN0
         snOatjgSYEyf5w1I/CA7e8xJT0MT2fLaWxh/8dT3mmz4bApftrJ3ffjFLiJ3qihhuIBD
         fR8g==
X-Gm-Message-State: AC+VfDx2kqE+LVZtWdOcBz9ijLBkjAlpmsKvz/Zjp3V8UDsojT+j4+wT
	W0qRktk3TMYPY8fGLduQB6kdkQ==
X-Google-Smtp-Source: ACHHUZ6/PX7VWuDdrHHVWu/qt9Ff7Kk/XxcW0ayZ/4LQFTsapivWUwf4xtM0lLL89ipqKfxjEmfPoQ==
X-Received: by 2002:a17:90b:1bc2:b0:25c:1397:3c0b with SMTP id oa2-20020a17090b1bc200b0025c13973c0bmr13948029pjb.37.1687523946074;
        Fri, 23 Jun 2023 05:39:06 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id x9-20020a17090a1f8900b0025bf330903esm5749117pja.1.2023.06.23.05.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 05:39:05 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 1/1] riscv: mm: use svinval instructions instead of sfence.vma
Date: Fri, 23 Jun 2023 18:08:49 +0530
Message-Id: <20230623123849.1425805-2-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230623123849.1425805-1-mchitale@ventanamicro.com>
References: <20230623123849.1425805-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_053914_907491_63EF362B 
X-CRM114-Status: GOOD (  15.14  )
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

When svinval is supported the local_flush_tlb_page*
functions would prefer to use the following sequence
to optimize the tlb flushes instead of a simple sfence.vma:

sfence.w.inval
svinval.vma
  .
  .
svinval.vma
sfence.inval.ir

The maximum number of consecutive svinval.vma instructions
that can be executed in local_flush_tlb_page* functions is
limited to 64. This is required to avoid soft lockups and the
approach is similar to that used in arm64.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 arch/riscv/include/asm/tlbflush.h |  1 +
 arch/riscv/mm/tlbflush.c          | 66 +++++++++++++++++++++++++++----
 2 files changed, 59 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index a09196f8de68..56490c04b0bd 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -30,6 +30,7 @@ static inline void local_flush_tlb_page(unsigned long addr)
 #endif /* CONFIG_MMU */
 
 #if defined(CONFIG_SMP) && defined(CONFIG_MMU)
+extern unsigned long tlb_flush_all_threshold;
 void flush_tlb_all(void);
 void flush_tlb_mm(struct mm_struct *mm);
 void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr);
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 77be59aadc73..f63cdf8644f3 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -5,6 +5,17 @@
 #include <linux/sched.h>
 #include <asm/sbi.h>
 #include <asm/mmu_context.h>
+#include <asm/hwcap.h>
+#include <asm/insn-def.h>
+
+#define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
+
+/*
+ * Flush entire TLB if number of entries to be flushed is greater
+ * than the threshold below. Platforms may override the threshold
+ * value based on marchid, mvendorid, and mimpid.
+ */
+unsigned long tlb_flush_all_threshold __read_mostly = 64;
 
 static inline void local_flush_tlb_all_asid(unsigned long asid)
 {
@@ -24,21 +35,60 @@ static inline void local_flush_tlb_page_asid(unsigned long addr,
 }
 
 static inline void local_flush_tlb_range(unsigned long start,
-		unsigned long size, unsigned long stride)
+					 unsigned long size,
+					 unsigned long stride)
 {
-	if (size <= stride)
-		local_flush_tlb_page(start);
-	else
+	unsigned long end = start + size;
+	unsigned long num_entries = DIV_ROUND_UP(size, stride);
+
+	if (!num_entries || num_entries > tlb_flush_all_threshold) {
 		local_flush_tlb_all();
+		return;
+	}
+
+	if (has_svinval())
+		asm volatile(SFENCE_W_INVAL() ::: "memory");
+
+	while (start < end) {
+		if (has_svinval())
+			asm volatile(SINVAL_VMA(%0, zero)
+				     : : "r" (start) : "memory");
+		else
+			local_flush_tlb_page(start);
+		start += stride;
+	}
+
+	if (has_svinval())
+		asm volatile(SFENCE_INVAL_IR() ::: "memory");
 }
 
 static inline void local_flush_tlb_range_asid(unsigned long start,
-		unsigned long size, unsigned long stride, unsigned long asid)
+					      unsigned long size,
+					      unsigned long stride,
+					      unsigned long asid)
 {
-	if (size <= stride)
-		local_flush_tlb_page_asid(start, asid);
-	else
+	unsigned long end = start + size;
+	unsigned long num_entries = DIV_ROUND_UP(size, stride);
+
+	if (!num_entries || num_entries > tlb_flush_all_threshold) {
 		local_flush_tlb_all_asid(asid);
+		return;
+	}
+
+	if (has_svinval())
+		asm volatile(SFENCE_W_INVAL() ::: "memory");
+
+	while (start < end) {
+		if (has_svinval())
+			asm volatile(SINVAL_VMA(%0, %1) : : "r" (start),
+				     "r" (asid) : "memory");
+		else
+			local_flush_tlb_page_asid(start, asid);
+		start += stride;
+	}
+
+	if (has_svinval())
+		asm volatile(SFENCE_INVAL_IR() ::: "memory");
 }
 
 static void __ipi_flush_tlb_all(void *info)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
