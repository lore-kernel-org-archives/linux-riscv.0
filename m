Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE0E7C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 13:42:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9946360555
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 13:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9946360555
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mKkKPx3XLVSwWLk5fPyn9tLdQkW2t0v8HSi2FJ4ovDo=; b=4T6TPRrsw7QV7r
	CQK2ekpvViyPJdjiTbPSkgPszCaMjJcS9mehxBQC/ss9WdmTOx5fSuJLIrvw2h95EjwRMPclb2aFO
	RM0uS8uRUbYzKEmXd095eRQqBuLIfAKW55UzKtW7zY2ylAUpgw+nkzXs38XTrc6vV3fxSTWQUt20q
	CMAANL47S2HJYncm+/4VJzEbjwek4Sk/N2ITCyn0dAErDHGL08PKe0EsaOKgydRp/gJhvY9dsS0HN
	BywPGhR/E7Fxq4rOM2s00oho4yMPGx9o1K6ikjem6qkuzUCAO8LSM27H8aLwQNq4Is5OoDNYclpXc
	iU96qCApqpptoIP+pb8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maI2j-00D2bZ-Kn; Tue, 12 Oct 2021 13:42:09 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maI2W-00D2Qx-Fg
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 13:41:58 +0000
Received: by mail-lf1-x12c.google.com with SMTP id u18so87633623lfd.12
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 06:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+SLS2Sf+pusn4/Wv+pf/aWgHQ484SZZoaXFMa/90YOA=;
 b=EghzOziMIsM8QYk64oNay8adSRpvDgU+v+vAXBc1aSOHokuH0AmHJoKZNHmnRNtUKM
 zMsHbMgSWrpJlH475P7vMcc8WyqmkFvvu4oTxy2Uxh0axP2um/bSgZlvdajEkltlPDx0
 OtWUyh9CzoP8XSUX3iejbZhkTpUO2NyapT+DiDKRrLUQi2pafSj3RHG1gwXkElztIR4v
 /BeFqR8tiIbYOHHS4u6Grxd3W0WOMxtx1WSc4jcfeaB4q5jPVIqWHOSA27wKDf9BeQOq
 AFjQZ+t+pd8hxLHa1MQ+B8fYBRAXBDUtGKC08XbyjmrZuSE1osdwri1AMuMsud8HXfji
 aUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+SLS2Sf+pusn4/Wv+pf/aWgHQ484SZZoaXFMa/90YOA=;
 b=c53Q0CkVk8DqydGcCFrUfjLFhTDKeg4N6MMfiKpA9SnKcZL4uuZrTdWO9kwMUvTrmY
 0MEfvd+5vQ8aTLG2fw0fvUX4dpWRfc7f8W3YLv99fqGGtIxzp65DsKZBOzJ529+SM7T2
 VESX6MA9bnHDNRnlLcABNiCfLaVPFpfPY43RIrLpjQkbfZU4kvkP5AAPXQLGdkNQ4cBC
 e/Y57bMJ2cGPxreDpA13UAaKRp6EiCBxJwiIPcQu6T+dD6y/FaA2isBwIVJ6BKvy2LtJ
 TGCZcLrcONUaFibqBqYf2Hx0amh1dBbdSHOJVK5n7dC0Wm43rHnrVyGgsXXVTeZAjjnx
 Q4Jg==
X-Gm-Message-State: AOAM533Vgzd/Bmqa5zcua/9xzK91r1wm+UNp/wntTvAB8Q2O7dV2kdsD
 85gq1FgXbP0x7OIT1b+wda57ajdaedRPxw==
X-Google-Smtp-Source: ABdhPJzkqaYRxxLp3xlOXqpfwVkjC7crdHW6LlvTJpWHGt5n7JBuqq+D1g34Yd37z91e423KCrZzGA==
X-Received: by 2002:a2e:3608:: with SMTP id d8mr7945373lja.233.1634046108565; 
 Tue, 12 Oct 2021 06:41:48 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id k16sm1033761lfo.219.2021.10.12.06.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 06:41:48 -0700 (PDT)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Matteo Croce <mcroce@microsoft.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v1 04/16] dt-bindings: clock: starfive: Add JH7100 clock
 definitions
Date: Tue, 12 Oct 2021 15:40:15 +0200
Message-Id: <20211012134027.684712-5-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012134027.684712-1-kernel@esmil.dk>
References: <20211012134027.684712-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_064156_578766_DAF69425 
X-CRM114-Status: GOOD (  12.83  )
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

From: Geert Uytterhoeven <geert@linux-m68k.org>

Add all clock outputs for the StarFive JH7100 clock generator.

Based on work by Ahmad Fatoum for Barebox, with "JH7100_" prefixes added
to all definitions.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 include/dt-bindings/clock/starfive-jh7100.h | 202 ++++++++++++++++++++
 1 file changed, 202 insertions(+)
 create mode 100644 include/dt-bindings/clock/starfive-jh7100.h

diff --git a/include/dt-bindings/clock/starfive-jh7100.h b/include/dt-bindings/clock/starfive-jh7100.h
new file mode 100644
index 000000000000..742f93c6dd6b
--- /dev/null
+++ b/include/dt-bindings/clock/starfive-jh7100.h
@@ -0,0 +1,202 @@
+/* SPDX-License-Identifier: GPL-2.0 OR X11 */
+/*
+ * Copyright (C) 2021 Ahmad Fatoum, Pengutronix
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_STARFIVE_JH7100_H__
+#define __DT_BINDINGS_CLOCK_STARFIVE_JH7100_H__
+
+#define JH7100_CLK_CPUNDBUS_ROOT	0
+#define JH7100_CLK_DLA_ROOT		1
+#define JH7100_CLK_DSP_ROOT		2
+#define JH7100_CLK_GMACUSB_ROOT		3
+#define JH7100_CLK_PERH0_ROOT		4
+#define JH7100_CLK_PERH1_ROOT		5
+#define JH7100_CLK_VIN_ROOT		6
+#define JH7100_CLK_VOUT_ROOT		7
+#define JH7100_CLK_AUDIO_ROOT		8
+#define JH7100_CLK_CDECHIFI4_ROOT	9
+#define JH7100_CLK_CDEC_ROOT		10
+#define JH7100_CLK_VOUTBUS_ROOT		11
+#define JH7100_CLK_CPUNBUS_ROOT_DIV	12
+#define JH7100_CLK_DSP_ROOT_DIV		13
+#define JH7100_CLK_PERH0_SRC		14
+#define JH7100_CLK_PERH1_SRC		15
+#define JH7100_CLK_PLL0_TESTOUT		16
+#define JH7100_CLK_PLL1_TESTOUT		17
+#define JH7100_CLK_PLL2_TESTOUT		18
+#define JH7100_CLK_PLL2_REF		19
+#define JH7100_CLK_CPU_CORE		20
+#define JH7100_CLK_CPU_AXI		21
+#define JH7100_CLK_AHB_BUS		22
+#define JH7100_CLK_APB1_BUS		23
+#define JH7100_CLK_APB2_BUS		24
+#define JH7100_CLK_DOM3AHB_BUS		25
+#define JH7100_CLK_DOM7AHB_BUS		26
+#define JH7100_CLK_U74_CORE0		27
+#define JH7100_CLK_U74_CORE1		28
+#define JH7100_CLK_U74_AXI		29
+#define JH7100_CLK_U74RTC_TOGGLE	30
+#define JH7100_CLK_SGDMA2P_AXI		31
+#define JH7100_CLK_DMA2PNOC_AXI		32
+#define JH7100_CLK_SGDMA2P_AHB		33
+#define JH7100_CLK_DLA_BUS		34
+#define JH7100_CLK_DLA_AXI		35
+#define JH7100_CLK_DLANOC_AXI		36
+#define JH7100_CLK_DLA_APB		37
+#define JH7100_CLK_VP6_CORE		38
+#define JH7100_CLK_VP6BUS_SRC		39
+#define JH7100_CLK_VP6_AXI		40
+#define JH7100_CLK_VCDECBUS_SRC		41
+#define JH7100_CLK_VDEC_BUS		42
+#define JH7100_CLK_VDEC_AXI		43
+#define JH7100_CLK_VDECBRG_MAIN		44
+#define JH7100_CLK_VDEC_BCLK		45
+#define JH7100_CLK_VDEC_CCLK		46
+#define JH7100_CLK_VDEC_APB		47
+#define JH7100_CLK_JPEG_AXI		48
+#define JH7100_CLK_JPEG_CCLK		49
+#define JH7100_CLK_JPEG_APB		50
+#define JH7100_CLK_GC300_2X		51
+#define JH7100_CLK_GC300_AHB		52
+#define JH7100_CLK_JPCGC300_AXIBUS	53
+#define JH7100_CLK_GC300_AXI		54
+#define JH7100_CLK_JPCGC300_MAIN	55
+#define JH7100_CLK_VENC_BUS		56
+#define JH7100_CLK_VENC_AXI		57
+#define JH7100_CLK_VENCBRG_MAIN		58
+#define JH7100_CLK_VENC_BCLK		59
+#define JH7100_CLK_VENC_CCLK		60
+#define JH7100_CLK_VENC_APB		61
+#define JH7100_CLK_DDRPLL_DIV2		62
+#define JH7100_CLK_DDRPLL_DIV4		63
+#define JH7100_CLK_DDRPLL_DIV8		64
+#define JH7100_CLK_DDROSC_DIV2		65
+#define JH7100_CLK_DDRC0		66
+#define JH7100_CLK_DDRC1		67
+#define JH7100_CLK_DDRPHY_APB		68
+#define JH7100_CLK_NOC_ROB		69
+#define JH7100_CLK_NOC_COG		70
+#define JH7100_CLK_NNE_AHB		71
+#define JH7100_CLK_NNEBUS_SRC1		72
+#define JH7100_CLK_NNE_BUS		73
+#define JH7100_CLK_NNE_AXI		74
+#define JH7100_CLK_NNENOC_AXI		75
+#define JH7100_CLK_DLASLV_AXI		76
+#define JH7100_CLK_DSPX2C_AXI		77
+#define JH7100_CLK_HIFI4_SRC		78
+#define JH7100_CLK_HIFI4_COREFREE	79
+#define JH7100_CLK_HIFI4_CORE		80
+#define JH7100_CLK_HIFI4_BUS		81
+#define JH7100_CLK_HIFI4_AXI		82
+#define JH7100_CLK_HIFI4NOC_AXI		83
+#define JH7100_CLK_SGDMA1P_BUS		84
+#define JH7100_CLK_SGDMA1P_AXI		85
+#define JH7100_CLK_DMA1P_AXI		86
+#define JH7100_CLK_X2C_AXI		87
+#define JH7100_CLK_USB_BUS		88
+#define JH7100_CLK_USB_AXI		89
+#define JH7100_CLK_USBNOC_AXI		90
+#define JH7100_CLK_USBPHY_ROOTDIV	91
+#define JH7100_CLK_USBPHY_125M		92
+#define JH7100_CLK_USBPHY_PLLDIV25M	93
+#define JH7100_CLK_USBPHY_25M		94
+#define JH7100_CLK_AUDIO_DIV		95
+#define JH7100_CLK_AUDIO_SRC		96
+#define JH7100_CLK_AUDIO_12288		97
+#define JH7100_CLK_VIN_SRC		98
+#define JH7100_CLK_ISP0_BUS		99
+#define JH7100_CLK_ISP0_AXI		100
+#define JH7100_CLK_ISP0NOC_AXI		101
+#define JH7100_CLK_ISPSLV_AXI		102
+#define JH7100_CLK_ISP1_BUS		103
+#define JH7100_CLK_ISP1_AXI		104
+#define JH7100_CLK_ISP1NOC_AXI		105
+#define JH7100_CLK_VIN_BUS		106
+#define JH7100_CLK_VIN_AXI		107
+#define JH7100_CLK_VINNOC_AXI		108
+#define JH7100_CLK_VOUT_SRC		109
+#define JH7100_CLK_DISPBUS_SRC		110
+#define JH7100_CLK_DISP_BUS		111
+#define JH7100_CLK_DISP_AXI		112
+#define JH7100_CLK_DISPNOC_AXI		113
+#define JH7100_CLK_SDIO0_AHB		114
+#define JH7100_CLK_SDIO0_CCLKINT	115
+#define JH7100_CLK_SDIO0_CCLKINT_INV	116
+#define JH7100_CLK_SDIO1_AHB		117
+#define JH7100_CLK_SDIO1_CCLKINT	118
+#define JH7100_CLK_SDIO1_CCLKINT_INV	119
+#define JH7100_CLK_GMAC_AHB		120
+#define JH7100_CLK_GMAC_ROOT_DIV	121
+#define JH7100_CLK_GMAC_PTP_REF		122
+#define JH7100_CLK_GMAC_GTX		123
+#define JH7100_CLK_GMAC_RMII_TX		124
+#define JH7100_CLK_GMAC_RMII_RX		125
+#define JH7100_CLK_GMAC_TX		126
+#define JH7100_CLK_GMAC_TX_INV		127
+#define JH7100_CLK_GMAC_RX_PRE		128
+#define JH7100_CLK_GMAC_RX_INV		129
+#define JH7100_CLK_GMAC_RMII		130
+#define JH7100_CLK_GMAC_TOPHYREF	131
+#define JH7100_CLK_SPI2AHB_AHB		132
+#define JH7100_CLK_SPI2AHB_CORE		133
+#define JH7100_CLK_EZMASTER_AHB		134
+#define JH7100_CLK_E24_AHB		135
+#define JH7100_CLK_E24RTC_TOGGLE	136
+#define JH7100_CLK_QSPI_AHB		137
+#define JH7100_CLK_QSPI_APB		138
+#define JH7100_CLK_QSPI_REF		139
+#define JH7100_CLK_SEC_AHB		140
+#define JH7100_CLK_AES			141
+#define JH7100_CLK_SHA			142
+#define JH7100_CLK_PKA			143
+#define JH7100_CLK_TRNG_APB		144
+#define JH7100_CLK_OTP_APB		145
+#define JH7100_CLK_UART0_APB		146
+#define JH7100_CLK_UART0_CORE		147
+#define JH7100_CLK_UART1_APB		148
+#define JH7100_CLK_UART1_CORE		149
+#define JH7100_CLK_SPI0_APB		150
+#define JH7100_CLK_SPI0_CORE		151
+#define JH7100_CLK_SPI1_APB		152
+#define JH7100_CLK_SPI1_CORE		153
+#define JH7100_CLK_I2C0_APB		154
+#define JH7100_CLK_I2C0_CORE		155
+#define JH7100_CLK_I2C1_APB		156
+#define JH7100_CLK_I2C1_CORE		157
+#define JH7100_CLK_GPIO_APB		158
+#define JH7100_CLK_UART2_APB		159
+#define JH7100_CLK_UART2_CORE		160
+#define JH7100_CLK_UART3_APB		161
+#define JH7100_CLK_UART3_CORE		162
+#define JH7100_CLK_SPI2_APB		163
+#define JH7100_CLK_SPI2_CORE		164
+#define JH7100_CLK_SPI3_APB		165
+#define JH7100_CLK_SPI3_CORE		166
+#define JH7100_CLK_I2C2_APB		167
+#define JH7100_CLK_I2C2_CORE		168
+#define JH7100_CLK_I2C3_APB		169
+#define JH7100_CLK_I2C3_CORE		170
+#define JH7100_CLK_WDTIMER_APB		171
+#define JH7100_CLK_WDT_CORE		172
+#define JH7100_CLK_TIMER0_CORE		173
+#define JH7100_CLK_TIMER1_CORE		174
+#define JH7100_CLK_TIMER2_CORE		175
+#define JH7100_CLK_TIMER3_CORE		176
+#define JH7100_CLK_TIMER4_CORE		177
+#define JH7100_CLK_TIMER5_CORE		178
+#define JH7100_CLK_TIMER6_CORE		179
+#define JH7100_CLK_VP6INTC_APB		180
+#define JH7100_CLK_PWM_APB		181
+#define JH7100_CLK_MSI_APB		182
+#define JH7100_CLK_TEMP_APB		183
+#define JH7100_CLK_TEMP_SENSE		184
+#define JH7100_CLK_SYSERR_APB		185
+
+#define JH7100_CLK_PLL0_OUT		186
+#define JH7100_CLK_PLL1_OUT		187
+#define JH7100_CLK_PLL2_OUT		188
+
+#define JH7100_CLK_END			189
+
+#endif /* __DT_BINDINGS_CLOCK_STARFIVE_JH7100_H__ */
-- 
2.33.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
