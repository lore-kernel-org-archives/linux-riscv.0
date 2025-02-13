Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9934C021A8
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 20:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NRTiglTpyqMKxgMFKUmr/vpsPPH4d5CAcmIJaHbQn2A=; b=RVMpQMJdO7rrF0
	8tGKXEikffWXTc5hM2WOSc7UaD66VOVzwOlf6lFdLUFZ487hrWLkPd1A21+T7orBKJgRbXcFHcv3t
	+H8Ce8fL/rV2pAum5zW3DBPO9W8zHEtnL/Bm2djx+8dSvx4iQukZRS4fG3Z5O3Ataqgl0w0aR+EjG
	2omkn2Atv6Zh6E2VoRMCZhoTPj18E5nqJTfCa2hNlCrR76oNIZBYBe5Zwdew6w1LM+4SOg/s+L0l5
	y8W6HczDyE3pHK01kYSETtRV2+Rg4lRElo/4Oi4LUSGAZR+I/eZ4I9KhvI3UI2LhM9Un2ubVD1t8R
	RxZziDTKgykcr3GCM9ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tig1S-0000000CZTy-3itL;
	Thu, 13 Feb 2025 20:41:22 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tieEH-0000000CIFb-0DW2
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 18:46:30 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ab7e80c4b55so258569366b.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 10:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739472387; x=1740077187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HaEihAiyP6MocC5Oa52F4VzuNeOxClEAtoQkxcRqaYg=;
        b=MndlFiDeaSy8/KysnsoBA0Av9ME6O15aLarJIA3Rl7iMDyQ2EtZMVZdHWbUqWRvIjU
         fALaObZpyybXiYXJxMbEc9tlROPqpuLJSOfjn1BzWq39t2mvJXBortAF+xXZfJt1/EPA
         fcwnS1HyC08f45FaJcNHVUUweTghTsusQAF5/YsgTRXnZo1dpfznIuvhVQDVwbJZfcFK
         4WpLIvMNjYcO8x2UgaU9lcvjerqO4SsNXNeUuD/FfCB1RZkAAnDJQ0wFi7SCZOZjGzpv
         2L/ssQvYUhxkMzTjD8FSe9271+RcJle2f4fmx9aZ9/+h/Uh3rQ9Nb74lHWDXrI8fOsHf
         12oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739472387; x=1740077187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HaEihAiyP6MocC5Oa52F4VzuNeOxClEAtoQkxcRqaYg=;
        b=D3B51yfRIe0nlKL1JMkeHUghH5VdZRjgR+ULNauHSvMSO5Sq3z9w2w6hNq4EL0ogCL
         bA9/kYxKYuml5eLVYZKKVH5Tbzh+Pjry6bF+6v4zKNfZsE/MFlhnVBIe/LHB85G8rtr0
         dk62tBn8AvKA+4CR/AOiFyWvhuzXLiv9UIk2oEwzC21QlUNqqZNgC+Pq0QcHFVV7lpab
         a91NXk6zrzjqT6Z5ZOLbaPruGqD7+Q9STH1QuCv9Ah2pocFYEKME0R4ujIuS/IGaeMtL
         HWxEHFXMdkIh06PdsVdvWGZJyg8qiKpgZCy35tFZkN2R/3L8hEp/W1z+DAZ5AnEXBqpa
         +4fg==
X-Gm-Message-State: AOJu0YzJsrJIvNW8B3dsvmXpwv2WyyFiEgZSl/3XhEvEcWb6YsJs0KA0
	9QBVLROwA8PHZUwwfbDzjFuMK28oyCDUG5oh9J0RRGiuxqcYVFbOYiXDByoW
X-Gm-Gg: ASbGncuwGCUSqOggL6tZUv7OFMZ4YpbpYTDjQcEvByX5VvrJ3SBPW5EJxCqppLUGHYn
	q0Sn9Dd+gXyjPLPO0fHuHQ+wZPYcjiefHvZ/KcZUF85iutCcqkit2QhscUEgggTB9Wyro5fQggI
	UlsGUzayQ6khkOK3RBqPtj405i+6uCYjb7aNVaX4UTRzj8pr18XBD/gYA9EAw9NVNBPF6uLAaM6
	E6sGYayBQrdFyqwYkdDfJ+FsTE0CXQprBDQOX7YHrDtFioD99ZTt/oPImq4ZM6kB9udG8lNkStU
	kA4ydPUqu2KXhwebG8AG5jiVHvgo
X-Google-Smtp-Source: AGHT+IGGkWWLaNNzOzd7hKMrdf41hfYgyJmTTQbUi197zNRcg+XO4S8rTNRAVGB7tDq/vKYEFmIXRw==
X-Received: by 2002:a17:906:6a23:b0:ab6:dace:e763 with SMTP id a640c23a62f3a-aba5017e5d9mr408825466b.38.1739472387157;
        Thu, 13 Feb 2025 10:46:27 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba533998e2sm181360466b.134.2025.02.13.10.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 10:46:26 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	dlan@gentoo.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [PATCH v10 2/2] rtc: sophgo: add rtc support for Sophgo CV1800 SoC
Date: Thu, 13 Feb 2025 19:46:15 +0100
Message-ID: <20250213184622.2099324-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213184622.2099324-1-alexander.sverdlin@gmail.com>
References: <20250213184622.2099324-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_104629_099795_9547FE2C 
X-CRM114-Status: GOOD (  23.21  )
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

From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>

Implement the RTC driver for CV1800, which able to provide time alarm.

Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changes since v9:
- further simplified bitmask macros;
- unconditional RTC start (rtc_enable_sec_counter()), otherwise
didn't start on SG2000;
- dropped ANA_CALIB modification (has been forgotten in v8 with
the drop of SW calibration to switch to HW calibration);
- successfully tested on SG2000;

 drivers/rtc/Kconfig      |  10 ++
 drivers/rtc/Makefile     |   1 +
 drivers/rtc/rtc-cv1800.c | 223 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 234 insertions(+)
 create mode 100644 drivers/rtc/rtc-cv1800.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 0bbbf778ecfa..019622db3e93 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1159,6 +1159,16 @@ config RTC_DRV_DS2404
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-ds2404.
 
+config RTC_DRV_CV1800
+	tristate "Sophgo CV1800 RTC"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	help
+	  If you say yes here you get support the RTC driver
+	  for Sophgo CV1800 chip.
+
+	  This driver can also be built as a module. If so, the
+	  module will be called rtc-cv1800.
+
 config RTC_DRV_DA9052
 	tristate "Dialog DA9052/DA9053 RTC"
 	depends on PMIC_DA9052
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 489b4ab07068..621b30a33dda 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -44,6 +44,7 @@ obj-$(CONFIG_RTC_DRV_CADENCE)	+= rtc-cadence.o
 obj-$(CONFIG_RTC_DRV_CMOS)	+= rtc-cmos.o
 obj-$(CONFIG_RTC_DRV_CPCAP)	+= rtc-cpcap.o
 obj-$(CONFIG_RTC_DRV_CROS_EC)	+= rtc-cros-ec.o
+obj-$(CONFIG_RTC_DRV_CV1800)	+= rtc-cv1800.o
 obj-$(CONFIG_RTC_DRV_DA9052)	+= rtc-da9052.o
 obj-$(CONFIG_RTC_DRV_DA9055)	+= rtc-da9055.o
 obj-$(CONFIG_RTC_DRV_DA9063)	+= rtc-da9063.o
diff --git a/drivers/rtc/rtc-cv1800.c b/drivers/rtc/rtc-cv1800.c
new file mode 100644
index 000000000000..63d36f68a119
--- /dev/null
+++ b/drivers/rtc/rtc-cv1800.c
@@ -0,0 +1,223 @@
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
+#define ALARM_ENABLE_MASK      BIT(0)
+#define SET_SEC_CNTR_VAL_INIT  GENMASK(29, 28)
+#define SEL_SEC_PULSE          BIT(31)
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
+	regmap_update_bits(info->rtc_map, SEC_PULSE_GEN, SEL_SEC_PULSE, 0);
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
+	rtc_enable_sec_counter(rtc);
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
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
