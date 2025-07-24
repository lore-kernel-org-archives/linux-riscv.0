Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16637C87FCC
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 20:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Er0lzIwP9jiFnOuJGMxhhYxUTs9vEBOv1EHRR+REn4E=; b=Wy54CTWxLUUSKG
	ihJOLjp0nNnmP/2wTpFiuudmUoOI/JUFQvrt6GhJH4O62D68Eke/oHjf/yjLDWGt9D5IN3k2MGfOp
	R/BHSCO6apV8GLUfd9DQ+R7euk/0WiGDMTO0DoYz/4vuWYExPcHE1XqBlPIDOdgawBSVbvm8JSW8P
	xGwa3Wzn/QzszofrNS+Ng/PDFIGd4aHoT/naUD2vy1xutr+tR2EdfK7Rs1Jlc8Jv1RSTNVUSA41sc
	FFBWyVS92IPxYS5wDoy8A3S5E8+b0lV2/tItOk/IviScoXzdU/KkXbZkL2+I81onw53nwA+cqtBta
	xJXloOydcUbjWBiiE3tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf2VG-00000008Ns3-0zCO;
	Thu, 24 Jul 2025 20:25:22 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf2VC-00000008NqJ-2g7G
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 20:25:20 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-86cdb330b48so80601939f.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Jul 2025 13:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753388717; x=1753993517; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+iG+v28WWuHGvV9OeNkoKxEvvahkCo7ownJvbOD1hUw=;
        b=XOY7J72glIarZ8W1MjZmHdvyiHIdKgDrT7Dz8cJiKjOCldP+AFSjfIVhLSqDKbRJmA
         2lI7n1FfSvpH8+BxcD7EpTDbWfZuOb0eDJZ0wgWlywn4nC5GNJYCafJZK7U4RMA0Z6AS
         V7MoouUpcvQ3KGOafGLlPc0FgPJ78z5E07PeEpwzBxyncqAEKsQMzf5If/huHugDjOuF
         Czfs4sH0WeO/XXvdgQzy6fo+bPJn0OTZJPnJyBqJbPZN5PwLRJMwAfm0ZbgSRgLzqUyJ
         knlbZV+fd5GMOZR5I5N9VUD8cZ6GgH5/MdgiNrjQcxi0siYrGRftDjhKwiH6d4YnRToL
         57rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753388717; x=1753993517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+iG+v28WWuHGvV9OeNkoKxEvvahkCo7ownJvbOD1hUw=;
        b=aa97DWdb3bHkCCa58u8IXeJTKl+izT2bMP5u+h3cf6DyYrk7u0znu8sIbOVmZONt+c
         sxizbW352qHdMOPBuUR8aZak/abw6s5Rerms8DJ6NX56f9at8bwTFh44C4Pw3fKkH9hy
         w1OI+hZVfS/3y2dzCD0xoMMgzrDCpbHzcQL4bTeXsoYfNRxxuabm8UESYib+jrDaR7AW
         C39o733mow5PVAeRzO8ThAmklI3y9SSFTakrKhuXhYZmbebYY0P8KmHzgvYVGf0vYepr
         /EKPwlql8/eXsP//Jc+d5YXA+gQwZtWL59+ZtJD6Oc8BqBLhb69xwaapKM+IRzPNanDO
         ZZtw==
X-Forwarded-Encrypted: i=1; AJvYcCXVlUsTRAQeqObFW++hA1JSKnKVcvZ4OUiUkRuAtc/N5J2QGoabpaT8hCNbw6RKGaDDoKnhqg/fdklRmA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNRinxwkj2d5/TCBlW0OE/vWr0fnIRf7I/0hkHRfoMJzICVHo/
	Sqztu0PHmvDtM6K9Afv1EtYx9ToXsd1TFdiG5xilqBSdaE92+op0IswtBAEMzSYRTMo=
X-Gm-Gg: ASbGnct81jwh+ErUZiFZKtO37Er0L/LA6+5x90OLLCvJnT3Ikjo+cIv4NyFiQQrix1N
	0WQGNs0jH+s7uy4SNuxNpx9AAAnsDZLI5Q7SgW1W48FreMI5YnkExLcPMY66qlBgUyuzi2QXQRU
	x0pHh+kL6P+wmire73JRzl7XNJ5+EVQCZwd/v2BmNPpFcwy0CLemF84/CBwCLn0IAHnP1AWl8nN
	pZ/WXu1IDaCxZXVS2F2CajdV5r1rqKkSc4ql7cZynsOFPP415zA22ZlC9b3Gp+wJ+gsxpWDhQVr
	hq5hOoaiLB4oAF9rOaj2LBCuFi/Na6jK+eTtpA2+xONJnF+3V9lnStFnBgXj9T9E7SUWZ54/Cbi
	dJkN80dIhkFHs/LlTiOAB2dYBF5zGh0hyUQjCfmEdSShsowDn8Pk=
X-Google-Smtp-Source: AGHT+IF3MGunKrhFL7OMCRuAamAqvXPpD1zcQkVbRcO7EjbuhOz10E5IrYVw1aiHLFsX1ofJu4g53A==
X-Received: by 2002:a05:6602:2cd5:b0:87c:31ad:abe2 with SMTP id ca18e2360f4ac-87c64faa2c6mr1456048539f.5.1753388717180;
        Thu, 24 Jul 2025 13:25:17 -0700 (PDT)
Received: from zoltan.localdomain ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-87c74316a3bsm63080239f.23.2025.07.24.13.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 13:25:16 -0700 (PDT)
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
Subject: [PATCH v9 1/8] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Thu, 24 Jul 2025 15:25:02 -0500
Message-ID: <20250724202511.499288-2-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724202511.499288-1-elder@riscstar.com>
References: <20250724202511.499288-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_132518_675581_881A2B11 
X-CRM114-Status: GOOD (  12.26  )
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
