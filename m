Return-Path: <SRS0=KFrn=C2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8208C43461
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 16:53:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B80E21D7F
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 16:53:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SRCwhlNA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="yeo4MNqx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B80E21D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0aCAsCIG80yr8ct5bP2zH9ZWOtmSWoDcp2SP2XjnN/s=; b=SRCwhlNA0Ugb9kWFlebnCNT65u
	jUOWtmU9jG73TA0/PLJM5GEbNu553pEnlYsYEhDR3R9aiA6lqIxPDZNhk4UZy0iaEL4RC5WsEiG9p
	JGg0kX/cKUutvRBaqVDOh1ZrBDmrlYqo9cZVl66vaVCYdAnOVGBbS6F55+uGaYUAZVb4Ixo4h4LXX
	QY3o9Ku+IL6G06C57xKRMtsgAwEixzsGkORVgi2adN8NfEGvBaWqOul3RgwlhuRi0ItWMFk0jfJ9h
	VKJPfoFkforb/YRDeODOxQK42tiVIeAkwucODWaHTauLNtsgt7c2FNp3N1O0I+lbfF+WBlo5oQTk+
	5DKvxLbQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIxAH-0007Xo-Lj; Thu, 17 Sep 2020 16:53:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIxAD-0007Vi-L1; Thu, 17 Sep 2020 16:53:43 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5BD6320838;
 Thu, 17 Sep 2020 16:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600361620;
 bh=LNr3F6vUQ7DT7Vs4mRissQqyWTp6Maw/uPs1wDTihEw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yeo4MNqxqC/0rz60dpD7fLLtv1ESeHX2KZc97xj2v6ggaQfUM97Jr3QW5WwdStQmS
 Fpq6bmCpxks5q1+3NvLTNNqb8abOukMhKoMkRZXnMxp5roNeV5a8N5rWUZEPTPMd9g
 kKCq6g9PCfmnot5dawhs35T9ZSnDlUPM0ALOyrEI=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Hoan Tran <hoan@os.amperecomputing.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Lee Jones <lee.jones@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Anson Huang <Anson.Huang@nxp.com>, Sungbo Eo <mans0n@gorani.run>,
 Stefan Agner <stefan@agner.ch>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, Yash Shah <yash.shah@sifive.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 - <patches@opensource.cirrus.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Amelie Delaunay <amelie.delaunay@st.com>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Andy Teng <andy.teng@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Sricharan R <sricharan@codeaurora.org>,
 Chris Brandt <chris.brandt@renesas.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-unisoc@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-media@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 01/13] dt-bindings: gpio: add common schema for GPIO
 controllers
Date: Thu, 17 Sep 2020 18:52:49 +0200
Message-Id: <20200917165301.23100-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917165301.23100-1-krzk@kernel.org>
References: <20200917165301.23100-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_125341_862685_66CDC3F3 
X-CRM114-Status: GOOD (  23.49  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Convert parts of gpio.txt bindings into common dtschema file for GPIO
controllers.  The schema enforces proper naming of GPIO controller nodes
and GPIO hogs.

The schema should be included by specific GPIO controllers bindings.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Do not require compatible (some child nodes are gpio-controllers
   without the compatible).
---
 .../devicetree/bindings/gpio/gpio-common.yaml | 125 ++++++++++++++++++
 1 file changed, 125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-common.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-common.yaml b/Documentation/devicetree/bindings/gpio/gpio-common.yaml
new file mode 100644
index 000000000000..af9f6c7feeec
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-common.yaml
@@ -0,0 +1,125 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common GPIO controller properties
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Linus Walleij <linus.walleij@linaro.org>
+
+properties:
+  nodename:
+    pattern: "^(gpio-controller|gpio)(@[0-9a-f]+|-[0-9a-f]+)?$"
+
+  '#gpio-cells': true
+  gpio-controller: true
+  gpio-ranges: true
+
+  gpio-line-names:
+    description: |
+      Optionally, a GPIO controller may have a "gpio-line-names" property. This
+      is an array of strings defining the names of the GPIO lines going out of
+      the GPIO controller. This name should be the most meaningful producer
+      name for the system, such as a rail name indicating the usage. Package
+      names such as pin name are discouraged: such lines have opaque names
+      (since they are by definition generic purpose) and such names are usually
+      not very helpful.
+
+      For example "MMC-CD", "Red LED Vdd" and "ethernet reset" are reasonable
+      line names as they describe what the line is used for. "GPIO0" is not a
+      good name to give to a GPIO line.
+
+      Placeholders are discouraged: rather use the "" (blank string) if the use
+      of the GPIO line is undefined in your design. The names are assigned
+      starting from line offset 0 from left to right from the passed array. An
+      incomplete array (where the number of passed named are less than ngpios)
+      will still be used up until the last provided valid line index.
+
+  gpio-reserved-ranges:
+    description:
+      Indicates the start and size of the GPIOs that can't be used.
+
+  ngpios:
+    description: |
+      Optionally, a GPIO controller may have a "ngpios" property. This property
+      indicates the number of in-use slots of available slots for GPIOs. The
+      typical example is something like this: the hardware register is 32 bits
+      wide, but only 18 of the bits have a physical counterpart. The driver is
+      generally written so that all 32 bits can be used, but the IP block is
+      reused in a lot of designs, some using all 32 bits, some using 18 and
+      some using 12. In this case, setting "ngpios = <18>;" informs the driver
+      that only the first 18 GPIOs, at local offset 0 .. 17, are in use.
+
+      If these GPIOs do not happen to be the first N GPIOs at offset 0...N-1,
+      an additional set of tuples is needed to specify which GPIOs are
+      unusable, with the gpio-reserved-ranges binding.
+
+patternProperties:
+  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
+    type: object
+    description:
+      The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mechanism
+      providing automatic GPIO request and configuration as part of the
+      gpio-controller's driver probe function.
+      Each GPIO hog definition is represented as a child node of the GPIO controller.
+
+    properties:
+      gpio-hog: true
+      gpios: true
+      input: true
+      output-high: true
+      output-low: true
+      line-name:
+        description:
+          The GPIO label name. If not present the node name is used.
+
+    required:
+      - gpio-hog
+      - gpios
+
+    oneOf:
+      - required:
+          - input
+      - required:
+          - output-high
+      - required:
+          - output-low
+
+    additionalProperties: false
+
+required:
+  - "#gpio-cells"
+  - gpio-controller
+
+examples:
+  - |
+    gpio-controller@15000000 {
+        compatible = "foo";
+        reg = <0x15000000 0x1000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        ngpios = <18>;
+        gpio-reserved-ranges = <0 4>, <12 2>;
+        gpio-line-names = "MMC-CD", "MMC-WP", "VDD eth", "RST eth", "LED R",
+                          "LED G", "LED B", "Col A", "Col B", "Col C", "Col D",
+                          "Row A", "Row B", "Row C", "Row D", "NMI button",
+                          "poweroff", "reset";
+    };
+
+  - |
+    gpio-controller@1400 {
+        compatible = "fsl,qe-pario-bank-a", "fsl,qe-pario-bank";
+        reg = <0x1400 0x18>;
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        line-b-hog {
+            gpio-hog;
+            gpios = <6 0>;
+            input;
+            line-name = "foo-bar-gpio";
+        };
+    };
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
