Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF63BC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 13:42:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76E4E60555
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 13:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76E4E60555
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=621ieqGMYzCKWIoR7kNKcX93rTvrfEpk6h2MiL9bQuo=; b=rHnjCPX0wiUWSb
	qXqhk3GJwghKDRiVfMv5j4wFudEaSHohCNdufhIDIxBHSXbF9I34kMYdGQ/h5wCNU7lHq3qDfEFmH
	/jRz0bDmpIIEc3KToUO3vEl+0dew8eObydmChAbtVsW2cBWZFyZxxbWk4LGA75ZLVVp/5Lq+hLehB
	G0Py4AEFZi98R5GOLPXDLDRs+TsjSId/gCXGGT4X2jiQKLEX3/LIO5JQnaTwzlLDLNziB5UgFwSmm
	PTaGumDuOMAAAb5knNGzqvf+tR67sO44hCN8ynuprFSWmNS8MZj6jnXgQlBKHwqAjHo4PF1euZ2TA
	F8qvunY2orxU51c0v43w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maI3E-00D2uk-TK; Tue, 12 Oct 2021 13:42:41 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maI2d-00D2Wd-G1
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 13:42:05 +0000
Received: by mail-lf1-x12a.google.com with SMTP id c16so32919280lfb.3
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 06:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G/53J7v+SOo0o9eTPzThb2w5qdaVHV+40DTct2o/oqI=;
 b=UP8ljDXGKZS1jVF0jGz9t8LK9i6McYBfbhgJ/C/c1PBQshTZ/n4ZbHO4Kb/xgtDQOO
 Mi/U1PId10akhrz1Y64lb7zmvIgu7lcVP3z20d0llAT8AQ4TrCzMHZBej1ia8XqffBcB
 5OSO5U13FApykyxisjbvZhSozLVdKxHpU+ZW6kjlIFqqcC311ECAZZlOAIKhRPxRiRlh
 3U3cQ89R+MgqZywoBWUs2MXWbx3Hsb9c+6SQ3p6KxFwzuq3BVrdCryifsIlM5PUHIuzB
 ZL7t6tu3rXUJGeORI80esNHl1yKlTPmeaQ+Bw8Q+o57rLTZb85OOx8r4gNTYfBkFH0aT
 BgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=G/53J7v+SOo0o9eTPzThb2w5qdaVHV+40DTct2o/oqI=;
 b=0y2ZUxslnplDpIhngfvYwWQM7uyuiqFtt4XWjb60StMpYGtvd9oLHj+Ghs7mUgHrvW
 sR3mJaytW/A3bBwzMYz3/ZTVprB+b6YxdXOj88NWHPcGzqTHS4ODU29XRmncwJzMBQKS
 OhWYb+Lj26lqj8PONZdzQttpAEU/r/XOCr0RrnRT+9xYTWbbRwEQjbGt8EeLS+Qjc//N
 EweV0jAinkzyW2ACc6ifEoBKXUWv5v/JOnX+/UfLC3CJt9r+YzhjOqcuIzvWpzVSMiez
 wyLonocItZcLFnxEHe1V9ZkX5Ej33AblY/0Hu9KezIC5yy8wI2FZiKOokle0qnB1IQZi
 O4tA==
X-Gm-Message-State: AOAM533IK8lKylvbmpAfFvMTWzYK1xYAjuyuBq/sWusUAFQ0EyDqp7Ad
 UBYZyLRktHRJ+XDPv1MgVHuq8+D19dSlwQ==
X-Google-Smtp-Source: ABdhPJwzFU7PTmunx1evd9gxZfbyTNVG0iE7SjXZsAeCDv1aVExv5/AkLIPZm5NKADZTvxeZ7tIPQA==
X-Received: by 2002:a05:6512:14b:: with SMTP id
 m11mr16830520lfo.410.1634046116689; 
 Tue, 12 Oct 2021 06:41:56 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id k16sm1033761lfo.219.2021.10.12.06.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 06:41:56 -0700 (PDT)
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
Subject: [PATCH v1 07/16] dt-bindings: reset: Add StarFive JH7100 reset
 definitions
Date: Tue, 12 Oct 2021 15:40:18 +0200
Message-Id: <20211012134027.684712-8-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012134027.684712-1-kernel@esmil.dk>
References: <20211012134027.684712-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_064203_602224_A3928D38 
X-CRM114-Status: GOOD (  12.99  )
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

Add all resets for the StarFive JH7100 reset controller.

Based on work by Ahmad Fatoum for Barebox, with "JH7100_" prefixes added
to all definitions.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 include/dt-bindings/reset/starfive-jh7100.h | 126 ++++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 include/dt-bindings/reset/starfive-jh7100.h

diff --git a/include/dt-bindings/reset/starfive-jh7100.h b/include/dt-bindings/reset/starfive-jh7100.h
new file mode 100644
index 000000000000..42dc95868efc
--- /dev/null
+++ b/include/dt-bindings/reset/starfive-jh7100.h
@@ -0,0 +1,126 @@
+/* SPDX-License-Identifier: GPL-2.0 OR X11 */
+/*
+ * Copyright (c) 2021 Ahmad Fatoum, Pengutronix
+ */
+
+#ifndef __DT_BINDINGS_RESET_STARFIVE_JH7100_H__
+#define __DT_BINDINGS_RESET_STARFIVE_JH7100_H__
+
+#define JH7100_RSTN_DOM3AHB_BUS		0
+#define JH7100_RSTN_DOM7AHB_BUS		1
+#define JH7100_RST_U74			2
+#define JH7100_RSTN_U74_AXI		3
+#define JH7100_RSTN_SGDMA2P_AHB		4
+#define JH7100_RSTN_SGDMA2P_AXI		5
+#define JH7100_RSTN_DMA2PNOC_AXI	6
+#define JH7100_RSTN_DLA_AXI		7
+#define JH7100_RSTN_DLANOC_AXI		8
+#define JH7100_RSTN_DLA_APB		9
+#define JH7100_RST_VP6_DRESET		10
+#define JH7100_RST_VP6_BRESET		11
+#define JH7100_RSTN_VP6_AXI		12
+#define JH7100_RSTN_VDECBRG_MAIN	13
+#define JH7100_RSTN_VDEC_AXI		14
+#define JH7100_RSTN_VDEC_BCLK		15
+#define JH7100_RSTN_VDEC_CCLK		16
+#define JH7100_RSTN_VDEC_APB		17
+#define JH7100_RSTN_JPEG_AXI		18
+#define JH7100_RSTN_JPEG_CCLK		19
+#define JH7100_RSTN_JPEG_APB		20
+#define JH7100_RSTN_JPCGC300_MAIN	21
+#define JH7100_RSTN_GC300_2X		22
+#define JH7100_RSTN_GC300_AXI		23
+#define JH7100_RSTN_GC300_AHB		24
+#define JH7100_RSTN_VENC_AXI		25
+#define JH7100_RSTN_VENCBRG_MAIN	26
+#define JH7100_RSTN_VENC_BCLK		27
+#define JH7100_RSTN_VENC_CCLK		28
+#define JH7100_RSTN_VENC_APB		29
+#define JH7100_RSTN_DDRPHY_APB		30
+#define JH7100_RSTN_NOC_ROB		31
+#define JH7100_RSTN_NOC_COG		32
+#define JH7100_RSTN_HIFI4_AXI		33
+#define JH7100_RSTN_HIFI4NOC_AXI	34
+#define JH7100_RST_HIFI4_DRESET		35
+#define JH7100_RST_HIFI4_BRESET		36
+#define JH7100_RSTN_USB_AXI		37
+#define JH7100_RSTN_USBNOC_AXI		38
+#define JH7100_RSTN_SGDMA1P_AXI		39
+#define JH7100_RSTN_DMA1P_AXI		40
+#define JH7100_RSTN_X2C_AXI		41
+#define JH7100_RSTN_NNE_AHB		42
+#define JH7100_RSTN_NNE_AXI		43
+#define JH7100_RSTN_NNENOC_AXI		44
+#define JH7100_RSTN_DLASLV_AXI		45
+#define JH7100_RSTN_DSPX2C_AXI		46
+#define JH7100_RSTN_VIN_SRC		47
+#define JH7100_RSTN_ISPSLV_AXI		48
+#define JH7100_RSTN_VIN_AXI		49
+#define JH7100_RSTN_VINNOC_AXI		50
+#define JH7100_RSTN_ISP0_AXI		51
+#define JH7100_RSTN_ISP0NOC_AXI		52
+#define JH7100_RSTN_ISP1_AXI		53
+#define JH7100_RSTN_ISP1NOC_AXI		54
+#define JH7100_RSTN_VOUT_SRC		55
+#define JH7100_RSTN_DISP_AXI		56
+#define JH7100_RSTN_DISPNOC_AXI		57
+#define JH7100_RSTN_SDIO0_AHB		58
+#define JH7100_RSTN_SDIO1_AHB		59
+#define JH7100_RSTN_GMAC_AHB		60
+#define JH7100_RSTN_SPI2AHB_AHB		61
+#define JH7100_RSTN_SPI2AHB_CORE	62
+#define JH7100_RSTN_EZMASTER_AHB	63
+#define JH7100_RST_E24			64
+#define JH7100_RSTN_QSPI_AHB		65
+#define JH7100_RSTN_QSPI_CORE		66
+#define JH7100_RSTN_QSPI_APB		67
+#define JH7100_RSTN_SEC_AHB		68
+#define JH7100_RSTN_AES			69
+#define JH7100_RSTN_PKA			70
+#define JH7100_RSTN_SHA			71
+#define JH7100_RSTN_TRNG_APB		72
+#define JH7100_RSTN_OTP_APB		73
+#define JH7100_RSTN_UART0_APB		74
+#define JH7100_RSTN_UART0_CORE		75
+#define JH7100_RSTN_UART1_APB		76
+#define JH7100_RSTN_UART1_CORE		77
+#define JH7100_RSTN_SPI0_APB		78
+#define JH7100_RSTN_SPI0_CORE		79
+#define JH7100_RSTN_SPI1_APB		80
+#define JH7100_RSTN_SPI1_CORE		81
+#define JH7100_RSTN_I2C0_APB		82
+#define JH7100_RSTN_I2C0_CORE		83
+#define JH7100_RSTN_I2C1_APB		84
+#define JH7100_RSTN_I2C1_CORE		85
+#define JH7100_RSTN_GPIO_APB		86
+#define JH7100_RSTN_UART2_APB		87
+#define JH7100_RSTN_UART2_CORE		88
+#define JH7100_RSTN_UART3_APB		89
+#define JH7100_RSTN_UART3_CORE		90
+#define JH7100_RSTN_SPI2_APB		91
+#define JH7100_RSTN_SPI2_CORE		92
+#define JH7100_RSTN_SPI3_APB		93
+#define JH7100_RSTN_SPI3_CORE		94
+#define JH7100_RSTN_I2C2_APB		95
+#define JH7100_RSTN_I2C2_CORE		96
+#define JH7100_RSTN_I2C3_APB		97
+#define JH7100_RSTN_I2C3_CORE		98
+#define JH7100_RSTN_WDTIMER_APB		99
+#define JH7100_RSTN_WDT			100
+#define JH7100_RSTN_TIMER0		101
+#define JH7100_RSTN_TIMER1		102
+#define JH7100_RSTN_TIMER2		103
+#define JH7100_RSTN_TIMER3		104
+#define JH7100_RSTN_TIMER4		105
+#define JH7100_RSTN_TIMER5		106
+#define JH7100_RSTN_TIMER6		107
+#define JH7100_RSTN_VP6INTC_APB		108
+#define JH7100_RSTN_PWM_APB		109
+#define JH7100_RSTN_MSI_APB		110
+#define JH7100_RSTN_TEMP_APB		111
+#define JH7100_RSTN_TEMP_SENSE		112
+#define JH7100_RSTN_SYSERR_APB		113
+
+#define JH7100_RSTN_END			114
+
+#endif /* __DT_BINDINGS_RESET_STARFIVE_JH7100_H__ */
-- 
2.33.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
