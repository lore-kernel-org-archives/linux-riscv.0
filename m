Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3E5EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 20:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fddn4iH+bpxvHEQb4br7c1fIC92GY7RPRTClvDRFGDU=; b=esbttjq5WyZpot
	8jSs3zPw+X/2rg2lCwUaYIX+TMbdglPSPjvMAVb4GciqDM8oOYPNUAoD3GInoKGZDrnvh1Beo1M+e
	xhYhMDCiCYRsBGfIOK0JENcOZTTTjuU3n+JptPsmh2qmBAazlrsT6YwKquN//y8XKS6faRGcPh6z2
	IgHbBQynq8/OH9pZw3fSMbf11h00n5aUGq9e/gxAUU15c0hzD5iR6evlprgfrJSnfzdHVk5T+PesQ
	ebv6Yws115dA52ntNmCpL2BWZCouGS3zmgfxbw5zCFs4/SBdN3dhIb2y82aCcOwf8Nc57O64Tl+jq
	OZ1EigSgD7VxjOfHxzlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9u1u-00G4s3-1g;
	Thu, 15 Jun 2023 20:57:18 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9u1r-00G4qs-1a;
	Thu, 15 Jun 2023 20:57:16 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f8c9cb3144so21265585e9.0;
        Thu, 15 Jun 2023 13:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686862633; x=1689454633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5rIbWUvXPqdJJgOnGLL8m8IBmG8tIePJ5zzh46kuSM=;
        b=nX/f79n3CU6wg9P7tabFSVT2oNPbzNQCmL2F7glG7yGWlgNzZR1PvS6lOEvcWflUkl
         Vl16WFUR/ZMny7l8zXcJz4mzUhDH7HlcO5jAhtpN3eIXUa4JPCJnAdLKhz733x+Qx3iV
         t2KUCdmSl/rJ7Etb/lDFDMkDo+3/+joioZFWGWUpnCGSh+fQSwu+dX5KItGWraPe0elR
         WqcFuAQPdCi1ejcFAygi3kM1Qos6VeVfXga/Za4jpbMUEe1nSI0Lma1fW/J2jFTYzRes
         02KSmpvE4AFQt+79g9D11Z4s6eSo7WLl/bb/4TxAvw3c1Nxtnd3kh7mIPUH/TkesFCI2
         sJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686862633; x=1689454633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5rIbWUvXPqdJJgOnGLL8m8IBmG8tIePJ5zzh46kuSM=;
        b=DvAPigwwPZdnAbwk3BbzVZEvIRe+5k8Al2bnGShJ4R67Y5c/bwd+9bY+WMt8+xNmvo
         LX8xiJhFkUhc0FzaD59RLwDO1XpZ61vQW5scc8yJljvL3tCBQG4qFlCBNwNk2jjxfZxf
         kNw5RpY2F64u6XV0+wjhQDWyArrhghlfOwVH6g6j0EHQuAhi6kbjVkfIWtnZ3N5PKHBF
         HwvZpvUO7lUgVZIQBYXaNbgDkMJ9cDaRhibNH+4ok9UqK19sETfkKYM5rvi1iIltDsDV
         NX/udNOwni7HCXt21qwV0XbQ+eT1d8Q1rvKYDmJzj3b4yfm0UmqiSV7i/F554gzQdwi8
         2sEA==
X-Gm-Message-State: AC+VfDwVpfXiWBbcndoozvoGdTRwRePaXQFgwfzjbqIZm7RyLxshP07e
	ndP7K+CePYVlTiZ09tj+kIM=
X-Google-Smtp-Source: ACHHUZ49tinnDakWJhHOxIkwJwpg1xHEAgq8HMLqj8tWi1TJC0EPNTFsPDNHIfYdFtMbxDt56YU1hA==
X-Received: by 2002:a7b:ca4a:0:b0:3f8:afe:5c39 with SMTP id m10-20020a7bca4a000000b003f80afe5c39mr298289wml.2.1686862633077;
        Thu, 15 Jun 2023 13:57:13 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id k24-20020a7bc318000000b003f733c1129fsm176372wmj.33.2023.06.15.13.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 13:57:12 -0700 (PDT)
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
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	William Breathitt Gray <william.gray@linaro.org>,
	Haibo Chen <haibo.chen@nxp.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v7 2/3] dt-bindings: iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs GPADC
Date: Thu, 15 Jun 2023 23:55:21 +0300
Message-Id: <20230615205540.1803975-3-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230615205540.1803975-1-bigunclemax@gmail.com>
References: <20230615205540.1803975-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_135715_528889_322E3231 
X-CRM114-Status: GOOD (  13.09  )
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
index 000000000000..23c584f5a6e6
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
+        reg = <0x2009000 0x1000>;
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
