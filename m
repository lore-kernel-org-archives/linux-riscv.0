Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E990C54ED1
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 12:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gz5HseSocqt6QYOvlgqHfo9O2umAJX4CNEEMLzTsvRM=; b=l6L8JFysu4X2Vc
	W+fCQmRe7eLxTNaOvQ+5T3LAwM9Z3vLIVbjyQi9yOMZWpBo2rAaYVJbxV1XJ11iujsmFNjPy8ZOJa
	1N2fR1oom27OKNmtppUyYgbcX1ZWI4anPsRo1955O0ItH0KUq8T/bVOhp0mYYprTI8lZqGt8u8g3J
	Ga4uo9gwDRPNMcA0Li0lO/1bnIgnpCUwJ743ipSz/UhKEpPLBUqpKXOP49ooR8EU+TFCoVeeHpJar
	TO6wq+6vOKtIw6CQqyz30guVMhmqMmrmZh+kXZFFzEh5rh4Onv+n2Hqq64EkWKflkrZhviPXxAbZj
	PRvYUuEFKYMSwP8BbuYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJt09-0000000AeMf-14Ra;
	Tue, 27 May 2025 12:01:49 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJt05-0000000AeIh-2jQP;
	Tue, 27 May 2025 12:01:47 +0000
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [27.18.99.37])
	by smtp.qiye.163.com (Hmail) with ESMTP id 169309535;
	Tue, 27 May 2025 20:01:38 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Tue, 27 May 2025 20:01:16 +0800
Subject: [PATCH v5 2/4] dt-bindings: phy: spacemit: add K1 PCIe/USB3 combo
 PHY
MIME-Version: 1.0
Message-Id: <20250527-b4-k1-usb3-phy-v2-v5-2-2d366b0af999@whut.edu.cn>
References: <20250527-b4-k1-usb3-phy-v2-v5-0-2d366b0af999@whut.edu.cn>
In-Reply-To: <20250527-b4-k1-usb3-phy-v2-v5-0-2d366b0af999@whut.edu.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748347285; l=2717;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=7wRZijPTWkMIjtlbhD5lqHbIBKaLm3eG7ixPg9G+vh4=;
 b=XP1U3pSMWre1S31zT8drPg2Uj/71asthvklLTsIEJzD1cM0Tn8dJg9UB+Exuiu1LeVTdBW8tw
 85creN3IUpSD+VsL1Z+p06OqQzqENVqPpwdwAEpGSkekJsBbH3y/pqb
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTEJLVk9PQh8YS0xMGE4eQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVITFlXWRYaDxIVHRRZQVlPS0hVSktJQk1KSlVKS0tVS1kG
X-HM-Tid: 0a97119ea17003a1kunm8e523759adf5c
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mwg6OBw4UTE5OlY8UT5JPzg3
	SEoaC0hVSlVKTE9DSE9MSEtITUxNVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVITFlXWQgBWUFPSkhONwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_050145_946837_01855888 
X-CRM114-Status: UNSURE (   7.58  )
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Co-developed-by: Junzhong Pan <junzhong.pan@spacemit.com>
Signed-off-by: Junzhong Pan <junzhong.pan@spacemit.com>
Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
 .../bindings/phy/spacemit,k1-combphy.yaml          | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/spacemit,k1-combphy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k1-combphy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..93f7a3bb06bba380def77f87f6db0184af26e9e6
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
+  - Ze Huang <huangze9015@gmail.com>
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
