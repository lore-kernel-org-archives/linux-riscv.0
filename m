Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11526C61DB3
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 18:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qVMkuDiLjsmjhhOLQ9bWRPQJ9se5zUNkgZBH2N4cD2M=; b=JjHaExSikrN7u8
	qfpRAM5sCwOnnkWnrXvzACjBquDQO58Ezda1Zq7InDx70viHP0E/mgkwtGU0bzKIQWiF5hGX7gPcj
	08HjsX0ngGYhu8wclt5AD0vPzpSz6HRxDYhVu4Vcf2CjGZpoZx7j3dWcQVk5RA/YRL795r8ZiCn6o
	GGTnl87yK1hYIwqinCNaB6jM+w6meLA7+8fTK2+POF1Uononf4p+eRqsUSF3EmEjWT7KX5pzyDp+n
	tHn235zUIZVscgPnHmDkwARUtsn/Q2tmrBcv69WkUVkRrhI5+KmiE7VrgWV9noTzczwRQ6Il99vq/
	thrIR7keNgUMWX8apnxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDrtZ-00EUol-Sz; Fri, 06 Jan 2023 18:56:49 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDrtW-00EUmz-CO
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 18:56:48 +0000
Received: by mail-wm1-x332.google.com with SMTP id c65-20020a1c3544000000b003cfffd00fc0so4214594wma.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jan 2023 10:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fytoxfbVyhzw3oYgb9/5IetT27jN/7bU1WOjby5UEbM=;
        b=HWYSltOTDvVHev46b9ZjNOdrBzsVuurJsvKeiEdHHZJnvkdCXfCJ3cGNuEMbdU1rMa
         NJ4AxYZ9kTXA+ijk8iqdoRiacDssEkQhG0PP+dqs0xQOmQtpLfmZTszy2GXs3cC63zM3
         pYnhBt4FZsRXxiTYrFLd0MqWArQNHdCGEIWMTN2STgNx95HmG7DAza34CkO65OvTXIsm
         ps+twxOWM0XhyF7pJE89Ds4dnsGX+4m9kkMIM1UOwqRUD0Rz3/PE0/VptsoyCHFTzDMZ
         z1sDVUBV8aECA5pP1M7ysCuJAcUSuv1VeAoS2+DpqgbqcxGnoj06qtZDQXF7HA+4cZBh
         6QAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fytoxfbVyhzw3oYgb9/5IetT27jN/7bU1WOjby5UEbM=;
        b=sdai2LzVh1MaBWlaDh9sJRJJi/AWUQb8ppVD7PmaRylDQezh96Culhcp9QfDcMvlfl
         tNKCjj8t+du7XKp+3sNw0OL7pzB5DI0QYemh1glEkoYqLFJdVlzz+WbZboe8hzPp1nrH
         B5o1MNDZ/35VFxGrl0Zdw6BKtFdrSs69BSL66um0YazLiZ0sgClvWTgnrDJjZh+h0ldS
         jFgN7GyvIO2b9wFcj+nVoRtmcHCgFDPZKOfzWUaw9+7FcJkiB8qW8eFONhrsZHCHa9tS
         ApJObfTYX29RWfaakp2338yojtNw1KyOvGvhjWyGE4sYZb2Y3YwHuHbaD2Kj83JgM3/Z
         qSJA==
X-Gm-Message-State: AFqh2krHMcpo4U1hbzGCnPZJ2UHyas5TQI5lv2fHgL7ksg3B/UYGSdvn
	AVr5sQDwKCR2teVOemuwkhk=
X-Google-Smtp-Source: AMrXdXsDjbzb/erovCYrYQQtP33v6JsTdksADypZXY6br3uQgvaqU372fQSl9PVNxNOBpqoc4B99fw==
X-Received: by 2002:a05:600c:4a9b:b0:3d1:dc6f:b1a4 with SMTP id b27-20020a05600c4a9b00b003d1dc6fb1a4mr48998129wmp.5.1673031404041;
        Fri, 06 Jan 2023 10:56:44 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:79e8:5b4e:615a:91cd])
        by smtp.gmail.com with ESMTPSA id d8-20020a05600c34c800b003c5571c27a1sm3162773wmq.32.2023.01.06.10.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 10:56:43 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [RFC PATCH v6 1/6] riscv: mm: dma-noncoherent: Switch using function pointers for cache management
Date: Fri,  6 Jan 2023 18:55:21 +0000
Message-Id: <20230106185526.260163-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230106185526.260163-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230106185526.260163-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_105646_457385_6D847A3A 
X-CRM114-Status: GOOD (  20.74  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The current implementation of CMO was handled using the ALTERNATIVE_X()
macro; this was manageable when there were a limited number of platforms
using this. Now that we are having more and more platforms coming through
with the CMO the use of the ALTERNATIVE_X() macro becomes unmanageable.

To avoid such issues this patch switches to use of function pointers
instead of ALTERNATIVE_X() macro for cache management (the only draw being
performance over the previous approach).

void (*clean_range)(unsigned long addr, unsigned long size);
void (*inv_range)(unsigned long addr, unsigned long size);
void (*flush_range)(unsigned long addr, unsigned long size);

The above function pointers are provided to be overridden where platforms
using standard approach and for platforms who want handle the operation
based on the operation the below function pointer is provided:

void (*riscv_dma_noncoherent_cmo_ops)(void *vaddr, size_t size,
                                      enum dma_data_direction dir,
                                      enum dma_noncoherent_ops ops);

In the current patch we have moved the ZICBOM and T-Head CMO to use
function pointers.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v5->v6
* New patch
---
 arch/riscv/errata/thead/errata.c         | 71 ++++++++++++++++++
 arch/riscv/include/asm/dma-noncoherent.h | 83 +++++++++++++++++++++
 arch/riscv/include/asm/errata_list.h     | 53 -------------
 arch/riscv/kernel/cpufeature.c           |  2 +
 arch/riscv/mm/dma-noncoherent.c          | 94 ++++++++++++++++++++++--
 arch/riscv/mm/pmem.c                     | 18 ++++-
 6 files changed, 260 insertions(+), 61 deletions(-)
 create mode 100644 arch/riscv/include/asm/dma-noncoherent.h

diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index fac5742d1c1e..826b2ba3e61e 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -8,12 +8,72 @@
 #include <linux/module.h>
 #include <linux/string.h>
 #include <linux/uaccess.h>
+#include <asm/dma-noncoherent.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
 #include <asm/errata_list.h>
 #include <asm/patch.h>
 #include <asm/vendorid_list.h>
 
+#ifdef CONFIG_ERRATA_THEAD_CMO
+/*
+ * dcache.ipa rs1 (invalidate, physical address)
+ * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
+ *   0000001    01010      rs1       000      00000  0001011
+ * dache.iva rs1 (invalida, virtual address)
+ *   0000001    00110      rs1       000      00000  0001011
+ *
+ * dcache.cpa rs1 (clean, physical address)
+ * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
+ *   0000001    01001      rs1       000      00000  0001011
+ * dcache.cva rs1 (clean, virtual address)
+ *   0000001    00100      rs1       000      00000  0001011
+ *
+ * dcache.cipa rs1 (clean then invalidate, physical address)
+ * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
+ *   0000001    01011      rs1       000      00000  0001011
+ * dcache.civa rs1 (... virtual address)
+ *   0000001    00111      rs1       000      00000  0001011
+ *
+ * sync.s (make sure all cache operations finished)
+ * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
+ *   0000000    11001     00000      000      00000  0001011
+ */
+#define THEAD_inval_A0	".long 0x0265000b"
+#define THEAD_clean_A0	".long 0x0245000b"
+#define THEAD_flush_A0	".long 0x0275000b"
+#define THEAD_SYNC_S	".long 0x0190000b"
+
+#define THEAD_CMO_OP(_op, _start, _size, _cachesize)				\
+	asm volatile("mv a0, %1\n\t"						\
+		     "j 2f\n\t"							\
+		     "3:\n\t"							\
+		     THEAD_##_op##_A0 "\n\t"					\
+		     "add a0, a0, %0\n\t"					\
+		     "2:\n\t"							\
+		     "bltu a0, %2, 3b\n\t"					\
+		     THEAD_SYNC_S						\
+		     : : "r"(_cachesize),					\
+			 "r"((unsigned long)(_start) & ~((_cachesize) - 1UL)),	\
+			 "r"((unsigned long)(_start) + (_size))			\
+		     : "a0")
+
+static void thead_cmo_clean_range(unsigned long addr, unsigned long size)
+{
+	THEAD_CMO_OP(clean, addr, size, riscv_cbom_block_size);
+}
+
+static void thead_cmo_flush_range(unsigned long addr, unsigned long size)
+{
+	THEAD_CMO_OP(flush, addr, size, riscv_cbom_block_size);
+}
+
+static void thead_cmo_inval_range(unsigned long addr, unsigned long size)
+{
+	THEAD_CMO_OP(inval, addr, size, riscv_cbom_block_size);
+}
+#endif
+
 static bool errata_probe_pbmt(unsigned int stage,
 			      unsigned long arch_id, unsigned long impid)
 {
@@ -33,6 +93,8 @@ static bool errata_probe_pbmt(unsigned int stage,
 static bool errata_probe_cmo(unsigned int stage,
 			     unsigned long arch_id, unsigned long impid)
 {
+	struct riscv_cache_ops thead_cmo_ops;
+
 	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_CMO))
 		return false;
 
@@ -44,6 +106,15 @@ static bool errata_probe_cmo(unsigned int stage,
 
 	riscv_cbom_block_size = L1_CACHE_BYTES;
 	riscv_noncoherent_supported();
+
+	memset(&thead_cmo_ops, 0x0, sizeof(thead_cmo_ops));
+	if (IS_ENABLED(CONFIG_ERRATA_THEAD_CMO)) {
+		thead_cmo_ops.clean_range = &thead_cmo_clean_range;
+		thead_cmo_ops.inv_range = &thead_cmo_inval_range;
+		thead_cmo_ops.flush_range = &thead_cmo_flush_range;
+		riscv_noncoherent_register_cache_ops(&thead_cmo_ops);
+	}
+
 	return true;
 }
 
diff --git a/arch/riscv/include/asm/dma-noncoherent.h b/arch/riscv/include/asm/dma-noncoherent.h
new file mode 100644
index 000000000000..a2af863d2608
--- /dev/null
+++ b/arch/riscv/include/asm/dma-noncoherent.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+#ifndef __ASM_DMA_NONCOHERENT_H
+#define __ASM_DMA_NONCOHERENT_H
+
+#include <linux/dma-direct.h>
+
+enum dma_noncoherent_ops {
+	NON_COHERENT_SYNC_DMA_FOR_DEVICE = 0,
+	NON_COHERENT_SYNC_DMA_FOR_CPU,
+	NON_COHERENT_DMA_PREP,
+	NON_COHERENT_DMA_PMEM,
+};
+
+/*
+ * struct riscv_cache_ops - Structure for CMO function pointers
+ * @clean_range: Function pointer for clean cache
+ * @inv_range: Function pointer for invalidate cache
+ * @flush_range: Function pointer for flushing the cache
+ * @riscv_dma_noncoherent_cmo_ops: Function pointer for platforms who want
+ *  to handle CMO themselves. If this function pointer is set rest of the
+ *  function pointers will be NULL.
+ */
+struct riscv_cache_ops {
+	void (*clean_range)(unsigned long addr, unsigned long size);
+	void (*inv_range)(unsigned long addr, unsigned long size);
+	void (*flush_range)(unsigned long addr, unsigned long size);
+	void (*riscv_dma_noncoherent_cmo_ops)(void *vaddr, size_t size,
+					      enum dma_data_direction dir,
+					      enum dma_noncoherent_ops ops);
+};
+
+extern struct riscv_cache_ops zicbom_cmo_ops;
+
+#ifdef CONFIG_RISCV_DMA_NONCOHERENT
+
+extern struct riscv_cache_ops noncoherent_cache_ops;
+
+void riscv_noncoherent_register_cache_ops(struct riscv_cache_ops *ops);
+
+static inline void riscv_dma_noncoherent_clean(void *vaddr, size_t size)
+{
+	if (noncoherent_cache_ops.clean_range) {
+		unsigned long addr = (unsigned long)vaddr;
+
+		noncoherent_cache_ops.clean_range(addr, size);
+	}
+}
+
+static inline void riscv_dma_noncoherent_flush(void *vaddr, size_t size)
+{
+	if (noncoherent_cache_ops.flush_range) {
+		unsigned long addr = (unsigned long)vaddr;
+
+		noncoherent_cache_ops.flush_range(addr, size);
+	}
+}
+
+static inline void riscv_dma_noncoherent_inval(void *vaddr, size_t size)
+{
+	if (noncoherent_cache_ops.inv_range) {
+		unsigned long addr = (unsigned long)vaddr;
+
+		noncoherent_cache_ops.inv_range(addr, size);
+	}
+}
+
+#else
+
+static void riscv_noncoherent_register_cache_ops(struct riscv_cache_ops *ops) {}
+
+static inline void riscv_dma_noncoherent_clean(void *vaddr, size_t size) {}
+
+static inline void riscv_dma_noncoherent_flush(void *vaddr, size_t size) {}
+
+static inline void riscv_dma_noncoherent_inval(void *vaddr, size_t size) {}
+
+#endif
+
+#endif	/* __ASM_DMA_NONCOHERENT_H */
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 4180312d2a70..ae3fc8b80edd 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -91,59 +91,6 @@ asm volatile(ALTERNATIVE(						\
 #define ALT_THEAD_PMA(_val)
 #endif
 
-/*
- * dcache.ipa rs1 (invalidate, physical address)
- * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
- *   0000001    01010      rs1       000      00000  0001011
- * dache.iva rs1 (invalida, virtual address)
- *   0000001    00110      rs1       000      00000  0001011
- *
- * dcache.cpa rs1 (clean, physical address)
- * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
- *   0000001    01001      rs1       000      00000  0001011
- * dcache.cva rs1 (clean, virtual address)
- *   0000001    00100      rs1       000      00000  0001011
- *
- * dcache.cipa rs1 (clean then invalidate, physical address)
- * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
- *   0000001    01011      rs1       000      00000  0001011
- * dcache.civa rs1 (... virtual address)
- *   0000001    00111      rs1       000      00000  0001011
- *
- * sync.s (make sure all cache operations finished)
- * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
- *   0000000    11001     00000      000      00000  0001011
- */
-#define THEAD_inval_A0	".long 0x0265000b"
-#define THEAD_clean_A0	".long 0x0245000b"
-#define THEAD_flush_A0	".long 0x0275000b"
-#define THEAD_SYNC_S	".long 0x0190000b"
-
-#define ALT_CMO_OP(_op, _start, _size, _cachesize)			\
-asm volatile(ALTERNATIVE_2(						\
-	__nops(6),							\
-	"mv a0, %1\n\t"							\
-	"j 2f\n\t"							\
-	"3:\n\t"							\
-	"cbo." __stringify(_op) " (a0)\n\t"				\
-	"add a0, a0, %0\n\t"						\
-	"2:\n\t"							\
-	"bltu a0, %2, 3b\n\t"						\
-	"nop", 0, CPUFEATURE_ZICBOM, CONFIG_RISCV_ISA_ZICBOM,		\
-	"mv a0, %1\n\t"							\
-	"j 2f\n\t"							\
-	"3:\n\t"							\
-	THEAD_##_op##_A0 "\n\t"						\
-	"add a0, a0, %0\n\t"						\
-	"2:\n\t"							\
-	"bltu a0, %2, 3b\n\t"						\
-	THEAD_SYNC_S, THEAD_VENDOR_ID,					\
-			ERRATA_THEAD_CMO, CONFIG_ERRATA_THEAD_CMO)	\
-	: : "r"(_cachesize),						\
-	    "r"((unsigned long)(_start) & ~((_cachesize) - 1UL)),	\
-	    "r"((unsigned long)(_start) + (_size))			\
-	: "a0")
-
 #define THEAD_C9XX_RV_IRQ_PMU			17
 #define THEAD_C9XX_CSR_SCOUNTEROF		0x5c5
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 205bbd6b1fce..d94d32eb7faf 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
+#include <asm/dma-noncoherent.h>
 #include <asm/errata_list.h>
 #include <asm/hwcap.h>
 #include <asm/patch.h>
@@ -298,6 +299,7 @@ static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
 		return false;
 
 	riscv_noncoherent_supported();
+	riscv_noncoherent_register_cache_ops(&zicbom_cmo_ops);
 	return true;
 }
 
diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index d919efab6eba..d9445c266bfd 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -9,23 +9,82 @@
 #include <linux/dma-map-ops.h>
 #include <linux/mm.h>
 #include <asm/cacheflush.h>
+#include <asm/dma-noncoherent.h>
 
 static bool noncoherent_supported;
 
+struct riscv_cache_ops noncoherent_cache_ops = {
+	.clean_range = NULL,
+	.inv_range = NULL,
+	.flush_range = NULL,
+	.riscv_dma_noncoherent_cmo_ops = NULL,
+};
+EXPORT_SYMBOL(noncoherent_cache_ops);
+
+#ifdef CONFIG_RISCV_ISA_ZICBOM
+#define ZICBOM_CMO_OP(_op, _start, _size, _cachesize)				\
+	asm volatile("mv a0, %1\n\t"						\
+		     "j 2f\n\t"							\
+		     "3:\n\t"							\
+		     "cbo." __stringify(_op) " (a0)\n\t"			\
+		     "add a0, a0, %0\n\t"					\
+		     "2:\n\t"							\
+		     "bltu a0, %2, 3b\n\t"					\
+		     : : "r"(_cachesize),					\
+			 "r"((unsigned long)(_start) & ~((_cachesize) - 1UL)),	\
+			 "r"((unsigned long)(_start) + (_size))			\
+		     : "a0")
+
+static void zicbom_cmo_clean_range(unsigned long addr, unsigned long size)
+{
+	ZICBOM_CMO_OP(clean, addr, size, riscv_cbom_block_size);
+}
+
+static void zicbom_cmo_flush_range(unsigned long addr, unsigned long size)
+{
+	ZICBOM_CMO_OP(flush, addr, size, riscv_cbom_block_size);
+}
+
+static void zicbom_cmo_inval_range(unsigned long addr, unsigned long size)
+{
+	ZICBOM_CMO_OP(inval, addr, size, riscv_cbom_block_size);
+}
+
+struct riscv_cache_ops zicbom_cmo_ops = {
+	.clean_range = &zicbom_cmo_clean_range,
+	.inv_range = &zicbom_cmo_inval_range,
+	.flush_range = &zicbom_cmo_flush_range,
+};
+#else
+struct riscv_cache_ops zicbom_cmo_ops = {
+	.clean_range = NULL,
+	.inv_range = NULL,
+	.flush_range = NULL,
+	.riscv_dma_noncoherent_cmo_ops = NULL,
+};
+#endif
+EXPORT_SYMBOL(zicbom_cmo_ops);
+
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 			      enum dma_data_direction dir)
 {
 	void *vaddr = phys_to_virt(paddr);
 
+	if (noncoherent_cache_ops.riscv_dma_noncoherent_cmo_ops) {
+		noncoherent_cache_ops.riscv_dma_noncoherent_cmo_ops(vaddr, size, dir,
+								    NON_COHERENT_SYNC_DMA_FOR_DEVICE);
+		return;
+	}
+
 	switch (dir) {
 	case DMA_TO_DEVICE:
-		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
+		riscv_dma_noncoherent_clean(vaddr, size);
 		break;
 	case DMA_FROM_DEVICE:
-		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
+		riscv_dma_noncoherent_clean(vaddr, size);
 		break;
 	case DMA_BIDIRECTIONAL:
-		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
+		riscv_dma_noncoherent_flush(vaddr, size);
 		break;
 	default:
 		break;
@@ -37,12 +96,18 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 {
 	void *vaddr = phys_to_virt(paddr);
 
+	if (noncoherent_cache_ops.riscv_dma_noncoherent_cmo_ops) {
+		noncoherent_cache_ops.riscv_dma_noncoherent_cmo_ops(vaddr, size, dir,
+								    NON_COHERENT_SYNC_DMA_FOR_CPU);
+		return;
+	}
+
 	switch (dir) {
 	case DMA_TO_DEVICE:
 		break;
 	case DMA_FROM_DEVICE:
 	case DMA_BIDIRECTIONAL:
-		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
+		riscv_dma_noncoherent_flush(vaddr, size);
 		break;
 	default:
 		break;
@@ -53,7 +118,13 @@ void arch_dma_prep_coherent(struct page *page, size_t size)
 {
 	void *flush_addr = page_address(page);
 
-	ALT_CMO_OP(flush, flush_addr, size, riscv_cbom_block_size);
+	if (noncoherent_cache_ops.riscv_dma_noncoherent_cmo_ops) {
+		noncoherent_cache_ops.riscv_dma_noncoherent_cmo_ops(flush_addr, size, -1,
+								    NON_COHERENT_DMA_PREP);
+		return;
+	}
+
+	riscv_dma_noncoherent_flush(flush_addr, size);
 }
 
 void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
@@ -78,3 +149,16 @@ void riscv_noncoherent_supported(void)
 	     "Non-coherent DMA support enabled without a block size\n");
 	noncoherent_supported = true;
 }
+
+void riscv_noncoherent_register_cache_ops(struct riscv_cache_ops *ops)
+{
+	if (!ops)
+		return;
+
+	if (ops->riscv_dma_noncoherent_cmo_ops)
+		noncoherent_cache_ops.riscv_dma_noncoherent_cmo_ops =
+				ops->riscv_dma_noncoherent_cmo_ops;
+	else
+		noncoherent_cache_ops = *ops;
+}
+EXPORT_SYMBOL(riscv_noncoherent_register_cache_ops);
diff --git a/arch/riscv/mm/pmem.c b/arch/riscv/mm/pmem.c
index 089df92ae876..cd5aa6f42851 100644
--- a/arch/riscv/mm/pmem.c
+++ b/arch/riscv/mm/pmem.c
@@ -6,16 +6,28 @@
 #include <linux/export.h>
 #include <linux/libnvdimm.h>
 
-#include <asm/cacheflush.h>
+#include <asm/dma-noncoherent.h>
 
 void arch_wb_cache_pmem(void *addr, size_t size)
 {
-	ALT_CMO_OP(clean, addr, size, riscv_cbom_block_size);
+	if (noncoherent_cache_ops.riscv_dma_noncoherent_cmo_ops) {
+		noncoherent_cache_ops.riscv_dma_noncoherent_cmo_ops(addr, size,
+								    -1, NON_COHERENT_DMA_PMEM);
+		return;
+	}
+
+	riscv_dma_noncoherent_clean(addr, size);
 }
 EXPORT_SYMBOL_GPL(arch_wb_cache_pmem);
 
 void arch_invalidate_pmem(void *addr, size_t size)
 {
-	ALT_CMO_OP(inval, addr, size, riscv_cbom_block_size);
+	if (noncoherent_cache_ops.riscv_dma_noncoherent_cmo_ops) {
+		noncoherent_cache_ops.riscv_dma_noncoherent_cmo_ops(addr, size,
+								    -1, NON_COHERENT_DMA_PMEM);
+		return;
+	}
+
+	riscv_dma_noncoherent_inval(addr, size);
 }
 EXPORT_SYMBOL_GPL(arch_invalidate_pmem);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
