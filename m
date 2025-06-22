Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F833C7115A
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Jun 2025 03:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HMzOLRuRqD2dA0ootwAnIq8ug2q3toPihKDkstIyIqg=; b=yIFVysevEqT+SB
	NK1qmLColp826HXY9kz0KJsOf1aQ8LNIBkKyXrTAth4PxvUGGLNJa0Hj9M9s7Sw3o/jA/h6fBC6Ld
	Z6NQ0XDdbq9dWwIDHWqQbdr/Ii27uABMCv4+6ZEBlOZq6KRaRB7sR4ju218HGxT9tCZVBAc3xBcLd
	NgLU/Oa/Q3VY5gMHVNc92PCtde2miu6COe0kcOp3KGfPfHeCTjZPNKHNyMrIUuGht5HNN2meMB5LS
	OPc2D+YJONSAu0R/fZmM0nLt4L+g+ybUr1+lxo3ltaPv7faAJNKyqTWD+nPm/5JgD/OYq36w2mP/O
	4wej15X/eGzs2PjjQN8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTBP3-00000000Tik-1E4c;
	Sun, 22 Jun 2025 03:29:57 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTBOy-00000000TgW-1ihJ
	for linux-riscv@lists.infradead.org;
	Sun, 22 Jun 2025 03:29:53 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6fb0a05b56cso67643346d6.3
        for <linux-riscv@lists.infradead.org>; Sat, 21 Jun 2025 20:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750562991; x=1751167791; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYVDfYJEfBaM0ssLbKCKZebV837CxPuDOg/+Kg5KUqU=;
        b=QlDphxYx6kI2RtW0tpORnQYV6BVvfF7UAjvRquYBIW5CPxHCEm70PFIDUhKK0cyEZ4
         nadszIZ3P0aXkF+J0LaT8eVZRzrrTFY77xjfTmwvV/43Tr00wrVyvEzbEmWsJRojn2Ww
         8ld08Np4npmJTxQcQSoYUEWRBDQWv0aEQwoaOjlFNBNe2uCVh+0Pc4TaUxriz6S+59Kd
         IM8M8QhCsCkCTqi58sdeOjxEqIEo/teRm0yptwYFDisydn8Pwqsd9UZ5CAs+l6gg3BbV
         ngFZlS3t2+IcYukBY8C3U7z6XA3TPpECb/7Dc+mYpORKNagFeFe5+zaeWFrRZVWtoGLd
         rzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750562991; x=1751167791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYVDfYJEfBaM0ssLbKCKZebV837CxPuDOg/+Kg5KUqU=;
        b=RXTEAxZREtquRpQTDzpS7wQJZFd1xQZwNuwSnyCiTLGw3FdrUaZTY0GJgumLy98iNs
         RaxuIB3Z0kuG/9BPm10YhSUL/KD3HE2yRaA3mRuDyyGpbT6lqh7pzuJSDvsdGC7TqrP2
         nfJXMX02LmxLHuGLszwY14vPhXPHBTgCY8ULCDitrwtC9fuaHH833LIa/OjpOB3fjdkQ
         nfvayqMKfraph6UVRhXSnctr5uC9NxAB9ftS2pkRa6mKkxId0PhXxpA1LZwhGzQCXN/M
         7d/6N719pg+YdO2UAVmMg7ZuG1SaWgb+VbQeyEFdlRG30/PA9HlgU/6TxqZqaN8BJbMM
         sQXA==
X-Forwarded-Encrypted: i=1; AJvYcCVt6Skdvkowfm0fawY3piKxiY/4GJ8J91HsETY9gMCuJemcOT2MI5TjsYBJdN34s7uYIhfLc6ZRtnv13g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6YvAVvrjYgkcyqU/NJmKspvjr9B3KKFU9ThgPds9hM1Of1TYZ
	vrRYmS1HfH14BjQM7reJOAVYAESsDE24pqKM0XIDXHGYh0c2f3fL0zpCBj6Ml63tPUM=
X-Gm-Gg: ASbGncvO7nIG0mo6dNJrKpYgIWGXMHBr8Bcw1UvFOFqtX/scWU5XQ9a7pxkRgsU3xXq
	7MAFmtcYuExvDo/W5d4VS1I2qi0q5rJ2w7V+NNNy6Wn9WRLchln9TriQEA0QIIrACX7FQBKS4NQ
	X2Q4RhmlMScm7/0RIcFYoAZJy5C0tdI5Mbu5OrBtmDdSSmxhBmE+L1MUNa9DnXV8z1ZWr1VRL3E
	FjU3GydDJXrJTwt6b/uzMjQPVbZHV8lqQtOFK5Z+LpSJ/vMDnd6dJqxmM9W4gT2fopxj/LNnmz6
	Gws2alPNBlHYia9aczrDwRXyQ8Z+5420s8dlNq2q/nc1AmqkUbzm0xsfYFam6b3tF4mkrj7a4/r
	iMKaKhHNuRgKbrCc9yB8S9uJCqBZU4fQ44uQ=
X-Google-Smtp-Source: AGHT+IEzbUQ+7RVQuRV0EbLr3Cx1IwLGHmCYPT6OmFah/l6Db4G4Rk9xcbyX4PneJMhTkAYKbjMc7A==
X-Received: by 2002:a05:6214:469e:b0:6fa:9a6a:7cfc with SMTP id 6a1803df08f44-6fd0a51c75emr132820726d6.26.1750562991350;
        Sat, 21 Jun 2025 20:29:51 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0945183dsm30014526d6.44.2025.06.21.20.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 20:29:51 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	alexandre.belloni@bootlin.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	wangruikang@iscas.ac.cn,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 4/7] rtc: spacemit: support the SpacemiT P1 RTC
Date: Sat, 21 Jun 2025 22:29:36 -0500
Message-ID: <20250622032941.3768912-5-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250622032941.3768912-1-elder@riscstar.com>
References: <20250622032941.3768912-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_202952_458948_CCD6A4D4 
X-CRM114-Status: GOOD (  22.87  )
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

Add support for the RTC found in the SpacemiT P1 PMIC.  Initially
only setting and reading the time are supported.

The PMIC is implemented as a multi-function device.  This RTC is
probed based on this driver being named in a MFD cell in the simple
MFD I2C driver.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - Added this driver to the series, in response to Lee Jones saying
      more than one MFD sub-device was required to be acceptable

 drivers/rtc/Kconfig  |  10 ++++
 drivers/rtc/Makefile |   1 +
 drivers/rtc/rtc-p1.c | 137 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 148 insertions(+)
 create mode 100644 drivers/rtc/rtc-p1.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 9aec922613cec..27cff02ba4e66 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -406,6 +406,16 @@ config RTC_DRV_MAX77686
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-max77686.
 
+config RTC_DRV_P1
+	tristate "SpacemiT P1 RTC"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	select MFD_SPACEMIT_P1
+	default ARCH_SPACEMIT
+	help
+	  Enable support for the RTC function in the SpacemiT P1 PMIC.
+	  This driver can also be built as a module, which will be called
+	  "spacemit-p1-rtc".
+
 config RTC_DRV_NCT3018Y
 	tristate "Nuvoton NCT3018Y"
 	depends on OF
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 4619aa2ac4697..f8588426e2ba4 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -171,6 +171,7 @@ obj-$(CONFIG_RTC_DRV_SD2405AL)	+= rtc-sd2405al.o
 obj-$(CONFIG_RTC_DRV_SD3078)	+= rtc-sd3078.o
 obj-$(CONFIG_RTC_DRV_SH)	+= rtc-sh.o
 obj-$(CONFIG_RTC_DRV_SNVS)	+= rtc-snvs.o
+obj-$(CONFIG_RTC_DRV_P1)	+= rtc-p1.o
 obj-$(CONFIG_RTC_DRV_SPEAR)	+= rtc-spear.o
 obj-$(CONFIG_RTC_DRV_STARFIRE)	+= rtc-starfire.o
 obj-$(CONFIG_RTC_DRV_STK17TA8)	+= rtc-stk17ta8.o
diff --git a/drivers/rtc/rtc-p1.c b/drivers/rtc/rtc-p1.c
new file mode 100644
index 0000000000000..e0d2c0c822142
--- /dev/null
+++ b/drivers/rtc/rtc-p1.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for the RTC found in the SpacemiT P1 PMIC
+ *
+ * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/rtc.h>
+
+#define MOD_NAME	"spacemit-p1-rtc"
+
+/* Offset to byte containing the given time unit */
+enum time_unit {
+	tu_second = 0,		/* 0-59 */
+	tu_minute,		/* 0-59 */
+	tu_hour,		/* 0-59 */
+	tu_day,			/* 0-30 (struct tm uses 1-31) */
+	tu_month,		/* 0-11 */
+	tu_year,		/* Years since 2000 (struct tm uses 1900) */
+	tu_count,		/* Last; not a time unit */
+};
+
+/* Consecutive bytes contain seconds, minutes, etc. */
+#define RTC_COUNT_BASE		0x0d
+
+#define RTC_CTRL		0x1d
+#define RTC_EN		BIT(2)
+
+struct p1_rtc {
+	struct regmap *regmap;
+	struct rtc_device *rtc;
+};
+
+static int p1_rtc_read_time(struct device *dev, struct rtc_time *t)
+{
+	struct p1_rtc *p1 = dev_get_drvdata(dev);
+	u8 time[tu_count];
+	int ret;
+
+	ret = regmap_bulk_read(p1->regmap, RTC_COUNT_BASE, &time, sizeof(time));
+	if (ret)
+		return ret;
+
+	t->tm_sec = time[tu_second] & GENMASK(5, 0);
+	t->tm_min = time[tu_minute] & GENMASK(5, 0);
+	t->tm_hour = time[tu_hour] & GENMASK(4, 0);
+	t->tm_mday = (time[tu_day] & GENMASK(4, 0)) + 1;
+	t->tm_mon = time[tu_month] & GENMASK(3, 0);
+	t->tm_year = (time[tu_year] & GENMASK(5, 0)) + 100;
+	/* tm_wday, tm_yday, and tm_isdst aren't used */
+
+	return 0;
+}
+
+static int p1_rtc_set_time(struct device *dev, struct rtc_time *t)
+{
+	struct p1_rtc *p1 = dev_get_drvdata(dev);
+	u8 time[tu_count];
+	int ret;
+
+	time[tu_second] = t->tm_sec;
+	time[tu_minute] = t->tm_min;
+	time[tu_hour] = t->tm_hour;
+	time[tu_day] = t->tm_mday - 1;
+	time[tu_month] = t->tm_mon;
+	time[tu_year] = t->tm_year - 100;
+
+	/* Disable the RTC to update; re-enable again when done */
+	ret = regmap_update_bits(p1->regmap, RTC_CTRL, RTC_EN, 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_bulk_write(p1->regmap, RTC_COUNT_BASE, time, sizeof(time));
+
+	(void)regmap_update_bits(p1->regmap, RTC_CTRL, RTC_EN, RTC_EN);
+
+	return ret;
+}
+
+static const struct rtc_class_ops p1_rtc_class_ops = {
+	.read_time = p1_rtc_read_time,
+	.set_time = p1_rtc_set_time,
+};
+
+static int p1_rtc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rtc_device *rtc;
+	struct p1_rtc *p1;
+	int ret;
+
+	p1 = devm_kzalloc(dev, sizeof(*p1), GFP_KERNEL);
+	if (!p1)
+		return -ENOMEM;
+	dev_set_drvdata(dev, p1);
+
+	p1->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!p1->regmap)
+		return dev_err_probe(dev, -ENODEV, "failed to get regmap\n");
+
+	rtc = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rtc))
+		return dev_err_probe(dev, PTR_ERR(rtc),
+				     "error allocating device\n");
+	p1->rtc = rtc;
+
+	rtc->ops = &p1_rtc_class_ops;
+	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rtc->range_max = RTC_TIMESTAMP_END_2063;
+
+	clear_bit(RTC_FEATURE_ALARM, rtc->features);
+	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
+
+	ret = devm_rtc_register_device(rtc);
+	if (ret)
+		return dev_err_probe(dev, ret, "error registering RTC\n");
+
+	return 0;
+}
+
+static struct platform_driver p1_rtc_driver = {
+	.probe = p1_rtc_probe,
+	.driver = {
+		.name = MOD_NAME,
+	},
+};
+
+module_platform_driver(p1_rtc_driver);
+
+MODULE_DESCRIPTION("SpacemiT P1 RTC driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" MOD_NAME);
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
