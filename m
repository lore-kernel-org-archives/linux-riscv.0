Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84F0C87FD2
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Aug 2025 02:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5JMNu/9LrOcPf2BsA+WuICkx97wZHeN9nOyQqbxpFbA=; b=FU02iXE6Mp4Dx1
	2k5v0JQP1cstgtDy/fCp+iQS60vOKU0vHVMv/pVO0Sq4lW9mOVJQ6sQuCUjC/iYQWGgRoXWN2vOFs
	Qb4+VVPJimUVLUEupFn0azDlPOwrwR0sa5n+RZz/c30dfh7p4Q5XuQzrPrW+15MZvV7PVLAtnswpx
	eiZriW0cdZ7XwtTip0U1gvTWtK1+8EHqhBYMj+JAZsuxOyyJjpz6YlHiGDh6yFnComy8XGvg7iWiu
	Xg7FdMKgqOfNTdAQ6TAxywcNE+JmpGpXG2d2ky2ArZIIdR+mV5zPgze+DhdWj4rA/NxX4Xhnv7hct
	8a0kPpmq5a2Ss6uSnPRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiOvU-000000085RO-3GlG;
	Sun, 03 Aug 2025 02:58:20 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiOvS-000000085QW-3xTy
	for linux-riscv@lists.infradead.org;
	Sun, 03 Aug 2025 02:58:20 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3e3fcf5b150so24715035ab.1
        for <linux-riscv@lists.infradead.org>; Sat, 02 Aug 2025 19:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1754189898; x=1754794698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ek2s2DUqL/jgDZvOvv6Rjx1Dp3m/erc1mrYIyBeINSk=;
        b=jtw8DtXn5j0HqE6BCDF944OemFlN60vAY9EwHZm8Ch34wydKANpdsIjwoo01aVeuUc
         S2Y9nf/Kmuyhk8JkqK+j6ku7Hofg5UtTxNTTlySN6bF6VC9T0NfSfMTn8X0MDbvGyLOQ
         3toV7Cdw70px+ORu7jm2orDcKJ6mkuvYef9WzIvW265xQoqDGhnJ7WTy6vkVRU7JByT0
         DSmRhLFRf7Iwz7AKvzEgkWAbj2OeqhZAGMjXiy2iGzSaS4VjKfR4pFGyZ74Rt2wNxz1p
         MKxDkJMnepWvWSPkFBcP5+ZmI55JQOQMZ2ojfItxXO/3oo0GbmsIq6/drKHWPhc750/w
         h/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754189898; x=1754794698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ek2s2DUqL/jgDZvOvv6Rjx1Dp3m/erc1mrYIyBeINSk=;
        b=sVZ4ApZylMcw5UIgfPrE3OdtGLmDsi9lOwifv1E8GOQex3KeiQvG8+QAV+VVpBwIv0
         RXZEEaqAppTbRMHtndQ0TosJL3A3FrOiIqNpQ1kK5hFPsxEqQ/kp5KIJiSZ2IV62yBIE
         2qhP+behM7XDO2wkLIlxFreHGEan71KhX2k+zsYuOBkj6lT/Tq2IU/NStiGc6eYrPg7p
         LhqaBLCqQx+WRjjHYJIEMH7wZPPwMmIXHcanX2zDc8LpW7mFzVwSVen5xllebH/uLc2X
         /3WD41jiFz/dz2Nl4G0bG1KEcnOti7fwtASnHdfwYXZQm50PAwqdpHS7JdDQDjjAg9PZ
         WihQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeYtcQ5JcuYml56XoD+EhEPxEEFAa1MK6I9HyJp1SGxaQ2CzpxrDBofOAeDr3oCKKlwpm5TazZWXr7Rg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNv5kA4etNYfle4VmAPOgHcfeosEr1DfOFRPVVYDzuDPYztaZ+
	XE9t90/1q8sjJH+dU35YgEiu60IxWGqcdBVO6FwbOmwPpJ5P5zJP7q4tq1b6ngP6nBw=
X-Gm-Gg: ASbGncvPckbx6RBo7Hiqcfi0HLloluqnqu7FMZABDQaKKvXnIh5cNH6XAU5fK2TQr4m
	AbMNtjm0LVeh1DIkKgBGH4hd9cVDkhwkg4mNcVFPiDsIkBP9NYo+RFL2QKmGQj8agZVyG97f5cj
	12uGlZg2gH3/ZhEpMO0EN2qjVM6hTOKxGU6z1OUo8i5X6Z4WgN5ocFZQ+aIrKkjX4VaDEKxXGQs
	1r1ma81bE0HGJEVFs/bx0agGiK/8/8IxX4v/b33N6ZbKzRoHRDycjKPUw0tB1byhnPjSOcBnHMm
	kGoWrUbn5TR8BKq8e/4YUmb/PI5FINoj4NV1NdG9wZ91fILpF7UB5ryvFQk+oiXc0ysI9V/cJpg
	nDJwwFAKlaeMPqJXaKnhnE8A1bAE/by1AWml14SMtp8nfC00lxc28lMB7TfpTwfp2ow==
X-Google-Smtp-Source: AGHT+IE1EI0ik3qR8R9p6oS+/rMP5rmrF5tbzg4vFpoKSdksN0WY5toRor+4wX4VhlAJ+LsTRTCKSg==
X-Received: by 2002:a05:6e02:1485:b0:3e3:c6a6:2799 with SMTP id e9e14a558f8ab-3e4161e006dmr100052085ab.21.1754189897967;
        Sat, 02 Aug 2025 19:58:17 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50a55b1ac2esm2251906173.1.2025.08.02.19.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 19:58:17 -0700 (PDT)
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
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 1/7] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Sat,  2 Aug 2025 21:58:05 -0500
Message-ID: <20250803025812.373029-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250803025812.373029-1-elder@riscstar.com>
References: <20250803025812.373029-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_195818_984956_B6486738 
X-CRM114-Status: GOOD (  12.64  )
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
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
