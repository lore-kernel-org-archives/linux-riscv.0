Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26A5C3ABC3
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 18:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r1Kfbh5/lI+DBwAkOehkwVzr+4JOcnERuJR3hAJu0rY=; b=MVNgk7pUtBK+8+
	F1Qk3NAsjLyFaFBc+VKkKnJxUhFLZQkGMN1BKo07iu6wfMla08DAPObFUqfGavrylo9ZiRsBHStRf
	6WJz9IFKTNPOzQcGaXhfSHYqyG+NWamzQ47vi8eNsLozti/VWs9KBuGVDs7AhatiHNRpXRxw0z8Cc
	dZifj76BWTSst2B1gsG7lTfGOdMwgBJsM/rNZGzoQFLQeTcZFCNY51hiO4aAdY/iknYiEyIz3d/EF
	9g9pyvwJ4Yuo+ION6I1Uzs6Bwbck8f7iU+YXBz+QQ5BosmnJiBcqZwNka2nUkgTQTe3akQhmejK5p
	IHOicd3dnl5y/sIdP1+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXx8-0000000AOvm-0Nyf;
	Mon, 12 May 2025 18:32:38 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXwu-0000000AOmx-1lxj
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 18:32:26 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-85dac9729c3so479730539f.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 11:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747074743; x=1747679543; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQXCM0rzq2AjpYhvu6QGM7rUdeLPiqP7J4a3LgsGC08=;
        b=2YKoX4ER/ATnGMmJZVKZ11J0JxK45Qg0Smj39tI/am+jOO4sqmZ4GBKnBbyYcy9CCj
         GFIfpfYd+ZdwQ4QNe+fBjzyHgyKtQPujJ/uQXeNgIhxv+pzIxO/06nO+Jm3FIbbn645Z
         dkMllYYaiqUOgUBPf7ed0OFtTTWvTzWaySSQkNUcKK8rwzbcQQtCdjEofEoJbJiTTY5C
         h4P/flkc02EByHcFPxt4Lsq6UmxDrTOMR36VjKXAJgT0+QW/R2Wlj0jcB1WlzPXtuShs
         RIkdxDipfng6usTfOoF477BXna9sRZFUJGTkrxD8AVdH62XBxNYi7sfC/3bkY3NS9U66
         FYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074743; x=1747679543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GQXCM0rzq2AjpYhvu6QGM7rUdeLPiqP7J4a3LgsGC08=;
        b=os0O/EedIvNvj4GaUOJyuq2/XhHlNLn4t3MQsZWvit04LoZKNLc0DGyAr4cTd9/zz6
         RX8BY/lQWqG/x6gcEkLypO1E7ry03nSu/vMEFssHIIAbZfMYUKuSAw7Fi+p3jtfFRLsK
         VXueAZsoxHpVOOIcwlVzBp23tJknx4/Vi40nDVNX+XRnSHvtBCIYUgfFZc++5oN95ENp
         QnX9bLgaAjXVzVRgBGIJ+GtHCayX7DM7JXAXSCj5om2jHm3HWJtPSV4uUD9b3Y53SbzT
         dcavOfYuFaR0sxyOFZDl8kK645E25KK/oRV3dDKe/W+XAEB1aPACcZMyQCh7sbEgSjOe
         0olQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjTAJSRC2MQswf/Q100+fjAkJ7H25GN5PKQHM7B6ypYGshU7+o1gr8ynvSuD0afwoHDuyNo+GSl/HOOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyohHR5MEUhvvWUTnvol0LmsUJi37ZKg2a0JxEPIt3eeY13O+4k
	MF98KnPYrRLR8sizUyNEqh5iV+QfJWMIALKjKI5M63/mx2Jn4tQNmUhZUdJxBDE=
X-Gm-Gg: ASbGncssydyCyFOhLXgAMvmLe1PxDDwEd4YaA8g4MSVkxwVjJkzTdlzYHNSyWpX99ly
	uSbp654N9y2m2tCqGMj+hnGZXI6uH+tX5xwmc4I3zWHTUeR/80AMmA1FGlaBDEU7MMVumBXPdj7
	0uI+jUl3L9/6pwFHmGhFpphponBCzNL+YF8/o5R0a/yRMVY1Em8btdwcK/rI07xWgsRmFBVw1xb
	+Qoc37CxN7TXo5hTg9GJR8v/zRQ/G0c9JHLHfER7ndFmOPWZsARZGhNSxQOMekAyN5KYr8PZUv4
	m8JoKaEdtVHLPhvzucayhe3npST74E8HL1xPIpSSM3XRdUqZKaJ8gDhO1WydiNjSWM6OiwJbwg7
	v+qJlxpKoAkvpt0VDubmX5bkR
X-Google-Smtp-Source: AGHT+IFOxzv764nHHyT3D3TfI3ajf5K30FAne2X00+zGIBd6bGfjC2OadvzehU1ckhwS1ZoivaaoZw==
X-Received: by 2002:a05:6602:2c87:b0:867:9af:812e with SMTP id ca18e2360f4ac-8676356a14emr1591532439f.5.1747074743299;
        Mon, 12 May 2025 11:32:23 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa22496e9fsm1740333173.11.2025.05.12.11.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:32:22 -0700 (PDT)
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
Subject: [PATCH v9 5/6] reset: spacemit: define three more CCUs
Date: Mon, 12 May 2025 13:32:10 -0500
Message-ID: <20250512183212.3465963-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250512183212.3465963-1-elder@riscstar.com>
References: <20250512183212.3465963-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_113224_458027_CABAA541 
X-CRM114-Status: GOOD (  10.47  )
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
 drivers/clk/spacemit/ccu-k1.c    | 24 +++++++++++++++
 drivers/reset/reset-spacemit.c   | 51 ++++++++++++++++++++++++++++++++
 include/soc/spacemit/k1-syscon.h | 30 +++++++++++++++++++
 3 files changed, 105 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 1c9ed434ae93e..f9e2200d1fd04 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -943,6 +943,18 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
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
@@ -1121,6 +1133,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
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
diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
index eff67bdc8adba..4137f4f8352d3 100644
--- a/drivers/reset/reset-spacemit.c
+++ b/drivers/reset/reset-spacemit.c
@@ -158,6 +158,54 @@ static const struct ccu_reset_controller_data k1_apmu_reset_data = {
 	.count		= ARRAY_SIZE(k1_apmu_resets),
 };
 
+static const struct ccu_reset_data k1_rcpu_resets[] = {
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
+	.reset_data	= k1_rcpu_resets,
+	.count		= ARRAY_SIZE(k1_rcpu_resets),
+};
+
+static const struct ccu_reset_data k1_rcpu2_resets[] = {
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
+	.reset_data	= k1_rcpu2_resets,
+	.count		= ARRAY_SIZE(k1_rcpu2_resets),
+};
+
+static const struct ccu_reset_data k1_apbc2_resets[] = {
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
+	.reset_data	= k1_apbc2_resets,
+	.count		= ARRAY_SIZE(k1_apbc2_resets),
+};
+
 static int spacemit_reset_update(struct reset_controller_dev *rcdev,
 				 unsigned long id, bool assert)
 {
@@ -231,6 +279,9 @@ static const struct auxiliary_device_id spacemit_reset_ids[] = {
 	K1_AUX_DEV_ID(mpmu),
 	K1_AUX_DEV_ID(apbc),
 	K1_AUX_DEV_ID(apmu),
+	K1_AUX_DEV_ID(rcpu),
+	K1_AUX_DEV_ID(rcpu2),
+	K1_AUX_DEV_ID(apbc2),
 	{ },
 };
 MODULE_DEVICE_TABLE(auxiliary, spacemit_reset_ids);
diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
index 53eff7691f33d..c59bd7a38e5b4 100644
--- a/include/soc/spacemit/k1-syscon.h
+++ b/include/soc/spacemit/k1-syscon.h
@@ -127,4 +127,34 @@ to_spacemit_ccu_adev(struct auxiliary_device *adev)
 #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
 #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
 
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
+
 #endif /* __SOC_K1_SYSCON_H__ */
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
