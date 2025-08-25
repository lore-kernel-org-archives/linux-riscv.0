Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306BECA0FE7
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 17:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E1KSZqWxnaeaoHq9s+hawv4GscqNe/8UBOXKhpwz4XU=; b=F9kDyV5MPn9tyZ
	vtCDMJQI/bTfcs/Cg2YUJ9IeJqE7poZ7abX4CkhUXuzVoVpo0IlOdVdLJ8dY/2ryqsZrV4OlYrl75
	V3sFrfOG/3s5sYHUia1jkFvgK0byRP+rqGeadPmwXKLenrL2+TPUt5v1DL58ANhJdKclRUPaDKaRs
	cHfTBaGs+nyH/MumHSCwDMlhXMjY2uFq8fGt/00qnzlBwmcIQQlTTqFqCg2nBg5BkX0lPs4Vi1UiG
	fIEFFyXSJA6XN/mk35jqUa5CjaMXi0Lze6n+v+BEoe7gw0qvrJRK+ujeW4+Ej2BK8wObt3ZvP7WGr
	X9xi3vK9+u1J+dQKncOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqbNb-00000008sN1-3Pat;
	Mon, 25 Aug 2025 17:53:15 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqasX-00000008ot3-0nzR
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 17:21:10 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3ee1ffc230cso3657945ab.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 Aug 2025 10:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1756142468; x=1756747268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXy+VdAdhd7u/OU26gkqfoc7kQ0LeV17yYrZSTQJAso=;
        b=1QWybE3kZ7WPT3zrN23IGvG2+PVExkl3URYfC3dI1eTebz3PuvyMqSVy/eh52R2Cd2
         Vwwd+PWRpT9I6V/dlcjNC3nqQ4EjLNlFaLn+IZJsRXT65iU7T/oN2n6XNlCmcjiQ8x2A
         RkaUPuUxOGEqd/GGcG4U6s7DOxswOdjmsNWpuMq64y9CxDAJ359MNwuREqqObyVxGUT9
         6zu4oq3v52y9F1djzJEZNx8yMwb1tuORbgaHT+FAKpPigL5WtXJ3ZT0ARebbydx1RVeu
         VXpSYf+aU81JxYQefjjs50TTSfWznvv0rXCFtH3nb4NwfcMnlJwHTqORlkkqxKimHFPg
         O6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756142468; x=1756747268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXy+VdAdhd7u/OU26gkqfoc7kQ0LeV17yYrZSTQJAso=;
        b=HEPPXqJSQFpfRYq0B4r7YQ7uWQ+LhND66kP5/eNcMG/XzZVIuPONi4hTCzWALwZbU1
         F8boWBa6WdoNBB/DtjxSXEp6lRmfv5Wdb8LhDRdQ1Lez3enZqYtbLl1MhoTZoNBf/u3l
         zchGkwpNzMJqjKOcpwT4uRxbi7wyXpcGpTGUj0usCRk+7IvvSkOFDLwOQkkoW4Ojl8s9
         grgBD88T3KPeIFvT7aoRw+kTjRNOcBrhG/dwzV5TFxHGVryBRgf85c+0YRPfMpxGKK9O
         M/7Z48DdEw4sq9wiZiXvuL1jr9UyBomMTSLgmNHl9F6CbE81IElJAINwXLaXgh5v8uGk
         Gsvg==
X-Forwarded-Encrypted: i=1; AJvYcCXfi5o2mWzN/Y9vPJSiuvoOgdtn1FerSBVp5oLViwkXz9nHzWxeWAXUi1DrYsRPqMGZUYwXsNAC+pT5ag==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbEI186rd9qXy/7pUfbbT78vWhURRFV2uRXP3Hqb5Q4iFnSuJO
	FribR46CQttB5r22ZfUqe16kkyrcgLbokyMW3jPfARS9A0gN5Jm8OyJW3M063Eyc9kU=
X-Gm-Gg: ASbGnctf1unmxjNMyb4YVNQt8n8/bt//e8OcvKvYVLPOPkusFjXY2rztu4NeIfzjapO
	TEd99wy9EQ8NPaElww58t3hGwE6LStoZmntiAWro0qiaY6gWYIa3x3XiWf86tvRF44icItPHbzy
	gC058U1ygaawfEaS6vY0Y3H1vt8Qmxmm05lumsloX0CxRToKKMVE1YJgsB6y9qQr7FVOtlH4vjW
	Fgy6+Y6NZpB+3h5S3oFyitk3QvAMmohGM7pq7tIf5k1ynAoPJP/TdG7zZRELnavYgmGhdMj5wgH
	D1XV6NXYSJOaEsb+rm1aaOMKb93/zXCa7sQkMmXHabgUKEUb4bVFPNQtRGes+N4MaZ8rBgLAun2
	xNfft8HMmLwFM6F3J2PegddyVNZAibnaFD6GG7Zm8R/1gyqRdFQjwChqSSuRvGR+wNaUw+HEnJf
	k6
X-Google-Smtp-Source: AGHT+IHoFmaLa+PK1sp0rjos+pgvmeypA/+dReczs9jaPBj2sO9sfvd3GZ8CbQ1JUiKdqPbu4pTeHg==
X-Received: by 2002:a05:6e02:1607:b0:3e3:fd25:f6a with SMTP id e9e14a558f8ab-3e921a5c447mr179490325ab.11.1756142468057;
        Mon, 25 Aug 2025 10:21:08 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-886e60c4737sm76275439f.26.2025.08.25.10.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:21:07 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v13 3/7] regulator: spacemit: support SpacemiT P1 regulators
Date: Mon, 25 Aug 2025 12:20:52 -0500
Message-ID: <20250825172057.163883-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250825172057.163883-1-elder@riscstar.com>
References: <20250825172057.163883-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_102109_234667_03180C6C 
X-CRM114-Status: GOOD (  22.45  )
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

Add support for the regulators found in the SpacemiT P1 PMIC.  This
PMIC provides 6 buck converters and 12 LDO regulators.

The PMIC is implemented as a multi-function device.  These regulators
are probed based on this driver being named in a MFD cell in the simple
MFD I2C driver.

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/Kconfig       |  13 +++
 drivers/regulator/Makefile      |   1 +
 drivers/regulator/spacemit-p1.c | 157 ++++++++++++++++++++++++++++++++
 3 files changed, 171 insertions(+)
 create mode 100644 drivers/regulator/spacemit-p1.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 223a500370d09..92a0720823f04 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1423,6 +1423,19 @@ config REGULATOR_SLG51000
 	  The SLG51000 is seven compact and customizable low dropout
 	  regulators.
 
+config REGULATOR_SPACEMIT_P1
+	tristate "SpacemiT P1 regulators"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on I2C
+	select MFD_SPACEMIT_P1
+	default ARCH_SPACEMIT
+	help
+	  Enable support for regulators implemented by the SpacemiT P1
+	  power controller.  The P1 implements 6 high-efficiency buck
+	  converters and 12 programmable LDO regulators.  To compile this
+	  driver as a module, choose M here.  The module will be called
+	  "spacemit-pmic".
+
 config REGULATOR_STM32_BOOSTER
 	tristate "STMicroelectronics STM32 BOOSTER"
 	depends on ARCH_STM32 || COMPILE_TEST
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 54e67e1c0c676..44c750f200421 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -165,6 +165,7 @@ obj-$(CONFIG_REGULATOR_S5M8767) += s5m8767.o
 obj-$(CONFIG_REGULATOR_SC2731) += sc2731-regulator.o
 obj-$(CONFIG_REGULATOR_SKY81452) += sky81452-regulator.o
 obj-$(CONFIG_REGULATOR_SLG51000) += slg51000-regulator.o
+obj-$(CONFIG_REGULATOR_SPACEMIT_P1) += spacemit-p1.o
 obj-$(CONFIG_REGULATOR_STM32_BOOSTER) += stm32-booster.o
 obj-$(CONFIG_REGULATOR_STM32_VREFBUF) += stm32-vrefbuf.o
 obj-$(CONFIG_REGULATOR_STM32_PWR) += stm32-pwr.o
diff --git a/drivers/regulator/spacemit-p1.c b/drivers/regulator/spacemit-p1.c
new file mode 100644
index 0000000000000..d437e6738ea1e
--- /dev/null
+++ b/drivers/regulator/spacemit-p1.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for regulators found in the SpacemiT P1 PMIC
+ *
+ * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights reserved.
+ * Derived from code from SpacemiT.
+ *	Copyright (c) 2023, SPACEMIT Co., Ltd
+ */
+
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/linear_range.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/driver.h>
+
+#define MOD_NAME	"spacemit-p1-regulator"
+
+enum p1_regulator_id {
+	P1_BUCK1,
+	P1_BUCK2,
+	P1_BUCK3,
+	P1_BUCK4,
+	P1_BUCK5,
+	P1_BUCK6,
+
+	P1_ALDO1,
+	P1_ALDO2,
+	P1_ALDO3,
+	P1_ALDO4,
+
+	P1_DLDO1,
+	P1_DLDO2,
+	P1_DLDO3,
+	P1_DLDO4,
+	P1_DLDO5,
+	P1_DLDO6,
+	P1_DLDO7,
+};
+
+static const struct regulator_ops p1_regulator_ops = {
+	.list_voltage		= regulator_list_voltage_linear_range,
+	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+	.set_voltage_time_sel   = regulator_set_voltage_time_sel,
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+};
+
+/* Selector value 255 can be used to disable the buck converter on sleep */
+static const struct linear_range p1_buck_ranges[] = {
+	REGULATOR_LINEAR_RANGE(500000, 0, 170, 5000),
+	REGULATOR_LINEAR_RANGE(1375000, 171, 254, 25000),
+};
+
+/* Selector value 0 can be used for suspend */
+static const struct linear_range p1_ldo_ranges[] = {
+	REGULATOR_LINEAR_RANGE(500000, 11, 127, 25000),
+};
+
+/* These define the voltage selector field for buck and LDO regulators */
+#define BUCK_MASK		GENMASK(7, 0)
+#define LDO_MASK		GENMASK(6, 0)
+
+#define P1_ID(_TYPE, _n)	P1_ ## _TYPE ## _n
+#define P1_ENABLE_REG(_off, _n)	((_off) + 3 * ((_n) - 1))
+
+#define P1_REG_DESC(_TYPE, _type, _n, _s, _off, _mask, _nv, _ranges)	\
+	{								\
+		.name			= #_type #_n,			\
+		.supply_name		= _s,				\
+		.of_match		= of_match_ptr(#_type #_n),	\
+		.regulators_node	= of_match_ptr("regulators"),	\
+		.id			= P1_ID(_TYPE, _n),		\
+		.n_voltages		= _nv,				\
+		.ops			= &p1_regulator_ops,		\
+		.owner			= THIS_MODULE,			\
+		.linear_ranges		= _ranges,			\
+		.n_linear_ranges	= ARRAY_SIZE(_ranges),		\
+		.vsel_reg		= P1_ENABLE_REG(_off, _n) + 1,	\
+		.vsel_mask		= _mask,			\
+		.enable_reg		= P1_ENABLE_REG(_off, _n),	\
+		.enable_mask		= BIT(0),			\
+	}
+
+#define P1_BUCK_DESC(_n) \
+	P1_REG_DESC(BUCK, buck, _n, "vcc", 0x47, BUCK_MASK, 254, p1_buck_ranges)
+
+#define P1_ALDO_DESC(_n) \
+	P1_REG_DESC(ALDO, aldo, _n, "vcc", 0x5b, LDO_MASK, 117, p1_ldo_ranges)
+
+#define P1_DLDO_DESC(_n) \
+	P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 117, p1_ldo_ranges)
+
+static const struct regulator_desc p1_regulator_desc[] = {
+	P1_BUCK_DESC(1),
+	P1_BUCK_DESC(2),
+	P1_BUCK_DESC(3),
+	P1_BUCK_DESC(4),
+	P1_BUCK_DESC(5),
+	P1_BUCK_DESC(6),
+
+	P1_ALDO_DESC(1),
+	P1_ALDO_DESC(2),
+	P1_ALDO_DESC(3),
+	P1_ALDO_DESC(4),
+
+	P1_DLDO_DESC(1),
+	P1_DLDO_DESC(2),
+	P1_DLDO_DESC(3),
+	P1_DLDO_DESC(4),
+	P1_DLDO_DESC(5),
+	P1_DLDO_DESC(6),
+	P1_DLDO_DESC(7),
+};
+
+static int p1_regulator_probe(struct platform_device *pdev)
+{
+	struct regulator_config config = { };
+	struct device *dev = &pdev->dev;
+	u32 i;
+
+	/*
+	 * The parent device (PMIC) owns the regmap.  Since we don't
+	 * provide one in the config structure, that one will be used.
+	 */
+	config.dev = dev->parent;
+
+	for (i = 0; i < ARRAY_SIZE(p1_regulator_desc); i++) {
+		const struct regulator_desc *desc = &p1_regulator_desc[i];
+		struct regulator_dev *rdev;
+
+		rdev = devm_regulator_register(dev, desc, &config);
+		if (IS_ERR(rdev))
+			return dev_err_probe(dev, PTR_ERR(rdev),
+					     "error registering regulator %s\n",
+					     desc->name);
+	}
+
+	return 0;
+}
+
+static struct platform_driver p1_regulator_driver = {
+	.probe = p1_regulator_probe,
+	.driver = {
+		.name = MOD_NAME,
+	},
+};
+
+module_platform_driver(p1_regulator_driver);
+
+MODULE_DESCRIPTION("SpacemiT P1 regulator driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" MOD_NAME);
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
