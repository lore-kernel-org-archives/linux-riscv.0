Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE56C7EE2E
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 20:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l1yDQLzkKLDerNZH03KuLiPboamBNgFAEelM6IPkOUQ=; b=ObnsXBCuM21zaS
	lQbZmMGzPJc70HFkdXUN3b7v7h68agjUu9glx/Col24JRL8+4fguzihll8PfPkZsYuRRGwc1B12Ko
	8izt0wWbgqOzuSaWZX9homHRMukfcH/sxlTY8jEhVs2psq4WpPpoJwDPjsfvR0GE/RJc62GItEYJD
	67ItD0ngyR+klli1Xo9fsH3ybO8A6oUop836S2Hn1sidYW2NG1kUX1tzVUqX71dIwkTjm+2ecVKG2
	PhFR3fIRAuiO9uuo5Qu+JDtOGYK31NQ8eNRBWhTMcWkZYznEAz+oC/8LAfSNauXqc7gc0mLBjGupi
	L/O8FGJZ6hjTMsh9999Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q855D-00GzE9-1h;
	Sat, 10 Jun 2023 20:21:11 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8559-00GzBd-14;
	Sat, 10 Jun 2023 20:21:09 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3094910b150so2910931f8f.0;
        Sat, 10 Jun 2023 13:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686428465; x=1689020465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HwlNr/WLM3KKZTrIdFCLg61Yoj39feXOCHJbchF+mgM=;
        b=fTmAmr+5to5leCNYnFTwILHcBPZQ0ECfy4oFDnIx8zo01PmKgZS8EA9eQE2dC20MJZ
         +PHKS78ldecBv8GsOho8+FIhN+xHHn1p3oCs8maUhXxkCeNI+Bq685OMQpxZPyxnJzch
         suCfpswQDaJQuRGPpAb5RiTy7k+9omxLHsLkhV52AxXK7gFzpawSlUvi7oLy3mo9ph6T
         uYcGZIOn3/yIxSNkXkVamU1i0VGoFXXNClE17vSdO9fpKoDVtx7EnsWQLNEEaaUk5lSE
         ouRnvtXahKdqDsp52J3KrKmKzmpE6WIyZTVxIidD+ovRNBBmA4tDaX2joovcA3WmDRLE
         25AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686428465; x=1689020465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HwlNr/WLM3KKZTrIdFCLg61Yoj39feXOCHJbchF+mgM=;
        b=IkwTNMzUNDeKEe+wm+v18IDZQuUV7FLU+KZqNc+lTsZhruFpgSVWnwooRTipNZZX6z
         0zXf21pg9ETaHVz9FOFWgJHUPG8cUnJTqdsm49O2qdvMf+zyNg0kgCjroCWBcsxkzegm
         MP1QFE3YMWE6ohZB4QHIKh82NFnCWiI1QxhCpInM2cKzM4oTPgcc4hc8NFN5Pr2vnWMn
         ICpsXh56B8Z+l1g9beArFeULD51ZKPaWMdVatRSW1crOhGxN5eK9n0EoynIxg3otIi5a
         r7AMrTIeHNxXFZL25bsZ5LglWXHjN3C4rbnUfiT3/f+rlCmMCvieRmb4A9JKD9RbwER2
         VzNQ==
X-Gm-Message-State: AC+VfDzEIoG792bZm4saIfwH6Xn70fITcrHiW8Y3b0sIZmXjkb8LqAhC
	FSMKFI87JUUOvEP70n7jz7o=
X-Google-Smtp-Source: ACHHUZ6Cx2GIHN6yMr+Avkyx6iMnRVy/dyI/hNY1MJdhy7I0Tjtr+dNcDWnh5t7W1qpmMyNgj0VyCw==
X-Received: by 2002:a5d:4e84:0:b0:306:27db:16c3 with SMTP id e4-20020a5d4e84000000b0030627db16c3mr1980878wru.50.1686428465475;
        Sat, 10 Jun 2023 13:21:05 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id m11-20020a5d6a0b000000b0030b5d203e7esm7878116wru.97.2023.06.10.13.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 13:21:05 -0700 (PDT)
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
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 2/3] dt-bindings: iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs GPADC
Date: Sat, 10 Jun 2023 23:19:49 +0300
Message-Id: <20230610202005.1118049-3-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230610202005.1118049-1-bigunclemax@gmail.com>
References: <20230610202005.1118049-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_132107_369493_B6E9564B 
X-CRM114-Status: GOOD (  13.70  )
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
 .../iio/adc/allwinner,sun20i-d1-gpadc.yaml    | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
new file mode 100644
index 000000000000..43256ad2b7ed
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
