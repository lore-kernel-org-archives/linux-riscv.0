Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477DCC433EF
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jun 2022 13:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3DQK8l/HlzxSqhwalQo25JQV4w/szEYvwpWaFgO+hJc=; b=sJz3FLjx4cdqQ0
	jtVsMyU9wOGhk3I0oChziUiN+xMtUZQuj1ct2YfVSMnydIhPhsm8HIHs1it+EnZG80WAZJifNL8bC
	UP6etyAiRRqrTjFQasoz6QR89SBa7ORVFQ/90D/AlUgXf9hP4+lZh4Nijcy5zG+f+rq8sdIjwMpd0
	aqp7+Vpz11s35rmk0yJNRHs0xtuKpoZXREM6c7pnSnRjzMEtWNfg8Nk1N5ejRcNGur/4Zn5nfGZ0h
	gMfhDxfi0uu5PmtbqMdbjcHaT+96qaaYBrFLyAyfPShShyVWiJ4SW0C2PkpOMXn2e6nmC2uRZyRed
	eVWilUa/TResJcN8gvxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxqNk-00EYNs-5A; Sun, 05 Jun 2022 13:33:28 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxqNe-00EYIn-CA
	for linux-riscv@lists.infradead.org; Sun, 05 Jun 2022 13:33:24 +0000
Received: by mail-wr1-x42a.google.com with SMTP id p10so16381880wrg.12
        for <linux-riscv@lists.infradead.org>; Sun, 05 Jun 2022 06:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0MyzpsFTpfWVf4jrzrptLmik9brUBiyW2F84GuqNqSo=;
        b=Q2t9n2ifoHSgWYG9ro4F7xjb4uczkrQxDKgIjiY8/SNscngUCoNmYPobSFoNtyXzEq
         0fgbBQKMrA35Z4q8GkY/YiXYvFXlPL/RBYXfJArTCtNaFo2b5nhEZEBL+BMXX6NDhaCt
         HNQ/sc0g5B82ut993kwkWQKkVwI5D7/AF3TjzcAmAz7KlIVG8ChDSqG1ysLKQ5T+ZXZ8
         nRwg8F7vLmAQl0dWK3vbVc+mLxco+tJp/cN8SFnxhoqJySioGwbUoUEXo/h+szcZaiKA
         KIeQ/LcY0RQ3xA8qsXXLutCaJJWUt2xwUIywyUgCfNNqglp05hJO74G14uCpSgXx3EaO
         dfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0MyzpsFTpfWVf4jrzrptLmik9brUBiyW2F84GuqNqSo=;
        b=wRptlhtkTwzYL770c/pYHfPoZA44CZY6NR0w9/yA244ZvdxPOACksyZINkjzgbxujQ
         aLxiyJuzajIxYG4uIHriklt6r4auF/ij+396OqBPmDfnEdz7R/DGVKTY3NwQVMrs2KZk
         d1Qs41GXer7b1ITxKzPrduJqLCTfw2SYlrN5vaAiH/7TZYlWMvIkUrgIVEjogzadts2l
         PqNszoqZyVNiONV/HFqPgU0duEqwlUbnkofezyHIJLv4mgWz3M71JYEU9aEVSj+8OTjZ
         BVIBp9KTyyYVru1CaOlGV15ZTF/0pQ4ci7tmE3nibtImfLAzERJue8lD6JuaBSqhimlP
         EsxA==
X-Gm-Message-State: AOAM533O7WO8d9uSY8iXOPWUcGFZe5FmOyGePsuPYYWD3KP1CCl9nZJu
	Fmaw8WdyKQLoYnhpdj88TbhufA==
X-Google-Smtp-Source: ABdhPJyevo8PLglhVn4Uhe9tn6b8M1MTJYIq62hMjrrmCV1eXVQvUp2WYRXZjMkLleMTMX+qK11MJQ==
X-Received: by 2002:a5d:638b:0:b0:20f:c623:2597 with SMTP id p11-20020a5d638b000000b0020fc6232597mr16439572wru.271.1654436000512;
        Sun, 05 Jun 2022 06:33:20 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id n187-20020a1c27c4000000b0039c151298b7sm18217076wmn.10.2022.06.05.06.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 06:33:20 -0700 (PDT)
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
Subject: [PATCH v1 4/6] dt-bindings: mfd: convert da9063 to yaml
Date: Sun,  5 Jun 2022 14:32:59 +0100
Message-Id: <20220605133300.376161-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220605133300.376161-1-mail@conchuod.ie>
References: <20220605133300.376161-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_063322_471784_E5609F7C 
X-CRM114-Status: GOOD (  23.51  )
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

Convert the dt binding for the da9063/da9063l to yaml.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/mfd/da9063.txt        | 111 ----------------
 .../devicetree/bindings/mfd/da9063.yaml       | 123 ++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |   2 -
 3 files changed, 123 insertions(+), 113 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/da9063.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/da9063.yaml

diff --git a/Documentation/devicetree/bindings/mfd/da9063.txt b/Documentation/devicetree/bindings/mfd/da9063.txt
deleted file mode 100644
index 91b79a21d403..000000000000
--- a/Documentation/devicetree/bindings/mfd/da9063.txt
+++ /dev/null
@@ -1,111 +0,0 @@
-* Dialog DA9063/DA9063L Power Management Integrated Circuit (PMIC)
-
-DA9063 consists of a large and varied group of sub-devices (I2C Only):
-
-Device                   Supply Names    Description
-------                   ------------    -----------
-da9063-regulator        :               : LDOs & BUCKs
-da9063-onkey            :               : On Key
-da9063-rtc              :               : Real-Time Clock (DA9063 only)
-da9063-watchdog         :               : Watchdog
-
-======
-
-Required properties:
-
-- compatible : Should be "dlg,da9063" or "dlg,da9063l"
-- reg : Specifies the I2C slave address (this defaults to 0x58 but it can be
-  modified to match the chip's OTP settings).
-- interrupts : IRQ line information.
-- interrupt-controller
-
-Sub-nodes:
-
-- regulators : This node defines the settings for the LDOs and BUCKs.
-  The DA9063(L) regulators are bound using their names listed below:
-
-    bcore1    : BUCK CORE1
-    bcore2    : BUCK CORE2
-    bpro      : BUCK PRO
-    bmem      : BUCK MEM
-    bio       : BUCK IO
-    bperi     : BUCK PERI
-    ldo1      : LDO_1	(DA9063 only)
-    ldo2      : LDO_2	(DA9063 only)
-    ldo3      : LDO_3
-    ldo4      : LDO_4	(DA9063 only)
-    ldo5      : LDO_5	(DA9063 only)
-    ldo6      : LDO_6	(DA9063 only)
-    ldo7      : LDO_7
-    ldo8      : LDO_8
-    ldo9      : LDO_9
-    ldo10     : LDO_10	(DA9063 only)
-    ldo11     : LDO_11
-
-  The component follows the standard regulator framework and the bindings
-  details of individual regulator device can be found in:
-  Documentation/devicetree/bindings/regulator/regulator.txt
-
-- rtc : This node defines settings for the Real-Time Clock associated with
-  the DA9063 only. The RTC is not present in DA9063L. There are currently
-  no entries in this binding, however compatible = "dlg,da9063-rtc" should
-  be added if a node is created.
-
-- onkey : This node defines the OnKey settings for controlling the key
-  functionality of the device. The node should contain the compatible property
-  with the value "dlg,da9063-onkey".
-
-  Optional onkey properties:
-
-  - dlg,disable-key-power : Disable power-down using a long key-press. If this
-    entry exists the OnKey driver will remove support for the KEY_POWER key
-    press. If this entry does not exist then by default the key-press
-    triggered power down is enabled and the OnKey will support both KEY_POWER
-    and KEY_SLEEP.
-
-- watchdog : This node defines settings for the Watchdog timer associated
-  with the DA9063 and DA9063L. There are currently no entries in this
-  binding, however compatible = "dlg,da9063-watchdog" should be added
-  if a node is created.
-
-
-Example:
-
-	pmic0: da9063@58 {
-		compatible = "dlg,da9063"
-		reg = <0x58>;
-		interrupt-parent = <&gpio6>;
-		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
-		interrupt-controller;
-
-		rtc {
-			compatible = "dlg,da9063-rtc";
-		};
-
-		wdt {
-			compatible = "dlg,da9063-watchdog";
-		};
-
-		onkey {
-			compatible = "dlg,da9063-onkey";
-			dlg,disable-key-power;
-		};
-
-		regulators {
-			DA9063_BCORE1: bcore1 {
-				regulator-name = "BCORE1";
-				regulator-min-microvolt = <300000>;
-				regulator-max-microvolt = <1570000>;
-				regulator-min-microamp = <500000>;
-				regulator-max-microamp = <2000000>;
-				regulator-boot-on;
-			};
-			DA9063_LDO11: ldo11 {
-				regulator-name = "LDO_11";
-				regulator-min-microvolt = <900000>;
-				regulator-max-microvolt = <3600000>;
-				regulator-boot-on;
-			};
-		};
-	};
-
diff --git a/Documentation/devicetree/bindings/mfd/da9063.yaml b/Documentation/devicetree/bindings/mfd/da9063.yaml
new file mode 100644
index 000000000000..376880061f42
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/da9063.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/da9063.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dialog DA9063/DA9063L Power Management Integrated Circuit (PMIC)
+
+maintainers:
+  - Steve Twiss <stwiss.opensource@diasemi.com>
+
+description: |
+  For device-tree bindings of other sub-modules refer to the binding documents
+  under the respective sub-system directories.
+
+properties:
+  compatible:
+    enum:
+      - dlg,da9063
+      - dlg,da9063l
+
+  reg:
+    description:
+      I2C device address.
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  watchdog:
+    type: object
+    $ref: ../watchdog/watchdog.yaml#
+    properties:
+      compatible:
+        const: dlg,da9063-watchdog
+
+  rtc:
+    type: object
+    $ref: ../rtc/rtc.yaml#
+    properties:
+      compatible:
+        const: dlg,da9063-rtc
+
+  onkey:
+    type: object
+    $ref: ../input/input.yaml#
+    properties:
+      compatible:
+        const: dlg,da9063-onkey
+
+      dlg,disable-key-power:
+        type: boolean
+        description: |
+          Disable power-down using a long key-press.
+          If this entry does not exist then by default the key-press triggered
+          power down is enabled and the OnKey will support both KEY_POWER and
+          KEY_SLEEP.
+
+  regulators:
+    type: object
+    patternProperties:
+      "^(ldo[1-11]|bcore[1-2]|bpro|bmem|bio|bperi)$":
+        $ref: ../regulator/regulator.yaml
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      pmic@58 {
+        compatible = "dlg,da9063";
+        reg = <0x58>;
+        #interrupt-cells = <2>;
+        interrupt-parent = <&gpio6>;
+        interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+        interrupt-controller;
+
+        rtc {
+          compatible = "dlg,da9063-rtc";
+        };
+
+        watchdog {
+          compatible = "dlg,da9063-watchdog";
+        };
+
+        onkey {
+          compatible = "dlg,da9063-onkey";
+          dlg,disable-key-power;
+        };
+
+        regulators {
+          regulator-bcore1 {
+            regulator-name = "BCORE1";
+            regulator-min-microvolt = <300000>;
+            regulator-max-microvolt = <1570000>;
+            regulator-min-microamp = <500000>;
+            regulator-max-microamp = <2000000>;
+            regulator-boot-on;
+          };
+          regulator-ldo11 {
+            regulator-name = "LDO_11";
+            regulator-min-microvolt = <900000>;
+            regulator-max-microvolt = <3600000>;
+            regulator-boot-on;
+          };
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 6aafa71806a3..00acb9078cc0 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -93,8 +93,6 @@ properties:
           - dh,dhcom-board
             # DA9053: flexible system level PMIC with multicore support
           - dlg,da9053
-            # DA9063: system PMIC for quad-core application processors
-          - dlg,da9063
             # DMARD05: 3-axis I2C Accelerometer
           - domintech,dmard05
             # DMARD06: 3-axis I2C Accelerometer
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
