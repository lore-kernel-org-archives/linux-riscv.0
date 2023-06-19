Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA57BC0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 15:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=51KkBDAF9QBCdST2IGY0i2vLpfxuDHTQRBHGSI6q3Rs=; b=QUsVuFICuXnb3I
	rNcOUwxN1RkLHtRqkMviz5EPplOIKRBigW41v1bm+RgHpin4rH+G8UhWD7G939l0K+NUV3YIZX3rH
	JU3UWSbI4RJt05yKFZODhfyXp5/O/Ea8uB7C8c2oFW6d7zjklW3uAmSJPG0pe6Kb2X2swd11nOSXC
	jlsWuo98n2QeNLQSTGfNS7NJLVGgj1iMob6MN4jpsrotbJFXhFFGRgKp8tTiIF3HfpyM1guLt2udU
	t8EhnTfgl2MUov4h8G6+721so4gN0JkWLPnHRNzCsELPQRqbvQHyW0QmqMD5LjnkOnWPaDs45ORS0
	lH+feX2zykaStnWr2C0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBH3F-008oQx-1r;
	Mon, 19 Jun 2023 15:44:21 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBH3C-008oP7-0z;
	Mon, 19 Jun 2023 15:44:19 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f769c37d26so4650160e87.1;
        Mon, 19 Jun 2023 08:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687189456; x=1689781456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aL5sq5Lugahi7hv9X9W+s9NTZzWQgnxxieVUqmZWN4k=;
        b=VlMXwrYDrcRTxXvQ1Ol2PWCQ2fyrtvbAqE/t+vlPR8747qVBGnU5d9Tv/hKHVIuXJA
         7SaDhGQx5zaACLBAc2UyuvIFoyMZJSERYb4Nu+OOUxbKKViBqRmJ5lb8tibqiWq//7xV
         ajhMtYeXWaV0YPrvL0SWxYanEs8/7JT5gxpCbIqjZtrQ1oBBm/VycFQRjMcMZsK/U5+F
         jJT0lpx4HrEPZJDYZH9PZzRtZPb25jnF1WjgL/V08hsoN08ppO/WBak4mHw6Mo+OkPtU
         C7CXB394fmNmkMvPB6p2PS96XcTYrmlpCtwoqpTk8N1VxqD5fBrZQ7GbyULFHIA/4wTz
         O0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687189456; x=1689781456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aL5sq5Lugahi7hv9X9W+s9NTZzWQgnxxieVUqmZWN4k=;
        b=ejkzbx8Cy9u0jOOoPz6vbRr2h56en7oEO+/uz0893kPOs5b3zcDGPy0b1F8ndYMX04
         8pNkd8uJLMiiwqo534KYx1Oms270KRLOdKHf9dtK9GkSndv+NGIDWiQahpEyRPEsofKJ
         MMlYYP6yRphIhmAxd6XN5WZ4jt7y29hUBd66cGy2Xo8Ze/WT2j/de9BNN7lAtvQnQa8M
         3Gf2/7MOf0VEjVhaSv8oNSJ1VNu4oM0seaB2zi71+s6p5UM3vSTDAOmDcJGoZVsYQ153
         Obp9+Np/fDcaJBrUoNgQLyu/NX+ZNIvcLaXKJlJDJQnHfS/RC0g3+bcHUeZ4Aa/iH307
         Q7cw==
X-Gm-Message-State: AC+VfDxPKJ6hRVD/b5eEyQidBB6ZIfNGUw3XWNr6O6fYB3Wuy5EvJi/h
	gGWqi8KNQfwTznjWKl0UsQI=
X-Google-Smtp-Source: ACHHUZ4Dv4HGN1j4+laQB9t9R+Su/3+4i4db+7e5rU0DHCTVsgQKOUMFnDc/XZKjypM1PqixorU7ig==
X-Received: by 2002:a19:790a:0:b0:4f8:417b:c752 with SMTP id u10-20020a19790a000000b004f8417bc752mr5353354lfc.44.1687189455711;
        Mon, 19 Jun 2023 08:44:15 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id f11-20020a19ae0b000000b004f85e53250bsm1207144lfc.191.2023.06.19.08.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 08:44:15 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
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
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Haibo Chen <haibo.chen@nxp.com>,
	Quentin Schulz <quentin.schulz@free-electrons.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v8 3/4] dt-bindings: iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs GPADC
Date: Mon, 19 Jun 2023 18:42:26 +0300
Message-Id: <20230619154252.3951913-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619154252.3951913-1-bigunclemax@gmail.com>
References: <20230619154252.3951913-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_084418_344289_504AFD2F 
X-CRM114-Status: GOOD (  13.50  )
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

Allwinner's D1/T113s/R329/T507 SoCs have a new general purpose ADC.
This ADC is the same for all of this SoCs. The only difference is
the number of available channels.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 .../iio/adc/allwinner,sun20i-d1-gpadc.yaml    | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
new file mode 100644
index 000000000000..7ef46c90ebc8
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/allwinner,sun20i-d1-gpadc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner D1 General Purpose ADC
+
+maintainers:
+  - Maksim Kiselev <bigunclemax@gmail.com>
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
+  "^channel@[0-9a-f]+$":
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
+    unevaluatedProperties: false
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
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    gpadc: adc@2009000 {
+        compatible = "allwinner,sun20i-d1-gpadc";
+        reg = <0x2009000 0x400>;
+        clocks = <&ccu CLK_BUS_GPADC>;
+        resets = <&ccu RST_BUS_GPADC>;
+        interrupts = <73 IRQ_TYPE_LEVEL_HIGH>;
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
+...
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
