Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D6BC77B7A
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 12:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jm+4Wayj0bbLgRalRFx/Yax1UHzDKmQqKiR2oiCyYMg=; b=O7Nn1oAoa//4vJ
	GnU5rW/MWZUnEDasKy5exBC4wOB2agkcrjF8ACHoVI6+0dsmGtRwdzzEbDAPY0FQEBNB3G6xDJfaj
	r73pbIMvY6tY1Qt5fvdS3xztP2v6kIvomycR958JxnPXwikB62u490+f18oqQGYMMp6ddXoONJxow
	oV01Xe87IrIVcKX1vmXxqAtxxuH9SY0IPXt+cGg8XjM32ec5CFjwZK76MQNMNYT0XseA6bDrMkTkY
	17UNbcezZ4a0vudI8YOn5YbT3h1HR8hII+3Vf2V7BOjEhTHjORlaJX0MmEvnIz3nJKA5gLYjo1P+q
	WC4qA8UJN+QpOcfKfxzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7xjv-00G5s6-2h;
	Sat, 10 Jun 2023 12:30:43 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7xjs-00G5pt-1b;
	Sat, 10 Jun 2023 12:30:42 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f7378a75c0so19342285e9.3;
        Sat, 10 Jun 2023 05:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686400238; x=1688992238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfDcBM2c7RBL46+FO7R/jISsiGli0gYYtl09AucgxLg=;
        b=Iu/CnFtmkrUl2AoMMS/urWo3Vc7o8e/PnfxKRP5hoOgqSv4XCYlreacBQ06snvYvKe
         A7ImityXOAXZTQaIXtmQ++ip7TkvzrRPqUa0FphLMH/Frl0gwVhGnmeyzaHp1QezeDl1
         cT9e0Dv72/x33FTtV/fScWLwVnvF9bsjrF0oxvG5qGHQ3IK0t3gL4WaouvjgvR+nXZg0
         rdBWAWGEWmHdtePaoqs65MzRS1G/kxGC1dhtDFP4lEwTblVQw32hx0UguRJv6Godnpq8
         MZWRnozvKrCWk+V8AeA2tQa8WTGae4h2CBudYlLbYRblLOmsIFEQO4X8PxO3GOEmkEbN
         /SeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686400238; x=1688992238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NfDcBM2c7RBL46+FO7R/jISsiGli0gYYtl09AucgxLg=;
        b=B4SwgcncixYaxH6LbuWg7b5IreFSYQoJVg/7o0OAS5mvxpG23cq6RW/0wHIFlcTaHj
         //xKpBWErVBmhTGKqNJMNq+CFWDwqdnnjNkAmQGnrGrAbuCHoumBLYut5l+ToQdtVLCj
         fIEVGLT+wc7mp8gG/DNwnVoJvNl1aPQRGHST54SYyW8D9FRk/tlkn38PvkC00hDHhQ0Q
         R58A9lOwU3Jivmrx+zufjvdgLZ2YZ//utc0neUcpyjpOHfAAWNNr0VgQlgA5jRrqdrN/
         gTOuhR8EsTDUcLYmLXOLPdsk5AJwR+wXxNwSJ59rqwaOXVdvQyxPvWRCPVWR26YBPsGf
         /7fA==
X-Gm-Message-State: AC+VfDxTVDRkVF9+12PD9+Z7G4DEIsWdE3IlS/7nvjkemDOYs4+fdQWx
	+3UDQTMuvSYMTWIgfE/fmOw=
X-Google-Smtp-Source: ACHHUZ7nTuQo+6D8RPzjAFAhg6ChK2h8iQcHeoxZbNMPPPBS+SpwTRfDgQtcppgJQE4kZmGDEo4e/g==
X-Received: by 2002:a05:600c:3781:b0:3f6:3da:1603 with SMTP id o1-20020a05600c378100b003f603da1603mr2519287wmr.26.1686400238132;
        Sat, 10 Jun 2023 05:30:38 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id v26-20020a1cf71a000000b003f80e81705asm2310487wmh.45.2023.06.10.05.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 05:30:37 -0700 (PDT)
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 2/3] dt-bindings: iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs GPADC
Date: Sat, 10 Jun 2023 15:29:08 +0300
Message-Id: <20230610122934.953106-3-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230610122934.953106-1-bigunclemax@gmail.com>
References: <20230610122934.953106-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_053040_535336_3EA81AAD 
X-CRM114-Status: GOOD (  13.91  )
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
index 000000000000..2b59844b7c07
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
+unevaluatedProperties: false
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
