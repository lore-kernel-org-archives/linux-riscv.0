Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F7BC369CF
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 13:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1DSZfG+VYmU/W6JKXNFSe0lkBPSb6ft99CtQWQc13Gk=; b=NrE86PCTFQ7Ru3
	VzCv6NaiC1KI5QAHlTI5kkziDWphKUOftGui0hd8kDSmAU6C3mFPqDMvcRVaeXXQMPMS4lEkm2KGv
	sPh48KL7cwResoKoJ3jz0AXxgX+//9BSTvhxC1ZNpRXUZ+K9Vt2aazIbbaBfbT5VNr0M6P9qsEf4a
	5hsgl3odENKifXZhk1fWlHy6vXRAuaLHB+65q8KB/IMbqTlqpD8BOC0kwo7U19SizMa6iPDQ53kho
	3Xk2HqEO5I3VWEA7px9WDpXiVN4eVNrwjIe3kiH2H3eCO2cJF/IanAhOnYCA0FmqZKD3dYis662v3
	klB5BBE7czSXQqL6pU/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5leS-0000000GCYL-25MR;
	Fri, 18 Apr 2025 13:21:04 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5leO-0000000GCVL-26JC;
	Fri, 18 Apr 2025 13:21:01 +0000
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [27.18.99.221])
	by smtp.qiye.163.com (Hmail) with ESMTP id 125ec8787;
	Fri, 18 Apr 2025 21:20:52 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Fri, 18 Apr 2025 21:19:51 +0800
Subject: [PATCH v2 2/4] dt-bindings: phy: spacemit: add K1 PCIe/USB3 combo
 PHY
MIME-Version: 1.0
Message-Id: <20250418-b4-k1-usb3-phy-v2-v2-2-b69e02da84eb@whut.edu.cn>
References: <20250418-b4-k1-usb3-phy-v2-v2-0-b69e02da84eb@whut.edu.cn>
In-Reply-To: <20250418-b4-k1-usb3-phy-v2-v2-0-b69e02da84eb@whut.edu.cn>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huangze@whut.edu.cn>, 
 Junzhong Pan <junzhong.pan@spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744982442; l=2608;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=D1sL+MKoiWYnzCfw5VcjgVF7TsQUjYsMqff/OclGflw=;
 b=AfFJSTjO27VFPjy91K6/Q14+WOfJE+34cDvt4xOWsI//lonQ579XfxmNnIJgR4nR03wp5iwJy
 SvkK6bjGMCuBhohwD9ZYwTVdlaxiGXim1ca5R0Y8okbUr+BWzb1ItV7
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGE4aVh4eSEtKH0lMGk1KH1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVJSUpZV1kWGg8SFR0UWUFZT0tIVUpLSUhCS0NVSktLVUpCWQ
	Y+
X-HM-Tid: 0a96490f2b8603a1kunm125ec8787
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PDY6Szo4IzJCDgkpPwkBEUgX
	NhMKCwxVSlVKTE9PQkNJT05DSk9KVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVJSUpZV1kIAVlBT0tJTDcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_062100_764056_E4DE279E 
X-CRM114-Status: UNSURE (   7.66  )
X-CRM114-Notice: Please train this message.
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

Introduce support for SpacemiT K1 PCIe/USB3 combo PHY controller.

PCIe portA and USB3 controller share this phy, only one of them can work
at any given application scenario.

Co-developed-by: Junzhong Pan <junzhong.pan@spacemit.com>
Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
 .../bindings/phy/spacemit,k1-combphy.yaml          | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/spacemit,k1-combphy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k1-combphy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3c2e7dfb34a27b5d9e0a14193d0cc1c64c16c8f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/spacemit,k1-combphy.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/spacemit,k1-combphy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 PCIe/USB3 Combo PHY
+
+maintainers:
+  - Ze Huang <huangze@whut.edu.cn>
+
+description:
+  Combo PHY on SpacemiT K1 SoC. PCIe port A and USB3 controller share this
+  phy, only one of PCIe port A and USB3 port can work at any given application
+  scenario.
+
+properties:
+  compatible:
+    const: spacemit,k1-combphy
+
+  reg:
+    items:
+      - description: PHY control registers
+      - description: PCIe/USB3 mode selection register
+
+  reg-names:
+    items:
+      - const: ctrl
+      - const: sel
+
+  resets:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 1
+    description:
+      Indicates the PHY mode to select. The value determines whether the PHY
+      operates in PCIe or USB3 mode.
+
+  spacemit,lfps-threshold:
+    description:
+      Controls the LFPS signal detection threshold, affects polling.LFPS
+      handshake. Lower the threshold when core voltage rises.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 0xff
+
+  spacemit,rx-always-on:
+    description:
+      Affects RX.detect, enhance compatibility of some DFPs in device mode but
+      increase power consumption.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - resets
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@c0b10000 {
+        compatible = "spacemit,k1-combphy";
+        reg = <0xc0b10000 0x800>,
+              <0xd4282910 0x400>;
+        reg-names = "ctrl", "sel";
+        resets = <&syscon_apmu 19>;
+        #phy-cells = <1>;
+    };

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
