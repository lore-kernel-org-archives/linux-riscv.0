Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1306BC47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 07:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2mRcNXc9vVT3ktc2WThkGfcxPmCEAhz2eNFgLl6q8Kk=; b=SHx0lsUgeY1EYk
	cXV8htUIQ5hiGlmouRDeNMbfl/LX+npDXz8aDw8e441JYmCXCyKTKO4Rp0UN59WJQdHCyO9Z342IG
	r/lI0M73RWmBu6bsNSqumbNmgXOshgmucPnJ8o7xXQ0aEi4OfmiAXaB0owTrtbMe1uhtd4sh2WfLH
	bZbivEOV+Zz8dEU2Lng2eU8LzwZUUzMIn1yzb0KBBFDiN4Hdq7sBgYK0vbz8kAAY8s32Mr1DCEQaQ
	1aJ1G4VxaLzcnV3hx0LIrFtT1Gi0EZQ1GXYMIHnAuIP5ljFsOQT6/AJUA8NPZ37FXlaKInwp5C3d2
	pTPZ18ttz7J8YdbdIdeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSu3O-0070YI-0j;
	Thu, 25 Jan 2024 07:21:38 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSu3H-0070Su-0X;
	Thu, 25 Jan 2024 07:21:32 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50e5a9bcec9so7133050e87.3;
        Wed, 24 Jan 2024 23:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706167289; x=1706772089; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAfvNX5JYKiOP5F5+HHWWQpkc2VYumz0VDstxq+2dC0=;
        b=TA4Wj0V6cRWDLYakSO2s1vTyKCTTiJzmC5bltu8xrN7cSrlgGY4/SmN+M80rL0JWMl
         tl14mPw51xJUJCIyJvXheMmPzmpma1v4J0e1K3HD2QpiUpIxMI28xvHceNHUt2l5PRK4
         UNvx3rqli1p7JTTDeCsvRAL1hUT6HTFBhcshDBpwZky0iimboPVB2i2hpMifeTb/vCNf
         OAKu3Bf2WD2SZzYd5ik+CUfI8tMB7dvmCeGJl0x1d8fH8fbkPWFccC2Gq9b19oF8xrzE
         X72S41dwStxPdmwdgzNe5sDuSHUGMjzSd/18jFYhOUMYkbNNFgD+j+jI/VhfRD3buHKC
         e31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706167289; x=1706772089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAfvNX5JYKiOP5F5+HHWWQpkc2VYumz0VDstxq+2dC0=;
        b=swGTEU+++YTFVvI2JDfB/smDliD3+xkyqvTocBu9P6+k1aVaYDpl3vAkxZYhk5wjj8
         fcTbxE9Dms7hpkXLZKMFsWokPg5DeqVnCCezXLfJG9n6j9lPKJ+qj5e97SFwqlS7RICe
         jgNjMv7FyHcMBEjcT2LHZ4u5sDPd3m6TDHB7ztBJKUl1lVQsPyQ9+ackLaUb9oKK6+zQ
         l/mReFMRUyokDEnOO5Iz9fx+n6fnUZiFya4lllmrYOye8c7+l4LtHeUX0IBws3frxTXr
         H6Fi2/4G2G2aufwbdELlC32469VFh8WO0IgXjjii5QIX4W0AViA1VffXCgV6ezVkYDix
         KSQw==
X-Gm-Message-State: AOJu0Yx3suJYN0ypjxmo3BH6yIrvKm4hmoHU5ja9QU0Cjh0YneUtBf7U
	HZyQppVuCHFwsKlvjFQ/ljBEbiiWn5lsnkihdg1ikRHDEDJu1HE=
X-Google-Smtp-Source: AGHT+IGEBYUmxHJtch22BJcHUV9zaSCJgnW591EyE6opmjzI2vj54jynZNtiCKHzPon2ds0YHSyrkQ==
X-Received: by 2002:a05:6512:b8f:b0:510:1620:939b with SMTP id b15-20020a0565120b8f00b005101620939bmr339126lfv.0.1706167288935;
        Wed, 24 Jan 2024 23:21:28 -0800 (PST)
Received: from localhost.localdomain ([188.162.200.139])
        by smtp.gmail.com with ESMTPSA id x37-20020a056512132500b0050e75f9e8c8sm2780070lfu.98.2024.01.24.23.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 23:21:28 -0800 (PST)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/3] dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM controller
Date: Thu, 25 Jan 2024 10:19:41 +0300
Message-Id: <20240125072032.1151383-2-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240125072032.1151383-1-privatesub2@gmail.com>
References: <20240125072032.1151383-1-privatesub2@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_232131_207526_ECAFF5CB 
X-CRM114-Status: GOOD (  15.40  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, John Watts <contact@jookia.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Aleksandr Shubin <privatesub2@gmail.com>, Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, linux-arm-kernel@lists.infradead.org, Cheo Fusi <fusibrandon13@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Allwinner's D1, T113-S3 and R329 SoCs have a new pwm
controller witch is different from the previous pwm-sun4i.

The D1 and T113 are identical in terms of peripherals,
they differ only in the architecture of the CPU core, and
even share the majority of their DT. Because of that,
using the same compatible makes sense.
The R329 is a different SoC though, and should have
a different compatible string added, especially as there
is a difference in the number of channels.

D1 and T113s SoCs have one PWM controller with 8 channels.
R329 SoC has two PWM controllers in both power domains, one of
them has 9 channels (CPUX one) and the other has 6 (CPUS one).

Add a device tree binding for them.

Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
new file mode 100644
index 000000000000..716f75776006
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/allwinner,sun20i-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner D1, T113-S3 and R329 PWM
+
+maintainers:
+  - Aleksandr Shubin <privatesub2@gmail.com>
+  - Brandon Cheo Fusi <fusibrandon13@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: allwinner,sun20i-d1-pwm
+      - items:
+          - const: allwinner,sun20i-r329-pwm
+          - const: allwinner,sun20i-d1-pwm
+
+  reg:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+  clocks:
+    items:
+      - description: Bus clock
+      - description: 24 MHz oscillator
+      - description: APB0 clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: hosc
+      - const: apb0
+
+  resets:
+    maxItems: 1
+
+  allwinner,pwm-channels:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The number of PWM channels configured for this instance
+    enum: [6, 9]
+
+allOf:
+  - $ref: pwm.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun20i-r329-pwm
+
+    then:
+      required:
+        - allwinner,pwm-channels
+
+    else:
+      properties:
+        allwinner,pwm-channels: false
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#pwm-cells"
+  - clocks
+  - clock-names
+  - resets
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun20i-d1-ccu.h>
+    #include <dt-bindings/reset/sun20i-d1-ccu.h>
+
+    pwm: pwm@2000c00 {
+      compatible = "allwinner,sun20i-d1-pwm";
+      reg = <0x02000c00 0x400>;
+      clocks = <&ccu CLK_BUS_PWM>, <&dcxo>, <&ccu CLK_APB0>;
+      clock-names = "bus", "hosc", "apb0";
+      resets = <&ccu RST_BUS_PWM>;
+      #pwm-cells = <0x3>;
+    };
+
+...
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
