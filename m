Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420ABC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Sep 2022 17:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1/NkroUdsON18Sg8cRRSzrM+uYIKUmVQzLxDBrpulWg=; b=Aq+FhYonhSmnkD
	zCu0yE9wYhprSvvjl9Xt1GsnqCtSrB+1f4ibRXSaUMavdTV5liZ+SP/oz/eIZWiB6oIXYsPRvzpYq
	hbmXF+Bdka+B+pKvBB8LnnnDUQxJzf4XBS+FGlRyRtLicwZPqf1xakYBAau+veP8URlIi5zjTkJU4
	xnM003cjPoZAjbdQPW+/gUywSf/9Gzg2fdfMWG+seRVIv9EYIzU0OZitTmnZMaU9Zj1hcMmSe77qH
	4TmFn0FfP2cJo/Ep/sVnh+y7iAxY8gaXKfokwT1DUWiylWow7O/cHA1ShXhuEZluUK/wByCYQ/P5A
	4TxXbLfqCjAk9azIhXuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odx3F-004SMk-5q; Thu, 29 Sep 2022 17:10:21 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odwWL-004ELc-DQ
	for linux-riscv@lists.infradead.org; Thu, 29 Sep 2022 16:36:24 +0000
X-QQ-mid: bizesmtp68t1664469353ty2iuuyk
Received: from localhost.localdomain ( [113.72.145.157])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 30 Sep 2022 00:35:52 +0800 (CST)
X-QQ-SSF: 01000000002000303000B00A0000000
X-QQ-FEAT: 7Lv6dviieSRAp3JV0PxWTIUwBOkUOF4Jj1AKxT/tPj/UQ7gAZBgxuApzJJ3Py
	bnDJ+E0QXWRlSZ0/QxTaX6hTz3f6kupKwPCxalSlCb9bgnp7JNPzQDoBFIDppbC7pjsjaUm
	GPYk/Bk2isRY/NrMLQG0fAux+YW7UMbuonO71DmUvZdzqpcDIiwTHRwkTyDyFhZBFrqoCFj
	hUdfNwXpZFzENXCoZmFUKPEyqyv9W7Uzsxf+r0Osyk8gZpNbEHcgRLriJw/kDtr02lju07R
	Bc2nUwXZ0CnzqCI+7zA9hNc0LNi51sPZVB4Oj1ibTvIhyPZDpqkMJ40HyBwsnv/NvSCsfJU
	I0sqpEeYLEPwD8chPSKo2Ci4Jlyxskm5l5ixV/g+6mSAdNzS4A=
X-QQ-GoodBg: 0
From: Hal Feng <hal.feng@linux.starfivetech.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@linux.starfivetech.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 11/30] dt-bindings: reset: Add StarFive JH7110 reset definitions
Date: Fri, 30 Sep 2022 00:35:47 +0800
Message-Id: <20220929163547.19211-1-hal.feng@linux.starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_093621_820475_9C90080B 
X-CRM114-Status: UNSURE (   9.71  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Emil Renner Berthing <kernel@esmil.dk>

Add resets for the StarFive JH7110 reset controller.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
---
 include/dt-bindings/reset/starfive-jh7110.h | 154 ++++++++++++++++++++
 1 file changed, 154 insertions(+)
 create mode 100644 include/dt-bindings/reset/starfive-jh7110.h

diff --git a/include/dt-bindings/reset/starfive-jh7110.h b/include/dt-bindings/reset/starfive-jh7110.h
new file mode 100644
index 000000000000..512bd8834efb
--- /dev/null
+++ b/include/dt-bindings/reset/starfive-jh7110.h
@@ -0,0 +1,154 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
+ * Copyright (C) 2021-2022 Emil Renner Berthing <kernel@esmil.dk>
+ */
+
+#ifndef __DT_BINDINGS_RESET_STARFIVE_JH7110_H__
+#define __DT_BINDINGS_RESET_STARFIVE_JH7110_H__
+
+/* syscrg_rst */
+#define JH7110_SYSRST_JTAG2APB			  0
+#define JH7110_SYSRST_SYSCON			  1
+#define JH7110_SYSRST_IOMUX			  2
+#define JH7110_SYSRST_BUS			  3
+#define JH7110_SYSRST_DEBUG			  4
+#define JH7110_SYSRST_CORE0			  5
+#define JH7110_SYSRST_CORE1			  6
+#define JH7110_SYSRST_CORE2			  7
+#define JH7110_SYSRST_CORE3			  8
+#define JH7110_SYSRST_CORE4			  9
+#define JH7110_SYSRST_CORE0_ST			 10
+#define JH7110_SYSRST_CORE1_ST			 11
+#define JH7110_SYSRST_CORE2_ST			 12
+#define JH7110_SYSRST_CORE3_ST			 13
+#define JH7110_SYSRST_CORE4_ST			 14
+#define JH7110_SYSRST_TRACE0			 15
+#define JH7110_SYSRST_TRACE1			 16
+#define JH7110_SYSRST_TRACE2			 17
+#define JH7110_SYSRST_TRACE3			 18
+#define JH7110_SYSRST_TRACE4			 19
+#define JH7110_SYSRST_TRACE_COM			 20
+#define JH7110_SYSRST_GPU_APB			 21
+#define JH7110_SYSRST_GPU_DOMA			 22
+#define JH7110_SYSRST_NOC_BUS_APB_BUS		 23
+#define JH7110_SYSRST_NOC_BUS_AXICFG0_AXI	 24
+#define JH7110_SYSRST_NOC_BUS_CPU_AXI		 25
+#define JH7110_SYSRST_NOC_BUS_DISP_AXI		 26
+#define JH7110_SYSRST_NOC_BUS_GPU_AXI		 27
+#define JH7110_SYSRST_NOC_BUS_ISP_AXI		 28
+#define JH7110_SYSRST_NOC_BUS_DDRC		 29
+#define JH7110_SYSRST_NOC_BUS_STG_AXI		 30
+#define JH7110_SYSRST_NOC_BUS_VDEC_AXI		 31
+
+#define JH7110_SYSRST_NOC_BUS_VENC_AXI		 32
+#define JH7110_SYSRST_AXI_CFG1_DEC_AHB		 33
+#define JH7110_SYSRST_AXI_CFG1_DEC_MAIN		 34
+#define JH7110_SYSRST_AXI_CFG0_DEC_MAIN		 35
+#define JH7110_SYSRST_AXI_CFG0_DEC_MAIN_DIV	 36
+#define JH7110_SYSRST_AXI_CFG0_DEC_HIFI4	 37
+#define JH7110_SYSRST_DDR_AXI			 38
+#define JH7110_SYSRST_DDR_OSC			 39
+#define JH7110_SYSRST_DDR_APB			 40
+#define JH7110_SYSRST_DOM_ISP_TOP_N		 41
+#define JH7110_SYSRST_DOM_ISP_TOP_AXI		 42
+#define JH7110_SYSRST_DOM_VOUT_TOP_SRC		 43
+#define JH7110_SYSRST_CODAJ12_AXI		 44
+#define JH7110_SYSRST_CODAJ12_CORE		 45
+#define JH7110_SYSRST_CODAJ12_APB		 46
+#define JH7110_SYSRST_WAVE511_AXI		 47
+#define JH7110_SYSRST_WAVE511_BPU		 48
+#define JH7110_SYSRST_WAVE511_VCE		 49
+#define JH7110_SYSRST_WAVE511_APB		 50
+#define JH7110_SYSRST_VDEC_JPG_ARB_JPG		 51
+#define JH7110_SYSRST_VDEC_JPG_ARB_MAIN		 52
+#define JH7110_SYSRST_AXIMEM0_AXI		 53
+#define JH7110_SYSRST_WAVE420L_AXI		 54
+#define JH7110_SYSRST_WAVE420L_BPU		 55
+#define JH7110_SYSRST_WAVE420L_VCE		 56
+#define JH7110_SYSRST_WAVE420L_APB		 57
+#define JH7110_SYSRST_AXIMEM1_AXI		 58
+#define JH7110_SYSRST_AXIMEM2_AXI		 59
+#define JH7110_SYSRST_INTMEM			 60
+#define JH7110_SYSRST_QSPI_AHB			 61
+#define JH7110_SYSRST_QSPI_APB			 62
+#define JH7110_SYSRST_QSPI_REF			 63
+
+#define JH7110_SYSRST_SDIO0_AHB			 64
+#define JH7110_SYSRST_SDIO1_AHB			 65
+#define JH7110_SYSRST_GMAC1_AXI			 66
+#define JH7110_SYSRST_GMAC1_AHB			 67
+#define JH7110_SYSRST_MAILBOX			 68
+#define JH7110_SYSRST_SPI0_APB			 69
+#define JH7110_SYSRST_SPI1_APB			 70
+#define JH7110_SYSRST_SPI2_APB			 71
+#define JH7110_SYSRST_SPI3_APB			 72
+#define JH7110_SYSRST_SPI4_APB			 73
+#define JH7110_SYSRST_SPI5_APB			 74
+#define JH7110_SYSRST_SPI6_APB			 75
+#define JH7110_SYSRST_I2C0_APB			 76
+#define JH7110_SYSRST_I2C1_APB			 77
+#define JH7110_SYSRST_I2C2_APB			 78
+#define JH7110_SYSRST_I2C3_APB			 79
+#define JH7110_SYSRST_I2C4_APB			 80
+#define JH7110_SYSRST_I2C5_APB			 81
+#define JH7110_SYSRST_I2C6_APB			 82
+#define JH7110_SYSRST_UART0_APB			 83
+#define JH7110_SYSRST_UART0_CORE		 84
+#define JH7110_SYSRST_UART1_APB			 85
+#define JH7110_SYSRST_UART1_CORE		 86
+#define JH7110_SYSRST_UART2_APB			 87
+#define JH7110_SYSRST_UART2_CORE		 88
+#define JH7110_SYSRST_UART3_APB			 89
+#define JH7110_SYSRST_UART3_CORE		 90
+#define JH7110_SYSRST_UART4_APB			 91
+#define JH7110_SYSRST_UART4_CORE		 92
+#define JH7110_SYSRST_UART5_APB			 93
+#define JH7110_SYSRST_UART5_CORE		 94
+#define JH7110_SYSRST_SPDIF_APB			 95
+
+#define JH7110_SYSRST_PWMDAC_APB		 96
+#define JH7110_SYSRST_PDM_DMIC			 97
+#define JH7110_SYSRST_PDM_APB			 98
+#define JH7110_SYSRST_I2SRX_APB			 99
+#define JH7110_SYSRST_I2SRX_BCLK		100
+#define JH7110_SYSRST_I2STX0_APB		101
+#define JH7110_SYSRST_I2STX0_BCLK		102
+#define JH7110_SYSRST_I2STX1_APB		103
+#define JH7110_SYSRST_I2STX1_BCLK		104
+#define JH7110_SYSRST_TDM_AHB			105
+#define JH7110_SYSRST_TDM_CORE			106
+#define JH7110_SYSRST_TDM_APB			107
+#define JH7110_SYSRST_PWM_APB			108
+#define JH7110_SYSRST_WDT_APB			109
+#define JH7110_SYSRST_WDT_CORE			110
+#define JH7110_SYSRST_CAN0_APB			111
+#define JH7110_SYSRST_CAN0_CORE			112
+#define JH7110_SYSRST_CAN0_TIMER		113
+#define JH7110_SYSRST_CAN1_APB			114
+#define JH7110_SYSRST_CAN1_CORE			115
+#define JH7110_SYSRST_CAN1_TIMER		116
+#define JH7110_SYSRST_TIMER_APB			117
+#define JH7110_SYSRST_TIMER0			118
+#define JH7110_SYSRST_TIMER1			119
+#define JH7110_SYSRST_TIMER2			120
+#define JH7110_SYSRST_TIMER3			121
+#define JH7110_SYSRST_INT_CTRL_APB		122
+#define JH7110_SYSRST_TEMP_APB			123
+#define JH7110_SYSRST_TEMP_CORE			124
+#define JH7110_SYSRST_JTAG_CERTIFICATION	125
+
+#define	JH7110_SYSRST_END			126
+
+/* aoncrg_rst */
+#define JH7110_AONRST_GMAC0_AXI		0
+#define JH7110_AONRST_GMAC0_AHB		1
+#define JH7110_AONRST_AON_IOMUX		2
+#define JH7110_AONRST_PMU_APB		3
+#define JH7110_AONRST_PMU_WKUP		4
+#define JH7110_AONRST_RTC_APB		5
+#define JH7110_AONRST_RTC_CAL		6
+#define JH7110_AONRST_RTC_32K		7
+
+#define	JH7110_AONRST_END		8
+
+#endif /* __DT_BINDINGS_RESET_STARFIVE_JH7110_H__ */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
