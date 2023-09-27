Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B723E82CAE
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 16:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yh5O8dUxOBdNdDdeYfPDf6HKbWeOPNmSuDwSSZtogSQ=; b=cY12tlf+695GcH
	Y43fvYXcKX6OFdj3RqFiHzMaiH08d/G6yc+tyvJPhk1zdoabC2IHGpkEeibiWbZ1+JdRAZ/4Cnjg9
	6SIhG+FXQRzclP9h0pf4TN3oB/XMzdEop6A8Rskwid2/bqcHlt8qHUyoby5/AdQxV6QLoxnZkoZDE
	6PjxnMAaFvySrPkWKiaOnXc0msV/vy9E+6EWnrDW71p854ge4nPZ9qu5GhfAlWflwvGNPo+VDXhKp
	D3BbMh2wzRgKoj/IUM9gKtn90JeLJdebLKMfMNv1x8uaSB6DTwprln/awb2dXEivOVc6bOTYA72qT
	ydiPWTDZh2Xe4DdHTuMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlXo3-001Sin-1e;
	Wed, 27 Sep 2023 16:54:35 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlXny-001SfJ-1E
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 16:54:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 787FCCE1AA6;
	Wed, 27 Sep 2023 16:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3815BC433C8;
	Wed, 27 Sep 2023 16:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695833667;
	bh=OWCmuPebvFogsaXQ+UWO53mmD8IYPbNXCEUOxHi0SX4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OS6UKmOIJ/EdftafGfIt8QW4UBwispRhzODgAANJ7P8uch/3it1bBEZWsLLigHDWD
	 zyjsBBapu3BDfr6Iszc4lUfcX1l5hwuHHagsjSiY25YT71V0mX53itbjZjYG/UDCCH
	 /h/y7TOD7R6dV+WE6mPfpwEMhgEOeGshLQ9CY6fIV+I9P5o+MCjXD4SE6rWu5cAMXk
	 rhJFkRpJbU8XJrjlVEKIfKjuUzYluje1/CETC0vP6ILLDEPXvolfdsHdGPGOI2H1AD
	 JWNOai2dCtkM+pSx3elaxzamyUpsoNNdG36u7/As+zMrOt9a/ECzE9PQgOwCesCXrg
	 YJH3WiMIm7j9A==
From: Jisheng Zhang <jszhang@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: usb: Add T-HEAD TH1520 USB controller
Date: Thu, 28 Sep 2023 00:42:21 +0800
Message-Id: <20230927164222.3505-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230927164222.3505-1-jszhang@kernel.org>
References: <20230927164222.3505-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_095430_595596_59518174 
X-CRM114-Status: GOOD (  11.82  )
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

T-HEAD TH1520 platform's USB has a wrapper module around
the DesignWare USB3 DRD controller. Add binding information doc for
it.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../bindings/usb/thead,th1520-usb.yaml        | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml

diff --git a/Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml b/Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml
new file mode 100644
index 000000000000..afb618eb5013
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/thead,th1520-usb.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/thead,th1520-usb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-HEAD TH1520 DWC3 USB Controller Glue
+
+maintainers:
+  - Jisheng Zhang <jszhang@kernel.org>
+
+properties:
+  compatible:
+    const: thead,th1520-usb
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: ref
+      - const: bus_early
+      - const: phy
+      - const: suspend
+
+  ranges: true
+
+  '#address-cells':
+    enum: [ 1, 2 ]
+
+  '#size-cells':
+    enum: [ 1, 2 ]
+
+# Required child node:
+
+patternProperties:
+  "^usb@[0-9a-f]+$":
+    $ref: snps,dwc3.yaml#
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+
+    usb {
+          compatible = "thead,th1520-usb";
+          reg = <0xec03f000 0x1000>;
+          clocks = <&clk 1>,
+                   <&clk 2>,
+                   <&clk 3>,
+                   <&clk 4>;
+          clock-names = "ref", "bus_early", "phy", "suspend";
+          ranges;
+          #address-cells = <1>;
+          #size-cells = <1>;
+
+          usb@e7040000 {
+                compatible = "snps,dwc3";
+                reg = <0xe7040000 0x10000>;
+                interrupts = <68>;
+                dr_mode = "host";
+          };
+    };
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
