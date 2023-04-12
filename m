Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250AAC77B72
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 11:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=scKYetPrmHDR5wPntzEc7Sl7s4Oba4qaXh9wSfjsL38=; b=a+zF+H3HFve8cB
	HmHKKJbGv/V+FB9okJDQWI+3+sS+xO4UMRV6OHAV7KXIIBYiUOBE+uwO8WgnsYNqVD8RmXtLAJJpH
	RTnO0GATxAXFDpGMMpZm9Wj/AUrQnJA0/zMyAA5hS55eeMe9L+i3W3LmZ/Cq+6jFJa7X1mDWeVu2x
	QbFOCX7T6J3HBXZw7qLOejSgFAVzB4IvPYK8+1CE7xq0ToQ7HUu9icJKmD6PvrrOvjvJrHBhhPHUl
	KFNEnIUMDq0kYZt1JoIirAY1GSOth8VNBdtWwI+XpM290a3ckGoM21dVaUhHTJMzax0dEKLnzF4lU
	4EdnsMONH7/NoZolaR4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYM4-002kUt-3D;
	Wed, 12 Apr 2023 11:09:37 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYM0-002kRH-0I
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 11:09:34 +0000
Received: by mail-wr1-x430.google.com with SMTP id e22so10391769wra.6
        for <linux-riscv@lists.infradead.org>; Wed, 12 Apr 2023 04:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681297770; x=1683889770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNB/LQ+2e9RHIyw+KYF13k6Gi/pRgp/ViMk5z3IzBHc=;
        b=WQ69rz8q6X+JyFAUjanXhwu/mRXMiyt7GZGBGt7XH1QHkiERrN8f3ABhNmldinKAlq
         dg9iT14yNwIkFbiXbbPX0w16xP9yP4R6vVRefM3bYBusGVhqLx9f7NgSZXEt6hJHJtEI
         EakYmLp3foSOHOZplcghljf2jdy582o0eF5G5bitDM9Mg9zt7P0f0CBuFhytkEnfZcVX
         mRvQH0qFPuJtx9wxWZjiM1C4NDIlbcI3AU1F6l88Me6xrycml/YlqplzGD+MgmwND5gU
         k2dnDI7a/H4Dy9GNjOd3SmsXbov89Rvfe4wpni5YERHQeuydytgauVV/kBpAT4cfgoQB
         kx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681297770; x=1683889770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNB/LQ+2e9RHIyw+KYF13k6Gi/pRgp/ViMk5z3IzBHc=;
        b=ba33ep9wUJ1y2QUKB1NwVBAh/nSBoDeUyG6iAxb3e1FC5O6ABUS4wJVme+b3M5aTov
         EACEKOAsZ+YwzmNqPRup6glNYyDpHBMoaVHHk1r7rCSZbtqzyPgmxh85O65UWDeCXN+s
         4aJQfsii0nzwOKihixf92mzg/tpzi71aIYbpbpE8otMaCjMT9lsTfGqICKvfI1nvbTWI
         BxEaU5S66/9sP8JHAZhnCLiSXAmp+U+JIOMQkkxOavhmMdqtPIKrts50VIxFrcSKqzPK
         HVjUzux7adOMg4TQ1HoF7xWXA0ur4oc7HkUV+9c+SzwBPCuDETG3FOMkIhEWIcVb6dJ6
         gwPQ==
X-Gm-Message-State: AAQBX9f0+rKpphgpWdDnaKIhGiL2J4znKuDvHro3lrP7yBksxB0myD85
	URirU/wct44/xKDPqQOn6/4=
X-Google-Smtp-Source: AKy350bjr5oy+T5nmH45qUBnTg6YXw4JZRXUIf1+/TsA7aLMoGRkhF2d67bEO8MCIXMR4NUkolJRdQ==
X-Received: by 2002:a5d:6e03:0:b0:2f2:7e53:db65 with SMTP id h3-20020a5d6e03000000b002f27e53db65mr1779957wrz.7.1681297770072;
        Wed, 12 Apr 2023 04:09:30 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:783d:9280:20c4:db22])
        by smtp.gmail.com with ESMTPSA id l13-20020a5d668d000000b002e61e002943sm16863582wru.116.2023.04.12.04.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 04:09:29 -0700 (PDT)
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
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v8 5/7] cache: Add L2 cache management for Andes AX45MP RISC-V core
Date: Wed, 12 Apr 2023 12:08:58 +0100
Message-Id: <20230412110900.69738-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230412110900.69738-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230412110900.69738-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_040932_135844_EB144238 
X-CRM114-Status: GOOD (  28.53  )
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

I/O Coherence Port (IOCP) provides an AXI interface for connecting
external non-caching masters, such as DMA controllers. The accesses
from IOCP are coherent with D-Caches and L2 Cache.

IOCP is a specification option and is disabled on the Renesas RZ/Five
SoC due to this reason IP blocks using DMA will fail.

The Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
block that allows dynamic adjustment of memory attributes in the runtime.
It contains a configurable amount of PMA entries implemented as CSR
registers to control the attributes of memory locations in interest.
Below are the memory attributes supported:
* Device, Non-bufferable
* Device, bufferable
* Memory, Non-cacheable, Non-bufferable
* Memory, Non-cacheable, Bufferable
* Memory, Write-back, No-allocate
* Memory, Write-back, Read-allocate
* Memory, Write-back, Write-allocate
* Memory, Write-back, Read and Write-allocate

More info about PMA (section 10.3):
Link: http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf

As a workaround for SoCs with IOCP disabled CMO needs to be handled by
software. Firstly OpenSBI configures the memory region as
"Memory, Non-cacheable, Bufferable" and passes this region as a global
shared dma pool as a DT node. With DMA_GLOBAL_POOL enabled all DMA
allocations happen from this region and synchronization callbacks are
implemented to synchronize when doing DMA transactions.

Example PMA region passes as a DT node from OpenSBI:
    reserved-memory {
        #address-cells = <2>;
        #size-cells = <2>;
        ranges;

        pma_resv0@58000000 {
            compatible = "shared-dma-pool";
            reg = <0x0 0x58000000 0x0 0x08000000>;
            no-map;
            linux,dma-default;
        };
    };

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v7 -> v8
* Dropped function pointer usage
* Now exporting the functions for clean/inval/flush
* Switched to using early_initcall instead of arch_initcall
* Dropped entry for "include/cache" from MAINTAINERS
* Dropped dependency of RISCV on AX45MP_L2_CACHE
* Returning error in case of cache line mismatch
* Renamed clean/inval/flush functions

v6 -> v7
* Implemented flush callback
* Dropped using riscv_dma_noncoherent_cmo_ops

v5 -> v6
* Moved driver to cache folder
* Switched to new API for CMO

v4 -> v5
* Dropped code for configuring L2 cache
* Dropped code for configuring PMA
* Updated commit message
* Added comments
* Changed static branch enable/disable order

RFC v3 -> v4
* Made use of runtime patching instead of compile time
* Now just exposing single function ax45mp_no_iocp_cmo() for CMO handling
* Added a check to make sure cache line size is always 64 bytes
* Renamed folder rzf -> rzfive
* Improved Kconfig description
* Dropped L2 cache configuration
* Dropped unnecessary casts
* Fixed comments pointed by Geert.
---
 MAINTAINERS                  |   7 ++
 drivers/Kconfig              |   2 +
 drivers/Makefile             |   1 +
 drivers/cache/Kconfig        |  10 ++
 drivers/cache/Makefile       |   3 +
 drivers/cache/ax45mp_cache.c | 222 +++++++++++++++++++++++++++++++++++
 6 files changed, 245 insertions(+)
 create mode 100644 drivers/cache/Kconfig
 create mode 100644 drivers/cache/Makefile
 create mode 100644 drivers/cache/ax45mp_cache.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3afd45f71043..9afd39a23524 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19898,6 +19898,13 @@ S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
 F:	drivers/staging/
 
+STANDALONE CACHE CONTROLLER DRIVERS
+M:	Conor Dooley <conor@kernel.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
+F:	drivers/cache
+
 STARFIRE/DURALAN NETWORK DRIVER
 M:	Ion Badulescu <ionut@badula.org>
 S:	Odd Fixes
diff --git a/drivers/Kconfig b/drivers/Kconfig
index 968bd0a6fd78..44abd2cba3a3 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -15,6 +15,8 @@ source "drivers/base/Kconfig"
 
 source "drivers/bus/Kconfig"
 
+source "drivers/cache/Kconfig"
+
 source "drivers/connector/Kconfig"
 
 source "drivers/firmware/Kconfig"
diff --git a/drivers/Makefile b/drivers/Makefile
index 20b118dca999..db5a8115093f 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -11,6 +11,7 @@ ifdef building_out_of_srctree
 MAKEFLAGS += --include-dir=$(srctree)
 endif
 
+obj-y				+= cache/
 obj-y				+= irqchip/
 obj-y				+= bus/
 
diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
new file mode 100644
index 000000000000..b97269cbd149
--- /dev/null
+++ b/drivers/cache/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0
+menu "Cache Drivers"
+
+config AX45MP_L2_CACHE
+	bool "Andes Technology AX45MP L2 Cache controller"
+	depends on RISCV_DMA_NONCOHERENT
+	help
+	  Support for the L2 cache controller on Andes Technology AX45MP platforms.
+
+endmenu
diff --git a/drivers/cache/Makefile b/drivers/cache/Makefile
new file mode 100644
index 000000000000..2012e7fb978d
--- /dev/null
+++ b/drivers/cache/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_AX45MP_L2_CACHE) += ax45mp_cache.o
diff --git a/drivers/cache/ax45mp_cache.c b/drivers/cache/ax45mp_cache.c
new file mode 100644
index 000000000000..cfc40b967c55
--- /dev/null
+++ b/drivers/cache/ax45mp_cache.c
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * non-coherent cache functions for Andes AX45MP
+ *
+ * Copyright (C) 2023 Renesas Electronics Corp.
+ */
+
+#include <linux/cacheflush.h>
+#include <linux/cacheinfo.h>
+#include <linux/dma-direction.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+
+/* L2 cache registers */
+#define AX45MP_L2C_REG_CTL_OFFSET		0x8
+
+#define AX45MP_L2C_REG_C0_CMD_OFFSET		0x40
+#define AX45MP_L2C_REG_C0_ACC_OFFSET		0x48
+#define AX45MP_L2C_REG_STATUS_OFFSET		0x80
+
+/* D-cache operation */
+#define AX45MP_CCTL_L1D_VA_INVAL		0 /* Invalidate an L1 cache entry */
+#define AX45MP_CCTL_L1D_VA_WB			1 /* Write-back an L1 cache entry */
+
+/* L2 CCTL status */
+#define AX45MP_CCTL_L2_STATUS_IDLE		0
+
+/* L2 CCTL status cores mask */
+#define AX45MP_CCTL_L2_STATUS_C0_MASK		0xf
+
+/* L2 cache operation */
+#define AX45MP_CCTL_L2_PA_INVAL			0x8 /* Invalidate an L2 cache entry */
+#define AX45MP_CCTL_L2_PA_WB			0x9 /* Write-back an L2 cache entry */
+
+#define AX45MP_L2C_REG_PER_CORE_OFFSET		0x10
+#define AX45MP_CCTL_L2_STATUS_PER_CORE_OFFSET	4
+
+#define AX45MP_L2C_REG_CN_CMD_OFFSET(n)	\
+	(AX45MP_L2C_REG_C0_CMD_OFFSET + ((n) * AX45MP_L2C_REG_PER_CORE_OFFSET))
+#define AX45MP_L2C_REG_CN_ACC_OFFSET(n)	\
+	(AX45MP_L2C_REG_C0_ACC_OFFSET + ((n) * AX45MP_L2C_REG_PER_CORE_OFFSET))
+#define AX45MP_CCTL_L2_STATUS_CN_MASK(n)	\
+	(AX45MP_CCTL_L2_STATUS_C0_MASK << ((n) * AX45MP_CCTL_L2_STATUS_PER_CORE_OFFSET))
+
+#define AX45MP_CCTL_REG_UCCTLBEGINADDR_NUM	0x80b
+#define AX45MP_CCTL_REG_UCCTLCOMMAND_NUM	0x80c
+
+#define AX45MP_CACHE_LINE_SIZE			64
+
+struct ax45mp_priv {
+	void __iomem *l2c_base;
+	u32 ax45mp_cache_line_size;
+};
+
+static struct ax45mp_priv ax45mp_priv;
+
+/* L2 Cache operations */
+static inline uint32_t ax45mp_cpu_l2c_get_cctl_status(void)
+{
+	return readl(ax45mp_priv.l2c_base + AX45MP_L2C_REG_STATUS_OFFSET);
+}
+
+static void ax45mp_cpu_cache_operation(unsigned long start, unsigned long end,
+				       unsigned long line_size, unsigned int l1_op,
+				       unsigned int l2_op)
+{
+	void __iomem *base = ax45mp_priv.l2c_base;
+	int mhartid = smp_processor_id();
+	unsigned long pa;
+
+	while (end > start) {
+		csr_write(AX45MP_CCTL_REG_UCCTLBEGINADDR_NUM, start);
+		csr_write(AX45MP_CCTL_REG_UCCTLCOMMAND_NUM, l1_op);
+
+		pa = virt_to_phys((void *)start);
+		writel(pa, base + AX45MP_L2C_REG_CN_ACC_OFFSET(mhartid));
+		writel(l2_op, base + AX45MP_L2C_REG_CN_CMD_OFFSET(mhartid));
+		while ((ax45mp_cpu_l2c_get_cctl_status() &
+			AX45MP_CCTL_L2_STATUS_CN_MASK(mhartid)) !=
+			AX45MP_CCTL_L2_STATUS_IDLE)
+			;
+
+		start += line_size;
+	}
+}
+
+/* Write-back L1 and L2 cache entry */
+static inline void ax45mp_cpu_dcache_wb_range(unsigned long start, unsigned long end,
+					      unsigned long line_size)
+{
+	ax45mp_cpu_cache_operation(start, end, line_size,
+				   AX45MP_CCTL_L1D_VA_WB,
+				   AX45MP_CCTL_L2_PA_WB);
+}
+
+/* Invalidate the L1 and L2 cache entry */
+static inline void ax45mp_cpu_dcache_inval_range(unsigned long start, unsigned long end,
+						 unsigned long line_size)
+{
+	ax45mp_cpu_cache_operation(start, end, line_size,
+				   AX45MP_CCTL_L1D_VA_INVAL,
+				   AX45MP_CCTL_L2_PA_INVAL);
+}
+
+void ax45mp_dma_cache_inv(void *vaddr, unsigned long size)
+{
+	unsigned long start = (unsigned long)vaddr;
+	char cache_buf[2][AX45MP_CACHE_LINE_SIZE];
+	unsigned long end = start + size;
+	unsigned long old_start = start;
+	unsigned long old_end = end;
+	unsigned long line_size;
+	unsigned long flags;
+
+	if (unlikely(start == end))
+		return;
+
+	line_size = ax45mp_priv.ax45mp_cache_line_size;
+
+	memset(&cache_buf, 0x0, sizeof(cache_buf));
+	start = start & (~(line_size - 1));
+	end = ((end + line_size - 1) & (~(line_size - 1)));
+
+	local_irq_save(flags);
+	if (unlikely(start != old_start))
+		memcpy(&cache_buf[0][0], (void *)start, line_size);
+
+	if (unlikely(end != old_end))
+		memcpy(&cache_buf[1][0], (void *)(old_end & (~(line_size - 1))), line_size);
+
+	ax45mp_cpu_dcache_inval_range(start, end, line_size);
+
+	if (unlikely(start != old_start))
+		memcpy((void *)start, &cache_buf[0][0], (old_start & (line_size - 1)));
+
+	local_irq_restore(flags);
+}
+EXPORT_SYMBOL_GPL(ax45mp_dma_cache_inv);
+
+void ax45mp_dma_cache_wback(void *vaddr, unsigned long size)
+{
+	unsigned long start = (unsigned long)vaddr;
+	unsigned long end = start + size;
+	unsigned long line_size;
+	unsigned long flags;
+
+	line_size = ax45mp_priv.ax45mp_cache_line_size;
+	start = start & (~(line_size - 1));
+	local_irq_save(flags);
+	ax45mp_cpu_dcache_wb_range(start, end, line_size);
+	local_irq_restore(flags);
+}
+EXPORT_SYMBOL_GPL(ax45mp_dma_cache_wback);
+
+void ax45mp_dma_cache_wback_inv(void *vaddr, unsigned long size)
+{
+	ax45mp_dma_cache_wback(vaddr, size);
+	ax45mp_dma_cache_inv(vaddr, size);
+}
+EXPORT_SYMBOL_GPL(ax45mp_dma_cache_wback_inv);
+
+static int ax45mp_get_l2_line_size(struct device_node *np)
+{
+	int ret;
+
+	ret = of_property_read_u32(np, "cache-line-size", &ax45mp_priv.ax45mp_cache_line_size);
+	if (ret) {
+		pr_err("Failed to get cache-line-size, defaulting to 64 bytes\n");
+		return ret;
+	}
+
+	if (ax45mp_priv.ax45mp_cache_line_size != AX45MP_CACHE_LINE_SIZE) {
+		pr_err("Expected cache-line-size to be 64 bytes (found:%u)\n",
+		       ax45mp_priv.ax45mp_cache_line_size);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id ax45mp_cache_ids[] = {
+	{ .compatible = "andestech,ax45mp-cache" },
+	{ /* sentinel */ }
+};
+
+static int __init ax45mp_cache_init(void)
+{
+	struct device_node *np;
+	struct resource res;
+	int ret;
+
+	np = of_find_matching_node(NULL, ax45mp_cache_ids);
+	if (!of_device_is_available(np))
+		return -ENODEV;
+
+	ret = of_address_to_resource(np, 0, &res);
+	if (ret)
+		return ret;
+
+	/*
+	 * If IOCP is present on the Andes AX45MP core riscv_cbom_block_size
+	 * will be 0 for sure, so we can definitely rely on it. If
+	 * riscv_cbom_block_size = 0 we don't need to handle CMO using SW any
+	 * more so we just return success here and only if its being set we
+	 * continue further in the probe path.
+	 */
+	if (!riscv_cbom_block_size)
+		return 0;
+
+	ax45mp_priv.l2c_base = ioremap(res.start, resource_size(&res));
+	if (!ax45mp_priv.l2c_base)
+		return -ENOMEM;
+
+	ret = ax45mp_get_l2_line_size(np);
+	if (ret) {
+		iounmap(ax45mp_priv.l2c_base);
+		return ret;
+	}
+
+	return 0;
+}
+early_initcall(ax45mp_cache_init);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
