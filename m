Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEE2C4167D
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Oct 2023 21:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F9m6YVhprN7Zhfmaa7PVqrfKySkfuPHwEau9x1TKPfU=; b=S2dyADoYi1RPSe
	hmzPhtLUiJun95A5MPLjzpwuhAD0CBItfO+k9UOPBic4Xf3379/1d4qg2gCekqih/0Erlt5lYF5i0
	dHt6HEIVPijGarbn5T1OhLlolmCjnhnlyzIg/I3fcSv8kAjp+ghHRxN030py1IKlyokZfYRw2O8tf
	IYBaxkIE9lfru0jljBQngciuIDm0Pi/ew/TLeohqAHsCQ+V3vGCLX1xheNqlcZrjbejVPERl8EhtQ
	3YyD06cMnd9tQLa79OtK97iIxVCA5nrouhdgxvsp5fNH3p4S0UOLkmZBW+bxoThRpdPCV5iJXqkMb
	GyrrhWdBYoFgKEG8LRgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxDK4-0028dT-0R;
	Sun, 29 Oct 2023 21:27:52 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxDJy-0028ai-2K;
	Sun, 29 Oct 2023 21:27:48 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 79A015C0131;
	Sun, 29 Oct 2023 17:27:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sun, 29 Oct 2023 17:27:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1698614864; x=
	1698701264; bh=A2jXfVOkfopr59synhPTE2K5qelNk+BTDcO0NBezLEc=; b=n
	mjYzBDOSdbYxM2dg1RIjohpz+AATAlO2OhI1iKnT4UC+pmImKoY3C7QLRlF7a/Ac
	w9Tiq4Wru2TWUrVfNpydhdLyiTKVZcmOHA6zA/UCcdodTDGrimwQog3xPFLdo+bv
	cjUhbalXMAYuY4Vah2HAnsRVuKlUKRWAYiQw0Otm/x5Ev9CP+nOMUN0lPmYkfHGC
	4Ws7WcN8SzZd7s1wz7xMmvZMLOFUgLIhCIT+FL9NOGSlMUM+KeNGT91yQiLV9U1O
	YKKmyOm1rVY1cYam69b5/nOu5cGy2N3wrnmJeCYy+BDqIRneTu576PvEwLTmptpk
	+zWLUpXqE3EbLqpWBUtVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1698614864; x=
	1698701264; bh=A2jXfVOkfopr59synhPTE2K5qelNk+BTDcO0NBezLEc=; b=k
	bQXc6GN/XXLAqBz+O2oD3QrgAKXmQF6uykd4CePuJ8ZSiI8AxRbHMDy1BYf1TDM6
	Ctjk4ASQyOpR2C2dHvBA8sVuAi7MUQrstiO4nMUkk5mur33TsAx+g0BvnqEaVfHc
	VfxAGbzLjPP1eL8Jy2VWRwNDA8F7O7t52dVKXXveLePSdKUfOhe8u9ODFUTBpxwi
	ZXYKUMtDzLJtBA1SRaPce3LfghtBJ5gpHovuCc20DPOqDUAFx+e9d3j/q5UHPxZ9
	0c5nxwUl2JZUTsIJCSPJcljf460KQTpA0w1SC4WOVYaaoIoYzWsq7opFhZ/tIF8V
	bbj6EyFxXIS0dCzjhQ8Jg==
X-ME-Sender: <xms:T84-ZbV2BlxYEZCahjntG9LYL9VYzZXsO8FP0iEV8zl0Y6Ttv28Asg>
    <xme:T84-ZTlFOaoUk9RXildNFOSCTMQmno198u5h6kKja-fi7vg-xqn0ZJFDEeW0FT6c5
    yZrW_F1k2cFJbqzjQ>
X-ME-Received: <xmr:T84-ZXYHgCS7NH1w2J16oBJv8BYTnrjQWWb4DNc6yFCKfFWH9M9wHrUqkXAiZ9Sev0ZE4B3B-QyAiQPjxzW09Lml-BEu3eTNODFJ9DDyhT44_IGizhlwsPHdpVKLsEaIFrWSdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrleekgddugeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepgffhvefhgfehjeehgfekheeuffegheffjeegheeuudeufeffhffh
    ueeihfeufffhnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhh
    ohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:T84-ZWWd4grisQGmSbMaxDCDIXVcGAGJHJTVsAn82tAbhJ71GjxwLQ>
    <xmx:T84-ZVmGRSfyV7ASVmWLdtws4TZgrArpFxP4payXb-R9-eDu74HfDQ>
    <xmx:T84-ZTfGQLhIlhZcj9_9Jax3R-2VfuKlFze7uAl7FjPJ-D9oPZvPIw>
    <xmx:UM4-ZdO5XcedczGL6xzDiaUIjwqch0-mpei0nYhX7HNpl9N681ok4Q>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Oct 2023 17:27:42 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v8 1/5] dt-bindings: leds: Add Allwinner A100 LED controller
Date: Sun, 29 Oct 2023 16:26:55 -0500
Message-ID: <20231029212738.7871-2-samuel@sholland.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231029212738.7871-1-samuel@sholland.org>
References: <20231029212738.7871-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_142746_849163_CCE70ECF 
X-CRM114-Status: GOOD (  15.90  )
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
Cc: Jisheng Zhang <jszhang@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, John Watts <contact@jookia.org>, Guo Ren <guoren@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Maksim Kiselev <bigunclemax@gmail.com>, linux-arm-kernel@lists.infradead.org, Trevor Woerner <twoerner@gmail.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The Allwinner A100, R329, and D1 SoCs contain an LED controller designed
to drive a series of RGB LED pixels. It supports PIO and DMA transfers,
and has configurable timing and pixel format. All three implementations
appear to be identical, so use the oldest as the fallback compatible.

Acked-by: Guo Ren <guoren@kernel.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Tested-by: Trevor Woerner <twoerner@gmail.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v8:
 - Remove redundant "Bindings" from the binding document title
 - Make the DMA channel optional; the driver now works without DMA

Changes in v5:
 - A100 contains the original implementation, so use that as the base
   compatible string, and rename the binding to match
 - Add "unevaluatedProperties: false" to the child multi-led binding

Changes in v4:
 - Use "default" instead of "maxItems" for timing properties

Changes in v3:
 - Removed quotes from enumeration values
 - Added vendor prefix to timing/format properties
 - Renamed "format" property to "pixel-format" for clarity
 - Dropped "vled-supply" as it is unrelated to the controller hardware

Changes in v2:
 - Fixed typo leading to duplicate t1h-ns property
 - Removed "items" layer in definition of dmas/dma-names
 - Replaced uint32 type reference with maxItems in timing properties

 .../leds/allwinner,sun50i-a100-ledc.yaml      | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml

diff --git a/Documentation/devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml b/Documentation/devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml
new file mode 100644
index 000000000000..760cb336dccb
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml
@@ -0,0 +1,137 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/allwinner,sun50i-a100-ledc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A100 LED Controller
+
+maintainers:
+  - Samuel Holland <samuel@sholland.org>
+
+description:
+  The LED controller found in Allwinner sunxi SoCs uses a one-wire serial
+  interface to drive up to 1024 RGB LEDs.
+
+properties:
+  compatible:
+    oneOf:
+      - const: allwinner,sun50i-a100-ledc
+      - items:
+          - enum:
+              - allwinner,sun20i-d1-ledc
+              - allwinner,sun50i-r329-ledc
+          - const: allwinner,sun50i-a100-ledc
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Bus clock
+      - description: Module clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: mod
+
+  resets:
+    maxItems: 1
+
+  dmas:
+    maxItems: 1
+    description: TX DMA channel
+
+  dma-names:
+    const: tx
+
+  allwinner,pixel-format:
+    description: Pixel format (subpixel transmission order), default is "grb"
+    enum:
+      - bgr
+      - brg
+      - gbr
+      - grb
+      - rbg
+      - rgb
+
+  allwinner,t0h-ns:
+    default: 336
+    description: Length of high pulse when transmitting a "0" bit
+
+  allwinner,t0l-ns:
+    default: 840
+    description: Length of low pulse when transmitting a "0" bit
+
+  allwinner,t1h-ns:
+    default: 882
+    description: Length of high pulse when transmitting a "1" bit
+
+  allwinner,t1l-ns:
+    default: 294
+    description: Length of low pulse when transmitting a "1" bit
+
+  allwinner,treset-ns:
+    default: 300000
+    description: Minimum delay between transmission frames
+
+patternProperties:
+  "^multi-led@[0-9a-f]+$":
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
+    properties:
+      reg:
+        minimum: 0
+        maximum: 1023
+        description: Index of the LED in the series (must be contiguous)
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/leds/common.h>
+
+    ledc: led-controller@2008000 {
+      compatible = "allwinner,sun20i-d1-ledc",
+                   "allwinner,sun50i-a100-ledc";
+      reg = <0x2008000 0x400>;
+      interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&ccu 12>, <&ccu 34>;
+      clock-names = "bus", "mod";
+      resets = <&ccu 12>;
+      dmas = <&dma 42>;
+      dma-names = "tx";
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      multi-led@0 {
+        reg = <0x0>;
+        color = <LED_COLOR_ID_RGB>;
+        function = LED_FUNCTION_INDICATOR;
+      };
+    };
+
+...
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
