Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5E5C3F2D4
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jun 2022 13:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aoOMxykVpgO/OOVVtQ4MPjwc3i2esGQdOCvjVbNsuvA=; b=npfkqD3DDkVFBo
	8NiQ3HSrpGX10SX7Mm4Z66R9I+bJ0cq5cxu+0a63mep4FeVM4DiMVcyVW1yznSqoOLDk/vKhxX6ib
	ZRgjYD6KtKkPR6tvjmHDhVP6yr3BeUj2Tjflx4jZLf2HXjADUrKXnwc8Rsazlm5/O3ZVkOW24zOgO
	DDUfYXZTAjSzG//xvdeq0afHSW4jyUdlXVCslz+oWojobIcsoXJCl/58ugjz5Fgrrf02Sgv6vhjwa
	Hda+ylWEfRWpmwp7D3sYPBHqxQ4oiykatGuYr9XTw1JP/MUFEa8Q/wDqjeQZ2UINspHKL6su1lYcq
	5ILCv0aVIIO2NIPB8ICQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxqNe-00EYKC-Qp; Sun, 05 Jun 2022 13:33:22 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxqNa-00EYHa-KI
	for linux-riscv@lists.infradead.org; Sun, 05 Jun 2022 13:33:20 +0000
Received: by mail-wm1-x331.google.com with SMTP id z17so1505656wmi.1
        for <linux-riscv@lists.infradead.org>; Sun, 05 Jun 2022 06:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sUOXdPn8EOhhxjnRiVLAO3H3BCAF6yuCXw9gRZytXYg=;
        b=QbfCFTgGtKcOwqGaMRbSa4+e5jEOcoDFjkrwWtgr0Ba+3+ET2GgN/pBwxBChBpH+K4
         mslWlLN+4mvQ/xPTjuKA9cMbRJzlGk7Q+6yzWEH3nKf3lnhLw63P1Ma/J3M3Qds26qUZ
         E5GOB8GGFbkv267JW7aQ8nDPn5RTeQcIvFdP4IjiVkLfULVj6Zd4P+8yHHxu9PC8nk8U
         cq5am9mlaxp1hiATSpxf1R/MN44PvTA2FvoairCpnSbXL53rKAQi1uURBTLMO3vEuDFu
         5WX9pm7xmSm03dEgyUFX/i4ejnGaDn+qgrPsW/FZdt4RGjoDaIE54Vo6kg5dQeKympMB
         Bs9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sUOXdPn8EOhhxjnRiVLAO3H3BCAF6yuCXw9gRZytXYg=;
        b=odoG7TUcxor3OA3UJz10vSzjoCHAp/g6wWOjVbmrIjvkthid31BasMyCpYD7MZS2Ko
         1ND1aDyTorUh3qoU1BNKy3d5xa1XEek9gjRsO2EEgLPPGYT8uKigk7Vx47iRrwM5nIk1
         VqXZ+zmF2HASXBMuXy4iJRx0Lu+AhPwGt8ITYYtuJ4hkxhGlUUn0xUPPVi9yq1O1Oe3B
         cznKOjbtHMZTLmVaI/uMgf7E/yH4ocXbNpXaq2B2w9grTZm2JmpTaS+siiFJK6fkhWGM
         0EC3osYRLq1yutLMZPNeVQIzWaHM0FGvq9miE2ox6YI5jvdLLYYOrl8Xa0Mc/rsGiw7E
         bMZQ==
X-Gm-Message-State: AOAM532vtsZ1yPVQ9vk0E6anRTgcpkmVOZewGQtFT5uCDiu3Xl7vRncI
	sBTEIHldg7p67z8wrDWwhE+sKQ==
X-Google-Smtp-Source: ABdhPJxdcDTuUEHAQfxai+GQ5ckF1kK/+szwHFOLq1NgQVHxO1mPiMYwRbihKTJxK1quAmahfHVidQ==
X-Received: by 2002:a05:600c:601b:b0:39c:4194:e4f with SMTP id az27-20020a05600c601b00b0039c41940e4fmr11009634wmb.105.1654435996727;
        Sun, 05 Jun 2022 06:33:16 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id n187-20020a1c27c4000000b0039c151298b7sm18217076wmn.10.2022.06.05.06.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 06:33:16 -0700 (PDT)
From: mail@conchuod.ie
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
Subject: [PATCH v1 1/6] dt-bindings: mmc: convert mmc-spi-slot to yaml
Date: Sun,  5 Jun 2022 14:32:56 +0100
Message-Id: <20220605133300.376161-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220605133300.376161-1-mail@conchuod.ie>
References: <20220605133300.376161-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_063318_729061_3F13D91A 
X-CRM114-Status: GOOD (  15.73  )
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
 .../devicetree/bindings/mmc/mmc-spi-slot.yaml | 76 +++++++++++++++++++
 2 files changed, 76 insertions(+), 29 deletions(-)
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
index 000000000000..a5fd723140c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml
@@ -0,0 +1,76 @@
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
+
+description: |
+  The extra properties used by an mmc connected via spi.
+
+properties:
+  compatible:
+    const: "mmc-spi-slot"
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
+    $ref: '/schemas/types.yaml#/definitions/uint32-matrix'
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
+      For historical reasons, this does not follow the generic mmc-controller binding.
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
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      mmc@0 {
+        compatible = "mmc-spi-slot";
+        reg = <0>;
+        gpios = <&qe_pio_d 14 1>, <&qe_pio_d 15 0>;
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
