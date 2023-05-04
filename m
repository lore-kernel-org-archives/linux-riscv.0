Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501E3C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 07:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wOWcD8X+r1+c8eah1gCgwS2d1PHrU6OVPvt5Uu+EFQA=; b=AdTC9qwOOq7xDt
	F6fKumt1bbj7kMLUUgIedLX2Sd5coe6sovxWyBH56Wa72Vm0nY7Kv235WHFeBdbuIjctqqlEToQVx
	1dL6ln/gj9FJr0GK+4cpidu2uIf7MzSlBY5kYV+XpNq+t1OUXxYZfAB5aHNYdf7XnXJvIItvDrOht
	LEuOXCMrAaC81pnJGE+qWI8QNabGDf0am/pY+vHJluL5GW+bbr/w56Z0E5xIRwzJK/0uyP2rIy5Y8
	Ls7a9EYQYoO5L3QvuT62bxAkRmU/dAXZF+wzHBqbbQHmHJ22f3aXli8LIaJaNR6XNDo7psgTsaMc9
	dFOObUM4wQi2+2Nx+GLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puTUc-006uV1-33;
	Thu, 04 May 2023 07:35:10 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puTUb-006uUN-2N
	for linux-riscv@bombadil.infradead.org;
	Thu, 04 May 2023 07:35:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=siNHSgTQt1A58qCp7fO8B+4f0aeu/LsyU/OCpT6J0ig=; b=ZiLHtmeFqTVuqDAcODALnB+N/2
	7zCWEWUtoYCyd2XzOgYyymM2Nakks/SC2TtyVZmEaAkq3OfyX5Iva0z1qb/Y0951pLZWb36898V3M
	p+j/gtYqAHqzUcoADPxTyAAGPueTtRZMywHZQTk2N9RStErO5z+u/2tk8HecqKV5UCrT54wIozrao
	/3GiTjZXF9T6g7VNkae52R8QWa3bupS2Ti5Hhi/eTcgX5e+5I6U8lISqt+3JDVup/T1p/6EdwIiBd
	tOygrRIDrELka139gqa6nW/xC8X8RLtAPfmsDJlfFVVfbZdsEJeW1Klgmk2FfRQeKjzWv7shNO622
	PRHlsLGA==;
Received: from ex01.ufhost.com ([61.152.239.75])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puTUU-001fsI-1g
	for linux-riscv@lists.infradead.org;
	Thu, 04 May 2023 07:35:08 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id DBFB924E24A;
	Thu,  4 May 2023 15:34:18 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 4 May
 2023 15:34:18 +0800
Received: from ubuntu.localdomain (161.142.156.10) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 4 May
 2023 15:34:14 +0800
From: Jia Jie Ho <jiajie.ho@starfivetech.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v7 2/4] crypto: starfive - Add crypto engine support
Date: Thu, 4 May 2023 15:33:58 +0800
Message-ID: <20230504073400.1170979-3-jiajie.ho@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230504073400.1170979-1-jiajie.ho@starfivetech.com>
References: <20230504073400.1170979-1-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [161.142.156.10]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_083504_291215_3985E183 
X-CRM114-Status: GOOD (  24.06  )
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

Adding device probe and DMA init for StarFive cryptographic module.

Co-developed-by: Huan Feng <huan.feng@starfivetech.com>
Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
---
 MAINTAINERS                           |   7 +
 drivers/crypto/Kconfig                |   1 +
 drivers/crypto/Makefile               |   1 +
 drivers/crypto/starfive/Kconfig       |  17 +++
 drivers/crypto/starfive/Makefile      |   4 +
 drivers/crypto/starfive/jh7110-cryp.c | 201 ++++++++++++++++++++++++++
 drivers/crypto/starfive/jh7110-cryp.h |  63 ++++++++
 7 files changed, 294 insertions(+)
 create mode 100644 drivers/crypto/starfive/Kconfig
 create mode 100644 drivers/crypto/starfive/Makefile
 create mode 100644 drivers/crypto/starfive/jh7110-cryp.c
 create mode 100644 drivers/crypto/starfive/jh7110-cryp.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 5f9c544bc189..498f3b7792a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19920,6 +19920,13 @@ F:	Documentation/devicetree/bindings/clock/starfive,jh71*.yaml
 F:	drivers/clk/starfive/clk-starfive-jh71*
 F:	include/dt-bindings/clock/starfive?jh71*.h
 
+STARFIVE CRYPTO DRIVER
+M:	Jia Jie Ho <jiajie.ho@starfivetech.com>
+M:	William Qiu <william.qiu@starfivetech.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/crypto/starfive*
+F:	drivers/crypto/starfive/
+
 STARFIVE JH71X0 PINCTRL DRIVERS
 M:	Emil Renner Berthing <kernel@esmil.dk>
 M:	Jianlong Huang <jianlong.huang@starfivetech.com>
diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 3b2516d1433f..c9b6a8747fa1 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -822,5 +822,6 @@ config CRYPTO_DEV_SA2UL
 
 source "drivers/crypto/keembay/Kconfig"
 source "drivers/crypto/aspeed/Kconfig"
+source "drivers/crypto/starfive/Kconfig"
 
 endif # CRYPTO_HW
diff --git a/drivers/crypto/Makefile b/drivers/crypto/Makefile
index 476f1a25ca32..5ff5242a1824 100644
--- a/drivers/crypto/Makefile
+++ b/drivers/crypto/Makefile
@@ -52,3 +52,4 @@ obj-y += xilinx/
 obj-y += hisilicon/
 obj-$(CONFIG_CRYPTO_DEV_AMLOGIC_GXL) += amlogic/
 obj-y += keembay/
+obj-y += starfive/
diff --git a/drivers/crypto/starfive/Kconfig b/drivers/crypto/starfive/Kconfig
new file mode 100644
index 000000000000..2436e93d27ef
--- /dev/null
+++ b/drivers/crypto/starfive/Kconfig
@@ -0,0 +1,17 @@
+#
+# StarFive crypto drivers configuration
+#
+
+config CRYPTO_DEV_JH7110
+	tristate "StarFive JH7110 cryptographic engine driver"
+	depends on SOC_STARFIVE
+	select CRYPTO_ENGINE
+	select ARM_AMBA
+	select DMADEVICES
+	select AMBA_PL08X
+	help
+	  Support for StarFive JH7110 crypto hardware acceleration engine.
+	  This module provides acceleration for public key algo,
+	  skciphers, AEAD and hash functions.
+
+	  If you choose 'M' here, this module will be called jh7110-crypto.
diff --git a/drivers/crypto/starfive/Makefile b/drivers/crypto/starfive/Makefile
new file mode 100644
index 000000000000..41221acaee39
--- /dev/null
+++ b/drivers/crypto/starfive/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_CRYPTO_DEV_JH7110) += jh7110-crypto.o
+jh7110-crypto-objs := jh7110-cryp.o
diff --git a/drivers/crypto/starfive/jh7110-cryp.c b/drivers/crypto/starfive/jh7110-cryp.c
new file mode 100644
index 000000000000..4b2505c23168
--- /dev/null
+++ b/drivers/crypto/starfive/jh7110-cryp.c
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Cryptographic API.
+ *
+ * Support for StarFive hardware cryptographic engine.
+ * Copyright (c) 2022 StarFive Technology
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+#include "jh7110-cryp.h"
+
+#define DRIVER_NAME             "jh7110-crypto"
+
+struct starfive_dev_list {
+	struct list_head        dev_list;
+	spinlock_t              lock; /* protect dev_list */
+};
+
+static struct starfive_dev_list dev_list = {
+	.dev_list = LIST_HEAD_INIT(dev_list.dev_list),
+	.lock     = __SPIN_LOCK_UNLOCKED(dev_list.lock),
+};
+
+struct starfive_cryp_dev *starfive_cryp_find_dev(struct starfive_cryp_ctx *ctx)
+{
+	struct starfive_cryp_dev *cryp = NULL, *tmp;
+
+	spin_lock_bh(&dev_list.lock);
+	if (!ctx->cryp) {
+		list_for_each_entry(tmp, &dev_list.dev_list, list) {
+			cryp = tmp;
+			break;
+		}
+		ctx->cryp = cryp;
+	} else {
+		cryp = ctx->cryp;
+	}
+
+	spin_unlock_bh(&dev_list.lock);
+
+	return cryp;
+}
+
+static int starfive_dma_init(struct starfive_cryp_dev *cryp)
+{
+	dma_cap_mask_t mask;
+
+	dma_cap_zero(mask);
+	dma_cap_set(DMA_SLAVE, mask);
+
+	cryp->tx = dma_request_chan(cryp->dev, "tx");
+	if (IS_ERR(cryp->tx))
+		return dev_err_probe(cryp->dev, PTR_ERR(cryp->tx),
+				     "Error requesting tx dma channel.\n");
+
+	cryp->rx = dma_request_chan(cryp->dev, "rx");
+	if (IS_ERR(cryp->rx)) {
+		dma_release_channel(cryp->tx);
+		return dev_err_probe(cryp->dev, PTR_ERR(cryp->rx),
+				     "Error requesting rx dma channel.\n");
+	}
+
+	return 0;
+}
+
+static void starfive_dma_cleanup(struct starfive_cryp_dev *cryp)
+{
+	dma_release_channel(cryp->tx);
+	dma_release_channel(cryp->rx);
+}
+
+static int starfive_cryp_probe(struct platform_device *pdev)
+{
+	struct starfive_cryp_dev *cryp;
+	struct resource *res;
+	int ret;
+
+	cryp = devm_kzalloc(&pdev->dev, sizeof(*cryp), GFP_KERNEL);
+	if (!cryp)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, cryp);
+	cryp->dev = &pdev->dev;
+
+	cryp->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(cryp->base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(cryp->base),
+				     "Error remapping memory for platform device\n");
+
+	cryp->phys_base = res->start;
+	cryp->dma_maxburst = 32;
+
+	cryp->hclk = devm_clk_get(&pdev->dev, "hclk");
+	if (IS_ERR(cryp->hclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(cryp->hclk),
+				     "Error getting hardware reference clock\n");
+
+	cryp->ahb = devm_clk_get(&pdev->dev, "ahb");
+	if (IS_ERR(cryp->ahb))
+		return dev_err_probe(&pdev->dev, PTR_ERR(cryp->ahb),
+				     "Error getting ahb reference clock\n");
+
+	cryp->rst = devm_reset_control_get_shared(cryp->dev, NULL);
+	if (IS_ERR(cryp->rst))
+		return dev_err_probe(&pdev->dev, PTR_ERR(cryp->rst),
+				     "Error getting hardware reset line\n");
+
+	clk_prepare_enable(cryp->hclk);
+	clk_prepare_enable(cryp->ahb);
+	reset_control_deassert(cryp->rst);
+
+	spin_lock(&dev_list.lock);
+	list_add(&cryp->list, &dev_list.dev_list);
+	spin_unlock(&dev_list.lock);
+
+	ret = starfive_dma_init(cryp);
+	if (ret) {
+		if (ret == -EPROBE_DEFER)
+			goto err_probe_defer;
+		else
+			goto err_dma_init;
+	}
+
+	/* Initialize crypto engine */
+	cryp->engine = crypto_engine_alloc_init(&pdev->dev, 1);
+	if (!cryp->engine) {
+		ret = -ENOMEM;
+		goto err_engine;
+	}
+
+	ret = crypto_engine_start(cryp->engine);
+	if (ret)
+		goto err_engine_start;
+
+	return 0;
+
+err_engine_start:
+	crypto_engine_exit(cryp->engine);
+err_engine:
+	starfive_dma_cleanup(cryp);
+err_dma_init:
+	spin_lock(&dev_list.lock);
+	list_del(&cryp->list);
+	spin_unlock(&dev_list.lock);
+
+	clk_disable_unprepare(cryp->hclk);
+	clk_disable_unprepare(cryp->ahb);
+	reset_control_assert(cryp->rst);
+err_probe_defer:
+	return ret;
+}
+
+static int starfive_cryp_remove(struct platform_device *pdev)
+{
+	struct starfive_cryp_dev *cryp = platform_get_drvdata(pdev);
+
+	crypto_engine_stop(cryp->engine);
+	crypto_engine_exit(cryp->engine);
+
+	starfive_dma_cleanup(cryp);
+
+	spin_lock(&dev_list.lock);
+	list_del(&cryp->list);
+	spin_unlock(&dev_list.lock);
+
+	clk_disable_unprepare(cryp->hclk);
+	clk_disable_unprepare(cryp->ahb);
+	reset_control_assert(cryp->rst);
+
+	return 0;
+}
+
+static const struct of_device_id starfive_dt_ids[] __maybe_unused = {
+	{ .compatible = "starfive,jh7110-crypto", .data = NULL},
+	{},
+};
+MODULE_DEVICE_TABLE(of, starfive_dt_ids);
+
+static struct platform_driver starfive_cryp_driver = {
+	.probe  = starfive_cryp_probe,
+	.remove = starfive_cryp_remove,
+	.driver = {
+		.name           = DRIVER_NAME,
+		.of_match_table = starfive_dt_ids,
+	},
+};
+
+module_platform_driver(starfive_cryp_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("StarFive JH7110 Cryptographic Module");
diff --git a/drivers/crypto/starfive/jh7110-cryp.h b/drivers/crypto/starfive/jh7110-cryp.h
new file mode 100644
index 000000000000..393efd38b098
--- /dev/null
+++ b/drivers/crypto/starfive/jh7110-cryp.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __STARFIVE_STR_H__
+#define __STARFIVE_STR_H__
+
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/dmaengine.h>
+
+#include <crypto/engine.h>
+
+#define STARFIVE_ALG_CR_OFFSET			0x0
+#define STARFIVE_ALG_FIFO_OFFSET		0x4
+#define STARFIVE_IE_MASK_OFFSET			0x8
+#define STARFIVE_IE_FLAG_OFFSET			0xc
+#define STARFIVE_DMA_IN_LEN_OFFSET		0x10
+#define STARFIVE_DMA_OUT_LEN_OFFSET		0x14
+
+#define STARFIVE_MSG_BUFFER_SIZE		SZ_16K
+
+union starfive_alg_cr {
+	u32 v;
+	struct {
+		u32 start			:1;
+		u32 aes_dma_en			:1;
+		u32 rsvd_0			:1;
+		u32 hash_dma_en			:1;
+		u32 alg_done			:1;
+		u32 rsvd_1			:3;
+		u32 clear			:1;
+		u32 rsvd_2			:23;
+	};
+};
+
+struct starfive_cryp_ctx {
+	struct crypto_engine_ctx		enginectx;
+	struct starfive_cryp_dev		*cryp;
+};
+
+struct starfive_cryp_dev {
+	struct list_head			list;
+	struct device				*dev;
+
+	struct clk				*hclk;
+	struct clk				*ahb;
+	struct reset_control			*rst;
+
+	void __iomem				*base;
+	phys_addr_t				phys_base;
+
+	u32					dma_maxburst;
+	struct dma_chan				*tx;
+	struct dma_chan				*rx;
+	struct dma_slave_config			cfg_in;
+	struct dma_slave_config			cfg_out;
+
+	struct crypto_engine			*engine;
+
+	union starfive_alg_cr			alg_cr;
+};
+
+struct starfive_cryp_dev *starfive_cryp_find_dev(struct starfive_cryp_ctx *ctx);
+
+#endif
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
