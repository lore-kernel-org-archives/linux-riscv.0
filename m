Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC5B5C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 15:07:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 908B761027
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 15:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 908B761027
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQk3Pt0nkMyQqp3YRYsL/Qt5Jqrd2A1lYdP3u8aL8ws=; b=vQcUCQtmtKGQko
	oo6BV/GQwUEqcUOiuqOdVIBZu0lPxobzSouo5hWhRZ7w5ifrh5ElvrW45wJL792AnnhJfhLutCdoz
	RciPxrPA6kMZpUb9cnVlVpki7RaZpkvOtNuqWDNwfktbrDWfWTnQ18EqV+RJJNPPEvN5PI9guZps0
	89KbNOPoBBwvPzGSGGFA7MVhSHxTW1p5upaOWf1OPvZRYRgZWQelic8lYisOqrBAxkt6GBnanoLGH
	nFyKxFwnGmBbGgtUknIe1I8HTJP7Of58OzwhtjRCssXekpJzn4V/An9qV+6KWRxvn1DlnZXSMWJbb
	CotEFIgy9p9Yru2gKEDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk6F7-00GmXe-Jm; Mon, 08 Nov 2021 15:07:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk6F5-00GmWB-C4
 for linux-riscv@lists.infradead.org; Mon, 08 Nov 2021 15:07:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636384047; x=1667920047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+3o7Ep3ggxTrUD7AgFLSIjR7aDwUI0lZ+wyKLhTBdoE=;
 b=KD9ui0EEYxiZOXVzMA4UIYafMzde8JQ1YwQ/PbVv3v+M/6kuUZjtOoOc
 3l8eY7R2Z62W5dtAEX5fdVh2y+tw62UYM+uBCJff2BaNetHFqS/sNkfYx
 NWrbFVaUw9f+Q7lAxsAV2y0RBfV+BlgXAIAvVPk6Hg4L0UXt4Zk3STVjl
 cwJ3EcPIDRAk5sdJwCQz9P7PBeNy0XtHBmBcM6h/3qG0o4U2t9XYFOgZC
 p4xXRYQJuOQjFWMxinfVXDD/U/ezoOqSwBh+azI0d0eJX28kjJ55N4CyD
 K0ed034IHG4JHskDzOS5rZuozcV7M40WW+TbWfaC9MyMUmxTkhBOtd+xY Q==;
IronPort-SDR: H9KfRQVr29ONAOeeKwJ4wRdtbGxcj6WZeG6xFYv1D17i+Ca/aaVz3NYOw4ZardmietpTLl/i1k
 S6yB6OefoUQE/gizhfNvPBMwJCRmUtnGmcJha77xZVAucMOlIy6XD4p74aCWucthXMW7AlqC/Y
 AzByZPuIPZnvS/Or7/Lkpdqr9HKuL02nWqPDOCIh+0qYbnMCx7cjrq04XcPNISnt6RLmFrajLQ
 6IREsZIdtlYpaNSCV1lyhVZ7cQsWcGz7VVCNSlOqczhG4oxWiAMOfHdsoBKa3Lw7ADczEQSY7n
 2baBAcVBhdMyQBrJGh2eNsB6
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="75727291"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Nov 2021 08:07:25 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 08:07:25 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.14 via
 Frontend Transport; Mon, 8 Nov 2021 08:07:21 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <lewis.hanly@microchip.com>,
 <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
 <atish.patra@wdc.com>, <ivan.griffin@microchip.com>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-usb@vger.kernel.org>
CC: <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
 <bin.meng@windriver.com>
Subject: [PATCH 09/13] dt-bindings: gpio: add bindings for microchip mpfs gpio
Date: Mon, 8 Nov 2021 15:05:50 +0000
Message-ID: <20211108150554.4457-10-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108150554.4457-1-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_070727_502086_2E0873AF 
X-CRM114-Status: GOOD (  11.02  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Add device tree bindings for the gpio controller on
the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/gpio/microchip,mpfs-gpio.yaml    | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
new file mode 100644
index 000000000000..067019ddc1f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip MPFS GPIO Controller Device Tree Bindings
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+description: |
+  This GPIO controller is found on the Microchip PolarFire SoC.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - microchip,mpfs-gpio
+          - microsemi,ms-pf-mss-gpio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description:
+      Interrupt mapping, one per GPIO. Maximum 32 GPIOs.
+    minItems: 1
+    maxItems: 32
+
+  interrupt-controller: true
+
+  clocks:
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  ngpios:
+    description:
+      The number of GPIOs available.
+    minimum: 1
+    maximum: 32
+    default: 32
+
+  gpio-controller: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#interrupt-cells"
+  - "#gpio-cells"
+  - gpio-controller
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include "dt-bindings/clock/microchip,mpfs-clock.h"
+    #include "dt-bindings/interrupt-controller/microchip,mpfs-plic.h"
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      gpio2: gpio@20122000 {
+        compatible = "microchip,mpfs-gpio";
+        reg = <0x0 0x20122000 0x0 0x1000>;
+        clocks = <&clkcfg CLK_GPIO2>;
+        interrupt-parent = <&plic>;
+        interrupts = <PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT
+          PLIC_INT_GPIO2_NON_DIRECT>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        status = "disabled";
+      };
+    };
+...
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
