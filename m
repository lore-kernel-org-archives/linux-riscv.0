Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00473C64ED6
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 14:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LRJo1St47OWacGSuTcxfUmbn9XMo+dq+D+I1yr+3N+s=; b=WgBNDSx1qgHofk
	1UzOVEFVg3KaKWblkkl22o15oXjFMhyMr5jnULpPgUIhc20QlF2j2pUmoq5FI/MhpQ59jTJXzORk/
	wUQKsjQkKaeV7LvWKRfoREXX+7GH/lfcgTWWeBeWX9sJ8vhzEcUTt0X+hRSc+9ryFTNcE+xmPyPRi
	JfS6UnErBG6ZZTay1dOyTJ4sAxiHEJ8Pzuu3ZXGUgem96lGeiD/odRGlk6godpGjBUDt7FvEQt53c
	O1t0PxwnNkotLKB6dFT4KpSlyraLb+HQurvOZFI78zpJdHxdj1UWiNCrpFm92AXNE1uwK9xPok8Vd
	MvnbvUn9mD8hpK+l99CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUTNI-008SHX-2f; Tue, 21 Feb 2023 14:12:08 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUTNE-008SFq-Od
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 14:12:06 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id DE73724E1C7;
	Tue, 21 Feb 2023 22:11:52 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Feb
 2023 22:11:52 +0800
Received: from localhost.localdomain (183.27.98.67) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Feb
 2023 22:11:51 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>
CC: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: [PATCH v1 1/3] dt-bindings: clock: Add StarFive JH7110 PLL clock generator
Date: Tue, 21 Feb 2023 22:11:45 +0800
Message-ID: <20230221141147.303642-2-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221141147.303642-1-xingyu.wu@starfivetech.com>
References: <20230221141147.303642-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.98.67]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_061205_113654_6D9670BB 
X-CRM114-Status: GOOD (  14.02  )
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

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../bindings/clock/starfive,jh7110-pll.yaml   | 45 +++++++++++++++++++
 .../dt-bindings/clock/starfive,jh7110-crg.h   | 12 ++---
 2 files changed, 52 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml

diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
new file mode 100644
index 000000000000..8fd18e6c2e9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/starfive,jh7110-pll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 PLL Clock Generator
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
+      - description: Main Oscillator (24 MHz)
+
+  '#clock-cells':
+    const: 1
+    description:
+      See <dt-bindings/clock/starfive,jh7110-crg.h> for valid indices.
+
+  starfive,sysreg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      the phandle to System Register Controller syscon node.
+
+required:
+  - compatible
+  - clocks
+  - '#clock-cells'
+  - starfive,sysreg
+
+additionalProperties: false
+
+examples:
+  - |
+    pllclk: pll-clock-controller {
+      compatible = "starfive,jh7110-pll";
+      clocks = <&osc>;
+      #clock-cells = <1>;
+      starfive,sysreg = <&sys_syscon>;
+    };
diff --git a/include/dt-bindings/clock/starfive,jh7110-crg.h b/include/dt-bindings/clock/starfive,jh7110-crg.h
index 5e4f21ca0642..086a6ddcf380 100644
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
@@ -198,11 +204,7 @@
 #define JH7110_SYSCLK_TDM_TDM_INV		188
 #define JH7110_SYSCLK_JTAG_CERTIFICATION_TRNG	189
 
-#define JH7110_SYSCLK_PLL0_OUT			190
-#define JH7110_SYSCLK_PLL1_OUT			191
-#define JH7110_SYSCLK_PLL2_OUT			192
-
-#define JH7110_SYSCLK_END			193
+#define JH7110_SYSCLK_END			190
 
 /* AONCRG clocks */
 #define JH7110_AONCLK_OSC_DIV4			0
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
