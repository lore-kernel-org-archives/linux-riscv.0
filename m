Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54481CCA47F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jun 2022 20:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qD2W6oni1hoUf4zLLd3GNihePT/dIKpeYGmpqXOd17I=; b=SkoU9IZ/TMy+lL
	MVF2U48DSrNAK1BXyut9CdrH29k4dlC1FJ8Sq3QNe6gdCXRJEGnyISMyaxAP+huCmsZgXa+LtZyTd
	Xnow0xZJ+tjPiOebTY9WTFPuylvKfGNXGl7F4ZhYS0niIijuUmRHBlTm448wQb0t01rJCxPGQfcdg
	dyAlr/0Pwf0unPTzJd5tlUy9Cb+CFhJPMjzuT5B/41ucQpdK7nSejw56zY8/3TcBZzr1p/vf/anoq
	Rekoh+GeSXjJKRBvlDxe/BpmSdgmlvrErLH0YFXD9frnKrbXvzN2WOJn9wN28AJDSlOea9z19XnsO
	on29N6anPDdGIVqsBDtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJ74-002YJZ-20; Mon, 06 Jun 2022 20:14:10 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJ6z-002YHm-S7
	for linux-riscv@lists.infradead.org; Mon, 06 Jun 2022 20:14:08 +0000
Received: by mail-wr1-x42f.google.com with SMTP id q7so21288200wrg.5
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jun 2022 13:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7vCPgtA3BbvZtshze5CQUg4kM9ICh/+RTxGA4WD1mf0=;
        b=LC4gaaoUVgwwaH+unaf96kROWS2r6vondQTIeTrkLXqhEYhHYME9g/jc4nwTRx0x4t
         EriKh2T7D6lmykbp7aU4rsziWsg8lrjMtj91I4R4MKX0gcnxKajPFaLzqDo2FhJ3sfys
         bzYrmQZO03q3bcE8oBIYN55C5dDnTZDPPgffqaInr4MxebfJqbHz47SoWMlnCILzyiMK
         H/eo01OYjK4IETEedcNAXgfOxsKQJVjrm3wKwF4T5X9f/L2RMxnFoF1x27k2l+4lj1LU
         naZGQOjfzZfXlVKaGjCZuytouGCS0IS0e4aAz/VRjkj7mS3pLA+73ESvNbkf4jNzeJz/
         eyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7vCPgtA3BbvZtshze5CQUg4kM9ICh/+RTxGA4WD1mf0=;
        b=CYAENi760XfkWt+ahLqgarPcYn7ZfTU+3yTYFFkwDNNIya0Kk0m+hF9Z2XKluHE9Eh
         n67s6iskGD1FKRPiLSwDSs15oUrR9U3YlbmrYD2v9xZbW9PlTsA602CL/CqCiwvtJvRb
         VjYMCWRWzc9GUis0ncVoNxbsYfZL4ukLPImzh3kvkKh5mMD8RaxnKCjK7UryQ0D9oN5B
         M5aeppLxYk6PLkn3zFeEZ2FjrxPqMlP8haX8QD+13fAkp4czKn0ePW3kC+sPbiUNcF9C
         HfzDr1oJVWFVWddFeId9MXLQxsTZ++V++Fax4Igqvh+D6tE6H7y4XMMmsu/g91IOWNTc
         bkVg==
X-Gm-Message-State: AOAM531H6u0Bs2S341xx06p04VVCDXIxV1+XUQ9UM2mL/+Y9bAtFq4tw
	ApXLYlLameHJKQU2j3bhe2SZnA==
X-Google-Smtp-Source: ABdhPJxvgT6fY/VVwTGBW393iUEwu2JtUuZPhYqj8miS4mwpMcsuIC4g/CyKAFrs4/Q3oylmeATaVQ==
X-Received: by 2002:a5d:67c9:0:b0:218:4a6a:298e with SMTP id n9-20020a5d67c9000000b002184a6a298emr2016266wrw.153.1654546443329;
        Mon, 06 Jun 2022 13:14:03 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id p9-20020a5d4589000000b0020fcf070f61sm16038489wrq.59.2022.06.06.13.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 13:14:02 -0700 (PDT)
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
	Atul Khare <atulkhare@rivosinc.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/4] dt-bindings: mmc: convert mmc-spi-slot to yaml
Date: Mon,  6 Jun 2022 21:13:41 +0100
Message-Id: <20220606201343.514391-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606201343.514391-1-mail@conchuod.ie>
References: <20220606201343.514391-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_131405_949241_CAFBCEA6 
X-CRM114-Status: GOOD (  15.87  )
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

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/mmc/mmc-spi-slot.txt  | 29 -------
 .../devicetree/bindings/mmc/mmc-spi-slot.yaml | 77 +++++++++++++++++++
 2 files changed, 77 insertions(+), 29 deletions(-)
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
index 000000000000..c45b91099325
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml
@@ -0,0 +1,77 @@
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
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      Two cells are required, first cell specifies minimum slot voltage (mV),
+      second cell specifies maximum slot voltage (mV).
+    items:
+      - description: |
+          value for minimum slot voltage in mV
+        default: 3200
+      - description: |
+          value for maximum slot voltage in mV
+        default: 3400
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
