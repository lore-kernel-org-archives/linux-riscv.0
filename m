Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B464DC55179
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:15:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6899D20704
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:15:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="urGWFDK0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="iM4Ydka7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6899D20704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rKwakg3q9epBsMIX80K+vCF1LY6jF1ZV31aObV4mx14=; b=urGWFDK0AX2yUMcbVa2eddD94
	kwlOf8ecjIEAswqiSgFzK2QYNLPu87bXpjiSSk4Y1jMHhCGd2x9k1ZO7rZIXBvH4Lyp2ipnDuHaDi
	FjBEm/F7OHg9g/P+6+6JJmjnV10PICjUBpQvD7tkorvntjMtJ8cTkMD1zn47eD1NRfcD9UU+ji8/Y
	rldrmZAa5J/T30y1oTdfsKYLwGgRsv9AKoIt7aAoPdzA+oo8N0sdbpnl89AYDnVaGnyjk0/uMDunQ
	Dq3DK357D0L6/qOXNd0ekmZFamAjrxJR2aYabqIaL+0gBq6xu3sLInuISfBxanmrsfS1p5wYFjH4d
	XWTQz3BoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbJNq-00016F-9K; Sat, 07 Nov 2020 08:15:38 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJNd-0000sk-9d
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 08:15:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604736925; x=1636272925;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QkRCfLP1RiMjOvLwrisdDi2IrprGO1LS2AaUs89hBgw=;
 b=iM4Ydka7Z8iZIIfEJ9CWpdlUPxIWo5BY4wD8rZiRiGn+s+zyjQ8MxRGe
 CY5GrGsuvXZw8gRxBy480IeXbCM+u7Sm35kSjjZ3BjQOx6QAJkvfX0+LW
 fd4KEbgxkVaiEzbxbVReeNg96RDEofOYbwEHCZFh8kahVFMjWAQyjYMlV
 Gm9xU1I8kWRuKIM49gxtrAsr5+THnBjiH5Vfb0ceVO44lb5BT3npIzouK
 O6p56Tht3EtB/v7f8EyRHnbBh57038/HusVdD9SwqZUhld0MCsS+JoD3X
 i6eWqEhCS8RNMSPeDiP3m3V5DHo92HDnxYbW3Ad1c7GIkdvj4jHCRVOOF Q==;
IronPort-SDR: 1MN9Yc7ju91mywn5s7AWjrmPCEuhk/HMTLUCLsPJLaAejAia6djTG/NoIvy5XWDUDKelEnMzYy
 DcJj8DODqPG7ub/Vm+7F/X83cwW+uKhJfs+9svVtVOS7QKXU2dnL9ydscxDjlIf0xlM16og7x8
 wiXYkce+wRADw6E9VJGixeVf2M98QBgNmO2GQgUvPRQTQN6y5cBwj2HZViErihISC/SMvaBCGM
 LoxBbox3fjwhQb2tHW1UOaP65d+9ts5fRLGg3/D1DW6W79Um0SEh4vVoK7CUyIBCBzRqCSYVxK
 Dxk=
X-IronPort-AV: E=Sophos;i="5.77,459,1596470400"; d="scan'208";a="262079336"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2020 16:15:24 +0800
IronPort-SDR: 4d3tLyICnzAP952qHjsSAKUlRHPm0qb4T4dxrsB1ad+UnqD20IAY/lpq89iAdeJuRplrFilB1s
 oUVTCC2I7nHjkdKrQ8bR/OBJK2pZ2bOy0TbwzjXz8OiMLfWs01m9PLXWIbsTPI5OLCm7L1aQJC
 Ukq+pM4VstkRkywG0ekDNRYS5qUvK8xf59eWojbn+3cjXR9eBdmmLKEsbcU/xmq98unp380px6
 u585TVc8tKzspW3EViBPxhOeG6Tisx2DOdd2Pso+RPi9MHNY658ZPrtt51RZ/3betVnhi2EEjh
 J+yJd+mSFu/BhC3emQY/zmza
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2020 00:01:29 -0800
IronPort-SDR: kNbmK/ZaWtIhWERqlBQPde5LebiYxI9kiEu8NrnS1rg2xhz2B9moqa38rqRkEw4qXSs9kQD4gN
 1UduA2IXuax8AVRO+HiLUrNXDyjrKKiSozhKTsiF3RxCpJFY4Izb9tYfB9DUOm24HSwDeDrc5f
 DIVlk9KPPSh0q5zYG99b2uOUnzNsQ9GEZWS/qfDsygdI0Gxw4henwmOBCRTyUJQwX7XsqhsZF2
 rGgGTdzOkGf/EgDjlylToDdHm8+sDeWdNFeRfndSZUrbFXJTg4QsMJj4H2dJ+0GNRdDXZYmpm4
 N4s=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2020 00:15:23 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 23/32] dt-binding: Document kendryte,k210-clk bindings
Date: Sat,  7 Nov 2020 17:14:11 +0900
Message-Id: <20201107081420.60325-24-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201107081420.60325-1-damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_031525_595903_4927A133 
X-CRM114-Status: GOOD (  14.18  )
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

Document the device tree bindings of the Kendryte K210 SoC clock driver
in Documentation/devicetree/bindings/clock/kendryte,k210-clk.yaml.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 .../bindings/clock/kendryte,k210-clk.yaml     | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/kendryte,k210-clk.yaml

diff --git a/Documentation/devicetree/bindings/clock/kendryte,k210-clk.yaml b/Documentation/devicetree/bindings/clock/kendryte,k210-clk.yaml
new file mode 100644
index 000000000000..02f5f8a86bc8
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/kendryte,k210-clk.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/kendryte,k210-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kendryte K210 Clock Device Tree Bindings
+
+maintainers:
+  - Damien Le Moal <damien.lemoal@wdc.com>
+
+description: |
+  Kendryte K210 clock controller driver which support the system controller
+  subsystem supplied clocks for the various controllers and peripherals within
+  the SoC.
+
+  See also:
+  - dt-bindings/clock/k210-clk.h
+
+properties:
+  compatible:
+    const: kendryte,k210-clk
+
+  clocks:
+    maxItems: 1
+    description: System fixed rate oscillator clock
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
+
+    clocks {
+      in0: oscillator {
+        compatible = "fixed-clock";
+        #clock-cells = <0>;
+        clock-frequency = <26000000>;
+      };
+    };
+
+    soc {
+      #address-cells = <1>;
+      #size-cells = <1>;
+      /* ... */
+
+      sysctl: system-controller@50440000 {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        compatible = "kendryte,k210-sysctl",
+                     "syscon", "simple-mfd";
+        reg = <0x50440000 0x1000>;
+        /* ... */
+        sysclk: clock-controller {
+          #clock-cells = <1>;
+          compatible = "kendryte,k210-clk";
+          clocks = <&in0>;
+        };
+        /* ... */
+      };
+    };
+
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
