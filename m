Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B48DC624A4
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 13:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GKvdrIyoHL1o+o1spz4wlE2hcg8NkLlSzlHxEnlKIlc=; b=RcJ4BO6FDgnTzG
	pvPOu/r7mVxrYKYi8YCatajsVSQbtWyeZ4VT0d/uInIlczvC1FkkiKz8JA0BZdFBORu9K5Ux23KKc
	aVorhC+KiG+foViGCTCTnoipJQv+Iun2rzbuI3y6aRfPk1KNKOW4HKuRzKEIKcmWapQ1fQ8JmQznR
	OhdPHAAnUfjNQ8l1nQ5asXP3JP7vbbX25iiwjB0oq0KqbZF4CnCLtZ0dFhhcru/Fav1TQY3Rg7hTU
	Lm3OExClZ10kzFKPGeY+7Eh8CJkTO5br2kBHBNTxAXWexwMQNGoxUXqNRQUMT2KRksCKwBErDMz3j
	DaBHDEjw1cTTWUEUNk1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12LI-00000009VnN-1Yz8;
	Mon, 31 Aug 2026 13:46:32 +0000
Received: from out-59.mta1.migadu.com ([2001:41d0:203:375::3b] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12LC-00000009Vgb-445q
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 13:46:29 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=iGW14hm5r7h49Vg5wNZLdnJWa4OHQc1zf3eCSZ9Fyzg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788183984; v=1; x=1788788784;
 b=UmtmO1uXEsLDfe0nhNJNU9MDd4P7PNxKVLP/On3aIkeAJZ9qa3/kIewofagpDWa1jfpZDTZS
 037E4q/P/5IoonUx0C/zLH19fTugMV6qwd6iuzlvzU4Iare/13uJ0BJwOVWX5in93GeKMAdvuVv
 gOMurFgrNNlrZP1jJxXnSULw=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id 1fa78ac9957080c4;
	Mon, 31 Aug 2026 13:46:24 +0000
X-Mizu-Trace-ID: 1fa78ac9957080c4
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Mon, 31 Aug 2026 21:45:36 +0800
Subject: [PATCH v4 2/6] dt-bindings: hwmon: Move LM63 family to a dedicated
 binding
MIME-Version: 1.0
Message-Id: <20260831-ctl2301-v4-2-b335d52a0570@linux.dev>
References: <20260831-ctl2301-v4-0-b335d52a0570@linux.dev>
In-Reply-To: <20260831-ctl2301-v4-0-b335d52a0570@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-doc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3138;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=iGW14hm5r7h49Vg5wNZLdnJWa4OHQc1zf3eCSZ9Fyzg=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlTW2cZPtvfmr6FYcmbZM7gFpG54a3s/42tL3zjXZlY9
 97vzf83HaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABPZNJGR4eGHaZZ7JE5az1qm
 U3N64k6W6z5aWslmc1yXrVwkHtOR7s3wv/Yp7/Orpz9+b9V6VK93eN1E+xbnpz7xqvb6+RtK0w8
 o8AEA
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_064627_159660_0BB30972 
X-CRM114-Status: GOOD (  11.68  )
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

Move the National Semiconductor LM63, LM64, and LM96163 compatibles out
of trivial-devices.yaml and into a dedicated binding. Describe their
integrated fan control and preserve the optional interrupt used by the
ALERT output. Permit use as thermal cooling devices via #cooling-cells.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 .../devicetree/bindings/hwmon/national,lm63.yaml   | 53 ++++++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml       |  6 ---
 2 files changed, 53 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm63.yaml b/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
new file mode 100644
index 000000000000..f2e0993cfbef
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/national,lm63.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/national,lm63.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LM63-compatible temperature sensors with integrated fan control
+
+maintainers:
+  - Guenter Roeck <linux@roeck-us.net>
+
+description: |
+  The LM63 family provides local and remote temperature monitoring together
+  with fan speed monitoring and PWM fan control. Supported devices include
+  the National Semiconductor LM63, LM64 and LM96163.
+
+allOf:
+  - $ref: hwmon-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - national,lm63
+      - national,lm64
+      - national,lm96163
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#cooling-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        temperature-sensor@4c {
+            compatible = "national,lm63";
+            reg = <0x4c>;
+            #cooling-cells = <2>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2de8eb09cb7d..e46912ba2fd6 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -368,16 +368,10 @@ properties:
           - mps,mpq82d00
             # Murata D1U74T-W power supply unit
           - murata,d1u74t
-            # Temperature sensor with integrated fan control
-          - national,lm63
-            # Temperature sensor with integrated fan control
-          - national,lm64
             # Temperature sensor
           - national,lm95235
             # Temperature sensor
           - national,lm95245
-            # Temperature sensor with integrated fan control
-          - national,lm96163
             # Serial Interface ACPI-Compatible Microprocessor System Hardware Monitor
           - national,lm80
             # Serial Interface ACPI-Compatible Microprocessor System Hardware Monitor

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
