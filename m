Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C799BC83F21
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 19:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f1ZSY8uoA+FMFAXJeMPKcLlgCHvDOYhyaFOI5XRQr2s=; b=FKOhBaw7CVbY17
	3935fpRdUxeTfwUC9fZfcTLGVW7seisQeURk51QNg5iYBqQmtcTDhUm4sqwZRi3+k141WFMBKD+y4
	y/AAXn8pBF7oLsDqbHc4sF6KGxieeah9wkKlimDe7Ww2kncpje9p9fZHC3rPnu8/YXqIwfhzuaOki
	7YG/xILwMoFKwnQ1D+pP6+y6255/u8nTliAqHvrgb3aHUUB4nEH+tFhfBWkX1SwgDAZYx1pC889VX
	jzGo3oNxHxGoKgeHZ2gJuGiOA3S/R+4PkgNRUfF++QrlXmcKhiUrYiSpCb9hUCqyXTBKiTw/diF9e
	47QaphjJrZvAGfSeahYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxAN-0000000CqBf-25sa;
	Thu, 10 Jul 2025 19:42:47 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvQP-0000000CdM7-3GqT
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 17:51:15 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4a58ebece05so13619641cf.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Jul 2025 10:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752169873; x=1752774673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNF7PY8BTTw3n4PxFimy6RpSwNTBoHWIsy6At478d2Q=;
        b=gWC9mYBbmFdCHMYYB5E8TX/j+8ez0NQkaP647GHDpuuEiuivakRDbHWH+S3PFn0NpN
         SJSbYNh2Z0x3JT91MV6OhdGPQ9ahbb7Fa1qd/etPMTim3Qw1QKDZ8n5L8gN/TpNWiBho
         H4f21BYbb7cv3pPS5vqCLgwKlBqFJ9zqaAxzqHFVsmT2Gc7hnJWQk6q1/u6o6CO5U1zR
         WGzKQfn8vavG92ArbbrhGHE2cnDSRgf+JwZ77WPaDVlYTCJCK5Omg61+/WML2CtxUvLt
         DZZ+6ROX4J0en7elJiKZRaV4HE315sBtn6FuF60/zA24ueIJ0Gt9fSqkOPeAQ71u4mSz
         aDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169873; x=1752774673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nNF7PY8BTTw3n4PxFimy6RpSwNTBoHWIsy6At478d2Q=;
        b=pUnDRE84er/eo364k4QMkkyl7wkbQIu4SvNKmPlUtrBiJ8d6EvS3yrdHqL7Hal1K5w
         TKT2DhYz87/9L9N1AZRbb1tVCBtCA6OlJsp+pWkDvsMYpUIeFi5lbIhYBtYvs90SNpOy
         V70rt9IVMBThxJ3JUnGSXa7KN6awNf2nA3YTryxhM8A+aSkG6AxdKxUZJuuTMXvQSTV0
         k03eTnfyuzy27Fr7OlMaDoDU+2cwytJZ0gIYyIoCeLLlly8EEYpEgz0zhoWVFIkorTX+
         KbMhPiFn4Of8CskKfidMLQ0Cg7NvQomXYzFdcyQVXCjXBZrbh4aCNxhb9v2hRzw21fYl
         Ka2g==
X-Forwarded-Encrypted: i=1; AJvYcCWUdBt6VhfZRvm4amKfO18MsEZ/9jrcRqe8Os64uZRl8G+8mxVj9or9roadPrD5IeWjfpZwPGiAjtstEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzW0hrvlSx0Uppl+oXEgHEDqaMLPO878CYDe7ryoQp/aSQgNsZS
	fG5mvwU2QJXx0VowtpihqkbsjPVhUsbng2jfQX7HPBITc2KPoX8qtWJyJLBPajXSGuU=
X-Gm-Gg: ASbGnctPV+3GaOz6faruh109UUac8epBFcg18KqmEdOx8ddvZe2l9+b/TEFX2gEqiTq
	3Yit72Ly/kJxGnaJ4QVs/W0w6QI1bOIuqz/QLCsrY7MJZwMNkdnPiBAYxy6jFmNP15OU/ZX6vmk
	pXxW7SJ/zhzWl3t6N+jBF47B+qfgMu5URpGG8Ed9YUG1EzDg7DgsYtnUjuVd+KkTSeeaFOWvTCu
	enrxZgzLt0HSr82aF+jR+Eha9oi9Ls74rWXjhyzt9RXNmfMjqGOH4uG5hamr2gYdFNx3Rhjc8ys
	ulIj6h3hEdmACEp4wJZw9djpYwjsqcNyMTZ413ZVJdBvvELQZEGAcrTt6HwSWWhph17eM1Waa5S
	OsfIM1NHeq3H1YEGRV8YP4g/aWZbuyM/8SSE=
X-Google-Smtp-Source: AGHT+IE0cJRHVoq9k9LOPhhDX5Qx0jjf0lgcMuAEVcjuN5h/JF5bteKTincAlkOQmKWP6gWojXJAQw==
X-Received: by 2002:a05:622a:4acb:b0:4a8:1a88:7208 with SMTP id d75a77b69052e-4a9fb9a670amr4227831cf.48.1752169872379;
        Thu, 10 Jul 2025 10:51:12 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee300sm11165941cf.73.2025.07.10.10.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:51:12 -0700 (PDT)
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
Subject: [PATCH v8 1/8] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Thu, 10 Jul 2025 12:50:59 -0500
Message-ID: <20250710175107.1280221-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250710175107.1280221-1-elder@riscstar.com>
References: <20250710175107.1280221-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_105113_818705_2F5314AB 
X-CRM114-Status: GOOD (  12.82  )
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
