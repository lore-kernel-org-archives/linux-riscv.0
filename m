Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2309C10F1A
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Apr 2024 06:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JVnti2h1SUz0YhQJXkY1u6dHHEJIOtmzm/KFD4heTyg=; b=mfjuN+/vjKxxw5
	ZiheFqnVpKGEYhPCNi3TdrT5fq8b7t8Y0mka0uq/FkZtrCcReG+NGoYZjiShf/OgPOzRlGfZKyOpH
	qteB9yDOyFHErh5t9ezkkXyIxkzn/winINY2qcBxcV3XtPm7SyU5TJPFeEVKP3AhBWh0mYPJYnzOW
	yHWnn5SaZAYPgCFDX3mWWNuvd+xoNYNSffHfjk/DkVLIA0ufVQNKAjtyPAlHGCOt0KKSDuRx3oDTd
	94XymMXzufKbXDX7ZcYdfr1NYp50pc+bKuAonHivjI7EVepUh9z14uRVc7bzRMnbKaBlNLJ+GqCdy
	OjoE5QuFYXbrfbocq0vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0xim-0000000GwVl-2XRB;
	Sun, 28 Apr 2024 06:09:08 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0xii-0000000GwSc-3x4N
	for linux-riscv@lists.infradead.org;
	Sun, 28 Apr 2024 06:09:07 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6f30f69a958so3017991b3a.1
        for <linux-riscv@lists.infradead.org>; Sat, 27 Apr 2024 23:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714284543; x=1714889343; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQ/cr/o2v0aIWA3n4eKcrsi1bggODRD2iXRP5Vxb9p4=;
        b=m0aUk5CNjEZvTFMewLvcpZUEpcWgmO4B5dfIq9kV4kGbtTAehsbcnkFbcOBX0TfAeM
         cUCZae31dZ6y+gBKzc9bJzPHrIa0wBnUf4XHfPOaM2yuZWaknoiew+AR2mwi7Sh6hRe4
         7DV69S00lCtZ3Bi6VixTY+OJv/jL3+s6dvMtuOgRigvxA3Y7OO7cKTDCzybSMeWBXHuw
         HKwU8F+yxfhVxGkT2k5DZWvsyv+V5ZEbgoqlAvMOL+L7cUuNI2VIZ4Yar2o9FFgcd6ke
         DRt/IGwglNl08eikSq921KisAbPZFSjHziw2iWsu2Bci9DRF7I40Skg4a74Ae6blA/6h
         ESDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714284543; x=1714889343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQ/cr/o2v0aIWA3n4eKcrsi1bggODRD2iXRP5Vxb9p4=;
        b=CJZDIq8dgWhj1tbLO1x+J2dOXCS/53SedKvwvtAanXJw/dR5wWZzk10AV7svT9edQV
         AjuKkAeD5w61LapQUi6pIIGlst8xIIdxOF//vhvx3NWQDB5wKlr7IIc8Wp6d6J0MKS1Y
         QkOsLuRU+ECsRESVzpS6UXW9FLrwgy/ga7d0b7o368vw7B20pDeb44xZ0dUXM2GF/FWM
         0IdhIX8+bsRKVAmWY1guWCqElQqz2rJj8DGELsSL9rw3EvMOuJQdZmF0OMQBDopytoiC
         E+YF3U9XktzenY/xarFeQtEV1/JyJb0wd8xJuI/zyNY2zuPnra0wXVZQpoE3EDxabZuR
         AGlg==
X-Forwarded-Encrypted: i=1; AJvYcCWyoluc0DWnaiQR0t/vk8xqpA3z7jWtVbjTmsW5bu+SMzAFYZwVDC2fgOkhArf7TQ80AZ9IuGBrFh6zFLXnYRdiZq40TaX2zLMu9VGKwdSJ
X-Gm-Message-State: AOJu0Yz0o/9efmUcZ/36dYS8JZ45EVt1QcGKR2YFKTjgsr/5X7nUhAC5
	cnrFc6A63/w4VaUP4zA79xBrYaX59RdKocu4kORpSqEnBGcJqhDz78eVhTroRgI=
X-Google-Smtp-Source: AGHT+IFbAQXAHXXkjg7fWrBzvdl+GD/EcyepJO7qx73V82/l/P/rcag1S2pM4yrz00RAOwgxMB/FZw==
X-Received: by 2002:a05:6a00:996:b0:6e6:5396:ce43 with SMTP id u22-20020a056a00099600b006e65396ce43mr8962669pfg.7.1714284543199;
        Sat, 27 Apr 2024 23:09:03 -0700 (PDT)
Received: from localhost ([46.3.240.103])
        by smtp.gmail.com with ESMTPSA id x26-20020a056a000bda00b006e6c16179dbsm17180347pfu.24.2024.04.27.23.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 23:09:03 -0700 (PDT)
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: dlan@gentoo.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Subject: [PATCH v9 2/2] rtc: sophgo: add rtc support for Sophgo CV1800 SoC
Date: Sun, 28 Apr 2024 14:08:48 +0800
Message-Id: <20240428060848.706573-3-qiujingbao.dlmu@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240428060848.706573-1-qiujingbao.dlmu@gmail.com>
References: <20240428060848.706573-1-qiujingbao.dlmu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240427_230905_069979_700DFDA6 
X-CRM114-Status: GOOD (  22.55  )
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

Implement the RTC driver for CV1800, which able to provide time alarm.

Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
---
 drivers/rtc/Kconfig      |  10 ++
 drivers/rtc/Makefile     |   1 +
 drivers/rtc/rtc-cv1800.c | 240 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 251 insertions(+)
 create mode 100644 drivers/rtc/rtc-cv1800.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 2a95b05982ad..b7746ca22b94 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1138,6 +1138,16 @@ config RTC_DRV_DS2404
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-ds2404.
 
+config RTC_DRV_CV1800
+	tristate "Sophgo CV1800 RTC"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	help
+	  If you say yes here you get support the RTC driver
+	  for Sophgo CV1800 chip.
+
+	  This driver can also be built as a module.If so, the
+	  module will be called rtc-cv1800.
+
 config RTC_DRV_DA9052
 	tristate "Dialog DA9052/DA9053 RTC"
 	depends on PMIC_DA9052
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 3004e372f25f..a0861c0f3c89 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -42,6 +42,7 @@ obj-$(CONFIG_RTC_DRV_CADENCE)	+= rtc-cadence.o
 obj-$(CONFIG_RTC_DRV_CMOS)	+= rtc-cmos.o
 obj-$(CONFIG_RTC_DRV_CPCAP)	+= rtc-cpcap.o
 obj-$(CONFIG_RTC_DRV_CROS_EC)	+= rtc-cros-ec.o
+obj-$(CONFIG_RTC_DRV_CV1800)	+= rtc-cv1800.o
 obj-$(CONFIG_RTC_DRV_DA9052)	+= rtc-da9052.o
 obj-$(CONFIG_RTC_DRV_DA9055)	+= rtc-da9055.o
 obj-$(CONFIG_RTC_DRV_DA9063)	+= rtc-da9063.o
diff --git a/drivers/rtc/rtc-cv1800.c b/drivers/rtc/rtc-cv1800.c
new file mode 100644
index 000000000000..f975b169077a
--- /dev/null
+++ b/drivers/rtc/rtc-cv1800.c
@@ -0,0 +1,240 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * rtc-cv1800.c: RTC driver for Sophgo cv1800 RTC
+ *
+ * Author: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/irq.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/rtc.h>
+
+#define CTRL                   0x08
+#define ANA_CALIB              0x1000
+#define SEC_PULSE_GEN          0x1004
+#define ALARM_TIME             0x1008
+#define ALARM_ENABLE           0x100C
+#define SET_SEC_CNTR_VAL       0x1010
+#define SET_SEC_CNTR_TRIG      0x1014
+#define SEC_CNTR_VAL           0x1018
+
+/*
+ * When in VDDBKUP domain, this MACRO register
+ * does not power down
+ */
+#define MACRO_RO_T             0x14A8
+#define MACRO_RG_SET_T         0x1498
+
+#define CTRL_MODE_MASK         BIT(10)
+#define CTRL_MODE_OSC32K       0x00UL
+#define ALARM_ENABLE_MASK      BIT(0)
+#define SET_SEC_CNTR_VAL_INIT  GENMASK(29, 28)
+#define SEC_PULSE_SEL_INNER    BIT(31)
+#define SEC_PULSE_GEN_SEL_MASK GENMASK(30, 0)
+#define CALIB_SEL_FTUNE_MASK   GENMASK(30, 0)
+#define CALIB_SEL_FTUNE_INNER  0x00UL
+
+struct cv1800_rtc_priv {
+	struct rtc_device *rtc_dev;
+	struct regmap *rtc_map;
+	struct clk *clk;
+	int irq;
+};
+
+static const struct regmap_config cv1800_rtc_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static int cv1800_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
+
+	regmap_write(info->rtc_map, ALARM_ENABLE, enabled);
+
+	return 0;
+}
+
+static int cv1800_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
+	unsigned long alarm_time;
+
+	alarm_time = rtc_tm_to_time64(&alrm->time);
+
+	cv1800_rtc_alarm_irq_enable(dev, 0);
+
+	regmap_write(info->rtc_map, ALARM_TIME, alarm_time);
+
+	cv1800_rtc_alarm_irq_enable(dev, alrm->enabled);
+
+	return 0;
+}
+
+static int cv1800_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
+{
+	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
+	u32 enabled;
+	u32 time;
+
+	regmap_read(info->rtc_map, ALARM_ENABLE, &enabled);
+
+	alarm->enabled = enabled & ALARM_ENABLE_MASK;
+
+	regmap_read(info->rtc_map, ALARM_TIME, &time);
+
+	rtc_time64_to_tm(time, &alarm->time);
+
+	return 0;
+}
+
+static void rtc_enable_sec_counter(struct cv1800_rtc_priv *info)
+{
+	u32 sec_ro_t;
+	u32 sec;
+
+	/* select inner sec pulse */
+	regmap_update_bits(info->rtc_map, SEC_PULSE_GEN,
+			   (u32)(~SEC_PULSE_GEN_SEL_MASK),
+			   (u32)(~SEC_PULSE_SEL_INNER));
+
+	regmap_update_bits(info->rtc_map, ANA_CALIB,
+			   (u32)(~CALIB_SEL_FTUNE_MASK),
+			   CALIB_SEL_FTUNE_INNER);
+
+	sec = SET_SEC_CNTR_VAL_INIT;
+
+	/* load from MACRO register */
+	regmap_read(info->rtc_map, MACRO_RO_T, &sec_ro_t);
+	if (sec_ro_t > (SET_SEC_CNTR_VAL_INIT))
+		sec = sec_ro_t;
+
+	regmap_write(info->rtc_map, SET_SEC_CNTR_VAL, sec);
+	regmap_write(info->rtc_map, SET_SEC_CNTR_TRIG, 1);
+}
+
+static int cv1800_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
+	u32 sec;
+
+	regmap_read(info->rtc_map, SEC_CNTR_VAL, &sec);
+
+	rtc_time64_to_tm(sec, tm);
+
+	return 0;
+}
+
+static int cv1800_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
+	unsigned long sec;
+
+	sec = rtc_tm_to_time64(tm);
+
+	regmap_write(info->rtc_map, SET_SEC_CNTR_VAL, sec);
+	regmap_write(info->rtc_map, SET_SEC_CNTR_TRIG, 1);
+
+	regmap_write(info->rtc_map, MACRO_RG_SET_T, sec);
+
+	return 0;
+}
+
+static irqreturn_t cv1800_rtc_irq_handler(int irq, void *dev_id)
+{
+	struct cv1800_rtc_priv *info = dev_id;
+
+	rtc_update_irq(info->rtc_dev, 1, RTC_IRQF | RTC_AF);
+
+	regmap_write(info->rtc_map, ALARM_ENABLE, 0);
+
+	return IRQ_HANDLED;
+}
+
+static const struct rtc_class_ops cv1800_rtc_ops = {
+	.read_time = cv1800_rtc_read_time,
+	.set_time = cv1800_rtc_set_time,
+	.read_alarm = cv1800_rtc_read_alarm,
+	.set_alarm = cv1800_rtc_set_alarm,
+	.alarm_irq_enable = cv1800_rtc_alarm_irq_enable,
+};
+
+static int cv1800_rtc_probe(struct platform_device *pdev)
+{
+	struct cv1800_rtc_priv *rtc;
+	u32 ctrl_val;
+	void __iomem *base;
+	int ret;
+
+	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
+	if (!rtc)
+		return -ENOMEM;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	rtc->rtc_map = devm_regmap_init_mmio(&pdev->dev, base,
+					     &cv1800_rtc_regmap_config);
+	if (IS_ERR(rtc->rtc_map))
+		return PTR_ERR(rtc->rtc_map);
+
+	rtc->irq = platform_get_irq(pdev, 0);
+	if (rtc->irq < 0)
+		return rtc->irq;
+
+	rtc->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(rtc->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->clk),
+				     "clk not found\n");
+
+	platform_set_drvdata(pdev, rtc);
+
+	device_init_wakeup(&pdev->dev, 1);
+
+	rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc->rtc_dev))
+		return PTR_ERR(rtc->rtc_dev);
+
+	rtc->rtc_dev->ops = &cv1800_rtc_ops;
+	rtc->rtc_dev->range_max = U32_MAX;
+
+	ret = devm_request_irq(&pdev->dev, rtc->irq, cv1800_rtc_irq_handler,
+			       IRQF_TRIGGER_HIGH, "rtc alarm", rtc);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "cannot register interrupt handler\n");
+
+	regmap_read(rtc->rtc_map, CTRL, &ctrl_val);
+	ctrl_val &= CTRL_MODE_MASK;
+
+	if (ctrl_val == CTRL_MODE_OSC32K)
+		rtc_enable_sec_counter(rtc);
+
+	return devm_rtc_register_device(rtc->rtc_dev);
+}
+
+static const struct of_device_id cv1800_dt_ids[] = {
+	{ .compatible = "sophgo,cv1800-rtc" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, cv1800_dt_ids);
+
+static struct platform_driver cv1800_rtc_driver = {
+	.driver = {
+		.name = "sophgo-cv1800-rtc",
+		.of_match_table = cv1800_dt_ids,
+	},
+	.probe = cv1800_rtc_probe,
+};
+
+module_platform_driver(cv1800_rtc_driver);
+MODULE_AUTHOR("Jingbao Qiu");
+MODULE_DESCRIPTION("Sophgo cv1800 RTC Driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
