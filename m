Return-Path: <SRS0=xwCb=FG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B5AC64E8A
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 03:25:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B252221E2
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 03:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B252221E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ShpbFS89BOpGnYIdekomLs6q3G/vMM1BH5qCToY94eQ=; b=1ShWVzMZGZMKfw35Wbq6Yf7Ow
	G4Txk1/bdkFb8/V15olRpr22fdSCU+5Cl06VI6JFOVhTak9vZFoKtgQgVio29cxdPdhTu6ckX43Hw
	Mu4tysModrcBEO0Xh7KhY1EpSfxNCvc8gz/sQjki32i6r/uTvqOUG7V1Kq9Feq5IdJrE9+2sAo2+5
	0Sq0+yzv32tA5PciIAtjP/fuAHjXYrNxIRCu0j2cU8JVSOaee3svb8ab4oN4fwAdA5N0RQ0p3rJ7S
	pUPO+8TSATp186ZPc3xZBQUg7XRkQFk/opwjBV53ead3cHHadXiY1R+rEbX7/BwOBeRSEF63rfeNG
	qi1UMLvcg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkIlu-0000uy-VZ; Wed, 02 Dec 2020 03:25:39 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkIln-0000nF-8r
 for linux-riscv@lists.infradead.org; Wed, 02 Dec 2020 03:25:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606879531; x=1638415531;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iKyL7SSy4thzSVtbyyQfrf5obwUGB0rjdjJLiK0lOWg=;
 b=XcgFH0nAZtwYB0qHbase9FmSthUPEZJe1aoR480uOHIXQpZAWyuceTi+
 Do2MPbWUwUJYI/X5NWNdQpNcW4gx8aRf7EVjWWHFKIaMx6yQpZWRO8hUF
 0S83XffZ+8wLCdXLFozGaWeVF2ajnHNsKYqyrylKVRAwf7zrcma3u3GrH
 e5NAtag3bx+vfMst3oTK2+gMDFPaOgecVC/3iF+OZjp38x1HBjcco77Gs
 vuVpsstpUscCkySy0PUP+VsZUbSACiSpfMruVc9U+brwLkH7g/NFePUVx
 e933l2oqw5LTCAk/QYKKMLaPGm+1YglEB8wPz1Z3OTeL4q3WDLnLU2JML A==;
IronPort-SDR: IsYUj8AexuNMYmCpylPOSLDHOsG/H0pMjUXGXKX1fWqQLxHHkeTkODxZazT0JVZcGQ3I/QHN4y
 wdyXBRjFsry5F3/Gcb18AUHMl2zAwUTiHGzuKCpYGkzxmyrDuHkxRv4JRY6RqDgFO1uUt5LZZq
 6LtkVlXiIy7cCVJ2rEDSnYIm8glUDQFiJwFwoikNCsSrB4JWseu3fof+XM0drG3v7JNmsjJ3ln
 uwOeS4K0aCOHPuMy7UILG4LpgTb1UWzkfhxG7DUFsovBebYV4fR5m2xv+M8go/unqjk7WDFXH1
 LLk=
X-IronPort-AV: E=Sophos;i="5.78,385,1599494400"; d="scan'208";a="153922349"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Dec 2020 11:25:19 +0800
IronPort-SDR: sEEuPGzMdgI6CU+Ea0gJ/ctTyud4RFG4Vp5B2BJP0jVkppAvxgfcJeVEb9A9FO2t7HH5V8HREL
 ZshdMXbIgZyz38/2S1bqnBPB1FAJeRcxM=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 19:10:54 -0800
IronPort-SDR: ratTByZiLPghLqlbWeqpE0+sBHECgxdsE3T9pUvJ0L5ZraHXcuboEyhfIR+mvxQ0f1IMwCthFm
 ErTa8PkCQtPw==
WDCIronportException: Internal
Received: from phd004834.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.196])
 by uls-op-cesaip02.wdc.com with ESMTP; 01 Dec 2020 19:25:18 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v4 07/21] dt-binding: clock: Document canaan, k210-clk bindings
Date: Wed,  2 Dec 2020 12:24:46 +0900
Message-Id: <20201202032500.206346-8-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201202032500.206346-1-damien.lemoal@wdc.com>
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_222531_482324_902B977F 
X-CRM114-Status: GOOD (  17.16  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Document the device tree bindings of the Canaan Kendryte K210 SoC clock
driver in Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml.
The header file include/dt-bindings/clock/k210-clk.h is modified to
include the complete list of IDs for all clocks of the SoC.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 .../bindings/clock/canaan,k210-clk.yaml       | 55 +++++++++++++++++
 include/dt-bindings/clock/k210-clk.h          | 61 +++++++++++++++----
 2 files changed, 105 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml

diff --git a/Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml b/Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml
new file mode 100644
index 000000000000..3547916a2421
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/canaan,k210-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Canaan Kendryte K210 Clock Device Tree Bindings
+
+maintainers:
+  - Damien Le Moal <damien.lemoal@wdc.com>
+
+description: |
+  Canaan Kendryte K210 SoC clocks driver bindings. The clock
+  controller node must be defined as a child node of the K210
+  system controller node.
+
+  See also:
+  - dt-bindings/clock/k210-clk.h
+
+properties:
+  compatible:
+    const: canaan,k210-clk
+
+  clocks:
+    maxItems: 1
+    description:
+      System fixed rate oscillator clock.
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - '#clock-cells'
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/k210-clk.h>
+    clocks {
+      in0: oscillator {
+        compatible = "fixed-clock";
+        #clock-cells = <0>;
+        clock-frequency = <26000000>;
+      };
+    };
+
+    /* ... */
+    sysclk: clock-controller {
+      #clock-cells = <1>;
+      compatible = "canaan,k210-clk";
+      clocks = <&in0>;
+    };
diff --git a/include/dt-bindings/clock/k210-clk.h b/include/dt-bindings/clock/k210-clk.h
index 5a2fd64d1a49..8d7ab2f0737c 100644
--- a/include/dt-bindings/clock/k210-clk.h
+++ b/include/dt-bindings/clock/k210-clk.h
@@ -3,18 +3,57 @@
  * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
  * Copyright (c) 2020 Western Digital Corporation or its affiliates.
  */
-#ifndef K210_CLK_H
-#define K210_CLK_H
+#ifndef CLOCK_K210_CLK_H
+#define CLOCK_K210_CLK_H
 
 /*
- * Arbitrary identifiers for clocks.
- * The structure is: in0 -> pll0 -> aclk -> cpu
- *
- * Since we use the hardware defaults for now, set all these to the same clock.
+ * Kendryte K210 SoC clock identifiers (arbitrary values).
  */
-#define K210_CLK_PLL0   0
-#define K210_CLK_PLL1   0
-#define K210_CLK_ACLK   0
-#define K210_CLK_CPU    0
+#define K210_CLK_IN0	0
+#define K210_CLK_PLL0	1
+#define K210_CLK_PLL1	2
+#define K210_CLK_PLL2	3
+#define K210_CLK_ACLK	4
+#define K210_CLK_CPU	5
+#define K210_CLK_CLINT	6
+#define K210_CLK_DMA	7
+#define K210_CLK_FFT	8
+#define K210_CLK_SRAM0	9
+#define K210_CLK_SRAM1	10
+#define K210_CLK_ROM	11
+#define K210_CLK_DVP	12
+#define K210_CLK_APB0	13
+#define K210_CLK_APB1	14
+#define K210_CLK_APB2	15
+#define K210_CLK_AI	16
+#define K210_CLK_I2S0	17
+#define K210_CLK_I2S1	18
+#define K210_CLK_I2S2	19
+#define K210_CLK_I2S0_M	20
+#define K210_CLK_I2S1_M	21
+#define K210_CLK_I2S2_M	22
+#define K210_CLK_WDT0	23
+#define K210_CLK_WDT1	24
+#define K210_CLK_SPI0	25
+#define K210_CLK_SPI1	26
+#define K210_CLK_SPI2	27
+#define K210_CLK_I2C0	28
+#define K210_CLK_I2C1	29
+#define K210_CLK_I2C2	30
+#define K210_CLK_SPI3	31
+#define K210_CLK_TIMER0	32
+#define K210_CLK_TIMER1	33
+#define K210_CLK_TIMER2	34
+#define K210_CLK_GPIO	35
+#define K210_CLK_UART1	36
+#define K210_CLK_UART2	37
+#define K210_CLK_UART3	38
+#define K210_CLK_FPIOA	39
+#define K210_CLK_SHA	40
+#define K210_CLK_AES	41
+#define K210_CLK_OTP	42
+#define K210_CLK_RTC	43
 
-#endif /* K210_CLK_H */
+#define K210_NUM_CLKS	44
+
+#endif /* CLOCK_K210_CLK_H */
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
