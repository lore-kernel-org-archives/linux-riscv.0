Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB75C04FE1
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 06:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2BmZFcdtFfE6tTG8f8XNQ1HYxkenFHj/Co9zEhm58HI=; b=SN8iCBilL7guxp
	yGdWDk9yJ5klVWESinRkhU03vVAgfuXNIIlhkaAkA8ZjcSqisAMXpzfmpAGec30jHP7KS/SZ+S5k+
	8JbcqpwyxunzxQ50DyLgrqE7l1r3CI3bBtBSW2vg0P4qbyK/0K7GQlrKItCfVgOk7Ftos0QnW2DnH
	rJ+3k4QDL0OQA4Dmiu1lWZ2FAGh7TLHQsD0O2ru/fWI+bSurIhHZ1sKYIWQzmkwwxcTHRRkqf9KcG
	RY/1NglncUulxzZSu5l8ASXbfAWbZ4jr2fDIMNxaugha/vqNRdoNyUxjV7NCGpMpeRBAffHFpXPqe
	AD7uH1BiYfidvOckgmSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGZrA-00CMAb-0u;
	Tue, 04 Jul 2023 06:49:48 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGZr6-00CM6Z-0k
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 06:49:47 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id A7211814B;
	Tue,  4 Jul 2023 14:49:16 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 4 Jul
 2023 14:49:16 +0800
Received: from localhost.localdomain (113.72.144.31) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 4 Jul
 2023 14:49:15 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng
	<hal.feng@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>, "William
 Qiu" <william.qiu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: [RESEND PATCH v6 1/7] dt-bindings: clock: Add StarFive JH7110 PLL clock generator
Date: Tue, 4 Jul 2023 14:46:04 +0800
Message-ID: <20230704064610.292603-2-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230704064610.292603-1-xingyu.wu@starfivetech.com>
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.144.31]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_234944_631322_BAB98F33 
X-CRM114-Status: GOOD (  13.18  )
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

Add bindings for the PLL clock generator on the JH7110 RISC-V SoC.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../bindings/clock/starfive,jh7110-pll.yaml   | 46 +++++++++++++++++++
 .../dt-bindings/clock/starfive,jh7110-crg.h   |  6 +++
 2 files changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml

diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
new file mode 100644
index 000000000000..beb78add5a8d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/starfive,jh7110-pll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 PLL Clock Generator
+
+description:
+  These PLLs are high speed, low jitter frequency synthesizers in JH7110.
+  Each PLL works in integer mode or fraction mode, with configuration
+  registers in the sys syscon. So the PLLs node should be a child of
+  SYS-SYSCON node.
+  The formula for calculating frequency is
+  Fvco = Fref * (NI + NF) / M / Q1
+
+maintainers:
+  - Xingyu Wu <xingyu.wu@starfivetech.com>
+
+properties:
+  compatible:
+    const: starfive,jh7110-pll
+
+  clocks:
+    maxItems: 1
+    description: Main Oscillator (24 MHz)
+
+  '#clock-cells':
+    const: 1
+    description:
+      See <dt-bindings/clock/starfive,jh7110-crg.h> for valid indices.
+
+required:
+  - compatible
+  - clocks
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller {
+      compatible = "starfive,jh7110-pll";
+      clocks = <&osc>;
+      #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/starfive,jh7110-crg.h b/include/dt-bindings/clock/starfive,jh7110-crg.h
index 06257bfd9ac1..086a6ddcf380 100644
--- a/include/dt-bindings/clock/starfive,jh7110-crg.h
+++ b/include/dt-bindings/clock/starfive,jh7110-crg.h
@@ -6,6 +6,12 @@
 #ifndef __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
 #define __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
 
+/* PLL clocks */
+#define JH7110_CLK_PLL0_OUT			0
+#define JH7110_CLK_PLL1_OUT			1
+#define JH7110_CLK_PLL2_OUT			2
+#define JH7110_PLLCLK_END			3
+
 /* SYSCRG clocks */
 #define JH7110_SYSCLK_CPU_ROOT			0
 #define JH7110_SYSCLK_CPU_CORE			1
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
