Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9116DCCA47B
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jun 2022 13:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MLWtiz3iPOWjVrAktS9PK8ZehNuKGmjzRJ5HfZo4L3A=; b=WXsNFHE60gRCEG
	ln+uKjjj1ePfMS511It6+yr/u7/J9OM1hjXncbnoU2On1h9R1Fn3sdrw5MxKEPaNKAbghbbihA60X
	m1dxivWy91IZYIrWexYkar+kj36cTr2Ad4OMyWExZ9+izO/ImSMPQR2mcFLx3NwyNHNtwYKgTVqFQ
	4x7Pmpw++GVO7FcBnvPCwxX5LIo+/PL7AcrBnR2ey+r35REchjiYDMz2OYToF8lnYIdqAWxfsyHR9
	rpT1IlrfVIHEv6ard55CIx2GvkssUBHBYZllUdNIAWGgXEvRP4/mEYLth3edwJ8pY9NzWnj7cg2do
	sIKluohH5jvFQCHQb6nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxqNg-00EYLQ-Gx; Sun, 05 Jun 2022 13:33:24 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxqNb-00EYI1-QF
	for linux-riscv@lists.infradead.org; Sun, 05 Jun 2022 13:33:21 +0000
Received: by mail-wm1-x32b.google.com with SMTP id h62-20020a1c2141000000b0039aa4d054e2so8711614wmh.1
        for <linux-riscv@lists.infradead.org>; Sun, 05 Jun 2022 06:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iD0AT9Ulc1i16U7giR4n88maA1Cd/1tBAzCeefFKFTY=;
        b=ILnwRkHVIcM9WPFdbjX0m54y//OEZHvWFBEO5lTy+DYw3ARheHtNZ2jKwQIcWJP1bw
         SSpxhIMnPMWIck/KeG0x3/JHuGPfZRqBDkBkMDiwMgWVsnVfWeUeN4OHJnu4PWABD422
         MhP0I7MNeQgfFtQ6NamRDRMb7hRrFQVkrizly2s7TYYpFPBkmCmwPlSAaUtLT/3cDBWB
         TaLnbLz/325+osIuWILxSyB8V5CM0A48RrOHE6DwXYRA1MKYjNPLq1n3zExaHujZydWA
         BowYDDQkhKDTvauumfUdu8PGed5QENOWO780QH2I8BZaO+JKJGmlkLWAT3ZA6zTA2fc+
         mHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iD0AT9Ulc1i16U7giR4n88maA1Cd/1tBAzCeefFKFTY=;
        b=6yEdeilnIS0vyowWnGRxkiyEfMi0KpIaLJLKgiCOb3bjgkikCdKgvbT+eULOJwwjRK
         fcSBg+aQwTSOyb65c02ViYPukNvLcQ6ZcNx4MW6XLeWtznDNsgRw1mHTelW3WxagJzr8
         52glRoyiDyW+xzWtG3IhbUPhYrfB6J7vpUTHWYE4gjzFD5A8CmofskGPyt71R4W6hQTh
         /CX4kUzf1KpMZ7mFMm4a+ZgsMwTpBzHkFHUIFZ+tsG+rxKN/lW7b02ZD0PxWfuCZ3vEv
         g5cmbPIO6YZrTYyQLXQWor9AGKf11Y5/OHcsXKNU03VRot2CMsbOUWWv7LDIc+wUtAJ1
         Bg3A==
X-Gm-Message-State: AOAM533/ONGOqn/phf+4xrlyEbK/5X0xpK49nRYGww0Q1rQlAdAxIrwe
	6FCLIIwrW7YrbFCR2NDUu4qmQA==
X-Google-Smtp-Source: ABdhPJzy3arg2urk/arEHLc/LofFxNLx6PWCgGfxODw4J3E1atFORuRSw5c2jxJ1KoeetRxv07o/xw==
X-Received: by 2002:a05:600c:378d:b0:39c:4950:aef8 with SMTP id o13-20020a05600c378d00b0039c4950aef8mr5251629wmr.96.1654435997986;
        Sun, 05 Jun 2022 06:33:17 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id n187-20020a1c27c4000000b0039c151298b7sm18217076wmn.10.2022.06.05.06.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 06:33:17 -0700 (PDT)
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
Subject: [PATCH v1 2/6] dt-bindings: i2c: convert ocores binding to yaml
Date: Sun,  5 Jun 2022 14:32:57 +0100
Message-Id: <20220605133300.376161-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220605133300.376161-1-mail@conchuod.ie>
References: <20220605133300.376161-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_063319_897653_446D7F7D 
X-CRM114-Status: GOOD (  19.51  )
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

Convert the open cores i2c controller binding from text to yaml.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/i2c/i2c-ocores.txt    |  78 -----------
 .../devicetree/bindings/i2c/i2c-ocores.yaml   | 132 ++++++++++++++++++
 2 files changed, 132 insertions(+), 78 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-ocores.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-ocores.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
deleted file mode 100644
index a37c9455b244..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
+++ /dev/null
@@ -1,78 +0,0 @@
-Device tree configuration for i2c-ocores
-
-Required properties:
-- compatible      : "opencores,i2c-ocores"
-                    "aeroflexgaisler,i2cmst"
-                    "sifive,fu540-c000-i2c", "sifive,i2c0"
-                    For Opencore based I2C IP block reimplemented in
-                    FU540-C000 SoC.
-                    "sifive,fu740-c000-i2c", "sifive,i2c0"
-                    For Opencore based I2C IP block reimplemented in
-                    FU740-C000 SoC.
-                    Please refer to sifive-blocks-ip-versioning.txt for
-                    additional details.
-- reg             : bus address start and address range size of device
-- clocks          : handle to the controller clock; see the note below.
-                    Mutually exclusive with opencores,ip-clock-frequency
-- opencores,ip-clock-frequency: frequency of the controller clock in Hz;
-                    see the note below. Mutually exclusive with clocks
-- #address-cells  : should be <1>
-- #size-cells     : should be <0>
-
-Optional properties:
-- interrupts      : interrupt number.
-- clock-frequency : frequency of bus clock in Hz; see the note below.
-                    Defaults to 100 KHz when the property is not specified
-- reg-shift       : device register offsets are shifted by this value
-- reg-io-width    : io register width in bytes (1, 2 or 4)
-- regstep         : deprecated, use reg-shift above
-
-Note
-clock-frequency property is meant to control the bus frequency for i2c bus
-drivers, but it was incorrectly used to specify i2c controller input clock
-frequency. So the following rules are set to fix this situation:
-- if clock-frequency is present and neither opencores,ip-clock-frequency nor
-  clocks are, then clock-frequency specifies i2c controller clock frequency.
-  This is to keep backwards compatibility with setups using old DTB. i2c bus
-  frequency is fixed at 100 KHz.
-- if clocks is present it specifies i2c controller clock. clock-frequency
-  property specifies i2c bus frequency.
-- if opencores,ip-clock-frequency is present it specifies i2c controller
-  clock frequency. clock-frequency property specifies i2c bus frequency.
-
-Examples:
-
-	i2c0: ocores@a0000000 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "opencores,i2c-ocores";
-		reg = <0xa0000000 0x8>;
-		interrupts = <10>;
-		opencores,ip-clock-frequency = <20000000>;
-
-		reg-shift = <0>;	/* 8 bit registers */
-		reg-io-width = <1>;	/* 8 bit read/write */
-
-		dummy@60 {
-			compatible = "dummy";
-			reg = <0x60>;
-		};
-	};
-or
-	i2c0: ocores@a0000000 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "opencores,i2c-ocores";
-		reg = <0xa0000000 0x8>;
-		interrupts = <10>;
-		clocks = <&osc>;
-		clock-frequency = <400000>; /* i2c bus frequency 400 KHz */
-
-		reg-shift = <0>;	/* 8 bit registers */
-		reg-io-width = <1>;	/* 8 bit read/write */
-
-		dummy@60 {
-			compatible = "dummy";
-			reg = <0x60>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/i2c/i2c-ocores.yaml b/Documentation/devicetree/bindings/i2c/i2c-ocores.yaml
new file mode 100644
index 000000000000..1693ffffbe31
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-ocores.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OpenCores I2C controller
+
+maintainers:
+  - Peter Korsgaard <peter@korsgaard.com>
+  - Andrew Lunn <andrew@lunn.ch>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - sifive,fu740-c000-i2c # Opencore based IP block FU740-C000 SoC
+              - sifive,fu540-c000-i2c # Opencore based IP block FU540-C000 SoC
+          - const: sifive,i2c0
+      - const: opencores,i2c-ocores
+      - const: aeroflexgaisler,i2cmst
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  clock-frequency:
+    description: |
+      Desired I2C bus clock frequency in Hz. As only Standard and Fast
+      modes are supported, possible values are 100000 and 400000.
+      Note:
+      clock-frequency property is meant to control the bus frequency for i2c bus
+      drivers, but it was incorrectly used to specify i2c controller input clock
+      frequency. So the following rules are set to fix this situation:
+      - if clock-frequency is present and neither opencores,ip-clock-frequency nor
+        clocks are, then clock-frequency specifies i2c controller clock frequency.
+        This is to keep backwards compatibility with setups using old DTB. i2c bus
+        frequency is fixed at 100 KHz.
+      - if clocks is present it specifies i2c controller clock. clock-frequency
+        property specifies i2c bus frequency.
+      - if opencores,ip-clock-frequency is present it specifies i2c controller
+        clock frequency. clock-frequency property specifies i2c bus frequency.
+    default: 100000
+
+  reg-io-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      io register width in bytes
+    enum: [1, 2, 4]
+
+  reg-shift:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      device register offsets are shifted by this value
+
+  regstep:
+    description: |
+      deprecated, use reg-shift above
+    deprecated: true
+
+  opencores,ip-clock-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Frequency of the controller clock in Hz. Mutually exclusive with clocks.
+      See the note above.
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+oneOf:
+  - required:
+      - opencores,ip-clock-frequency
+  - required:
+      - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c@a0000000 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      compatible = "opencores,i2c-ocores";
+      reg = <0xa0000000 0x8>;
+      interrupts = <10>;
+      opencores,ip-clock-frequency = <20000000>;
+
+      reg-shift = <0>;	/* 8 bit registers */
+      reg-io-width = <1>;	/* 8 bit read/write */
+
+      dummy@60 {
+        compatible = "dummy";
+        reg = <0x60>;
+      };
+    };
+
+    i2c@b0000000 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      compatible = "opencores,i2c-ocores";
+      reg = <0xa0000000 0x8>;
+      interrupts = <10>;
+      clocks = <&osc>;
+      clock-frequency = <400000>; /* i2c bus frequency 400 KHz */
+
+      reg-shift = <0>;	/* 8 bit registers */
+      reg-io-width = <1>;	/* 8 bit read/write */
+
+      dummy@60 {
+        compatible = "dummy";
+        reg = <0x60>;
+      };
+    };
+...
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
