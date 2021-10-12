Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 673A5C43217
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 13:42:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A8BA6101D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 13:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A8BA6101D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MV74VARRhFuFuv98RzxcVGwjBi9CeG9anTr4LCi+s7I=; b=wSP17kgnz4t3x+
	Hwjefa33fYwJhzXLHcbutt8lZtwFmB5CvPBd/hUYwtVHrutSL5qoqNjit2b0tyuI/iOK+W5SiXxxt
	z3rR2CgMmV8lQ88OEN+OM29JBlnWj4S6aSMwkTTo/Ysbqnr/6GpUuyIBlsO+3WMU1SUSqxAY7sScQ
	wcrP/KKOF/KV8Pq1l+UatnUt465o+Eu0j6PwKdFpQs09NCo5afZ0rPgGOR9g7b5gdf6/I5PZTYhi6
	8tnwKOaoGv9SfrfCTSICML8Hhy4/vO5kMbqO25RKgqimnIqKGpI8YHwhOGjD8Y6pHUL69/nm+WhQm
	Tg/HNN6eTHRbMNDLqQGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maI3Q-00D32V-RH; Tue, 12 Oct 2021 13:42:52 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maI2e-00D2WU-P2
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 13:42:06 +0000
Received: by mail-lf1-x132.google.com with SMTP id i24so86000749lfj.13
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 06:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dtURt139qgddHpLPO67/kM/tEuprVxdMtl96A+mzATM=;
 b=f60zFRFDt/J9sxLIcF+lO55d+JVDIGUNgcvj6khe3iArz759dKGw1U0UaynAxR7JbJ
 11RkIoPOuaWTEkZyGnvvtDc0OcZR9jTKU9zeqno0vryy9RhtqUv73+fHh/C8OX76I0IR
 Hzuxxpi0iuzgswXPrVq4DWtWEL8Ak9SFq0fRoclFGZtGkecO1cRUhqFR6mSRaGxhe5jB
 Zh7iE5xY8TuWkJvbEyU0zPQGfYIY0LRv0hunGby1bZMTG9BjIP1rU2rbx3Hrs0y8dXpr
 nqLFe0dO2i4FqNbGh7ZZtSNUpe22NKIikcSvPlnr5eHID+2dQj88DEamPZPwBgJdR64W
 +rfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dtURt139qgddHpLPO67/kM/tEuprVxdMtl96A+mzATM=;
 b=Ou6TEfBuu/aBlaK/c8y+BitdIDEH5JAzuaO3B+FZmDOB7X73Ga06i4OEMA/Hj8ryzU
 t2JCXuhYCpicg0ggDkhjY2c1noQz9ymOA0icv0X86fRvOERrrvBpDx6XUtPCTEVKq+uB
 MaMt1tCgCOpyvmdw3C4Z8PS/DuqiJjM/CzqHBAzkvIiiIS9A5rbc9xNfOQ1Urrxl0m1y
 hcxFpPj6M3PZpXLkHLzI2s+w1CUcW9MTMwGmwSoPRU/Vl2lxt5yGkhTxapaeudm7SBhv
 DOwZ+UApvM4j703cW/Y0eMnr5wsiacekqHKi7I0Wzxo5RNnXgx/EX24X5AJpJ5KvHvVG
 raIA==
X-Gm-Message-State: AOAM5332bnJW/b9tLNnTD6zHuWtA6lIuIYvmNJIW6/5sptLwFb7kH+e4
 eMpkkXDQP7UUJHPKxuHOfCjkgVy6hWkxAg==
X-Google-Smtp-Source: ABdhPJzNpUTNHtZKYvkfOn3zYXgma9rI5O1vya6ZA38ztxGLe7l7ZEbLH0F3xnw9itB6Ml15kGfo7A==
X-Received: by 2002:a2e:b949:: with SMTP id 9mr29558640ljs.400.1634046121868; 
 Tue, 12 Oct 2021 06:42:01 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id k16sm1033761lfo.219.2021.10.12.06.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 06:42:01 -0700 (PDT)
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
 Geert Uytterhoeven <geert@linux-m68k.org>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 09/16] reset: starfive-jh7100: Add StarFive JH7100 reset
 driver
Date: Tue, 12 Oct 2021 15:40:20 +0200
Message-Id: <20211012134027.684712-10-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012134027.684712-1-kernel@esmil.dk>
References: <20211012134027.684712-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_064204_882647_045AAE54 
X-CRM114-Status: GOOD (  23.08  )
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
 drivers/reset/reset-starfive-jh7100.c | 164 ++++++++++++++++++++++++++
 4 files changed, 180 insertions(+)
 create mode 100644 drivers/reset/reset-starfive-jh7100.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d2b95b96f0ec..f7883377895e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17854,6 +17854,13 @@ F:	Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml
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
index be799a5abf8a..8345521744b3 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -92,6 +92,14 @@ config RESET_INTEL_GW
 	  Say Y to control the reset signals provided by reset controller.
 	  Otherwise, say N.
 
+config RESET_STARFIVE_JH7100
+	bool "StarFive JH7100 Reset Driver"
+	depends on SOC_STARFIVE || COMPILE_TEST
+	depends on OF
+	default SOC_STARFIVE
+	help
+	  This enables the reset controller driver for the StarFive JH7100 SoC.
+
 config RESET_K210
 	bool "Reset controller driver for Canaan Kendryte K210 SoC"
 	depends on (SOC_CANAAN || COMPILE_TEST) && OF
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 21d46d8869ff..021eff3525de 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
 obj-$(CONFIG_RESET_HSDK) += reset-hsdk.o
 obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
 obj-$(CONFIG_RESET_INTEL_GW) += reset-intel-gw.o
+obj-$(CONFIG_RESET_STARFIVE_JH7100) += reset-starfive-jh7100.o
 obj-$(CONFIG_RESET_K210) += reset-k210.o
 obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
 obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
diff --git a/drivers/reset/reset-starfive-jh7100.c b/drivers/reset/reset-starfive-jh7100.c
new file mode 100644
index 000000000000..26bc5b59c1f3
--- /dev/null
+++ b/drivers/reset/reset-starfive-jh7100.c
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Reset driver for the StarFive JH7100 SoC
+ *
+ * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
+ *
+ */
+
+#include <linux/io.h>
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
+	BIT_MASK(JH7100_RST_E24	% 32)
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
+	do {
+		value = readl(reg_status) & mask;
+	} while (value != done);
+
+	spin_unlock_irqrestore(&data->lock, flags);
+	return 0;
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
+	{ /* sentinel */ },
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
2.33.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
