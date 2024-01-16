Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16DBC4706C
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 07:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4oSzPEm+YOJHAg2/0BWFNNX+021pM7AFLAMeFOA3upg=; b=LBUIqqOEwcVwzy
	a56DQcs8gj/QtAcOkfNzXpGSHrVVNOBI5mH9F1DhJiCKzb6u5c/UnRPtIeksJYI9OxP+8laSL5LsX
	cCuntrrw1yJQDxZhICBcUXOri6JecRKb60+UNKhzx3PaOe1qdc1myI2dyu1wyJ+ZYIqQT8spQVeWl
	bhHd55Vfzj8zaCW79SmRaxrgdKagwrOmPizz6rWsZAKG1qN7UURo3sKndv9kq99iJ0LDrDFqpvN6Y
	m8KSH75PBYCAKIOUqDptrUTbYL/CLOLJHCRVS9EHWPQXWsFngtxBjh9/4/2hOOPaahXkX9LKKJ5Gg
	eg86HGY9134etPwzSoMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPdmi-00BCRD-0P;
	Tue, 16 Jan 2024 07:22:56 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPdmd-00BCNg-2c
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jan 2024 07:22:53 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-204301f2934so6769141fac.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 23:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705389708; x=1705994508; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqr4Lsc+9ICnRlEvhlkS3+10M/kIcF4XlsWKAjrshfQ=;
        b=Mj99jibMQkSnSxS+8F+JxfN2Hf6hcu2qXa4Q4FhYrHPx68FzbKTjg92Wsg1BeugS51
         GGgnLO54K1qNCIUEO/Q/hwXW2IWZoo5qbPnd+ajtbti0P3xxgZVQr6ygs0x/z+nJ2Kl9
         cqzctarI/wKZHIr84UTHHuWe3P2i74t2W+/2yBd3KaNUNQwoGls2ZUMCffknZqRaJvBk
         JgsOBLgWi9UJqQrczf/EPRm3FFo837Hdm1zYwAJSxWH3b1lr6PHrJqKgM7LNJgFIzp4W
         shjEPXKzpUiQ/KWwcGDHrbJKo0WwCk7ADVBDeOCIHZrAIKXzJG8X/7IOnV+/YcYcoMfp
         DBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705389708; x=1705994508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sqr4Lsc+9ICnRlEvhlkS3+10M/kIcF4XlsWKAjrshfQ=;
        b=wf/Kft+XHMPO7V0/MCUKu9cASf1We0VxEoyuDtfz7PrnhSSlOL9nNiFOaKXZ9LxPPq
         VjF/o0VZ4TfaH3Qyslcfrq0f+3T8Q/iaM1pyISeXqMymKk5tqxoEoa+Xo/92UpjK1i5S
         Xhq+mTWbehvsnj73lHo33SieRuvShCK2l22bKedDYGYR4SUYyM53sDFdV7OskaKeNvGN
         V9HxpsVSW0X/8/xCSgiYepyeplFCb5tYE78BDJLLS8f1B4vSNnssyGhZ0AM4sNhvTj83
         Dq0qFz8rHZostebM0MC/x1wJwZdDnkLC1gRUMifGzFtgEIbc1mNV7upIaoMRzLhgA4g6
         wMAg==
X-Gm-Message-State: AOJu0Yw+m9dMQxhOUDI8RY9Vxj1sotAF2GPClMwr7u8sDUkHTzkaMuaN
	+FOllzFzXtBWw1HHmhQs5Sk=
X-Google-Smtp-Source: AGHT+IHLJtBztXGb0aE7CpSA9NtzasQ8/AqTSh8M2n8LA2qY5FyBvPCyh0Mo8domrvoQp+gpWggW3A==
X-Received: by 2002:a05:6870:9344:b0:206:c593:3111 with SMTP id j4-20020a056870934400b00206c5933111mr8359396oak.104.1705389707776;
        Mon, 15 Jan 2024 23:21:47 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id pf5-20020a0568717b0500b0020683d51a4csm2896892oac.46.2024.01.15.23.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 23:21:47 -0800 (PST)
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
Subject: [PATCH v8 3/5] dt-bindings: clock: sophgo: add clkgen for SG2042
Date: Tue, 16 Jan 2024 15:21:40 +0800
Message-Id: <089f2fbe3626ed9c17b02d09d57a1b77fd1dee6a.1705388518.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705388518.git.unicorn_wang@outlook.com>
References: <cover.1705388518.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_232251_851275_B60AEF04 
X-CRM114-Status: GOOD (  14.33  )
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

Add bindings for the clocks of which configuration registers are in the
range of CLOCK in the memory-map.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../bindings/clock/sophgo,sg2042-clkgen.yaml  |  40 +++++++
 .../dt-bindings/clock/sophgo,sg2042-clkgen.h  | 111 ++++++++++++++++++
 2 files changed, 151 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml
 create mode 100644 include/dt-bindings/clock/sophgo,sg2042-clkgen.h

diff --git a/Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml b/Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml
new file mode 100644
index 000000000000..4291889cd550
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/sophgo,sg2042-clkgen.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 Clock Generator
+
+description:
+  These clocks have configuration registers in the CLOCK range of memory-map.
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
+  '#clock-cells':
+    const: 1
+    description:
+      See <dt-bindings/clock/sophgo,sg2042-clkgen.h> for valid indices.
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@30012000 {
+        compatible = "sophgo,sg2042-clkgen";
+        reg = <0x30012000 0x1000>;
+        #clock-cells = <1>;
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
