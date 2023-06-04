Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20A7C7EE29
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 20:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iHkhzAuhDTJZFZcFICPo05F4hMw12WQpclhF+y2Mqr0=; b=OhU57O3ST9v/kq
	h+knDH52dJogDLA/+0YLQZoPNMWomBuWfjR52RteuCdZgAu1lxisXIiC36hZZmCpbxVxOY8Hra+wj
	aJHG1LqztAOLML7sVQXYETnQKR62Y7XXuJFZFeajgG4wfLDC1SFU8dLbe0Qvoz6IiBooPD18NeKiI
	9XVm5uhfjo39JiszSdV/6YEn9fXvPS8Y71gIph5vo1NngQvD9HyCc90RRBDvpnI19y+6DmnZldfyX
	JLwGFgzzvsHhC2W1HxbpUwAdTbL+VepsWPC5XgNreU/+2dn12qR97s4V0FCgkvPMJLUSsI1hPs+ON
	cxiv3vpUQgD+v+/dUGeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5ttf-00Cy2d-2A;
	Sun, 04 Jun 2023 20:00:15 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5ssV-00CntY-0r;
	Sun, 04 Jun 2023 18:55:01 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-30af20f5f67so4073822f8f.1;
        Sun, 04 Jun 2023 11:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685904896; x=1688496896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rzwo7MuRNtXcUZRiLMVdnWkiH+vug12Y5tIMzd06xkc=;
        b=dtN7wjZaTsNocuP8paje8z4jh1t3o0zPEL3lUe7icfmKJdzzwEkLu3ZlOkLep+5h7A
         nQPAFEOZHswTycVAzk7lBOzxGo3fehL6FpUEajH5Xm2/+1BCoBC/AHPzAu/j4bdz/102
         7+Di/Xcd29LGaB5a84q5Lz7TmgDR+53IVZbDDrAUjcH/oxOJVC9daVopBFcRYZj0LTaX
         6m9zQ8SAK6EE4mS35EPZBfvvLLc++pnEWeOjG1OBLxZT+boOPJki3dUAFT7LsY3+IFUh
         gJQKjNfn+E/KUE1SkcLGCqrIVPFP+YSqB1hF/qaRaQVte9rvkejtlieRxSHc2vAg+uDQ
         DGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685904896; x=1688496896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rzwo7MuRNtXcUZRiLMVdnWkiH+vug12Y5tIMzd06xkc=;
        b=mF4inRDuQ9r8eXjYrepe8ZVsHpnBPTg05dfaNthgeolVpR0EzJ1b0g6WKucsNscrvo
         27dkTn7o4wiSl/mVMKIFu3XcT7zavkB+z4ml6ExfEjS5a7rQvIuIWAruwZOqod7Ra1Wq
         jNtQZsmoKl2l89O8bEjILXeajFnKkfp7E6ndkgCrHSlqMZWRHtvfQ67TqSsVfbgfS38W
         I9uykyGQ/48BHXb0VmUqoh2Tvj6gdYPYv8VlSk6cVKdOlRR8Urmh7whxoHzAPXDMmSB3
         8Vmdr4sGtTBZrOOuzVhaS/uHsOHVWKlHgJd0h0fVD4FVWSC/qT2rWyywJT5bUOAToZh+
         vw2w==
X-Gm-Message-State: AC+VfDzfufxA2H9MTwydDl7eW1Q+0daK779dIL0ps6MjSVhs61kUdoZD
	GoAltEA9iuuJS+0c3l1lO6c=
X-Google-Smtp-Source: ACHHUZ6WPc41MHqJ5k7vxlqwfogl5pFyEWUQthcw6x2G2C2ELZojXFFKjeH8EGTKwra3U2mEHKzb3Q==
X-Received: by 2002:a5d:65c2:0:b0:30a:edc0:c960 with SMTP id e2-20020a5d65c2000000b0030aedc0c960mr4366494wrw.26.1685904895665;
        Sun, 04 Jun 2023 11:54:55 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id l8-20020a5d4108000000b00304adbeeabbsm7636433wrp.99.2023.06.04.11.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 11:54:55 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Maxim Kiselev <bigunclemax@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	William Breathitt Gray <william.gray@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	Haibo Chen <haibo.chen@nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 2/3] dt-bindings: iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs GPADC
Date: Sun,  4 Jun 2023 21:53:15 +0300
Message-Id: <20230604185336.1943889-3-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604185336.1943889-1-bigunclemax@gmail.com>
References: <20230604185336.1943889-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_115459_308063_AA94AE35 
X-CRM114-Status: GOOD (  13.20  )
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

From: Maxim Kiselev <bigunclemax@gmail.com>

Allwinner's D1/T113s/R329/T507 SoCs have a new general purpose ADC.
This ADC is the same for all of this SoCs. The only difference is
the number of available channels.

Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
---
 .../iio/adc/allwinner,sun20i-d1-gpadc.yaml    | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
new file mode 100644
index 000000000000..8850cd296e6d
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/allwinner,sun20i-d1-gpadc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner D1 General Purpose ADC
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun20i-d1-gpadc
+
+  "#io-channel-cells":
+    const: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+patternProperties:
+  "^channel@([0-15])$":
+    $ref: adc.yaml
+    type: object
+    description:
+      Represents the internal channels of the ADC.
+
+    properties:
+      reg:
+        items:
+          minimum: 0
+          maximum: 15
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+required:
+  - "#io-channel-cells"
+  - clocks
+  - compatible
+  - interrupts
+  - reg
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun20i-d1-ccu.h>
+    #include <dt-bindings/reset/sun20i-d1-ccu.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #define SOC_PERIPHERAL_IRQ(nr)	(nr + 16)
+
+    gpadc: adc@2009000 {
+        compatible = "allwinner,sun20i-d1-gpadc";
+        reg = <0x2009000 0x1000>;
+        clocks = <&ccu CLK_BUS_GPADC>;
+        resets = <&ccu RST_BUS_GPADC>;
+        interrupts = <SOC_PERIPHERAL_IRQ(57) IRQ_TYPE_LEVEL_HIGH>;
+        #io-channel-cells = <1>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        channel@0 {
+            reg = <0>;
+        };
+
+        channel@1 {
+            reg = <1>;
+        };
+    };
+
+...
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
