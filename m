Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4CAC7EE30
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 06:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K+znlClrZcjg0wW1MnE0aoHq1K+sfZ9j26JTDlNfj5Y=; b=WG4EGecYXC5kwG
	vsbdOn9n6M9ed6JRvo2/djk3Xb17efIZNvvkNGWfmkAkeggZoO/lclitO+qHYSjilVzLY5DQM+RZt
	NHMPMLVIK94DGfPov3/GrLJ+JgLIHuDcfd+cOP4LTr5VHLVr2jIMiMonbGGU/xAGqRFLtNcGHV6d0
	FpsdSHD7Ub4n5SN9n2Yu612r2U+r+5x8JGKn0iddqAaj2hH02EVyrqNjkQgnE31oDMSrk+NrdY2ap
	L7cU9qiROafoyPGIcMKuhVJ1msjDCzaD/zkW1rLl8RyfWJsoQ4MvkipPXe64vOB72Vf0km/hbpKsZ
	8DOpc69EKnRK+9ngassA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWqYL-00000007Lk0-3nnq;
	Wed, 02 Jul 2025 06:02:41 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWqYE-00000007LfC-3QDI
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 06:02:38 +0000
Received: from [127.0.0.2] (unknown [210.73.43.2])
	by APP-01 (Coremail) with SMTP id qwCowAC3pqpny2RomPduAA--.1282S3;
	Wed, 02 Jul 2025 14:02:16 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Wed, 02 Jul 2025 14:01:40 +0800
Subject: [PATCH net-next v3 1/5] dt-bindings: net: Add support for SpacemiT
 K1
MIME-Version: 1.0
Message-Id: <20250702-net-k1-emac-v3-1-882dc55404f3@iscas.ac.cn>
References: <20250702-net-k1-emac-v3-0-882dc55404f3@iscas.ac.cn>
In-Reply-To: <20250702-net-k1-emac-v3-0-882dc55404f3@iscas.ac.cn>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Vivian Wang <uwu@dram.page>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-CM-TRANSID: qwCowAC3pqpny2RomPduAA--.1282S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Cry3WF45trW5KrW5Zr4rGrg_yoW5Jr1xpF
	4fCrs3Gr48KF13Jw4fXFykuF1fGw4kAF1DJrZFvw13tas5KF90qr4akryfXa4UurW8Ja43
	XF1DAryDKr1DAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI48JMxC2
	0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
	0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
	14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20x
	vaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8
	JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRRYFCUUUUUU==
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_230235_224318_84C26534 
X-CRM114-Status: GOOD (  11.05  )
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

The Ethernet MACs on SpacemiT K1 appears to be a custom design. SpacemiT
refers to them as "EMAC", so let's just call them "spacemit,k1-emac".

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/net/spacemit,k1-emac.yaml  | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/spacemit,k1-emac.yaml b/Documentation/devicetree/bindings/net/spacemit,k1-emac.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..500a3e1daa230ea3a1fad30d8ea56a7822fccb3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/spacemit,k1-emac.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/spacemit,k1-emac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 Ethernet MAC
+
+allOf:
+  - $ref: ethernet-controller.yaml#
+
+maintainers:
+  - Vivian Wang <wangruikang@iscas.ac.cn>
+
+properties:
+  compatible:
+    const: spacemit,k1-emac
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  mdio-bus:
+    $ref: mdio.yaml#
+    unevaluatedProperties: false
+
+  resets:
+    maxItems: 1
+
+  spacemit,apmu:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to syscon that controls this MAC
+          - description: offset of control registers
+    description:
+      A phandle to syscon with byte offset to control registers for this MAC
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - resets
+  - spacemit,apmu
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+
+    ethernet@cac80000 {
+        compatible = "spacemit,k1-emac";
+        reg = <0xcac80000 0x00000420>;
+        clocks = <&syscon_apmu CLK_EMAC0_BUS>;
+        interrupts = <131>;
+        mac-address = [ 00 00 00 00 00 00 ];
+        phy-handle = <&rgmii0>;
+        phy-mode = "rgmii-id";
+        pinctrl-names = "default";
+        pinctrl-0 = <&gmac0_cfg>;
+        resets = <&syscon_apmu RESET_EMAC0>;
+        rx-internal-delay-ps = <0>;
+        tx-internal-delay-ps = <0>;
+        spacemit,apmu = <&syscon_apmu 0x3e4>;
+
+        mdio-bus {
+            #address-cells = <0x1>;
+            #size-cells = <0x0>;
+
+            rgmii0: phy@1 {
+                reg = <0x1>;
+            };
+        };
+    };

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
