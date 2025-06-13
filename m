Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9416C71136
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 21:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d/5gxNAzmGNmNiginh5XS5l5MufYzyuC/28W9WQUP1I=; b=TfM43bVrQm40iN
	Qfz+uh1bjWOfc+nGYg25O6/mHS+cZ6PErxH7IxyKbe+DIMHIPLGKWa725xT0AwRf+TP2yqSEd0mQI
	PW7BnHzLEbZyUENJ0g4I9y0GXyVXyrAPH+rvUi1FKELkUvLL/KSzs6wgl3Zd3K2dWAiNqLwSeXXA1
	MoQNYSpCc4L8TjDLxUqoWPk0miAt/oqXl+rr3hJ92tyI1ZrJJhVFXlXIBiNrnzEcft4RwZCO8wXke
	x1ChGi97Dp2q0pk7UQt7C0cMCPpDqXsKLmUzvuQDg4qLudIHh1bN8bJ6WtptQ6cH8OntIUbWJ56iU
	r8UDbioT4JXi6MzQIwqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBaB-000000003vn-0l89;
	Fri, 13 Jun 2025 21:05:03 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBXD-000000003KD-3tux
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 21:02:01 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3da82c6c5d4so22182685ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 13 Jun 2025 14:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749848519; x=1750453319; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bayV79zaWlgDc/UJx6Jb5IeLhP0HuWPwi77b5RVh27g=;
        b=HyzrjpEgipJ3wvSK11ozoLkQGVMrDLjgCzEeVoPsBLRDbbXsg9KGZGjUWBe/4NvVmF
         59EUWnceL6f4CAEIyy8VeW97yVDoty5fwWezs2wSeQVcciTzKNWEJYokGwPDSycM/Qe5
         Uby7Z+WWDYtWRfF4/45hFO62m+B6ReOCAktQ01vWU6lYte1LVowMgPpLiGGMxJZtS56O
         ZNFF9vtxycFdB3OatqdpH5mtsiQGnBhV++ikt3EQGGvfJyqf6NJljeyQZCZzZGuaULfh
         tR9GZnHB35iHXgwG/CLg5v4Ayadx/Qyiv6D4rj816zGe/w4+0Fc9vzaEmRgkBJkEkjzF
         /cYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848519; x=1750453319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bayV79zaWlgDc/UJx6Jb5IeLhP0HuWPwi77b5RVh27g=;
        b=CpnJul6b+0TkBZqXJqIgK1IzSW7HAOiGFzF7DQjJ+oIB4esbHoWsro7AoKel/5j5h8
         idyyXrNXNb6UOwingpsafglQGNFXAlyg7QdMSz80Tm6siMjih/AHEMe68TwrTO5d68ml
         6mKX4v+sEvrN5yUj4K5BNczuxMarJnjhDFTBlD++nlyAAwuCBVcCZ637XRbCLzr5EbdB
         Dw1t1w5AQVnlOyyF3HA5oA4e1EVT4eQ7FKcINshL6vUdpSm2qF5VCEYL7eq0UdQBptvi
         MuedSfQRnqcx8TsRfiIijupF8hICRQaFnFW509VrewpR/S8UBueLImWgPzBlKpRH1qgr
         ChQg==
X-Forwarded-Encrypted: i=1; AJvYcCXFJRN9Eftsp563VbcBXkajas0OwWPsV79M99CrOR8F9tyOO1tKphLBEd07yk9Dz/hvDMTPV4lw4+wIQA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa7ZMCwC16BwdH/oyv5uI0nnC2UUBqfaJsyVF3ybSUsOyJPXh1
	HGm4iNDcmsrcuCLHWCC5YYNd1rwcVvvcTJUnr8a1ioQ/JVKkCgYbcmn9JeByhKVv5is=
X-Gm-Gg: ASbGncta7UHWD/i02M1e4vBEhwZZusTA/qnLX+MiEgIAinVlokKOa8K5Bsx7jB3qR1W
	DFBH1PG2fYE+/Wj0sFtgTnqv4/nGd6sMKSf883YXAI7P9UPUSlDZGzKcv4u5BhDehqnHTr8cnIe
	tf6afx8Fs/N8kkabKSzODRy8oqoATOknlbS8nXnOwZAz2A3JofZcK7ktgM6KuEuj2FBZfp8UUHe
	mNKqftOvtSeM61lJ4HCrWM88FuKOpA3n9jxMLIvTiPzads8tU9zEmhqLPef6753ONNNCVd3qDBT
	A8GgIlpgqxauV5Bvrvd0wLeLGYOPeJv52PAbayzL9UvQJ7z0OIv6tRYgj7clZgWmBI5wJglJHY8
	wADcWmORNYtaJZk3EdEptYxg3VkcxUOY=
X-Google-Smtp-Source: AGHT+IFLtieRvZ64VODdayKiID1ZTjmtaAjQzmjvcBqsglVzn2K9do6/FO22tJ0JBfPl2+tj1sKKFA==
X-Received: by 2002:a05:6e02:194d:b0:3dd:c78c:ec3e with SMTP id e9e14a558f8ab-3de07d01d7emr16581605ab.22.1749848518961;
        Fri, 13 Jun 2025 14:01:58 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019b44b3sm4996315ab.10.2025.06.13.14.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 14:01:58 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] regulator: spacemit: support SpacemiT P1 regulators
Date: Fri, 13 Jun 2025 16:01:46 -0500
Message-ID: <20250613210150.1468845-4-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250613210150.1468845-1-elder@riscstar.com>
References: <20250613210150.1468845-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_140159_966853_F78CD447 
X-CRM114-Status: GOOD (  21.44  )
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
PMIC provides six buck converters and 12 LDO regulators.

The PMIC is implemented as a multi-function device.  These regulators
are probed based on this driver being named in a MFD cell in the P1
PMIC driver.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/regulator/Kconfig       |   9 ++
 drivers/regulator/Makefile      |   1 +
 drivers/regulator/spacemit-p1.c | 154 ++++++++++++++++++++++++++++++++
 3 files changed, 164 insertions(+)
 create mode 100644 drivers/regulator/spacemit-p1.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 6d8988387da45..7bb7b8fad24f2 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1384,6 +1384,15 @@ config REGULATOR_SLG51000
 	  The SLG51000 is seven compact and customizable low dropout
 	  regulators.
 
+config REGULATOR_SPACEMIT_P1
+	tristate "SpacemiT P1 regulators"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	default ARCH_SPACEMIT
+	help
+	  Enable support for regulators implemented by the SpacemiT P1
+	  power controller.  The P1 implements 6 high-efficiency buck
+	  converters and 12 programmable LDO regulators.
+
 config REGULATOR_STM32_BOOSTER
 	tristate "STMicroelectronics STM32 BOOSTER"
 	depends on ARCH_STM32 || COMPILE_TEST
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index c0bc7a0f4e670..c58aecadd466e 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -161,6 +161,7 @@ obj-$(CONFIG_REGULATOR_S5M8767) += s5m8767.o
 obj-$(CONFIG_REGULATOR_SC2731) += sc2731-regulator.o
 obj-$(CONFIG_REGULATOR_SKY81452) += sky81452-regulator.o
 obj-$(CONFIG_REGULATOR_SLG51000) += slg51000-regulator.o
+obj-$(CONFIG_REGULATOR_SPACEMIT_P1) += spacemit-p1.o
 obj-$(CONFIG_REGULATOR_STM32_BOOSTER) += stm32-booster.o
 obj-$(CONFIG_REGULATOR_STM32_VREFBUF) += stm32-vrefbuf.o
 obj-$(CONFIG_REGULATOR_STM32_PWR) += stm32-pwr.o
diff --git a/drivers/regulator/spacemit-p1.c b/drivers/regulator/spacemit-p1.c
new file mode 100644
index 0000000000000..35c7b4a36e3ee
--- /dev/null
+++ b/drivers/regulator/spacemit-p1.c
@@ -0,0 +1,154 @@
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
+		.name = "spacemit-p1-regulator",
+	},
+};
+
+module_platform_driver(p1_regulator_driver);
+
+MODULE_DESCRIPTION("SpacemiT P1 regulator driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
