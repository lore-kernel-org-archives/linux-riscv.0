Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18551C4332F
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Jan 2023 00:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7S2rS8ZYFzX7pvuGGBDwNwVIwH0R6e76J82CE2hSUxE=; b=CK/6SzIiQor7fF
	yN5qV3IUogIwx9o86gk5EK3Tg9/9uwJB8jjWXBcyW900tKfzMJOBCDpwdh56PiWqZWNBYgm79AR7T
	aJ1uVpxl14DRKKcHrRxGFRuvmGCu6cr0f5PTNGVfvsdXWFZNIQ0MPcWGUazYMBl1pDx+KfdFWK2w5
	cVDYlv84kcaG57cryiOR4H1m9B9X6c0sR8+E/sakWdVJIWF0BRFhyfKYTaWCYjIYWag+W3OW2x9aE
	UTWXwO8qf9cAllboms/uyQGQxxW2BeSFEGq+A/wWcSUKMQXfiBIk2oQ5z+UN2fikpJJHzNdryaHLp
	lrrzY2Qi46vKjpzFdBmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBlwa-00BoGG-S0; Sun, 01 Jan 2023 00:11:17 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBlhZ-00Bftx-Vm; Sat, 31 Dec 2022 23:55:49 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 424515817C0;
	Sat, 31 Dec 2022 18:55:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 31 Dec 2022 18:55:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672530945; x=1672538145; bh=UF
	t7Zu53zTl2BvEb0FKbdoPqlh94wIU/2L8iVmAGJ0w=; b=R/9TIWIUfc6fKZ05dK
	gK3un29z//PtV3pksMJcGCPRgpt43Rw5fj90SSx0FkHiIpNi6eXIxW6qCgRJR6ei
	AmD0jE8v5vyPynZMXkAdk/xcVW6G8gLMTllU/b9f7MRWZYlPhp/n8WvG8IG2o5ud
	1r3lbDDYL8WQr8BMsT+6O79uln0g1P9i/Gr7UzRQFxdyS5VbiHfVIClQjMsxjOzb
	PaHOd45WityHUth+gWdugwFXsYFTJ11CkgwFPYB93AL+1nkMujTpgtkQJjsm2rrj
	us3HExKn9DQWgYaBEB4WP7YfbBjNeSsI/v9++EB3YIYkxumkOix08Sqa3CoV9wBJ
	jsHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672530945; x=1672538145; bh=UFt7Zu53zTl2B
	vEb0FKbdoPqlh94wIU/2L8iVmAGJ0w=; b=wk5PmdKcfiLHZTWg8AMugeM2Ry9VB
	f1DFICZnBmpCnNlNyQuHnOsH9GlfK0FKDNttRSbx8UZG1levqTEYxL+k+5Qa6P4u
	15UO8W8bdtdRbK4wLrpWG/01wp1x22WjZdwOGRtjueSMki1dMmfw6LHIxuF9iHca
	1TY1qi7h6UyjsfziY2Zns37Po0+3HMJ7Pp99DYJQIBkB3NCDKjfKV+9MPj6RUuTL
	NO/C43xGAvBmyGeK6R6NC3izcovjGErZMjM+olqFv6Jx+cOkpVk1XCa/5qkR814M
	xUw3d9bC/tByK91gAyyyohNvx8vQgX/R1qyjInrHGl9fDEQulhOjP0UkQ==
X-ME-Sender: <xms:AMywY1W2yb87Zrs34vbwSz1k8gO01H3qet5-UJj94wM0a_tS5Fu2rA>
    <xme:AMywY1kcBff2m_Z2hiuSbHXma5dHVDaj8sh4iRbjokilUxSAl5pLsxzuWurOj8Fzc
    QCGXfMl8Ov1becj9A>
X-ME-Received: <xmr:AMywYxZgEQyZvzywvg7uDxcyIR3Cg1bd_Oh0aCVjbHCdidl3GHjmgnRXF4ISG9RzV-jgD84xjdrWaDG8fxOJwhbwxi3PIerc9zbNbEhJqRUuHosk6iHYUlrel4WyK_s3qP6ksQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieelgddujecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpefghfevhffgheejhefgkeehueffgeehffejgeehueduueeffffhhfeu
    iefhueffhfenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhho
    lhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:AMywY4UZ5ayF8-H-YYGQnpaoPrrEPDsZO3O3o9blWD9AiPXRtJo28A>
    <xmx:AMywY_kfWYv9xbW5ULwzAben-7rwCtfUGX7ZxJRTAXaYSAmURByKzA>
    <xmx:AMywY1fvHlCSpseVNWMibBdOV14e8NCQmtZVjRQYbwh8JepqEwYnPQ>
    <xmx:AcywYxWfidEThcXWUOvMxO5u0gQwoUyC0uvp48k9PxRQIc_E6zTINw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Dec 2022 18:55:43 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Maxime Ripard <maxime@cerno.tech>,
	Rob Herring <robh@kernel.org>
Subject: [RESEND PATCH v7 1/5] dt-bindings: leds: Add Allwinner A100 LED controller
Date: Sat, 31 Dec 2022 17:55:36 -0600
Message-Id: <20221231235541.13568-2-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221231235541.13568-1-samuel@sholland.org>
References: <20221231235541.13568-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_155546_247300_02B2B299 
X-CRM114-Status: GOOD (  14.87  )
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

The Allwinner A100, R329, and D1 SoCs contain an LED controller designed
to drive a series of RGB LED pixels. It supports PIO and DMA transfers,
and has configurable timing and pixel format. All three implementations
appear to be identical, so use the oldest as the fallback compatible.

Acked-by: Maxime Ripard <maxime@cerno.tech>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v5)

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

 .../leds/allwinner,sun50i-a100-ledc.yaml      | 139 ++++++++++++++++++
 1 file changed, 139 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml

diff --git a/Documentation/devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml b/Documentation/devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml
new file mode 100644
index 000000000000..fc8ecf6f91e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml
@@ -0,0 +1,139 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/allwinner,sun50i-a100-ledc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A100 LED Controller Bindings
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
+  - dmas
+  - dma-names
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
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
