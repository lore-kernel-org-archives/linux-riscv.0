Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129C8C7EE2A
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Jun 2025 03:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rgrvdaoAMXnpD1GyPsd7WoI04eBZMFWVOkP+kB0t8YA=; b=ox4Y6AQRTA5kQo
	D1MwMuPp5ZLHY11rfv6SO7nhyewiNLX6FmzEV2kh/Vk5T7pCnpICNMO9S1G8FA0TcjLYgbOi3uHsp
	4h2pdNVQS1UrGP5vmJQix6hHREXRPAXKJbVpstgXEEe6Qhh87/S/RP7fOwmhxhh23WQSmGRX+f/yl
	lUiQD6np3lB7BiEUVEv8OKWRYNQGtcC7+pTzP3Yqt3Ut06TpDM3CUTbiQJ3JPRyOXdm7SlaIsWbGN
	73neVmryNRDLQk2CiAceyZYRKpIea7cZVA1MXvMQYTMYihr4D2HNW36gH6u1TqDn8W5HmcWWziJVh
	CRzoFwPo9w+9XfnWUlHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTBOx-00000000TgR-1fsI;
	Sun, 22 Jun 2025 03:29:51 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTBOu-00000000TfL-1RAs
	for linux-riscv@lists.infradead.org;
	Sun, 22 Jun 2025 03:29:49 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7c5b8d13f73so321081385a.0
        for <linux-riscv@lists.infradead.org>; Sat, 21 Jun 2025 20:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750562987; x=1751167787; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onUZmipuuggYzLIHkuYvhE+eJtHfnxxJxJfL7IX4aE0=;
        b=gNps/IiByhBZzV6Sd6DngCuN5xDbSDIb42BTqENg/LJy2Ad+jkXaSHw6+wpFe3a515
         0bViM+Mj4Eon36Onr4upfexeYsfQrQJngS0xIlunFpuNGjEI47aVjFyjE1RNzRC3v9Ub
         UIuW46hw6YNruVnDn1375Vx2Px+XEoBaGBzTlWWDCzg5m1vw4uzWeomfG/w7j/LnM8UM
         4+McwN01XPXq2tSmn/47hXWiVEopj43v1JzsKLZcnQ4VNu158pnDOrDDkuX92vfedb26
         tJn+hDALJF5IyeNF0E+ZcwRiE3O8ZxDGc2E5xBVJAW3moG0EYynk3eqGzlewOnQ7mPEv
         2iJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750562987; x=1751167787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onUZmipuuggYzLIHkuYvhE+eJtHfnxxJxJfL7IX4aE0=;
        b=ucFBQ8/PjM1G36V/MnlbKFgnuRMhMlUkxWj5WqqKIA0NGn3xzpTTZN12QZquDVOvfY
         lcJGQT87gpc8SWsD87FiIbKrSAU2vApeqZIjq8gRbS6TLQbpne0BnDuaTUlCPenmsncC
         F2AZUHV3xJ48ZakCGfSXzEhntjKVAcgXbLFmdpf41wVx+L58/hhZiYmqwGHyfYwjzsHJ
         sEd52xsFeMYa95mSc7kPOxvn7RIkYkO4DYYaU4hy2YkGa+293E6QZc4GMJDEe2Y5+FNm
         H09/DtOSmtxS6I+495AGW1Ar/2tJLW33iC5YghdDzDBuqSWyH/YZG5mShPUBLm5OtfIK
         xxww==
X-Forwarded-Encrypted: i=1; AJvYcCUl7AO+6a9X4r/CCzxXGvFO2U18y46yeaCPKVld/a8O3KIN3dFnqFQxfL89B9YG2T2szXLFPDKA9oRwuw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQbXfqSuK+ztpotq79Ajn70XRY104Pk00jMU6l3tedMB9FBF3+
	XY6dWSUZpDWFCxJW2OQDRxwdTMQdthGsZKyft6MWij1YopMUEAcz3LuCAqAyDxxWxeo=
X-Gm-Gg: ASbGncsBjgUAxd33SbGRNeisrAZbyTrSWOXcNogzOeI87ar3aHKtvJJa+C1kk6LYOfv
	myQwhXT0ol5ezXPzTQRW0CIoCgX4ny3hrwlh5kxfobbJynMJz24E0/VMB2UzuN5+Bej0zP+49ld
	kbse0jBz8PebMZuMH3A+hHQ1y1dH8ex/iDB0QuOQgsT+mieouXss+NHUzXx36pux+Y06YGFB98p
	jJQZ8Hy6/56Vy+gR329hJdP1P8QuzC2jd3NH81vk3gojjxishsVMSKzyxIodUjyj2AUKeCSWuVc
	rjV6umPBNG8dd5yjOJBToxJ+IfJJdilJEolL7eka8bjNOqHXoKMzvmCORu/IpYOuqYWz/mflkH0
	R4rE8v55oGSjdo/HfbYBbnBqmjafr0zfZcIw=
X-Google-Smtp-Source: AGHT+IGgC0s5tLXnKubHAjilc/vdE9TsS2rxF7dNnxQoxPszakpBCgqiPMG6aQ5v+WXvEF2OTx3kZA==
X-Received: by 2002:a05:620a:3726:b0:7c3:d7ef:f7f5 with SMTP id af79cd13be357-7d3f98e8ce4mr1234323785a.18.1750562987233;
        Sat, 21 Jun 2025 20:29:47 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0945183dsm30014526d6.44.2025.06.21.20.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 20:29:46 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	alexandre.belloni@bootlin.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	wangruikang@iscas.ac.cn,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 1/7] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Sat, 21 Jun 2025 22:29:33 -0500
Message-ID: <20250622032941.3768912-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250622032941.3768912-1-elder@riscstar.com>
References: <20250622032941.3768912-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_202948_378074_0047735D 
X-CRM114-Status: GOOD (  11.91  )
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
