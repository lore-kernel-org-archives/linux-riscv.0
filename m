Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA077C28B20
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 21:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cbI+IhxYX8gy+B9tgPHWEqIRLALWnNhwYZlMFfGThQI=; b=UXAbCJuAjt4tFn
	FF+q2+DOQOS6aHmp/fjdrGauI0vptpC0napoXrhFRdkRyPBC+54jppSPbcZJzDSBEAx7T6cUNRM1w
	63NmG6ahZzZvpxzjiTfJ1qc2tcMsK7EdO+r3ZEh08PE1dxFUQ+vwEBwfPcoBQTn22YWghbe93aYzA
	cNN5tGolPT/JKdB5YK6Vk1VTBb0vPUnDINmTrBKH4i1M3BVAX5yemfH8daFaTwtJBDkuTlMSo/dg7
	Au3/kqcwsNAcdo6GLQgNSrbsHDpJxNfvIZJk+C+iGES8XXVMEGYgWmlsgtav6eRN4dQA4csqUz+dI
	TMsorrnvrAuVdNRcjtaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyGqo-0000000EJ8j-0RBL;
	Fri, 28 Mar 2025 21:02:50 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyGql-0000000EJ6k-0vPK
	for linux-riscv@lists.infradead.org;
	Fri, 28 Mar 2025 21:02:48 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3ce87d31480so13571315ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 28 Mar 2025 14:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743195766; x=1743800566; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKcJi20RveZcqY3Kh6Lr5ErkuA50pYogrDTUhueBa/I=;
        b=T+WBecAMG1IIXd73u5d/ds03uxNG7rsFlO6rQTEtIvz6AvMHVz0yn0B/3fD5lEj4g3
         bkuDpR0tnoX464TQm/0UhEwzC6+C2I7uKLfjnd2xtwSxFDHfxJPrPgKTWA1oTyw/G6UG
         qmKIkj46lRVXJy/dKNUo0pySyhG0KJrajyZYbR6vd4nXpa3XLdW+KbmFuGrXREeXv3mh
         NvcxQVBNeiFnuZZymSP+FbgoqUS0XVNHQWdc1pM917lthe+Oqbi3mL7u58wrRPEvvkSV
         n2iSFVtbhTjBv69mHQlrSox9pEzSNEZMFsxYGuf292b7s8eSGBOIC4vHwzA4Xbbbt2LW
         udKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743195766; x=1743800566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eKcJi20RveZcqY3Kh6Lr5ErkuA50pYogrDTUhueBa/I=;
        b=ECFQm+ExKPBMkf3C9BvRoPUgw8CSAtT8gLI7C+5lnNr+j7NsCeQFbD6gI+ySYKLICw
         A+Tb4wvoGvCHTcgaAWRd4glVvjVj8j6DzSBDA4vEqXxrNs3gxsrLCDAqEz4kFHXdd0UO
         aC/q5BLKE8Ac45EokplZzIagNHShxl2U7z4DzHseV9WOs3A1PVnOfrVxO3TigYGz+453
         bZ+MWActBUnuXgAAVBJSYBOIY8h5292UX1uX851aUnVuIaY4OfGfuD2JRgLm+oGN9Skh
         4PNRqE8HsedOjavEDiea6DVfzCr0RFcyinaewSUwqk07wbWm4yCeDeRqHlryfy3nKB+O
         33Zg==
X-Forwarded-Encrypted: i=1; AJvYcCVHcIimw9ZiQt0SJ8bRiFvSI3BXesm67gKCOB2gQoEMA25luhKiw2fMIb7n4nDu3T7c4NYauvCVdYVWFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRq7ySiXeVyAt5Or/O7aDSgRwU9SRCNGqPJBmYCRvFpIlciZ9K
	GKX//VQwR173UwX8POaAyCidahLDC9XQ2yf8/yKgTlB+MheWywEqNy7+IaGuz8I=
X-Gm-Gg: ASbGncvlx9k09WUg7xFc5bzHJSdl9hwoI3cQWXCBmeQS11FNP857VwOSNn6ah8IlBSg
	JgnSVLxAMCu3OfgPNIpBWW+93b4lNzI2Rwocs5vUE3O2wByyIUS6R/EI+oZqdwynAUTSiXTDuLl
	E2PQfllbR7VkRm4OxniNyZ0JbO+BneGz2obcpzB93g9LdVxvtKYpPz62wiXUeLK45NL5EbQ8fKs
	GahcKmxNUlYKrNOxvZCVJQJOgcc6ZHOhDnzk5fiNj9fnumm2U9IhMUsy8Ut7yagCcIzguDKPkzO
	/7eoBforFZWCQ14MsA7NasQNi/+LorPxTvIdYPgNW/y1xAaA0dXMSKCxFGfF+NfZCKpHiLDCQCe
	VKL0L3jBJhUNFGVFcjQ==
X-Google-Smtp-Source: AGHT+IG/x8CaSThai0eN9WMQXnI7Dn45SQl59K26R/GIHq+6R5kvoqka5yknMLoNMvorh3QxtBN6Vg==
X-Received: by 2002:a05:6e02:1d13:b0:3d3:dfc2:912c with SMTP id e9e14a558f8ab-3d5e09da039mr7944305ab.17.1743195766037;
        Fri, 28 Mar 2025 14:02:46 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d5d5a74286sm6769405ab.39.2025.03.28.14.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 14:02:45 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dlan@gentoo.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
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
Subject: [PATCH v2 6/7] clk: spacemit: define new syscons with only resets
Date: Fri, 28 Mar 2025 16:02:31 -0500
Message-ID: <20250328210233.1077035-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328210233.1077035-1-elder@riscstar.com>
References: <20250328210233.1077035-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_140247_270626_61C88CE9 
X-CRM114-Status: GOOD (  11.80  )
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
v2: - Symbols are named RESET* and reset* rather than RST* and rst*

 drivers/clk/spacemit/ccu-k1.c | 106 ++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 6885fea81f6f3..c7c9580eab90b 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -130,6 +130,37 @@
 #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
 #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
 
+/* RCPU register offsets */
+#define RCPU_SSP0_CLK_RST		0x0028
+#define RCPU_I2C0_CLK_RST		0x0030
+#define RCPU_UART1_CLK_RST		0x003c
+#define RCPU_CAN_CLK_RST		0x0048
+#define RCPU_IR_CLK_RST			0x004c
+#define RCPU_UART0_CLK_RST		0x00d8
+/* XXX Next one is part of the AUD_AUDCLOCK region @ 0xc0882000 */
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
 struct spacemit_ccu_clk {
 	int id;
 	struct clk_hw *hw;
@@ -1781,6 +1812,69 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
 	.reset_data	= &apmu_reset_controller_data,
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
+static const struct ccu_reset_controller_data rcpu_reset_controller_data = {
+	.count		= ARRAY_SIZE(rcpu_reset_data),
+	.data		= rcpu_reset_data,
+};
+
+static struct spacemit_ccu_data k1_ccu_rcpu_data = {
+	/* No clocks in the RCPU CCU */
+	.reset_data	= &rcpu_reset_controller_data,
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
+static const struct ccu_reset_controller_data rcpu2_reset_controller_data = {
+	.count		= ARRAY_SIZE(rcpu2_reset_data),
+	.data		= rcpu2_reset_data,
+};
+
+static struct spacemit_ccu_data k1_ccu_rcpu2_data = {
+	/* No clocks in the RCPU2 CCU */
+	.reset_data	= &rcpu2_reset_controller_data,
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
+static const struct ccu_reset_controller_data apbc2_reset_controller_data = {
+	.count		= ARRAY_SIZE(apbc2_reset_data),
+	.data		= apbc2_reset_data,
+};
+
+static struct spacemit_ccu_data k1_ccu_apbc2_data = {
+	/* No clocks in the APBC2 CCU */
+	.reset_data	= &apbc2_reset_controller_data,
+};
+
 static int spacemit_reset_update(struct reset_controller_dev *rcdev,
 				 unsigned long id, bool assert)
 {
@@ -1948,6 +2042,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
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
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_k1_ccu_match);
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
