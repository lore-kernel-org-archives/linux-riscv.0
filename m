Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 164CFC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:02:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAE486103B
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CAE486103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w4pM+C3bdc45iSYIy44LYL+GD4ZqbiSA+3bBZCJiii0=; b=g3jFhsB9ozbG5q
	JgDScMNR/FNn/YPZHl0V1f9IJ2HKcs7f0WsQVPwXThQK7/aeeW9eL8PO9eE0I+si2CpneXyhN4MHv
	t/mNO1hgrZCdFw8gWtFei4xmcMAmlXM0tzOgXuL59n32PDslpBPYW230rHILUPwoS4bcncVC+gX7h
	xPD9uWrUVPDqCYnNHFgwHv+nIoLneJJLuKAne5m+cIo2jTZju53Hm/MXmPeknPDnejagtHRtTgt9Y
	/M0vQePtZG31F3/iRvmZufM8RCINhCTn+ozZL0V9wWdejuH26uMvg0z9jpkGLUBFrzXL9SBAnrO7h
	Jj42Xbmq7BhCagXnRq5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmzyH-0023iS-94; Tue, 16 Nov 2021 15:02:05 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmzyE-0023fP-2P
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 15:02:03 +0000
Received: by mail-ed1-x52e.google.com with SMTP id g14so89214301edz.2
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 07:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K8dKASe/l2+LOI+r38ZTu5MH6BDOV4wDKFWMxZBsmrs=;
 b=YW1w1VzRuSUEMy3YyqIKYHmAoIzHH5o31C+hDR/N0tO5BivMxTnh8kS3NO7R5Op23P
 3iNjTqQLoA0ocRvDiaRWfZghGPVK5odh9ZrfR4SUTcc0EL+xnkxy6SO+hoSPpBsumIOe
 YvCKbUwV8wTPYhIQdqVYZuuW3X/Wx5Khks8jNehqSS0snvi3rLOlGbh2YHGjoorTDxSE
 69Qx7JIS0r7rTRLS33HmJxd5AogOeS6kRYNyO1RdqdVfLg+iTal7+eEV4hgRPKdqJaPT
 GbyFLYQLTeyxbLl1O/MMV2AhQDdzujmM+38PEnYUlX1Bfqyuz9aznxYR+l86KY25+QUa
 i4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=K8dKASe/l2+LOI+r38ZTu5MH6BDOV4wDKFWMxZBsmrs=;
 b=umGi5Ijy/9WXt5dIGkwn7p8CgbpNfpX1d6giC45SpOJaJbbOCnTwNR+5BP92z3qpzj
 dloBeUG3PvXdk/Os/DSeYmrxySaDFAikjAsVhdTEtNNHUa6kU6fggL0mLAKRf4QgGC7W
 zvwqbP83KPPog1U9t38elDbdRTm87zeHviPUJ06a7g4NeD+Eqeoqq5M50yAWtLDZhTeE
 GQRzDnumCzwi7STyGnsJ2O+0uNSLawJz0rtGcbw8Tcu0cK6D8P7iI/UtskxPw+xh/VGA
 O/O3UDWn+1XkyNuBIFjApo5Pgu44Q19iLeHPIDxibIvIaphO3TT4gRiC9H/eG9tyNAGN
 9/yQ==
X-Gm-Message-State: AOAM532uLONSAvuL7EF4uNnFQnU/bb2VNC1UdeLUYOLKqBM+l57YkXJj
 FGdPswJd0+Ycz/uyj891DueTbA0g7bFTaQ==
X-Google-Smtp-Source: ABdhPJwBRYskJ/y34zKucepkl7e5Fy9BN8oFzRa/+FJpaswXjxiV5dhQ5JGX7p8aS34KcRZz+Rg16Q==
X-Received: by 2002:a05:6402:438a:: with SMTP id
 o10mr10934406edc.353.1637074919641; 
 Tue, 16 Nov 2021 07:01:59 -0800 (PST)
Received: from stitch.. ([2a02:aa7:4600:b4ae:a375:e7a0:9eaf:8d7b])
 by smtp.gmail.com with ESMTPSA id u16sm9414311edr.43.2021.11.16.07.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 07:01:58 -0800 (PST)
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
 Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>
Subject: [PATCH v4 07/16] dt-bindings: reset: Add StarFive JH7100 reset
 definitions
Date: Tue, 16 Nov 2021 16:01:10 +0100
Message-Id: <20211116150119.2171-8-kernel@esmil.dk>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211116150119.2171-1-kernel@esmil.dk>
References: <20211116150119.2171-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_070202_141664_EE970907 
X-CRM114-Status: GOOD (  12.75  )
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
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Acked-by: Rob Herring <robh@kernel.org>
---
 include/dt-bindings/reset/starfive-jh7100.h | 126 ++++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 include/dt-bindings/reset/starfive-jh7100.h

diff --git a/include/dt-bindings/reset/starfive-jh7100.h b/include/dt-bindings/reset/starfive-jh7100.h
new file mode 100644
index 000000000000..540e19254f39
--- /dev/null
+++ b/include/dt-bindings/reset/starfive-jh7100.h
@@ -0,0 +1,126 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
+ * Copyright (C) 2021 Ahmad Fatoum, Pengutronix
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
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
