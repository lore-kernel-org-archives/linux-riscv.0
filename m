Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F24E77188
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Dec 2024 10:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9jtuQD+qHV/pn9GNK4B9V392yqEK03W68Zme8ocbW4w=; b=d8i1Op3jNlKUKY
	F8K36wt7+myYuqv5hqePX/jwTPi6ttD0n5jOoDC3dy3CG489b68y8PqdE9rNn63FpWiGORNeUA9nE
	jJA5XejJM/R5kqSk1b43oO4kTSXOrtdlwgYomqGl8ni0vr6t2EexEaDrIUEgFKZMcd1dX/BzZ147P
	PXyV4yHispCv71/kGjVucYW5JPiv2MxcQ5iWu0+8isVPsJ4rGOKC4EFXi+g112QHP8cU2g4NeJ5Fe
	4CgDBSiz7tx3tZX48ISrWSeWJB+5loTPPEZ0PypfhURJ0yC6L1Pne4jdn9Ul+1FQbT9/Om2H/SVsO
	9UrZ+NOozLT7zDXfNW2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSCcT-00000004zzo-22ne;
	Mon, 30 Dec 2024 10:03:29 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSCcQ-00000004zya-1fkr
	for linux-riscv@lists.infradead.org;
	Mon, 30 Dec 2024 10:03:27 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-2156e078563so101693995ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 Dec 2024 02:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735553006; x=1736157806; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4c3g69ZSa0la5kSxDKHdJ117EiliQemTUGhd6iDU1Yw=;
        b=XLartJ3JneLhvAiAHAHo+oT6M3/M9RGSFVAEyGdckLdV5X6RpDxur184pFoQjUqmlu
         1lUlvs+5kk6roXLk+7w2SNR+W9Etc/IiSmZ6+Q6zptcHbBcyWmVJPTBHbs3foqzfkqrf
         KNCTzeIKB6OGUeg0I5G6gnjQpMYXfJrvMi9BZ3nXZJ9EVBlqbn1sobAzQpyqAzMCzH+Q
         AnBGxTYKytfa0IL8BuAw3J/mKR4b/rIHdJxNNCuHlWphklh+9gsnmfAjSiDkKXxHbV8L
         OEEsBKTy57D2EoABRVWWpr4v9ciSlv2rca/jQA/Q2XtdcQb1DSFTCss7kloeYy3OjluN
         bw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735553006; x=1736157806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4c3g69ZSa0la5kSxDKHdJ117EiliQemTUGhd6iDU1Yw=;
        b=fBK7C7CB1A9Xp8aKluurg6hVFW/Pk4JqGQplZ9L6V0uwIf4Qd5Q6Bw9F5HaMRcHQOu
         KY6V+CpFL2E6NAL4fRWsSQDaLbB5j3m48RxLmLrD7FyVT7MBhJMmNbrGn8S36ryK7UWi
         t2U/XR+S6i/7JYYTy6wy8I5B3867QCZ3B7C0OlO5wA7InMFv310vWtSNcoWSs8x4OVuZ
         EJ0d1hb1rewq/lEp9JAzJxHKoZ8lZmrCvJHEL+9E3iDF5kJh6RvYNzfMkknq0OSiXBHz
         vKN7qKZzSDhk0lxmaFmJpmPBcAIyL4wE0kHcERpUxzdXbUkUZLfcjUlrnSx2Y4EsEMB8
         WMEw==
X-Gm-Message-State: AOJu0YzqzObY1xU/JyPhp/+bWuV/pa6WAYOoZ96m6YredWMWqTv1vIHa
	ibCHPtmiockCxP/WSl2IaY23YRjwNxzX/WH+WLAtDroIfstrRO4kYMeBztP2ndh6BQ==
X-Gm-Gg: ASbGncsvwFKYmng+LWjaED3xcQuiMe35GK0+RPDA7P6ZlOebY7TMMOarMYukmekPaIL
	7wdLFLype8q8XZjV2bgbF5O3uxRZJoGwtERDssRA3rgeZctqUEwjF7HatPvMo3JLvgfFpNdxb/a
	TGF4kBq4ye+L41+sVMazDn/CRP8abC/jg4OY0Xz9T54ameuoNItFawvBUi+bF9N86F4whyYhveQ
	r1FdJXAzyk87J1CrB45jYy7b2Apeui2ZKwSk/A5wEOhqz7ydvlO8f3l2DsMlX1g
X-Google-Smtp-Source: AGHT+IEw4XPb30qBmp7nC44LPta4cKntFtZNSr+9XWLhHYQ36TJJBBUHxIe7pbgP26S5y6Gy+BMaJQ==
X-Received: by 2002:a05:6a21:328d:b0:1e0:f495:50bb with SMTP id adf61e73a8af0-1e5e084326emr51372052637.44.1735553005740;
        Mon, 30 Dec 2024 02:03:25 -0800 (PST)
Received: from [127.0.1.1] ([106.114.236.41])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f71sm17328587a12.9.2024.12.30.02.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 02:03:25 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: Troy Mitchell <TroyMitchell988@gmail.com>
Date: Mon, 30 Dec 2024 18:02:05 +0800
Subject: [PATCH 1/2] dt-bindings: mfd: add support for P1 from SpacemiT
MIME-Version: 1.0
Message-Id: <20241230-k1-p1-v1-1-aa4e02b9f993@gmail.com>
References: <20241230-k1-p1-v1-0-aa4e02b9f993@gmail.com>
In-Reply-To: <20241230-k1-p1-v1-0-aa4e02b9f993@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Troy Mitchell <TroyMitchell988@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735552935; l=4220;
 i=TroyMitchell988@gmail.com; h=from:subject:message-id;
 bh=8JLII4z2SucnC1ToeznGC9TylfiYT5yoHZV9TZlUGZg=;
 b=C4IyeA7vaYcAEgfyfJN3nXsJIdXlKkLeKM6rZ5H5GnqGHfBA/lPhcXhJAZ6mnvGY6/5U+BFoi
 SeePIFD4hDrBcDDoB01W2W2rBLXlLPnPWoqxKgBxu+2llkORC7Q3CYC
X-Developer-Key: i=TroyMitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_020326_448963_9154B078 
X-CRM114-Status: GOOD (  11.41  )
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

P1 PMIC contains of regulator, pinctrl, pwrkey and rtc.

P1 contains a load switch, which allows you to control
whether a device is powered on (such as a MIPI screen)

Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
---
 .../devicetree/bindings/mfd/spacemit,p1.yaml       | 153 +++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..7475d403aeb3d0e72ffa9b6fbcbb6545d5bc429f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
@@ -0,0 +1,153 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/spacemit,p1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: P1 Power Management Integrated Circuit
+
+maintainers:
+  - Troy Mitchell <troymitchell988@gmail.com>
+
+description:
+  PMIC chip P1 produced by SpacemiT. The device consists of I2C controlled MFD,
+  which contains regulator, pinctrl, pwrkey and rtc.
+
+properties:
+  compatible:
+    const: spacemit,p1-pmic
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  regulators:
+    type: object
+
+    properties:
+      compatible:
+        const: pmic,p1-regulator
+
+    required:
+      - compatible
+
+    patternProperties:
+      "^(dcdc-reg[1-6]|aldo-reg[1-4]|dldo-reg[1-7]|switch)$":
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+    unevaluatedProperties: false
+
+  pinctrl:
+    type: object
+
+    properties:
+      compatible:
+        const: pmic,p1-pinctrl
+
+      "#gpio-cells":
+        const: 2
+
+      gpio-controller: true
+
+    required:
+      - compatible
+      - "#gpio-cells"
+      - gpio-controller
+
+    unevaluatedProperties: false
+
+  pwrkey:
+    type: object
+    $ref: /schemas/input/input.yaml#
+
+    properties:
+      compatible:
+        const: pmic,p1-pwrkey
+
+    required:
+      - compatible
+
+    unevaluatedProperties: false
+
+  rtc:
+    type: object
+    $ref: /schemas/rtc/rtc.yaml#
+
+    properties:
+      compatible:
+        const: pmic,p1-rtc
+
+    required:
+      - compatible
+
+    unevaluatedProperties: false
+
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
+            interrupt-parent = <&intc>;
+            interrupts = <64>;
+
+            regulators {
+                compatible = "pmic,p1-regulator";
+
+                dcdc-reg1 {
+                    regulator-name = "dcdc1";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <3450000>;
+                    regulator-ramp-delay = <5000>;
+                    regulator-always-on;
+                };
+
+                aldo-reg1 {
+                    regulator-name = "aldo1";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <3400000>;
+                    regulator-boot-on;
+                };
+
+                dldo-reg1 {
+                    regulator-name = "dldo1";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <3400000>;
+                    regulator-boot-on;
+                };
+
+                switch {
+                    regulator-name = "switch";
+                };
+            };
+
+            pinctrl {
+                    compatible = "pmic,p1-pinctrl";
+                    gpio-controller;
+                    #gpio-cells = <2>;
+            };
+
+            pwrkey {
+                compatible = "pmic,p1-pwrkey";
+            };
+
+            rtc {
+                compatible = "pmic,p1-rtc";
+            };
+        };
+    };

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
