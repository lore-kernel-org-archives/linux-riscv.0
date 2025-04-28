Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E878C369D3
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 07:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mzat8YPD0AvjwkCp4+POCyRlK2u06CbpUal9WCvcuxA=; b=whdldddO0zKery
	zwXxIcrcyydxHe+gcrMSW8l+ZtJFc1G9r5Vu+ktQmomokFEosr/O60tvlG73z1MhAWE2VLiWHXGaI
	B2G47Pce18sdGxmm7eTb25nVbqLDbX6HSg2TTQnwfR8JfLirriqezIAznfWjsYED0KZuhNL67iN6y
	NF/tQVMI8pGRtGQSk+nbbJCKIvx+CWMtIWMdzrw5sjYc8HgxlRM6Lu8mRZjsEh63o0zKFYny4PY42
	uN8RhlyJ6wPLfrTT/bAJpHeVbDg8hekhWx+gHA9Yu+8Ob62FneelTkN+OQJAYxfvMwipbZ+DtJf/p
	acaxbdfdm9ThgWJxkwqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9JHM-00000005Jds-1BBR;
	Mon, 28 Apr 2025 07:51:52 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9J4S-00000005Gm0-3gnh
	for linux-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 07:38:35 +0000
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-4-entmail-virt151.gy.ntes [27.18.99.221])
	by smtp.qiye.163.com (Hmail) with ESMTP id 135f5a5ad;
	Mon, 28 Apr 2025 15:38:23 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Mon, 28 Apr 2025 15:38:11 +0800
Subject: [PATCH 1/2] dt-bindings: usb: dwc3: add support for SpacemiT K1
MIME-Version: 1.0
Message-Id: <20250428-b4-k1-dwc3-v2-v1-1-7cb061abd619@whut.edu.cn>
References: <20250428-b4-k1-dwc3-v2-v1-0-7cb061abd619@whut.edu.cn>
In-Reply-To: <20250428-b4-k1-dwc3-v2-v1-0-7cb061abd619@whut.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huangze@whut.edu.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745825898; l=3090;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=CoIzsEZMyr39KazbVfZyOeCYt7jqNxYasrhcXgzRiw4=;
 b=VafuAbLYli3pLw7uTELkEWZhH9nZF4oxDPYqog6wNcJ/qkjnoib83skFt6u+36RbW6MV0XFTZ
 t2c4+FrBmEEBkbMc/VRWy173JhQl4W2c2DjlpU14exHyIU01l36kPzX
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTE9PVkpNTElIQ04ZHUgfQ1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVJSUpZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVUpCS0
	tZBg++
X-HM-Tid: 0a967b55360e03a1kunm135f5a5ad
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NzI6ASo*DjIBFTU0HyIvAUJL
	MjgaCxpVSlVKTE9OQ0lOQktCT0NPVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVJSUpZV1kIAVlBT05JTzcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_003833_127142_AD80DF59 
X-CRM114-Status: GOOD (  11.11  )
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
in
the SpacemiT K1 SoC. The controller is based on the Synopsys DesignWare
Core USB 3 (DWC3) IP, supporting both Host and Device modes for USB 3.0
and USB 2.0 standards.

Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
 .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  | 95 ++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..5aece388900fa5bda9acb19add658310064bef8f
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
@@ -0,0 +1,95 @@
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
+  The SpacemiT K1 embeds a DWC3 USB IP Core which supports both Host and Device
+  functions for USB 3.0 and USB 2.0 standards.
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
+  The common content of the node is defined in snps,dwc3.yaml.
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - spacemit,k1-dwc3
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - spacemit,k1-dwc3
+      - const: snps,dwc3
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: bus_early
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
+additionalProperties: false
+
+examples:
+  - |
+    usb@c0a00000 {
+        compatible = "spacemit,k1-dwc3", "snps,dwc3";
+        reg = <0xc0a00000 0x10000>;
+        clocks = <&syscon_apmu 16>;
+        clock-names = "bus_early";
+        resets = <&syscon_apmu 8>;
+        interrupt-parent = <&plic>;
+        interrupts = <125>;
+        interconnects = <&dram_range0>;
+        interconnect-names = "dma-mem";
+    };

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
