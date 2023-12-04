Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F67C4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 12:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XAbZ/jUhGwI/KjNA7T+LqMHsYJSRrvOQQtL+o8DNlGI=; b=lDOdEwGmwGm5nI
	FA4ikEh6kcUAAinoK7enh1HNBgjCC4nFq/zD6UHtAanIV2yyTJdhG8/JejEKCO5AeEuFna8IZXAf9
	R11mbV+DbL9Laf1Z77l+qlrTjdmqvfy8vtUvwUzKXVVbrVPmTShsVAZtJKptp3l77MnoceSDW7jfL
	9/2fgjs8XDg13HrSYduG0MfKmoJRKI/yUe9kZDQpK5cehOVjqbzrcqEvydkC3KR8BatDdT/y2ai/Z
	Uw7S+YolEORTV1bseXuodSJpbg15o8ZxDxCQxJBIf+YDt1bsN6X81+TAxuwYDyZSYfGfzrUmtmnBO
	tKAI+FTgBv0WoDEc+QDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA8UJ-004HOB-07;
	Mon, 04 Dec 2023 12:55:51 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA8UC-004HFk-38
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 12:55:48 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3b837d974ecso2660420b6e.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 04:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701694542; x=1702299342; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79Le3QSDDV4kpTUs/Myvcsz2gaq5UyxfKyhguct4R8E=;
        b=nqcjINbsUgwCKXPtmtjiYvcxEfJkBbIi6cmo01EyAUvBsyh7yVhSqAtNirJsE3vvvr
         92YAJ+qTzx2Z25FNQLbsOy11mJNbUtk7OhEmEdkKqpznljhefe2wtuzVHz8trBl+QSOW
         m5WIogqKRDKpXSigg33e0/vepxmAU/78H0yI6TdQ7FevAA5+A1QLvcFcARjD5hiKAsiu
         9Ya2aHb5uNPeKhM0c/IqjY8ZZ0/yhRSdgHdb1TnmxFcIpvOcmr/E/JOt4gHhQJIx7vuM
         w59WjMfckaPP7VieYsxgjhnEOJs1L2TXGH0ZRfFqE45nwEU1cZlHEbgzSvGCJ/6tDk+s
         RsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701694542; x=1702299342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79Le3QSDDV4kpTUs/Myvcsz2gaq5UyxfKyhguct4R8E=;
        b=QB1Jayn83fjqIQw3/44XQ0DZqaw9eAukRdga9CFgnbw6r+fDUwwj8vM17ETQlyuSe2
         Sgip+9md4T/9kbjHgUfIDNlxTgGPoXPJfLCcE8BtkdsDYJmH9cT4eUji8fg8cPx9NhY1
         SjyH0ZYiViHd9t5vHKLKxaZhCh6yD414dJ2rfssn0dCwjLIzlOE3NfxLI6s43FzYWVWo
         /68cNRACpgQDiYBb2tlr7DVtslfNlMVYtq2AJM5tSizM2bkMkNKEwNJnaiz4RQXmDN5c
         PhZY7BWBkIWjBu9vEFPRWNHMJP6ckoGabPFo6VNwW1ZAPK9NKmLwiybMaiiyI/t2Aq9X
         WMLQ==
X-Gm-Message-State: AOJu0YwkIgb/FIUIfPSPBbEQaa2JBGkJW5erGVMKKzPgDET9IhZejmrW
	QR5OboZ4xi5lrqNm00MIvM8=
X-Google-Smtp-Source: AGHT+IEcoxFAFJO2XGpTupeBB1IWK796X7jvtDagfPVc8cE+AiYI+ky/0xmkRxGG2ODuA+vKNPdirA==
X-Received: by 2002:a05:6808:1790:b0:3b8:5fec:5d6 with SMTP id bg16-20020a056808179000b003b85fec05d6mr4570940oib.27.1701694542614;
        Mon, 04 Dec 2023 04:55:42 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id m15-20020a0568080f0f00b003b8b8d37f4esm731275oiw.15.2023.12.04.04.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 04:55:42 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	richardcochran@gmail.com,
	robh+dt@kernel.org,
	sboyd@kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	inochiama@outlook.com,
	samuel.holland@sifive.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v3 2/4] dt-bindings: clock: sophgo: Add SG2042 bindings
Date: Mon,  4 Dec 2023 20:55:31 +0800
Message-Id: <a8f0fe2ddc4f9af8225b44253851b2cd3653e3e3.1701691923.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701691923.git.unicorn_wang@outlook.com>
References: <cover.1701691923.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_045545_048030_DE66D949 
X-CRM114-Status: GOOD (  14.01  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add bindings for the clock generator on the SG2042 RISC-V SoC.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../clock/sophgo/sophgo,sg2042-clkgen.yaml    |  50 ++++++
 .../dt-bindings/clock/sophgo,sg2042-clkgen.h  | 169 ++++++++++++++++++
 2 files changed, 219 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo/sophgo,sg2042-clkgen.yaml
 create mode 100644 include/dt-bindings/clock/sophgo,sg2042-clkgen.h

diff --git a/Documentation/devicetree/bindings/clock/sophgo/sophgo,sg2042-clkgen.yaml b/Documentation/devicetree/bindings/clock/sophgo/sophgo,sg2042-clkgen.yaml
new file mode 100644
index 000000000000..a12c33059399
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/sophgo/sophgo,sg2042-clkgen.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/sophgo/sophgo,sg2042-clkgen.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 Clock Generator
+
+maintainers:
+  - Chen Wang <unicorn_wang@outlook.com>
+
+properties:
+  compatible:
+    items:
+      - const: sophgo,sg2042-clkgen
+
+  reg:
+    maxItems: 1
+
+  system-ctrl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: a phandle to SG2042 System Controller node.
+
+  clocks:
+    items:
+      - description: Clock Generation IC (25 MHz)
+
+  '#clock-cells':
+    const: 1
+    description:
+      See <dt-bindings/clock/sophgo,sg2042-clkgen.h> for valid indices.
+
+required:
+  - compatible
+  - reg
+  - system-ctrl
+  - clocks
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@30012000 {
+        compatible = "sophgo,sg2042-clkgen";
+        reg = <0x30012000 0x1000>;
+        system-ctrl = <&sys_ctrl>;
+        clocks = <&cgi>;
+        #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/sophgo,sg2042-clkgen.h b/include/dt-bindings/clock/sophgo,sg2042-clkgen.h
new file mode 100644
index 000000000000..b12046046f1f
--- /dev/null
+++ b/include/dt-bindings/clock/sophgo,sg2042-clkgen.h
@@ -0,0 +1,169 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/*
+ * Copyright (C) 2023 Sophgo Technology Inc. All rights reserved.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_SOPHGO_SG2042_H__
+#define __DT_BINDINGS_CLOCK_SOPHGO_SG2042_H__
+
+/* Divider clocks */
+#define	DIV_CLK_MPLL_RP_CPU_NORMAL_0	0
+#define	DIV_CLK_MPLL_AXI_DDR_0		1
+#define	DIV_CLK_FPLL_DDR01_1		2
+#define	DIV_CLK_FPLL_DDR23_1		3
+#define	DIV_CLK_FPLL_RP_CPU_NORMAL_1	4
+#define	DIV_CLK_FPLL_50M_A53		5
+#define	DIV_CLK_FPLL_TOP_RP_CMN_DIV2	6
+#define	DIV_CLK_FPLL_UART_500M		7
+#define	DIV_CLK_FPLL_AHB_LPC		8
+#define	DIV_CLK_FPLL_EFUSE		9
+#define	DIV_CLK_FPLL_TX_ETH0		10
+#define	DIV_CLK_FPLL_PTP_REF_I_ETH0	11
+#define	DIV_CLK_FPLL_REF_ETH0		12
+#define	DIV_CLK_FPLL_EMMC		13
+#define	DIV_CLK_FPLL_SD			14
+#define	DIV_CLK_FPLL_TOP_AXI0		15
+#define	DIV_CLK_FPLL_TOP_AXI_HSPERI	16
+#define	DIV_CLK_FPLL_AXI_DDR_1		17
+#define	DIV_CLK_FPLL_DIV_TIMER1		18
+#define	DIV_CLK_FPLL_DIV_TIMER2		19
+#define	DIV_CLK_FPLL_DIV_TIMER3		20
+#define	DIV_CLK_FPLL_DIV_TIMER4		21
+#define	DIV_CLK_FPLL_DIV_TIMER5		22
+#define	DIV_CLK_FPLL_DIV_TIMER6		23
+#define	DIV_CLK_FPLL_DIV_TIMER7		24
+#define	DIV_CLK_FPLL_DIV_TIMER8		25
+#define	DIV_CLK_FPLL_100K_EMMC		26
+#define	DIV_CLK_FPLL_100K_SD		27
+#define	DIV_CLK_FPLL_GPIO_DB		28
+#define	DIV_CLK_DPLL0_DDR01_0		29
+#define	DIV_CLK_DPLL1_DDR23_0		30
+
+/* Gate clocks */
+#define	GATE_CLK_RP_CPU_NORMAL_DIV0	31
+#define	GATE_CLK_AXI_DDR_DIV0		32
+
+#define	GATE_CLK_RP_CPU_NORMAL_DIV1	33
+#define	GATE_CLK_A53_50M		34
+#define	GATE_CLK_TOP_RP_CMN_DIV2	35
+#define	GATE_CLK_HSDMA			36
+#define	GATE_CLK_EMMC_100M		37
+#define	GATE_CLK_SD_100M		38
+#define	GATE_CLK_TX_ETH0		39
+#define	GATE_CLK_PTP_REF_I_ETH0		40
+#define	GATE_CLK_REF_ETH0		41
+#define	GATE_CLK_UART_500M		42
+#define	GATE_CLK_EFUSE			43
+
+#define	GATE_CLK_AHB_LPC		44
+#define	GATE_CLK_AHB_ROM		45
+#define	GATE_CLK_AHB_SF			46
+
+#define	GATE_CLK_APB_UART		47
+#define	GATE_CLK_APB_TIMER		48
+#define	GATE_CLK_APB_EFUSE		49
+#define	GATE_CLK_APB_GPIO		50
+#define	GATE_CLK_APB_GPIO_INTR		51
+#define	GATE_CLK_APB_SPI		52
+#define	GATE_CLK_APB_I2C		53
+#define	GATE_CLK_APB_WDT		54
+#define	GATE_CLK_APB_PWM		55
+#define	GATE_CLK_APB_RTC		56
+
+#define	GATE_CLK_AXI_PCIE0		57
+#define	GATE_CLK_AXI_PCIE1		58
+#define	GATE_CLK_SYSDMA_AXI		59
+#define	GATE_CLK_AXI_DBG_I2C		60
+#define	GATE_CLK_AXI_SRAM		61
+#define	GATE_CLK_AXI_ETH0		62
+#define	GATE_CLK_AXI_EMMC		63
+#define	GATE_CLK_AXI_SD			64
+#define	GATE_CLK_TOP_AXI0		65
+#define	GATE_CLK_TOP_AXI_HSPERI		66
+
+#define	GATE_CLK_TIMER1			67
+#define	GATE_CLK_TIMER2			68
+#define	GATE_CLK_TIMER3			69
+#define	GATE_CLK_TIMER4			70
+#define	GATE_CLK_TIMER5			71
+#define	GATE_CLK_TIMER6			72
+#define	GATE_CLK_TIMER7			73
+#define	GATE_CLK_TIMER8			74
+#define	GATE_CLK_100K_EMMC		75
+#define	GATE_CLK_100K_SD		76
+#define	GATE_CLK_GPIO_DB		77
+
+#define	GATE_CLK_AXI_DDR_DIV1		78
+#define	GATE_CLK_DDR01_DIV1		79
+#define	GATE_CLK_DDR23_DIV1		80
+/* DPLL0 */
+#define	GATE_CLK_DDR01_DIV0		81
+/* DPLL1 */
+#define	GATE_CLK_DDR23_DIV0		82
+
+#define	GATE_CLK_DDR01			83
+#define	GATE_CLK_DDR23			84
+#define	GATE_CLK_RP_CPU_NORMAL		85
+#define	GATE_CLK_AXI_DDR		86
+#define	GATE_CLK_RXU0			87
+#define	GATE_CLK_RXU1			88
+#define	GATE_CLK_RXU2			89
+#define	GATE_CLK_RXU3			90
+#define	GATE_CLK_RXU4			91
+#define	GATE_CLK_RXU5			92
+#define	GATE_CLK_RXU6			93
+#define	GATE_CLK_RXU7			94
+#define	GATE_CLK_RXU8			95
+#define	GATE_CLK_RXU9			96
+#define	GATE_CLK_RXU10			97
+#define	GATE_CLK_RXU11			98
+#define	GATE_CLK_RXU12			99
+#define	GATE_CLK_RXU13			100
+#define	GATE_CLK_RXU14			101
+#define	GATE_CLK_RXU15			102
+#define	GATE_CLK_RXU16			103
+#define	GATE_CLK_RXU17			104
+#define	GATE_CLK_RXU18			105
+#define	GATE_CLK_RXU19			106
+#define	GATE_CLK_RXU20			107
+#define	GATE_CLK_RXU21			108
+#define	GATE_CLK_RXU22			109
+#define	GATE_CLK_RXU23			110
+#define	GATE_CLK_RXU24			111
+#define	GATE_CLK_RXU25			112
+#define	GATE_CLK_RXU26			113
+#define	GATE_CLK_RXU27			114
+#define	GATE_CLK_RXU28			115
+#define	GATE_CLK_RXU29			116
+#define	GATE_CLK_RXU30			117
+#define	GATE_CLK_RXU31			118
+#define	GATE_CLK_MP0			119
+#define	GATE_CLK_MP1			120
+#define	GATE_CLK_MP2			121
+#define	GATE_CLK_MP3			122
+#define	GATE_CLK_MP4			123
+#define	GATE_CLK_MP5			124
+#define	GATE_CLK_MP6			125
+#define	GATE_CLK_MP7			126
+#define	GATE_CLK_MP8			127
+#define	GATE_CLK_MP9			128
+#define	GATE_CLK_MP10			129
+#define	GATE_CLK_MP11			130
+#define	GATE_CLK_MP12			131
+#define	GATE_CLK_MP13			132
+#define	GATE_CLK_MP14			133
+#define	GATE_CLK_MP15			134
+
+/* MUX clocks */
+#define	MUX_CLK_DDR01			135
+#define	MUX_CLK_DDR23			136
+#define	MUX_CLK_RP_CPU_NORMAL		137
+#define	MUX_CLK_AXI_DDR			138
+
+/* PLL clocks */
+#define	MPLL_CLK			139
+#define	FPLL_CLK			140
+#define	DPLL0_CLK			141
+#define	DPLL1_CLK			142
+
+#endif /* __DT_BINDINGS_CLOCK_SOPHGO_SG2042_H__ */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
