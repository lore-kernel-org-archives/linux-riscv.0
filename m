Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49722CCA473
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jun 2022 20:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cn21PexX/HzOygJk7xghxDyWDbiYX6DSxyhCnkBcmXQ=; b=CWbGoOUW7WD9Td
	YaCMRd7aZlphhCQ8Yc8owf6ZDXGlkTybOQ1aJkIvKW+sYvQDBmkmftIpDzREBQ74zMFER4bz9hCZJ
	vUiI/0DQvLCNyWMqKQwNhkNyMFN5gfSHod/OCwwb7z9t3Ih6VYIlYGryR+tEuOq5SkS528q+OEpKD
	faCZOZapwlasKDDOiJj4bPxewbnhet/CeZbVOQW8fVQEQ9RnF0+4XfIcT/WQm8sZ96HSvu1E3Z0Sk
	hpnxwFgIo/BF09Ahyrql+G9spp3GFfo+h9f+ZkbWbKeq+bb31liKJ2SuD0YzVoiTptopxZzA+0BbU
	4bTMAmdKVDOKuGA0oK8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJ75-002YKI-K2; Mon, 06 Jun 2022 20:14:11 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJ71-002YI1-3H
	for linux-riscv@lists.infradead.org; Mon, 06 Jun 2022 20:14:09 +0000
Received: by mail-wr1-x42e.google.com with SMTP id m26so9853913wrb.4
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jun 2022 13:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jeQ0ViwKjg4rIn8dC6mh1AhiPoIbefNYM5vCjdm72pQ=;
        b=XDLFX0FCh6R8nVkiujqyI4B+6dQOabsvXS68MvFtSzExkuJtOCpnza4M3nUEhJDKNY
         E/GBHB/fJIVsMmtxggc5sLTzmx6F800cNpbVsxJLbTioDUleQdGEYr7fEdlq9hspODw4
         OHsau+mt663Gfc6m66ZzdRZFGlAPK50mpMFwdLQzPpUBDpnAOZb9O3JLh/iq4rZSVVhK
         e4X1uKBD9DQDLePruxUmcmHSLLIj9d+v+HHj6VCNs810/54k6UPwNCe+t/N81vj5XVOc
         2CwkLVvFYIbTjnSOl1W5cmPulS6H32+dfMRIH/iBzgQQOZH+WmNCUWAGqoq8escnMgtG
         iMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jeQ0ViwKjg4rIn8dC6mh1AhiPoIbefNYM5vCjdm72pQ=;
        b=65dT3v9VBAdA7Dtn+s2PJDor3WZa3F6jabVuYOsRrKpdjZQ29im9LLrKyRcjID1tfU
         J9TEorLBaYVjSx71ItdzNkkHfPEJGqY36Bad4Qh6JZuGSJCvEnc+4jFjD2AX22pdFUhL
         MYRvejdGxNf0s3YT9PLTJYWKLz+BdP2P+xYzRw2SPMW18XhxbBc9QhQG3TT1xDt5Q+Um
         Sn8F3gRATe1NyMXrIJz/tXi5jYClEvMZubTLjPZGcx3yexpRi3XJkm4zFViT32x18v9k
         iFhjl4VlVZcQlOpqCuJ58cNr354m3INZHeBqF3ASR4Wa2ng0IKusKODZVw5IcOEiQPjF
         6nJA==
X-Gm-Message-State: AOAM532/1t9+wZ8jdX70L8NC0z7kYeNHZlG4Tx4ACllpS9mWFrqbpm94
	5Bvb9b38b1Mx2yTycsJ+Mz5RGw==
X-Google-Smtp-Source: ABdhPJzVg+E47CFTVsH83Jx7lnh0Ve4RW5lbP7VYDud6f2yjG2GigdJpNI/kqgYYsoLdyeO/zc0wgw==
X-Received: by 2002:a05:6000:18ae:b0:211:40df:c00e with SMTP id b14-20020a05600018ae00b0021140dfc00emr24085870wri.304.1654546444685;
        Mon, 06 Jun 2022 13:14:04 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id p9-20020a5d4589000000b0020fcf070f61sm16038489wrq.59.2022.06.06.13.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 13:14:04 -0700 (PDT)
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
Subject: [PATCH v3 2/4] dt-bindings: i2c: convert ocores binding to yaml
Date: Mon,  6 Jun 2022 21:13:42 +0100
Message-Id: <20220606201343.514391-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606201343.514391-1-mail@conchuod.ie>
References: <20220606201343.514391-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_131407_185759_7562B4B7 
X-CRM114-Status: GOOD (  21.93  )
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

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/i2c/i2c-ocores.txt    |  78 ------------
 .../bindings/i2c/opencores,i2c-ocores.yaml    | 113 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 114 insertions(+), 79 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-ocores.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml

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
diff --git a/Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml b/Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml
new file mode 100644
index 000000000000..85d9efb743ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/opencores,i2c-ocores.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
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
+      - enum:
+          - opencores,i2c-ocores
+          - aeroflexgaisler,i2cmst
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
+  clock-frequency:
+    description: |
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
+    description: |
+      io register width in bytes
+    enum: [1, 2, 4]
+
+  reg-shift:
+    description: |
+      device register offsets are shifted by this value
+    default: 0
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
+      compatible = "opencores,i2c-ocores";
+      reg = <0xa0000000 0x8>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      interrupts = <10>;
+      opencores,ip-clock-frequency = <20000000>;
+
+      reg-shift = <0>;	/* 8 bit registers */
+      reg-io-width = <1>;	/* 8 bit read/write */
+    };
+
+    i2c@b0000000 {
+      compatible = "opencores,i2c-ocores";
+      reg = <0xa0000000 0x8>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      interrupts = <10>;
+      clocks = <&osc>;
+      clock-frequency = <400000>; /* i2c bus frequency 400 KHz */
+
+      reg-shift = <0>;	/* 8 bit registers */
+      reg-io-width = <1>;	/* 8 bit read/write */
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index a6d3bd9d2a8d..cfaf02fc9191 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14869,7 +14869,7 @@ M:	Peter Korsgaard <peter@korsgaard.com>
 M:	Andrew Lunn <andrew@lunn.ch>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/i2c/i2c-ocores.txt
+F:	Documentation/devicetree/bindings/i2c/i2c-ocores.yaml
 F:	Documentation/i2c/busses/i2c-ocores.rst
 F:	drivers/i2c/busses/i2c-ocores.c
 F:	include/linux/platform_data/i2c-ocores.h
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
