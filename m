Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DE3C83F09
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 21:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f1ZSY8uoA+FMFAXJeMPKcLlgCHvDOYhyaFOI5XRQr2s=; b=uGINRodOUMcl0j
	2Ekx+yO9nz9eiwennSQ5kexqcgZPHN4R3wTGdNmcwVmluOf6PIirdNu4ESW9NCPMXR0dfucH7P2O9
	BTAWh/UhFv6kMZDRUfjUxRJl/bt8Fa8WKsqVw4fzdca/MD1afWpx2z1ZL12XEHcggakYwpBZQUM8A
	VWICFqXjBy0FaQxhXjr7kTto8fO+llS3xMPul1u5Vzi6O6TV1yXy1FmmmjP9byo3vr/crVt7OKz9e
	c4FcAwBOcwrjU1k9AEhG4bWAoGgjcFW7FO0GwIFIWSpknFWjHnnsOLGd7rjZxDUhu7OQZh/I5tSZl
	E2UWUixBzR/n+Afxr4Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX58h-00000009bZ2-0qKk;
	Wed, 02 Jul 2025 21:37:11 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX58e-00000009bVz-0Hv1
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 21:37:09 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7d4495753a7so556390185a.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 14:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751492227; x=1752097027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNF7PY8BTTw3n4PxFimy6RpSwNTBoHWIsy6At478d2Q=;
        b=zq+dVTun+pAbej5r8/Qy4CnV29PJQgVc1zlJiuWhdFVAiHpo3nzGriFUhE1aJU0E+6
         c4+qmOkrQVqaHhRP4Vy49tHtyGax+EpWJLcGbTeryxhz81xZwpbRaNXJ6m7d5FWShPS4
         BalEQUdde837msAZctW5hEwt4RfqTBpIvYYywcvvInUx4fe3uydJtV3YA14XgUZ2XOqS
         BHUtDsYOHv8+A7XFf3JrK+v1OqBMZcyTOC6aPIkncs9AfaR3qQ5BEp+FE/8WB5zMAEyG
         H1TiWa6jpVBdZ1hA2jGc/7YFWH8Cne5BoP1p4YLHLtZW2LJPdtx4dubBUV02DSx0Y68X
         rJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751492227; x=1752097027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nNF7PY8BTTw3n4PxFimy6RpSwNTBoHWIsy6At478d2Q=;
        b=sE6PloimBwITEUvij7JktQEE/6cYOJhuez3KTX8FZAY0BYe0QWhK0oU3SaH6qisPpZ
         /c04Zqax8JikbkSO21izk1DCjDA/pvmpm4IywKsBpJ/AbQjfIgqsIU5TBZdTEyy/rQ0r
         lrgFi6FPgsPJpHBU/7S2FUdCOyXMgr5/VX7grzvTxB5f84X6uosRVMaMRtavovU7vwZs
         9aYODfnVoY0TtmmbXyzaLiqGCXzuTOd7PJZVC0M68MkZlAdaM9Uv0F8Z9zxr9RPtwVdT
         7DNA4iSY/nWavZSIi/CpGNiIJOZUYSfcawUWgRK+BZuoFQiiGuCYY2aqRRgofT1AHJNH
         cM/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVwOBtIflkCtDA4SjbR51gcEQRiLeWw68arqAXUGRJMAAHx1vmxQAZQgAJ9r0aHeUc7SsqGMW+pcx3cw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb1yuc0WvI3EJDaIRv3xVNhH0ZdgHLe/W7Oy43923KETGMRTSp
	M7f7sWZlF+Tg4mT+BF0QjKPbh0vC8raECdgkoXYQztD4dVnHlbcgkmfwbgNJ0EvWFDo=
X-Gm-Gg: ASbGncuiiw+1HM39zbDfHj52mdeG5CP6ZJAR2tS4Kguup7Z+gvwf1fCitrhU89nsY1j
	+NNpAhT20VCXUfF6nEaKKzii8bf9Pc6RGhYH97jjNjDssK/NA5v3G9NHOBXOKhKI5F4l2A6DoOA
	uggbmxMyA99lcQTUG+eOBde3vz+Q3fHo9F0EAJvyS+vgXW2GQLf2k7mT63FdcTPt4EIlA032z3w
	Pd5MM/BrLpJOspiw6tC627wZZD2OJzS4PCnVnNr8ON1fN4N1SCGcI/uEWo3z8GpxO/Q/Acac3gs
	Ye+qFEVeLu5es3fucWJPcBSy0P+mtPtdlKDe/+C9iqX29il8NZXKeMjLt4owYHzg6ZI76P33t1C
	PzJBjg7gQkl/4vQJL2s26Bh+6e615x1cAFc4=
X-Google-Smtp-Source: AGHT+IERqJ3BfOxhUmxkupeyUkDeU0EnZdd1PTKHpA9KaSbcs4c73pcX0FmI8fCh3xwn7Djaw/yz5w==
X-Received: by 2002:a05:6214:1c0c:b0:6fa:b9e9:e799 with SMTP id 6a1803df08f44-702b1b37a43mr47892906d6.24.1751492225372;
        Wed, 02 Jul 2025 14:37:05 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771bc01bsm105691746d6.40.2025.07.02.14.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 14:37:05 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/8] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Wed,  2 Jul 2025 16:36:50 -0500
Message-ID: <20250702213658.545163-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702213658.545163-1-elder@riscstar.com>
References: <20250702213658.545163-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_143708_246436_154BD8AE 
X-CRM114-Status: GOOD (  12.73  )
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

Enable the SpacemiT P1, which is an I2C-controlled PMIC.  Initially
only the RTC and regulators will be supported.

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/mfd/spacemit,p1.yaml  | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml

diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
new file mode 100644
index 0000000000000..5cc34d4934b54
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/spacemit,p1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT P1 Power Management Integrated Circuit
+
+maintainers:
+  - Troy Mitchell <troymitchell988@gmail.com>
+
+description:
+  P1 is an I2C-controlled PMIC produced by SpacemiT.  It implements six
+  constant-on-time buck converters and twelve low-dropout regulators.
+  It also contains a load switch, watchdog timer, real-time clock, eight
+  12-bit ADC channels, and six GPIOs.  Additional details are available
+  in the "Power Stone/P1" section at the following link.
+    https://developer.spacemit.com/documentation
+
+properties:
+  compatible:
+    const: spacemit,p1
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vin-supply:
+    description: Input supply phandle.
+
+  regulators:
+    type: object
+
+    patternProperties:
+      "^(buck[1-6]|aldo[1-4]|dldo[1-7])$":
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@41 {
+            compatible = "spacemit,p1";
+            reg = <0x41>;
+            interrupts = <64>;
+
+            regulators {
+                buck1 {
+                    regulator-name = "buck1";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <3450000>;
+                    regulator-ramp-delay = <5000>;
+                    regulator-always-on;
+                };
+
+                aldo1 {
+                    regulator-name = "aldo1";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <3400000>;
+                    regulator-boot-on;
+                };
+
+                dldo1 {
+                    regulator-name = "dldo1";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <3400000>;
+                    regulator-boot-on;
+                };
+            };
+        };
+    };
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
