Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1B9C25B75
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jun 2024 08:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3F4x5IWmzmj4hGMUxmLSkQPAGvza5Fg6JgO3y5+Y5w8=; b=h6gshlY5hybgCi
	txHrvwEL4nn5kbF7ddY9A1cnNwpclyCcznCk/pG7D5ph9D6ez5RbdP063XJa5MWk/WWwtitOSQYXv
	Oo2OM0JGtYjWdSdzuYhIveiEycuopANK2ho0ae8a3xuxMuXPc8hFjE9tGq1/gVUoINDFq8HbngfQ7
	O0hQ3qniTCh1Pa0ZCmOcY7BQhtxhFc5v5yFCaExauIyjVL2ctqFJ7yWno8IRUcWERh/OvND7jQkYc
	9YAyLWijvGXnlhZlDUYjXoym2qfNYTsQDh6twdA5om+dEWcgeV8wgPy3/XhruSop/QgWNCUhs1KOB
	4Y9vdD9eBALvNnG+9rHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8cT-00000008rfW-49iV;
	Thu, 06 Jun 2024 08:37:13 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8cP-00000008rcz-1PAc
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jun 2024 08:37:11 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3d1fd55081fso371572b6e.2
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jun 2024 01:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717663028; x=1718267828; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8opjtw7E6Owm3J+oN3RnmVvErLdJ2j/4R+JSvdM2kQ=;
        b=iLNweKLI6eksjAAw+fHZICeuzEGlrY44OSK9yZ+sepN70+J4ACtBk84vMZWOtb/1t3
         fnkkmD5He4+Zmz3kPuvQEeeNIuAQ0GdRyrEVPKkyWlfCJnl33iBB+sSy9JqO3wRkDO9b
         abEVlCf/wv/mTuYo72QzJ83JqnHcfuGTuNQUSS1WGizSgriufaFH18hVD8WJT7HAdmVH
         D6VW7+GntKF1HG9TiQtWdz3vbqhea+o/lSZ/QG4Lz0MMJy9pvb315h1Ra1D6Z6QILrv1
         tqo65XShyiQpUnypRIGDuAiuhOBDxZcJLdGi8FIHLoLp3Ov8Sw+2iMM3M1RgjoJMWO7i
         fQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717663028; x=1718267828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8opjtw7E6Owm3J+oN3RnmVvErLdJ2j/4R+JSvdM2kQ=;
        b=ID7nw2/DhiP0MWcUhh1wwMRjPhCTOOb4lrOaH9T0iyMEnvrlKvoozZndsK48EeqSAy
         FpRAcGfoHLiqJBS7ijFW3frzS3Xde1JELDRqTcNxikpYIQeki15wmfs6c4zNHBM+TkWT
         Bg9i1F6N+Tn7CCZ14vYqnGOzeFXUPgKMI9FV34XCiRmkaIM8kSaHsINzzBlhUpEwUSyL
         PoqweJdJxBOu6pTM614x6XpMBSzqLZh91XYPOpHrNjArvxVE7UYHOwIdEReRKwtcv+o0
         g5LNwSz/uEM/z3A0ueE1cv9e+7mcwXd3GcpOt6UfF7ANo52yrUwq/AkA4hlpfNhSQub0
         cnUw==
X-Forwarded-Encrypted: i=1; AJvYcCWZv8ssINjahpeZ3ZP0n8th9wm9mRcUtizSlMI9UqtC0K9C9XUAusIHFCfLtBNoeZLTfT79I0P4X0isekcg470FGPDPyiwoPEtSg5AebkPd
X-Gm-Message-State: AOJu0YwjSip4uL8efuNcQDBK53d801wF8Z4pU1o2AJdVSPOJhj4s09bM
	7G10hkJ0Adz4UW7EqFWu6y4v4jmtda/tQD2grbtuC1CXzfjidusK
X-Google-Smtp-Source: AGHT+IECm7aGjp6g86XhpkUvPc+wFLgToOxVseP3nuDIdCUXie6SSBQmebK/XUxF4WAf4sGKQC95RA==
X-Received: by 2002:a05:6808:1899:b0:3d1:bf70:6ca with SMTP id 5614622812f47-3d2043da8a8mr5195049b6e.52.1717663028426;
        Thu, 06 Jun 2024 01:37:08 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d20b69e4d5sm174137b6e.25.2024.06.06.01.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 01:37:08 -0700 (PDT)
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
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v16 3/5] dt-bindings: clock: sophgo: add clkgen for SG2042
Date: Thu,  6 Jun 2024 16:37:01 +0800
Message-Id: <0159f5cdd9b42ec487001fe034bf6a94f45fd182.1717661798.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717661798.git.unicorn_wang@outlook.com>
References: <cover.1717661798.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_013709_430735_1BD9EDE7 
X-CRM114-Status: GOOD (  13.72  )
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

Add bindings for the clock generator of divider/mux and gates working
for other subsystem than RP subsystem for Sophgo SG2042.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/clock/sophgo,sg2042-clkgen.yaml  |  61 ++++++++++
 .../dt-bindings/clock/sophgo,sg2042-clkgen.h  | 111 ++++++++++++++++++
 2 files changed, 172 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml
 create mode 100644 include/dt-bindings/clock/sophgo,sg2042-clkgen.h

diff --git a/Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml b/Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml
new file mode 100644
index 000000000000..e7a9255bcb58
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/sophgo,sg2042-clkgen.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 Clock Generator for divider/mux/gate
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
+  clocks:
+    items:
+      - description: Main PLL
+      - description: Fixed PLL
+      - description: DDR PLL 0
+      - description: DDR PLL 1
+
+  clock-names:
+    items:
+      - const: mpll
+      - const: fpll
+      - const: dpll0
+      - const: dpll1
+
+  '#clock-cells':
+    const: 1
+    description:
+      See <dt-bindings/clock/sophgo,sg2042-clkgen.h> for valid indices.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@30012000 {
+      compatible = "sophgo,sg2042-clkgen";
+      reg = <0x30012000 0x1000>;
+      clocks = <&pllclk 0>,
+               <&pllclk 1>,
+               <&pllclk 2>,
+               <&pllclk 3>;
+      clock-names = "mpll",
+                    "fpll",
+                    "dpll0",
+                    "dpll1";
+      #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/sophgo,sg2042-clkgen.h b/include/dt-bindings/clock/sophgo,sg2042-clkgen.h
new file mode 100644
index 000000000000..84f7857317a2
--- /dev/null
+++ b/include/dt-bindings/clock/sophgo,sg2042-clkgen.h
@@ -0,0 +1,111 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/*
+ * Copyright (C) 2023 Sophgo Technology Inc. All rights reserved.
+ */
+
+#ifndef __DT_BINDINGS_SOPHGO_SG2042_CLKGEN_H__
+#define __DT_BINDINGS_SOPHGO_SG2042_CLKGEN_H__
+
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
+
+#define GATE_CLK_DDR01_DIV0		81
+#define GATE_CLK_DDR23_DIV0		82
+
+#define GATE_CLK_DDR01			83
+#define GATE_CLK_DDR23			84
+#define GATE_CLK_RP_CPU_NORMAL		85
+#define GATE_CLK_AXI_DDR		86
+
+#define MUX_CLK_DDR01			87
+#define MUX_CLK_DDR23			88
+#define MUX_CLK_RP_CPU_NORMAL		89
+#define MUX_CLK_AXI_DDR			90
+
+#endif /* __DT_BINDINGS_SOPHGO_SG2042_CLKGEN_H__ */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
