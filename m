Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E611C47258
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 06:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VcKnCmui9+FdtYyLnPkDY3REw3WyCjYBOvmFaunLFu8=; b=skrgSbcl16Dzy6
	yljbcp2iFBTQa3M789EKhJbVGWzGqIqgDlkiVjnQMfN2WXQUKbrZS6KjjUSmbZIhI6jN7swDmprds
	y6SheW7CauqcRuq8AEueKFRmtEo5/VonJ1/S+SbGdvtbb/pwwo2ghmN8VnWSd1dQAJs+kNx9HbkGM
	zWileDNob2tDTZx5DMcMp95zLW6nlugP0FK4K4GbtVCzHdGZNePPxSHBgYkAtDfghYmo8r+M0AeFA
	HvpI022Z40r4MFzZVGZe4ck7Oq54U0A86Y0C20CH1kzVagQiIM6DQws00Qnt+MAO0oC3CZmHhNRUn
	nFa9Erp7uqIYrq8Mxd0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVnFu-0000000ASZT-3idx;
	Fri, 02 Feb 2024 06:42:30 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVnFr-0000000ASXR-2vW2
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 06:42:29 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-210c535a19bso984284fac.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Feb 2024 22:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706856146; x=1707460946; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kknUoT/coBH2uTSWG3cm92iTq0wGRuLA6NNcwJn/zvI=;
        b=GjYuAYZUv7ZhL+nbO1BVhzUyxCOy0l51d5Yf/eXuwyKSwT+1/DUBWMvVI4dA2VCNYO
         7Y04RUldGJb7R4+JvKFrDoo4pJIpt4ZwHbIV5WzBSo60HaKI+m+0176jQmTWsk+OpUUS
         01lidI1nEzflygY/l33181G6h9YrOfF7g9Do81PiBN0MlKswZZQHaQl3uc81fjb3c6iS
         trqr/D/Va7v3rIPHq0D398BloghhZQsBjppBcBxkcZVQijuRqaeip/BprehWlTjaOI8u
         lC2NjnH2jO/cFbjciiJ/Z6UUQRj4ysUgYF+dNO+5E/i9q8ba5oNhdx1ERzv5HUrOs8Ck
         8DZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706856146; x=1707460946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kknUoT/coBH2uTSWG3cm92iTq0wGRuLA6NNcwJn/zvI=;
        b=S6lQFHNsFg8ORk1gv6koztnIUMIL1C9MSQe4eGmwBEmFcyDGWi3qq2iGIcPgajOCpE
         33tAVaV7r4iW3lrmmdcTefmN6dW/aEonC+qrjyZvNHHFJd+62Seh1bgMaqhwN+uZa7z4
         WcXXTa3+azRjKjKQ3ZPbDsNG/frN6wf5LlmKuNRH8SS+OjvzrZzge4y/binTyCG2aUB+
         rgrfx1sDHVXuufBTXdojMM5H745RcoprfSj3wThBYb/ot7yRKjGsDaGtyCrZOU3LwFmX
         ceagN7r1nrqLM2yYZYWy3Kj9gCRSD9FCQf1PgnW9uEaRtg0VYvlSpLdNrfwt2k/X7dJY
         YskA==
X-Gm-Message-State: AOJu0YyoPoNqg+sgehzfzB9TUL57nG2o8+qOBQOro9TVPrHkLd9l0NC2
	amIktrOVcTU/xXcB1wE4ga0XTvnUSOhjHPJEujR4HD4ruZ1gNXzd
X-Google-Smtp-Source: AGHT+IGhrAceiVBG1MixpF+lGLW5e8xlWp28MbQ1WgOjzILbgXN9OxIGWUUTuXftu8ZXhD5K47b73g==
X-Received: by 2002:a05:6870:2305:b0:210:b468:6a5d with SMTP id w5-20020a056870230500b00210b4686a5dmr7859949oao.16.1706856145698;
        Thu, 01 Feb 2024 22:42:25 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWWJo6JTVJYeOEwW2ZPpCEoBhKGBeCiEHLDGAcBvl1pLsgqI+D6lTyXlNi0GbMrzvWxYpAFMhpybOzG2dpmGfIv0w3WzjiasR6R/H5V8FJOWNA20vEWBEh92p2aCPoebta2c6SBxwJCQIRANp/4atUC65BmpvnkjFgWLXude375JWXWCWTmIROIoKEQ3msCAU8jIO0n5qXO4q1npTeuNl43TUm8uRoDoIwu+1yeI5aR4NgPhXqz9v3nQTKTHk8P3iRuDXb9wtu28rrvPY7+seufwgv7aTPODRNn2EOCkiYD3k8o82QN4tJyuk8ppfXBkp+rx3deVO28h+hCQXrADXhlnOLXxiG1hbf8Go/+C09tNlfq3i0RmUMlgF6XK3AIRIf+jUQr/NFeXONRMRkEUcKcZ3Sactf9TwzR+r0s8PlU/pM5rPaLPzsWBaUhT6S/b2KNDcp+vb9oP7QlicgZabvXT4PvSkGsOott6eBO4ZZis73Kflf26kgiSiXy9OMinTZPb/jZO1KpOxp1aygpMIKyFWSt3Wt+GeM7ap7XA08YvVhExHY+n/oFo4Ox9doAISfIohXfzrerEljZwiBC+hCQ2ENYQzHvW/zPFOWbur16vl5vs5RdV0ChOBDEMtumPvbiFjmNefQYb6cjzNYmhJVizsDG5B2ykQ9jQZ33kV40lWY=
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id mm14-20020a0568700e8e00b0021892d2f44dsm335953oab.55.2024.02.01.22.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 22:42:25 -0800 (PST)
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
Subject: [PATCH v9 3/5] dt-bindings: clock: sophgo: add clkgen for SG2042
Date: Fri,  2 Feb 2024 14:42:18 +0800
Message-Id: <d666b1efe6051aad127f9fa0215922935e5ddc55.1706854074.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706854074.git.unicorn_wang@outlook.com>
References: <cover.1706854074.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_224227_771879_1DA96AEC 
X-CRM114-Status: GOOD (  13.82  )
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
---
 .../bindings/clock/sophgo,sg2042-clkgen.yaml  |  37 ++++++
 .../dt-bindings/clock/sophgo,sg2042-clkgen.h  | 111 ++++++++++++++++++
 2 files changed, 148 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml
 create mode 100644 include/dt-bindings/clock/sophgo,sg2042-clkgen.h

diff --git a/Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml b/Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml
new file mode 100644
index 000000000000..5c33eb20c76e
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml
@@ -0,0 +1,37 @@
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
+      compatible = "sophgo,sg2042-clkgen";
+      reg = <0x30012000 0x1000>;
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
