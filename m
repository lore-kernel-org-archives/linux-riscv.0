Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D482C7113C
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 13:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Jdseh2UihUeMxNh5ZcvolzlQG1bnNCi39ce+XyELVE=; b=D52eWKMGEQ2Vcd
	6dG1CFyb+ZwFd2AV1z4GLL7bNe5TiDJdHUsxq5vpi8XotGFbHKkWdtgmXZql4cMSKFbOo1N/9NyCH
	XPr0JexV02ypHQswrtYYx+ejLNGPyqlEVrZoNVgXP4v5RTg1tgN+BxuACeCxRlDSXKqbCMTZSA6nX
	DeXqYOJ28zLA3YQ20EA4TPCW2C6TUyxuPYy1sSzyAZiOEE8KZSnd/uQEdEZYJLmgop74r2CWO246K
	gYy0tQDJUIcTnJ5Bl/usVehJaV2NyaBnPc8IqxVN4QSn9CQNXFBIra6csauBaNvVUzoAO0i3rLtGf
	irM+tA3aMNXF8HVjfhSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWzz4-009RGx-22;
	Fri, 18 Aug 2023 13:57:50 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWzyy-009RBN-1H
	for linux-riscv@lists.infradead.org;
	Fri, 18 Aug 2023 13:57:46 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fe4cdb72b9so9268345e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 18 Aug 2023 06:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692367061; x=1692971861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Px92ERlElc4wesNBWinjmIr2HCi2x9DQzB2ZaP/fD6k=;
        b=fb8BqnyvjYGtA3NTQlNXnTM1J9GEa987M4uuKcyZ8LfmzHOEhBqGBxfTfi8pX1Pmo3
         NVxLNX07rxCDH/E6cJIeODtsSSPisX3NbX3ha/s1qA657Bn4LVsxlq65TMfsXjLaxX7Q
         gBe9w4whRXlAwBU/dr9Msx1CnVXSe5sAFPUhiEIUN684vQtRTCR5Q+K/TWPeadInV4eY
         IIpj58A0woHXiXHIynwHIBUafMnpCSbrKF+8tx3XOIYR4HPplM8qwEJ3VTkMdSFIje5y
         fuMcl6mlik4BaGNOz2mZYI1j/sRhqiodZ7vFBB+LMjEFs81/Rk6WSPpzhEjV/ycN1DQs
         NKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692367061; x=1692971861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Px92ERlElc4wesNBWinjmIr2HCi2x9DQzB2ZaP/fD6k=;
        b=Uvf3l39L1iAoGM9yOjxlw0WyVmF8Fp+ZQ0HW7vYKLd1NREGk4wTixJDohbGb8fJbDV
         hJ15BQ0X3Kk9dnZ2Nonz1TKX4rahh039AMjhhdAvZwZfmjVE2uii+HgEKeJm87t3cmVV
         qOran+jtr+g5V2i/CowLsTc8/EfomDE78YCjajAdtgwcJhTmLevEIOUEtBuQKatlh9d2
         ZfXvU6JbFBNFiFw9cAKIiqpl+OFzFq23cgjAMzJ3ox8bpqw9KAD9XI6nG+hHvvFZfmk0
         cT47HpBhPcbP/VR9xa88GY1xBuGkWtaFBE7rY2F2zxAU/T3ZNUuJ/nE0i6yEAQTdsgrp
         2NHw==
X-Gm-Message-State: AOJu0Yy+gjdSQUUOx/8LYNUdKWp3nHGt0XI6aAYyybqiABGWLKt/6/qy
	aa2+PZ6BiXj31L4xPOcGY6s=
X-Google-Smtp-Source: AGHT+IHxobRI9e/jvEGblmCFX7B1XfOEPH2YhJ8+NawIAgryjWzb0wx6Adb++1SYwZFIml/u0vl+bg==
X-Received: by 2002:a1c:f701:0:b0:3fe:18d8:a61b with SMTP id v1-20020a1cf701000000b003fe18d8a61bmr2309081wmh.29.1692367060277;
        Fri, 18 Aug 2023 06:57:40 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:4b30:13e8:1d57:42fb])
        by smtp.gmail.com with ESMTPSA id s14-20020a05600c044e00b003fa96fe2bd9sm6444055wmb.22.2023.08.18.06.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 06:57:39 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v12 3/6] riscv: mm: dma-noncoherent: nonstandard cache operations support
Date: Fri, 18 Aug 2023 14:57:20 +0100
Message-Id: <20230818135723.80612-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818135723.80612-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230818135723.80612-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_065744_436811_6989BED1 
X-CRM114-Status: GOOD (  19.85  )
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

Introduce support for nonstandard noncoherent systems in the RISC-V
architecture. It enables function pointer support to handle cache
management in such systems.

This patch adds a new configuration option called
"RISCV_NONSTANDARD_CACHE_OPS." This option is a boolean flag that
depends on "RISCV_DMA_NONCOHERENT" and enables the function pointer
support for cache management in nonstandard noncoherent systems.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Conor Dooley <conor.dooley@microchip.com> # tyre-kicking on a d1
---
v11 -> v12
* Renamed struct riscv_cache_ops -> struct riscv_nonstd_cache_ops

v10 -> v11
* Changed data type of size from unsigned long to size_t
* Reworded doc for struct riscv_cache_ops

v9 -> v10
* Added __ro_after_init compiler attribute for noncoherent_cache_ops
* Renamed clean -> wback
* Renamed inval -> inv
* Renamed flush -> wback_inv

v8 -> v9
* New patch
---
 arch/riscv/Kconfig                       |  7 ++++
 arch/riscv/include/asm/dma-noncoherent.h | 28 +++++++++++++++
 arch/riscv/mm/dma-noncoherent.c          | 43 ++++++++++++++++++++++++
 arch/riscv/mm/pmem.c                     | 13 +++++++
 4 files changed, 91 insertions(+)
 create mode 100644 arch/riscv/include/asm/dma-noncoherent.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index f52dd125ac5e..a629d383affb 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -269,6 +269,13 @@ config RISCV_DMA_NONCOHERENT
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select DMA_DIRECT_REMAP
 
+config RISCV_NONSTANDARD_CACHE_OPS
+	bool
+	depends on RISCV_DMA_NONCOHERENT
+	help
+	  This enables function pointer support for non-standard noncoherent
+	  systems to handle cache management.
+
 config AS_HAS_INSN
 	def_bool $(as-instr,.insn r 51$(comma) 0$(comma) 0$(comma) t0$(comma) t0$(comma) zero)
 
diff --git a/arch/riscv/include/asm/dma-noncoherent.h b/arch/riscv/include/asm/dma-noncoherent.h
new file mode 100644
index 000000000000..312cfa0858fb
--- /dev/null
+++ b/arch/riscv/include/asm/dma-noncoherent.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 Renesas Electronics Corp.
+ */
+
+#ifndef __ASM_DMA_NONCOHERENT_H
+#define __ASM_DMA_NONCOHERENT_H
+
+#include <linux/dma-direct.h>
+
+/*
+ * struct riscv_nonstd_cache_ops - Structure for non-standard CMO function pointers
+ *
+ * @wback: Function pointer for cache writeback
+ * @inv: Function pointer for invalidating cache
+ * @wback_inv: Function pointer for flushing the cache (writeback + invalidating)
+ */
+struct riscv_nonstd_cache_ops {
+	void (*wback)(phys_addr_t paddr, size_t size);
+	void (*inv)(phys_addr_t paddr, size_t size);
+	void (*wback_inv)(phys_addr_t paddr, size_t size);
+};
+
+extern struct riscv_nonstd_cache_ops noncoherent_cache_ops;
+
+void riscv_noncoherent_register_cache_ops(const struct riscv_nonstd_cache_ops *ops);
+
+#endif	/* __ASM_DMA_NONCOHERENT_H */
diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index 06b8fea58e20..a4f3f37859ae 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -9,13 +9,26 @@
 #include <linux/dma-map-ops.h>
 #include <linux/mm.h>
 #include <asm/cacheflush.h>
+#include <asm/dma-noncoherent.h>
 
 static bool noncoherent_supported __ro_after_init;
 
+struct riscv_nonstd_cache_ops noncoherent_cache_ops __ro_after_init = {
+	.wback = NULL,
+	.inv = NULL,
+	.wback_inv = NULL,
+};
+
 static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
 {
 	void *vaddr = phys_to_virt(paddr);
 
+#ifdef CONFIG_RISCV_NONSTANDARD_CACHE_OPS
+	if (unlikely(noncoherent_cache_ops.wback)) {
+		noncoherent_cache_ops.wback(paddr, size);
+		return;
+	}
+#endif
 	ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
 }
 
@@ -23,6 +36,13 @@ static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
 {
 	void *vaddr = phys_to_virt(paddr);
 
+#ifdef CONFIG_RISCV_NONSTANDARD_CACHE_OPS
+	if (unlikely(noncoherent_cache_ops.inv)) {
+		noncoherent_cache_ops.inv(paddr, size);
+		return;
+	}
+#endif
+
 	ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
 }
 
@@ -30,6 +50,13 @@ static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
 {
 	void *vaddr = phys_to_virt(paddr);
 
+#ifdef CONFIG_RISCV_NONSTANDARD_CACHE_OPS
+	if (unlikely(noncoherent_cache_ops.wback_inv)) {
+		noncoherent_cache_ops.wback_inv(paddr, size);
+		return;
+	}
+#endif
+
 	ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
 }
 
@@ -95,6 +122,13 @@ void arch_dma_prep_coherent(struct page *page, size_t size)
 {
 	void *flush_addr = page_address(page);
 
+#ifdef CONFIG_RISCV_NONSTANDARD_CACHE_OPS
+	if (unlikely(noncoherent_cache_ops.wback_inv)) {
+		noncoherent_cache_ops.wback_inv(page_to_phys(page), size);
+		return;
+	}
+#endif
+
 	ALT_CMO_OP(flush, flush_addr, size, riscv_cbom_block_size);
 }
 
@@ -120,3 +154,12 @@ void riscv_noncoherent_supported(void)
 	     "Non-coherent DMA support enabled without a block size\n");
 	noncoherent_supported = true;
 }
+
+void riscv_noncoherent_register_cache_ops(const struct riscv_nonstd_cache_ops *ops)
+{
+	if (!ops)
+		return;
+
+	noncoherent_cache_ops = *ops;
+}
+EXPORT_SYMBOL_GPL(riscv_noncoherent_register_cache_ops);
diff --git a/arch/riscv/mm/pmem.c b/arch/riscv/mm/pmem.c
index 089df92ae876..c5fc5ec96f6d 100644
--- a/arch/riscv/mm/pmem.c
+++ b/arch/riscv/mm/pmem.c
@@ -7,15 +7,28 @@
 #include <linux/libnvdimm.h>
 
 #include <asm/cacheflush.h>
+#include <asm/dma-noncoherent.h>
 
 void arch_wb_cache_pmem(void *addr, size_t size)
 {
+#ifdef CONFIG_RISCV_NONSTANDARD_CACHE_OPS
+	if (unlikely(noncoherent_cache_ops.wback)) {
+		noncoherent_cache_ops.wback(virt_to_phys(addr), size);
+		return;
+	}
+#endif
 	ALT_CMO_OP(clean, addr, size, riscv_cbom_block_size);
 }
 EXPORT_SYMBOL_GPL(arch_wb_cache_pmem);
 
 void arch_invalidate_pmem(void *addr, size_t size)
 {
+#ifdef CONFIG_RISCV_NONSTANDARD_CACHE_OPS
+	if (unlikely(noncoherent_cache_ops.inv)) {
+		noncoherent_cache_ops.inv(virt_to_phys(addr), size);
+		return;
+	}
+#endif
 	ALT_CMO_OP(inval, addr, size, riscv_cbom_block_size);
 }
 EXPORT_SYMBOL_GPL(arch_invalidate_pmem);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
