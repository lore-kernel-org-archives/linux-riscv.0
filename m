Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27115C36004
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 19:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jan+OPJ53oTXQmY+fEwW1aKIUPD1S6XKUAUxqkMUSUA=; b=4zBG8MpoIXXf55
	r1qdUxDU+in0CZ3V7OoS/SYC8FM27m2KnJ8ECDPODDeJtMLy8EAVOecZtYs0dj614Q3ArmCbbSjWM
	08pPqInDhiUuvlrDlCo/jcdKrgLHfGB66QVzJk4PpUbQa7bvDRgw92dAPQuI/14BPF/4x1vLT7V0W
	uw3BnlvMn3xVMHNVTK9JA+AgUR9ctlOIdsw37YChpaN8TSlJX0d1AU27bsziE9R+cvot/EOJnfILt
	6n11IpT9cnxWCPDDYfcQBP/v92EVTrVgkwGD24UYbm51uok8yZlDTwzIObgJWYtU97vzbWG17dicD
	vSdpVOAVHkjwEWAG8zFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvLp8-0000000D6Pi-448z;
	Thu, 20 Mar 2025 19:45:02 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvLp7-0000000D6N7-0x0a
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 19:45:02 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-85b515e4521so38227939f.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 12:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742499900; x=1743104700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3DaRxF5HZnJi0Y3x/zgrpOyNbzKQMeKO2j9zKPPajyk=;
        b=bheZYMTrFwAH94eie1rgXbDH0aSiwMXpsjjVtFwR/p8uCG8dOazVEg1ngUHrJdA49p
         96Z2N3cvvUqgcXvQEmDhRoKpGGbhIT/wNOif1O2rrvB8d68O7t1PHZOG2QZkBWgHc1VX
         9hJQLV9fIJQ3dJ4LDydU1hkvxSsQb89/Sl8+9ouEo+GsKD0aBBidWshBQVDdBGwHwahz
         ehE7wWiekzE6dXjlLBZaXu5GPdnMHRk2XI4ijc0Xk3vZyQSOibMVEYVhBbKL8Y9AkafR
         Wb3se6+pdJyCljue41O8bDBcu4Sg1Q0g5o6HZr9rPq9WHvCNoz3ef/mCfjeN5aCG00XT
         I34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742499900; x=1743104700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DaRxF5HZnJi0Y3x/zgrpOyNbzKQMeKO2j9zKPPajyk=;
        b=HB/HB4bruxh+uzuMZo2eEu2VIBI1Tbz+8cr3VVVpl0jZ2bhGpt5di74eo2Jll+kn7+
         b4lwqHpL6DBOjO2VV13fENTlihelQB2Ph3/VrlE170YO2BaL3lLMavAG5fraceWApR4y
         WdLGwWNfKtJ1N1j9pSvOJtAfJ3HlBBGNAX3dZaASd9bkvI17FlaDvT1wfN43Om4A/QUI
         xdczHMvJNtA1nCQ2bIj32jYitfW5VB/R6WMIBNDNGv/egiFq2RZUYRSSNgRCWv0t4+Mz
         nr9aTuDqTpS1iDDGgueSYEzT7CWdgx/kCG8Is/ga4S8XbRdvvr8CjC5h2djo9WulItQ7
         9jEA==
X-Forwarded-Encrypted: i=1; AJvYcCXQoXwaDh1eQTTsgtq5M+8qL42A0+pVQiGVvCUzamZEunQ+N3p5g/esP9RN5ZBLpn4N73mDePKkGjtVow==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5KWNE8KLYYCuVn52Ml/PoYhBUoOjHv72PcvO7lSE4CFJNeJJu
	iayYGBOay5Bs+xUyNjcJ3wexNtwjASqjYsGgZdBz4G5ThoBauNlGsIPCvTmUHGc=
X-Gm-Gg: ASbGncslV4+PnVEwOkFow0J3Augd3NGs/0S+bgPAof7tTXwSLr+iOLMs/Rt0FJUpKXL
	CSGDTfj42j0irQ/GNtxKUQhgQXNHaEK923IctqdW5k/KpgbDsGb0CJuezPPBi5/gU2G5Got1qXt
	hJ6IsOrHhKER9UFEix0O7ZKkpYH3gKmWjGz22MHgLQxEUaqjHKmys6hECJgDbYComtRJx4Wdh9k
	uZwr9YzcC53GY44DUjpzLbftw4dc/pdW6ctV8VCpS6fJTsO/oyIcoqmCToszcd22niBS44d3bJc
	XZ1CqaNTeZpw3HUxE5VrJPgyP2LAWdeWBygfKeBM2ixvHEBCjFjmVzswna3lnf4yTAPe+qyzqML
	2so2iqzraddc62BlHfULL6WZk
X-Google-Smtp-Source: AGHT+IGA9qohMG1aBKCRNvNr7u/sSMNNgHqDneahpBFEo71JWgCKK2r25nkZfsUiBvWHPcMgsbHt6A==
X-Received: by 2002:a05:6602:6a96:b0:85d:a235:e90e with SMTP id ca18e2360f4ac-85e2cc5f425mr55624339f.13.1742499900016;
        Thu, 20 Mar 2025 12:45:00 -0700 (PDT)
Received: from zoltan.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85e2bd8c40fsm8341439f.32.2025.03.20.12.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 12:44:59 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] clk: spacemit: define existing syscon resets
Date: Thu, 20 Mar 2025 14:44:45 -0500
Message-ID: <20250320194449.510569-5-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320194449.510569-1-elder@riscstar.com>
References: <20250320194449.510569-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_124501_271586_CBEFA458 
X-CRM114-Status: GOOD (  10.82  )
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

Define reset controls associated with the MPMU, APBC, and APMU
SpacemiT K1 CCUs.  These already have clocks associated with them.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 132 ++++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 6d879411c6c05..be8abd27753cb 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -151,6 +151,13 @@ struct k1_ccu_data {
 	const struct ccu_reset_controller_data *rst_data;
 };
 
+#define RST_DATA(_offset, _assert_mask, _deassert_mask)	\
+	{						\
+		.offset		= (_offset),		\
+		.assert_mask	= (_assert_mask),	\
+		.deassert_mask	= (_deassert_mask),	\
+	}
+
 struct ccu_reset_controller {
 	struct regmap *regmap;
 	const struct ccu_reset_controller_data *data;
@@ -1428,6 +1435,7 @@ static struct spacemit_ccu_clk k1_ccu_apbs_clks[] = {
 
 static const struct k1_ccu_data k1_ccu_apbs_data = {
 	.clk		= k1_ccu_apbs_clks,
+	/* No resets in the APBS CCU */
 };
 
 static struct spacemit_ccu_clk k1_ccu_mpmu_clks[] = {
@@ -1467,8 +1475,18 @@ static struct spacemit_ccu_clk k1_ccu_mpmu_clks[] = {
 	{ 0,			NULL },
 };
 
+static const struct ccu_reset_data mpmu_reset_data[] = {
+	[RST_WDT]	= RST_DATA(MPMU_WDTPCR,			BIT(2), 0),
+};
+
+static const struct ccu_reset_controller_data mpmu_reset_controller_data = {
+	.count		= ARRAY_SIZE(mpmu_reset_data),
+	.data		= mpmu_reset_data,
+};
+
 static const struct k1_ccu_data k1_ccu_mpmu_data = {
 	.clk		= k1_ccu_mpmu_clks,
+	.rst_data	= &mpmu_reset_controller_data,
 };
 
 static struct spacemit_ccu_clk k1_ccu_apbc_clks[] = {
@@ -1575,8 +1593,68 @@ static struct spacemit_ccu_clk k1_ccu_apbc_clks[] = {
 	{ 0,			NULL },
 };
 
+static const struct ccu_reset_data apbc_reset_data[] = {
+	[RST_UART0]	= RST_DATA(APBC_UART1_CLK_RST,		BIT(2),	0),
+	[RST_UART2]	= RST_DATA(APBC_UART2_CLK_RST,		BIT(2), 0),
+	[RST_GPIO]	= RST_DATA(APBC_GPIO_CLK_RST,		BIT(2), 0),
+	[RST_PWM0]	= RST_DATA(APBC_PWM0_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM1]	= RST_DATA(APBC_PWM1_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM2]	= RST_DATA(APBC_PWM2_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM3]	= RST_DATA(APBC_PWM3_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM4]	= RST_DATA(APBC_PWM4_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM5]	= RST_DATA(APBC_PWM5_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM6]	= RST_DATA(APBC_PWM6_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM7]	= RST_DATA(APBC_PWM7_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM8]	= RST_DATA(APBC_PWM8_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM9]	= RST_DATA(APBC_PWM9_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM10]	= RST_DATA(APBC_PWM10_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM11]	= RST_DATA(APBC_PWM11_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM12]	= RST_DATA(APBC_PWM12_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM13]	= RST_DATA(APBC_PWM13_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM14]	= RST_DATA(APBC_PWM14_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM15]	= RST_DATA(APBC_PWM15_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM16]	= RST_DATA(APBC_PWM16_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM17]	= RST_DATA(APBC_PWM17_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM18]	= RST_DATA(APBC_PWM18_CLK_RST,		BIT(2), BIT(0)),
+	[RST_PWM19]	= RST_DATA(APBC_PWM19_CLK_RST,		BIT(2), BIT(0)),
+	[RST_SSP3]	= RST_DATA(APBC_SSP3_CLK_RST,		BIT(2), 0),
+	[RST_UART3]	= RST_DATA(APBC_UART3_CLK_RST,		BIT(2), 0),
+	[RST_RTC]	= RST_DATA(APBC_RTC_CLK_RST,		BIT(2), 0),
+	[RST_TWSI0]	= RST_DATA(APBC_TWSI0_CLK_RST,		BIT(2), 0),
+	[RST_TIMERS1]	= RST_DATA(APBC_TIMERS1_CLK_RST,	BIT(2), 0),
+	[RST_AIB]	= RST_DATA(APBC_AIB_CLK_RST,		BIT(2), 0),
+	[RST_TIMERS2]	= RST_DATA(APBC_TIMERS2_CLK_RST,	BIT(2), 0),
+	[RST_ONEWIRE]	= RST_DATA(APBC_ONEWIRE_CLK_RST,	BIT(2), 0),
+	[RST_SSPA0]	= RST_DATA(APBC_SSPA0_CLK_RST,		BIT(2), 0),
+	[RST_SSPA1]	= RST_DATA(APBC_SSPA1_CLK_RST,		BIT(2), 0),
+	[RST_DRO]	= RST_DATA(APBC_DRO_CLK_RST,		BIT(2), 0),
+	[RST_IR]	= RST_DATA(APBC_IR_CLK_RST,		BIT(2), 0),
+	[RST_TWSI1]	= RST_DATA(APBC_TWSI1_CLK_RST,		BIT(2), 0),
+	[RST_TSEN]	= RST_DATA(APBC_TSEN_CLK_RST,		BIT(2), 0),
+	[RST_TWSI2]	= RST_DATA(APBC_TWSI2_CLK_RST,		BIT(2), 0),
+	[RST_TWSI4]	= RST_DATA(APBC_TWSI4_CLK_RST,		BIT(2), 0),
+	[RST_TWSI5]	= RST_DATA(APBC_TWSI5_CLK_RST,		BIT(2), 0),
+	[RST_TWSI6]	= RST_DATA(APBC_TWSI6_CLK_RST,		BIT(2), 0),
+	[RST_TWSI7]	= RST_DATA(APBC_TWSI7_CLK_RST,		BIT(2), 0),
+	[RST_TWSI8]	= RST_DATA(APBC_TWSI8_CLK_RST,		BIT(2), 0),
+	[RST_IPC_AP2AUD] = RST_DATA(APBC_IPC_AP2AUD_CLK_RST,	BIT(2), 0),
+	[RST_UART4]	= RST_DATA(APBC_UART4_CLK_RST,		BIT(2), 0),
+	[RST_UART5]	= RST_DATA(APBC_UART5_CLK_RST,		BIT(2), 0),
+	[RST_UART6]	= RST_DATA(APBC_UART6_CLK_RST,		BIT(2), 0),
+	[RST_UART7]	= RST_DATA(APBC_UART7_CLK_RST,		BIT(2), 0),
+	[RST_UART8]	= RST_DATA(APBC_UART8_CLK_RST,		BIT(2), 0),
+	[RST_UART9]	= RST_DATA(APBC_UART9_CLK_RST,		BIT(2), 0),
+	[RST_CAN0]	= RST_DATA(APBC_CAN0_CLK_RST,		BIT(2), 0),
+};
+
+static const struct ccu_reset_controller_data apbc_reset_controller_data = {
+	.count		= ARRAY_SIZE(apbc_reset_data),
+	.data		= apbc_reset_data,
+};
+
 static const struct k1_ccu_data k1_ccu_apbc_data = {
 	.clk		= k1_ccu_apbc_clks,
+	.rst_data	= &apbc_reset_controller_data,
 };
 
 static struct spacemit_ccu_clk k1_ccu_apmu_clks[] = {
@@ -1645,8 +1723,62 @@ static struct spacemit_ccu_clk k1_ccu_apmu_clks[] = {
 	{ 0,			NULL },
 };
 
+static const struct ccu_reset_data apmu_reset_data[] = {
+	[RST_CCIC_4X]	= RST_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(1)),
+	[RST_CCIC1_PHY] = RST_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(2)),
+	[RST_SDH_AXI]	= RST_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(0)),
+	[RST_SDH0]	= RST_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(1)),
+	[RST_SDH1]	= RST_DATA(APMU_SDH1_CLK_RES_CTRL,	0, BIT(1)),
+	[RST_SDH2]	= RST_DATA(APMU_SDH2_CLK_RES_CTRL,	0, BIT(1)),
+	[RST_USBP1_AXI] = RST_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(4)),
+	[RST_USB_AXI]	= RST_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(0)),
+	[RST_USB3_0]	= RST_DATA(APMU_USB_CLK_RES_CTRL,	0,
+				      BIT(9)|BIT(10)|BIT(11)),
+	[RST_QSPI]	= RST_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(1)),
+	[RST_QSPI_BUS] = RST_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(0)),
+	[RST_DMA]	= RST_DATA(APMU_DMA_CLK_RES_CTRL,	0, BIT(0)),
+	[RST_AES]	= RST_DATA(APMU_AES_CLK_RES_CTRL,	0, BIT(4)),
+	[RST_VPU]	= RST_DATA(APMU_VPU_CLK_RES_CTRL,	0, BIT(0)),
+	[RST_GPU]	= RST_DATA(APMU_GPU_CLK_RES_CTRL,	0, BIT(1)),
+	[RST_EMMC]	= RST_DATA(APMU_PMUA_EM_CLK_RES_CTRL,	0, BIT(1)),
+	[RST_EMMC_X]	= RST_DATA(APMU_PMUA_EM_CLK_RES_CTRL,	0, BIT(0)),
+	[RST_AUDIO]	= RST_DATA(APMU_AUDIO_CLK_RES_CTRL,	0,
+				   BIT(0) | BIT(2) | BIT(3)),
+	[RST_HDMI]	= RST_DATA(APMU_HDMI_CLK_RES_CTRL,	0, BIT(9)),
+	[RST_PCIE0]	= RST_DATA(APMU_PCIE_CLK_RES_CTRL_0,	BIT(8),
+				   BIT(3) | BIT(4) | BIT(5)),
+	[RST_PCIE1]	= RST_DATA(APMU_PCIE_CLK_RES_CTRL_1,	BIT(8),
+				   BIT(3) | BIT(4) | BIT(5)),
+	[RST_PCIE2]	= RST_DATA(APMU_PCIE_CLK_RES_CTRL_2,	BIT(8),
+				   BIT(3) | BIT(4) | BIT(5)),
+	[RST_EMAC0]	= RST_DATA(APMU_EMAC0_CLK_RES_CTRL,	0, BIT(1)),
+	[RST_EMAC1]	= RST_DATA(APMU_EMAC1_CLK_RES_CTRL,	0, BIT(1)),
+	[RST_JPG]	= RST_DATA(APMU_JPG_CLK_RES_CTRL,	0, BIT(0)),
+	[RST_CCIC2PHY]	= RST_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL,	0, BIT(2)),
+	[RST_CCIC3PHY]	= RST_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL,	0, BIT(29)),
+	[RST_CSI]	= RST_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL,	0, BIT(1)),
+	[RST_ISP]	= RST_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(0)),
+	[RST_ISP_CPP]	= RST_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(27)),
+	[RST_ISP_BUS]	= RST_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(3)),
+	[RST_ISP_CI]	= RST_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(16)),
+	[RST_DPU_MCLK]	= RST_DATA(APMU_LCD_CLK_RES_CTRL2,	0, BIT(9)),
+	[RST_DPU_ESC]	= RST_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(3)),
+	[RST_DPU_HCLK]	= RST_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(4)),
+	[RST_DPU_SPIBUS] = RST_DATA(APMU_LCD_SPI_CLK_RES_CTRL,	0, BIT(4)),
+	[RST_DPU_SPI_HBUS] = RST_DATA(APMU_LCD_SPI_CLK_RES_CTRL, 0, BIT(2)),
+	[RST_V2D]	= RST_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(27)),
+	[RST_MIPI]	= RST_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(15)),
+	[RST_MC]	= RST_DATA(APMU_PMUA_MC_CTRL,		0, BIT(0)),
+};
+
+static const struct ccu_reset_controller_data apmu_reset_controller_data = {
+	.count		= ARRAY_SIZE(apmu_reset_data),
+	.data		= apmu_reset_data,
+};
+
 static const struct k1_ccu_data k1_ccu_apmu_data = {
 	.clk		= k1_ccu_apmu_clks,
+	.rst_data	= &apmu_reset_controller_data,
 };
 
 static struct ccu_reset_controller *
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
