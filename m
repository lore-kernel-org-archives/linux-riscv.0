Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E088C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 09:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8DpshQonSDtltENBy0ntiwYkLhcIiVWqp9EKINvWLCc=; b=m55CBIw2Rs9dn8
	kfdTynI3oySjvwVITfUWo4osyenVAngSfPVv6BKq84UpfUVPtnG2UMtbdFjGHaOFgIR4VTd+wYFkT
	RPCyDnEXpOAijd6TQ5cRV4jhr3RmRfdaxftSp3gtHACEq2O4HEi+DaLyFSaRR0vf6zzHX5wCYzE2r
	DrCwd843ZTRTNuZf0dfu+IJUf5ZH3vBZ75tyGgjtFJXUPH/cE14HWo0kV4SBTg1yRZ0bE2WlykhTR
	+aUUXA09wLCwGd5UiLonzI/wDGJWG0bDWnybV0e2kKR4sPfe0oQUOVyeAd9UbRBhjCo9nvwgtoTgI
	YiyiFSBJw6HwewZAcURw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my9c1-009BF0-SM; Fri, 17 Dec 2021 09:33:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my9bx-009BBd-LS
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 09:33:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639733589; x=1671269589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0J8Ah0nsD5NIQDIgnipH1JHJSisXY+0QnGt27In+V4U=;
 b=Tcf1Py7/Ufa/FSaFiehFZmLjY0PCUvMQKBzHq0/WFg3Y2EU7jvlQW8nO
 3t1DScf1MypJmMcO7DAnMf/yW9rcz/RjLiW3r52zZyjTifahymomKAixE
 ys3l4GS/cBPLyPMJH9vXntTB6XxymrTLQyjhCVzpDLgd8kWfWhEugwx9y
 C+4MyPM/toNnU6w/ij55IYddkB0o7hhafhb1EbKLmNBZpuU2vTH6MbzBL
 d+cgDj/5SJn2SwdA4+ZF9l6UMQfDpqJA96SEI2NLOrNGxKv4P0drimcbp
 3EYkzXQuLQQQnzZKAwHbjnfSoPPg6/TQf45r/i+2CnVl6yroiwAwLsFRv g==;
IronPort-SDR: R1meDBDdqbSOglpNdk2CmK5Ge5Gyd85c2GJVirmXzZV4ZtqbyDerB5T3+TVXmo7rPtRwNRTKA8
 LbgyQebuf+WPsSPhKvcJNKF2cZrW7/TZYobyk06yONBcT7BCkId0mX7DIn2vzCue1FsxsRaD7J
 FgIdDCstQXGTCejOzmiLLDPp0WbITzu1mtU7OdjddCCYUsNwfYJCA4XKnP54tvhFG2RfhG0L6P
 dEZa2jQUjI2/XY/P0J7TLf77by2pf4V+KHTcICE3TUK8C04EB9zmGHYd9oV9Vz1NQm/oXX59VF
 asHskPDu9na5IfqldfqLNNkK
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="140110764"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Dec 2021 02:33:07 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 02:33:07 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 17 Dec 2021 02:33:02 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC: <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
 <bin.meng@windriver.com>, <heiko@sntech.de>, <lewis.hanly@microchip.com>,
 <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
 <ivan.griffin@microchip.com>, <atish.patra@wdc.com>
Subject: [PATCH v2 09/17] dt-bindings: gpio: add bindings for microchip mpfs
 gpio
Date: Fri, 17 Dec 2021 09:33:17 +0000
Message-ID: <20211217093325.30612-10-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217093325.30612-1-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_013309_816143_57179E49 
X-CRM114-Status: UNSURE (   9.48  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Add device tree bindings for the gpio controller on
the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/gpio/microchip,mpfs-gpio.yaml    | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
new file mode 100644
index 000000000000..aa1fbb44f9ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
@@ -0,0 +1,80 @@
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
+properties:
+  compatible:
+    items:
+      - enum:
+          - microchip,mpfs-gpio
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
+  "#interrupt-cells":
+    const: 1
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
+  - interrupt-controller
+  - "#gpio-cells"
+  - gpio-controller
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include "dt-bindings/clock/microchip,mpfs-clock.h"
+    gpio2: gpio@20122000 {
+        compatible = "microchip,mpfs-gpio";
+        reg = <0x20122000 0x1000>;
+        clocks = <&clkcfg CLK_GPIO2>;
+        interrupt-parent = <&plic>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        interrupts = <53>, <53>, <53>, <53>,
+                     <53>, <53>, <53>, <53>,
+                     <53>, <53>, <53>, <53>,
+                     <53>, <53>, <53>, <53>,
+                     <53>, <53>, <53>, <53>,
+                     <53>, <53>, <53>, <53>,
+                     <53>, <53>, <53>, <53>,
+                     <53>, <53>, <53>, <53>;
+    };
+...
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
