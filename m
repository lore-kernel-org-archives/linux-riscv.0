Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E408C021A6
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 21:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eCuG9btua/0oROWWPV+JrFFFrsFkOFs2iJUmMkrzKC4=; b=Nog7E0OUUJ1xwk
	cw9XvFtiJrBnreUhuly6W7EfPT9pfHRyEc08tzGa82ZwL7B4MH7cLEZQxiyCHM5zN7lcML3PXs1l7
	WR8YOqRncltkShb7MW3rjfs7i6kJkmfeHaB8HKanwl2fVJ9sSKiUco1IQbzUBMaAttl2EoFatNeVR
	vcIU0IMkm4+y1lkn2CVQejEh7CoVKvA38/smtssUlq9I+YtHYL7/rUkcrLLVpctHwxe/SFOZ5Kcr8
	t4bIaAHDFAe92MKQfrH/gWkqSTrcWI5ySA6t5Ti0WIBQv4pMV0s84Gmf+rgYE1j6zIQHigJvuHh5Y
	JJlqEmXwe5UoyW4iW+AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tihCn-0000000CkQR-1OIF;
	Thu, 13 Feb 2025 21:57:09 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tihCk-0000000CkPE-0lnj
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 21:57:07 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5de4d3bbc76so2259035a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 13:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739483824; x=1740088624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pbCezODlOubTBwMs4YHw1Z0Ort7bqbiDHdUSGG4yl38=;
        b=CA3I6MsWcOb7/eXGsfFew2A33u9O3wMQu8TxnSNG6F2y5fSyxc0h9+D6Y1qbwy+wX4
         FAA6GLKnlPB1FHUJB8SLWrYs5stpEjsRw1L5en2/4ZaVKcDYKo8soxuo7/I44TjikZqT
         0GnwYnNq3MgE1OX99nPUlnZWYhoRRSBbixlBngzvmmU7dqKiHuxKlgorNP1hCfU+WvFT
         G/LoPJDhWCaMb+veVvFdSc8WFe4zAMpH2HcNgKLZan3de/mylApu8ZR231Ooz9syym2A
         Y2wRJ7RWp1j5kOJI0aP6s5bULIKNP7oPcN+/IxJPoxS6kWdZ+/UcWkSqnbXfFOqjP2S0
         QJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739483824; x=1740088624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pbCezODlOubTBwMs4YHw1Z0Ort7bqbiDHdUSGG4yl38=;
        b=YlyFD5qT+w03vFYge3b83Y4g/YcS7yyU4FTCoJW1OGYtuDKGfJkpmi6CRPbB9UWASx
         CngU4tHFtUJ6DFO3rSHAHvAhEAYuo90RJf8Ph8NqO2HLqD+sPi7CfE0sr9DwkZTvEvis
         EwI650BBAVGi83nJ9jp84h0ZlgOX6z2zi8J3b9gBEn1DDrz6pyu7n70BJ4iX31sI9ZVN
         JPxVUSC+eSgZlM+d8UBQo5h4QV8Nn0+kTI4UwmiU4EGW1LsVNFzUGrZMmitc0HIuwWyW
         C2daItwTk09n3aYhCvzSIdamtueCu17Dle+ihFzgh/x8nUVTagU/xhpavXmLbRX2Ff6J
         uWpA==
X-Forwarded-Encrypted: i=1; AJvYcCVuxvLZn2AeH1BPdsThAMJh8USbY7nflFd1Y6NrPMd3XkCz381JeChT2L9PXk7dV8++BKsNcT2j4XuMzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2JwsIud+U3rz6ut4kawB8KXDIlnZXoJ6x7fbxqNThEKMc3efr
	4NvDJ7agfb0N7atCBVM4ucNO3NcH+srLPkjDLWQA66vzKMjrWyydxReHrpxu
X-Gm-Gg: ASbGncvnQ5gqhWPenrBzXez8lB8I+J568bg8+MQzmmfZCZmBMBZOIDmcTvesTx501Q2
	+AAzj46lHS01KXSNq39EfX+b6kQxWFYd8xWBAI0bzvXMkyJGIfTkIDr1lweVCbyK5A9aMNqP/VH
	ltva3Z0+7Xx0AEx8hi1F74KMcX90AjE2IPWo41z9NeDG7ZUOasACQIt16dQP6B0kqt2nR3MpJz2
	Ss0A4q4Z29/YHkSLE+KvYgf+vuLGGAXxEC9Xz7ZMgXqHTCFKyPpgojUY1F/yQsvsPztbCPgQWif
	mtTAspR1VVf48RaNqPU0DYX1Fw8+
X-Google-Smtp-Source: AGHT+IF59vMa4beqMALmWIFmwJA51XJOPDvt3Vr5/aqg3nAaFFzRF/d69KpBiLJLoc2aU8lM+WVzDw==
X-Received: by 2002:a05:6402:254c:b0:5dc:8ed9:6bc3 with SMTP id 4fb4d7f45d1cf-5deade07e05mr7030168a12.26.1739483823982;
        Thu, 13 Feb 2025 13:57:03 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532595dfsm209794266b.70.2025.02.13.13.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 13:57:03 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
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
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [PATCH v11 2/3] rtc: sophgo: add rtc support for Sophgo CV1800 SoC
Date: Thu, 13 Feb 2025 22:56:46 +0100
Message-ID: <20250213215655.2311793-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
References: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_135706_226671_3E2AF6F1 
X-CRM114-Status: GOOD (  24.15  )
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
Changes since v10:
- only start RTC on set_time;
Changes since v9:
- further simplified bitmask macros;
- unconditional RTC start (rtc_enable_sec_counter()), otherwise
didn't start on SG2000;
- dropped ANA_CALIB modification (has been forgotten in v8 with
the drop of SW calibration to switch to HW calibration);
- successfully tested on SG2000;

 drivers/rtc/Kconfig      |  10 ++
 drivers/rtc/Makefile     |   1 +
 drivers/rtc/rtc-cv1800.c | 228 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 239 insertions(+)
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
index 000000000000..5c30f7388983
--- /dev/null
+++ b/drivers/rtc/rtc-cv1800.c
@@ -0,0 +1,228 @@
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
+static bool cv1800_rtc_enabled(struct device *dev)
+{
+	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
+	u32 reg;
+
+	regmap_read(info->rtc_map, SEC_PULSE_GEN, &reg);
+
+	return (reg & SEL_SEC_PULSE) == 0;
+}
+
+static void cv1800_rtc_enable(struct device *dev)
+{
+	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
+
+	/* Sec pulse generated internally */
+	regmap_update_bits(info->rtc_map, SEC_PULSE_GEN, SEL_SEC_PULSE, 0);
+}
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
+	if (!cv1800_rtc_enabled(dev)) {
+		alarm->enabled = 0;
+		return 0;
+	}
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
+static int cv1800_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct cv1800_rtc_priv *info = dev_get_drvdata(dev);
+	u32 sec;
+
+	if (!cv1800_rtc_enabled(dev))
+		return -EINVAL;
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
+	cv1800_rtc_enable(dev);
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
