Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22F6C83F1A
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jul 2025 07:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MO4ZOAj1vy/BDFtIiH289J7e2L3g5HEwNwmXnejGckE=; b=nZkzmOzZYe3U3N
	UW5wYxlRvR/ZvTL7EESrCe8a96ZVeYfOCE+5Fywkf4y+bArofRoitloNwdfC0iq7sTOg6aih+Mw9a
	IVW+9lSDYrAVOxkOMaZd661fGXzmN9JPyOjawitq5Y3xOzUngrbpqfC/Em21DkB9PTKx3UaWL2fGp
	vw4YMQ0lAiXVVkR72iFzpQwBoNVMuQdmniNZQEQTcgM2FZt/jm0mVZtbR0GlrBUqwPlYPmbc6psuT
	rsBRdo+p3WXEfeLF86einedX4GCWTdg9+yc9BFUsBVFuhKYW37aLubl43iNqyAUbuVwq5GMkz5tJP
	HPd4LZvXPn1VBSd5b9cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaV4v-0000000GNom-432k;
	Sat, 12 Jul 2025 07:55:25 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaUz3-0000000GNM4-3NZC
	for linux-riscv@lists.infradead.org;
	Sat, 12 Jul 2025 07:49:23 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752306559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wBgvW/iE1LkB7bwYAmcA+oY4+XdqZ43tYbO28WaPF5g=;
	b=dHWLuQkfZwvzpfCJ2oQZ7lWcFc+BDa6wpvipYHllcEG4/v37broc2yfoLTSVZT37i7XTm3
	Ni6at26DCLupV1PmlSQu3AldR4JfmuSCJw0GAABJjVcAXhheHoCbUdcOeuTSbJpR4FtA8/
	lex5a1XCzEFs6UKhHyhLadWjc6tUtZU=
From: Ze Huang <huang.ze@linux.dev>
Date: Sat, 12 Jul 2025 15:49:00 +0800
Subject: [PATCH v6 1/2] dt-bindings: usb: dwc3: add support for SpacemiT K1
MIME-Version: 1.0
Message-Id: <20250712-dwc3_generic-v6-1-cc87737cc936@linux.dev>
References: <20250712-dwc3_generic-v6-0-cc87737cc936@linux.dev>
In-Reply-To: <20250712-dwc3_generic-v6-0-cc87737cc936@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huang.ze@linux.dev>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752306549; l=3493;
 i=huang.ze@linux.dev; s=20250705; h=from:subject:message-id;
 bh=MHl3ZXBiDxD/k69wjpMLIYoelGKwJ/a8qBFovR9xt8M=;
 b=zqLX1xHbzV3Hvjmht0PfnKwg0ktJ31e8PaKGh0VBKUyqYIrD6BRltSu99sGvlX9M3CGKvgVDZ
 YRs95OnkLZLDLCW2WuqqZs47FfqSp5BXnOKVvb37rD/mHXkkoxWRY8c
X-Developer-Key: i=huang.ze@linux.dev; a=ed25519;
 pk=Kzc4PMu5PTo8eZZQ5xmTNL9jeXcQ9Wml0cs+vlQpBkg=
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_004921_994927_0D67089D 
X-CRM114-Status: GOOD (  11.42  )
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

Add support for the USB 3.0 Dual-Role Device (DRD) controller embedded
in the SpacemiT K1 SoC. The controller is based on the Synopsys
DesignWare Core USB 3 (DWC3) IP, supporting USB3.0 host mode and USB 2.0
DRD mode.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Ze Huang <huang.ze@linux.dev>
---
 .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  | 107 +++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c967ad6aae50199127a4f8a17d53fc34e8d9480b
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/spacemit,k1-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 SuperSpeed DWC3 USB SoC Controller
+
+maintainers:
+  - Ze Huang <huang.ze@linux.dev>
+
+description: |
+  The SpacemiT K1 embeds a DWC3 USB IP Core which supports Host functions
+  for USB 3.0 and DRD for USB 2.0.
+
+  Key features:
+  - USB3.0 SuperSpeed and USB2.0 High/Full/Low-Speed support
+  - Supports low-power modes (USB2.0 suspend, USB3.0 U1/U2/U3)
+  - Internal DMA controller and flexible endpoint FIFO sizing
+
+  Communication Interface:
+  - Use of PIPE3 (125MHz) interface for USB3.0 PHY
+  - Use of UTMI+ (30/60MHz) interface for USB2.0 PHY
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+properties:
+  compatible:
+    const: spacemit,k1-dwc3
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: usbdrd30
+
+  interrupts:
+    maxItems: 1
+
+  phys:
+    items:
+      - description: phandle to USB2/HS PHY
+      - description: phandle to USB3/SS PHY
+
+  phy-names:
+    items:
+      - const: usb2-phy
+      - const: usb3-phy
+
+  resets:
+    items:
+      - description: USB3.0 AHB reset line
+      - description: USB3.0 VCC reset line
+      - description: USB3.0 PHY reset line
+
+  vbus-supply:
+    description: A phandle to the regulator supplying the VBUS voltage.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - phys
+  - phy-names
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    usb@c0a00000 {
+        compatible = "spacemit,k1-dwc3";
+        reg = <0xc0a00000 0x10000>;
+        clocks = <&syscon_apmu 16>;
+        clock-names = "usbdrd30";
+        interrupts = <125>;
+        phys = <&usb2phy>, <&usb3phy>;
+        phy-names = "usb2-phy", "usb3-phy";
+        resets = <&syscon_apmu 8>,
+                 <&syscon_apmu 9>,
+                 <&syscon_apmu 10>;
+        vbus-supply = <&usb3_vbus>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hub_2_0: hub@1 {
+            compatible = "usb2109,2817";
+            reg = <1>;
+            vdd-supply = <&usb3_vhub>;
+            peer-hub = <&hub_3_0>;
+            reset-gpios = <&gpio 3 28 1>;
+        };
+
+        hub_3_0: hub@2 {
+            compatible = "usb2109,817";
+            reg = <2>;
+            vdd-supply = <&usb3_vhub>;
+            peer-hub = <&hub_2_0>;
+            reset-gpios = <&gpio 3 28 1>;
+        };
+    };

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
