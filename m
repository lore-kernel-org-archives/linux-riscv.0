Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2016C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 17:43:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A22F460E97
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 17:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A22F460E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bKtZR7aDc8QS9+1f24FdYvI0ZIMiNB2Xgp98v12Gqew=; b=E9SjYlOX/EcNZm
	k/29j+6a/C+cOdFastN6Ul2hCW8lCrj+SPz+6esuvjj5JOmnls41B1yh1KpK1O6MJsSclUL0J914L
	WtHLFX4FGHTA/bfjNaiMMHLmksLpgGSe7avrRlw4hPx598G77nGy1ZOTLW2NJykIpv7+Zvtb4KAb/
	+qscO6tHkC8IyXnlKe3NYH/jonrfx2y9nZWaUTYEVcQnnRD/Bhdcetyisbv+hEKgSlhOYzAwaaspY
	LTOMD2uwljIbesHkJm9P8y7NBeYqumAmVXxKg5i76nOGLmAhT4UKDQ3NGNpSZ5o4YEKarfeIDsHh6
	BnG8JyASPbw7C4wd9WGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdc5w-008Wb8-H2; Thu, 21 Oct 2021 17:43:12 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdc5V-008WEU-3G
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 17:42:47 +0000
Received: by mail-ed1-x52b.google.com with SMTP id w19so525497edd.2
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 10:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N0CZanSeQXbNwLducpnOX30ySYeNDmpJ4xZItDNJhTU=;
 b=TSsixE/iT3+A0hONPCHLcG3+7zUAl1+T8U2cTAlBeE7tXD8wfwMSo1oODEUESiaAA2
 gUmmkAUrTiWz7/QQXyxA68+NOpCo2yxMFPRamNu06T+JT1Yiy3F/JSiw8jSoLEtVT2Vl
 Lizf2c0PDwwf1vtukEVJFojldXASM7BMdXOqXgHsZAjzt90OL2aymH5J5rkRHsI26+ED
 46b0JAUVXbwuUlhm8XSXyFJ3GRd3HQ5RQ4O3rlWMMnKMTzSBuuDGp+CjztxVkiTvldGS
 1vLKz3bx3V/9vZGFz4PLb+P1L3dGgiP+7ciRnvqG1OpSgdohT4aJflxfM3Z/NylSNSWh
 OYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=N0CZanSeQXbNwLducpnOX30ySYeNDmpJ4xZItDNJhTU=;
 b=HFG7wc7Ns1L+hSxntWoVFIpcDegaFkL8JRDEUcJUAKr1Zzz3K86o9wNR4lkHLo0U8B
 cntzco1n7/041Iuitm6qmT/SZHsYv3ECNLOS1Nosr+gmu9Tchmz38gE3c8FSLFjfRmMz
 sJ5HFAageO3J18IWSh1eUsiHcc6WKoPB44tIf1gC+BFE7Vhp+qigw+9vpN4u1UtZfQaW
 1ExEsvBHkkKh6Q8IGcJt2Ss8Etazn+PB2BL4I8Lznj8Sx+t3g3KiYADp8NVldnTMO37C
 zAhVMWA7FX3sICLD17J2BFo4Gv+a3/t1NuPwPaAmUTuUC4xuu26Le3Qza/UjqM59QA7H
 Qd1Q==
X-Gm-Message-State: AOAM5303tE5+LDYACqmw7GFbqkne/XaAJxDp32aUU8GSBYV92gaVAQeA
 JihUHMDbh4sxtIO2G7hVH+KxQNB+5+HJFQ==
X-Google-Smtp-Source: ABdhPJwqMiGoHe9gzgq8nDKgFN3Wb6EEx+r/hnXSZuxTCVUngP4e7sMZfHAJxH63ezxNE5xr1/NcHw==
X-Received: by 2002:a05:6402:4d1:: with SMTP id
 n17mr9586452edw.337.1634838163862; 
 Thu, 21 Oct 2021 10:42:43 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id h7sm3144847edt.37.2021.10.21.10.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 10:42:43 -0700 (PDT)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/16] reset: starfive-jh7100: Add StarFive JH7100 reset
 driver
Date: Thu, 21 Oct 2021 19:42:16 +0200
Message-Id: <20211021174223.43310-10-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211021174223.43310-1-kernel@esmil.dk>
References: <20211021174223.43310-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_104245_196970_E55952AA 
X-CRM114-Status: GOOD (  23.62  )
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

Add a driver for the StarFive JH7100 reset controller.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 MAINTAINERS                           |   7 ++
 drivers/reset/Kconfig                 |   8 ++
 drivers/reset/Makefile                |   1 +
 drivers/reset/reset-starfive-jh7100.c | 165 ++++++++++++++++++++++++++
 4 files changed, 181 insertions(+)
 create mode 100644 drivers/reset/reset-starfive-jh7100.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e5a19b70dfbb..b3f3a29fc91f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17855,6 +17855,13 @@ F:	Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml
 F:	drivers/clk/starfive/clk-starfive-jh7100.c
 F:	include/dt-bindings/clock/starfive-jh7100.h
 
+STARFIVE JH7100 RESET CONTROLLER DRIVER
+M:	Emil Renner Berthing <kernel@esmil.dk>
+S:	Maintained
+F:	Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
+F:	drivers/reset/reset-starfive-jh7100.c
+F:	include/dt-bindings/reset/starfive-jh7100.h
+
 STATIC BRANCH/CALL
 M:	Peter Zijlstra <peterz@infradead.org>
 M:	Josh Poimboeuf <jpoimboe@redhat.com>
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index be799a5abf8a..a41fac304904 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -224,6 +224,14 @@ config RESET_SOCFPGA
 	  This enables the reset driver for the SoCFPGA ARMv7 platforms. This
 	  driver gets initialized early during platform init calls.
 
+config RESET_STARFIVE_JH7100
+	bool "StarFive JH7100 Reset Driver"
+	depends on SOC_STARFIVE || COMPILE_TEST
+	depends on OF
+	default SOC_STARFIVE
+	help
+	  This enables the reset controller driver for the StarFive JH7100 SoC.
+
 config RESET_SUNXI
 	bool "Allwinner SoCs Reset Driver" if COMPILE_TEST && !ARCH_SUNXI
 	default ARCH_SUNXI
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 21d46d8869ff..bd0a97be18b5 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_RESET_RZG2L_USBPHY_CTRL) += reset-rzg2l-usbphy-ctrl.o
 obj-$(CONFIG_RESET_SCMI) += reset-scmi.o
 obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
 obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
+obj-$(CONFIG_RESET_STARFIVE_JH7100) += reset-starfive-jh7100.o
 obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
 obj-$(CONFIG_RESET_TI_SCI) += reset-ti-sci.o
 obj-$(CONFIG_RESET_TI_SYSCON) += reset-ti-syscon.o
diff --git a/drivers/reset/reset-starfive-jh7100.c b/drivers/reset/reset-starfive-jh7100.c
new file mode 100644
index 000000000000..ae15ed5357f1
--- /dev/null
+++ b/drivers/reset/reset-starfive-jh7100.c
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Reset driver for the StarFive JH7100 SoC
+ *
+ * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
+ *
+ */
+
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+#include <linux/spinlock.h>
+
+#include <dt-bindings/reset/starfive-jh7100.h>
+
+/* register offsets */
+#define JH7100_RESET_ASSERT0	0x00
+#define JH7100_RESET_ASSERT1	0x04
+#define JH7100_RESET_ASSERT2	0x08
+#define JH7100_RESET_ASSERT3	0x0c
+#define JH7100_RESET_STATUS0	0x10
+#define JH7100_RESET_STATUS1	0x14
+#define JH7100_RESET_STATUS2	0x18
+#define JH7100_RESET_STATUS3	0x1c
+
+struct jh7100_reset {
+	struct reset_controller_dev rcdev;
+	/* protect registers against overlapping read-modify-write */
+	spinlock_t lock;
+	void __iomem *base;
+};
+
+static inline struct jh7100_reset *
+jh7100_reset_from(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct jh7100_reset, rcdev);
+}
+
+static const u32 jh7100_reset_asserted[4] = {
+	BIT(JH7100_RST_U74 % 32) |
+	BIT(JH7100_RST_VP6_DRESET % 32) |
+	BIT(JH7100_RST_VP6_BRESET % 32),
+
+	BIT(JH7100_RST_HIFI4_DRESET % 32) |
+	BIT(JH7100_RST_HIFI4_BRESET % 32),
+
+	BIT(JH7100_RST_E24 % 32)
+};
+
+static int jh7100_reset_update(struct reset_controller_dev *rcdev,
+			       unsigned long id, bool assert)
+{
+	struct jh7100_reset *data = jh7100_reset_from(rcdev);
+	unsigned long offset = id / 32;
+	void __iomem *reg_assert = data->base + JH7100_RESET_ASSERT0 + 4 * offset;
+	void __iomem *reg_status = data->base + JH7100_RESET_STATUS0 + 4 * offset;
+	u32 mask = BIT(id % 32);
+	u32 done = jh7100_reset_asserted[offset] & mask;
+	unsigned long flags;
+	u32 value;
+	int ret;
+
+	if (!assert)
+		done ^= mask;
+
+	spin_lock_irqsave(&data->lock, flags);
+
+	value = readl(reg_assert);
+	if (assert)
+		value |= mask;
+	else
+		value &= ~mask;
+	writel(value, reg_assert);
+
+	/* if the associated clock is gated, deasserting might otherwise hang forever */
+	ret = readl_poll_timeout(reg_status, value, (value & mask) == done, 0, 1000);
+
+	spin_unlock_irqrestore(&data->lock, flags);
+	return ret;
+}
+
+static int jh7100_reset_assert(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	dev_dbg(rcdev->dev, "assert(%lu)\n", id);
+	return jh7100_reset_update(rcdev, id, true);
+}
+
+static int jh7100_reset_deassert(struct reset_controller_dev *rcdev,
+				 unsigned long id)
+{
+	dev_dbg(rcdev->dev, "deassert(%lu)\n", id);
+	return jh7100_reset_update(rcdev, id, false);
+}
+
+static int jh7100_reset_reset(struct reset_controller_dev *rcdev,
+			      unsigned long id)
+{
+	int ret;
+
+	dev_dbg(rcdev->dev, "reset(%lu)\n", id);
+	ret = jh7100_reset_assert(rcdev, id);
+	if (ret)
+		return ret;
+
+	return jh7100_reset_deassert(rcdev, id);
+}
+
+static int jh7100_reset_status(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	struct jh7100_reset *data = jh7100_reset_from(rcdev);
+	unsigned long offset = id / 32;
+	void __iomem *reg_status = data->base + JH7100_RESET_STATUS0 + 4 * offset;
+	u32 mask = BIT(id % 32);
+	u32 value = (readl(reg_status) ^ jh7100_reset_asserted[offset]) & mask;
+
+	dev_dbg(rcdev->dev, "status(%lu) = %d\n", id, !value);
+	return !value;
+}
+
+static const struct reset_control_ops jh7100_reset_ops = {
+	.assert		= jh7100_reset_assert,
+	.deassert	= jh7100_reset_deassert,
+	.reset		= jh7100_reset_reset,
+	.status		= jh7100_reset_status,
+};
+
+static int jh7100_reset_probe(struct platform_device *pdev)
+{
+	struct jh7100_reset *data;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(data->base))
+		return PTR_ERR(data->base);
+
+	data->rcdev.ops = &jh7100_reset_ops;
+	data->rcdev.owner = THIS_MODULE;
+	data->rcdev.nr_resets = JH7100_RSTN_END;
+	data->rcdev.dev = &pdev->dev;
+	data->rcdev.of_node = pdev->dev.of_node;
+	spin_lock_init(&data->lock);
+
+	return devm_reset_controller_register(&pdev->dev, &data->rcdev);
+}
+
+static const struct of_device_id jh7100_reset_dt_ids[] = {
+	{ .compatible = "starfive,jh7100-reset" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver jh7100_reset_driver = {
+	.probe = jh7100_reset_probe,
+	.driver = {
+		.name = "jh7100-reset",
+		.of_match_table = jh7100_reset_dt_ids,
+	},
+};
+builtin_platform_driver(jh7100_reset_driver);
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
