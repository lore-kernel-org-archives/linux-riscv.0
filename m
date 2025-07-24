Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24458C87FD1
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 20:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g0L/e9q81nmD0ApfF4LHg6iaOlrm6egBOiWcbsCkyPg=; b=cksw0SwAc7Sju0
	bNEEoSuCJOE8wncyoY7lYzu/nDCFjT8QwxXtPK5wG96QDJUZehzsDWN0YHKbJxP0chRkRN8DpvONT
	eilQgN1wpI0PkeJcPYVy5TqGLak9rmmdMaa/+0G7ZONXt/8EEpbrKz7COkl6Lr55CV8QmpXGqGh/v
	VN1f/KLoNTdYk47wfKVt5iXmg8yD1fT9UQRS4kB2RTbcwOhZFq6LZ0FM/52okRP3sDAn8GytP7Ral
	8d9a7VvuXkZIpOfHX7EM9zSlW974eNnl2owPQb+6Sa9kwi6H/PpWYLLL8tAR/LbIoFykcQH5+tCAR
	1Q2y+p4adR5l6ZXYm9sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf2VL-00000008NuR-0EaH;
	Thu, 24 Jul 2025 20:25:27 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf2VH-00000008NsT-3anK
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 20:25:25 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-879c3222a14so48250739f.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Jul 2025 13:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753388723; x=1753993523; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lc2aqqc97NOP0EfL+BSZC9Lj19cWycz2K5gJfriPT8I=;
        b=w/77lKGN7Zhgmzf9/26sbkcPxTQ/vLf8Gur264+WC8gAK4avXtCTwa0u5aJZqRBn8j
         81kFryKYGTifLmgMly6ACiw89bV+wMKHdtMUrYHPEOCnPkDZax5w8pEjMMLUZOUdK8ZN
         MB0i2B9DxAXKVm1k6SGiyT/j9JAUCw79BSTvUe5whUgXmeDpUrRg5HFLTYAsIdpanN/R
         3nAeouM4P72DebYGqByUODu2uuLhIuRKzihrjy5HRgajFdliMuCrz5CXPtp2lheTyLVb
         91PFFdWIHXZTgOXeh0VUU9X9N9evu+X7BFncs1FDrRS5YPqJtTXCgoNvjpdiF06+feK7
         aTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753388723; x=1753993523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lc2aqqc97NOP0EfL+BSZC9Lj19cWycz2K5gJfriPT8I=;
        b=eHPpvLuQf+pAOlEt6tjsdIjaqo8AG+YmE5KIAoWEXHbiCL0CaMHqyxlO66DtCSDSrs
         fTICXbeu3VeNbKMXbWuMP+PQNdkEdv62WE/ZGc1+5PKGFqCusLmmzWUSy8ejlxRF+0VD
         HuNOv3/xDaYSGOaGoA74CWtYOgkBPmKyb37jf/nb9aTKsZhJ3xa79AdFnX6I8svcEkeS
         DAstOXXBmXpe9ZZ+Q02UqVZpjwjEHu0HF/ZxlXhJKRFBzlZoa3Jr/tr8yIn9ntfF3nQD
         J/xoFldxV4KzFdlYwzL5YE+/GEOIEsLtbxWQdCSQtwwDMr6nZEcJz1pLC7vaucppItWq
         mV7w==
X-Forwarded-Encrypted: i=1; AJvYcCWCoGTt0oWipJW/YIOKx4KicldmOCvxn7oeeHkZPCtDyJUdC2bdJLZCkkSxv/wGyoP+3LOonyNGOsNSEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxK8XficQ53olsimFPB5PdGuf5fsuJCNEi+hpo3zlOjX1jUSyp9
	RWszncM9JuEAX+TulyTXmL/sZvhTd4DqoBxCC7F73oG4T6k/m7g7riZAxoh0n9rvUpQ=
X-Gm-Gg: ASbGncsBgj6MJDISKjL9GIPVYL8ss/FRoP3jFCQsyTsBJ+Dz6IdmI+TuT2TcIMcOURq
	/xwUu88g7e95TuZPEB2V8hmSeoHbZ3a1gN4SUV1fwfZGS1MdVW33UTOqd6XyKpmnRnQeOuVEl9d
	f6EXANotZapGq4y5h9jdS2gt5/ug48QfbjjaBxGA8IdwrQYIGpuFFBa+u50VsAiT9mo+V+Aydbh
	yCkdSoZ7yt80+T18demYesc8v4trbS/KOVmjBE6Pasitwsl786oO5vG7IwLv9JaPcqbRF1meSul
	YjCDRjNZufQJNkHmAP9m6TuK/l/GQjLwvDdbui4nwdmoOV+Kfv9jimWiKw4uouWhIZzk9X30gi3
	sESz1zAcTIWNKwKmMvQNCejJT8gqRzwqBuFoPEimV
X-Google-Smtp-Source: AGHT+IG5crWSYMqOT4gzv3/s0kwhaMnMRggcqK/SrWQWiRkfz5Jy1E/lYbJb+xTUBrb7PdJVKYvuFQ==
X-Received: by 2002:a05:6602:3710:b0:876:19b9:1aaa with SMTP id ca18e2360f4ac-87c65037cbamr1427124639f.9.1753388723127;
        Thu, 24 Jul 2025 13:25:23 -0700 (PDT)
Received: from zoltan.localdomain ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-87c74316a3bsm63080239f.23.2025.07.24.13.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 13:25:22 -0700 (PDT)
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
Subject: [PATCH v9 4/8] regulator: spacemit: support SpacemiT P1 regulators
Date: Thu, 24 Jul 2025 15:25:05 -0500
Message-ID: <20250724202511.499288-5-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724202511.499288-1-elder@riscstar.com>
References: <20250724202511.499288-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_132523_910557_F50090BB 
X-CRM114-Status: GOOD (  22.25  )
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
 drivers/regulator/Kconfig       |  12 +++
 drivers/regulator/Makefile      |   1 +
 drivers/regulator/spacemit-p1.c | 157 ++++++++++++++++++++++++++++++++
 3 files changed, 170 insertions(+)
 create mode 100644 drivers/regulator/spacemit-p1.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 7423954153b07..3e7feeebf8aca 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1395,6 +1395,18 @@ config REGULATOR_SLG51000
 	  The SLG51000 is seven compact and customizable low dropout
 	  regulators.
 
+config REGULATOR_SPACEMIT_P1
+	tristate "SpacemiT P1 regulators"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
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
index be98b29d6675d..278f5b8d1c7d7 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -162,6 +162,7 @@ obj-$(CONFIG_REGULATOR_S5M8767) += s5m8767.o
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
