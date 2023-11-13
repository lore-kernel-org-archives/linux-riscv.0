Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351E0C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 01:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wRx5b9fjhhBngv41WFFoV0AeFQaNiCI8W0y7c4mg0o0=; b=ljgPxzrM3S6K6+
	Feqch0DPZJlMJiPuqDcYchWRYJFX4ZnzCHNxaGc3zHhBnD9KT9uvw6uiKEJ5nq2fUahC/QuQn9rM3
	nD2VzqextlUfwxTZfY2efnsCqip51UwvejlGn0zTmoMjyxtPgzpJeUCcChyzy77UQUKBZVXUEcC0l
	qUHznpY5hgEawyDUgLNiUkwF6fytosWX9w8gSQYzRXk+Y13zHqZy2Rq4qbu01utXRX8BJf8SpXlnn
	woljdjDOk8GMiXrqVTlBRCjCID16tW+xie4qcwPxGmlqcrfbOzYtiZOviIJPoTyP+lz8VYMlLTJWF
	EYHYLWyvnGAozXHk5PzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2LQV-00Cxmw-04;
	Mon, 13 Nov 2023 01:07:43 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2LQR-00Cxlr-38
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 01:07:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D159AB80B25;
	Mon, 13 Nov 2023 01:07:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE9BC433CA;
	Mon, 13 Nov 2023 01:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699837656;
	bh=H7qZuoiU0EG1cjpw3AoWWtXlkPPaLWyV/VdLiSuYwKQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WEGavzlSqYp4rVqws4gzgtTZWf+llaZy8xr/W+HFUIYhnXD0SSrllI+QfYOTUB0RZ
	 hcRiO061sNLZCYXunsxINP6D/gtTOzeO8baaokilbp6XR+BmovWyoQaVfyIjDSCZc0
	 0yUMwvN7Ci201OFB61kN6zl3J+bBtr6jamxWQJRpT7WI7dWKbZWSd4UM5e5j7NfUoi
	 5HlgkvZDIG6GdbWVHTNVGl0/JGTmxSyBAg5OAL5X5j5VrOpsZDoMDH1Vk2imUflUKe
	 wAnjFx6kMMfHN9kBTmRPRq2aRggxr6Hrdx4+C6cGKQ32+Yt0rFTGjH6UHIvq9spPYb
	 +LhSwHdFw6KsQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/4] dt-bindings: reset: Add binding for Sophgo CV1800B reset controller
Date: Mon, 13 Nov 2023 08:55:00 +0800
Message-Id: <20231113005503.2423-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231113005503.2423-1-jszhang@kernel.org>
References: <20231113005503.2423-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_170740_322858_63E29268 
X-CRM114-Status: GOOD (  12.83  )
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

Add devicetree binding for Sophgo CV1800B SoC reset controller.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../bindings/reset/sophgo,cv1800b-reset.yaml  | 38 ++++++++
 .../dt-bindings/reset/sophgo,cv1800b-reset.h  | 96 +++++++++++++++++++
 2 files changed, 134 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/sophgo,cv1800b-reset.yaml
 create mode 100644 include/dt-bindings/reset/sophgo,cv1800b-reset.h

diff --git a/Documentation/devicetree/bindings/reset/sophgo,cv1800b-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,cv1800b-reset.yaml
new file mode 100644
index 000000000000..20a525147490
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/sophgo,cv1800b-reset.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/sophgo,cv1800b-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800B SoC Reset Controller
+
+maintainers:
+  - Jisheng Zhang <jszhang@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - sophgo,cv1800b-reset
+
+  reg:
+    maxItems: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    reset-controller@3003000 {
+        compatible = "sophgo,cv1800b-reset";
+        reg = <0x03003000 0x1000>;
+        #reset-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/reset/sophgo,cv1800b-reset.h b/include/dt-bindings/reset/sophgo,cv1800b-reset.h
new file mode 100644
index 000000000000..28dda71369b4
--- /dev/null
+++ b/include/dt-bindings/reset/sophgo,cv1800b-reset.h
@@ -0,0 +1,96 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
+ * Copyright (C) 2023 Sophgo Technology Inc. All rights reserved.
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ */
+
+#ifndef _DT_BINDINGS_CV1800B_RESET_H
+#define _DT_BINDINGS_CV1800B_RESET_H
+
+/*				0-1	*/
+#define RST_DDR			2
+#define RST_H264C		3
+#define RST_JPEG		4
+#define RST_H265C		5
+#define RST_VIPSYS		6
+#define RST_TDMA		7
+#define RST_TPU			8
+#define RST_TPUSYS		9
+/*				10	*/
+#define RST_USB			11
+#define RST_ETH0		12
+/*				13	*/
+#define RST_NAND		14
+/*				15	*/
+#define RST_SD0			16
+/*				17	*/
+#define RST_SDMA		18
+#define RST_I2S0		19
+#define RST_I2S1		20
+#define RST_I2S2		21
+#define RST_I2S3		22
+#define RST_UART0		23
+#define RST_UART1		24
+#define RST_UART2		25
+#define RST_UART3		26
+#define RST_I2C0		27
+#define RST_I2C1		28
+#define RST_I2C2		29
+#define RST_I2C3		30
+#define RST_I2C4		31
+#define RST_PWM0		32
+#define RST_PWM1		33
+#define RST_PWM2		34
+#define RST_PWM3		35
+/*				36-39	*/
+#define RST_SPI0		40
+#define RST_SPI1		41
+#define RST_SPI2		42
+#define RST_SPI3		43
+#define RST_GPIO0		44
+#define RST_GPIO1		45
+#define RST_GPIO2		46
+#define RST_EFUSE		47
+#define RST_WDT			48
+#define RST_AHBRST_ROM		49
+#define RST_SPIC		50
+#define RST_TEMPSEN		51
+#define RST_SARADC		52
+/*				53-57	*/
+#define RST_COMBORST_PHY0	58
+/*				59-60	*/
+#define RST_SPIRST_NAND		61
+#define RST_SE			62
+/*				63-73	*/
+#define RST_UART4		74
+#define RST_GPIO3		75
+#define RST_SYSTEM		76
+#define RST_TIMER		77
+#define RST_TIMER0		78
+#define RST_TIMER1		79
+#define RST_TIMER2		80
+#define RST_TIMER3		81
+#define RST_TIMER4		82
+#define RST_TIMER5		83
+#define RST_TIMER6		84
+#define RST_TIMER7		85
+#define RST_WGN0		86
+#define RST_WGN1		87
+#define RST_WGN2		88
+#define RST_KEYSCAN		89
+/*				90	*/
+#define RST_AUDDAC		91
+#define RST_AUDDACRST_APB	92
+#define RST_AUDADC		93
+/*				94	*/
+#define RST_VCSYS		95
+#define RST_ETHPHY		96
+#define RST_ETHPHYRST_APB	97
+#define RST_AUDSRC		98
+#define RST_VIP_CAM0		99
+#define RST_WDT1		100
+#define RST_WDT2		101
+/*				102-292	*/
+#define RST_CPUSYS1		293
+#define RST_CPUSYS2		294
+
+#endif /* _DT_BINDINGS_CV1800B_RESET_H */
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
