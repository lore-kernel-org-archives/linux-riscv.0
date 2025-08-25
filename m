Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D9FCA0FED
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 17:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ISy4hxLlOLyuhGZfikQx8WuvkD5wnlYNLmDLOSUzLBQ=; b=ii/JhYvuU4p4Lw
	mPnSQLEeAGNARUoq0uy9UEj/pFMwVd+2gltdnkm+u/UwmNvuk3ZgLVUl22UDqfMgnoHKzYJ8Ick1M
	nCv3Vn19EcqHVSHoi0SFOZUML9soGRGCa8vgXqjyfCNH8RjM9Zh2bO+0rfDR1xOHmvtkVHS839M18
	TNIOJaN76+bTvtLqVm+mjurjkEqYawsRrd2l+99NEvuGip3tob0lxtFyvP6gIR+CCRfMos8MB8JJJ
	jrbKoABF81jdavMc84XIek/ACbQYxSnZkUg+jDXtwkHPlfmyVaVTThkMZScCeF+CtIbc2RAW9GzO2
	krB0+DGfbsRTa0uupoAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqbNa-00000008sM5-2POh;
	Mon, 25 Aug 2025 17:53:14 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqasT-00000008orX-1lUR
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 17:21:06 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-886ec1ac877so4512639f.0
        for <linux-riscv@lists.infradead.org>; Mon, 25 Aug 2025 10:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1756142464; x=1756747264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYY6dLm3K5+01OXDQO8emoD1CldXvYvk8MiFXHZCE9A=;
        b=O69rV8WTzkSwED5t0VozttCKn6yf03maHHl/ZOIL6nlBmLhWzieFirZD7E8EBrogM1
         mmUCmku6U4oCZmbyYqY+ur5AfiIQqr2fQgc0O/4w+DOACvN3+atxNYT5LSo2fCNxOm+k
         1GgxbQH3tHgyXQzW5u7GofDUQuZweAG2xYZGdwCJuzPSgIJTpsUSV/Cj7zNJsnfZXJQy
         U8x8QH5OgbUx28y3gj5jFyp0ehhfbeok9cVWlgx/D5iAGC1dBgwNixcPFtmxS8MqtSm9
         00qwLYyQOF9QPWcuBmLgCzpOdVYiJMFp9+1LMwg9lA/ymEVHGTW5qjVfGG0gGBIZNuG0
         JdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756142464; x=1756747264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYY6dLm3K5+01OXDQO8emoD1CldXvYvk8MiFXHZCE9A=;
        b=abZ7Q7ok4Jy9PvYhK7gioAnjXnUBoGQIHbcPBT52bPn077cUNwm16D7lmE9a7Qhedf
         6rKCgBOWIG/CV1zycfIxSUbq5+wcK8QCdbRlpJEWWmp/TBkuIKtcRf7w73TufpfRaHfN
         oHmOOK9Uv5zz4i3DqHYSaq8jQCqCmzYbjfgzam+D299twWmn//6P5Nw7nBwNk86B/giJ
         i4xAoPYAInEEtt7HvZe/bFXmhi/nVYAkTCsAYcIRvkHdIgQY6baxVKF7jFDeiinzhRZU
         u2EpgIrl+gGuev0o6P1w45Ix3NoA9Dvf6An9wXopoINWGaE9Qzdv8ToDlomcnYLdHorl
         Aung==
X-Forwarded-Encrypted: i=1; AJvYcCUdHOpvj1DK3I0rnqBCXh3ze+t+BqV65qTdHRn0ycDddmGTScoumQZxcxmKfh1kzNo63BFzphyeePi//Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1vzFjub84PzjpR2K1axPJDlhVy+Hytnoiz7h1BaGzX36ZP4+p
	UVjasFlfbzA+CmgGjiaqabdp5mwfuZiUuEqztBbHJ8E6WoOP6rZ4WDQHSTTYv2ZAf/Q=
X-Gm-Gg: ASbGnctYQvXMpbThP/IllHOT6z9fRlA8Bs3dLJemxjeZnguM0H9FFnpt6ARmLHVrmHR
	l4e6b9/QjfHRwbRdEY6ogUldrz48NUGlh4aKQth0sDqcuAH0QaoqSl7/n+APQRh1OkJC+3S3fbo
	Y7Vex94tDH7DCpeGai1EYC8vWqEhfJajtnkp0gsoFbJwzQQBxD2YwNe+NX8a1Y4S7KwGp9GapSM
	0xYDX8IcSCUigccA+7vNFpKaM7LHNJtZzcU5g/+0ssd9C31a4YRPaO+H+d9cjBq1E4kEACFKYZX
	J9V7KBlBxZOJiZeJjgItEuLpAns+kZ8DHZprmXl75zGG8BAbEpqJp5/jNurQMdri6rkF0dz+B4B
	A7l6dHcMXNYKOjjXjN1UoLN2+2+khl64J1uUdMwNotZgMked+lzSTx552+o1dE5ryQRqFfGZKze
	Xu
X-Google-Smtp-Source: AGHT+IGBXlU1oq7Hq3Hx+zyfwUPdCk2dB9M48YVwvfYPzgOuu9eQp5VooSY0xSGbyY2yI7LdGuyEug==
X-Received: by 2002:a05:6602:29c7:b0:886:c53c:9171 with SMTP id ca18e2360f4ac-886c53c9338mr1220679439f.17.1756142464463;
        Mon, 25 Aug 2025 10:21:04 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-886e60c4737sm76275439f.26.2025.08.25.10.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:21:04 -0700 (PDT)
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
Subject: [PATCH v13 1/7] dt-bindings: mfd: add support the SpacemiT P1 PMIC
Date: Mon, 25 Aug 2025 12:20:50 -0500
Message-ID: <20250825172057.163883-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250825172057.163883-1-elder@riscstar.com>
References: <20250825172057.163883-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_102105_466725_F1BB445F 
X-CRM114-Status: GOOD (  12.72  )
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
Acked-by: Troy Mitchell <troymitchell988@gmail.com>
---
v13: - Update Troy Mitchell's e-mail address in "spacemit,p1.yaml"
     - Add Troy Mitchell's Acked-by

 .../devicetree/bindings/mfd/spacemit,p1.yaml  | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml

diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
new file mode 100644
index 0000000000000..c6593ac6ef6ad
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
+  - Troy Mitchell <troy.mitchell@linux.spacemit.com>
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
