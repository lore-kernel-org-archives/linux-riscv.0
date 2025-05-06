Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0873C3ABC0
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 02:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uzageQV01E9ltxAU3x22uLxC2Jyh5JlUcCjfFuH4Q00=; b=Jy/jDQCbCiZEdg
	vPU87g1YH7yKJNqNOFOdpVSSrSsDGtK1SODddEny+OOmX9xFHtPE1hUnRh3i57Ll5uYpi2MDo3qwM
	cIBOJEFFJLqxrKb6+nnffR5PtSDSgAir1pWY2xMYh2xWYCgKdCP4Lu6mbUPOMZqRakcMUcyPxc4Yo
	v1QndVUU99nZQti8B5AuyexvEzm6tAyxQr8lXMh7X2Yg18R8NjkTvusyAsP8bAFWP3iNQPd9vm14R
	rUMVYlsTswkIrbbsrKYfuHgoO6Y+F8vQIq1F8t4np6VUXdplrrlLWh/UXByFxAnuvWFE3hMjuPag1
	DiCsKR1oZqspmBYzZXlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUbJ-0000000Dvrt-2cY8;
	Wed, 07 May 2025 02:33:37 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCPV5-0000000DPJS-1aqz
	for linux-riscv@lists.infradead.org;
	Tue, 06 May 2025 21:06:52 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-85dac9729c3so608943739f.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 May 2025 14:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746565610; x=1747170410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4z0K4kzFPsp/sHcESObbMXkE8E8lHogVd3HcemJwitc=;
        b=dbC//Rde/JuQBY9Or24A4DTu4Tp9c6eCDY4L5AoohmxHQ35HucVduRp5KBpD9rQOEz
         v0efyPerxwyEyeplOTpEp94phrzFrdsAqA4yTB4iR8DfdV4+NtBTycB0Fg9gmUQxyRa+
         p3nMYywlJmtp95hykRsgrC9i0MDXCNKwXGIkxnDv/WKfURq8riaf/zQhpHx9WJ17NuDq
         OOYuqSoSSKG+yUJ3x21L5bsLmH64MhIVqfqGpgvFppfByxcqZBggmdsI9mVFFgvZVBfK
         p6TXxjeVpaYWapIik2Eq6hRKJTy4nZoIElV4RP4Be9QpXZN7frgB6jVMQMg2GTLTXzXg
         UGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746565610; x=1747170410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4z0K4kzFPsp/sHcESObbMXkE8E8lHogVd3HcemJwitc=;
        b=mKhJGBspO972O+SGIODfsGU3WuB0VGhDz7/zcR9xyHFMG/woBHiRYrysGT5A07QCKZ
         N6vn8BC6Nk6IIGu6JB26CIsLoBEEZfmsbTPovZp6VROtRiJsLbNlGrK4RF3keC0tniCY
         4OdWv+sO/AKHwC7spFf6xZQFdVcjGBMmx0Z5aShR6KBcJxY1VbtboTHjkkPE8fmicOBC
         keNVVya7n783U72iUkn5N3riOmqjASvTao1oOGzTwxsNjAuyS0HWTofBEY2it6Xh/7Lr
         bbaaHQM6K0X1l6//QVCSVgsPCmSv+mrNKDucJEmshSPnTEM7ESN5nIJIExoo8XceNekx
         UU8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUo2MywcC5iNiLaapNyq0u3qwR3QHqL08Iv65mLoxlR8LWX8FG8ttg8xW7WSxzAUB/hE/z/LV5AO3icjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzigQMRh0qr94GbUdjlGsRpnTP4mssoEPPylxEwZniWctEUDOs1
	VQp6h9/s29R+Nw74218SekEyflC79ynl42qPIbO4raslOEosww177ZXwyvtYwCA=
X-Gm-Gg: ASbGncs0xRA12YVlc2yllha5I2gpvajYSE3hWJ6RwOTTY/ojhShcTnSkO4rRTMx+5wF
	VjYusE+sjlWUM54z9TO/Nxiym/3pccYEor4yc8LPq/VW9SmOsH3iKdFmLu0sU9bz6h7KG3s6HCu
	wNtB2K0esQUiHwn8nA7ip7/OUzmGC03liDtLCdzNRIVLhXixOtOoK85T6S2bxXf3+uonZ1OJOR5
	U5pcGdsLZoBgNMmpodi8Gw5elB/mECXr8CWdGe+1MPkLE1IlmvXziyR4CZAE2C+Ya7E8AbJ8m+s
	xYSfIOyfr5KP9MtyuVrbvT76/wTEcJ+W3bqmzuUoFp41zgJkpPrIhrathaFcUhsg6u8Ss3PEQHG
	Lo76Oa9hA8UEuR5N4iAzgjHV8
X-Google-Smtp-Source: AGHT+IFGjQEF7fCThICgu4hR6t0NNc2NV3Tvj+Q6GZuc4V+JgASwbCj93Air8LG5cMU+hgkWkJJxKQ==
X-Received: by 2002:a05:6602:6c18:b0:85c:c7f9:9a1c with SMTP id ca18e2360f4ac-8674744e2f4mr118536739f.13.1746565610279;
        Tue, 06 May 2025 14:06:50 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aa588basm2419559173.79.2025.05.06.14.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 14:06:49 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/6] reset: spacemit: define three more CCUs
Date: Tue,  6 May 2025 16:06:36 -0500
Message-ID: <20250506210638.2800228-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250506210638.2800228-1-elder@riscstar.com>
References: <20250506210638.2800228-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_140651_416645_39301CEA 
X-CRM114-Status: GOOD (  10.67  )
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

Three more CCUs on the SpacemiT K1 SoC implement only resets, not clocks.
Define these resets so they can be used.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 24 ++++++++++++++++
 drivers/reset/spacemit/k1.c   | 54 +++++++++++++++++++++++++++++++++++
 include/soc/spacemit/ccu_k1.h | 30 +++++++++++++++++++
 3 files changed, 108 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 6b1845e899e5f..bddc83aff23cd 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -939,6 +939,18 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
 	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
+static const struct spacemit_ccu_data k1_ccu_rcpu_data = {
+	.reset_name	= "rcpu-reset",
+};
+
+static const struct spacemit_ccu_data k1_ccu_rcpu2_data = {
+	.reset_name	= "rcpu2-reset",
+};
+
+static const struct spacemit_ccu_data k1_ccu_apbc2_data = {
+	.reset_name	= "apbc2-reset",
+};
+
 static int spacemit_ccu_register(struct device *dev,
 				 struct regmap *regmap,
 				 struct regmap *lock_regmap,
@@ -1106,6 +1118,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
 		.compatible	= "spacemit,k1-syscon-apmu",
 		.data		= &k1_ccu_apmu_data,
 	},
+	{
+		.compatible	= "spacemit,k1-syscon-rcpu",
+		.data		= &k1_ccu_rcpu_data,
+	},
+	{
+		.compatible	= "spacemit,k1-syscon-rcpu2",
+		.data		= &k1_ccu_rcpu2_data,
+	},
+	{
+		.compatible	= "spacemit,k1-syscon-apbc2",
+		.data		= &k1_ccu_apbc2_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, of_k1_ccu_match);
diff --git a/drivers/reset/spacemit/k1.c b/drivers/reset/spacemit/k1.c
index 19a34f151b214..27434a1928261 100644
--- a/drivers/reset/spacemit/k1.c
+++ b/drivers/reset/spacemit/k1.c
@@ -137,6 +137,57 @@ static const struct ccu_reset_controller_data k1_apmu_reset_data = {
 	.count		= ARRAY_SIZE(apmu_resets),
 };
 
+static const struct ccu_reset_data rcpu_resets[] = {
+	[RESET_RCPU_SSP0]	= RESET_DATA(RCPU_SSP0_CLK_RST,	0, BIT(0)),
+	[RESET_RCPU_I2C0]	= RESET_DATA(RCPU_I2C0_CLK_RST,	0, BIT(0)),
+	[RESET_RCPU_UART1]	= RESET_DATA(RCPU_UART1_CLK_RST, 0, BIT(0)),
+	[RESET_RCPU_IR]		= RESET_DATA(RCPU_CAN_CLK_RST,	0, BIT(0)),
+	[RESET_RCPU_CAN]	= RESET_DATA(RCPU_IR_CLK_RST,	0, BIT(0)),
+	[RESET_RCPU_UART0]	= RESET_DATA(RCPU_UART0_CLK_RST, 0, BIT(0)),
+	[RESET_RCPU_HDMI_AUDIO]	= RESET_DATA(AUDIO_HDMI_CLK_CTRL, 0, BIT(0)),
+};
+
+static const struct ccu_reset_controller_data k1_rcpu_reset_data = {
+	/* No clocks in the RCPU CCU */
+	.reset_data	= rcpu_resets,
+	.count		= ARRAY_SIZE(rcpu_resets),
+};
+
+static const struct ccu_reset_data rcpu2_resets[] = {
+	[RESET_RCPU2_PWM0]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM1]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM2]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM3]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM4]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM5]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM6]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM7]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM8]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM9]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+};
+
+static const struct ccu_reset_controller_data k1_rcpu2_reset_data = {
+	/* No clocks in the RCPU2 CCU */
+	.reset_data	= rcpu2_resets,
+	.count		= ARRAY_SIZE(rcpu2_resets),
+};
+
+static const struct ccu_reset_data apbc2_resets[] = {
+	[RESET_APBC2_UART1]	= RESET_DATA(APBC2_UART1_CLK_RST, BIT(2), 0),
+	[RESET_APBC2_SSP2]	= RESET_DATA(APBC2_SSP2_CLK_RST, BIT(2), 0),
+	[RESET_APBC2_TWSI3]	= RESET_DATA(APBC2_TWSI3_CLK_RST, BIT(2), 0),
+	[RESET_APBC2_RTC]	= RESET_DATA(APBC2_RTC_CLK_RST,	BIT(2), 0),
+	[RESET_APBC2_TIMERS0]	= RESET_DATA(APBC2_TIMERS0_CLK_RST, BIT(2), 0),
+	[RESET_APBC2_KPC]	= RESET_DATA(APBC2_KPC_CLK_RST,	BIT(2), 0),
+	[RESET_APBC2_GPIO]	= RESET_DATA(APBC2_GPIO_CLK_RST, BIT(2), 0),
+};
+
+static const struct ccu_reset_controller_data k1_apbc2_reset_data = {
+	/* No clocks in the APBC2 CCU */
+	.reset_data	= apbc2_resets,
+	.count		= ARRAY_SIZE(apbc2_resets),
+};
+
 static int spacemit_k1_reset_probe(struct auxiliary_device *adev,
 				   const struct auxiliary_device_id *id)
 {
@@ -164,6 +215,9 @@ static const struct auxiliary_device_id spacemit_k1_reset_ids[] = {
 	K1_AUX_DEV_ID(mpmu),
 	K1_AUX_DEV_ID(apbc),
 	K1_AUX_DEV_ID(apmu),
+	K1_AUX_DEV_ID(rcpu),
+	K1_AUX_DEV_ID(rcpu2),
+	K1_AUX_DEV_ID(apbc2),
 	{ },
 };
 MODULE_DEVICE_TABLE(auxiliary, spacemit_k1_reset_ids);
diff --git a/include/soc/spacemit/ccu_k1.h b/include/soc/spacemit/ccu_k1.h
index 8b2581fb3055d..66035012317c9 100644
--- a/include/soc/spacemit/ccu_k1.h
+++ b/include/soc/spacemit/ccu_k1.h
@@ -123,3 +123,33 @@ to_spacemit_ccu_adev(struct auxiliary_device *adev)
 #define APMU_PCIE_CLK_RES_CTRL_2	0x3dc
 #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
 #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
+
+/* RCPU register offsets */
+#define RCPU_SSP0_CLK_RST		0x0028
+#define RCPU_I2C0_CLK_RST		0x0030
+#define RCPU_UART1_CLK_RST		0x003c
+#define RCPU_CAN_CLK_RST		0x0048
+#define RCPU_IR_CLK_RST			0x004c
+#define RCPU_UART0_CLK_RST		0x00d8
+#define AUDIO_HDMI_CLK_CTRL		0x2044
+
+/* RCPU2 register offsets */
+#define RCPU2_PWM0_CLK_RST		0x0000
+#define RCPU2_PWM1_CLK_RST		0x0004
+#define RCPU2_PWM2_CLK_RST		0x0008
+#define RCPU2_PWM3_CLK_RST		0x000c
+#define RCPU2_PWM4_CLK_RST		0x0010
+#define RCPU2_PWM5_CLK_RST		0x0014
+#define RCPU2_PWM6_CLK_RST		0x0018
+#define RCPU2_PWM7_CLK_RST		0x001c
+#define RCPU2_PWM8_CLK_RST		0x0020
+#define RCPU2_PWM9_CLK_RST		0x0024
+
+/* APBC2 register offsets */
+#define APBC2_UART1_CLK_RST		0x0000
+#define APBC2_SSP2_CLK_RST		0x0004
+#define APBC2_TWSI3_CLK_RST		0x0008
+#define APBC2_RTC_CLK_RST		0x000c
+#define APBC2_TIMERS0_CLK_RST		0x0010
+#define APBC2_KPC_CLK_RST		0x0014
+#define APBC2_GPIO_CLK_RST		0x001c
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
