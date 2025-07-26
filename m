Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE98C87FD1
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Jul 2025 13:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5JMNu/9LrOcPf2BsA+WuICkx97wZHeN9nOyQqbxpFbA=; b=xA87epjLW+HtTQ
	T5wqgtpwJJxDlpulmBwcfGRV4oaaLvCWo7lRqonRb6AsRR2tSjtovN5rpCXz1ubaNuHmkCPsJgn0L
	DQwbDit+4xfr6tBI2Wqlc8xaSRQib1qJVdO/EZDVZZfd1gnYLuGAZcCMgGZmf6JMjnNs60SC063T6
	8K7aIIcFVjKe5ejzjU0Blcprjt/f3KJAu1/xl9whKZM7lnHBJWosCbJ/P/aGCDOzb/D/OG/SP5cT0
	Q0SDOObXS7/CnDQRhTLdd9qSK/tuAa82xroNK0G1fJICPm9Iau0mVsI1LBqiUgmZzvYJjhMFimCdP
	Mhv+H4w0K8AWzNOVdqbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufefG-0000000BU6W-1B9k;
	Sat, 26 Jul 2025 13:10:14 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufefD-0000000BU5h-2KUM
	for linux-riscv@lists.infradead.org;
	Sat, 26 Jul 2025 13:10:12 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-87c46159b24so110263539f.0
        for <linux-riscv@lists.infradead.org>; Sat, 26 Jul 2025 06:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753535411; x=1754140211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ek2s2DUqL/jgDZvOvv6Rjx1Dp3m/erc1mrYIyBeINSk=;
        b=H1cn7pHFQr7Sj3ycrMmSiZJvHaeL7QNmZ7WNWMF52enSqH9S1Z4afOa4PlVDZDBbuK
         rH7EBJEVLSnERaqUvBqvmarZirZhnNWB3O1cKw8FzklYbXOSlPPM1Dw36yhfc2NOIIUj
         K8axjr8a3Zx0JAetJN/n+57Ji4oW/ectSiuK4Or9G5hTaq/RMPOjm/BvoKKGa+2NYZys
         giGAJQ1B1SCTzvTDj9AmWcyRYkORyrqDJWTCkKpWbYUaLFsVfyv4uEcxekuz+iMmvJQ7
         8VvB4JJOGX0aaXhjWycDMs1+mjor6XoQYcq+f6jnxYJLsbd1hVvZ8D3RFcoG5XrQxpsE
         LIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753535411; x=1754140211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ek2s2DUqL/jgDZvOvv6Rjx1Dp3m/erc1mrYIyBeINSk=;
        b=fjZKSWE8WyfXEkU247L37b1E+UULZaCH7WscZ/1xduUHr04A5mFgvI6L8qUp4Dh7vT
         wrf2bP45vy28qFoseQofXWVCwzKAyh2xv9khrAp3Oa+ye8smq0xKpN/3x7nrpEMAUuvC
         UNdJfN1Wy2TBpR195A9/yTiGP2NPpjljKMbFvLr4Or2cdcjbzdU9Qho8cf3FL60AsJf7
         Og2p3AlX68QXGuyFADv0cbA4Yls5w+O8ZDyRptPTQtvj/7HM8hS7O/fDjkzoIsWK/78s
         pgdAxVWW/h2ESnu8DmG6IbA1HekdWLHMJbXlsNtQMCzngB3fRW6J1MdQ/RRto4jzoUCx
         6IBg==
X-Forwarded-Encrypted: i=1; AJvYcCXceT44ccXr3Duo6b05E98AVOJW0UeHVJMSTQpJwjURfeF16RqOwvyKACHeElCxdhqoELGuLbz0h8olyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGQNyW7QsZfxd/0IfIxqb7NH3V21UFgilRyNncvddAb/fdulhQ
	6rr40ZJ4H2PWTJvMv5nqIpqlMwGKOc67O6werq9qbkopaohxCPaVQKiUaRyOx0eW0Rs=
X-Gm-Gg: ASbGncuJJ67QxmDysN/SpOACENHjThWDpUFmuW8U5BkH2vxwYSXz7xP7Qlb/55ua6VE
	go3AOUsluUoZqi2lvRJlaRL8Sn53wx4HOtZ5lr24tvD1cPOUSSzHVI6HdYhiQWive0x4rSC7xjl
	ezRE61iCBR3IkOrG+ZtIz9FVoUnlXmEUj+516p4q/bQfYuzwac0jd6SywvWPsRVwrYaNQwobAuz
	oWuv1w2g99bIxvnGFs90oOvrtUZqKbBLXTEWAAlaME3zrd1dr8yfpf3Ylg3dNUX6mjn8elrE8eN
	iz6QezKby9g2R10sMRo0s7Y/lvYF4+pw0ZE+NQrginJfq98qWkFRMwYzHzMleu+l9V7UWfefGpz
	HZXuV4wTBMYsSyvCgzdgw7qKQI4ItwvSCXz4tn+xtDUDcdBcqHzwealtufB2A4QaFSgB3ie0Qud
	e+
X-Google-Smtp-Source: AGHT+IHyyfkAGrv7e9QP0fqrvp0iqIuBvwoIPIrl5BUPHk4N3KVmqmw/7gL1AW8CJAs0LQjqCf81DA==
X-Received: by 2002:a05:6602:29d2:b0:85b:476e:ede2 with SMTP id ca18e2360f4ac-8802293bd79mr912922239f.13.1753535410568;
        Sat, 26 Jul 2025 06:10:10 -0700 (PDT)
Received: from zippy.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-880f7a4ee9fsm49551439f.33.2025.07.26.06.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 06:10:09 -0700 (PDT)
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
Subject: [PATCH v10 1/8] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Sat, 26 Jul 2025 08:09:55 -0500
Message-ID: <20250726131003.3137282-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250726131003.3137282-1-elder@riscstar.com>
References: <20250726131003.3137282-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_061011_596959_C867BD00 
X-CRM114-Status: GOOD (  12.49  )
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
