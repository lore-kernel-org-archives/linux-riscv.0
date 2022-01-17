Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4823AC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jan 2022 11:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H9OfZIO6zkKTxXFDEkAHvuMSTrYAMDvKKBCmTsKIFYs=; b=PLLmQdoFx3iKdr
	HEzPA63djOkK5fFpfiAL/GmaY/f+WxUHuMR4v9XMTWVaHCnvjPjW/fbsvb9e+hyviH/1dUFPzFWi0
	E6UWQZbKz+K/QKF6Y+FoRBOrbELpCShG3DVjEhwo+ETqX/ecxpvpFy4hFoXeKlDqdfEXtkjK2kxpx
	f2xV7wBh1nKSPN3I6blP0SipdygKN44/Cryu+RdjvWylLHt789SOSw0A+aRUzTLhUwoeAbGyxKwsR
	pBbk0Jql19CMS5qDVsQHRbQu4MCB8Clej9qCrDfl0E6VNUv5/8NwPDMc0xtDpxrqc3JQhBSi+kHNo
	SrAOgleq7DQITVGnqavQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9PqI-00Earj-Lm; Mon, 17 Jan 2022 11:06:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9PqD-00Eaof-BX
 for linux-riscv@lists.infradead.org; Mon, 17 Jan 2022 11:06:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1642417585; x=1673953585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bIBkUQ3vjh7oytk/bGgn66qU7zWZlgKxXGlgkCOqeic=;
 b=1w0IntyJpcHPz2l1dFDlRuXbqHgyChLScoYKFiGaACdjbmlHgvQeB/h4
 qTac7FeRZldUzbGd5l9XPrF8e7akVLNgtC5rs4ZXPKpCUuMHJp3QawaHr
 RHz6UYwK3/lNDKOxePCPmwj4ayNB8rf5ADc/bztLll40qJL0/bL0U/h1m
 Vemj9rcBXUV6hsVRc3XgegKTQH7E+VpghqWCOGLsjfUlZFSa5eRVhzdP/
 rOG7IEoEhSaR8C2b79Q5RH8lhXkMYaD5ZlB6O19P+hK2Zc6SvVftpU3F4
 QEl6J9k4qi57BP5AiBh1ZSJSV+iRhpMBUXMxoyCzkrOhCwRe0Ieo8Xp61 g==;
IronPort-SDR: b7RufQwVDdzvSjjojIq+aH2sxdrk69Xd/vHba924bSatmU/2J2hZBg+PtRLObAwUmwEGVsrS2z
 RiPjLt3wuMhzoSWz+wTQpMUZfegbFXujJOuagIgQgZjjhs6cPVRepiygiLYYpuvnBKZ7G3Dl6l
 gMb6K9UPmrCc8ehJFE9knUPT3PDTbk2WFdOhHKzwlpLrRKeZi/qXIycfVUzbRqH9XhmAwidPsf
 QLpeBw/FigHjM6oPYMidD4/jqDY+Gte4fqpuNj9T1F26VqWIlvLqq0pCforb5OdfCKMSTyzhEa
 BhYzNtaRhBP82DUhCHjXbVxN
X-IronPort-AV: E=Sophos;i="5.88,295,1635231600"; d="scan'208";a="145638439"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Jan 2022 04:06:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 17 Jan 2022 04:06:22 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 17 Jan 2022 04:06:17 -0700
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
Subject: [PATCH v4 05/14] dt-bindings: gpio: add bindings for microchip mpfs
 gpio
Date: Mon, 17 Jan 2022 11:07:46 +0000
Message-ID: <20220117110755.3433142-6-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220117110755.3433142-1-conor.dooley@microchip.com>
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_030625_495820_50CB3030 
X-CRM114-Status: UNSURE (   9.85  )
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
index 000000000000..47a76f0e32b9
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
+    gpio@20122000 {
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
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
