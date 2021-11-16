Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD953C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:02:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75CBF6103B
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75CBF6103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NttJQz7wVc9Eqj2Hj/GpITmLJZdPtFr+SCaWmYE33ag=; b=jCSVSlRG1ZWtql
	JF8fZ7QeTm6bOmM1RGSf2ei7JaXa5XyEBDiHGCCocY59eeec+Ts2X7q3vaC6g+oB8rDtX/SykdrqA
	kaLcWxkCiS7B0AwVrmGgARxT0yMhyA/mC3VxY4wl+3aWR1wrI13MrCjloC9wUhZ47kHh9E2DzMDbc
	D55R72luhKA4tBHhOYFL98wGRbvOq5y0PxnRS6iEGRD0S0PtoBNyR7J0P8T+qvW/zmLOeHCoEdjU6
	soic7F+YII33TT6UhIkQp40besbg35M0joXGstx8D7ceeT4EFTEf3D15rChSOtS69gj4LCdvTh/7R
	KbHp1boNVCjXmVhFmTQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmzyP-0023nU-76; Tue, 16 Nov 2021 15:02:13 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmzyJ-0023je-OZ
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 15:02:09 +0000
Received: by mail-ed1-x52a.google.com with SMTP id w1so89356146edd.10
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 07:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z7q9kjgU4apoJNx9NYf75zxgec/3s4E6uLQBrTLyLzs=;
 b=iILgXq0ykBCyWw6O6HtzgcJyPv0/7ndHg2iKse8V+CIJrZbRn+uqB0Z/juTizdODgu
 ceHZBAr+mhsglBa4wbPe4owrK4PHODnJBCMRmr7K8wIBMtBpUh1gJjbBhJWfftXB9qgB
 O7FIfyN0rXofK1szOSCK+FWnngu/B4rxBse5Wi5aHTH7VOnyWDHm4n3Lxz0SGJCXHXw6
 CBP6LFFPPRjiL5S3G20Qwprt0+4nkw3DBEjclkJbP9yg6c5W99oGXpZm9nXadH3nk+vT
 6I/gc65Lfn6Y879rqyJbY5Wv80Aggu5GBegNlPogGwC2V73Af79y3cqPdgqGku1PdOVp
 Rynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=z7q9kjgU4apoJNx9NYf75zxgec/3s4E6uLQBrTLyLzs=;
 b=XETOlApRLM++QvidL68n4DKJQa2m6Fqdesk9PiKrSFOG8lrpLSMZmeu4ihFQrWq1Ho
 WgmvgNwamhFKKUZKHMoJqgGyGiRYx4cZ96Uu3HLLO119DW/+Wsjr58WKcZMjzddm64BK
 GUZgfTg4YsgsQw5zipk511nPEvFUMmE12D7x+R0QTa1ds3Q3VrZgnN3oQc6OGNgHDnJy
 ZCx6P9l1Kwx26dT/epq8yCZ+o7aVFqcK0IJuOLEg6+BrUwUHn1jYw0GlyFyonwYoBB8c
 VCuQJOWrigXbx/+RAqmnxFjm/0dFVuJrIQMBkRF/H1bgHvK9UUE4QYGwnWwa7AX54efq
 Wbrw==
X-Gm-Message-State: AOAM533U0VFeDnBNwHGZ8K73flpx6XTOFvkdHGRgqggwJFhcxA/xSiG+
 htj4TsU8bB7I+eWYyYgC8rAVhFKwr4dPTw==
X-Google-Smtp-Source: ABdhPJwLVqog85g6Xljx0tX4M4hE141xm8Ratka1leyBjPOX5Naey5ML8c1kZUhInQIHHSH7JU5pdw==
X-Received: by 2002:a05:6402:1911:: with SMTP id
 e17mr10876856edz.43.1637074925620; 
 Tue, 16 Nov 2021 07:02:05 -0800 (PST)
Received: from stitch.. ([2a02:aa7:4600:b4ae:a375:e7a0:9eaf:8d7b])
 by smtp.gmail.com with ESMTPSA id u16sm9414311edr.43.2021.11.16.07.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 07:02:05 -0800 (PST)
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
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 09/16] reset: starfive-jh7100: Add StarFive JH7100 reset
 driver
Date: Tue, 16 Nov 2021 16:01:12 +0100
Message-Id: <20211116150119.2171-10-kernel@esmil.dk>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211116150119.2171-1-kernel@esmil.dk>
References: <20211116150119.2171-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_070207_859579_D705864A 
X-CRM114-Status: GOOD (  27.32  )
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
 MAINTAINERS                           |   7 +
 drivers/reset/Kconfig                 |   7 +
 drivers/reset/Makefile                |   1 +
 drivers/reset/reset-starfive-jh7100.c | 176 ++++++++++++++++++++++++++
 4 files changed, 191 insertions(+)
 create mode 100644 drivers/reset/reset-starfive-jh7100.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 2548ef1f8246..1152f5d94690 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18137,6 +18137,13 @@ F:	Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml
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
index 85024eb1d2ea..6f8ba0ddc05f 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -224,6 +224,13 @@ config RESET_SOCFPGA
 	  This enables the reset driver for the SoCFPGA ARMv7 platforms. This
 	  driver gets initialized early during platform init calls.
 
+config RESET_STARFIVE_JH7100
+	bool "StarFive JH7100 Reset Driver"
+	depends on SOC_STARFIVE || COMPILE_TEST
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
index 000000000000..2f7615cbf1dc
--- /dev/null
+++ b/drivers/reset/reset-starfive-jh7100.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Reset driver for the StarFive JH7100 SoC
+ *
+ * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
+ */
+
+#include <linux/bitmap.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/mod_devicetable.h>
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
+#if BITS_PER_LONG == 64
+#define jh7100_reset_read	readq
+#define jh7100_reset_write	writeq
+#else
+#define jh7100_reset_read	readl
+#define jh7100_reset_write	writel
+#endif
+
+/*
+ * Writing a 1 to the n'th bit of the m'th ASSERT register asserts
+ * line 32m + n, and writing a 0 deasserts the same line.
+ * Most reset lines have their status inverted so a 0 bit in the STATUS
+ * register means the line is asserted and a 1 means it's deasserted. A few
+ * lines don't though, so store the expected value of the status registers when
+ * all lines are asserted.
+ */
+static const DECLARE_BITMAP(jh7100_reset_asserted, 4 * 32) = {
+	BITMAP_FROM_U64(BIT_ULL_MASK(JH7100_RST_U74) |
+			BIT_ULL_MASK(JH7100_RST_VP6_DRESET) |
+			BIT_ULL_MASK(JH7100_RST_VP6_BRESET) |
+			BIT_ULL_MASK(JH7100_RST_HIFI4_DRESET) |
+			BIT_ULL_MASK(JH7100_RST_HIFI4_BRESET)),
+	BITMAP_FROM_U64(BIT_ULL_MASK(JH7100_RST_E24)),
+};
+
+struct jh7100_reset {
+	struct reset_controller_dev rcdev;
+	/* protect registers against concurrent read-modify-write */
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
+static int jh7100_reset_update(struct reset_controller_dev *rcdev,
+			       unsigned long id, bool assert)
+{
+	struct jh7100_reset *data = jh7100_reset_from(rcdev);
+	unsigned long offset = id / BITS_PER_LONG;
+	void __iomem *reg_assert = data->base + JH7100_RESET_ASSERT0 + offset * sizeof(long);
+	void __iomem *reg_status = data->base + JH7100_RESET_STATUS0 + offset * sizeof(long);
+	unsigned long mask = BIT_MASK(id);
+	unsigned long done = jh7100_reset_asserted[offset] & mask;
+	unsigned long value;
+	unsigned long flags;
+	int ret;
+
+	if (!assert)
+		done ^= mask;
+
+	spin_lock_irqsave(&data->lock, flags);
+
+	value = jh7100_reset_read(reg_assert);
+	if (assert)
+		value |= mask;
+	else
+		value &= ~mask;
+	jh7100_reset_write(value, reg_assert);
+
+	/* if the associated clock is gated, deasserting might otherwise hang forever */
+	ret = readx_poll_timeout_atomic(jh7100_reset_read, reg_status, value,
+				        (value & mask) == done, 0, 1000);
+
+	spin_unlock_irqrestore(&data->lock, flags);
+	return ret;
+}
+
+static int jh7100_reset_assert(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	return jh7100_reset_update(rcdev, id, true);
+}
+
+static int jh7100_reset_deassert(struct reset_controller_dev *rcdev,
+				 unsigned long id)
+{
+	return jh7100_reset_update(rcdev, id, false);
+}
+
+static int jh7100_reset_reset(struct reset_controller_dev *rcdev,
+			      unsigned long id)
+{
+	int ret;
+
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
+	unsigned long offset = id / BITS_PER_LONG;
+	void __iomem *reg_status = data->base + JH7100_RESET_STATUS0 + offset * sizeof(long);
+	unsigned long value = jh7100_reset_read(reg_status);
+	unsigned long mask = BIT_MASK(id);
+
+	return !((value ^ jh7100_reset_asserted[offset]) & mask);
+}
+
+static const struct reset_control_ops jh7100_reset_ops = {
+	.assert		= jh7100_reset_assert,
+	.deassert	= jh7100_reset_deassert,
+	.reset		= jh7100_reset_reset,
+	.status		= jh7100_reset_status,
+};
+
+static int __init jh7100_reset_probe(struct platform_device *pdev)
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
+	.driver = {
+		.name = "jh7100-reset",
+		.of_match_table = jh7100_reset_dt_ids,
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver_probe(jh7100_reset_driver, jh7100_reset_probe);
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
