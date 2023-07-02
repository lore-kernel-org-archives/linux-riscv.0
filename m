Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2634AC0015E
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Jul 2023 20:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8MG+rS4almVi+kR713osjv3SB44LsBZvqiIAq4JFTg=; b=M5vb1dyKhTZzH0
	/1Tp4Y29O0IEE5UdKYIOIpuichPfoMlutkUTz+hxYnfYMd8yflFeHv/kBmu5ihsf0Qy26pehthD1w
	54+HGU8JRQZCU/43HveQwS9eV/33pYCTVnPwjece1WJVU+RK0JtOELr81KtLjSk0pIqs8+91ucYjy
	xtmuGHEGzHYHn0hByHJp59LmDZTlXKnSZrdyspVDjYTV2DUcvbUba1PYnBCRaZcJ7UIJ2WpJQVgV0
	CDJjt4lCVmAFQZO/hwocTNxUCXU28s/G2cdT0+9wPmKTX/M1PKysGckpYJTZK9YrBPi/r3/vbHnfR
	Y7YIhEme86OZ3j4UhFcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG3md-008bHk-1G;
	Sun, 02 Jul 2023 20:34:59 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qG3mY-008bC7-07
	for linux-riscv@lists.infradead.org;
	Sun, 02 Jul 2023 20:34:56 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-313e714342cso4392979f8f.0
        for <linux-riscv@lists.infradead.org>; Sun, 02 Jul 2023 13:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688330092; x=1690922092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcexdVQPBw2rdGBbBDTUXB1gr2v058VsgGzEZRfGeYk=;
        b=W8dcPNYnPZAWz3dYwbstWsoxXj+8ieIe2ZACK45R6iQD9OdL3Gy2TO0CWBtp1kxaDa
         vTRHRwAEprccmKG8vy38zpgvzWFypTDDA8GovnGn/eeSyIJ4Ckc+ithLylcmW+GVBODd
         R2eUS1peu6eFmEuYpa+3QuCcjNXdGV15ufgf3vgpd07a87ptdodxyMMCMwGD1l+6F6d3
         oYKsBWv3LS2nVapLuMJvMFP9ieN95Mol4ZMQhxvAoGSGGLN7gTyb1sUDJ7MRkyPT6Ci+
         N8kalFqhyDwpEFX0S3S4hXcituOGzj+Gra5Hmu0HOCbH1EM2YwcR1Lw6pGLjptCx8+pw
         FUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688330092; x=1690922092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HcexdVQPBw2rdGBbBDTUXB1gr2v058VsgGzEZRfGeYk=;
        b=ASJCUtHG6C+LAqHsrcNzTZDjC/LRMf+qO9deDe0H5cq1BLMo/L1BII+yPkd5U+0jWZ
         kwOKUD0ti7B8636a+SltqhOSl03OYiV1krShCa4OS2aJQwFHlM++FrPVf8PFU+//fqYd
         b5bOgve77G73p64Xsv8D8+//ZqwaakAttdicgDoEF06QQaxEbHMguPSyoA6CZ+RmqecO
         igUb9CGStemurDAu7i+A7TBHnG1eLb2zPAJGjzMNTjOTYzDKt04XPX9YbquFtg7tiDaK
         6/aJNmfOO2ZDnvpMvZprY73ud64fAZa75anXD3vGGHh7FuirFsSBP81tDskcRGqCTmU6
         GHag==
X-Gm-Message-State: ABy/qLaD6dw97SGqv6OyonaxSfpSDC84iAExqMpcZOs3rAd6F5dsnnhy
	vTcLSEq8VRwgnHK95YZVt3Y=
X-Google-Smtp-Source: APBJJlG42eS96skXsOTDvhF78VPlj2Mt2tn2mqA2+pz+TVnhqMqFgowZn5j4VbBKwM4H2pSg0/GMxA==
X-Received: by 2002:adf:e9c2:0:b0:313:fff0:ff44 with SMTP id l2-20020adfe9c2000000b00313fff0ff44mr8062417wrn.38.1688330091931;
        Sun, 02 Jul 2023 13:34:51 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:b4ae:ae48:2e1b:1dcd])
        by smtp.gmail.com with ESMTPSA id f1-20020a5d5681000000b0030647449730sm24000478wrv.74.2023.07.02.13.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 13:34:51 -0700 (PDT)
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
	Christoph Hellwig <hch@infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v10 3/6] riscv: mm: dma-noncoherent: nonstandard cache operations support
Date: Sun,  2 Jul 2023 21:34:26 +0100
Message-Id: <20230702203429.237615-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230702203429.237615-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230702203429.237615-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_133454_073391_151812D7 
X-CRM114-Status: GOOD (  20.03  )
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
index d9e451ac862a..42c86b13c5e1 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -265,6 +265,13 @@ config RISCV_DMA_NONCOHERENT
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
index 000000000000..969cf1f1363a
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
+ * struct riscv_cache_ops - Structure for CMO function pointers
+ *
+ * @wback: Function pointer for cache writeback
+ * @inv: Function pointer for invalidating cache
+ * @wback_inv: Function pointer for flushing the cache (writeback + invalidating)
+ */
+struct riscv_cache_ops {
+	void (*wback)(phys_addr_t paddr, unsigned long size);
+	void (*inv)(phys_addr_t paddr, unsigned long size);
+	void (*wback_inv)(phys_addr_t paddr, unsigned long size);
+};
+
+extern struct riscv_cache_ops noncoherent_cache_ops;
+
+void riscv_noncoherent_register_cache_ops(const struct riscv_cache_ops *ops);
+
+#endif	/* __ASM_DMA_NONCOHERENT_H */
diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index b9a9f57e02be..4c2e3f1cdfe6 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -9,13 +9,26 @@
 #include <linux/dma-map-ops.h>
 #include <linux/mm.h>
 #include <asm/cacheflush.h>
+#include <asm/dma-noncoherent.h>
 
 static bool noncoherent_supported;
 
+struct riscv_cache_ops noncoherent_cache_ops __ro_after_init = {
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
 
@@ -50,6 +77,13 @@ void arch_dma_prep_coherent(struct page *page, size_t size)
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
 
@@ -75,3 +109,12 @@ void riscv_noncoherent_supported(void)
 	     "Non-coherent DMA support enabled without a block size\n");
 	noncoherent_supported = true;
 }
+
+void riscv_noncoherent_register_cache_ops(const struct riscv_cache_ops *ops)
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
