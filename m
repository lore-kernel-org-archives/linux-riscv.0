Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37F2C2D0CD
	for <linux-riscv@archiver.kernel.org>; Sat, 17 May 2025 19:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=waPKl0Xc5YWv1BIjg1YgVxVwLIvxuDE1h+6dH5G6Fq4=; b=2Cu2FYd3dnyOFt
	hgR+2jj4SIwbVkzU4511ZOzpLoTfnBSxeF6gKKMTIC9YaJNbl0ly0ZwJ9+LH7x95SLx7dZ3Ht4vmN
	pEXe0EzYnmHyKCfpp7R/aAW8472LPHlJcD8O4t+FR5FJUcP5jO9USKqDzB980Z9HFN6i40ui40tlJ
	rpH0iWbzqNQNHzEe7IKbp2knrZJzlFaAdULMy8B7gYcKPljHponLqxtpPPswE+qSrQ8avGEXhQtlJ
	/hPRRfl4GCNPmPmTgZ+YxP3ferBy3r5MKUX0W+b7nuL9TKG43yaYqgr9dCH8duTNTKAd6S7jUYyEq
	AUQcQbGC+nxplSymSGzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGN4j-00000006Awd-30gU;
	Sat, 17 May 2025 19:20:01 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGN4h-00000006Avo-25eF
	for linux-riscv@lists.infradead.org;
	Sat, 17 May 2025 19:20:00 +0000
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [27.18.99.32])
	by smtp.qiye.163.com (Hmail) with ESMTP id 15658ef43;
	Sun, 18 May 2025 03:19:51 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Sun, 18 May 2025 03:19:19 +0800
Subject: [PATCH v3 1/3] dt-bindings: usb: dwc3: add support for SpacemiT K1
MIME-Version: 1.0
Message-Id: <20250518-b4-k1-dwc3-v3-v3-1-7609c8baa2a6@whut.edu.cn>
References: <20250518-b4-k1-dwc3-v3-v3-0-7609c8baa2a6@whut.edu.cn>
In-Reply-To: <20250518-b4-k1-dwc3-v3-v3-0-7609c8baa2a6@whut.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huangze@whut.edu.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747509584; l=2805;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=q4+q4KP0i1Wc2LpG8lcLj/nJxJ4h5HU8IRe3ZcTOc8M=;
 b=1BLejhDbCoTqProPlguK1gw2+w6G0OrAWxh2AG82n4IPItJpo/7ugJKtVo9pO+fgfIamEElbu
 vbIV55koxkrB6m6TLkCrL//Z88lK2mv4LmUdWkS9GM9tHaQkFH6bQ11
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHh5IVkxISk5NTkJNS0NCHlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVISVlXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0tVSkJLS1
	kG
X-HM-Tid: 0a96dfb03e9603a1kunm15658ef43
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MiI6TSo6SjE1PioeNBkoLBEV
	EDQwCjJVSlVKTE9MTktCTkJMTkNOVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVISVlXWQgBWUFPSElCNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250517_121959_702547_BCE435CE 
X-CRM114-Status: GOOD (  10.66  )
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

Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
 .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..2fb9f1014c4e901417818a37b6289814a2d3d49a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/spacemit,k1-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 SuperSpeed DWC3 USB SoC Controller
+
+maintainers:
+  - Ze Huang <huangze@whut.edu.cn>
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
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 1
+    description:
+      On SpacemiT K1, USB performs DMA through bus other than parent DT node.
+      The 'interconnects' property explicitly describes this path, ensuring
+      correct address translation.
+
+  interconnect-names:
+    const: dma-mem
+
+  vbus-supply:
+    description: A phandle to the regulator supplying the VBUS voltage.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - interrupts
+  - interconnects
+  - interconnect-names
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
+        resets = <&syscon_apmu 8>;
+        interrupt-parent = <&plic>;
+        interrupts = <125>;
+        interconnects = <&mbus0>;
+        interconnect-names = "dma-mem";
+    };

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
