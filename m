Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDAACCF9E5
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Oct 2025 14:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ldHvbw0oeq8lDLw6twjdmw1hRzAJw42UsgNBWcbM53Y=; b=421ivmuppnn8JC
	KcwltCgkzOU9tb3LW/kc4JaGaQ+Vd8mjdR0G6tZ0nfTuzyRPyhB7jxirJLtBBqTdzD8hNAPp1AKa1
	/g+42EJp3Tc20Iea4gHVOZymqYvNoV3hW3nsy6jYtMC1vyGuHEcO8lmq7VfNwu+LFAdgVqXUv1oQx
	OclYR+xTx/TDiPrh0+UzQfYAAKG4v0NS+G945ISak48cLYePQ32XcVF40L6adBo2HGhegIwYrEQ/V
	S7cVaqcE75tgdMB4ti2iMQQ6cDFo+fyyQaRgT8wFA57vWC1Ogd3xEZscrshEyctOByjBho3xQpmQg
	BlSn+WUi1gNTYrb1AznA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD1RQ-0000000COeQ-2Dpm;
	Sun, 26 Oct 2025 14:09:52 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD1RN-0000000COdg-4915
	for linux-riscv@lists.infradead.org;
	Sun, 26 Oct 2025 14:09:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761487786; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lDrY1b0bnYhSyv2Vlc8J16R4GcD6v2MauZx6hALPklIrZRThkkoGurs+OOJdnqYBvcahmEIMLPb3z44jpq/L07JR5BvsH6eTaDrLh6Dywj0PKEiINO9F4guIP/rB1GmndfKn/iz84vsk7eTA1RqgPN+5Elw+cPYYlj+DOWZzwHY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761487786; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Lob/EbAYouSQUPJoRwdu1vuO3WRq/HuQhCpuWjZSA4w=; 
	b=gq0afTUJytzTrAQq73VD2QCiuJ0D2KPc0qdBB96HOcOM6F/tGd1c46R5UkeJkB5iJQzAXVoj07xNysDPvp6nKFxLwIjKlcD9NWsK8RIYVS9TL5p9LZgMsxMSx7NW/5mFRSNWm3ed+0dxocovxeU6d+r4c3u6Ac19urzkkGUNG/E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761487786;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Lob/EbAYouSQUPJoRwdu1vuO3WRq/HuQhCpuWjZSA4w=;
	b=IM0YJeMlD4+uBbQUZRwiFE1P3xpypASEMRqiovw042nqryd+LH955Uwuk1apNc1q
	XuCdggFJCA22ETkAoOBywrB3zSg7KTKbm99fTEuQk9vzG9oirj8+uwWbvJkCxKgLbiF
	m+JWy0LqFHnTl2v22LCm+bdNZyXeyxj2R5gbW8ao=
Received: by mx.zohomail.com with SMTPS id 1761487785721774.8622206237344;
	Sun, 26 Oct 2025 07:09:45 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Sun, 26 Oct 2025 22:00:42 +0800
Subject: [PATCH v2 2/6] dt-bindings: clock: add Anlogic DR1V90 CRU
MIME-Version: 1.0
Message-Id: <20251026-dr1v90-cru-v2-2-43b67acd6ddd@pigmoral.tech>
References: <20251026-dr1v90-cru-v2-0-43b67acd6ddd@pigmoral.tech>
In-Reply-To: <20251026-dr1v90-cru-v2-0-43b67acd6ddd@pigmoral.tech>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761487753; l=5234;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=RY7m0qmOn+Z0ph/2s8ID67m3QLIBiYEV+tJsC5Yiq3o=;
 b=pX+2ujWvihcX1CiCx0co1yTI6kTQDRqEnddFAiOeJzhLcJt0YWGcjB24TS/+MlpZfk2AGPfyq
 LhtZk4o2tZ1Du3zWam9+4InX14WkvRX+JJBVTGqdbfUYCiBQBqo1WCA
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_070950_060793_3B3CD4A2 
X-CRM114-Status: GOOD (  10.52  )
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
index 0000000000000000000000000000000000000000..165c71ce333a8ee8ebbc86f238bb807880580aca
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
+      - description: Main Oscillator (33 MHz)
+      - description: External CAN clock
+      - description: External WDT clock
+
+  clock-names:
+    items:
+      - const: osc_33m
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
+        clocks = <&osc_33m>, <&can_ext>, <&wdt_ext>;
+        clock-names = "osc_33m", "can_ext", "wdt_ext";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/anlogic,dr1v90-cru.h b/include/dt-bindings/clock/anlogic,dr1v90-cru.h
new file mode 100644
index 0000000000000000000000000000000000000000..664daf3946a7bc5812f03ac026081027690bc562
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
index 0000000000000000000000000000000000000000..c5b7aae1ab6ac7b931c35e52615991afdfe43b08
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
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
