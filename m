Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DCBC61DA4
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 15:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hMLR1HG+XQu0E+224nC6X42SuM10czVpU8f6vYyHObM=; b=ohqvq5ZK1NKMFt
	iiEX4Q/S7vIwEfvmgJhP5wbjiF3+lM/rUjeyAD7WS3BMiZqzRJxxLhjFRkxN299hVZ8Wloe/F7NgT
	pM71l/WPwUk2ewumRFv2Spocp0xBxnvqpG/GS932nsUmcsyW/+Lcdvt3QlMqiLhkNe5ickGTalx6b
	Ds6YfZcX3xTLFhZ5/YwTTAMhfvSlW2VZD9KtzWAJaMGVUDwKpG1k/1pg8lQsnE/exJ6A2THqYrP9I
	SbKHHTB/Mwrg0z2mGqb/Foo6jSXB+OkakF+JKCYoxWHvJO3SipQ/FhgMUsgj1OaVHSEpgJtbVkzhs
	qtAJuZgSOTtVggMC4C3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWM5-0045hg-3v; Mon, 30 Jan 2023 15:46:01 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWLy-0045ZG-9U
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 15:45:56 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 7315524DDB2;
	Mon, 30 Jan 2023 23:45:24 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 30 Jan
 2023 23:45:23 +0800
Received: from ubuntu.localdomain (202.190.105.77) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 30 Jan
 2023 23:45:03 +0800
From: Jia Jie Ho <jiajie.ho@starfivetech.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v2 2/4] crypto: starfive - Add crypto engine support
Date: Mon, 30 Jan 2023 23:42:40 +0800
Message-ID: <20230130154242.112613-3-jiajie.ho@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230130154242.112613-1-jiajie.ho@starfivetech.com>
References: <20230130154242.112613-1-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [202.190.105.77]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_074554_864084_016BDBE6 
X-CRM114-Status: GOOD (  23.45  )
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
 MAINTAINERS                             |   7 +
 drivers/crypto/Kconfig                  |   1 +
 drivers/crypto/Makefile                 |   1 +
 drivers/crypto/starfive/Kconfig         |  20 +++
 drivers/crypto/starfive/Makefile        |   4 +
 drivers/crypto/starfive/starfive-cryp.c | 210 ++++++++++++++++++++++++
 drivers/crypto/starfive/starfive-regs.h |  26 +++
 drivers/crypto/starfive/starfive-str.h  |  51 ++++++
 8 files changed, 320 insertions(+)
 create mode 100644 drivers/crypto/starfive/Kconfig
 create mode 100644 drivers/crypto/starfive/Makefile
 create mode 100644 drivers/crypto/starfive/starfive-cryp.c
 create mode 100644 drivers/crypto/starfive/starfive-regs.h
 create mode 100644 drivers/crypto/starfive/starfive-str.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 65140500d9f8..a6f7677db4db 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19609,6 +19609,13 @@ F:	Documentation/devicetree/bindings/clock/starfive*
 F:	drivers/clk/starfive/
 F:	include/dt-bindings/clock/starfive*
 
+STARFIVE CRYPTO DRIVER
+M:	Jia Jie Ho <jiajie.ho@starfivetech.com>
+M:	William Qiu <william.qiu@starfivetech.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/crypto/starfive*
+F:	drivers/crypto/starfive/
+
 STARFIVE PINCTRL DRIVER
 M:	Emil Renner Berthing <kernel@esmil.dk>
 M:	Jianlong Huang <jianlong.huang@starfivetech.com>
diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 55e75fbb658e..64b94376601c 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -817,5 +817,6 @@ config CRYPTO_DEV_SA2UL
 
 source "drivers/crypto/keembay/Kconfig"
 source "drivers/crypto/aspeed/Kconfig"
+source "drivers/crypto/starfive/Kconfig"
 
 endif # CRYPTO_HW
diff --git a/drivers/crypto/Makefile b/drivers/crypto/Makefile
index 116de173a66c..212931c84412 100644
--- a/drivers/crypto/Makefile
+++ b/drivers/crypto/Makefile
@@ -53,3 +53,4 @@ obj-y += xilinx/
 obj-y += hisilicon/
 obj-$(CONFIG_CRYPTO_DEV_AMLOGIC_GXL) += amlogic/
 obj-y += keembay/
+obj-y += starfive/
diff --git a/drivers/crypto/starfive/Kconfig b/drivers/crypto/starfive/Kconfig
new file mode 100644
index 000000000000..2ef3efcea96e
--- /dev/null
+++ b/drivers/crypto/starfive/Kconfig
@@ -0,0 +1,20 @@
+#
+# StarFive crypto drivers configuration
+#
+
+config CRYPTO_DEV_JH7110
+	tristate "StarFive JH7110 cryptographic engine driver"
+	depends on SOC_STARFIVE
+	select CRYPTO_ENGINE
+	select CRYPTO_RSA
+	select CRYPTO_AES
+	select CRYPTO_CCM
+	select ARM_AMBA
+	select DMADEVICES
+	select AMBA_PL08X
+	help
+	  Support for StarFive JH7110 crypto hardware acceleration engine.
+	  This module provides acceleration for public key algo,
+	  skciphers, AEAD and hash functions.
+
+	  If you choose 'M' here, this module will be called starfive-crypto.
diff --git a/drivers/crypto/starfive/Makefile b/drivers/crypto/starfive/Makefile
new file mode 100644
index 000000000000..079ceb938a4c
--- /dev/null
+++ b/drivers/crypto/starfive/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_CRYPTO_DEV_JH7110) += starfive-crypto.o
+starfive-crypto-objs := starfive-cryp.o
diff --git a/drivers/crypto/starfive/starfive-cryp.c b/drivers/crypto/starfive/starfive-cryp.c
new file mode 100644
index 000000000000..09654b1c0d0e
--- /dev/null
+++ b/drivers/crypto/starfive/starfive-cryp.c
@@ -0,0 +1,210 @@
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
+#include "starfive-str.h"
+
+#define DRIVER_NAME             "starfive-crypto"
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
+static bool side_chan_mitigation;
+module_param(side_chan_mitigation, bool, 0);
+MODULE_PARM_DESC(side_chan_mitigation, "Enable side channel mitigation for AES module:\n"
+					" 0 - disable\n"
+					" 1 - enable\n"
+					"Enabling this feature will affect speed performance");
+
+static int starfive_dma_init(struct starfive_cryp_dev *cryp)
+{
+	dma_cap_mask_t mask;
+
+	cryp->tx = NULL;
+	cryp->rx = NULL;
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
+	init_completion(&cryp->tx_comp);
+	init_completion(&cryp->rx_comp);
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
+	cryp->side_chan = side_chan_mitigation;
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
+	if (ret)
+		goto err_dma_init;
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
+	return ret;
+}
+
+static int starfive_cryp_remove(struct platform_device *pdev)
+{
+	struct starfive_cryp_dev *cryp = platform_get_drvdata(pdev);
+
+	if (!cryp)
+		return -ENODEV;
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
+MODULE_DESCRIPTION("StarFive Cryptographic Module");
diff --git a/drivers/crypto/starfive/starfive-regs.h b/drivers/crypto/starfive/starfive-regs.h
new file mode 100644
index 000000000000..0d680cb1f502
--- /dev/null
+++ b/drivers/crypto/starfive/starfive-regs.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __STARFIVE_REGS_H__
+#define __STARFIVE_REGS_H__
+
+#define STARFIVE_ALG_CR_OFFSET			0x0
+#define STARFIVE_ALG_FIFO_OFFSET		0x4
+#define STARFIVE_IE_MASK_OFFSET			0x8
+#define STARFIVE_IE_FLAG_OFFSET			0xc
+#define STARFIVE_DMA_IN_LEN_OFFSET		0x10
+#define STARFIVE_DMA_OUT_LEN_OFFSET		0x14
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
+#endif
diff --git a/drivers/crypto/starfive/starfive-str.h b/drivers/crypto/starfive/starfive-str.h
new file mode 100644
index 000000000000..10997c88f0e5
--- /dev/null
+++ b/drivers/crypto/starfive/starfive-str.h
@@ -0,0 +1,51 @@
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
+#include "starfive-regs.h"
+
+#define STARFIVE_MSG_BUFFER_SIZE		SZ_16K
+
+struct starfive_cryp_ctx {
+	struct crypto_engine_ctx		enginectx;
+	struct starfive_cryp_dev		*cryp;
+
+	u8					*buffer;
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
+	size_t					data_buf_len;
+	int					pages_count;
+	u32					dma_maxburst;
+	bool					side_chan;
+	struct dma_chan				*tx;
+	struct dma_chan				*rx;
+	struct dma_slave_config			cfg_in;
+	struct dma_slave_config			cfg_out;
+	struct completion			tx_comp;
+	struct completion			rx_comp;
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
