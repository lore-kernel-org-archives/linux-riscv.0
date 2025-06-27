Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E72CC7EE32
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 14:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=He5yIO8ETs3bXqXAZ06y1Lm0dzrd6WfK/hNCNqmIVpU=; b=aANohn5Wk/IBt3
	XtrQ5VwlCBKDhK6GLz9eqiElpqA9Tw7D3SdHeW7BkUYXglPnVGiyxRPOa4oY4y4zdhotFKy/Srjm1
	7r6khxNTIldMGzdjeJl5CPoRh5fz68wQ+lo3NzsK54Kaq4w3DERY4WB/DLHKqNgXPDGEVSw4ZigA+
	8GrGz5NmC1AC+HqF4ibsk84Lx6SOJa4so6W/GtpPgOyvzVCFhbVqBkWzGcj/VxK8by9Uqe+P/SFPR
	xQifypovRQZovzNS1Na5lAvl1tXMbGdGFwIcx/cXCv9o9RpXxKU39tCvZYuCl6nGHOcJM9Q5a/bK7
	IqCiLeaHCNOB28c6Yu1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAWG-0000000Eydo-0BEj;
	Fri, 27 Jun 2025 14:57:36 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9z0-0000000Etw1-3lLt
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 14:23:16 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7d0976776dcso236649985a.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jun 2025 07:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751034194; x=1751638994; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riR2NvFzHSo1w0g4tV+4jS0ZXA7bNFeHnroyUa7Novo=;
        b=vUuGxZ3ZssEeZdTkfjGI26UpbqDo970h8TZyu1/PNbJchDC2awLmf3uawJIimHR7Lz
         YeVYOsE/w39FK4Tm2FvlCFk8TEJujkHmyOEGVYfyjExNkRKBxneWclzyTBPwhfsuKwfG
         HvDys3r5Twbyz5tTorMClysBX03DZLjshAQqZwcML+tpflETTHhAsLWYbmaxdQ9sKp0Z
         34ZfID8XM/ixkyX0NrVCjxYdAQYom+AkL8MEk/97TVmHWs0rKKEt/Z8u/nRQbpwkmcqJ
         UnBt3pA7y3zVXw8wZUIsQRhcwO8cwVhlOSiXI1ZTccGTP5kvxMrrjxXMBhKXkbIg2MSG
         1z4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034194; x=1751638994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=riR2NvFzHSo1w0g4tV+4jS0ZXA7bNFeHnroyUa7Novo=;
        b=t2cI9nGXaLnqxlLhv+g3ZZryvEO4D0afMkExnO0h5j8UiYz4H4vKTnnimAZ1Ok0lmB
         E92vIQ9D/HUAwN+yYOIctpFD9Ve7IsRblOyh6+ZmbK/Y9zdfqrI9EKEjR5nogigrsqpe
         ViLmK1Nvy+aZY29R+x/f0PVuJNV/z4MCiCvAowdrwW2Nmb2AifFJIuSRiA6q8imxvHp/
         BDsQoskaQPpM43L/fTtqDJ4Ois0HM8cpT0I4Y8k9tecjQ51R8GkCqZZWvdDsrjFjQh74
         kanWPcG8vK+L8bcVRK0CGfzcPuLqJLHSN3qWtFndhoxcNUOlZ3WoH6o0TG5GjWXstI68
         t3sA==
X-Forwarded-Encrypted: i=1; AJvYcCW7I/Ll527UihAi2zH57FKJKz4CSLznbuH25Uwqfx9WzPl+gVDSXhmB/CjByby25c9vdc/9qv8RPLwTXw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3mj/ATKSKBPtb2i7pYUgkwst6qaI4B7iSaKbInX9PSBPi8jlB
	c+a/peqsNX2jrqg32NRCPAZdkqmIoAQHPdL+LLEwd30YURLyLlYyiUFGyWqg2xyNgmI=
X-Gm-Gg: ASbGncviRvsDzk25h7/1l5MwK8lK9DUoRY2UEqURfyq8Ig5yimnKZC10aY2BJov4jDW
	WggpaXk+7lmG0hAdlPvV3tr2wEhiehhnQOgnfQ6+faypuNhJI+pYdzbmsn/9lqyuLKrjxSMBWOr
	GBboPGLl3NOuQGfgh04hplDQ1K93Tnx0pFrMQNUkQDszBzlfY9PUYwaogYSZh4YKH7UUbUPk7D/
	0qswmcyeVrrVCTkNaw+A6yfFoCpnPqK5XEN2j9FeQUIF1rr79alYniFYvnbPC10XTtBdL5+u5l9
	zXWiirxW5Ckj6ZE+kaJcdDmr4ptseyj4ychK/RGTj9uBx7sdtFbz33DG8oPT7Hw1u3SuaNOu8jX
	3rs/j5sYnA8FfhrCC8Cv7Y051ZQsjQVf3m44=
X-Google-Smtp-Source: AGHT+IFt3w8KBQHmUinwLlL1S6ACJgjHlzpbWyZ0LJDc8hDP+5NLFg8sIB0fDMXq9nh17vsNn8bIaA==
X-Received: by 2002:a05:620a:2809:b0:7d2:18a1:ce0 with SMTP id af79cd13be357-7d4439c5607mr583492485a.49.1751034193763;
        Fri, 27 Jun 2025 07:23:13 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44323b4c4sm135708785a.106.2025.06.27.07.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:23:13 -0700 (PDT)
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
Subject: [PATCH v6 1/8] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Fri, 27 Jun 2025 09:23:00 -0500
Message-ID: <20250627142309.1444135-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250627142309.1444135-1-elder@riscstar.com>
References: <20250627142309.1444135-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_072314_936507_1CF8EB00 
X-CRM114-Status: GOOD (  12.76  )
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
v6: - Add Rob's reviewed-by tag

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
