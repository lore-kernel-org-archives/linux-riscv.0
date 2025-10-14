Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BE0CCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 13:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uFukQeQ73fC/6AVXAzc12Zv1Ad5xw9yHVMXetmqb1Kk=; b=l8nJ9Cd9blUYf9
	iXhPZeUyZ3RSQ2rPw9YHjm4OA90FIc5UvtbK6BUlNFrCycrMk0PbjALzWTG0tuJWyw0+/oRgIO7kj
	kbT1ykq+VyvUSsNfycj80mK/rashvKt8pK0RpFQudyMfIC7J5kboTYjci7Z92yUGYzHB+aIFzMMQZ
	dxC0mM/CSirEFWHvlDMIfbB2LXXSS3C45M9DKvviHmKdEcmxezOAJ/l6OQIeXzZftNQRe0NrzavLY
	IiMzTClv1cWWnIz26YkymDxOdkDpiGyyKHs50XDU6GZnH84MX6W3ZhHiK3BGI0+i045Ch2fkXyeOE
	tjNII7W97GwBC3oO9HQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8epE-0000000GQYQ-0r4D;
	Tue, 14 Oct 2025 13:12:24 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8epC-0000000GQWX-0q7d
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 13:12:23 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A0D2E25920;
	Tue, 14 Oct 2025 15:12:20 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vf-9nPX07fYb; Tue, 14 Oct 2025 15:12:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1760447539; bh=wMfyu2mJ32RXn85J3zGKswXTVynVcyfYpa47hNhoBNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Bc2tYWakSk29UFt7ODRBhso2GMM7a/0IQuQNBsi61qHVMLL57Nwa5IWPiXcpqo/bA
	 dp/VCMIK2V7QlQnyF9xuDZD/Ysj7PdRDCbCkFSwhWdqwnTGDrUO5KSHKAD+BGBEM2O
	 zb4xT58P2siPL2TO27cNU4abGj5dKudnSDdQT0q0LxkIVYh/BNpUtRAG5xanDxnuYf
	 5gbb9UpKU0BomA3oNDf4/GmfePXL0yM0TWM+BVJwoii2qO+jOnqpsl/+7CtMg0Ecja
	 MsaKRY2cg3NiaVz6DYdivhZuMrBbWTfUv5vFcHerV0ruxejj2ZJFmwLcY8rZT10D4y
	 oqTmzhgsB2UbA==
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v3 4/5] reset: th1520: Support reset controllers in more subsystems
Date: Tue, 14 Oct 2025 13:10:31 +0000
Message-ID: <20251014131032.49616-5-ziyao@disroot.org>
In-Reply-To: <20251014131032.49616-1-ziyao@disroot.org>
References: <20251014131032.49616-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_061222_524035_AB9146C9 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Introduce reset controllers for AP, MISC, VI, VP and DSP subsystems and
add their reset signal mappings.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/reset/reset-th1520.c | 793 +++++++++++++++++++++++++++++++++++
 1 file changed, 793 insertions(+)

diff --git a/drivers/reset/reset-th1520.c b/drivers/reset/reset-th1520.c
index 2b65a95ed021..fd32e991c4cb 100644
--- a/drivers/reset/reset-th1520.c
+++ b/drivers/reset/reset-th1520.c
@@ -11,6 +11,85 @@
 
 #include <dt-bindings/reset/thead,th1520-reset.h>
 
+ /* register offset in RSTGEN_R */
+#define TH1520_BROM_RST_CFG		0x0
+#define TH1520_C910_RST_CFG		0x4
+#define TH1520_CHIP_DBG_RST_CFG		0xc
+#define TH1520_AXI4_CPUSYS2_RST_CFG	0x10
+#define TH1520_X2H_CPUSYS_RST_CFG	0x18
+#define TH1520_AHB2_CPUSYS_RST_CFG	0x1c
+#define TH1520_APB3_CPUSYS_RST_CFG	0x20
+#define TH1520_MBOX0_RST_CFG		0x24
+#define TH1520_MBOX1_RST_CFG		0x28
+#define TH1520_MBOX2_RST_CFG		0x2c
+#define TH1520_MBOX3_RST_CFG		0x30
+#define TH1520_WDT0_RST_CFG		0x34
+#define TH1520_WDT1_RST_CFG		0x38
+#define TH1520_TIMER0_RST_CFG		0x3c
+#define TH1520_TIMER1_RST_CFG		0x40
+#define TH1520_PERISYS_AHB_RST_CFG	0x44
+#define TH1520_PERISYS_APB1_RST_CFG	0x48
+#define TH1520_PERISYS_APB2_RST_CFG	0x4c
+#define TH1520_GMAC0_RST_CFG		0x68
+#define TH1520_UART0_RST_CFG		0x70
+#define TH1520_UART1_RST_CFG		0x74
+#define TH1520_UART2_RST_CFG		0x78
+#define TH1520_UART3_RST_CFG		0x7c
+#define TH1520_UART4_RST_CFG		0x80
+#define TH1520_UART5_RST_CFG		0x84
+#define TH1520_QSPI0_RST_CFG		0x8c
+#define TH1520_QSPI1_RST_CFG		0x90
+#define TH1520_SPI_RST_CFG		0x94
+#define TH1520_I2C0_RST_CFG		0x98
+#define TH1520_I2C1_RST_CFG		0x9c
+#define TH1520_I2C2_RST_CFG		0xa0
+#define TH1520_I2C3_RST_CFG		0xa4
+#define TH1520_I2C4_RST_CFG		0xa8
+#define TH1520_I2C5_RST_CFG		0xac
+#define TH1520_GPIO0_RST_CFG		0xb0
+#define TH1520_GPIO1_RST_CFG		0xb4
+#define TH1520_GPIO2_RST_CFG		0xb8
+#define TH1520_PWM_RST_CFG		0xc0
+#define TH1520_PADCTRL0_APSYS_RST_CFG	0xc4
+#define TH1520_CPU2PERI_X2H_RST_CFG	0xcc
+#define TH1520_CPU2AON_X2H_RST_CFG	0xe4
+#define TH1520_AON2CPU_A2X_RST_CFG	0xfc
+#define TH1520_NPUSYS_AXI_RST_CFG	0x128
+#define TH1520_CPU2VP_X2P_RST_CFG	0x12c
+#define TH1520_CPU2VI_X2H_RST_CFG	0x138
+#define TH1520_BMU_C910_RST_CFG		0x148
+#define TH1520_DMAC_CPUSYS_RST_CFG	0x14c
+#define TH1520_SPINLOCK_RST_CFG		0x178
+#define TH1520_CFG2TEE_X2H_RST_CFG	0x188
+#define TH1520_DSMART_RST_CFG		0x18c
+#define TH1520_GPIO3_RST_CFG		0x1a8
+#define TH1520_I2S_RST_CFG		0x1ac
+#define TH1520_IMG_NNA_RST_CFG		0x1b0
+#define TH1520_PERI_APB3_RST_CFG	0x1dc
+#define TH1520_VP_SUBSYS_RST_CFG	0x1ec
+#define TH1520_PERISYS_APB4_RST_CFG	0x1f8
+#define TH1520_GMAC1_RST_CFG		0x204
+#define TH1520_GMAC_AXI_RST_CFG		0x208
+#define TH1520_PADCTRL1_APSYS_RST_CFG	0x20c
+#define TH1520_VOSYS_AXI_RST_CFG	0x210
+#define TH1520_VOSYS_X2X_RST_CFG	0x214
+#define TH1520_MISC2VP_X2X_RST_CFG	0x218
+#define TH1520_SUBSYS_RST_CFG		0x220
+
+ /* register offset in DSP_REGMAP */
+#define TH1520_DSPSYS_RST_CFG		0x0
+
+ /* register offset in MISCSYS_REGMAP */
+#define TH1520_EMMC_RST_CFG		0x0
+#define TH1520_MISCSYS_AXI_RST_CFG	0x8
+#define TH1520_SDIO0_RST_CFG		0xc
+#define TH1520_SDIO1_RST_CFG		0x10
+#define TH1520_USB3_DRD_RST_CFG		0x14
+
+ /* register offset in VISYS_REGMAP */
+#define TH1520_VISYS_RST_CFG		0x0
+#define TH1520_VISYS_2_RST_CFG		0x4
+
  /* register offset in VOSYS_REGMAP */
 #define TH1520_GPU_RST_CFG		0x0
 #define TH1520_GPU_RST_CFG_MASK		GENMASK(1, 0)
@@ -18,6 +97,8 @@
 #define TH1520_DSI0_RST_CFG		0x8
 #define TH1520_DSI1_RST_CFG		0xc
 #define TH1520_HDMI_RST_CFG		0x14
+#define TH1520_AXI4_VO_DW_AXI_RST_CFG	0x18
+#define TH1520_X2H_X4_VOSYS_DW_RST_CFG	0x20
 
 /* register values */
 #define TH1520_GPU_SW_GPU_RST		BIT(0)
@@ -29,6 +110,13 @@
 #define TH1520_HDMI_SW_MAIN_RST		BIT(0)
 #define TH1520_HDMI_SW_PRST		BIT(1)
 
+ /* register offset in VPSYS_REGMAP */
+#define TH1520_AXIBUS_RST_CFG		0x0
+#define TH1520_FCE_RST_CFG		0x4
+#define TH1520_G2D_RST_CFG		0x8
+#define TH1520_VDEC_RST_CFG		0xc
+#define TH1520_VENC_RST_CFG		0x10
+
 struct th1520_reset_map {
 	u32 bit;
 	u32 reg;
@@ -82,6 +170,681 @@ static const struct th1520_reset_map th1520_resets[] = {
 		.bit = TH1520_HDMI_SW_PRST,
 		.reg = TH1520_HDMI_RST_CFG,
 	},
+	[TH1520_RESET_ID_VOAXI] = {
+		.bit = BIT(0),
+		.reg = TH1520_AXI4_VO_DW_AXI_RST_CFG,
+	},
+	[TH1520_RESET_ID_VOAXI_APB] = {
+		.bit = BIT(1),
+		.reg = TH1520_AXI4_VO_DW_AXI_RST_CFG,
+	},
+	[TH1520_RESET_ID_X2H_DPU_AXI] = {
+		.bit = BIT(0),
+		.reg = TH1520_X2H_X4_VOSYS_DW_RST_CFG,
+	},
+	[TH1520_RESET_ID_X2H_DPU_AHB] = {
+		.bit = BIT(1),
+		.reg = TH1520_X2H_X4_VOSYS_DW_RST_CFG,
+	},
+	[TH1520_RESET_ID_X2H_DPU1_AXI] = {
+		.bit = BIT(2),
+		.reg = TH1520_X2H_X4_VOSYS_DW_RST_CFG,
+	},
+	[TH1520_RESET_ID_X2H_DPU1_AHB] = {
+		.bit = BIT(3),
+		.reg = TH1520_X2H_X4_VOSYS_DW_RST_CFG,
+	},
+};
+
+static const struct th1520_reset_map th1520_ap_resets[] = {
+	[TH1520_RESET_ID_BROM] = {
+		.bit = BIT(0),
+		.reg = TH1520_BROM_RST_CFG,
+	},
+	[TH1520_RESET_ID_C910_TOP] = {
+		.bit = BIT(0),
+		.reg = TH1520_C910_RST_CFG,
+	},
+	[TH1520_RESET_ID_NPU] =  {
+		.bit = BIT(0),
+		.reg = TH1520_IMG_NNA_RST_CFG,
+	},
+	[TH1520_RESET_ID_WDT0] = {
+		.bit = BIT(0),
+		.reg = TH1520_WDT0_RST_CFG,
+	},
+	[TH1520_RESET_ID_WDT1] = {
+		.bit = BIT(0),
+		.reg = TH1520_WDT1_RST_CFG,
+	},
+	[TH1520_RESET_ID_C910_C0] = {
+		.bit = BIT(1),
+		.reg = TH1520_C910_RST_CFG,
+	},
+	[TH1520_RESET_ID_C910_C1] = {
+		.bit = BIT(2),
+		.reg = TH1520_C910_RST_CFG,
+	},
+	[TH1520_RESET_ID_C910_C2] = {
+		.bit = BIT(3),
+		.reg = TH1520_C910_RST_CFG,
+	},
+	[TH1520_RESET_ID_C910_C3] = {
+		.bit = BIT(4),
+		.reg = TH1520_C910_RST_CFG,
+	},
+	[TH1520_RESET_ID_CHIP_DBG_CORE] = {
+		.bit = BIT(0),
+		.reg = TH1520_CHIP_DBG_RST_CFG,
+	},
+	[TH1520_RESET_ID_CHIP_DBG_AXI] = {
+		.bit = BIT(1),
+		.reg = TH1520_CHIP_DBG_RST_CFG,
+	},
+	[TH1520_RESET_ID_AXI4_CPUSYS2_AXI] = {
+		.bit = BIT(0),
+		.reg = TH1520_AXI4_CPUSYS2_RST_CFG,
+	},
+	[TH1520_RESET_ID_AXI4_CPUSYS2_APB] = {
+		.bit = BIT(1),
+		.reg = TH1520_AXI4_CPUSYS2_RST_CFG,
+	},
+	[TH1520_RESET_ID_X2H_CPUSYS] = {
+		.bit = BIT(0),
+		.reg = TH1520_X2H_CPUSYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_AHB2_CPUSYS] = {
+		.bit = BIT(0),
+		.reg = TH1520_AHB2_CPUSYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_APB3_CPUSYS] = {
+		.bit = BIT(0),
+		.reg = TH1520_APB3_CPUSYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_MBOX0_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_MBOX0_RST_CFG,
+	},
+	[TH1520_RESET_ID_MBOX1_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_MBOX1_RST_CFG,
+	},
+	[TH1520_RESET_ID_MBOX2_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_MBOX2_RST_CFG,
+	},
+	[TH1520_RESET_ID_MBOX3_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_MBOX3_RST_CFG,
+	},
+	[TH1520_RESET_ID_TIMER0_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_TIMER0_RST_CFG,
+	},
+	[TH1520_RESET_ID_TIMER0_CORE] = {
+		.bit = BIT(1),
+		.reg = TH1520_TIMER0_RST_CFG,
+	},
+	[TH1520_RESET_ID_TIMER1_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_TIMER1_RST_CFG,
+	},
+	[TH1520_RESET_ID_TIMER1_CORE] = {
+		.bit = BIT(1),
+		.reg = TH1520_TIMER1_RST_CFG,
+	},
+	[TH1520_RESET_ID_PERISYS_AHB] = {
+		.bit = BIT(0),
+		.reg = TH1520_PERISYS_AHB_RST_CFG,
+	},
+	[TH1520_RESET_ID_PERISYS_APB1] = {
+		.bit = BIT(0),
+		.reg = TH1520_PERISYS_APB1_RST_CFG,
+	},
+	[TH1520_RESET_ID_PERISYS_APB2] = {
+		.bit = BIT(0),
+		.reg = TH1520_PERISYS_APB2_RST_CFG,
+	},
+	[TH1520_RESET_ID_GMAC0_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_GMAC0_RST_CFG,
+	},
+	[TH1520_RESET_ID_GMAC0_AHB] = {
+		.bit = BIT(1),
+		.reg = TH1520_GMAC0_RST_CFG,
+	},
+	[TH1520_RESET_ID_GMAC0_CLKGEN] = {
+		.bit = BIT(2),
+		.reg = TH1520_GMAC0_RST_CFG,
+	},
+	[TH1520_RESET_ID_GMAC0_AXI] = {
+		.bit = BIT(3),
+		.reg = TH1520_GMAC0_RST_CFG,
+	},
+	[TH1520_RESET_ID_UART0_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_UART0_RST_CFG,
+	},
+	[TH1520_RESET_ID_UART0_IF] = {
+		.bit = BIT(1),
+		.reg = TH1520_UART0_RST_CFG,
+	},
+	[TH1520_RESET_ID_UART1_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_UART1_RST_CFG,
+	},
+	[TH1520_RESET_ID_UART1_IF] = {
+		.bit = BIT(1),
+		.reg = TH1520_UART1_RST_CFG,
+	},
+	[TH1520_RESET_ID_UART2_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_UART2_RST_CFG,
+	},
+	[TH1520_RESET_ID_UART2_IF] = {
+		.bit = BIT(1),
+		.reg = TH1520_UART2_RST_CFG,
+	},
+	[TH1520_RESET_ID_UART3_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_UART3_RST_CFG,
+	},
+	[TH1520_RESET_ID_UART3_IF] = {
+		.bit = BIT(1),
+		.reg = TH1520_UART3_RST_CFG,
+	},
+	[TH1520_RESET_ID_UART4_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_UART4_RST_CFG,
+	},
+	[TH1520_RESET_ID_UART4_IF] = {
+		.bit = BIT(1),
+		.reg = TH1520_UART4_RST_CFG,
+	},
+	[TH1520_RESET_ID_UART5_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_UART5_RST_CFG,
+	},
+	[TH1520_RESET_ID_UART5_IF] = {
+		.bit = BIT(1),
+		.reg = TH1520_UART5_RST_CFG,
+	},
+	[TH1520_RESET_ID_QSPI0_IF] = {
+		.bit = BIT(0),
+		.reg = TH1520_QSPI0_RST_CFG,
+	},
+	[TH1520_RESET_ID_QSPI0_APB] = {
+		.bit = BIT(1),
+		.reg = TH1520_QSPI0_RST_CFG,
+	},
+	[TH1520_RESET_ID_QSPI1_IF] = {
+		.bit = BIT(0),
+		.reg = TH1520_QSPI1_RST_CFG,
+	},
+	[TH1520_RESET_ID_QSPI1_APB] = {
+		.bit = BIT(1),
+		.reg = TH1520_QSPI1_RST_CFG,
+	},
+	[TH1520_RESET_ID_SPI_IF] = {
+		.bit = BIT(0),
+		.reg = TH1520_SPI_RST_CFG,
+	},
+	[TH1520_RESET_ID_SPI_APB] = {
+		.bit = BIT(1),
+		.reg = TH1520_SPI_RST_CFG,
+	},
+	[TH1520_RESET_ID_I2C0_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_I2C0_RST_CFG,
+	},
+	[TH1520_RESET_ID_I2C0_CORE] = {
+		.bit = BIT(1),
+		.reg = TH1520_I2C0_RST_CFG,
+	},
+	[TH1520_RESET_ID_I2C1_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_I2C1_RST_CFG,
+	},
+	[TH1520_RESET_ID_I2C1_CORE] = {
+		.bit = BIT(1),
+		.reg = TH1520_I2C1_RST_CFG,
+	},
+	[TH1520_RESET_ID_I2C2_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_I2C2_RST_CFG,
+	},
+	[TH1520_RESET_ID_I2C2_CORE] = {
+		.bit = BIT(1),
+		.reg = TH1520_I2C2_RST_CFG,
+	},
+	[TH1520_RESET_ID_I2C3_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_I2C3_RST_CFG,
+	},
+	[TH1520_RESET_ID_I2C3_CORE] = {
+		.bit = BIT(1),
+		.reg = TH1520_I2C3_RST_CFG,
+	},
+	[TH1520_RESET_ID_I2C4_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_I2C4_RST_CFG,
+	},
+	[TH1520_RESET_ID_I2C4_CORE] = {
+		.bit = BIT(1),
+		.reg = TH1520_I2C4_RST_CFG,
+	},
+	[TH1520_RESET_ID_I2C5_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_I2C5_RST_CFG,
+	},
+	[TH1520_RESET_ID_I2C5_CORE] = {
+		.bit = BIT(1),
+		.reg = TH1520_I2C5_RST_CFG,
+	},
+	[TH1520_RESET_ID_GPIO0_DB] = {
+		.bit = BIT(0),
+		.reg = TH1520_GPIO0_RST_CFG,
+	},
+	[TH1520_RESET_ID_GPIO0_APB] = {
+		.bit = BIT(1),
+		.reg = TH1520_GPIO0_RST_CFG,
+	},
+	[TH1520_RESET_ID_GPIO1_DB] = {
+		.bit = BIT(0),
+		.reg = TH1520_GPIO1_RST_CFG,
+	},
+	[TH1520_RESET_ID_GPIO1_APB] = {
+		.bit = BIT(1),
+		.reg = TH1520_GPIO1_RST_CFG,
+	},
+	[TH1520_RESET_ID_GPIO2_DB] = {
+		.bit = BIT(0),
+		.reg = TH1520_GPIO2_RST_CFG,
+	},
+	[TH1520_RESET_ID_GPIO2_APB] = {
+		.bit = BIT(1),
+		.reg = TH1520_GPIO2_RST_CFG,
+	},
+	[TH1520_RESET_ID_PWM_COUNTER] = {
+		.bit = BIT(0),
+		.reg = TH1520_PWM_RST_CFG,
+	},
+	[TH1520_RESET_ID_PWM_APB] = {
+		.bit = BIT(1),
+		.reg = TH1520_PWM_RST_CFG,
+	},
+	[TH1520_RESET_ID_PADCTRL0_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_PADCTRL0_APSYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_CPU2PERI_X2H] = {
+		.bit = BIT(1),
+		.reg = TH1520_CPU2PERI_X2H_RST_CFG,
+	},
+	[TH1520_RESET_ID_CPU2AON_X2H] = {
+		.bit = BIT(0),
+		.reg = TH1520_CPU2AON_X2H_RST_CFG,
+	},
+	[TH1520_RESET_ID_AON2CPU_A2X] = {
+		.bit = BIT(0),
+		.reg = TH1520_AON2CPU_A2X_RST_CFG,
+	},
+	[TH1520_RESET_ID_NPUSYS_AXI] = {
+		.bit = BIT(0),
+		.reg = TH1520_NPUSYS_AXI_RST_CFG,
+	},
+	[TH1520_RESET_ID_NPUSYS_AXI_APB] = {
+		.bit = BIT(1),
+		.reg = TH1520_NPUSYS_AXI_RST_CFG,
+	},
+	[TH1520_RESET_ID_CPU2VP_X2P] = {
+		.bit = BIT(0),
+		.reg = TH1520_CPU2VP_X2P_RST_CFG,
+	},
+	[TH1520_RESET_ID_CPU2VI_X2H] = {
+		.bit = BIT(0),
+		.reg = TH1520_CPU2VI_X2H_RST_CFG,
+	},
+	[TH1520_RESET_ID_BMU_AXI] = {
+		.bit = BIT(0),
+		.reg = TH1520_BMU_C910_RST_CFG,
+	},
+	[TH1520_RESET_ID_BMU_APB] = {
+		.bit = BIT(1),
+		.reg = TH1520_BMU_C910_RST_CFG,
+	},
+	[TH1520_RESET_ID_DMAC_CPUSYS_AXI] = {
+		.bit = BIT(0),
+		.reg = TH1520_DMAC_CPUSYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_DMAC_CPUSYS_AHB] = {
+		.bit = BIT(1),
+		.reg = TH1520_DMAC_CPUSYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_SPINLOCK] = {
+		.bit = BIT(0),
+		.reg = TH1520_SPINLOCK_RST_CFG,
+	},
+	[TH1520_RESET_ID_CFG2TEE] = {
+		.bit = BIT(0),
+		.reg = TH1520_CFG2TEE_X2H_RST_CFG,
+	},
+	[TH1520_RESET_ID_DSMART] = {
+		.bit = BIT(0),
+		.reg = TH1520_DSMART_RST_CFG,
+	},
+	[TH1520_RESET_ID_GPIO3_DB] = {
+		.bit = BIT(0),
+		.reg = TH1520_GPIO3_RST_CFG,
+	},
+	[TH1520_RESET_ID_GPIO3_APB] = {
+		.bit = BIT(1),
+		.reg = TH1520_GPIO3_RST_CFG,
+	},
+	[TH1520_RESET_ID_PERI_I2S] = {
+		.bit = BIT(0),
+		.reg = TH1520_I2S_RST_CFG,
+	},
+	[TH1520_RESET_ID_PERI_APB3] = {
+		.bit = BIT(0),
+		.reg = TH1520_PERI_APB3_RST_CFG,
+	},
+	[TH1520_RESET_ID_PERI2PERI1_APB] = {
+		.bit = BIT(1),
+		.reg = TH1520_PERI_APB3_RST_CFG,
+	},
+	[TH1520_RESET_ID_VPSYS_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_VP_SUBSYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_PERISYS_APB4] = {
+		.bit = BIT(0),
+		.reg = TH1520_PERISYS_APB4_RST_CFG,
+	},
+	[TH1520_RESET_ID_GMAC1_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_GMAC1_RST_CFG,
+	},
+	[TH1520_RESET_ID_GMAC1_AHB] = {
+		.bit = BIT(1),
+		.reg = TH1520_GMAC1_RST_CFG,
+	},
+	[TH1520_RESET_ID_GMAC1_CLKGEN] = {
+		.bit = BIT(2),
+		.reg = TH1520_GMAC1_RST_CFG,
+	},
+	[TH1520_RESET_ID_GMAC1_AXI] = {
+		.bit = BIT(3),
+		.reg = TH1520_GMAC1_RST_CFG,
+	},
+	[TH1520_RESET_ID_GMAC_AXI] = {
+		.bit = BIT(0),
+		.reg = TH1520_GMAC_AXI_RST_CFG,
+	},
+	[TH1520_RESET_ID_GMAC_AXI_APB] = {
+		.bit = BIT(1),
+		.reg = TH1520_GMAC_AXI_RST_CFG,
+	},
+	[TH1520_RESET_ID_PADCTRL1_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_PADCTRL1_APSYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_VOSYS_AXI] = {
+		.bit = BIT(0),
+		.reg = TH1520_VOSYS_AXI_RST_CFG,
+	},
+	[TH1520_RESET_ID_VOSYS_AXI_APB] = {
+		.bit = BIT(1),
+		.reg = TH1520_VOSYS_AXI_RST_CFG,
+	},
+	[TH1520_RESET_ID_VOSYS_AXI_X2X] = {
+		.bit = BIT(0),
+		.reg = TH1520_VOSYS_X2X_RST_CFG,
+	},
+	[TH1520_RESET_ID_MISC2VP_X2X] = {
+		.bit = BIT(0),
+		.reg = TH1520_MISC2VP_X2X_RST_CFG,
+	},
+	[TH1520_RESET_ID_DSPSYS] = {
+		.bit = BIT(0),
+		.reg = TH1520_SUBSYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_VISYS] = {
+		.bit = BIT(1),
+		.reg = TH1520_SUBSYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_VOSYS] = {
+		.bit = BIT(2),
+		.reg = TH1520_SUBSYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_VPSYS] = {
+		.bit = BIT(3),
+		.reg = TH1520_SUBSYS_RST_CFG,
+	},
+};
+
+static const struct th1520_reset_map th1520_dsp_resets[] = {
+	[TH1520_RESET_ID_X2X_DSP1] = {
+		.bit = BIT(0),
+		.reg = TH1520_DSPSYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_X2X_DSP0] = {
+		.bit = BIT(1),
+		.reg = TH1520_DSPSYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_X2X_SLAVE_DSP1] = {
+		.bit = BIT(2),
+		.reg = TH1520_DSPSYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_X2X_SLAVE_DSP0] = {
+		.bit = BIT(3),
+		.reg = TH1520_DSPSYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_DSP0_CORE] = {
+		.bit = BIT(8),
+		.reg = TH1520_DSPSYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_DSP0_DEBUG] = {
+		.bit = BIT(9),
+		.reg = TH1520_DSPSYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_DSP0_APB] = {
+		.bit = BIT(10),
+		.reg = TH1520_DSPSYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_DSP1_CORE] = {
+		.bit = BIT(12),
+		.reg = TH1520_DSPSYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_DSP1_DEBUG] = {
+		.bit = BIT(13),
+		.reg = TH1520_DSPSYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_DSP1_APB] = {
+		.bit = BIT(14),
+		.reg = TH1520_DSPSYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_DSPSYS_APB] = {
+		.bit = BIT(16),
+		.reg = TH1520_DSPSYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_AXI4_DSPSYS_SLV] = {
+		.bit = BIT(20),
+		.reg = TH1520_DSPSYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_AXI4_DSPSYS] = {
+		.bit = BIT(24),
+		.reg = TH1520_DSPSYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_AXI4_DSP_RS] = {
+		.bit = BIT(26),
+		.reg = TH1520_DSPSYS_RST_CFG,
+	},
+};
+
+static const struct th1520_reset_map th1520_misc_resets[] = {
+	[TH1520_RESET_ID_EMMC_SDIO_CLKGEN] = {
+		.bit = BIT(0),
+		.reg = TH1520_EMMC_RST_CFG,
+	},
+	[TH1520_RESET_ID_EMMC] = {
+		.bit = BIT(1),
+		.reg = TH1520_EMMC_RST_CFG,
+	},
+	[TH1520_RESET_ID_MISCSYS_AXI] = {
+		.bit = BIT(0),
+		.reg = TH1520_MISCSYS_AXI_RST_CFG,
+	},
+	[TH1520_RESET_ID_MISCSYS_AXI_APB] = {
+		.bit = BIT(1),
+		.reg = TH1520_MISCSYS_AXI_RST_CFG,
+	},
+	[TH1520_RESET_ID_SDIO0] = {
+		.bit = BIT(0),
+		.reg = TH1520_SDIO0_RST_CFG,
+	},
+	[TH1520_RESET_ID_SDIO1] = {
+		.bit = BIT(1),
+		.reg = TH1520_SDIO1_RST_CFG,
+	},
+	[TH1520_RESET_ID_USB3_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_USB3_DRD_RST_CFG,
+	},
+	[TH1520_RESET_ID_USB3_PHY] = {
+		.bit = BIT(1),
+		.reg = TH1520_USB3_DRD_RST_CFG,
+	},
+	[TH1520_RESET_ID_USB3_VCC] = {
+		.bit = BIT(2),
+		.reg = TH1520_USB3_DRD_RST_CFG,
+	},
+};
+
+static const struct th1520_reset_map th1520_vi_resets[] = {
+	[TH1520_RESET_ID_ISP0] = {
+		.bit = BIT(0),
+		.reg = TH1520_VISYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_ISP1] = {
+		.bit = BIT(4),
+		.reg = TH1520_VISYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_CSI0_APB] = {
+		.bit = BIT(16),
+		.reg = TH1520_VISYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_CSI1_APB] = {
+		.bit = BIT(17),
+		.reg = TH1520_VISYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_CSI2_APB] = {
+		.bit = BIT(18),
+		.reg = TH1520_VISYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_MIPI_FIFO] = {
+		.bit = BIT(20),
+		.reg = TH1520_VISYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_ISP_VENC_APB] = {
+		.bit = BIT(24),
+		.reg = TH1520_VISYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_VIPRE_APB] = {
+		.bit = BIT(28),
+		.reg = TH1520_VISYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_VIPRE_AXI] = {
+		.bit = BIT(29),
+		.reg = TH1520_VISYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_DW200_APB] = {
+		.bit = BIT(31),
+		.reg = TH1520_VISYS_RST_CFG,
+	},
+	[TH1520_RESET_ID_VISYS3_AXI] = {
+		.bit = BIT(8),
+		.reg = TH1520_VISYS_2_RST_CFG,
+	},
+	[TH1520_RESET_ID_VISYS2_AXI] = {
+		.bit = BIT(9),
+		.reg = TH1520_VISYS_2_RST_CFG,
+	},
+	[TH1520_RESET_ID_VISYS1_AXI] = {
+		.bit = BIT(10),
+		.reg = TH1520_VISYS_2_RST_CFG,
+	},
+	[TH1520_RESET_ID_VISYS_AXI] = {
+		.bit = BIT(12),
+		.reg = TH1520_VISYS_2_RST_CFG,
+	},
+	[TH1520_RESET_ID_VISYS_APB] = {
+		.bit = BIT(16),
+		.reg = TH1520_VISYS_2_RST_CFG,
+	},
+	[TH1520_RESET_ID_ISP_VENC_AXI] = {
+		.bit = BIT(20),
+		.reg = TH1520_VISYS_2_RST_CFG,
+	},
+};
+
+static const struct th1520_reset_map th1520_vp_resets[] = {
+	[TH1520_RESET_ID_VPSYS_AXI_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_AXIBUS_RST_CFG,
+	},
+	[TH1520_RESET_ID_VPSYS_AXI] = {
+		.bit = BIT(1),
+		.reg = TH1520_AXIBUS_RST_CFG,
+	},
+	[TH1520_RESET_ID_FCE_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_FCE_RST_CFG,
+	},
+	[TH1520_RESET_ID_FCE_CORE] = {
+		.bit = BIT(1),
+		.reg = TH1520_FCE_RST_CFG,
+	},
+	[TH1520_RESET_ID_FCE_X2X_MASTER] = {
+		.bit = BIT(4),
+		.reg = TH1520_FCE_RST_CFG,
+	},
+	[TH1520_RESET_ID_FCE_X2X_SLAVE] = {
+		.bit = BIT(5),
+		.reg = TH1520_FCE_RST_CFG,
+	},
+	[TH1520_RESET_ID_G2D_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_G2D_RST_CFG,
+	},
+	[TH1520_RESET_ID_G2D_ACLK] = {
+		.bit = BIT(1),
+		.reg = TH1520_G2D_RST_CFG,
+	},
+	[TH1520_RESET_ID_G2D_CORE] = {
+		.bit = BIT(2),
+		.reg = TH1520_G2D_RST_CFG,
+	},
+	[TH1520_RESET_ID_VDEC_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_VDEC_RST_CFG,
+	},
+	[TH1520_RESET_ID_VDEC_ACLK] = {
+		.bit = BIT(1),
+		.reg = TH1520_VDEC_RST_CFG,
+	},
+	[TH1520_RESET_ID_VDEC_CORE] = {
+		.bit = BIT(2),
+		.reg = TH1520_VDEC_RST_CFG,
+	},
+	[TH1520_RESET_ID_VENC_APB] = {
+		.bit = BIT(0),
+		.reg = TH1520_VENC_RST_CFG,
+	},
+	[TH1520_RESET_ID_VENC_CORE] = {
+		.bit = BIT(1),
+		.reg = TH1520_VENC_RST_CFG,
+	},
 };
 
 static inline struct th1520_reset_priv *
@@ -170,8 +933,38 @@ static const struct th1520_reset_data th1520_reset_data = {
 	.num = ARRAY_SIZE(th1520_resets),
 };
 
+static const struct th1520_reset_data th1520_ap_reset_data = {
+	.resets = th1520_ap_resets,
+	.num = ARRAY_SIZE(th1520_ap_resets),
+};
+
+static const struct th1520_reset_data th1520_dsp_reset_data = {
+	.resets = th1520_dsp_resets,
+	.num = ARRAY_SIZE(th1520_dsp_resets),
+};
+
+static const struct th1520_reset_data th1520_misc_reset_data = {
+	.resets = th1520_misc_resets,
+	.num = ARRAY_SIZE(th1520_misc_resets),
+};
+
+static const struct th1520_reset_data th1520_vi_reset_data = {
+	.resets = th1520_vi_resets,
+	.num = ARRAY_SIZE(th1520_vi_resets),
+};
+
+static const struct th1520_reset_data th1520_vp_reset_data = {
+	.resets = th1520_vp_resets,
+	.num = ARRAY_SIZE(th1520_vp_resets),
+};
+
 static const struct of_device_id th1520_reset_match[] = {
 	{ .compatible = "thead,th1520-reset", .data = &th1520_reset_data },
+	{ .compatible = "thead,th1520-reset-ap", .data = &th1520_ap_reset_data },
+	{ .compatible = "thead,th1520-reset-dsp", .data = &th1520_dsp_reset_data },
+	{ .compatible = "thead,th1520-reset-misc", .data = &th1520_misc_reset_data },
+	{ .compatible = "thead,th1520-reset-vi", .data = &th1520_vi_reset_data },
+	{ .compatible = "thead,th1520-reset-vp", .data = &th1520_vp_reset_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, th1520_reset_match);
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
