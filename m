Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F2ACD4F25
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 09:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uvEEWKU/RNVIaAPqWmsIpbC/nbwtueKKk6m/Ro5ATEc=; b=HXg5bx2A6dOv66
	GQxk6h+OW7bA4vVB7w1ZU33Hj5dcfPZxZ5Elw9Aa+CAhYvU0zgQ4L6CBeO/9jP7y7vKk3FFaKmxYR
	/iWGqzd0AThpSH6O/Bh6bdBCan/fyoDfetYJrgTHzrE4u+ZD/FsnXwpH+ySM/jl9ecEPCFsoCmHW9
	dqrrwd+bAlego5UmeA99S8lpm0Yf4caENNWR5Ve5V7xaxTRLewmpX9Ahj1h1u+8/ySOvIgGJ8leB6
	2QvbpvOebQcIW463xk4JZhiQN26+m4QGFrjoa9wjk2zyBu2zQAi9qKJaYpQsAKTlsuMKHknXr2IV3
	bBswNW5utAR130LHJuzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSMg-000000053gZ-3ENx;
	Thu, 14 May 2026 09:28:22 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSMf-000000053fy-0gZb
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 09:28:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1778750896; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WWMNdVP+MhRYKyk9C+WGGH1m6P9M4H4KIpLfkYGtdno3T2NOp2qoK+rlCTKkDZ17igbDcpfroLlvE6Q5M1e1M60+VbiPDeUsKogfRCY2G6DzaRli0FcsQJqCyDlt+ek4nRL2BxCeMYfhCTKTB4PfZKZmydMHa3+HPxv8OLqyXBw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778750896; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jKJdbyXrw9VTi0yEwx04OeNrLBgPlknmx6N2taLjqjU=; 
	b=CCxL4Cu74NpQLN0VM/SK6AkGCxNfKelFpojCWljbKjxDwDlJy6WeOCy5JSaK2cyD7gw9Db5odO3gIdgrSDWUV6cl3MOZPnvIplt9YkwH1J/+PxCnoztWstJytRcIwpCdIR0lOK7pd/eqwOl1M4A7X61GMqVkejv6+xUhws5hLI0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778750896;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=jKJdbyXrw9VTi0yEwx04OeNrLBgPlknmx6N2taLjqjU=;
	b=AEbZy3gmqNCGQSqy3bjBRcMhsX0cUY4d90mEV5ffv4RBlOUabKfcYbvrW/Ngpjv0
	HezbX+9XRkZfjZH19V34bQ47/4549vQpGEEIkF9wsCVcCz1LyXxzR2+WCI+RnoOKeVQ
	Mm6Qo869hF218zLcFPpvNYnRrcSzOr4pWJLCAvgw=
Received: by mx.zohomail.com with SMTPS id 1778750894589707.3429527761551;
	Thu, 14 May 2026 02:28:14 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Thu, 14 May 2026 17:27:18 +0800
Subject: [PATCH v5 2/6] dt-bindings: clock: add Anlogic DR1V90 CRU
MIME-Version: 1.0
Message-Id: <20260514-dr1v90-cru-v5-2-34f3021aab51@pigmoral.tech>
References: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
In-Reply-To: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778750853; l=5045;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=88jiGfzMakks4bYP+7RcAmlZMDkHMNAvLD8mDKc1xmI=;
 b=m5dNSagAVeYMl0bQ6YIPZf4W1jlFAeb1IBVuJVKC0GkhV5kB5L6OYPi5eQWzR4h7pcO2foD3f
 XgnVQSwsb6BDRxAdjIH0GWg5Y4hDV12TCQG9H9sVnbyjAZVjvAxY6EE
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_022821_238826_83BA1F76 
X-CRM114-Status: GOOD (  10.35  )
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

Add the Clock and Reset Unit (CRU) support for the Anlogic DR1V90 SoC,
which is responsible for clock and reset management.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../bindings/clock/anlogic,dr1v90-cru.yaml         | 60 ++++++++++++++++++++++
 include/dt-bindings/clock/anlogic,dr1v90-cru.h     | 46 +++++++++++++++++
 include/dt-bindings/reset/anlogic,dr1v90-cru.h     | 41 +++++++++++++++
 3 files changed, 147 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml b/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
new file mode 100644
index 000000000000..11a92588e494
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/anlogic,dr1v90-cru.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/anlogic,dr1v90-cru.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Anlogic DR1V90 Clock and Reset Unit (CRU)
+
+maintainers:
+  - Junhui Liu <junhui.liu@pigmoral.tech>
+
+properties:
+  compatible:
+    const: anlogic,dr1v90-cru
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Main oscillator
+      - description: External CAN clock
+      - description: External WDT clock
+
+  clock-names:
+    items:
+      - const: osc
+      - const: can_ext
+      - const: wdt_ext
+
+  "#clock-cells":
+    const: 1
+    description:
+      Refer <dt-bindings/clock/anlogic,dr1v90-cru.h> for valid indices.
+
+  "#reset-cells":
+    const: 1
+    description:
+      Refer <dt-bindings/reset/anlogic,dr1v90-cru.h> for valid indices.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@f8801000 {
+        compatible = "anlogic,dr1v90-cru";
+        reg = <0xf8801000 0x400>;
+        clocks = <&osc>, <&can_ext>, <&wdt_ext>;
+        clock-names = "osc", "can_ext", "wdt_ext";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/anlogic,dr1v90-cru.h b/include/dt-bindings/clock/anlogic,dr1v90-cru.h
new file mode 100644
index 000000000000..664daf3946a7
--- /dev/null
+++ b/include/dt-bindings/clock/anlogic,dr1v90-cru.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2024-2025 Anlogic, Inc.
+ * Copyright (C) 2025 Junhui Liu <junhui.liu@pigmoral.tech>
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_ANLOGIC_DR1V90_CRU_H_
+#define _DT_BINDINGS_CLOCK_ANLOGIC_DR1V90_CRU_H_
+
+#define CLK_OSC_DIV2		0
+#define CLK_CPU_PLL		1
+#define CLK_CPU_PLL_4X		2
+#define CLK_CPU_4X		3
+#define CLK_CPU_2X		4
+#define CLK_CPU_1X		5
+#define CLK_IO_PLL		6
+#define CLK_IO_1000M		7
+#define CLK_IO_400M		8
+#define CLK_IO_25M		9
+#define CLK_IO_80M		10
+#define CLK_IO_400M_DIV2	11
+#define CLK_IO_400M_DIV4	12
+#define CLK_IO_400M_DIV8	13
+#define CLK_IO_400M_DIV16	14
+#define CLK_QSPI		15
+#define CLK_SPI			16
+#define CLK_SMC			17
+#define CLK_SDIO		18
+#define CLK_GPIO_DB		19
+#define CLK_EFUSE		20
+#define CLK_TVS			21
+#define CLK_TRNG		22
+#define CLK_OSC_DIV		23
+#define CLK_PWM			24
+#define CLK_FCLK0		25
+#define CLK_FCLK1		26
+#define CLK_FCLK2		27
+#define CLK_FCLK3		28
+#define CLK_WDT_SEL		29
+#define CLK_EFUSE_SEL		30
+#define CLK_CAN_SEL		31
+#define CLK_CPU_SEL		32
+#define CLK_CAN0		33
+#define CLK_CAN1		34
+
+#endif /* _DT_BINDINGS_CLOCK_ANLOGIC_DR1V90_CRU_H_ */
diff --git a/include/dt-bindings/reset/anlogic,dr1v90-cru.h b/include/dt-bindings/reset/anlogic,dr1v90-cru.h
new file mode 100644
index 000000000000..c5b7aae1ab6a
--- /dev/null
+++ b/include/dt-bindings/reset/anlogic,dr1v90-cru.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2025 Junhui Liu <junhui.liu@pigmoral.tech>
+ */
+
+#ifndef _DT_BINDINGS_RESET_ANLOGIC_DR1V90_CRU_H_
+#define _DT_BINDINGS_RESET_ANLOGIC_DR1V90_CRU_H_
+
+#define RESET_OCM		0
+#define RESET_QSPI		1
+#define RESET_SMC		2
+#define RESET_WDT		3
+#define RESET_DMAC_AXI		4
+#define RESET_DMAC_AHB		5
+#define RESET_NPU		6
+#define RESET_JPU		7
+#define RESET_DDRBUS		8
+#define RESET_NIC_HP0		9
+#define RESET_NIC_HP1		10
+#define RESET_NIC_GP0M		11
+#define RESET_NIC_GP1M		12
+#define RESET_GPIO		13
+#define RESET_IPC		14
+#define RESET_USB0		15
+#define RESET_USB1		16
+#define RESET_GBE0		17
+#define RESET_GBE1		18
+#define RESET_SDIO0		19
+#define RESET_SDIO1		20
+#define RESET_UART0		21
+#define RESET_UART1		22
+#define RESET_SPI0		23
+#define RESET_SPI1		24
+#define RESET_CAN0		25
+#define RESET_CAN1		26
+#define RESET_TTC0		27
+#define RESET_TTC1		28
+#define RESET_I2C0		29
+#define RESET_I2C1		30
+
+#endif /* _DT_BINDINGS_RESET_ANLOGIC_DR1V90_CRU_H_ */

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
