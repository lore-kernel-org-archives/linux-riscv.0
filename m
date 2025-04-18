Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D496C369D3
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 14:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mc7bUy6oXcrHcYfzgtM9FNbI7LNCdRY+mC2AwcVSTBo=; b=uJQSU5U97Qj/sD
	bXo9J5I/9EqMPdZN4o/0SbpdpDIlXbXkfdEEY70Ka1+s/bwqxMRgnjXMG81YjVfyiq0LoK3t8bFh+
	BQMy7a28QVLGJeVwGBFbYR3XqUvajYVV08Yozj1korUEqBglT7P+y4QNovgr6u8JIm0e28zh61vQX
	/zP5KMq/g7SXtvo0A8TyTlkl6HJIjMp3iov83smMNfADEQw7pVwKARz67wAtXxLIbA3eMxZmL3org
	IqBqh6a+X6d84gMCnK6u0Wn3fYepyjMYW1RBZZYv0vYMAltXxigcKRjYSFVXFdT4dn1hDG+XCiB0o
	/qasfONJqwWvnnEVQD/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5n8G-0000000GX2g-1KVZ;
	Fri, 18 Apr 2025 14:55:56 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5n6d-0000000GWRk-1GgU
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 14:54:16 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4775ce8a4b0so31594711cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 18 Apr 2025 07:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744988054; x=1745592854; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkMtzn7N02RmrS0PJQFbrGZioeU0O7QBuxxi4LcB8Zs=;
        b=pPntKyQwKxNHISz/013DnJMmXYg2Vn8uaR3Pl7sfd+mW5Ih7ZVIT1/zkM5f360ilRk
         NIUqUPY2RX7P9DPJOjdrmDgIDBgj0uYeIIb7GT3+qFwHPesWsr8zdpRVfb5u1OfMAtWb
         K01SZTVK1P4mzqrJvKwyLowN1vn5cEk5MlIAQybWjn1tjcVMBdj/rqZeQ58NLyKXNCox
         5P+cPEs71RyLIHlZun14oqDB2dXyq9Gp1mkTR2HY40lzJr5hzhhfalwvEUqWe1Bkgoxa
         ++oAhz4UQI8IrVTgUjUO+iDG1sOBaufEW1LYkdbJ4tk/YC4h5FvcGMwhka6JHSTpuPxp
         RqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744988054; x=1745592854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XkMtzn7N02RmrS0PJQFbrGZioeU0O7QBuxxi4LcB8Zs=;
        b=m53aC0L0IfAtOhHDWKl+z5QzT9e4hZ0dnnzXbsGGvn6vsJGY1DYVMwAT5SaO0rtB0v
         QPeOMrilDdsUP/8DRoz6+L1xWe4JnwiRkLQqFRpDbRftnDcCZknLimXSm23JCsQoQeDE
         PH5jmg+ZLuveuRzZZvoLQZ6Yt5/mbqBxom5uLlECU0KJNWD/H0CfaZzzUoI0wtpT7nxI
         5nfqIwrBRjQmCF1D/JQ/hUMihWLt6mm4soezHaPtq5r3OxTadIzwgmnnLjmyHesh4K7T
         QOJTjZVNH/XPy0eXmAIgtlcqLni1Z3goean4MuDzmUnZ+sSe3eROWCJ9t/DaXA0Rb2Do
         83xg==
X-Forwarded-Encrypted: i=1; AJvYcCXyk2xLMlqmyUiDcnXxrIIzWb4HlG1bDBx3y++auomU8dIxKX0aWYpwIJGxFeTJwMg2WJzTNOtt5B1+vA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx5lajoibBBvjWIopkp8tY1AQvImrWzdGxIQwl10QgCAKL5ly0
	y9uKgHlH91V2ZVjfe47RgZ8aQ4jiPbxJpyvIj7Gv8lutAAM08XXD6/jUXQ5IOKU=
X-Gm-Gg: ASbGncthneqq9wkVcfZ1ZTcvYMTEyJDhy5CO13ktQ3SVRFNZnIzagy+Z1i9M5UZbZXs
	n8CdHi2Ie1CIojJbACYClANbDXTjMeU4MK7NqpxSHcMEOY7OkN068XGbdEP4TPypdWVRK5s4i4w
	Yxap+MFfTkt/YQp/iFAxi4lt0dzZywiq/9YPcjh0TVteYoq4D59TgyOBuIV1a9EIyhMGhOWmYNa
	LNHCKLSsSe3xQe5BwGSlUIRQYZZRSSoxPsz6bKCSpakcShgaUw6TMdiOZstFUEBLi6/dTkfvJh0
	CMERWQRZSw7YNo+RQTxtgtB9jABYuMV+dsBYK1UoX1bSCP/Oq5uS6Zz9ldIkoixjLOa1jKEzXhN
	iB3LChKxQ19XH3Q==
X-Google-Smtp-Source: AGHT+IExljy5N60XbU6MXOLtCevb/N4vBZAyZbbO0mx88RZ5LF09j7uagInSYJoa9ykOQI9BYFdHuw==
X-Received: by 2002:ac8:7d0d:0:b0:476:7199:4da1 with SMTP id d75a77b69052e-47aec4c378cmr46007231cf.46.1744988054558;
        Fri, 18 Apr 2025 07:54:14 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c16ddesm11329201cf.3.2025.04.18.07.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:54:14 -0700 (PDT)
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
Subject: [PATCH v5 6/7] clk: spacemit: define new syscons with only resets
Date: Fri, 18 Apr 2025 09:53:58 -0500
Message-ID: <20250418145401.2603648-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250418145401.2603648-1-elder@riscstar.com>
References: <20250418145401.2603648-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_075415_344852_4CB7D4DF 
X-CRM114-Status: GOOD (  11.18  )
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
index dfc8aa60d4345..c2f057aecb705 100644
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
+static const struct spacemit_ccu_data k1_ccu_rcpu_data = {
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
+static const struct spacemit_ccu_data k1_ccu_rcpu2_data = {
+	/* No clocks in the RCPU2 CCU */
+	.reset_data	= rcpu2_reset_data,
+	.reset_num	= ARRAY_SIZE(rcpu2_reset_data),
+};
+
+static const struct ccu_reset_data apbc2_reset_data[] = {
+	[RESET_APBC2_UART1]	= RESET_DATA(APBC2_UART1_CLK_RST, BIT(2), 0),
+	[RESET_APBC2_SSP2]	= RESET_DATA(APBC2_SSP2_CLK_RST, BIT(2), 0),
+	[RESET_APBC2_TWSI3]	= RESET_DATA(APBC2_TWSI3_CLK_RST, BIT(2), 0),
+	[RESET_APBC2_RTC]	= RESET_DATA(APBC2_RTC_CLK_RST,	BIT(2), 0),
+	[RESET_APBC2_TIMERS0]	= RESET_DATA(APBC2_TIMERS0_CLK_RST, BIT(2), 0),
+	[RESET_APBC2_KPC]	= RESET_DATA(APBC2_KPC_CLK_RST,	BIT(2), 0),
+	[RESET_APBC2_GPIO]	= RESET_DATA(APBC2_GPIO_CLK_RST, BIT(2), 0),
+};
+
+static const struct spacemit_ccu_data k1_ccu_apbc2_data = {
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
