Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5155C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jan 2022 11:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BiHnQn+p/RA2zGwBXxAiEFvIFhboI/ozIlIJSe4IZ3M=; b=Zbp80jfll1+AOx
	9ArOvizaBJK/gGFayuVlaNKT93ub8tz5NJK2tKaxJhfVq2mh0/4Jw8xQcWHwi+0UIHOt01TXp0d9q
	TJHmLr8ahE4uYe4/qWaotEjp7Xa+jr1+ewYNYcLtaTpU+wtuFMjwUQNXei/UV/HGKK6z9zM84aHSC
	BmIH/xO3YPhmLYiYeY9loEI3sijMO0ASNddkw3XSJqHKj+cxYHhkytkmZlyW4KLzKOAGgB5JQihyW
	IPrwlv/CAwRqtbv9sCyrWTjjcgffVN0nCCz514Ju1ty6E1rlKCWWFlZwKdZspXCRqLtXK2snMhsIQ
	AcrP7+PcOC0Nh42oG+bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9PqY-00Eb3R-6R; Mon, 17 Jan 2022 11:06:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9PqS-00EazZ-Rf
 for linux-riscv@lists.infradead.org; Mon, 17 Jan 2022 11:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1642417601; x=1673953601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lpP0lJkn+kaM0L/dSWda42EaX0finN6iz9h/n2ezhV4=;
 b=tt3UgE36CtMgPsKDjnogb/0zFMfJl5r+hastgqunXNftkfhvnA9G/Ccy
 3ahZ9RPWNQKtFzZ7+cAw8tQYegkwVVDsS0gBQ/6NNgFKsDKZXDAZw+Ea/
 ybk3/1tB0jBB1FNYqOxiqrp83XJpHfVAFqz8ELV1HoHT9u16UW0KNx0fT
 ox1WrE1y+xmWTwYay25Rmda3pyxMPrjRjhkotUw2kH4cOQAm7Sl07DjPo
 ctSntKOcY5HSXY7CR93tCHDPVn7eW3BFOtJ40bsdvpKL2/q8j0+tG5g6s
 /JuhppsWBHlRlZN9gXdO6H8vuvOhzrMraa+wE28pdhe7iqL9ntWxY6Vy7 Q==;
IronPort-SDR: UPWG/TkFqAVmK/OQhSiZm2kwsVkz3r/aFWDzsMOvcYDCJvzIxkvWSPM//plH9+7tK/RX342ib3
 AA1/NHh505sTgfqittMM3Q4mimHDE4Z5DVIkpELQNiYaZWOGg46wSaaesadow1nqsWU0utgLJw
 JM/dNIrsPOyt6o9HIUnJO7xsgK5Sp7WT+UZh+phvyPu37TXyC1DezlM/bKl1RFvFGTYe1mOJZp
 K/f5YyY0FNrxt5gXF3sjQ+MICve3iEz4/9b8o0HzG+xMYwWn8LPHcbOulCcPbGzxglYEsRoxs8
 A0u3/0c2U95alEivP17ksrcR
X-IronPort-AV: E=Sophos;i="5.88,295,1635231600"; d="scan'208";a="149870616"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Jan 2022 04:06:39 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 17 Jan 2022 04:06:29 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 17 Jan 2022 04:06:24 -0700
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
 <ivan.griffin@microchip.com>, <atishp@rivosinc.com>
Subject: [PATCH v4 06/14] dt-bindings: spi: add bindings for microchip mpfs spi
Date: Mon, 17 Jan 2022 11:07:47 +0000
Message-ID: <20220117110755.3433142-7-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220117110755.3433142-1-conor.dooley@microchip.com>
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_030640_986191_211C981F 
X-CRM114-Status: UNSURE (   9.52  )
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

Add device tree bindings for the {q,}spi controller on
the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/spi/microchip,mpfs-spi.yaml      | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml

diff --git a/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
new file mode 100644
index 000000000000..ece261b8e963
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/microchip,mpfs-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip MPFS {Q,}SPI Controller Device Tree Bindings
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - microchip,mpfs-spi
+      - microchip,mpfs-qspi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clock-names:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include "dt-bindings/clock/microchip,mpfs-clock.h"
+    spi@20108000 {
+        compatible = "microchip,mpfs-spi";
+        reg = <0x20108000 0x1000>;
+        clocks = <&clkcfg CLK_SPI0>;
+        interrupt-parent = <&plic>;
+        interrupts = <54>;
+        spi-max-frequency = <25000000>;
+    };
+...
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
