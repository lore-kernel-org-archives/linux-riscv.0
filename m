Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1ED5C43334
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jun 2022 15:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PLGnFddLD4HMq127k0pEw9Sd83c5DX6ZUIrP2cq1rfw=; b=puqPDFZr7tyFm7
	g0/Kpls0UR+a/Z5LfE690QpZTn/CpuzI8ZU5FVjlr6wwUmFgiK1aQnYjJc74zEbWC8rgVPLiZliba
	v81ZlMa9IYssMipl0dN+CIbo9mg2vQ3POY2uDiQ0Cw32bOujzMYS3Y2N4qn30bmerZHI9eyQJJXKI
	FPRtJjw48y08ooOSAbQKHuG3dxIT9tu/QfDPImIRtLyjI8O66w97iEr3WYBrR3XpurfiAxz1z36FU
	qtyi9CdsgdbXFgv8isA9KtRBfFtkTBpIvw0fGgrFoe7XaWqt58jf071o28eJ12ijlZHHpJcWsaLux
	5yf50aVFzBxurlJDw+YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEfo-001oxr-9A; Mon, 06 Jun 2022 15:29:44 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEcQ-001nBp-35
	for linux-riscv@lists.infradead.org; Mon, 06 Jun 2022 15:26:16 +0000
Received: by mail-wm1-x32d.google.com with SMTP id l126-20020a1c2584000000b0039c1a10507fso2258555wml.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jun 2022 08:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hZdkoa4f3dS0vHJIll9XRyKBK8IfupJfle0pIR+CS5M=;
        b=FHCihJRHA0NhBsPU4jxzqdixXdc7HgNyQyBu1L+72eh5ISbz//2EnwnRjRa7dP/uUl
         VgvV5ErkLss2G2nL3p81tU2SReFh+OAXu9CVJJQ4+FOC+ADLIzXHu7hiQxpSLyDi3pFu
         I3DvzajSBL36y+FtgNHawajeYUBBH9Fofx0KvEJWMBWmT7pQBjM98RSwkBctqEimjyF3
         ZuSNNpzbbl9QiTq8eoYNTbABDni53UQUg52VafC+sR1gqjNQOkAeT+8g4O0KCu59gHO8
         Mo2uhH+mR/qDH+JORKsB/7wybGgRSsy7PCxN2NNc/vL5G+FrHNuSX8WAO8s3gooZG4qS
         VkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hZdkoa4f3dS0vHJIll9XRyKBK8IfupJfle0pIR+CS5M=;
        b=eF338lpSz7V5YFn0tx0+g449i8h2eJAJKSEn5tJzV7HclwP34g6BwfsFEcSgcB9O/z
         N+tpid4wc7NRQYtbHUfoewCdx2U3JwRNvhkMbJwPL7J3ToMIu1BjVDu6bELx/r65dn7e
         LAXjPdymWt33c/J0kLLtGRtwKQCvQmdlAKhfJQl/lGPxX1l5U/N+8y5E0LP01EsiLXKb
         O3xsde8Y0vPAxHX3MP5Itg9eGuyDpRz1uhj3erMPHCT9OAM+EQFuQn0mG1ovDCBuzEkZ
         1svpPC4c8Y9/MOQ1atY9uWkk05L7yZc0spZ+FZDeMopyOm7kBYq4VCyIpiRU5ZVh9EuG
         bYtg==
X-Gm-Message-State: AOAM533RtRfQaXLrICTYwO60+u5eTT/gywVrAgzUU39cLhI8lBmYqLPV
	UWdBLwyrAx69aqx3Qywut3EJeg==
X-Google-Smtp-Source: ABdhPJxp3OFfINk2AAKh6owlATXaLNxGLnQE/UoAxRlQacTM75ntBSGa2L2wDv3IMczFVGCFRZVktQ==
X-Received: by 2002:a7b:c5c6:0:b0:397:8a39:37b with SMTP id n6-20020a7bc5c6000000b003978a39037bmr24001370wmk.182.1654529170467;
        Mon, 06 Jun 2022 08:26:10 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id h1-20020adffd41000000b002103aebe8absm15623944wrs.93.2022.06.06.08.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 08:26:09 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee.jones@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Steve Twiss <stwiss.opensource@diasemi.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Atul Khare <atulkhare@rivosinc.com>
Subject: [PATCH v2 1/4] dt-bindings: mmc: convert mmc-spi-slot to yaml
Date: Mon,  6 Jun 2022 16:25:55 +0100
Message-Id: <20220606152557.438771-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606152557.438771-1-mail@conchuod.ie>
References: <20220606152557.438771-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_082614_205006_45CBAF01 
X-CRM114-Status: GOOD (  15.84  )
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

Convert the mmc-spi-slot text based binding doc to yaml,
with the side effect of cleaning up some of the riscv
dtbs_check warnings.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/mmc/mmc-spi-slot.txt  | 29 -------
 .../devicetree/bindings/mmc/mmc-spi-slot.yaml | 79 +++++++++++++++++++
 2 files changed, 79 insertions(+), 29 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mmc/mmc-spi-slot.txt
 create mode 100644 Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml

diff --git a/Documentation/devicetree/bindings/mmc/mmc-spi-slot.txt b/Documentation/devicetree/bindings/mmc/mmc-spi-slot.txt
deleted file mode 100644
index 5e74db69f581..000000000000
--- a/Documentation/devicetree/bindings/mmc/mmc-spi-slot.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-MMC/SD/SDIO slot directly connected to a SPI bus
-
-This file documents differences between the core properties described
-by mmc.txt and the properties used by the mmc_spi driver.
-
-Required properties:
-- spi-max-frequency : maximum frequency for this device (Hz).
-
-Optional properties:
-- voltage-ranges : two cells are required, first cell specifies minimum
-  slot voltage (mV), second cell specifies maximum slot voltage (mV).
-  Several ranges could be specified. If not provided, 3.2v..3.4v is assumed.
-- gpios : may specify GPIOs in this order: Card-Detect GPIO,
-  Write-Protect GPIO. Note that this does not follow the
-  binding from mmc.txt, for historical reasons.
-
-Example:
-
-	mmc-slot@0 {
-		compatible = "fsl,mpc8323rdb-mmc-slot",
-			     "mmc-spi-slot";
-		reg = <0>;
-		gpios = <&qe_pio_d 14 1
-			 &qe_pio_d 15 0>;
-		voltage-ranges = <3300 3300>;
-		spi-max-frequency = <50000000>;
-		interrupts = <42>;
-		interrupt-parent = <&PIC>;
-	};
diff --git a/Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml b/Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml
new file mode 100644
index 000000000000..cf79092de8fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/mmc-spi-slot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MMC/SD/SDIO slot directly connected to a SPI bus
+
+maintainers:
+  - Ulf Hansson <ulf.hansson@linaro.org>
+
+allOf:
+  - $ref: "mmc-controller.yaml"
+  - $ref: /schemas/spi/spi-peripheral-props.yaml
+
+description: |
+  The extra properties used by an mmc connected via SPI.
+
+properties:
+  compatible:
+    const: mmc-spi-slot
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency: true
+
+  interrupts:
+    maxItems: 1
+
+  voltage-ranges:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    description: |
+      Two cells are required, first cell specifies minimum slot voltage (mV),
+      second cell specifies maximum slot voltage (mV).
+    items:
+      items:
+        - description: |
+            value for minimum slot voltage
+          default: 3200
+        - description: |
+            value for maximum slot voltage
+          default: 3400
+    maxItems: 1
+
+  gpios:
+    description: |
+      For historical reasons, this does not follow the generic mmc-controller
+      binding.
+    minItems: 1
+    items:
+      - description: Card-Detect GPIO
+      - description: Write-Protect GPIO
+
+required:
+  - compatible
+  - reg
+  - spi-max-frequency
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      mmc@0 {
+        compatible = "mmc-spi-slot";
+        reg = <0>;
+        gpios = <&gpio 14 GPIO_ACTIVE_LOW>, <&gpio 15 GPIO_ACTIVE_HIGH>;
+        voltage-ranges = <3300 3300>;
+        spi-max-frequency = <50000000>;
+        interrupts = <42>;
+        interrupt-parent = <&PIC>;
+      };
+    };
+
+...
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
