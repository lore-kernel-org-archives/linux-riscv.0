Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018C5CA0EC4
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 02:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5JMNu/9LrOcPf2BsA+WuICkx97wZHeN9nOyQqbxpFbA=; b=BvlEpsUmfqHRyq
	zWSPj7+57UuvtvsYRkP3f67eM6Jh9YZp1timMyjGQfJW+Y2CTGDVQXvNZ8ZhlsS98dFlDGy5dVigv
	XT/9UC490YskkKIN8v5jAdqvbxqQaJ4/i0lcmcFtrYoy4NVe4FwdI+3F+sVZ0Mbu73Nuwc79jQY84
	hec5mEO9DaTWIY18dn9HdK+xsex6FYuh9dvjt3iMvtypbglulmCay4BVO/aEw+aFHhvH9d4nNkxQc
	Zc8+OnD2f5ZqPArGAZG71Q9vJwoizp0fGS/JoJgCZaQWLCr5QhaS7Gx58/euZAVZUCFIV5CqMSxGQ
	rTMSccbRLcPX6c7NE+Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1UM-0000000CQfs-2oN8;
	Wed, 13 Aug 2025 02:45:18 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1UK-0000000CQf9-1Tpg
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 02:45:17 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3e3f152700fso31014365ab.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Aug 2025 19:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755053115; x=1755657915; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ek2s2DUqL/jgDZvOvv6Rjx1Dp3m/erc1mrYIyBeINSk=;
        b=TrqWgZAlbvDpK3ujJVjAciJ9L5tfcf44vT/81EKJWTPU27c7I+RL7MdB9YaM1H1Z3F
         tHzpoqHqgl4vL69QUTyukWxvnLhqijkv7pNVdiIf2NJK3JxjiWk4+Tq/huVUf7DJTdUZ
         OZQKO9Uqn3RZjE7Vkm1u5tyY96jJBB+8FxprSNpW5HmO86ysJnUxfkpJQOfxrzyGWdf7
         h7t0RJQFwuyLaAIE1V6exe+mjQhr/Rm5d0hNLzuk8pI5YwUpYf5iYMRRLRjOyTrhIFt3
         iBmMkMQGeln0AQo8sBOXv/l8qIOmGYCa+LhudfvOTo32sx6qgCRadzbwjtkBc8sn+pMU
         bkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755053115; x=1755657915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ek2s2DUqL/jgDZvOvv6Rjx1Dp3m/erc1mrYIyBeINSk=;
        b=MPKTklTpdUtCJHiw//arIZLBYb3ynLx8VRQTxsYbRtywiZqfKK32HDIeHjPWc7BL2p
         MnXJjB7Do2237lX+a4SvbFunpsEOEicctcfRBxQ0jI97VJ/dd7uaDVjkq3cPyuC38BKZ
         M4ceQ9xigkcCeEMD8NnpNT5oVg87tUWRMM26TJm0U44kX3OQbcisAWnqo0Pd3XxV5sgi
         mcRrY2a0wmMFRCYG+JY+U9wxe3Uy+ijR/kTnlcpZnMho7utNUtNP7R146pxTfmuRP71M
         o9KQWFd/vMvrHmO27NcWxbEbNJslTxMeO0bV7xUyJxIkC0m5aMWF/p069YTj0usoKX7s
         KvTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUy4iIE8XEid6L4w/jlPm7vLtbDQAUDeG1t1Birz1DYfJN3DHSVMKJ+YpJjsVHExioaVTnrk8Tx6QC7QA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzC8NxKpDvgAAuLl1QlVEoE7iat4CDNCnnY2p5l50qReonAyWEJ
	V28Ns+sbCDmebTkQoSFKY4kMcW48gOE9yqRwTHU3KR7E33+3k7s7Ai+3/WpARVIbmTs=
X-Gm-Gg: ASbGncvxqyo8nF8jxao2G7oW4CkKHxrUt/JO5+YkucviUHm22XDlJpi4kRkfWiGyFzL
	2fN3FVFthSJWmkXpZOcz5oXV1HCbAs2PII4niN0HbjiRQ8NTo7qcJVRi1wmasFD1x3vG7RYSWzp
	tU6YSBXBrBvinV4ZgDGQ7UT+9u0Uf707PLD7DzBRQ3GaH9Y4O/2BFt207zdnA2ek8hxArufJmLW
	uXGJ3wQpUN6RMs5IMtlixLyjITHJkYghgKncknEGYaiMj1CvMFoq97UIsN1jtbN9vL0YHdUtDXU
	DNv2NwzlGh6Ffhk5LUWlhnKvkswBxKvtBLzHZb5uVEgzmXPekTatXuglW1b3GKosJ8VsBYO1L2q
	PyC52kpkPuuVweC/IiQHMIaEqfWynGdNOFiMqvSwMfK4Sdywc0jxDnyGZbA83VQ0brw==
X-Google-Smtp-Source: AGHT+IEIj1vS5MVYprDokhwZ6AIsmFX7Hyk7OB0z1ohQkNDbaDoool+pCm1v0mkiT6rf8e612agvcw==
X-Received: by 2002:a92:cd86:0:b0:3e5:40e5:bade with SMTP id e9e14a558f8ab-3e567367d43mr30922625ab.3.1755053115415;
        Tue, 12 Aug 2025 19:45:15 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bcfbf6sm3430829173.54.2025.08.12.19.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 19:45:14 -0700 (PDT)
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
Subject: [PATCH v12 1/7] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Tue, 12 Aug 2025 21:45:02 -0500
Message-ID: <20250813024509.2325988-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250813024509.2325988-1-elder@riscstar.com>
References: <20250813024509.2325988-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_194516_398082_1679BC45 
X-CRM114-Status: GOOD (  12.94  )
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
