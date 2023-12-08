Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9B8C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 01:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gqwPPfI2iJImzdsPAwhp7kCARoo/f1guV+r+JBWXMjs=; b=VJBMkvM5DT0yni
	e7jx+hsUuiIndWXyUyQJDEFZWT+SY3EK3LiboZeMeUdgRD9mFkoN552cOAJm2R5yX5dvKN93dibvI
	pckVUqggn/Y9FTSfE/NMN0xspqj8lj1uIH2UE+A5luZTA6FauzIwr8X8bcXDvfkZjcbv0IsLWwaIU
	YiaHvFoghOpbdSB8d9amCIPQndKbQiA+e8PK84BH2R0ZPFR43Dq/Zu33YcXtjL3j47fN79qkUPztP
	0VKsx6Q6Fh95cbFM/L7ni5x/XoF+md9FjcCGW9ZZD1CwwL4Xtf6oGPLcklIgSTDlOjZ8mdD1T/qzU
	ViJjxZq99XaincEp1sJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBPRZ-00ER3B-10;
	Fri, 08 Dec 2023 01:14:17 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBPRV-00ER2P-2g
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 01:14:15 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3b86f3cdca0so1023402b6e.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 17:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701998052; x=1702602852; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qccLWb2i68kc/cXCxeoTyRZxhRO/5hipb5+NfkBkZB0=;
        b=ONieWhkLs+y3W6ah4M4KTB1Re/St6vXMCgVmSaWPvJTIg0+yphNszM+f3HLNa4oLcL
         KPuISqDv2mlmu6zp5hThHDq5l6Xq84FNFpKMr92j0gjJHDBLRHk4s231m9U29ks0BbJN
         t0giO+GYhLR/6LJz+woq+cpJPCOChyjtjNVix1DsYQUigKKLpC8UY1q29F/m3n/bUIeB
         QpSZcOqyQfEWaI+JdLj078Sq4N/lxvYiLFqdg8+Qpa3llWqCj/I0tWkBd+KhcC1TgsGd
         ZlZy/DL3G+u0TAR7XC5JAi/ajUWmM+0i0eaSbxEsEvI2zcmAy+6D0D2g+EpJ85FgmMIu
         t4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701998052; x=1702602852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qccLWb2i68kc/cXCxeoTyRZxhRO/5hipb5+NfkBkZB0=;
        b=g6HO7krJytVxj9ARpNd8R5fDwKaAdQjeviQzsfA1NIPAvE5PjA/8Y0y9YYQIJCO2o1
         plEAIFdVTAoPRgEPwjjJLHSc0p3UvoZ/HCajRkh1YCJf+LulUnmXLMwJVYvguOVUbADI
         awCNNKoEuHB821aIUCGOd5IRvjZU/YOSVVHdgLP3eO95v+JJMVbtSAaXsr0DHee4a/Mm
         xI3QFiNrjK9GhABhAtlVpxNE9Xn1x4gQeIgg/Kh+9LZr9LmE1p98xyG0yzQ8ImYbm4Xv
         vqG9upPGObX4I7u0HShP5INqXcBd6KraaGT0uRF+WCcim5Yr5jMj+NVHcIdqqX6TjfKN
         Vvog==
X-Gm-Message-State: AOJu0Yz0M7gPGdkSpZQHb+97N27HZhl87Nj/Yub4abh5rOz3nVKCuZdu
	+QV8ls0gcIR0ho67VcfX+7o=
X-Google-Smtp-Source: AGHT+IFRI0fWqmZmhOi8iNDZzqwjUrljsTu6qvwOoh6VznQNB/80xXXy9RfZXu8Ykcg4FeKel+vPHA==
X-Received: by 2002:a05:6808:15a1:b0:3b9:dd70:766a with SMTP id t33-20020a05680815a100b003b9dd70766amr2303053oiw.14.1701998052018;
        Thu, 07 Dec 2023 17:14:12 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id r5-20020a056808210500b003b85c2b17efsm165186oiw.9.2023.12.07.17.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 17:14:11 -0800 (PST)
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
Subject: [PATCH v6 2/4] dt-bindings: clock: sophgo: support SG2042
Date: Fri,  8 Dec 2023 09:14:02 +0800
Message-Id: <6f456da5355f451309de0b1b420433ed65dab3c3.1701997033.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701997033.git.unicorn_wang@outlook.com>
References: <cover.1701997033.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_171413_876627_096756A2 
X-CRM114-Status: GOOD (  14.47  )
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
 .../bindings/clock/sophgo,sg2042-clkgen.yaml  |  53 ++++++
 .../dt-bindings/clock/sophgo,sg2042-clkgen.h  | 169 ++++++++++++++++++
 2 files changed, 222 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml
 create mode 100644 include/dt-bindings/clock/sophgo,sg2042-clkgen.h

diff --git a/Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml b/Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml
new file mode 100644
index 000000000000..f9935e66fc95
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/sophgo,sg2042-clkgen.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 Clock Generator
+
+maintainers:
+  - Chen Wang <unicorn_wang@outlook.com>
+
+properties:
+  compatible:
+    const: sophgo,sg2042-clkgen
+
+  reg:
+    maxItems: 1
+
+  sophgo,system-ctrl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to SG2042 System Controller node. On SG2042, part of control
+      registers of Clock Controller are defined in System controller. Clock
+      driver will use this phandle to get the register map base to plus the
+      offset of the registers to access them.
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
+  - sophgo,system-ctrl
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
+        sophgo,system-ctrl = <&sys_ctrl>;
+        clocks = <&cgi>;
+        #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/sophgo,sg2042-clkgen.h b/include/dt-bindings/clock/sophgo,sg2042-clkgen.h
new file mode 100644
index 000000000000..78cd3c3efdb6
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
+#define DIV_CLK_MPLL_RP_CPU_NORMAL_0	0
+#define DIV_CLK_MPLL_AXI_DDR_0		1
+#define DIV_CLK_FPLL_DDR01_1		2
+#define DIV_CLK_FPLL_DDR23_1		3
+#define DIV_CLK_FPLL_RP_CPU_NORMAL_1	4
+#define DIV_CLK_FPLL_50M_A53		5
+#define DIV_CLK_FPLL_TOP_RP_CMN_DIV2	6
+#define DIV_CLK_FPLL_UART_500M		7
+#define DIV_CLK_FPLL_AHB_LPC		8
+#define DIV_CLK_FPLL_EFUSE		9
+#define DIV_CLK_FPLL_TX_ETH0		10
+#define DIV_CLK_FPLL_PTP_REF_I_ETH0	11
+#define DIV_CLK_FPLL_REF_ETH0		12
+#define DIV_CLK_FPLL_EMMC		13
+#define DIV_CLK_FPLL_SD			14
+#define DIV_CLK_FPLL_TOP_AXI0		15
+#define DIV_CLK_FPLL_TOP_AXI_HSPERI	16
+#define DIV_CLK_FPLL_AXI_DDR_1		17
+#define DIV_CLK_FPLL_DIV_TIMER1		18
+#define DIV_CLK_FPLL_DIV_TIMER2		19
+#define DIV_CLK_FPLL_DIV_TIMER3		20
+#define DIV_CLK_FPLL_DIV_TIMER4		21
+#define DIV_CLK_FPLL_DIV_TIMER5		22
+#define DIV_CLK_FPLL_DIV_TIMER6		23
+#define DIV_CLK_FPLL_DIV_TIMER7		24
+#define DIV_CLK_FPLL_DIV_TIMER8		25
+#define DIV_CLK_FPLL_100K_EMMC		26
+#define DIV_CLK_FPLL_100K_SD		27
+#define DIV_CLK_FPLL_GPIO_DB		28
+#define DIV_CLK_DPLL0_DDR01_0		29
+#define DIV_CLK_DPLL1_DDR23_0		30
+
+/* Gate clocks */
+#define GATE_CLK_RP_CPU_NORMAL_DIV0	31
+#define GATE_CLK_AXI_DDR_DIV0		32
+
+#define GATE_CLK_RP_CPU_NORMAL_DIV1	33
+#define GATE_CLK_A53_50M		34
+#define GATE_CLK_TOP_RP_CMN_DIV2	35
+#define GATE_CLK_HSDMA			36
+#define GATE_CLK_EMMC_100M		37
+#define GATE_CLK_SD_100M		38
+#define GATE_CLK_TX_ETH0		39
+#define GATE_CLK_PTP_REF_I_ETH0		40
+#define GATE_CLK_REF_ETH0		41
+#define GATE_CLK_UART_500M		42
+#define GATE_CLK_EFUSE			43
+
+#define GATE_CLK_AHB_LPC		44
+#define GATE_CLK_AHB_ROM		45
+#define GATE_CLK_AHB_SF			46
+
+#define GATE_CLK_APB_UART		47
+#define GATE_CLK_APB_TIMER		48
+#define GATE_CLK_APB_EFUSE		49
+#define GATE_CLK_APB_GPIO		50
+#define GATE_CLK_APB_GPIO_INTR		51
+#define GATE_CLK_APB_SPI		52
+#define GATE_CLK_APB_I2C		53
+#define GATE_CLK_APB_WDT		54
+#define GATE_CLK_APB_PWM		55
+#define GATE_CLK_APB_RTC		56
+
+#define GATE_CLK_AXI_PCIE0		57
+#define GATE_CLK_AXI_PCIE1		58
+#define GATE_CLK_SYSDMA_AXI		59
+#define GATE_CLK_AXI_DBG_I2C		60
+#define GATE_CLK_AXI_SRAM		61
+#define GATE_CLK_AXI_ETH0		62
+#define GATE_CLK_AXI_EMMC		63
+#define GATE_CLK_AXI_SD			64
+#define GATE_CLK_TOP_AXI0		65
+#define GATE_CLK_TOP_AXI_HSPERI		66
+
+#define GATE_CLK_TIMER1			67
+#define GATE_CLK_TIMER2			68
+#define GATE_CLK_TIMER3			69
+#define GATE_CLK_TIMER4			70
+#define GATE_CLK_TIMER5			71
+#define GATE_CLK_TIMER6			72
+#define GATE_CLK_TIMER7			73
+#define GATE_CLK_TIMER8			74
+#define GATE_CLK_100K_EMMC		75
+#define GATE_CLK_100K_SD		76
+#define GATE_CLK_GPIO_DB		77
+
+#define GATE_CLK_AXI_DDR_DIV1		78
+#define GATE_CLK_DDR01_DIV1		79
+#define GATE_CLK_DDR23_DIV1		80
+/* DPLL0 */
+#define GATE_CLK_DDR01_DIV0		81
+/* DPLL1 */
+#define GATE_CLK_DDR23_DIV0		82
+
+#define GATE_CLK_DDR01			83
+#define GATE_CLK_DDR23			84
+#define GATE_CLK_RP_CPU_NORMAL		85
+#define GATE_CLK_AXI_DDR		86
+#define GATE_CLK_RXU0			87
+#define GATE_CLK_RXU1			88
+#define GATE_CLK_RXU2			89
+#define GATE_CLK_RXU3			90
+#define GATE_CLK_RXU4			91
+#define GATE_CLK_RXU5			92
+#define GATE_CLK_RXU6			93
+#define GATE_CLK_RXU7			94
+#define GATE_CLK_RXU8			95
+#define GATE_CLK_RXU9			96
+#define GATE_CLK_RXU10			97
+#define GATE_CLK_RXU11			98
+#define GATE_CLK_RXU12			99
+#define GATE_CLK_RXU13			100
+#define GATE_CLK_RXU14			101
+#define GATE_CLK_RXU15			102
+#define GATE_CLK_RXU16			103
+#define GATE_CLK_RXU17			104
+#define GATE_CLK_RXU18			105
+#define GATE_CLK_RXU19			106
+#define GATE_CLK_RXU20			107
+#define GATE_CLK_RXU21			108
+#define GATE_CLK_RXU22			109
+#define GATE_CLK_RXU23			110
+#define GATE_CLK_RXU24			111
+#define GATE_CLK_RXU25			112
+#define GATE_CLK_RXU26			113
+#define GATE_CLK_RXU27			114
+#define GATE_CLK_RXU28			115
+#define GATE_CLK_RXU29			116
+#define GATE_CLK_RXU30			117
+#define GATE_CLK_RXU31			118
+#define GATE_CLK_MP0			119
+#define GATE_CLK_MP1			120
+#define GATE_CLK_MP2			121
+#define GATE_CLK_MP3			122
+#define GATE_CLK_MP4			123
+#define GATE_CLK_MP5			124
+#define GATE_CLK_MP6			125
+#define GATE_CLK_MP7			126
+#define GATE_CLK_MP8			127
+#define GATE_CLK_MP9			128
+#define GATE_CLK_MP10			129
+#define GATE_CLK_MP11			130
+#define GATE_CLK_MP12			131
+#define GATE_CLK_MP13			132
+#define GATE_CLK_MP14			133
+#define GATE_CLK_MP15			134
+
+/* MUX clocks */
+#define MUX_CLK_DDR01			135
+#define MUX_CLK_DDR23			136
+#define MUX_CLK_RP_CPU_NORMAL		137
+#define MUX_CLK_AXI_DDR			138
+
+/* PLL clocks */
+#define MPLL_CLK			139
+#define FPLL_CLK			140
+#define DPLL0_CLK			141
+#define DPLL1_CLK			142
+
+#endif /* __DT_BINDINGS_CLOCK_SOPHGO_SG2042_H__ */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
