Return-Path: <SRS0=J7tQ=FR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F6AC433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 13:51:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BD23222B6
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 13:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BD23222B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WthLV8EllzLU88w7Yn61SI/Q43WQqQR6mj94dw2P5wg=; b=0EjBqh3lw2cHZkz/ENs22w0S1
	Qlxz2tL1Kk8//faHl0BflJJMyy1KnfTvfyy/mzcFRXf035DM79F4wKYVtIwjJnFQ7US7+LCl6F9yT
	MsxAxf4ODm3RQ7AQe9EbXy/T/liL1VPqH+GRODuEFfOR2QulCQT69GHUBQyITGHh21JTwdhGOr1vm
	OUR1bEdZqXAsmexCrC0wnRXkaDZ2974X7Mw+VphpnbSEUE2sEANybh1xvYTUsuKwG2Wp6k/IFFM0S
	JdCY5hFWoBi30AqIf2xULBux3Et3NNIJIEM0n2ta8plptq7n/6sk5q90QRcNdwE5v191pOS+kePy/
	wDJrIAnxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koRmU-0000HO-V0; Sun, 13 Dec 2020 13:51:22 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koRmR-0000F8-GN
 for linux-riscv@lists.infradead.org; Sun, 13 Dec 2020 13:51:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607867480; x=1639403480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EWs9Id0WN8U3hC16kEMGKACQAkkI4/IPFe7+6Y7Fn58=;
 b=gqM7LtbS4OU3y7dbqubDDDLoqzL0/hUaL2ysTVfEhS5/V6JY0LTrZ6of
 neTHaKhjaJGHZ1fD201G2NFmaos4WizTHkgA/tnIaYL4Vs5h/hMvmIj4r
 vwn+BNf5HQ9s9EvkFKw84K/DVutsB0Z/7UswFX4Ahkx/lLHydYyaQxx9z
 iuhj2AmUCEOJpcJ92b+/sxLw+okrdjEN9YNAV/EBL/8zrD/NYwWuRRHvz
 Spgy4MV8y9uqGOcHn9/njDAjsGBzn2hacCqi0SwYOw9T81PdE9UMra9G2
 ZPFbGdpPaKTrHRihukOP7AYF2rcJl1ys/SeFUmGg2YQFYBT2M8tOAsZgl g==;
IronPort-SDR: 8cXPtzFWcreRf/RtN78m8zIYVxPTVg6jC19MdXGDHkb8zaOsn44YvC+CYqc1jIT2fFUotSnyoI
 wIOjo7R6AuJicR9JNxm46iOdgnw94qXhAnvFzV2eO9szh6/sbB2xReEkxGXZckw51enS+bZVTc
 Aws8lGito3faYMRdPQtgQJRDe6HFkctqhzF4hi8qqY2TPfP/2fpJasqUSmMckBaEqcKA5Xz0kE
 kG1dAs2lZZ/TqD7XuL69T17OojlZRmY2IsYZlVbym5A7pf7Dm33HWo6NBExp8yagzLhLpigshe
 dkY=
X-IronPort-AV: E=Sophos;i="5.78,416,1599494400"; d="scan'208";a="156242571"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 21:51:19 +0800
IronPort-SDR: QbEU5o/0wl+0DEoaTawQthvAnwiiemnNqoGwOlYturU9uPpsAcm5wbB6ZKofLR+rsP1TQy9cCR
 Hkmug6uHIqDdz1QemmNlyd5oB+vuzmCOtNoX+D2U6qfZqXihWHgThFeJo5aOaxYqAyfJh0qYVD
 qP8YngiSpTC3oiyLP8O1pA2L3C7RQibvqek+likZ+3Jmsm3vIw8Qy5/Fw8RVi72JygUd4ch5NC
 i5CbMqqKlQT3zlmPQSXS++atug3p7Rx2JGonHlJWeGDINUCbHeloCo4ld5951JWzUmdbGrcBxB
 L+8R3iDP351gq5hjwO2LMToV
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2020 05:35:04 -0800
IronPort-SDR: 54+SMd6qW3bSTUW45hp9y9RiGhgN8PyLnMyJcEpE4VGhdj1hpDGQ/xghCFUBoqAUJ5akdMZqKN
 6fdXAeDhb50naOVYy1u5dgn4zKv7iuhKriygmVbyHGcRY5S5KN+slyQ0QhTeBzWit1u2hb6Wck
 Qq8+UsOVVKuWkbMNEtn729zluSB84/lHmcRgg5omFZ0QrXkaYXXeZRE8gqQHb0VWrCH7UrPWY4
 WoWS88kNPqsZf1qYht9oFswaQ5NqUgBybaUB9PybEjgPIZSSUmQQvtr8Y8fj6XYPdPUEW3XXOP
 m4w=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.197])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Dec 2020 05:51:16 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v10 09/23] dt-binding: clock: Document canaan,
 k210-clk bindings
Date: Sun, 13 Dec 2020 22:50:42 +0900
Message-Id: <20201213135056.24446-10-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213135056.24446-1-damien.lemoal@wdc.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_085119_670639_7FDC1741 
X-CRM114-Status: GOOD (  18.55  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/clock/canaan,k210-clk.yaml       | 54 ++++++++++++++++++
 include/dt-bindings/clock/k210-clk.h          | 55 +++++++++++++++----
 2 files changed, 98 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml

diff --git a/Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml b/Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml
new file mode 100644
index 000000000000..565ca468cb44
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml
@@ -0,0 +1,54 @@
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
+    description:
+      Phandle of the SoC 26MHz fixed-rate oscillator clock.
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
index 5a2fd64d1a49..b2de702cbf75 100644
--- a/include/dt-bindings/clock/k210-clk.h
+++ b/include/dt-bindings/clock/k210-clk.h
@@ -3,18 +3,51 @@
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
+#define K210_CLK_CPU	0
+#define K210_CLK_SRAM0	1
+#define K210_CLK_SRAM1	2
+#define K210_CLK_AI	3
+#define K210_CLK_DMA	4
+#define K210_CLK_FFT	5
+#define K210_CLK_ROM	6
+#define K210_CLK_DVP	7
+#define K210_CLK_APB0	8
+#define K210_CLK_APB1	9
+#define K210_CLK_APB2	10
+#define K210_CLK_I2S0	11
+#define K210_CLK_I2S1	12
+#define K210_CLK_I2S2	13
+#define K210_CLK_I2S0_M	14
+#define K210_CLK_I2S1_M	15
+#define K210_CLK_I2S2_M	16
+#define K210_CLK_WDT0	17
+#define K210_CLK_WDT1	18
+#define K210_CLK_SPI0	19
+#define K210_CLK_SPI1	20
+#define K210_CLK_SPI2	21
+#define K210_CLK_I2C0	22
+#define K210_CLK_I2C1	23
+#define K210_CLK_I2C2	24
+#define K210_CLK_SPI3	25
+#define K210_CLK_TIMER0	26
+#define K210_CLK_TIMER1	27
+#define K210_CLK_TIMER2	28
+#define K210_CLK_GPIO	29
+#define K210_CLK_UART1	30
+#define K210_CLK_UART2	31
+#define K210_CLK_UART3	32
+#define K210_CLK_FPIOA	33
+#define K210_CLK_SHA	34
+#define K210_CLK_AES	35
+#define K210_CLK_OTP	36
+#define K210_CLK_RTC	37
 
-#endif /* K210_CLK_H */
+#define K210_NUM_CLKS	38
+
+#endif /* CLOCK_K210_CLK_H */
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
