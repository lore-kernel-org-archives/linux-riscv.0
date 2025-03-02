Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FBCC282CD
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Mar 2025 19:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AY7NidcmPWb6i+v6MF5u0yt7dffkxX496/gfTm/xk5I=; b=HkhsUUiXxBh88n
	mzLkK+OLB0MSKhBSZW89/1SPCZwgAfbP+t+El1FX+MWwctfLWADFdb6ZMfLwFVmQwSdNsSCupCQ/a
	Z+5gWIVLpMuAlTNL/QsxbP/brSuRjR/i7klcDsVzvlK7ybO27MwKQ3ZOcG64dtRtJI40rJn5kCz8l
	IBX95v6LWDpIiMbNN99gybkohCKQm0aohFj+Q3lBSSv/a7zAhRIk/C6xOaTMS62odQoidhpdbEygc
	gqafxvPEbytyPMWMyjWTornQXGe1d9yB+wHot73+R6t6RijMgni9IZlXxgiuAkHcWplLfkvg3MVe8
	h51tcxXM8UDu5iUP+Z+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1topMS-0000000GbWs-2bYW;
	Sun, 02 Mar 2025 19:52:28 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1topMP-0000000GbVx-2KmH
	for linux-riscv@lists.infradead.org;
	Sun, 02 Mar 2025 19:52:26 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-abf4b376f2fso240429166b.3
        for <linux-riscv@lists.infradead.org>; Sun, 02 Mar 2025 11:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740945144; x=1741549944; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=geqIJH4ZbhDfifYmudp+lR9EwCjUFtE9Nbs9m0I7Hhw=;
        b=M4TwOG+4NpUE6cZ2ArVmXu1XASFC+eqA5gIAGYyXwW3mzhzFaMiihDoCGfeBYgQ5NR
         wElD7qJN35u44ulCjcOSWwVi1qFGDXksd4dZilzQpGfYRolgzg3CX0CafOWyYQR9TPBn
         Cih5yKUI0wfSIsb2KsWaP09LDv9zwMbaIP3KUI+8XaLMTHpt9NSIckDPoHytSmTITypi
         pH8dnHeJQmsRjqsli6dvugmNUvehb0dmMHiKAdSS4BlYdeqbcNCxCiuchNOJfTZ2Idsm
         HZxi9n7CP988fg/xyEQDNrHxM5ND1JZAL/pANPexSuuQpNM7P48qGDi9sK1efpXYUhSA
         Ze3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740945144; x=1741549944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=geqIJH4ZbhDfifYmudp+lR9EwCjUFtE9Nbs9m0I7Hhw=;
        b=Nw20ciYkq1hVZN1yo96Jw/a0CAsSOs/s1yvUET8uiZb8mwMrLNXZSwK++fiFyUWJMp
         u83sIm673nRz5dVqAQUE1PAedL2aOoaVq53bUMG8JhGPAmBnBXswJCpAhpLU45fCjjAo
         MLsTHjNgOVF5xpO+5qUSU9KQzklRMmBurYGUxp8294LFoXbimWadB4JdEVL5xfwhA+cm
         rkW6EN9JDCMYgXLIJ7AfFioR1UGw1dCAQxZmgs3JEvvDD+DTsqqsU1PAj1AGA48ZTmn+
         078Jdku9uM3vu+B04zMeAfKpXJ1Hp27eBCsIFPwPMwfsQdNPs1pmqU7FjdCsz8rS+7eI
         twWg==
X-Forwarded-Encrypted: i=1; AJvYcCUWu9IU3GM/w2qRPVLi7s2xV7yq4BAOIc31t/7ch2ZK5Jg9Q5TLsf7FN8aV5VZoAl86Cp8NpeXbTVz2Fw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ0LT4mvYErwe8NZdGGlkcW7onpCBHD0NweNFZlrpA0uiQhv5S
	X/bJHX7NCBGY6QIGQ8LPwMVr8fWSgrao1j2wLG1RFLq5hUgkJx0E
X-Gm-Gg: ASbGncsuNJjaaNydUbmg7A9lluzEUcyFAYVB1sr4vTlLLDB3lioCTX6PVFWYahZ3p65
	a+75tTd/LJB5SJ2sz6jJkKPFHOtKIE6/0tExqsinxg+SxQ6M4+vnUwnf3XVkgtHTRM/nVFXgk25
	ipOUpSTez77TlashRakioXjlq+gui+OPMT1sNXSOJtVmy9rcGTUGO6DNpMDKpriUWrp3dKNDu0V
	zdihXsFEifq8Yuutofm2rP/BSCLoeHMT0SZTkQGGJu7DQtCbth7dyQqWWW6x7H5DY6Y44A5sYit
	m+NHNv1gNU0EwHBjKI/EZdEiORREftKW1jFKDlRwMxKQUlc3PCqiA8SqHA==
X-Google-Smtp-Source: AGHT+IEVQi87WpvJPE+ITZKW4KN8LE8ET2pDw7bFNwsDi7FEYME4D4Cx72dGVTss6isDxSYXAcgHKA==
X-Received: by 2002:a17:907:9620:b0:abe:f8c0:c1ab with SMTP id a640c23a62f3a-abf265d3be4mr1399615466b.46.1740945143564;
        Sun, 02 Mar 2025 11:52:23 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a5acdsm5809705a12.77.2025.03.02.11.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 11:52:23 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	dlan@gentoo.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	sophgo@lists.linux.dev,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [PATCH v12 3/3] rtc: sophgo: add rtc support for Sophgo CV1800 SoC
Date: Sun,  2 Mar 2025 20:51:56 +0100
Message-ID: <20250302195205.3183174-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250302195205.3183174-1-alexander.sverdlin@gmail.com>
References: <20250302195205.3183174-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_115225_599409_26C60F80 
X-CRM114-Status: GOOD (  26.59  )
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
v12:
- added MAINTAINERS entry
- depends on cv1800-rtcsys MFD driver
- use syscon for regmap
- get named clock from parent MFD
- corresponding platform device is expected to be instantiated by MFD stub
Changes since v10:
- only start RTC on set_time;
Changes since v9:
- further simplified bitmask macros;
- unconditional RTC start (rtc_enable_sec_counter()), otherwise
didn't start on SG2000;
- dropped ANA_CALIB modification (has been forgotten in v8 with
the drop of SW calibration to switch to HW calibration);
- successfully tested on SG2000;

 MAINTAINERS              |   1 +
 drivers/rtc/Kconfig      |  12 +++
 drivers/rtc/Makefile     |   1 +
 drivers/rtc/rtc-cv1800.c | 218 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 232 insertions(+)
 create mode 100644 drivers/rtc/rtc-cv1800.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 446156998380..d4e0569da602 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22186,6 +22186,7 @@ M:	Inochi Amaoto <inochiama@outlook.com>
 T:	git https://github.com/sophgo/linux.git
 S:	Maintained
 F:	drivers/mfd/cv1800-rtcsys.c
+F:	drivers/rtc/rtc-cv1800.c
 N:	sophgo
 K:	sophgo
 
diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 0bbbf778ecfa..9da247ec4084 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1395,6 +1395,18 @@ config RTC_DRV_ASM9260
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-asm9260.
 
+config RTC_DRV_CV1800
+	tristate "Sophgo CV1800 RTC"
+	depends on MFD_CV1800_RTCSYS || COMPILE_TEST
+	select MFD_SYSCON
+	select REGMAP
+	help
+	  If you say yes here you get support the RTC driver for Sophgo CV1800
+	  series SoC.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called rtc-cv1800.
+
 config RTC_DRV_DIGICOLOR
 	tristate "Conexant Digicolor RTC"
 	depends on ARCH_DIGICOLOR || COMPILE_TEST
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
index 000000000000..18bc542bbdb8
--- /dev/null
+++ b/drivers/rtc/rtc-cv1800.c
@@ -0,0 +1,218 @@
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
+#include <linux/mfd/syscon.h>
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
+	int ret;
+
+	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
+	if (!rtc)
+		return -ENOMEM;
+
+	rtc->rtc_map = device_node_to_regmap(pdev->dev.parent->of_node);
+	if (IS_ERR(rtc->rtc_map))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->rtc_map),
+				     "cannot get parent regmap\n");
+
+	rtc->irq = platform_get_irq(pdev, 0);
+	if (rtc->irq < 0)
+		return rtc->irq;
+
+	rtc->clk = devm_clk_get_enabled(pdev->dev.parent, "rtc");
+	if (IS_ERR(rtc->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->clk),
+				     "rtc clk not found\n");
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
+static const struct platform_device_id cv1800_rtc_id[] = {
+	{ .name = "cv1800-rtc" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(platform, cv1800_rtc_id);
+
+static struct platform_driver cv1800_rtc_driver = {
+	.driver = {
+		.name = "sophgo-cv1800-rtc",
+	},
+	.probe = cv1800_rtc_probe,
+	.id_table = cv1800_rtc_id,
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
