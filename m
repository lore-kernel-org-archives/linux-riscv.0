Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BE4C369B9
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 19:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JCE1K+OLneEnwMetFuB11OAmsHXBZNa0y7hiFVxhvnw=; b=LvUci3ItFpnU5T
	wM7KjHpzC/WWT11Tm4vhtqb4IzbAI/g7i7MR0ZwvLa/ReCcMNSw4BBLruU9km/WfO70ZGVyFEtoFY
	iw0tqnyBk+okqEuCbbFkqrn0u1mgIPlyPwBXamlyT6Bfk5PX00zSUwv+nWt6SKoVNp1jHtszG02xZ
	cRwPfFPRhYf6KCRRLKCSUjg9fNSAHraoutaaQ04lVSJxaQY2li8vu9jenUIFCdslVV9wuzZjbhed+
	Pa94Fm/kO1okUc6wfIIyHOcgm8OwaY1S0LiADITDtmpJLn5h8f8+jbsrSrul8wvhy0PtsRCSJYfg9
	lfVLXCj4miu2onxjmVmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4PN2-00000003JYd-3dsL;
	Mon, 14 Apr 2025 19:21:28 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4PJB-00000003Hox-2ymj
	for linux-riscv@lists.infradead.org;
	Mon, 14 Apr 2025 19:17:30 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3d450154245so41077225ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 14 Apr 2025 12:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744658249; x=1745263049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwdVaBETwxDWpM+5yDsk4U+9VwHFz4zWoTYQSSEXcvE=;
        b=sIk+0N6id3dx/tKIK0m9tsMbGYXjFAi8HM7o9JmXAfl6n4wxXO/zKcBrLGiWjkJOpF
         oqqpRbcDjg3ijLaeHUD/efYKTr6scvcwIEzBnEPPALvTx0rM3VpgF2kyPSCOvb3Tki0d
         JZwlYknwpOYKQhHX7h6suEALnrNpE2sYa5Gv1ZuMKJjovzj3gtT3G0jh4UlaJWSfbNBA
         uxkV9VgHralb1fTqXRkAU1Rmnej09mnPrmYYh5+DJAK9uVM4zc3QVErCn+D5KLl3szFL
         zntESw+Vg08V6yao92ajAm+E0FeP8QqhSjFYpAi8IlzaagCVkUlG6/mJn6J4ZFQofdwU
         U3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658249; x=1745263049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwdVaBETwxDWpM+5yDsk4U+9VwHFz4zWoTYQSSEXcvE=;
        b=adBuj81eFY9nkMWbjd2QxkDSbjs+gdUZR4/kX8diKPIc/1lKWPXFJj2XUuSe7tBmNJ
         s7FndyY/bJuJ0Wz6uUvy+wogiucmxi/vkRl0aH/qFygrRvN/bOJGrVEWrqXvkJox2hRA
         qtQtmAhaaDFKrghTasqgqqQe7nMUo6YHnwIEiUGC35AzOUS2xHel3pT1Lz+DQ+JgAHPf
         imlHkPLlnGMMt+Apv278uRR4P7u7ZaZEX031A3nlRHQ5Px2SEAbyQGFaAgIdSuAO1C3r
         ab7zNmZuoWhtsqF2cfQlVZfknRm1zb7dvCLGjMISeF1XRE+VM0cif3ytWW36Hfd6pfEd
         k5YA==
X-Forwarded-Encrypted: i=1; AJvYcCV6Xk+1QVmK36gAjpYmcicH3slEQJp8HF5xPbkVaq82io2uxwlrAAz4Q30vgZgBELauk7H0xy+pnr7Tmw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgLn0/iXrBfKdZgF3KFxrCZEcBno7td9I6uFRl1fSemtAR44Tb
	QgMkZcOehGNLGUCVOT+ynIgYUuMqJxUWH7GtAqK/Q2gSJGqeiWla+th8DU/8ejk=
X-Gm-Gg: ASbGncs/t36FqHypnsWjcsFjQGhhcUlpp5YaUm4T4Ep6UNnj1WlO2aTq6+Tg28pn9pT
	zPFgn4R+qJwvlx6nfMqlVziXrM2YsVbvVTkKhf3gDL2AQOxhACJjbUtXbhdhGGfCn7F8hwYCuca
	SnKOpgDB7YH84hwc5mYOa6DzuJUF4D2TLdRAS1EC2s7KWxdcf/Lagrl4En5m/YUMowxel08Pmxq
	mtVlwr1obBvQdFhFpPp5zQbxPAvUAK+eEwE+j3gDmUuum7Zp61j0gJvewsR9AWXIeiPVytxCqdZ
	P+4O9eNcOW+l0cCXjq/YK3r0hKxlxTUsdwvfZUWJUZkZ7IJmaxU/lhGduS6RciFkvgmcCSJOglf
	rS9pr/tdkgbFP07PeJv36kK8y
X-Google-Smtp-Source: AGHT+IGALOK7ig51+oL4dJYMMU7C6xF63EBGCVneXzwZOXrq7mBo4YaHe/qyW+GSY33q0r700Y9bnQ==
X-Received: by 2002:a05:6e02:2191:b0:3d4:38a4:388e with SMTP id e9e14a558f8ab-3d7ec1ec47dmr151224735ab.1.1744658248748;
        Mon, 14 Apr 2025 12:17:28 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e026d1sm2715662173.94.2025.04.14.12.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 12:17:28 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/7] clk: spacemit: define new syscons with only resets
Date: Mon, 14 Apr 2025 14:17:13 -0500
Message-ID: <20250414191715.2264758-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250414191715.2264758-1-elder@riscstar.com>
References: <20250414191715.2264758-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_121729_748769_CCEA9081 
X-CRM114-Status: GOOD (  11.39  )
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

Enable support for three additional syscon CCUs which support reset
controls but no clocks:  ARCPU, RCPU2, and APBC2.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 93 +++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 7494c97c3c7ec..cd1a0668bd203 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -130,6 +130,36 @@
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
 struct ccu_reset_data {
 	u32 offset;
 	u32 assert_mask;
@@ -1177,6 +1207,57 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
 	.reset_num	= ARRAY_SIZE(apmu_reset_data),
 };
 
+static const struct ccu_reset_data rcpu_reset_data[] = {
+	[RESET_RCPU_SSP0]	= RESET_DATA(RCPU_SSP0_CLK_RST,	0, BIT(0)),
+	[RESET_RCPU_I2C0]	= RESET_DATA(RCPU_I2C0_CLK_RST,	0, BIT(0)),
+	[RESET_RCPU_UART1]	= RESET_DATA(RCPU_UART1_CLK_RST, 0, BIT(0)),
+	[RESET_RCPU_IR]		= RESET_DATA(RCPU_CAN_CLK_RST,	0, BIT(0)),
+	[RESET_RCPU_CAN]	= RESET_DATA(RCPU_IR_CLK_RST,	0, BIT(0)),
+	[RESET_RCPU_UART0]	= RESET_DATA(RCPU_UART0_CLK_RST, 0, BIT(0)),
+	[RESET_RCPU_HDMI_AUDIO]	= RESET_DATA(AUDIO_HDMI_CLK_CTRL, 0, BIT(0)),
+};
+
+static struct spacemit_ccu_data k1_ccu_rcpu_data = {
+	/* No clocks in the RCPU CCU */
+	.reset_data	= rcpu_reset_data,
+	.reset_num	= ARRAY_SIZE(rcpu_reset_data),
+};
+
+static const struct ccu_reset_data rcpu2_reset_data[] = {
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
+static struct spacemit_ccu_data k1_ccu_rcpu2_data = {
+	/* No clocks in the RCPU2 CCU */
+	.reset_data	= rcpu2_reset_data,
+	.reset_num	= ARRAY_SIZE(rcpu2_reset_data),
+};
+
+static const struct ccu_reset_data apbc2_reset_data[] = {
+	[RESET_APBC2_UART1]	= RESET_DATA(APBC2_UART1_CLK_RST, BIT(2), (0)),
+	[RESET_APBC2_SSP2]	= RESET_DATA(APBC2_SSP2_CLK_RST, BIT(2), (0)),
+	[RESET_APBC2_TWSI3]	= RESET_DATA(APBC2_TWSI3_CLK_RST, BIT(2), (0)),
+	[RESET_APBC2_RTC]	= RESET_DATA(APBC2_RTC_CLK_RST,	BIT(2), (0)),
+	[RESET_APBC2_TIMERS0]	= RESET_DATA(APBC2_TIMERS0_CLK_RST, BIT(2), (0)),
+	[RESET_APBC2_KPC]	= RESET_DATA(APBC2_KPC_CLK_RST,	BIT(2), (0)),
+	[RESET_APBC2_GPIO]	= RESET_DATA(APBC2_GPIO_CLK_RST, BIT(2), (0)),
+};
+
+static struct spacemit_ccu_data k1_ccu_apbc2_data = {
+	/* No clocks in the APBC2 CCU */
+	.reset_data	= apbc2_reset_data,
+	.reset_num	= ARRAY_SIZE(apbc2_reset_data),
+};
+
 static int spacemit_reset_update(struct reset_controller_dev *rcdev,
 				 unsigned long id, bool assert)
 {
@@ -1351,6 +1432,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
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
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
