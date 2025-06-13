Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1541FC71155
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 21:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aM2bs8NRgPpfBksjP49YCnbBWiagFhaGXdsrb24/yMI=; b=2gWFcqYt+ye98d
	4u/ClLNZbaJf0GJZ0haE5SmpFHUlOpBNtSA0fzGVJVvSYahs+9r7mVvXqpHJzqu7bbFsqDdpf63Cw
	NSyNUuIa0OS2jtcPMWrvD2ww+DVNrbVrEcQ+R1KjyR5ysIl3LpDu32q1biY5WJvh2CRvZO9vjgTvv
	EggumP6SnNIvpJtjjJ8yyWUUcxUXqxspNEaJVhrSf80Kikc+aJxVpf/0os0RZKmlac+ul12dwdNVx
	Ou8Op8t8rarrYKEMWr9mnXGzafFSDsZMfsei1SvK2Xs514OUbGrq6H/Bcx9GbFoMIB5P1zMT2yGgF
	BYC3RQX10PXAJ2M1XQHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBa9-000000003vT-49B1;
	Fri, 13 Jun 2025 21:05:01 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBXB-000000003Iy-02pm
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 21:01:58 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3ddd2710d14so20585525ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 13 Jun 2025 14:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749848516; x=1750453316; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+0/C0PNGm7MxpNKW6kFIim9vzj9ziDhSWBIAnwFt1E=;
        b=rEExfVoaVfja9Zrb3cnzJX/c92AZuCnYfqVeZeMF8ntUEVXChi5GFp+apGWWv32weq
         SgEDmtrza//otagS9v8vFuaBZ6IS1/JQgH0dZS/aCq32Xp66Gqm8ixcrr6SHL1Kg9jrT
         ZCQHt/qRWmLju7h+5yjBD4KJCsfOtkrFcrMco7GKUjxPh99NlhyXsE2xWw08APKX+/+N
         vC6ECdaDsCaQrGxpHrY22kQN2EEEkwOfdvsrX3ShQu1XXjvpTv5GoAjTIph2z+elxJnx
         Br69Vc/pW8lBTMfovYfK5pgi0MUzkj6mKbP2JeDOgz1Yi2rREjQSA4Cm1YVqkGhZ1A8t
         +p9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848516; x=1750453316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+0/C0PNGm7MxpNKW6kFIim9vzj9ziDhSWBIAnwFt1E=;
        b=R8sQZK+84rB120YFWgbTI4BrHKCm45jEqv+oUR8pyQk9eOFLM/lsNwhOpT/SoC9y9x
         3ZmPY6t0bOntQMXzysK4ZU5gfHW7mUs8ckLryniU96NJzl6wK4ZcCK+UdQ+oO/noo3e3
         J3lweF8oNNqQNnqKtJ4nythKlaJg+asU5ryNGy8HKgv5QWJYMjIkbUtxCEAUmuxzF4eo
         kQDsG//vO0TwppK9MbnNFsJ7l5Dqvv5Ju2+QmG4/pt4qTtl40sRJcT10STWBN8R6ogy0
         EQeh1UifOfXGRLOXSXRzp9l1stF+HN5GIbChwkpKGBMFyDTkIacVSAX+Vm7PwRTKKOIi
         3ETQ==
X-Forwarded-Encrypted: i=1; AJvYcCWezDdWE/FW9/w/eHtB+7sBL7AChJsJ9m8vbDDvAhsyaEQ5weaWLpl9ZqMNRdsGgHY7all065aJeaSZpw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw060WEiqVq696BEFD1jbf1b1ZEvjab9pE3d03YwcbnheV+cPqY
	JJdK+fpSZiForylAZTUOvrOeefP40Xwbvqksm8/hHGDqXBybfJqKjIXVrWxP3Uti21U=
X-Gm-Gg: ASbGncvAaa2aT7kOV2QbaGhxfe2RGHDKi554xMfC1wfjP4d/SIMhchDeKo2ZBPCmliD
	fDU0+vvo8+Uc1Sf0/h58PSaEeJTq85WakHkwW7aBP9IlLwj+W3FwW7uV/gyQOcAzLoZ2zZYsqKN
	oHmh9oNBy/fsQ3kTmf5pDiOZMDKHJ2cAiLVKLHLLMO/OX52Bn9eQ2HRNrQ0Qcz5zUnwFtvgS8GV
	dHUKauHSVceNTrx8kgLsDrQX4L0sS4Wmu2EbUH93ZMHC+VhGtWd4FB4EIZZCyD6ZfEE8qnmwxJq
	CfBevbjvRd9PtGG13wFpxMTp4GLUqu+1N6CxtzS/skKN3bfjPtwLvGxt+HctAZjzRBKGvCzkpgR
	VPgHjd3pF91P8iehujYcinCWqhrxY6o8SoBsEyZYPgg==
X-Google-Smtp-Source: AGHT+IEAOZ4barh42QKEXjGCUuoE1CDyPc/l1EZnesaJ69ndQkqwdIOJcioQ8OP3PoKFNIqk9kUDPg==
X-Received: by 2002:a05:6e02:184b:b0:3dc:76c6:436f with SMTP id e9e14a558f8ab-3de07d018b2mr17478295ab.21.1749848516110;
        Fri, 13 Jun 2025 14:01:56 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019b44b3sm4996315ab.10.2025.06.13.14.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 14:01:55 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: mfd: add support the SpacmiT P1 PMIC
Date: Fri, 13 Jun 2025 16:01:44 -0500
Message-ID: <20250613210150.1468845-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250613210150.1468845-1-elder@riscstar.com>
References: <20250613210150.1468845-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_140157_048180_317928E7 
X-CRM114-Status: GOOD (  11.65  )
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

Enable the SpacemiT P1, which is an I2C-controlled PMIC.  Initially we
only the regulators will be supported.

Signed-off-by: Alex Elder <elder@riscstar.com>
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
