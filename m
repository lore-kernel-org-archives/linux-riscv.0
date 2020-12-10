Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9628DC4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 14:04:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44C8022BF5
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 14:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44C8022BF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c09NQWN4nZWtzbq+xtIDSRhvJQRua4w3+igwmUCIMVs=; b=TXw+Sw1BArniHn538xgT6xQWe
	x5fIyWkY+Cd72bwZsUN4RkXJ8iwpybga+ttsjytkuWxkuNeMZbvxooR4S6Rep4krL9KfqznS6xyM+
	h5sOAmLtpYCzdv8HK2zGdbkmLiAmWGXH4oC0IpCYmo5sRGRniAljGIGDv54ZtJ4BmWr0L5yee5jdF
	qJk/FRIW6eHfPe+5iTKkrN5FsVYLP+cBUohvELsowVA6hnD6x4l/Sk0OdBGeEFlvoS+TwvMXymlod
	vLYKtAETOZ4HELNPamwytIHin2mhv4RO6L42WKasjluJG9fPvb9GFj316bHexU6emTaZzC6vVTy1n
	OZgnf0TiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knMYE-0000iP-Kh; Thu, 10 Dec 2020 14:04:11 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knMXl-0000Pw-7r
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 14:03:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607609322; x=1639145322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JaZDfj3HCaC7CI61ySYE6mZNZ1qz3fve+oOLHQcNsw0=;
 b=DuxWjCR7Hf66URIRQ3EZnwn/dXKdziSwtZB9xbwAcQh+w5TEJh6X7YWO
 aiMqjWoKwtRdMMNkUrSDUvFabTUSyPALN74B+v3d7uZhTj98G013w3Iws
 MzTyTUrOlYFGyleyj01T0mwHDDegukmbR0t8Jd65+9u1iZka+vwmSqvY0
 jME3lqvDahfT5DDQjraM5uwn4+WQpTjVHX3Pn0La6N2ueY9dLtco+xDQl
 8NHTy06x2WW7tDWAgUrbYl1D2+/dkFBRrVp5VP1nVMWCzzb6MOercTEY1
 u3L5zBq8W2ExJ8AvIZrQXUH0xehPGj+hEBLyjEYm/AdV+49Oq8LWt+N9w Q==;
IronPort-SDR: cZX2PjtWjqgXKtRlGHW5mEtXVLMrJdS1xGD8xExmBw60tOXfrTJ+RlYTFy3VPHK+9JUfiQK7D1
 upKAB62UJOLnaye03/vrc6hJv/uLDiU3pT8RtyEiC0d0Ydr7VbJ8JaFs5wdd1gthjKVleiR+g6
 orTtFDGj1mwYto+Nmdd+ROxQRTnGvPM9YnddWS1kGotVqhlZuvHyzZ5zrkFQCEIAvs2ICQjf5Q
 8riDjkqZUy0Wv+wnGNL4inCnXQG2MBl0zp4TrpcnhToYTiFuDa6KiLBZ/ChZUV9eOYbIqZFtiD
 ZpY=
X-IronPort-AV: E=Sophos;i="5.78,408,1599494400"; d="scan'208";a="258584851"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 22:08:42 +0800
IronPort-SDR: S9z+BeXmaUZ4yMAHad67xoN0vQ26e2VsafBBNDRjJtiwpH5WrP76qNb0pc9RZXUYRKnGTIFvEV
 Bsbm1Rjdtd8QPqi1Oey6oGGaOXUXmzdoU=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 05:47:32 -0800
IronPort-SDR: C9/Dk8aXTbFHPVJp4g7fc2RCwVXw7mfRzGwp875gC+vCSb4gsWFvW0T6L50XFm0hp0MZCKQfn5
 qI9vGZLgF2Sg==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.173])
 by uls-op-cesaip02.wdc.com with ESMTP; 10 Dec 2020 06:03:40 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v8 11/22] dt-binding: mfd: Document canaan,
 k210-sysctl bindings
Date: Thu, 10 Dec 2020 23:03:02 +0900
Message-Id: <20201210140313.258739-12-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210140313.258739-1-damien.lemoal@wdc.com>
References: <20201210140313.258739-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_090341_536159_C59E3286 
X-CRM114-Status: GOOD (  13.27  )
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

Document the device tree bindings of the Canaan Kendryte K210 SoC
system controller driver in
Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 .../bindings/mfd/canaan,k210-sysctl.yaml      | 116 ++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml

diff --git a/Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml b/Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
new file mode 100644
index 000000000000..a61d8ea4fbec
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/canaan,k210-sysctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Canaan Kendryte K210 System Controller Device Tree Bindings
+
+maintainers:
+  - Damien Le Moal <damien.lemoal@wdc.com>
+
+description:
+  Canaan Inc. Kendryte K210 SoC system controller which provides a
+  register map for controlling the clocks, reset signals and pin power
+  domains of the SoC.
+
+properties:
+  compatible:
+    allOf:
+      - items:
+          - const: canaan,k210-sysctl
+          - const: syscon
+          - const: simple-mfd
+
+  clocks:
+    description:
+      System controller Advanced Power Bus (APB) interface clock source.
+
+  clock-names:
+    maxItems: 1
+    items:
+      - const: pclk
+
+  reg:
+    maxItems: 1
+    description:
+      Offset and length of the system controller register space.
+
+  reg-io-width:
+    const: 4
+
+  clock-controller:
+    # Child node
+    type: object
+    $ref: "../clock/canaan,k210-clk.yaml"
+    description:
+      Clock controller for the SoC clocks. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml.
+
+  reset-controller:
+    # Child node
+    type: object
+    $ref: "../reset/canaan,k210-rst.yaml"
+    description:
+      Reset controller for the SoC. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml.
+
+  syscon-reboot:
+    # Child node
+    type: object
+    $ref: "../power/reset/syscon-reboot.yaml"
+    description:
+      Reboot method for the SoC. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml.
+
+required:
+  - compatible
+  - clocks
+  - reg
+  - clock-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/k210-clk.h>
+    #include <dt-bindings/reset/k210-rst.h>
+
+    clocks {
+      in0: oscllator {
+        compatible = "fixed-clock";
+        #clock-cells = <0>;
+        clock-frequency = <26000000>;
+      };
+    };
+
+    sysctl: syscon@50440000 {
+      compatible = "canaan,k210-sysctl",
+                   "syscon", "simple-mfd";
+      reg = <0x50440000 0x100>;
+      reg-io-width = <4>;
+      clocks = <&sysclk K210_CLK_APB1>;
+      clock-names = "pclk";
+
+      sysclk: clock-controller {
+        #clock-cells = <1>;
+        compatible = "canaan,k210-clk";
+        clocks = <&in0>;
+      };
+
+      sysrst: reset-controller {
+        compatible = "canaan,k210-rst";
+        #reset-cells = <1>;
+      };
+
+      reboot: syscon-reboot {
+        compatible = "syscon-reboot";
+        regmap = <&sysctl>;
+        offset = <48>;
+        mask = <1>;
+        value = <1>;
+      };
+    };
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
