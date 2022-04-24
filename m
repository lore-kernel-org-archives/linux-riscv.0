Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0511EC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Apr 2022 09:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2sRwOVWfabqZfqotHQk+HIu28TW5weXTh15MZktKnXg=; b=qRJwboPhr12wUp
	SGhSrxVPt3hjiZYwObgnqvi44+nX6JOqQNYAnuNaroChdQ5b3eifTcrzk7O8YIwE5Io8Yr6o65StV
	0Opj8K1g10+MR79APstHk6GumHOGNZsVlS16kiLaWWdTnFrnDaypa6rfENjdfO6DVLpYorNWDtftt
	JXRAuS7T1ZC4fRvmWarLrcDKWbwPbfJULHiwQ5PcH0IsogGXu5WWRtHYjcKuLZf2lTmXsSj+LR+DK
	ILsdIaLILb4unpB8lWDm2rgg0wj7VTuoFTZqeNl9oOL55SY5sLxNRuY63ywNsshuU7O0tUX+5uctE
	vXRQ0QO2tPeMg5OF7ZHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niY94-006Dxh-9L; Sun, 24 Apr 2022 09:03:06 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niY8x-006Dub-NI
 for linux-riscv@lists.infradead.org; Sun, 24 Apr 2022 09:03:03 +0000
Received: by mail-pl1-x62b.google.com with SMTP id c23so20556352plo.0
 for <linux-riscv@lists.infradead.org>; Sun, 24 Apr 2022 02:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=d9BUQmhk3lChVnY6CUm3s/EVuwl6eb9JDwfzH9Ov/0E=;
 b=DyAB6oK0mdVTaAEzFlw+qD5q2XqxT9bDfv1m+gIm73P+OeG5OhoZxu6LJPzed/0PtR
 7b2kfaV204DLp6zYmIAJHvlauTdJ/SPN+nXuOQSyWWy9hahWCkEjg1AR0+qi84eOSqUX
 5Ho3NP3dCwVCZIz6gM8MHE1uGE3uODSrrXT8SbDv87d9+Xv9bJKewvl5kqwW2Vkmdaa/
 7vNF2+Ko0s7rxewFtejceUay7i0XY60fzGkM9VCzK1CmRR6LG5SMen6s4ESAZaQpLFA0
 NR5WLTdh/5tstInbGFXTDkcob0qYoNq3Q5fMN2V4usGJG6OZyrUWDJQgQgs8tHAr1Lx1
 hoxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=d9BUQmhk3lChVnY6CUm3s/EVuwl6eb9JDwfzH9Ov/0E=;
 b=QfUzldJq873zCUHO4BM3oG3ocg8WI31XTzQOton9UvDV3uIbMrFX8eshn8w4QfRi6c
 kUoKTSNASAYHeqScWWmrfZxC1mOYv5Cx/E/06OlAtoyTJ+573/dPd6OFsWkyG72iwi4u
 qOmncboeHAM7EJKJ7frplW5tD/TAO4xja6DtLLNATD0MSoqhWbo+yzAl7YJL3EZtf8yH
 qOLAgYTrHr9yarkmVI3kNTth8UZVdJNMUCW8HlQJfS92gFJtc2C1yi2D+ivTj+J2Tu24
 1AUaX1TfoyZFWckvoL/SdeeG2uaWYvYJHOPRqKLwXjTUfJ6WAINbuis25KrskWB7GzO2
 ZmEw==
X-Gm-Message-State: AOAM530Xq7OSdPIZpEWSIb04HRclTwhIM6IFPD99Fair+HhsH+ksencS
 YTf3/exWZDBQ7+qGw24IvrM4wA==
X-Google-Smtp-Source: ABdhPJz8PtnjylMruGoNqjwFOZqUI9x2f9O63wNF/V9pXXMIGYwlnwj1e0JWcTjO6uOqZl4kaDDUIw==
X-Received: by 2002:a17:90b:1d8f:b0:1d2:e15a:de8 with SMTP id
 pf15-20020a17090b1d8f00b001d2e15a0de8mr14631450pjb.139.1650790976872; 
 Sun, 24 Apr 2022 02:02:56 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([122.169.86.15])
 by smtp.googlemail.com with ESMTPSA id
 n7-20020a17090a73c700b001d9682ad948sm628090pjk.0.2022.04.24.02.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 02:02:56 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org
Subject: [RFC PATCH v2 2/2] riscv: mm: use svinval instructions instead of
 sfence.vma
Date: Sun, 24 Apr 2022 14:32:16 +0530
Message-Id: <20220424090216.21887-3-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220424090216.21887-1-mchitale@ventanamicro.com>
References: <20220424090216.21887-1-mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_020259_834007_1E8B2CE4 
X-CRM114-Status: GOOD (  17.66  )
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
MIME-Version: 1.0
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
limited to PTRS_PER_PTE. This is required to avoid soft
lockups and the approach is similar to that used in arm64.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 arch/riscv/include/asm/tlbflush.h |  12 ++++
 arch/riscv/kernel/setup.c         |   1 +
 arch/riscv/mm/tlbflush.c          | 116 ++++++++++++++++++++++++++++--
 3 files changed, 123 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 801019381dea..b535467c99f0 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -22,6 +22,18 @@ static inline void local_flush_tlb_page(unsigned long addr)
 {
 	ALT_FLUSH_TLB_PAGE(__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory"));
 }
+
+void riscv_tlbflush_init(void);
+void __riscv_sfence_w_inval(void);
+void __riscv_sfence_inval_ir(void);
+void __riscv_sinval_vma(unsigned long addr);
+void __riscv_sinval_vma_asid(unsigned long addr, unsigned long asid);
+
+/* Check if we can use sinval for tlb flush */
+DECLARE_STATIC_KEY_FALSE(riscv_flush_tlb_svinval);
+#define riscv_use_flush_tlb_svinval() \
+	static_branch_unlikely(&riscv_flush_tlb_svinval)
+
 #else /* CONFIG_MMU */
 #define local_flush_tlb_all()			do { } while (0)
 #define local_flush_tlb_page(addr)		do { } while (0)
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 834eb652a7b9..13de04259de9 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -295,6 +295,7 @@ void __init setup_arch(char **cmdline_p)
 #endif
 
 	riscv_fill_hwcap();
+	riscv_tlbflush_init();
 }
 
 static int __init topology_init(void)
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 27a7db8eb2c4..800953f9121e 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -1,11 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#define pr_fmt(fmt) "riscv: " fmt
 #include <linux/mm.h>
 #include <linux/smp.h>
 #include <linux/sched.h>
 #include <asm/sbi.h>
 #include <asm/mmu_context.h>
 
+static unsigned long tlb_flush_all_threshold __read_mostly = PTRS_PER_PTE;
+
 static inline void local_flush_tlb_all_asid(unsigned long asid)
 {
 	__asm__ __volatile__ ("sfence.vma x0, %0"
@@ -23,22 +26,110 @@ static inline void local_flush_tlb_page_asid(unsigned long addr,
 			: "memory");
 }
 
+static inline void riscv_sfence_inval_ir(void)
+{
+	/*
+	 * SFENCE.INVAL.IR
+	 * 0001100 00001 00000 000 00000 1110011
+	 */
+	asm volatile (".word 0x18100073" ::: "memory");
+}
+
+static inline void riscv_sfence_w_inval(void)
+{
+	/*
+	 * SFENCE.W.INVAL
+	 * 0001100 00000 00000 000 00000 1110011
+	 */
+	asm volatile (".word 0x18000073" ::: "memory");
+}
+
+static inline void riscv_sinval_vma_asid(unsigned long vma, unsigned long asid)
+{
+	/*
+	 * rs1 = a0 (VMA)
+	 * rs2 = a1 (asid)
+	 * SINVAL.VMA a0, a1
+	 * 0001011 01011 01010 000 00000 1110011
+	 */
+	asm volatile ("srli a0, %0, 2\n"
+			"add a1, %1, zero\n"
+			".word 0x16B50073\n"
+			:: "r" (vma), "r" (asid)
+			: "a0", "a1", "memory");
+}
+
+static inline void riscv_sinval_vma(unsigned long vma)
+{
+	/*
+	 * rs1 = a0 (VMA)
+	 * rs2 = 0
+	 * SINVAL.VMA a0
+	 * 0001011 00000 01010 000 00000 1110011
+	 */
+	asm volatile ("srli a0, %0, 2\n"
+			".word 0x16050073\n"
+			:: "r" (vma) : "a0", "memory");
+}
+
 static inline void local_flush_tlb_range(unsigned long start,
 		unsigned long size, unsigned long stride)
 {
-	if (size <= stride)
-		local_flush_tlb_page(start);
-	else
+	if ((size / stride) <= tlb_flush_all_threshold) {
+		if (riscv_use_flush_tlb_svinval()) {
+			riscv_sfence_w_inval();
+			while (size) {
+				riscv_sinval_vma(start);
+				start += stride;
+				if (size > stride)
+					size -= stride;
+				else
+					size = 0;
+			}
+			riscv_sfence_inval_ir();
+		} else {
+			while (size) {
+				local_flush_tlb_page(start);
+				start += stride;
+				if (size > stride)
+					size -= stride;
+				else
+					size = 0;
+			}
+		}
+	} else {
 		local_flush_tlb_all();
+	}
 }
 
 static inline void local_flush_tlb_range_asid(unsigned long start,
 		unsigned long size, unsigned long stride, unsigned long asid)
 {
-	if (size <= stride)
-		local_flush_tlb_page_asid(start, asid);
-	else
+	if ((size / stride) <= tlb_flush_all_threshold) {
+		if (riscv_use_flush_tlb_svinval()) {
+			riscv_sfence_w_inval();
+			while (size) {
+				riscv_sinval_vma_asid(start, asid);
+				start += stride;
+				if (size > stride)
+					size -= stride;
+				else
+					size = 0;
+			}
+			riscv_sfence_inval_ir();
+		} else {
+			while (size) {
+				local_flush_tlb_page_asid(start, asid);
+				start += stride;
+				if (size > stride)
+					size -= stride;
+				else
+					size = 0;
+			}
+		}
+	} else {
 		local_flush_tlb_all_asid(asid);
+	}
 }
 
 static void __ipi_flush_tlb_all(void *info)
@@ -149,3 +240,16 @@ void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 	__flush_tlb_range(vma->vm_mm, start, end - start, PMD_SIZE);
 }
 #endif
+
+DEFINE_STATIC_KEY_FALSE(riscv_flush_tlb_svinval);
+EXPORT_SYMBOL_GPL(riscv_flush_tlb_svinval);
+
+void riscv_tlbflush_init(void)
+{
+	if (riscv_isa_extension_available(NULL, SVINVAL)) {
+		pr_info("Svinval extension supported\n");
+		static_branch_enable(&riscv_flush_tlb_svinval);
+	} else {
+		static_branch_disable(&riscv_flush_tlb_svinval);
+	}
+}
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
