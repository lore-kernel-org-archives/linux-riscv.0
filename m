Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C75CCA6012
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 09:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/sx9E4PGHMzmwsIm/MpDDtovZhmvKhy2CL3SXt8m0ks=; b=Yrgx/VFkQx+tDW
	wlo2P5VeZOw47wDwSXE1TGJZv3efobqGajg8rCW8ANa/XN7cubrQguCYixLy63HiPXa5Fm7dUT77T
	Z3WhCSuMsCWu2/xds77ZhhZDcIqkPjZ4WSK4w/0VtC3WcovGmYi19jcdcnTG34qmi1SfDqnWlV1fz
	PtehoUdpLXeFIxW24/0x662C3BbsLCA3ll1a0ATWNafUvA8NPRNWrALEE9ZJ/IF0m8SLET6rtVSj3
	t/8gufAm9D3NhMG4r9guNuN/fSiKci1KIdjxQVA3VB7qUbLYKePWQ3RcpnYNeLJ3ayYEJB/B+KCDV
	V8AxvH3m1RCWC4S6uYEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6XJ-00000005sUj-0ACT;
	Fri, 09 Oct 2026 09:05:05 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6XG-00000005sT9-17Lp;
	Fri, 09 Oct 2026 09:05:04 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.127])
	by APP-03 (Coremail) with SMTP id rQCowADn5zUyrshqvgohCg--.407S3;
	Fri, 09 Oct 2026 17:04:56 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wei Fu <wefu@redhat.com>,
	Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH v3 1/2] dt-bindings: phy: add binding for T-Head TH1520 USB PHY
Date: Fri,  9 Oct 2026 17:04:43 +0800
Message-ID: <20261009090444.3319517-2-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009090444.3319517-1-zhengxingda@iscas.ac.cn>
References: <20261009090444.3319517-1-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowADn5zUyrshqvgohCg--.407S3
X-Coremail-Antispam: 1UD129KBjvJXoWxurWfAr1DCFWDuFWrKr4rZrb_yoW5GFW3pa
	yfGryftrnagrna9w4ftF10kF1Syrs5ZF1Fqr17Ww18Xws0g3WFq3sIkry5ZF48Jr48ZFW2
	9Fs09ry2kF17Cw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x0JU4OJ5UUUUU=
X-Originating-IP: [112.94.100.127]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_020502_677096_863BDF9D 
X-CRM114-Status: GOOD (  13.47  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The TH1520 SoC features a Synopsys USB 3.0 FemtoPHY with some custom
glue logic configuring PHY parameters.

Add a binding for it.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
Changes in v3:
- Re-add avdd33-usb3-supply to the required properties list.
- Add reg to the required properties list, as this is a MMIO peripheral.
Changes in v2:
- Lifted avdd33-usb3-supply from required properties list. Because of
  this the R-b from Conor isn't added yet for reconfirmation. (The
  related regulator isn't yet controllable because no driver is
  available.)

 .../bindings/phy/thead,th1520-usb-phy.yaml    | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/thead,th1520-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/thead,th1520-usb-phy.yaml b/Documentation/devicetree/bindings/phy/thead,th1520-usb-phy.yaml
new file mode 100644
index 0000000000000..0d2494a71b2bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/thead,th1520-usb-phy.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/thead,th1520-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-Head TH1520 USB PHY
+
+description: |
+  The T-HEAD TH1520 USB PHY is a Synopsys USB 3.0 FemtoPHY glued with some
+  custom logic to configure PHY parameters.
+
+maintainers:
+  - Icenowy Zheng <zhengxingda@iscas.ac.cn>
+  - Wei Fu <wefu@redhat.com>
+  - Drew Fustini <dfustini@tenstorrent.com>
+
+properties:
+  compatible:
+    const: thead,th1520-usb-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: PHY bus clock
+      - description: PHY reference clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: ref
+
+  resets:
+    items:
+      - description: PHY bus reset
+      - description: PHY reset
+
+  reset-names:
+    items:
+      - const: bus
+      - const: phy
+
+  avdd33-usb3-supply:
+    description: |
+      3.3V power supply for the PHY, named AVDD33_USB3 in the SoC pin list.
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - avdd33-usb3-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@ec030000 {
+      compatible = "thead,th1520-usb-phy";
+      reg = <0xec030000 0x10000>;
+      #phy-cells = <0>;
+      clocks = <&clk_misc 1>, <&clk_misc 3>;
+      clock-names = "bus", "ref";
+      resets = <&rst_misc 6>, <&rst_misc 7>;
+      reset-names = "bus", "phy";
+      avdd33-usb3-supply = <&avdd33_usb3>;
+    };
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
