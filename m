Return-Path: <SRS0=J7tQ=FR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37780C4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 08:11:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC1E022D6F
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 08:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC1E022D6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jEzFt0uCpwc+t5QRinp+t8HHpdQWgR8R4IZbejarN6Y=; b=z64Al574p83DJjrRElZH37rin
	Lid10kqGYPohb7mWYAWcJ0MtdLqi6AaT4OHIkVmptgOoxcypchm5Az5yIoEUoFz5PDlrmMBoyj6W/
	9GU5WMcHO0O/haCKtQ0Be8+pRq6om9pXiKZUKPSykrcomOliv4PT/yPpsCWdHlD8Fj75zYFV6rVWo
	slpjX48zm9x5SUOcsdhFQTm7LpnIQn76y7KXnVUarHbAFWd5btTj9SQn0jXe61O5knGynwjLmIyJh
	4K6CPNTUp8JfWZ33bjWJNGQCePg0bzu0yPxh5o4Oae/IGoKaY5L93w1Gga/53YzeaEof+D9sV2ttx
	IwhrRIWyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koMT6-0002fy-WD; Sun, 13 Dec 2020 08:11:02 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koMSp-0002Wh-FC
 for linux-riscv@lists.infradead.org; Sun, 13 Dec 2020 08:10:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607847043; x=1639383043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MQK/vb8NBPxRh5mHQhMV5bOBm1Zq0AgJmS+3j2J54wg=;
 b=FYQ8oJfYIE8IISRDj+7LFLSJH1HQbvSM4wo/Gp8wnvc6bLjEd20nM2F1
 ZQzzeE1p8BteEJcHw3R9UXetINjmYoZmclYhHz7MswuqG4+Sgpm2ohMbZ
 6RlhzJpt9jREDDwFKaaC1Gy4hH29H8VXwxZr+3YK00lrDrqUcNGmg/loD
 wNfQJzxAQ7mjwvEPfRQTMcUAJBPI+J1IHJRXTDBNFkCh/Ep1CyLtXdYWn
 9lgorzqYZ2/Y7hjRAzCo2QJXRKuX8xz45Gxi5gyYwuzEmFNu+CStO9Apu
 rrXQJDypvhV4EOGLnw9PPBhng28KSIB2w0pmJlNeVNs751svkl3pNLgJC w==;
IronPort-SDR: pFK64ppFHWct7nZspZmnuo5Mc6uBxvy8dgiER7vsXqK87UTWn2WnEgnM9h8zvdw7iZ2x6+jmF2
 CKP70vIixAiBHC6sBWf0aSjunHYFuwkoLY0cZQtmrrCCgrj+PwaQvJeP0n1jYKw8ZueMtppTnS
 F1DWM98tXdZ2JAuOkhyJQHp9tLyY/KVYqedqKsXJMCCt0M59vnWc4eT2fHCPajZhiG9FGVZadR
 m3eZMqhgczhH/pBF2etlamDytCBKdoLCgVJuHGiRV8kIlU8ZBrW31uFAj5/eyrrVM654F31x6l
 yP4=
X-IronPort-AV: E=Sophos;i="5.78,415,1599494400"; d="scan'208";a="156235155"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 16:10:43 +0800
IronPort-SDR: YjhqqWxhko6WfIaFfPbwGGoDqZyCwuLYIoVK5kQ4bZ6x7jwUfE/qucJbusZF5JeTVAJy3hEA4n
 5QdpQesLAfZPQhen4G0qLUNOYUIBN/hTiioFXHw3REYrrqP5CREiFURjpobvcy6iu6dJeYz9FQ
 hSyA6dRZF/0Wq0xsgvK98gbFeuvlbeyQjrGkB3xnlkHhoOjkQNBU2I8S/S2SpQThYXvFWwV10d
 OKI3vudPY1dDYGBHupGadExO5CVsgUSOieqatC6ThP1J+/fQgsHUH1udfOtZEc+Y7EDd5VLQLJ
 gE6hiOg+myYYtstw7QsFfxSF
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2020 23:54:31 -0800
IronPort-SDR: qEv9igjrrP4z4heeansmisFfCBHHetvIIUm3Lypue2sM68pUKqdyMFfWxXBbhPxoO9WkII4DKu
 mmFFInJovkIJHB6dwDQwLkVrvgTjIY7NI3NQiZ/SMzd7kQ4uIcCqiSg6Tg/+KOCu0tck0Z09mS
 7oSGEUEz8YkoGSgfUrOtj9REWJdHoesvL/602SP2+RX45oL6wa+2Y4ZQaZGkiOHu6jA0To2uF5
 QgkEkZ2Q8q/pGKUq76NudHGjxAs47FhsQG2ws43frCGPp6WNDdICK+WW3yCdf6QYxafKfb5TXx
 ToU=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.197])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Dec 2020 00:10:42 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v9 11/22] dt-binding: mfd: Document canaan,
 k210-sysctl bindings
Date: Sun, 13 Dec 2020 17:10:05 +0900
Message-Id: <20201213081016.179192-12-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213081016.179192-1-damien.lemoal@wdc.com>
References: <20201213081016.179192-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_031043_825034_DD82832C 
X-CRM114-Status: GOOD (  14.91  )
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
 .../bindings/mfd/canaan,k210-sysctl.yaml      | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml

diff --git a/Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml b/Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
new file mode 100644
index 000000000000..c24ad45cabb5
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
@@ -0,0 +1,109 @@
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
+    items:
+      - const: canaan,k210-sysctl
+      - const: syscon
+      - const: simple-mfd
+
+  clocks:
+    maxItems: 1
+    description:
+      System controller Advanced Power Bus (APB) interface clock source.
+
+  clock-names:
+    items:
+      - const: pclk
+
+  reg:
+    maxItems: 1
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
