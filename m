Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C7FC369A2
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 16:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OWdN6LNEPYWer3Yzb2DFTVkJ9Jav9dfv2TPvIvDFYBc=; b=TSX/jgR+gXum8O
	j746yhBIY1v3F4HTYS0OlSTRryrlT9BUmOIvvhThUzL8xLII/jt9Q1xfGjDVFHOmae/hIsrlTLt4K
	jqqoujBIqB5GQ2QvM2DFDpuIvxOzXSnVPBx2hGmKMrw0d2O2WpNvvCbB800ypPoklQAcoAwKEQ3qO
	ZAEXTR634gVgVexQXqOVb436VIwGa2DguDPqane7jKnmK1aOvodCJtiX/xs5KiflXHj6GUqx+Vorc
	W44CJZdBAu2EefG1iOD+2KjcRHZvtOlN4GxDIkA7uVnrG91h2Ye+p92mncmPvJ8UnsjM2y5GZLZ/E
	zHnol5YSaCpspwCMRJPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pJx-00000001Aci-0Zdn;
	Mon, 07 Apr 2025 16:27:37 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lqF-00000000Kg0-0ESS;
	Mon, 07 Apr 2025 12:44:44 +0000
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.18.106.237])
	by smtp.qiye.163.com (Hmail) with ESMTP id 10ef566e8;
	Mon, 7 Apr 2025 20:39:33 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Mon, 07 Apr 2025 20:38:46 +0800
Subject: [PATCH 1/7] dt-bindings: phy: spacemit: add K1 USB2 PHY
MIME-Version: 1.0
Message-Id: <20250407-b4-k1-usb3-v3-2-v1-1-bf0bcc41c9ba@whut.edu.cn>
References: <20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn>
In-Reply-To: <20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Ze Huang <huangze@whut.edu.cn>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744029565; l=1364;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=06AK6QCzrNsaSeCaNUjtkIsTuO5Ff1yFycP5j8rIQ+U=;
 b=+MH2aDlKTFotCOTZXikiqGkLorQrDwaSqn6wMYfOjPhCwXXNRPWZ4rUwPOHEo5CemkiEoQK8/
 o+aENhF7C6LAR018bXmzp9EpK+1oTekInmDmnqqe1Ep5K/78fjSMTK4
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGUtOVkpLTEofGEJLS0NKSFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VKS01VSUhMWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09LVUpLS1VLWQ
	Y+
X-HM-Tid: 0a96104362f403a1kunm10ef566e8
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pyo6OCo5AjJKF0wOEhUuGjM9
	LSNPCzNVSlVKTE9PS0lCTkNLTUpJVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VKS01VSUhMWVdZCAFZQUlCQkI3Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_054443_255311_5F0C8485 
X-CRM114-Status: UNSURE (   8.84  )
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

Add support for USB2 PHY found on SpacemiT K1 SoC.

Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
 .../devicetree/bindings/phy/spacemit,usb2-phy.yaml | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ea999cff9c250b144dd049e5ac3c084b22bd56ea
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/spacemit,usb2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 SoC USB 2.0 PHY
+
+maintainers:
+  - Ze Huang <huangze@whut.edu.cn>
+
+properties:
+  compatible:
+    const: spacemit,k1-usb2-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    usb-phy@c09c0000 {
+        compatible = "spacemit,k1-usb2-phy";
+        reg = <0xc09c0000 0x200>;
+        clocks = <&syscon_apmu 15>;
+        #phy-cells = <0>;
+    };

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
