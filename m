Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E471EB64DC
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 09:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=51KkBDAF9QBCdST2IGY0i2vLpfxuDHTQRBHGSI6q3Rs=; b=Ruh7SCg0ZJjbLq
	ujXrFT0oD9elYFbAMZqEDPybcQpalR5xACVR6tZYaKExqOdQM0Inj3/xQ1gbjHbizvmd282BkfzoE
	WQoT61I6irKXQM/8XXKirbVXaWo6hfND4m6SRczMGg5vs9X3wmT6vIF9piNqeGSInbURI7HogHC5u
	I1SN9RphXYHuomqfQKO32WLtAHgZrluxSbDZ6/JmTw7cpql5ziVfmf8aC+I9kmJ9MHNsRad+XzDOU
	VvTXbHkdk2Q4X9kNZOfnnUeQ1LPcyK/CijtuH1/4T2xgRMATw6TToVs20yVOWOeFcE5VIGz0LpmzR
	6dj27EH1Neyw30s6ymPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKbQW-008Gqr-0F;
	Sat, 15 Jul 2023 09:18:56 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKbQI-008GlP-1D;
	Sat, 15 Jul 2023 09:18:43 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b8392076c9so28498511fa.1;
        Sat, 15 Jul 2023 02:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689412720; x=1692004720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aL5sq5Lugahi7hv9X9W+s9NTZzWQgnxxieVUqmZWN4k=;
        b=hkC/l0PqNNlvf1QawpapipLhW0ec27tqSQNF+pbnWG2amkvKgTbUy2BZj1E60f0XPw
         ICzQv+APS8QZRPsaVgLEcXOt+rIVfVGvX0pi8EzBH6QkCPZrKM+s2c+xMVxAaY9ArgrR
         bpdD3YPHN23ka/++8CxR+4ai0xmURIv54D7PdOB+VKLwZg4iI8DRef/2AE8nuIi1HvIK
         apn4JdSnn3J6DUqfaNhES2hrFi76pZFVgkTjRJfafjIflfRxe0wex1XWTVvNn36FO6oa
         vpnyImsyV+M3EAcrPucso+1ehaU3IZuFbDMDnu0zNVBEnp2payDVLW+bnqTNV2hPW9nQ
         esag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689412720; x=1692004720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aL5sq5Lugahi7hv9X9W+s9NTZzWQgnxxieVUqmZWN4k=;
        b=lW7AcwUjJnNUFzZ5UJFYPl2jbu1AdVf8uGAQAvZChzzZmmImyHebS0rJWl1Eo7jg9T
         8Q0YsUV7GHGCf1+mKIoVLIcohDgItuNYSdAjzm4nqQgPP5cLb31Pbdw+SIx9rlnwmyOG
         fXddigYmYmgbPdyiUpNKIZEq9EEugCpGIaXoEObmC/buihIIVmdfjPonFAuk7flMpXw/
         kzgii1T5H4QBm+ZkARiiP7aZ07p3aPksiAZZxr2MQg8qghrMTuBDPb9mSz1l20oigtpF
         8SSj8L1+11ikUCIbLWRNGvQEGXUO6hSO6ScfRClseFAtmgvwzCj9bhZ0jDCDwjUB6AFJ
         QLRw==
X-Gm-Message-State: ABy/qLaYFORNbTfKNOF4Mr/nUOvKUCRB00hFwmE9raSOKCMx2oZGuofq
	Tno2x1rpLLybOCAdYuqUQfQ=
X-Google-Smtp-Source: APBJJlFw6pqwd8SozYu/e4m47fwD0y7FnzFvfCySpTqQUjXAlW6XQ/C3li71WujguTyDYtPhFY1uqA==
X-Received: by 2002:a2e:94c7:0:b0:2b6:e2aa:8fc2 with SMTP id r7-20020a2e94c7000000b002b6e2aa8fc2mr4696400ljh.46.1689412719800;
        Sat, 15 Jul 2023 02:18:39 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id b17-20020a2e9891000000b002b840f283a7sm561784ljj.36.2023.07.15.02.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 02:18:39 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v9 3/4] dt-bindings: iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs GPADC
Date: Sat, 15 Jul 2023 12:18:15 +0300
Message-Id: <20230715091816.3074375-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230715091816.3074375-1-bigunclemax@gmail.com>
References: <20230715091816.3074375-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_021842_412619_7B333B07 
X-CRM114-Status: GOOD (  12.79  )
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
