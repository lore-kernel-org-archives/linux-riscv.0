Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9FDC369A3
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 15:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZIhoj0Kx1pP+u1WH+/dzvefBS9POmHQzzihezaFyNoM=; b=NqeGa71D9RwosX
	qPQ4gQWO0lKR5Pa9rgZ67BP+nKMQQwmqNoSpdnBdq1liPFhKZQEaXDawAEiMYIDLoG+pTvQAlIuYX
	VTrjogmjdvdM5/wTUWr2laYa41i8Acb7MYA9e4MpN+6JbFCSZVoyrDF3Dw8+so/Wu8Zdl95YhKUAf
	V86+xIDXCqqhpfv9cBDMWbVPzg1plzfb8nLOWZbo8Hjk14Z/1jOlqNhKDm1Xka75fts7utGiFBJbE
	rDC4ob8y5QBwSUVV5YCD4Pkq3I1QEvj/hdtgkNAkkyVlIQPaAmpzXFcJc7KacQl7Cb1qdbehomoa+
	wgcv/0po+OLo1AxNYg5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1o9M-00000000tid-1qle;
	Mon, 07 Apr 2025 15:12:36 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lld-00000000JO8-1hv5;
	Mon, 07 Apr 2025 12:39:58 +0000
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.18.106.237])
	by smtp.qiye.163.com (Hmail) with ESMTP id 10ef566ef;
	Mon, 7 Apr 2025 20:39:48 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Mon, 07 Apr 2025 20:38:48 +0800
Subject: [PATCH 3/7] dt-bindings: usb: add SpacemiT K1 DWC3 glue
MIME-Version: 1.0
Message-Id: <20250407-b4-k1-usb3-v3-2-v1-3-bf0bcc41c9ba@whut.edu.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744029565; l=2481;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=Ur2UYtwusU/2jhypNHuXu4S43HheHrAbZbGlidbsqbw=;
 b=T7LLTfJr2rsbvI8oM55Upyk0Uwva1Xpbcb+1KdT75dXJ1H793CI1zzouVqa3+uuqOpRVchxkI
 83BOogxo8ubD3QYxoS1b1+rZpFw+qHlsjYKJJEngIl2p0QxuefQWXfU
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHk1LVkxMGkwYQksdSRhJQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VKS01VSUhMWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a9610439daa03a1kunm10ef566ef
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ngg6Fio5OTJLA0wiKBYKGjIL
	FRUwFC1VSlVKTE9PS0lCTkJOTUNNVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VKS01VSUhMWVdZCAFZQU9KSk03Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_053957_617765_2D38F839 
X-CRM114-Status: UNSURE (   9.05  )
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

Add support for SpacemiT DWC3 glue driver, which manages interrupt,
reset and clock resource.

Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
 .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..40ce3fd1330d5f371ec69155c237e10a65a9d8f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/spacemit,k1-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 SuperSpeed DWC3 USB SoC Controller Glue
+
+maintainers:
+  - Ze Huang <huangze@whut.edu.cn>
+
+properties:
+  compatible:
+    const: spacemit,k1-dwc3
+
+  ranges:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interconnects:
+    description:
+      On SpacemiT K1, USB performs DMA through bus other than parent DT node.
+      The 'interconnects' property explicitly describes this path, ensuring
+      correct address translation.
+
+  interconnect-names:
+    const: dma-mem
+
+  # optional
+  vbus-supply:
+    description: A phandle to the regulator supplying the VBUS voltage.
+
+patternProperties:
+  '^usb@':
+    $ref: snps,dwc3.yaml#
+
+additionalProperties: false
+
+required:
+  - compatible
+  - ranges
+  - clocks
+  - resets
+  - interrupts
+  - interconnects
+  - interconnect-names
+
+examples:
+  - |
+    usb@c0a00000 {
+        compatible = "spacemit,k1-dwc3";
+        clocks = <&syscon_apmu 16>;
+        interrupts = <149>;
+        interconnects = <&dram_range0>;
+        interconnect-names = "dma-mem";
+        ranges = <0x0 0xc0a00000 0x10000>;
+        resets = <&syscon_apmu 8>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        status = "disabled";
+
+        usb@0 {
+            compatible = "snps,dwc3";
+            reg = <0x0 0x0 0x0 0x10000>;
+            interrupt-parent = <&plic>;
+            interrupts = <125>;
+            phys = <&usb_phy2>, <&usb_phy3 2>;
+            phy-names = "usb2-phy", "usb3-phy";
+        };
+    };

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
