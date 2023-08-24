Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84DBC6FA8F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 11:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ccVFsmnrNL/IRtCKVsUDrju+TTkmtbrF8QYoyKdcqSg=; b=dV9jNWykyuzebp
	PKj1jd2NYDv//TXXFqKgafVudA0ogxZgBXDdtSU2estzk0ps1mDqhyPMgHbm/AnJOmR4dxbL48bAm
	SbsKbWGqoqf3w9sF0cHwjrge+bQimnbzJc1YeIIX2O4WQxsrTtaqB11spgH4XJHjTrErRx52cENDE
	ebPf4DwHfTgaiBKJXp3zfX/EFuBIM9+GdmVrX5H6YDmTPo4W3o7xhkdmjWx5kASS27osgn4DfPy3B
	E854fQ/TuZ75f7HQiL2PuWBu0sJ+JXkTSSJMUfEoUeX2z6Em5+10wrrVKHmhzF4W6VNEcONH7bg7i
	Owiqo756vySnD6rz/PZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ8i3-002zJC-0G;
	Thu, 24 Aug 2023 11:41:07 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ8hz-002zI1-1V;
	Thu, 24 Aug 2023 11:41:05 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2bcd7a207f7so33276141fa.3;
        Thu, 24 Aug 2023 04:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692877259; x=1693482059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nwRtV/1CUIsDQRncajks7sdUUomDHsC1aZqElEGA1E=;
        b=E9F6QyTsqQAhwasiXnFYVaLH225TZNaejk8bGOFZ5+RZkk/CnavPGjy+nLqLpzKRHP
         FQiG3M466AiV78D64IEAGt26505Gf1TiFNv1XTkt73z22hTn/FOsZNrnJUBMeyAeMxiv
         MDjAfuo30APWp9aXkdF4aE8nxUH3Mv3Fmro5BXdQeB2PmJ3C4fnFNKzgXkVqJ4BnGXja
         t9Ey2teJxgEokNzIZKI6rBW6vZEgyvHkLE6uLgTCrNY589ji5a2Vn1fFCxNcfC13XhmR
         inA8xza3l/G+ZLTPD7AL3d5W0IJuzLYOU+e0VJouK5CoTg5AZsb8+FW7raOY5JkAweEx
         Y7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692877259; x=1693482059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nwRtV/1CUIsDQRncajks7sdUUomDHsC1aZqElEGA1E=;
        b=FBsld7qoaAn9BXPNHkG6+ConOaTgPi1oP7Gg1S84negk38Op+CpaX3zfvdObKVekMU
         IaRIW1mumniJnUDqVDYqf5hsWNm6sZgeX0zFmlPsnozWdHV/Xj4rn9Z1kOYRH/DYwTWd
         45G1hvWknkR+mT4ABW6o5xCwpNaY0KTCrGJKC4k4bMU64OXjNVS7V7p0WwGUsqH/tPeG
         pWlbyg7oJKE0svu25H7DsJFFxIGbavrtx629a05Cvsbto/D6VtdJzRtrCo3R9jvIy8JS
         ccPG+xh0VukPBLufvvWdlxoko4p9yUPmLDnSxg5c+mrFTAKJjlyvaE2H87nij0D7n9Ld
         29Tw==
X-Gm-Message-State: AOJu0YymGMBP+dBWEbrwdln+1/CeATmLuEISXYuDk1cRLu7yNYGzSLl4
	GqgESFto9k1N8kythdgOkg==
X-Google-Smtp-Source: AGHT+IHxwe4Az2unTJJA9wSBaJpXO+z7BFt7KWn0VRDlv4aIkQOws7xlJBxUgLktAONf3kWq/rKMMw==
X-Received: by 2002:a2e:3a06:0:b0:2bb:afad:ffdb with SMTP id h6-20020a2e3a06000000b002bbafadffdbmr12231574lja.28.1692877259355;
        Thu, 24 Aug 2023 04:40:59 -0700 (PDT)
Received: from localhost.localdomain (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.gmail.com with ESMTPSA id o17-20020a2e0c51000000b002ba053e1f9bsm534568ljd.35.2023.08.24.04.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 04:40:58 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/3] dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM controller
Date: Thu, 24 Aug 2023 14:40:25 +0300
Message-Id: <20230824114038.891493-2-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230824114038.891493-1-privatesub2@gmail.com>
References: <20230824114038.891493-1-privatesub2@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_044103_741732_CA330452 
X-CRM114-Status: GOOD (  15.55  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Aleksandr Shubin <privatesub2@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, Albert Ou <aou@eecs.berkeley.edu>
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
 .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
new file mode 100644
index 000000000000..a65324e9b138
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
@@ -0,0 +1,87 @@
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
