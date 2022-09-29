Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B966C43217
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Sep 2022 17:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dFSTct+/V75kuRK9PWT5DaGBEWnKM1/CrRYCCW6166w=; b=hAerXCkh1VqGci
	AYJyOkm4hI78pFSY1ipCzmMAKq8AxNi+m8SoDJmdYrlFNLaU/ezuy8bvVnw7zW357pLcTV87bjBec
	YvrDV4xvP7+MTXMjS2c0a9K3ZReMdJkKL9JYJUMOSDIWFNJIRTqOBu/0yyBHjsIhHb3deCrPjz2Um
	wosPNVZd8uAoCX1vlWeeuH/YPgTydXzqMEex9Yoc4vtl5B2CeE6YpFkooUaD86yLBIWWVnKNrysOc
	HrULGG+yAzWiAsnKyMK9/8bbbvbjloIuQn5lf9JRNNs0uzddadwGcC1+mu4NCQvLjtkWTuQBXB9ek
	4bCDtHT8iSdTom8blKag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odxhw-004jjI-OH; Thu, 29 Sep 2022 17:52:24 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odxht-004jhz-78
	for linux-riscv@lists.infradead.org; Thu, 29 Sep 2022 17:52:23 +0000
X-QQ-mid: bizesmtp91t1664473914tqedou0x
Received: from localhost.localdomain ( [113.72.145.157])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 30 Sep 2022 01:51:52 +0800 (CST)
X-QQ-SSF: 01000000002000303000B00A0000000
X-QQ-FEAT: VNWd8gjdZNrqI5XK6Kpr9+wOXo7z2LCerXVK3EG7K1PrQ9eL9Yo0lIQ1X455d
	+QCfpwb4krugRfeHjrMBw3J9dYDmRV051+HzuyyUOeL6ikLghpR8ZVj27J+eLe72XcJLtx8
	U3RGu8pFKqxZ9aNuaNASRqNeDF21ucsHd3lYMkBCYxKP2zyjg0BTIWOUIsdNGUT1iEtHCQn
	ukEIWjC0XUaQalLCz+ENi2ak3qzKD7PTxlfUYO7amCJXrvLjBwfLiMU0QQaucmiLXIQtSsA
	End+Lzg4nxYrtbGOGUGZ35ymYjWjoIa9y9JEIwSD0eNj1CeUBamf1ToLnh5jU+0kWfi+8Ex
	yeXbaom0+4xNG8SgRjYuIjQbFbgIShVQc8JJk5MhGwEw8nBxXokb0bL7ShivY2O8PUOXxmx
	mTLSNoSZc3s=
X-QQ-GoodBg: 0
From: Hal Feng <hal.feng@linux.starfivetech.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@linux.starfivetech.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 12/30] dt-bindings: reset: Add starfive,jh7110-reset bindings
Date: Fri, 30 Sep 2022 01:51:47 +0800
Message-Id: <20220929175147.19749-1-hal.feng@linux.starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_105221_582094_19D43AE2 
X-CRM114-Status: GOOD (  11.26  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add bindings for the reset controller on the JH7110 RISC-V
SoC by StarFive Technology Ltd.

Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
---
 .../bindings/reset/starfive,jh7110-reset.yaml | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/starfive,jh7110-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/starfive,jh7110-reset.yaml b/Documentation/devicetree/bindings/reset/starfive,jh7110-reset.yaml
new file mode 100644
index 000000000000..bb0010c200f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/starfive,jh7110-reset.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/starfive,jh7110-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 SoC Reset Controller Device Tree Bindings
+
+maintainers:
+  - Emil Renner Berthing <kernel@esmil.dk>
+  - Hal Feng <hal.feng@linux.starfivetech.com>
+
+properties:
+  compatible:
+    enum:
+      - starfive,jh7110-reset
+
+  "#reset-cells":
+    const: 1
+
+  starfive,assert-offset:
+    description: Offset of the first ASSERT register
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  starfive,status-offset:
+    description: Offset of the first STATUS register
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  starfive,nr-resets:
+    description: Number of reset signals
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - "#reset-cells"
+  - starfive,assert-offset
+  - starfive,status-offset
+  - starfive,nr-resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/starfive-jh7110.h>
+
+    syscrg_rst: reset-controller@13020000 {
+        compatible = "starfive,jh7110-reset";
+        #reset-cells = <1>;
+        starfive,assert-offset = <0x2F8>;
+        starfive,status-offset= <0x308>;
+        starfive,nr-resets = <JH7110_SYSRST_END>;
+    };
+
+...
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
