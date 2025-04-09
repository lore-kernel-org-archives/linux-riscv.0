Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18019C36002
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 21:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vXLU2bxScljWaudEXaHJoSLfHZotsCtAUUisUe1PKpM=; b=2+b8MaDxeRNu2h
	4AsNI/BB8OQmIIu9jhK+iU3UJhASmFz1huBjb2z6LGy3b08vnei5ry7QGRyDRAowPal6/rWIhO3Lh
	mNhyd3OfSuuXemQo1srPpQxKZk/BJK/ZUtDM5cT9lNUMh8Jg/wGgHhodNJ67x1AByKdM1AZiBec/O
	X8tG3pnC7R1aoi3OGu+Hb0L+L3a+/OL0LdNv5MwwRqKzFSx6qX8EzscBDivltoc0KrQkQsWwnSF2c
	4BzbqP1WQNt51ho0ik3uGIkkmWkkCGE807pxRYRsEnt1v00zzUKBQg8LFWqYUkRQtvbM1WDTfNTBU
	mgiDI3jh/XbrIZjSgA9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2dNY-00000008drY-1Pq4;
	Wed, 09 Apr 2025 21:54:40 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cnx-00000008Ycu-4BxZ
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 21:17:55 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-85b40a5120eso6016539f.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 14:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744233473; x=1744838273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfE4mi5+bRUs0mrTReAl+0YmCoZERibd/nax2bqxg4E=;
        b=EioA3oBiYIyWUOL9kGNungEyxy0NAXsPT1/vGL0RnH/zOJwa4IHTn3rHTTmiD8AW/y
         uNvI0nrivgs/nbL1EvUMVbxno+S9JQ4Bli++FzZAUr1lsJd1IwrTr21bIJzHY4FwchUg
         PhDZppTev4XTol8y8nH/hYMZHy9nnKA+FnQWbnxbyPzSLFjg40G3cxTQjyXpJrjwbA/8
         CJp/ekywq1p9XY2/o6Swk54e3k42rOOAbs2PawJSO8mnnmPyPqM7iJozEDnUVKvyxSjL
         ml4GHFDAyWodjBndI3glwr1CW6XCQ50KegLLmB0y/FHlXLFmhZyZboBlMIvMTz+hHaVx
         NR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744233473; x=1744838273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfE4mi5+bRUs0mrTReAl+0YmCoZERibd/nax2bqxg4E=;
        b=BFJSCDY5xW8B2SLmbAs5PtOhcszl9RcfwgLNKEeJo89G05XdqpAVZySRsxEf+eXbz+
         oFs37wrx3RExDbokLD24zgfZ99kdLkc4QlIiFpWbiMn5DQ5LsZ1PJpjVPFQCwupiIydn
         lXNLeXl+mmf0E/w7mXLC4A/HE009Tcz5twY+TcTx0y3AFGwiX7E+tbA89dDXOWySKSg2
         V2EP/6LzkkWG6SRecKMIUWxZNjjWRyB/WerD2LC4H13diY6EvGhUjLTSFgZjbGH38H/p
         gIttkifhEYOdt4ErfmfjG7BHLi8306XZroSEfo++/OU1z3KQ7OOzNBz+VagukgGabSLM
         wmFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYKIyA78nDMJiaTOiffp3Y4Hjn4Ai+3TyfZ5Dk6I7F1Vkh3s3HDLKstKZhPakKVGP6EzVk2gJvhhJQcw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzROJpJibFwliFTPp8AJUokYATPra5m4l7g+ymVY4fSFVzbLTOl
	FANm5dD+0GPz73uIQjmhU3SFzqKDJQxlpbgYWRxQQsmp9Mfop0NSx+9pDitqqj0=
X-Gm-Gg: ASbGnct26HYRiP7TsjU60FEWwz5nUxsx36DOaP+zpWlHbJzUKIiLpimxhvqd323nu0J
	Oqq1TsF882dwekQnaUgrJyjzz0T0/bWybQo5edfodw72DBvrtVgia1M1nDX2fcPn2UBJVNAMbQU
	UuNtSZnysjw2GJEoex5BSjf770E4HJ8RI6F56+VTJVSocTHhB4bOm/BxmGaq01sK0r31asCPEXI
	O5QTI+GtLujd6HiSzE6tt8KCYFnhZOeNqxtlCgNBiJJPW9lPv5u9Ty1jns5pHI7IoXHUNHJEfsa
	HiDiytpvcKrht0RT0E/wCZrBCLXbItoi/0lS8w5VMq7knuZ55L7lfEU7aTJcPzYFBB/iZpZSI/A
	AI9gg0gxxx1sp+w==
X-Google-Smtp-Source: AGHT+IGepTLDmm9Rfr0ee7fqbtpW9YuD3P3suUA/S/vIPpQUicibU6m7hkQiWRlxFLi/scRRsus8qw==
X-Received: by 2002:a05:6e02:3e8e:b0:3d5:e002:b8ac with SMTP id e9e14a558f8ab-3d7e46f931bmr5992695ab.9.1744233473418;
        Wed, 09 Apr 2025 14:17:53 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf8e91sm420735173.6.2025.04.09.14.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 14:17:52 -0700 (PDT)
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
Subject: [PATCH v3 6/7] clk: spacemit: define new syscons with only resets
Date: Wed,  9 Apr 2025 16:17:39 -0500
Message-ID: <20250409211741.1171584-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409211741.1171584-1-elder@riscstar.com>
References: <20250409211741.1171584-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_141754_036409_C5C57E23 
X-CRM114-Status: GOOD (  11.70  )
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
 drivers/clk/spacemit/ccu-k1.c | 94 +++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 201ffefa5fa9f..3c1ce9ec42908 100644
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
 struct ccu_reset_data {
 	u32 offset;
 	u32 assert_mask;
@@ -1335,6 +1366,57 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
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
@@ -1509,6 +1591,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
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
