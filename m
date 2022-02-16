Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E193C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 05:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HpUuWP8Buuo8bu6SLSEIOCiKNRQB6eId7h0crs60q20=; b=oU0jYxclYnWkKx
	lUFGCBy0P1gF6REZjmUuwcrp7+GJFsFTL+NKu0Mesfdzwg2NPMcc914c2eOfsYrCPWlNjXnkvJ0wa
	WxX57ML/JZJwaB+0NkHgDkABRIQhhNzPb6BMoBidAp39dZv8ozLqG0d3Lot9/a7SIsLdi52MoYFIf
	Ugc2jPQ4O8duGgfmNFR1mSId8zF2IA8h86I1LVzsX0WbaXmEzdxSNzax0wboYGlHo6gMThbRKarLk
	e9bQuDnreHb2SaggU9lmDX1tTk4yZinmp2b4XaxU85vmlD3yI6hOdZLh8HxK2IHXIvMWjGXmlTO+1
	ptlt63XRmZCy3WRbvaDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKClU-005aGQ-8c; Wed, 16 Feb 2022 05:22:08 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKClR-005aFY-AX
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 05:22:07 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 k60-20020a17090a4cc200b001b932781f3eso3574997pjh.0
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 21:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Xqqhi8fogx+j8zYjiaq4nvXJRMBIRlwUENP/w8+fQA=;
 b=Za6Z2XMNRyRjgqlDlQ8Ys1YDy73TTFCUMsbPBCBvjncBolqQpeqcN0PeSQumJPTKR1
 PwWMMJTSswr7DIn9CLb34gpze7jjiiRpy1KxPu0cYtw6VsX5ghkjMvgFoqiIjChTlqhb
 QenekP4kI2CtQbms/lCCdCb4LCxcc0G6GrnQQe2u/E8idrmPD2ny9EvlEsZzEYRsuIYc
 sG92LGfci/Nm4AFZzgoJIlAfI5O+zd0bB6aFmT76dRtuMV3pWIiOHxrwmzBrXChS8Yzl
 7uf0LX4bl20i2dNL0fmxLia0EB8BAT/j+GO65tkun4iVSkKdmOvLF+SPc+XCCkyUOUle
 +v9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Xqqhi8fogx+j8zYjiaq4nvXJRMBIRlwUENP/w8+fQA=;
 b=VYWAQQHo7MhxlsOfr7mUpmEIxBGzUMHsCfUbsvkecyAu6hkmpzGNrNrvf9I+DPrf78
 4y3kVAa8qdT6OnVybL01VXDF5dIwqN8fQ4x8Qx7nZtP7bM6zYSpCMyWVeJwEG6V9pz0+
 RbCA+BqqXi+GE5XAhH49DsAoI7EykOqnl/ZeDPIzKoWbT6UYZY2o+LfNmbTvwYLAM6Uz
 FpXv2tTvM8Z1dfFOf95T/3o2cQJCukJxmPFJV9C7P8qf/wskJQRfdkEN9oebXiVwD2JF
 /ZyK+IWz808iYhEQwYGl4xNrP3TmflW26Tkv58871y1J0/hK4Ce8W6qTh3ZOyVAxSKZu
 SQkQ==
X-Gm-Message-State: AOAM530xW27aRWnNa0lErDdu630GMKWIOMCd2rwqDWg5+lcq1i/jm+zg
 6a+jcUAvrp1iCoGDzDyYgPO+SQ==
X-Google-Smtp-Source: ABdhPJwBtBVhI3ehd9nHd0bvhj2JtqK5iM5/MfuMDSYVf/7QH0KPYM7UuDIeMXajjgtE3+7ELzrYSw==
X-Received: by 2002:a17:90b:3b52:b0:1b9:cb97:6f0 with SMTP id
 ot18-20020a17090b3b5200b001b9cb9706f0mr8091769pjb.191.1644988924193; 
 Tue, 15 Feb 2022 21:22:04 -0800 (PST)
Received: from localhost.localdomain ([117.248.109.221])
 by smtp.gmail.com with ESMTPSA id ot12sm10775259pjb.22.2022.02.15.21.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 21:22:03 -0800 (PST)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	paul.walmsley@sifive.com
Cc: anup@brainfault.org, atishp@rivosinc.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [RFC PATCH 2/2] riscv: mm: use svinval instructions instead of
 sfence.vma
Date: Wed, 16 Feb 2022 10:51:10 +0530
Message-Id: <20220216052110.1053665-3-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220216052110.1053665-1-mchitale@ventanamicro.com>
References: <20220216052110.1053665-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_212205_390546_377DA751 
X-CRM114-Status: GOOD (  21.10  )
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
limited to PTRS_PER_PTE. This is required to avoid soft
lockups and the approach is similar to that used in arm64.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 arch/riscv/include/asm/tlbflush.h | 14 +++++++
 arch/riscv/kernel/setup.c         |  1 +
 arch/riscv/mm/Makefile            |  1 +
 arch/riscv/mm/tlb.S               | 53 +++++++++++++++++++++++
 arch/riscv/mm/tlbflush.c          | 70 ++++++++++++++++++++++++++++---
 5 files changed, 133 insertions(+), 6 deletions(-)
 create mode 100644 arch/riscv/mm/tlb.S

diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 801019381dea..9256a1c2ee03 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -22,9 +22,23 @@ static inline void local_flush_tlb_page(unsigned long addr)
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
+#define riscv_use_flush_tlb_svinval()		do { } while (0)
+#define riscv_tlbflush_init()			do { } while (0)
 #endif /* CONFIG_MMU */
 
 #if defined(CONFIG_SMP) && defined(CONFIG_MMU)
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index b42bfdc67482..5dc79288b0ad 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -295,6 +295,7 @@ void __init setup_arch(char **cmdline_p)
 #endif
 
 	riscv_fill_hwcap();
+	riscv_tlbflush_init();
 }
 
 static int __init topology_init(void)
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 7ebaef10ea1b..d3a14d4d144e 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -16,6 +16,7 @@ obj-y += context.o
 
 ifeq ($(CONFIG_MMU),y)
 obj-$(CONFIG_SMP) += tlbflush.o
+obj-$(CONFIG_SMP) += tlb.o
 endif
 obj-$(CONFIG_HUGETLB_PAGE) += hugetlbpage.o
 obj-$(CONFIG_PTDUMP_CORE) += ptdump.o
diff --git a/arch/riscv/mm/tlb.S b/arch/riscv/mm/tlb.S
new file mode 100644
index 000000000000..a530a9012c43
--- /dev/null
+++ b/arch/riscv/mm/tlb.S
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022 Ventana Micro Sytems.
+ *
+ * Authors:
+ *     Mayuresh Chitale <mchitale@ventanamicro.com>
+ */
+
+#include <linux/linkage.h>
+#include <asm/asm.h>
+
+       .text
+       .altmacro
+       .option norelax
+
+
+ENTRY(__riscv_sfence_w_inval)
+       /*
+        * SFENCE.W.INVAL
+        * 0001100 00000 00000 000 00000 1110011
+        */
+       .word 0x18000073
+       ret
+ENDPROC(__riscv_sfence_w_inval)
+
+ENTRY(__riscv_sfence_inval_ir)
+       /*
+        * SFENCE.INVAL.IR
+        * 0001100 00001 00000 000 00000 1110011
+        */
+       .word 0x18100073
+       ret
+ENDPROC(__riscv_sfence_inval_ir)
+ENTRY(__riscv_sinval_vma_asid)
+       /*
+        * rs1 = VMA
+        * rs2 = asid
+        * SFENCE.W.INVAL
+        * 0001011 01011 01010 000 00000 1110011
+        */
+       .word 0x16B50073
+       ret
+ENDPROC(__riscv_sinval_vma_asid)
+ENTRY(__riscv_sinval_vma)
+       /*
+        * rs1 = vma
+        * rs2 = 0
+        * SFENCE.W.INVAL
+        * 0001011 00000 01010 000 00000 1110011
+        */
+       .word 0x16050073
+       ret
+ENDPROC(__riscv_sinval_vma)
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 27a7db8eb2c4..a4659f31b7a1 100644
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
@@ -26,19 +29,61 @@ static inline void local_flush_tlb_page_asid(unsigned long addr,
 static inline void local_flush_tlb_range(unsigned long start,
 		unsigned long size, unsigned long stride)
 {
-	if (size <= stride)
-		local_flush_tlb_page(start);
-	else
+	if ((size / stride) <= tlb_flush_all_threshold) {
+		if (riscv_use_flush_tlb_svinval()) {
+			__riscv_sfence_w_inval();
+			while (size) {
+				__riscv_sinval_vma(start);
+				start += stride;
+				if (size > stride)
+					size -= stride;
+				else
+					size = 0;
+			}
+			__riscv_sfence_inval_ir();
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
+			__riscv_sfence_w_inval();
+			while (size) {
+				__riscv_sinval_vma_asid(start, asid);
+				start += stride;
+				if (size > stride)
+					size -= stride;
+				else
+					size = 0;
+			}
+			__riscv_sfence_inval_ir();
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
@@ -149,3 +194,16 @@ void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
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
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
