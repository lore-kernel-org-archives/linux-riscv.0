Return-Path: <SRS0=J7tQ=FR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE2AC4361B
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 13:51:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A537922AB0
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 13:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A537922AB0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jEzFt0uCpwc+t5QRinp+t8HHpdQWgR8R4IZbejarN6Y=; b=m/Wjxk7FCwfnPjt+8wz+CPFlF
	XPX7vquQQ1+cD2o3lzUDDGlRkIvP+J27MgQL1qE0YOBjDxdMWKfWlAzLhlsSJe7/sfu7M9/JsSVYs
	NMcmjcPrKpNt0mp2VBUja78+cbbHQLe9IiXRD8tkU/rOAm9CewCXDE9SFG7HyjMe3AbR3YayLnUp3
	LkMYTibsvBQ2E7C5BX+Lc5Dbh+fe9ff9OeetZwLCLZP5B6ikKUS8cCNvNa20/bDGoDkZiM3ByA8/c
	33je5fOPR77E3hmVriXV6W8yfrkzmcv7sTp/vLaiYSxto8SHp9S77nEec+cUQuY4xg5r3KkKEkVo/
	zhdtGJLgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koRme-0000Mb-Ag; Sun, 13 Dec 2020 13:51:32 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koRmX-0000IP-KE
 for linux-riscv@lists.infradead.org; Sun, 13 Dec 2020 13:51:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607867486; x=1639403486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MQK/vb8NBPxRh5mHQhMV5bOBm1Zq0AgJmS+3j2J54wg=;
 b=KQApOo40l+IWgEKVuI23WT8FYOp3HNlVfsV8ifiQOspLn/HLYVLp5eHV
 itrsHI5CD2hEFdj50RFrL2gD3II16Xv7Cs/sAKp0S5N+9XLamjga29he+
 IHByjvNu6etAdwgU/0ibHS8Pr4qjIibnUs9lb9VB4nGm3FbUGMiGPcbIl
 /npiSEIJOxHgLxvL/IJSmRGti44HMPN3D/Dt2OSPoLYWkiWDoiKgs6HUN
 pjCGGwDcEo3RTAB2dNfRp48ZaUSOfetbgaT6I/LUyJ7Ry2blyyfF+iucg
 6z27yMiKKSDS6iVSNL0CbVNRPHgQ6lAIuc8d26z9HpOCrW1D/ld+4s4I1 A==;
IronPort-SDR: V6Opx7S9PG9ZDndADifHHCqFpTTxMyuN/9LZtREyAguV3wudyuyrN1y/A/4lwnm1QtNTIJvA2A
 S9hJAtVTxkgMACqwx7o3zFHFzdBxY01H5yWU6rxPnlZTIpB42QLsp82Fw+V7UIkc3MfR5nXLfB
 0Y7JxkJyLkryBZHEblFc0KkuwPbXiH9V/MYl8yujp+CIjrFRfvvs93iJFsNspp1psqhUCl7Mil
 V3tTjQpII6/md2p6DBpdLHPM5P5uOOYI1+x/zgHaiUG1FhZONQ7PYPGiQrMr7y8r2A78nLEFDo
 kr0=
X-IronPort-AV: E=Sophos;i="5.78,416,1599494400"; d="scan'208";a="156242579"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 21:51:25 +0800
IronPort-SDR: G155RTVrLFXLKVluSFW+xnAzfT9gc/THQ4Xmjv3z12nufOFPD934HUiS2jfr+4AV2/acBf6QzF
 /1jx9tXuoGLNBrXIOtMBSRCItd7lfr30LQZsqv28geEv/zsldkl3NhvHK+xvnwrBEVfa6wW5Ae
 twSTm+UAIz28KCb4KkBxFwZYshmrqnDyR6+lA3DbBIU9CraD8PwFrRs/BrQghBrc9cqH4SMyf4
 +8UmKI4UgrOp4pVpRqxh3xOyADAtguFjc1EhaEzzSJgRa9xUZT7l700TJInvo6nMjHQUKlWFZU
 ZCplNJ/djMKGHcznLKTnX3Ib
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2020 05:35:10 -0800
IronPort-SDR: cnx2i2INf7rCAeZ3gRVqQDnghQDFS5YLOWXS9TOpQcKvylpvV8Xiqo4hG94JjeT96CCviVO6Az
 Mor35TtgLQVDdNj6NyKwNG7gC/4hhadp7ZIgDh4I0b+SHuCPoqxGAYWO0DkWqk9ml8OjxuusYY
 C3ewyCTHhllC/Jx/gZ1qFpNO6pas8xMlig9hJBt8poh891D7T0pcM1pZoqLlvSjrE2oMBsY+Yg
 TsFBCC6OHRHkhqByk1TUamY3ODhumbX1HOrxZxIDDsj48gf0UggTOZK/Zbz8MU96k9ClD+ZhmB
 4uA=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.197])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Dec 2020 05:51:23 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v10 12/23] dt-binding: mfd: Document canaan,
 k210-sysctl bindings
Date: Sun, 13 Dec 2020 22:50:45 +0900
Message-Id: <20201213135056.24446-13-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213135056.24446-1-damien.lemoal@wdc.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_085125_853099_9C7A7266 
X-CRM114-Status: GOOD (  15.00  )
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
