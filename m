Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AC4606A330
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 21:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HM6nhUn0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nkKOS+kD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wgV0AD0lyreb8/OJ4fN0rfSYXXoDITMOZHVrdSWVb9k=; b=HM6nhUn0i/2NPA4I3hb0j8t3lN
	QljCWryyTvJkcyKQbdrcKLD7gg0HKLB6sZqsJ657JW0EE4GEaozCyvsSrmznoE21i6D3zAqDQ2LOZ
	DCHNbYexhCMrpQVYsC9MZpTet0euEVY32twRqhbxS8K2t8pki1PR14N+/OcMkI/LSRtKIy3l2hGBO
	Z+tRZPLxN7aXOzkNIpHPrg+SCsbOckV3LFhBhXK7JVfsp9A8hqCWtNhNfcHo44REodXF9NPJsksaE
	8FP2N+j/7WEnBEiLCu/ui254y0nBa8N6MzefjeMs+R/otqeKd2q1uq5pXBkvVyY0UlYC/huxfVpNV
	tz+BW4xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQARP-0000000GirD-0uti;
	Sun, 08 Nov 2026 21:28:43 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQARJ-0000000GioP-0qMR
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 21:28:41 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-492f0a1b685so194361f8f.0
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 13:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173315; x=1794778115; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9c+0JpSdppPnVjAStrh5Kr2A5OTKsZL2ZVgzfm3fxgE=;
        b=nkKOS+kD42Amg18ROtJAE4YvFW7av5Tef8KOuLx4IooMEdetNZCAcNAyNIEg7cxEoU
         T05dFbOfC95O5tN7e7st7fsrJCCOAyYdK4VRuXuw5DJE64+SsvQeKLDXWDVjKK4IVL5F
         e+2bw6JJ3msAEWBUZyweXEZaCRc/KEY5vcZ2C1nWJ2RYpn2PsF1HtepXTl7w2St1PKpT
         TV4u4MKGwy8HmjbfzT8YaWUZ283KKIOPWzGP1Xgqf+iJeAW83h2m2prS+880F+Ox96pf
         QCsujX97e+AlxXisB81B2aLfHvQYruPcphFe8gzQHO9IouC0+86aK8h1j1fxbglpYL2J
         J1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173315; x=1794778115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9c+0JpSdppPnVjAStrh5Kr2A5OTKsZL2ZVgzfm3fxgE=;
        b=QniVf1P8RZap2HNgk1uRo25x3fjVrWDB+AK+zaFWEkfhGev+OQOeCuvj29iq1fReo/
         m8y1OW3V/ae+eVBXND19cq/16FT29y4tdGH8Nm96eB0T/jsQw+smZQWFG+v1HtpcbGVx
         TTOMVXZg4hqh+5QXd95X8VzFpg5QDx2jB9B1H8q5dqHYIsKNu1t2wI4MKG3toKC1c7T+
         qUQn7QcHCsa/LE52cJ+nS5T8D1OaIE/Km4cKWZ/h45ITK3r6eNu997mCvrHTToYnvvm5
         CQDipFIoLSt/i4/YGXJb9aWAqWJEVqySL7hdTd5AHRy8xxn3AHwvfcxo4gxBhM4+oZYv
         rfVQ==
X-Forwarded-Encrypted: i=1; AL+hErHeaOxFe3LbhVD59v8q9eIoK8sZShwXvhSLXTCjZzkdbBFPkJOFSeDs6l30w3YbBUICbALrfLp2mG8gMg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8B2djmVmzzOTWXeoZ0Xqgi6vEmeWECDH3u1ngu/aoWDztPBQJE
	qmfntUwurraM6eHZCKoHiSOrx6axSseOZKgPVuN3ZH9yriIi990k1ilZ
X-Gm-Gg: AYBFou35wfTxu79fTvyw0thN6snCM+tIJzipgIgJnqtz/Ephdm+cvMYv/dWkMK5f0Dm
	WTeoqnFegkGjOic/N4BUsip+cYqJdsukoxRwieSXseBeDR2N+4/GnH988su+an4dHAXbvMk3CXn
	LQsHC2HPJ+mcWloNIZQX3tYcxxdAJsrnlTcZtpfxsYxs1Tv7KRbszra8BddIggdm6uwmIL6tsYj
	nXZQGhKRXc3XgDOuye84NiKR1wv6jKnzvWNRhj8TIQlaoFp8urOaehlql2sWrnECcT8J+zXQxmR
	wDY/cpzeycZjcHTIS4F6FMuQSnlDrllau2LBN631rve/WMVgDfhVW+0NjFoToQDBz4eSLU93Qt6
	WppXZHOqKvl45C7dT3/5DxcMepGMwovA4ODnNmOj9e5Fb9eYsMoY9Lyt77kcpcNR/CueuPXAPlO
	QDEG1971EesaC2/IZy00/l514jPQ69w5jNspR0Lzjvz5F6XrbHTAnG9rpYzpDg++hxr7pFnmxb8
	8O4Te/5Hnd2/EVD/+l+Po9zLoptEzputrQHrHvo5myyVHBNhT5LXaiTjrgqfvpLDcvhJd3+15YA
	7IIAeBmSNdiqrVoL7+StqKcQd78zsOkcaw==
X-Received: by 2002:a05:6000:2c0b:b0:48f:bcdf:6f7d with SMTP id ffacd0b85a97d-4958b9106c3mr4719669f8f.34.1794173315099;
        Sun, 08 Nov 2026 13:28:35 -0800 (PST)
Received: from hp-z640.fritz.box ([109.76.148.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597091400sm5692050f8f.32.2026.11.08.13.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:28:34 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>,
	Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v2 2/4] rtc: Add StarFive JH7110 RTC driver
Date: Sun,  8 Nov 2026 21:28:24 +0000
Message-ID: <20261108212826.15890-3-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108212826.15890-1-oo.hehir@gmail.com>
References: <20261108212826.15890-1-oo.hehir@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_132837_315120_36459589 
X-CRM114-Status: GOOD (  25.78  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "ziv.xu" <ziv.xu@starfivetech.com>

Add a driver for the RTC in the always-on domain of the StarFive JH7110
SoC. It supports time, alarm with wakeup, and the frequency offset.

Signed-off-by: ziv.xu <ziv.xu@starfivetech.com>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
[Owen: rework of the StarFive vendor driver for mainline: drop hardware
 calibration & the default time set in probe, use the generic wake IRQ
 helpers, wait for the update bit in set_time, re-read a time that rolls
 over during the read, round the offset to the nearest step & follow the
 sysfs offset sign, enable the 32k counter clock]
Co-developed-by: Owen O'Hehir <oo.hehir@gmail.com>
Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
---
 drivers/rtc/Kconfig      |  11 ++
 drivers/rtc/Makefile     |   1 +
 drivers/rtc/rtc-jh7110.c | 323 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 335 insertions(+)
 create mode 100644 drivers/rtc/rtc-jh7110.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 73ec9230e..332f2e022 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1807,6 +1807,17 @@ config RTC_DRV_MPC5121
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-mpc5121.
 
+config RTC_DRV_JH7110
+	tristate "StarFive JH7110 RTC"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	help
+	  If you say yes here you get support for the RTC in the always-on
+	  domain of StarFive JH7110 SoCs, with alarm and frequency offset
+	  support.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called rtc-jh7110.
+
 config RTC_DRV_JZ4740
 	tristate "Ingenic JZ4740 SoC"
 	depends on MIPS || COMPILE_TEST
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 46f1a0fc2..a5cddb8d8 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -82,6 +82,7 @@ obj-$(CONFIG_RTC_DRV_IMX_BBM_SCMI)	+= rtc-imx-sm-bbm.o
 obj-$(CONFIG_RTC_DRV_ISL12022)	+= rtc-isl12022.o
 obj-$(CONFIG_RTC_DRV_ISL12026)	+= rtc-isl12026.o
 obj-$(CONFIG_RTC_DRV_ISL1208)	+= rtc-isl1208.o
+obj-$(CONFIG_RTC_DRV_JH7110)	+= rtc-jh7110.o
 obj-$(CONFIG_RTC_DRV_JZ4740)	+= rtc-jz4740.o
 obj-$(CONFIG_RTC_DRV_LOONGSON)	+= rtc-loongson.o
 obj-$(CONFIG_RTC_DRV_LP8788)	+= rtc-lp8788.o
diff --git a/drivers/rtc/rtc-jh7110.c b/drivers/rtc/rtc-jh7110.c
new file mode 100644
index 000000000..d2d89cdd4
--- /dev/null
+++ b/drivers/rtc/rtc-jh7110.c
@@ -0,0 +1,323 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RTC driver for the StarFive JH7110 SoC
+ *
+ * Copyright (C) 2021 StarFive Technology Co., Ltd.
+ */
+
+#include <linux/bcd.h>
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
+#include <linux/reset.h>
+#include <linux/rtc.h>
+
+#define JH7110_RTC_CFG			0x00
+#define  JH7110_RTC_CFG_ENABLE		BIT(0)
+#define  JH7110_RTC_CFG_CAL_SEL_HW	BIT(2)
+#define  JH7110_RTC_CFG_HOUR_24H	BIT(3)
+#define JH7110_RTC_SW_CAL_VALUE		0x04
+#define JH7110_RTC_IRQ_EN		0x10
+#define JH7110_RTC_IRQ_EVENT		0x14
+#define  JH7110_RTC_IRQ_ALARM		BIT(4)
+#define  JH7110_RTC_IRQ_ALL		GENMASK(4, 0)
+#define  JH7110_RTC_EVENT_UPDATE	BIT(31)
+#define JH7110_RTC_CAL_VALUE		0x24
+#define JH7110_RTC_CFG_TIME		0x28
+#define JH7110_RTC_CFG_DATE		0x2c
+#define JH7110_RTC_ACT_TIME		0x34
+#define JH7110_RTC_ACT_DATE		0x38
+#define JH7110_RTC_TIME			0x3c
+#define JH7110_RTC_DATE			0x40
+
+#define JH7110_RTC_TIME_SEC		GENMASK(6, 0)
+#define JH7110_RTC_TIME_MIN		GENMASK(13, 7)
+#define JH7110_RTC_TIME_HOUR		GENMASK(20, 14)
+#define JH7110_RTC_DATE_DAY		GENMASK(5, 0)
+#define JH7110_RTC_DATE_MON		GENMASK(10, 6)
+#define JH7110_RTC_DATE_YEAR		GENMASK(18, 11)
+
+#define JH7110_RTC_CAL_MASK		GENMASK(15, 0)
+#define JH7110_RTC_TICKS_PER_SEC	32768
+
+#define JH7110_RTC_SYNC_TIMEOUT_US	1000
+
+struct jh7110_rtc {
+	struct rtc_device *rtc;
+	void __iomem *base;
+};
+
+static void jh7110_rtc_reg2tm(struct rtc_time *tm, u32 time, u32 date)
+{
+	tm->tm_sec = bcd2bin(FIELD_GET(JH7110_RTC_TIME_SEC, time));
+	tm->tm_min = bcd2bin(FIELD_GET(JH7110_RTC_TIME_MIN, time));
+	tm->tm_hour = bcd2bin(FIELD_GET(JH7110_RTC_TIME_HOUR, time));
+	tm->tm_mday = bcd2bin(FIELD_GET(JH7110_RTC_DATE_DAY, date));
+	tm->tm_mon = bcd2bin(FIELD_GET(JH7110_RTC_DATE_MON, date)) - 1;
+	tm->tm_year = bcd2bin(FIELD_GET(JH7110_RTC_DATE_YEAR, date)) + 100;
+}
+
+static u32 jh7110_rtc_tm2time(struct rtc_time *tm)
+{
+	return FIELD_PREP(JH7110_RTC_TIME_SEC, bin2bcd(tm->tm_sec)) |
+	       FIELD_PREP(JH7110_RTC_TIME_MIN, bin2bcd(tm->tm_min)) |
+	       FIELD_PREP(JH7110_RTC_TIME_HOUR, bin2bcd(tm->tm_hour));
+}
+
+static u32 jh7110_rtc_tm2date(struct rtc_time *tm)
+{
+	return FIELD_PREP(JH7110_RTC_DATE_DAY, bin2bcd(tm->tm_mday)) |
+	       FIELD_PREP(JH7110_RTC_DATE_MON, bin2bcd(tm->tm_mon + 1)) |
+	       FIELD_PREP(JH7110_RTC_DATE_YEAR, bin2bcd(tm->tm_year - 100));
+}
+
+static int jh7110_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct jh7110_rtc *jrtc = dev_get_drvdata(dev);
+	u32 time, date;
+
+	/*
+	 * re-read if the time rolled over between reading TIME & DATE, since
+	 * that rollover can also change the date.
+	 */
+	do {
+		time = readl(jrtc->base + JH7110_RTC_TIME);
+		date = readl(jrtc->base + JH7110_RTC_DATE);
+	} while (time != readl(jrtc->base + JH7110_RTC_TIME));
+
+	jh7110_rtc_reg2tm(tm, time, date);
+
+	return 0;
+}
+
+static int jh7110_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct jh7110_rtc *jrtc = dev_get_drvdata(dev);
+	u32 val;
+
+	writel(jh7110_rtc_tm2time(tm), jrtc->base + JH7110_RTC_CFG_TIME);
+	writel(jh7110_rtc_tm2date(tm), jrtc->base + JH7110_RTC_CFG_DATE);
+
+	/*
+	 * The counter loads CFG_TIME & CFG_DATE on this pulse; the bit appears
+	 * to read back as 1 until the load is done.
+	 */
+	writel(JH7110_RTC_EVENT_UPDATE, jrtc->base + JH7110_RTC_IRQ_EVENT);
+
+	return readl_poll_timeout(jrtc->base + JH7110_RTC_IRQ_EVENT, val,
+				  !(val & JH7110_RTC_EVENT_UPDATE), 10,
+				  JH7110_RTC_SYNC_TIMEOUT_US);
+}
+
+static int jh7110_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct jh7110_rtc *jrtc = dev_get_drvdata(dev);
+	u32 val;
+
+	val = readl(jrtc->base + JH7110_RTC_IRQ_EN);
+	if (enabled)
+		val |= JH7110_RTC_IRQ_ALARM;
+	else
+		val &= ~JH7110_RTC_IRQ_ALARM;
+	writel(val, jrtc->base + JH7110_RTC_IRQ_EN);
+
+	return 0;
+}
+
+static int jh7110_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct jh7110_rtc *jrtc = dev_get_drvdata(dev);
+
+	jh7110_rtc_reg2tm(&alrm->time, readl(jrtc->base + JH7110_RTC_ACT_TIME),
+			  readl(jrtc->base + JH7110_RTC_ACT_DATE));
+	alrm->enabled = !!(readl(jrtc->base + JH7110_RTC_IRQ_EN) & JH7110_RTC_IRQ_ALARM);
+
+	return 0;
+}
+
+static int jh7110_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct jh7110_rtc *jrtc = dev_get_drvdata(dev);
+	u32 val;
+	int ret;
+
+	jh7110_rtc_alarm_irq_enable(dev, 0);
+	writel(jh7110_rtc_tm2time(&alrm->time), jrtc->base + JH7110_RTC_ACT_TIME);
+	writel(jh7110_rtc_tm2date(&alrm->time), jrtc->base + JH7110_RTC_ACT_DATE);
+	writel(JH7110_RTC_IRQ_ALARM, jrtc->base + JH7110_RTC_IRQ_EVENT);
+
+	ret = readl_poll_timeout(jrtc->base + JH7110_RTC_IRQ_EVENT, val,
+				 !(val & JH7110_RTC_IRQ_ALARM), 10,
+				 JH7110_RTC_SYNC_TIMEOUT_US);
+	if (ret)
+		return ret;
+
+	return jh7110_rtc_alarm_irq_enable(dev, alrm->enabled);
+}
+
+/*
+ * 1 sec for the RTC = CAL_VALUE + 1 cycles of the 32.768 kHz clock.
+ * Default of 0x7fff = exactly one second.
+ * Each step of CAL_VALUE changes the rate by 1/32768, about 30.5 ppm.
+ */
+static int jh7110_rtc_read_offset(struct device *dev, long *offset)
+{
+	struct jh7110_rtc *jrtc = dev_get_drvdata(dev);
+	s64 ticks;
+
+	ticks = (readl(jrtc->base + JH7110_RTC_CAL_VALUE) & JH7110_RTC_CAL_MASK) + 1;
+	*offset = DIV_S64_ROUND_CLOSEST((ticks - JH7110_RTC_TICKS_PER_SEC) * NSEC_PER_SEC,
+					JH7110_RTC_TICKS_PER_SEC);
+
+	return 0;
+}
+
+static int jh7110_rtc_set_offset(struct device *dev, long offset)
+{
+	struct jh7110_rtc *jrtc = dev_get_drvdata(dev);
+	s64 ticks;
+	u32 val;
+
+	if (offset < -NSEC_PER_SEC || offset > NSEC_PER_SEC)
+		return -ERANGE;
+
+	ticks = JH7110_RTC_TICKS_PER_SEC +
+		DIV_S64_ROUND_CLOSEST((s64)offset * JH7110_RTC_TICKS_PER_SEC, NSEC_PER_SEC);
+	if (ticks < 1 || ticks > JH7110_RTC_CAL_MASK + 1)
+		return -ERANGE;
+
+	writel(ticks - 1, jrtc->base + JH7110_RTC_SW_CAL_VALUE);
+	val = readl(jrtc->base + JH7110_RTC_CFG);
+	writel(val & ~JH7110_RTC_CFG_CAL_SEL_HW, jrtc->base + JH7110_RTC_CFG);
+
+	return 0;
+}
+
+static irqreturn_t jh7110_rtc_irq(int irq, void *data)
+{
+	struct jh7110_rtc *jrtc = data;
+	u32 events, val;
+
+	events = readl(jrtc->base + JH7110_RTC_IRQ_EVENT) &
+		 readl(jrtc->base + JH7110_RTC_IRQ_EN) & JH7110_RTC_IRQ_ALL;
+	if (!events)
+		return IRQ_NONE;
+
+	writel(events, jrtc->base + JH7110_RTC_IRQ_EVENT);
+	if (readl_poll_timeout_atomic(jrtc->base + JH7110_RTC_IRQ_EVENT, val,
+				      !(val & events), 0, JH7110_RTC_SYNC_TIMEOUT_US))
+		dev_warn_ratelimited(&jrtc->rtc->dev, "interrupt events 0x%x not cleared\n",
+				     events);
+
+	if (events & JH7110_RTC_IRQ_ALARM)
+		rtc_update_irq(jrtc->rtc, 1, RTC_AF | RTC_IRQF);
+
+	return IRQ_HANDLED;
+}
+
+static const struct rtc_class_ops jh7110_rtc_ops = {
+	.read_time		= jh7110_rtc_read_time,
+	.set_time		= jh7110_rtc_set_time,
+	.read_alarm		= jh7110_rtc_read_alarm,
+	.set_alarm		= jh7110_rtc_set_alarm,
+	.alarm_irq_enable	= jh7110_rtc_alarm_irq_enable,
+	.read_offset		= jh7110_rtc_read_offset,
+	.set_offset		= jh7110_rtc_set_offset,
+};
+
+static int jh7110_rtc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct reset_control *rst;
+	struct jh7110_rtc *jrtc;
+	struct clk *clk;
+	int irq, ret;
+	u32 val;
+
+	jrtc = devm_kzalloc(dev, sizeof(*jrtc), GFP_KERNEL);
+	if (!jrtc)
+		return -ENOMEM;
+
+	jrtc->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(jrtc->base))
+		return PTR_ERR(jrtc->base);
+
+	clk = devm_clk_get_enabled(dev, "apb");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable apb clock\n");
+
+	clk = devm_clk_get_enabled(dev, "cal");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable cal clock\n");
+
+	clk = devm_clk_get_enabled(dev, "32k");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable 32k clock\n");
+
+	/* Never asserted again, as that would stop the clock & lose the time */
+	rst = devm_reset_control_array_get_exclusive(dev);
+	if (IS_ERR(rst))
+		return dev_err_probe(dev, PTR_ERR(rst), "failed to get resets\n");
+
+	ret = reset_control_deassert(rst);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to deassert resets\n");
+
+	irq = platform_get_irq_byname(pdev, "rtc");
+	if (irq < 0)
+		return irq;
+
+	jrtc->rtc = devm_rtc_allocate_device(dev);
+	if (IS_ERR(jrtc->rtc))
+		return PTR_ERR(jrtc->rtc);
+
+	platform_set_drvdata(pdev, jrtc);
+
+	jrtc->rtc->ops = &jh7110_rtc_ops;
+	jrtc->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	jrtc->rtc->range_max = RTC_TIMESTAMP_END_2099;
+
+	val = readl(jrtc->base + JH7110_RTC_CFG);
+	writel(val | JH7110_RTC_CFG_HOUR_24H | JH7110_RTC_CFG_ENABLE,
+	       jrtc->base + JH7110_RTC_CFG);
+
+	ret = devm_request_irq(dev, irq, jh7110_rtc_irq, 0, dev_name(dev), jrtc);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to request irq\n");
+
+	ret = devm_device_init_wakeup(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to init wakeup\n");
+
+	ret = devm_pm_set_wake_irq(dev, irq);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set wake irq\n");
+
+	return devm_rtc_register_device(jrtc->rtc);
+}
+
+static const struct of_device_id jh7110_rtc_of_match[] = {
+	{ .compatible = "starfive,jh7110-rtc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, jh7110_rtc_of_match);
+
+static struct platform_driver jh7110_rtc_driver = {
+	.driver = {
+		.name = "jh7110-rtc",
+		.of_match_table = jh7110_rtc_of_match,
+	},
+	.probe = jh7110_rtc_probe,
+};
+module_platform_driver(jh7110_rtc_driver);
+
+MODULE_AUTHOR("Samin Guo <samin.guo@starfivetech.com>");
+MODULE_AUTHOR("Hal Feng <hal.feng@starfivetech.com>");
+MODULE_DESCRIPTION("StarFive JH7110 RTC driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
