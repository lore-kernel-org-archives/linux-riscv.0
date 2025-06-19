Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66777C7115B
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 17:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QtJFy4w3Pvm80tksmRbVAQF+a7tbLQ2arKVYnFNFR7M=; b=hWoOdUnXQrI6Ct
	NRuEhCx6Nm+AbpVZWW9Jeeio3iFUiuCccs8RDXlFOB9tknukXNGUUGQdeksk+WLssuq1rj+8WbYhQ
	6dMTIM4wdq0nZhA4bqhxtfQj2yHbk7rmzJF3SQt2pRx9EP1WDYJ+Vt8lIyklBES0x1OCDHajqLHmi
	JuLRczDmsaGRNmV/kwXRsEVSCPnS5D5NgVT13TykciM5ewt2lvKXrj+GzN4BlJcK/45zpv9cQWMke
	f6jn8SVVGWsOJjElgcrEarzilv9+zgB479/t7+dRgdI617/Judk1ZavfNLJkFnO/2yTZqbcv3Sx7U
	C+IDqPbUHAcis3ti3vUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIej-0000000DesC-06FK;
	Thu, 19 Jun 2025 17:02:29 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSFgL-0000000DDxo-2Lzv
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 13:51:58 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3dddbe5f8aaso2482425ab.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jun 2025 06:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750341116; x=1750945916; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9OZBf2ZEclqneULzr0nY5IJTm6h+hkq5rFp6zftd8k=;
        b=ZyXRFeKSNcPM6oz36PLmJREvQqPzwoN9ujV2Dh2Gu+qOvvsfK0ZUqwl+fssmk0pugG
         sutEiFELwvUB4bpOEfVheGoNj162m/1iFzYhlmbHctvdfIjGjX3OfeMGvlM9h+JE+Kaa
         6aSgQBB4AKS8C4mkvnnGHHSGwlhAYvWU16zAnhfK3iLO8kBbsQCPxiwx4AR6LHdx+W0y
         YopWCTRNgd4W4B+tEqgqFOpWvUT1J2jZMDKoaFrbOQIOADuUCDQ+jv29ZUwSYafTiHba
         /Y7rNcMSYc4FEIoe2cWnUl8SMOLXS4WBRYZA/kNPHYZEzJpeCJ426nYRpb0EFvw9GlGP
         jGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341116; x=1750945916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9OZBf2ZEclqneULzr0nY5IJTm6h+hkq5rFp6zftd8k=;
        b=q0SA1wdyQ/Mr7HH0in5y9PqEvGYZNeU/kqxwC0GkFhIqYwLzTfw3eZtP6wUD5f7g+B
         iK4BTEv3U1EuQNN3nU3E6eqOCcEY6ZoTvfOR8km/trE1BSWDJ/WbjPX/OJcf9WxmeTdK
         BmB5FBUVeXjxbuRDVLBnmsk0rNUtfIOkJRG5vkPgEHAVwGZeDgfxnEN7OSih/EY6qcp0
         FH2ZQ4/kgYW/ULOyKRnof0FzZlkkCGI4SGTExuHKy+5iUH3OVxbVAfLXbwqKWtEw6gy7
         4s4ePrnqHQVcpojaEwYPyRiGJ3PQEWsvByWlA9+aQOvX+mzt9ypEQ8OQUbKMcvyUO17H
         EBhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+9INzSX7/BwiiN3wngUlffMDpd8DD/4kO1LugVDOcwjpF74vUVjAm2M9AT/QvYNNIIqxoFaRft9FRNw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl8jKddPg5kwji7/mfGxKdapJrKdeTEzD5tTwalRxjIJ2hNSS6
	ctQE4bXGEFfePC4nDqleQj+KUl8kFG1rPDJqTaJb4/DY6bd2ehm3pIfJCC6uEgX5MbE=
X-Gm-Gg: ASbGncty0ZhkIqGkuywwGL0WuZW43nd5VvFNHNv8+uhaqRT4LCuPQzK+T1Bg+R+PIKW
	59y7NnWAymW8aoRWryTXHdVhn6D4Kqmk1EBB4miR2KbRxjAHhbmWfiDdf2fVToJad5aN2ycPPy/
	YgSbW762pLA7DAWSYvY3fc4UidY7ugKr23JRB8fWS9fkUtWA12dXPuqJwawDC18gzbZLFQKrWIJ
	4FTTGgqKb21QLogWoiozR88M2DOPkvaPQzyoFDAUpc2nwzyWojJ9yLXRw2kZY7rY/L1tx8wI9UY
	jy/tIvEH4CiSgXl+fj7e9IGnqJwSxs13jHuOt4QnsND0VUDcMo0WEcTH8aDAvSf/bHG2B0CsyuV
	g9FVNHj5JEGDqUJZ7GGu40ZMEto26WtU=
X-Google-Smtp-Source: AGHT+IElaXHZ2UeHWaQiwWXotIWz/yHFM2kkgPfUkrNCPfPJv6aoAzGBdh75tg6zZAr4XQkckxbbkw==
X-Received: by 2002:a05:6e02:378f:b0:3d4:2ea4:6b87 with SMTP id e9e14a558f8ab-3de3029bcd5mr30770725ab.11.1750341116498;
        Thu, 19 Jun 2025 06:51:56 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de01a453b4sm38246015ab.47.2025.06.19.06.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:51:56 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Cc: wangruikang@iscas.ac.cn,
	dlan@gentoo.org,
	troymitchell988@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Thu, 19 Jun 2025 08:51:45 -0500
Message-ID: <20250619135151.3206258-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250619135151.3206258-1-elder@riscstar.com>
References: <20250619135151.3206258-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_065157_600746_40073004 
X-CRM114-Status: GOOD (  12.20  )
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
only the regulators will be supported.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - Spell SpacemiT correctly in the subject line

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
