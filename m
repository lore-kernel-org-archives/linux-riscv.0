Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD030C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 20:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9U81S5trjDG6bJ0ldaJTQWhJggqCxAcBj8VKSN6lbCM=; b=UzQ/2joXoz6Ik4
	b4M1SVG7yXhGQmNZcrsxbdgq9XqAfobGIrA5XniQHAmuhQDetIwMcP7ku0/4JQViPeW4fPP3RxCh8
	tu+YiCamFfwXGBfN65m+J3oq66lPptMoCzaXQdIUoI3+eavGhJS3ShYMS7yMVXUIHaGnl5HfbyRMz
	N95ITIHa+4x6bLt+sasFNUbLlhdWS9+es1wfPE9K+blX+j1HD3nojLsPVyG2DJtMVeuqogbWq8Fol
	ZGRJCNXkGl9P4kUUv4wYf0dUbvBHOn7/eCjLnnOMm+snUzxhxYdp7QevqKbDvM1HOEe3isnErJIef
	BNNjjuBIjAbOPaOBTlLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWpZ-00000009r0H-2eiE;
	Wed, 25 Jun 2025 20:34:53 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUTBi-00000009KvI-1UtE
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 16:41:31 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6f0ad74483fso1344696d6.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jun 2025 09:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750869689; x=1751474489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ECik/dLyp7V3J7nKrFzv5/sHAYEHXhANSBESMnVLr0=;
        b=e2JHG0nMlbKiBXAddZgDV+ZIDHQtY4VRlQ+qoilWbp2MGCGcncTE7S7oOZyJ41zJHr
         Pl1wnpODMhfjk6Lf7BlwpJYmjb/W0t1b1GmShKZEhOqtyxG0oLbMvCWsiw6hP+zPaWCu
         OheLdmqlXX5dK5kkTrLLA0VVO5R3NqRBwjv2n3F5TEyx75jXaq7X0ID/cZ+IX9IkvUSF
         ra39F6bFPIyv0CR7qOUQ4oZYSHaEqGV/Rk7BlbuseHyXlvhs+WVBPZ7lAW5gfn1fb5mO
         lyF4QL0oN91ukJfU5t0zCrfGzuwALMcOQKhgGZsr6aWXQwiPJZ0yTsv3YZvwUkL0QwAx
         L8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869689; x=1751474489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ECik/dLyp7V3J7nKrFzv5/sHAYEHXhANSBESMnVLr0=;
        b=ZwUNEwGVpHKosPTX0TrpxJgTHcEBlfL0aJJe1Ah3FmAhn2E1k946PkBp085B0mggPl
         Ygz6ExuR7YIJR6wA/qE6tPf4YuGdCCwNHz0gj9jQ9D7OMEgvmy0sjR++2LCVz5OipxMG
         kDPt26hzuO0Ez95q5SVc+Rjxpy/IkK7MY3JfGLCn13uCeNhOBO4PIjK7+e3tZZDYldco
         Ba7sQz8ROktEJykg8x4Lqett/AUl1bxAZ+v9S/3pGg460KK0Lwv48t8PdCAxoLOVPbbZ
         /Y3X03knKv5jB18+xSt/Sw5n+3qih6PHeMx59s0Wine8GZG6zHGI0GFiU3EeLIinMHbA
         RJgg==
X-Forwarded-Encrypted: i=1; AJvYcCU67Jfu/Bub/9sqIbOcLik1N0/jQIWAsCJ1LRjBs3dw28A0fuuuotbSfVnQpglw7Bxr9kJSLb1Oh+ig4w==@lists.infradead.org
X-Gm-Message-State: AOJu0YygqyNXtvdNHilfsIIRdscxE7hJDqvD3h/re5XLgmL256duXz2y
	u4f8YuNXDMlD0cO54aXJ6YI937twJO1MnF2v0qk3oxduv8kUIi2ay/YlkiQhm+58QSw=
X-Gm-Gg: ASbGncs6gHTVhJFUmb7wIn48Tvh11WZPV4aAEtA0sZciW/fJ2JCnvVEaQDruddgck1g
	fje676vHphRQD6vkft/vk7zUonMfYOJrp4E5xgQciHih26lFju6OF58NU5W6v+F/bo8cDJRTyLY
	wZUckTEj8LIVWdkBureD26tlwHMGPl6OCOARDOukfV15gZW4wZuuGxO+Ev8OFZr008uuPHpNB8B
	4l1PSfUnlIDiJ7zPW341o4Z4dpLKSsUDA/0fPSz/8d0Bv1By5m78Ia8UQjiR6PGTSwT9gipWjoA
	WXwYEAUD9vT0Uc1oFhnZfAnbY0qccVrs2aa0/Qes97LNMAnJgzyiZUKccTdoQqi8YRS0lDSIHP9
	3KKm5YodmhtgEE1R/qj+PRkQhtQTWEK2O9a0=
X-Google-Smtp-Source: AGHT+IH2Rw6qDhj6gxPxTkfHXvCTXxfzxWK7HJ7WiW9c6J8c8xpC7Qe6SfN17xAiNow/8qw/cdT4KQ==
X-Received: by 2002:a05:6214:dad:b0:6fd:1687:2e1b with SMTP id 6a1803df08f44-6fd5efac323mr56502306d6.27.1750869689350;
        Wed, 25 Jun 2025 09:41:29 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3ffdb190esm576783085a.86.2025.06.25.09.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:41:28 -0700 (PDT)
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
	troymitchell988@gmail.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/7] rtc: spacemit: support the SpacemiT P1 RTC
Date: Wed, 25 Jun 2025 11:41:15 -0500
Message-ID: <20250625164119.1068842-5-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250625164119.1068842-1-elder@riscstar.com>
References: <20250625164119.1068842-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_094130_403923_7FF6A3DE 
X-CRM114-Status: GOOD (  29.47  )
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
v4: - Rename the source file
    - Rename the config option
    - Get rid of the time_unit enumerated type (just use indices)
    - Loop in the RTC read_time callback until consecutive reads
      produce the same result
    - Return an error from the set_time callback if re-enabling the
      RTC fails
    - Don't report devm_rtc_register_device() errors

 drivers/rtc/Kconfig           |  10 ++
 drivers/rtc/Makefile          |   1 +
 drivers/rtc/rtc-spacemit-p1.c | 169 ++++++++++++++++++++++++++++++++++
 3 files changed, 180 insertions(+)
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 9aec922613cec..93620f2c9b29c 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -406,6 +406,16 @@ config RTC_DRV_MAX77686
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-max77686.
 
+config RTC_DRV_SPACEMIT_P1
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
index 4619aa2ac4697..a24ff6ad5ca58 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -171,6 +171,7 @@ obj-$(CONFIG_RTC_DRV_SD2405AL)	+= rtc-sd2405al.o
 obj-$(CONFIG_RTC_DRV_SD3078)	+= rtc-sd3078.o
 obj-$(CONFIG_RTC_DRV_SH)	+= rtc-sh.o
 obj-$(CONFIG_RTC_DRV_SNVS)	+= rtc-snvs.o
+obj-$(CONFIG_RTC_DRV_SPACEMIT_P1)	+= rtc-spacemit-p1.o
 obj-$(CONFIG_RTC_DRV_SPEAR)	+= rtc-spear.o
 obj-$(CONFIG_RTC_DRV_STARFIRE)	+= rtc-starfire.o
 obj-$(CONFIG_RTC_DRV_STK17TA8)	+= rtc-stk17ta8.o
diff --git a/drivers/rtc/rtc-spacemit-p1.c b/drivers/rtc/rtc-spacemit-p1.c
new file mode 100644
index 0000000000000..fdb8e3502c198
--- /dev/null
+++ b/drivers/rtc/rtc-spacemit-p1.c
@@ -0,0 +1,169 @@
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
+/*
+ * Six consecutive 1-byte registers hold the seconds, minutes, hours,
+ * day-of-month, month, and year (respectively).
+ *
+ * The range of values in these registers is:
+ *    seconds	0-59
+ *    minutes	0-59
+ *    hours	0-59
+ *    day	0-30 (struct tm is 1-31)
+ *    month	0-11
+ *    year	years since 2000 (struct tm is since 1900)
+ *
+ * Note that the day and month must be converted after reading and
+ * before writing.
+ */
+#define RTC_TIME		0x0d	/* Offset of the seconds register */
+
+#define RTC_CTRL		0x1d
+#define RTC_EN		BIT(2)
+
+/* Number of attempts to read a consistent time stamp before giving up */
+#define RTC_READ_TRIES		20	/* At least 1 */
+
+struct p1_rtc {
+	struct regmap *regmap;
+	struct rtc_device *rtc;
+};
+
+/*
+ * The P1 hardware documentation states that the register values are
+ * latched to ensure a consistent time snapshot within the registers,
+ * but these are in fact unstable due to a bug in the hardware design.
+ * So we loop until we get two identical readings.
+ */
+static int p1_rtc_read_time(struct device *dev, struct rtc_time *t)
+{
+	struct p1_rtc *p1 = dev_get_drvdata(dev);
+	struct regmap *regmap = p1->regmap;
+	u32 count = RTC_READ_TRIES;
+	u8 times[2][6];
+	size_t size;
+	u32 i = 0;
+	u8 *time;
+	int ret;
+
+	size = sizeof(times[0]);
+	ret = regmap_bulk_read(regmap, RTC_TIME, times[i], size);
+	if (ret)
+		return ret;
+
+	do {
+		i = 1 - i;
+		ret = regmap_bulk_read(regmap, RTC_TIME, times[i], size);
+		if (ret)
+			return ret;
+	} while (memcmp(times[i], times[1 - i], size) && --count);
+
+	if (!count)
+		return -EIO;
+
+	time = &times[0][0];
+
+	t->tm_sec = time[0] & GENMASK(5, 0);
+	t->tm_min = time[1] & GENMASK(5, 0);
+	t->tm_hour = time[2] & GENMASK(4, 0);
+	t->tm_mday = (time[3] & GENMASK(4, 0)) + 1;
+	t->tm_mon = time[4] & GENMASK(3, 0);
+	t->tm_year = (time[5] & GENMASK(5, 0)) + 100;
+
+	return 0;
+}
+
+/*
+ * The P1 hardware documentation states that values in the registers are
+ * latched so when written they represent a consistent time snapshot.
+ * Nevertheless, this is not guaranteed by the implementation, so we must
+ * disable the RTC while updating it.
+ */
+static int p1_rtc_set_time(struct device *dev, struct rtc_time *t)
+{
+	struct p1_rtc *p1 = dev_get_drvdata(dev);
+	struct regmap *regmap = p1->regmap;
+	u8 time[6];
+	int ret2;
+	int ret;
+
+	time[0] = t->tm_sec;
+	time[1] = t->tm_min;
+	time[2] = t->tm_hour;
+	time[3] = t->tm_mday - 1;
+	time[4] = t->tm_mon;
+	time[5] = t->tm_year - 100;
+
+	/* Disable the RTC to update; re-enable again when done */
+	ret = regmap_update_bits(regmap, RTC_CTRL, RTC_EN, 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_bulk_write(regmap, RTC_TIME, time, sizeof(time));
+
+	ret2 = regmap_update_bits(regmap, RTC_CTRL, RTC_EN, RTC_EN);
+
+	return ret ? : ret2;		/* Return the first error */
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
+	return devm_rtc_register_device(rtc);
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
