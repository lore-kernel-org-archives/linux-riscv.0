Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77FCC001DB
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 13:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BoGxLcy4tnqhkOyBopCwFVO5lyJRPTjSJ6d+s9INcjM=; b=m7RdzakOUdD8Tn
	nMIWG8G/n0D2jX25R8dWKGDIhfRtBOYqS+6n8ycYHJJ+CNF2etJJ7/PkU2S5UUDEGKf/kpiaxyG3h
	Iefh31sMdimERJxs5xnOSMqQUCQdRi3vOPybWIdPeBthG3rs+FRK5CgVzanQ5rh9XShaYQeftn+Mp
	jHsimXW4tHTb+en/xokR2XQApE1P4Z7NLakfXXS6eLkT26Za2Znu153Np2y8jk3gyzfVS9YDmjApv
	UnCsHH/R8aDqtTJAYfBES3uYghsgeiU67dI28ogi77E/X/e32v9uyNs36MB+GrV/t7cnaDjB8ApXw
	bFsQMjNO2eQtG+QwOQ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVXh8-00HALy-0Q;
	Mon, 14 Aug 2023 13:33:18 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVXh4-00HAIz-0u;
	Mon, 14 Aug 2023 13:33:15 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fe2d152f62so7020844e87.0;
        Mon, 14 Aug 2023 06:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692019989; x=1692624789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CaHw6FSzB6D/cmI2sFQa1bF3mX4riXTCludXEuBTPcs=;
        b=AYV7B5rtspunDbyD7cEzXMshN/+tnd10OyL0GTD9Vs668yn0stRIpfUbuxr4MDTV/g
         6MZbJmbwDchn/I/EX/9FSLiQeiCRJ3yx+ooLJmMa5k1HFAzcyQc+NK7LXOiLW7by+hip
         f888wDLhPmnJjnWetRhnegs1QB6/IitY8HZfxYGxapLJTKuKMLUi0SpJJPI/rZupoe2o
         aWoTTv/lh6mZHk7JInvlW2CxHMGU8v2BUkRuQ7rS+U9CN8bWMOqYIh1YXDklHhgEnzEw
         oKZJ721a22pMuRRWOu0ZQIED02SG2JJoJNVhMCQPxG1znldctuIjpeS0sK52GwDCeEM4
         I6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692019989; x=1692624789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CaHw6FSzB6D/cmI2sFQa1bF3mX4riXTCludXEuBTPcs=;
        b=R2s41kaTAyfeeWRJNxjgVEXHxs/p8by6/oX00KOSxJSGameHZlFbdJThzi7TTnXOeG
         M2EBNQaQISiWPdPoNrUL7L5t/q0H5HUUB8+HOxCKot4rDGWODXsJK0KWtO2N11OxuN7L
         LH0laP9qjAjm0w3ar9gDOO1+qcTrshm6n/xL7052uXL7ioDnsEkfh2TJzqd3o0Y5t60y
         JMNbpaJckRJG5j0ol/tuFih9eWaPxyi5Oz6K7u1LypxXq+67Aew2KXbdL87tL09W0AAb
         7rbW8l1RE6K1kBFKpq15aXkeMY2xH0xKy6X+OwdLdHTQJfSfiDFXhBT6mZesFmHVymo5
         Li3Q==
X-Gm-Message-State: AOJu0YxLvX6Ktm9NxnIVDXEGyLl3hKIn0REjbdyhLDHHtKqC5kO9bkpg
	V2uCW7HUq8wfq/x0E86k3w==
X-Google-Smtp-Source: AGHT+IGnd/iG2u3+lAcUGf6pJT3d40kUR1557h8GZk7ZB8HeL7Rga3zu7ntpGkkTUVD8ffrj2TITsg==
X-Received: by 2002:a05:6512:15a7:b0:4f9:6842:afc with SMTP id bp39-20020a05651215a700b004f968420afcmr8011655lfb.64.1692019989211;
        Mon, 14 Aug 2023 06:33:09 -0700 (PDT)
Received: from localhost.localdomain (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.gmail.com with ESMTPSA id eo12-20020a056512480c00b004f858249932sm1990566lfb.90.2023.08.14.06.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 06:33:08 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/3] dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM controller
Date: Mon, 14 Aug 2023 16:32:16 +0300
Message-Id: <20230814133238.741950-2-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230814133238.741950-1-privatesub2@gmail.com>
References: <20230814133238.741950-1-privatesub2@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_063314_324220_06BB6C5C 
X-CRM114-Status: GOOD (  15.25  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Aleksandr Shubin <privatesub2@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, Albert Ou <aou@eecs.berkeley.edu>
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
---
 .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
new file mode 100644
index 000000000000..9512d4bed322
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
@@ -0,0 +1,85 @@
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
+      - description: 24 MHz oscillator
+      - description: Bus Clock
+
+  clock-names:
+    items:
+      - const: hosc
+      - const: bus
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
+      clocks = <&dcxo>, <&ccu CLK_BUS_PWM>;
+      clock-names = "hosc", "bus";
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
