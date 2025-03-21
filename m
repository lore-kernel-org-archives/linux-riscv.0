Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCEBC3600A
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 15:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=71DYmdEfTA5ru6tm3HtOgiOAqHFWH86QDblCLsbniGo=; b=o3KUqnK6Uhk2Nl
	gnw2WGomiMzFoHPpsOQ2yXXaqrox3tJkeIRpewejzpVx6rNKaTKy+C928HmmpUnP+bXPP72Z86AIn
	GF89Qf3NjI/pVRawZj+xB4/eNe+PL+rGP0yTY91sbxuceQSQ2wLZvHyZ6HZH1dFUT3VZJQO3YHIM+
	G7x4DG2TbP9cnGt2SSWiYjbyl11s2q8rnPhiZS4F+IEJYeq6HoQOT4YMcW1Esd8PBElTnF8ssPn3X
	aHQ+B9Gd4noL9UPCWgOqzAv4Bdsxnuv79Kw9USUrd/AjfBfIoZgqBfwhkvsXRb856zX5c4oySDCYp
	ywJ1Fl70QFdSKUCjFnOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tveA7-0000000FHdK-3xJf;
	Fri, 21 Mar 2025 15:19:55 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tve8x-0000000FHNY-3vc6
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 15:18:45 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-85e15dc8035so46426139f.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Mar 2025 08:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742570323; x=1743175123; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOH9+f67UaOTwwttF6Hojln5eRz8NpWPkTKFPaDKYGI=;
        b=qhyH21b/TZcrTgfbJ3CDitKaZWNYq8p+wxs1yzDRE4wvsDeBx6m4PXXmVOtrKA6tzf
         MscFGTYX6W22DbI6Cui+hahlnBxXxscg7fv9IgAsjgZ8/auA9BFXKpfz6KerOVa075ZX
         LJcC35JJT0UK5M8pOgz4ufMlBBwmfzU43l+qJrBVG5lC151AmIfHe/Cud2QPcQn4vg38
         qvX3mC3W6eBlJTfAp76c4+gZQlz8WUxg/gwhl5v9zY4qUEjX7X6r9hoPgz7pGuS9ka8r
         0ETxHdG88pcxCbpopuITD25aaGMkL2VxGFltG3qo6OozrFIqLLr8ad2rowWDtpqO3B5m
         JDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742570323; x=1743175123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SOH9+f67UaOTwwttF6Hojln5eRz8NpWPkTKFPaDKYGI=;
        b=VdBuLzO4i3ioMpRYcaPJRFVXl+Ku+81nBeEzIGjcGITjlEZeDg25Jhok2yj3RGsThD
         wnJuhEmVHtypyrHCA1K8VID3JyYFBdK+Ob6MxnBZuT/YUhM40IxAj0vS3TtFrn8s9tFG
         c78xDuqHfCTmUweLpqmXUCu98WYbB7s0vK5addaJqeJKkgL4DyLMxqRmcUXAoOWanvk8
         KK4x6XgwJI+Oquj1jZCAPvGWZz13k8ps/3Zgwk5oDW6TOyxZEbvdU5y168otGZW9eRN+
         MthOFVBVLYzGqpGqXzAej2jgb+O6IpCrI6P/74M26scC2b+8vMrCifIneFYNoEp/Is8V
         /FeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhpB6r9Be+qC2BOV64NjZX5lwi7Mv5nMaeX0E1/myt6rIn+B2v5Zmc94qq0g5Td7EtRcB54CfbIn397A==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq56yFIcziaz8pzUBwksoz2Ni3MhxL/we7JgHwKot/UsPtJak8
	IOSmEGwRFD3iEFs6O8/6mLNrjFI6xDFTpgPSLQyqAoFFAVzqYz5+18p4LE1dvMk=
X-Gm-Gg: ASbGncs5hhH05W5A1YQUIzTNngUrE3LaAzx7nDDJ2n15QUGwREF6nN2cS9Ab8KpD39+
	TAIuDNet7BaKoaYYllKV5UiJbai+XdfIzNdh4UwO7ZjvB4+Fhi1UWj4PdGTpPVWQLg0mxb/8j/8
	BBcpPU1Wi9lgow1X2It+HUJ1EzpTDls0KAeYiQ7md0vJFuxW0nRJRrcEy3qFS4TrSs7nYL2ZYkV
	SvbSq+OYOKGJJxapxNbGuwPmnKuXLp2yD0MtoTE+B57FiljSKtqB0mtKdmmMiq+/Nr/GWOQgCuF
	0jyGRZP9joQ6hidLcIPHdTM9N4mdPejvTX+2FWfhLdyvnvOPJuB6TPJxNiUbuykto+tbbyewWBW
	HKfaXOH1RjTbd1Oq2alopwQ+8
X-Google-Smtp-Source: AGHT+IF/Hdzj6qersLRDCR3zz5/D7xP2GuJej/d+Z4QpdhOjbhKoRLFIjr/QXQ/fsdYRqhMLr9/wFw==
X-Received: by 2002:a05:6602:4c05:b0:85d:a69f:371d with SMTP id ca18e2360f4ac-85e2ca55b1dmr441679539f.4.1742570322839;
        Fri, 21 Mar 2025 08:18:42 -0700 (PDT)
Received: from zoltan.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2cbdd0a21sm475553173.41.2025.03.21.08.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:18:42 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dlan@gentoo.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heylenay@4d2.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 6/7] clk: spacemit: define new syscons with only resets
Date: Fri, 21 Mar 2025 10:18:29 -0500
Message-ID: <20250321151831.623575-7-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321151831.623575-1-elder@riscstar.com>
References: <20250321151831.623575-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_081843_968297_D8FEB6D4 
X-CRM114-Status: GOOD (  10.44  )
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
 drivers/clk/spacemit/ccu-k1.c | 106 ++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 17e321c25959a..bf5a3e2048619 100644
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
@@ -1781,6 +1812,69 @@ static const struct k1_ccu_data k1_ccu_apmu_data = {
 	.rst_data	= &apmu_reset_controller_data,
 };
 
+static const struct ccu_reset_data rcpu_reset_data[] = {
+	[RST_RCPU_SSP0]		= RST_DATA(RCPU_SSP0_CLK_RST,	0, BIT(0)),
+	[RST_RCPU_I2C0]		= RST_DATA(RCPU_I2C0_CLK_RST,	0, BIT(0)),
+	[RST_RCPU_UART1]	= RST_DATA(RCPU_UART1_CLK_RST,	0, BIT(0)),
+	[RST_RCPU_IR]		= RST_DATA(RCPU_CAN_CLK_RST,	0, BIT(0)),
+	[RST_RCPU_CAN]		= RST_DATA(RCPU_IR_CLK_RST,	0, BIT(0)),
+	[RST_RCPU_UART0]	= RST_DATA(RCPU_UART0_CLK_RST,	0, BIT(0)),
+	[RST_RCPU_HDMI_AUDIO]	= RST_DATA(AUDIO_HDMI_CLK_CTRL,	0, BIT(0)),
+};
+
+static const struct ccu_reset_controller_data rcpu_reset_controller_data = {
+	.count		= ARRAY_SIZE(rcpu_reset_data),
+	.data		= rcpu_reset_data,
+};
+
+static struct k1_ccu_data k1_ccu_rcpu_data = {
+	/* No clocks in the RCPU CCU */
+	.rst_data	= &rcpu_reset_controller_data,
+};
+
+static const struct ccu_reset_data rcpu2_reset_data[] = {
+	[RST_RCPU2_PWM0]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
+	[RST_RCPU2_PWM1]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
+	[RST_RCPU2_PWM2]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
+	[RST_RCPU2_PWM3]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
+	[RST_RCPU2_PWM4]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
+	[RST_RCPU2_PWM5]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
+	[RST_RCPU2_PWM6]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
+	[RST_RCPU2_PWM7]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
+	[RST_RCPU2_PWM8]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
+	[RST_RCPU2_PWM9]	= RST_DATA(RCPU2_PWM9_CLK_RST,	BIT(2), BIT(0)),
+};
+
+static const struct ccu_reset_controller_data rcpu2_reset_controller_data = {
+	.count		= ARRAY_SIZE(rcpu2_reset_data),
+	.data		= rcpu2_reset_data,
+};
+
+static struct k1_ccu_data k1_ccu_rcpu2_data = {
+	/* No clocks in the RCPU2 CCU */
+	.rst_data	= &rcpu2_reset_controller_data,
+};
+
+static const struct ccu_reset_data apbc2_reset_data[] = {
+	[RST_APBC2_UART1]	= RST_DATA(APBC2_UART1_CLK_RST,	BIT(2), (0)),
+	[RST_APBC2_SSP2]	= RST_DATA(APBC2_SSP2_CLK_RST,	BIT(2), (0)),
+	[RST_APBC2_TWSI3]	= RST_DATA(APBC2_TWSI3_CLK_RST,	BIT(2), (0)),
+	[RST_APBC2_RTC]		= RST_DATA(APBC2_RTC_CLK_RST,	BIT(2), (0)),
+	[RST_APBC2_TIMERS0]	= RST_DATA(APBC2_TIMERS0_CLK_RST, BIT(2), (0)),
+	[RST_APBC2_KPC]		= RST_DATA(APBC2_KPC_CLK_RST,	BIT(2), (0)),
+	[RST_APBC2_GPIO]	= RST_DATA(APBC2_GPIO_CLK_RST,	BIT(2), (0)),
+};
+
+static const struct ccu_reset_controller_data apbc2_reset_controller_data = {
+	.count		= ARRAY_SIZE(apbc2_reset_data),
+	.data		= apbc2_reset_data,
+};
+
+static struct k1_ccu_data k1_ccu_apbc2_data = {
+	/* No clocks in the RCPU2 CCU */
+	.rst_data	= &apbc2_reset_controller_data,
+};
+
 static struct ccu_reset_controller *
 rcdev_to_controller(struct reset_controller_dev *rcdev)
 {
@@ -1959,6 +2053,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
