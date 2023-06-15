Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CC9EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 14:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6n1UAVOw0dCzmctIOnsYhmFu/PYw0hQ5hPctNFcOOqc=; b=oNToURF1Nt0cvv
	nwO7/3IQYk4UTFAVbM6f6nVsgb9iAeGhFqW2qIAH3pcVKG2KHcQB6ndvv8Px5Uaq+sbctW2JA7xso
	/Rka0kAHEFGnIQhD4uXCxOM82JcJSjk6EGpk5BijedPoB+bhNNE5nX7UZmDuGi+h+yq99x9RjEEIp
	3cSuVW5jOyZzt097oDFyHlUiixHLpBmBp7R2gQmEE03dDaqRq0KKDfRBElnn6DBNdfW3LR/PY47SL
	pmkKX14NipYqq/5PBk7yrkz5K7B3XaordFJhvztPnaXkPM0K5hY/gzHLAkGFJ3jFQl7n+DISMkF2K
	MntS+XrHwLHFnWXWdfEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9oDa-00FBwl-36;
	Thu, 15 Jun 2023 14:44:58 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9oDW-00FBuj-2v;
	Thu, 15 Jun 2023 14:44:56 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f62cf9755eso10541386e87.1;
        Thu, 15 Jun 2023 07:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686840292; x=1689432292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01rML8QNhx1meW63X7YOChbwA/I11tVl46mShxzno8c=;
        b=pvA/+HLk8vgyap9cUCFXxWzeUdNPB9Ek2np+gXBneOchgcRWdGUWKuRKGNmicfLkYe
         nZmfLMgNIp8JoSlcrocdAVKe9CJ4b+2qcF6UJyPJuVcHgivOfeCZ5ZxczOmUbI0r4v3v
         nsuRvyqRzSdalni1iFMt1adUhZZ1MyfTVKmQPX/GseW1tjDCDMprOVtMZ9CJQ2IbY81+
         Y1zZKj2Yisrge/IDvfWds0v5868fQ+zTWWQpeU13l64gIRQYJTx4+XkSiLxR87/XyA8O
         juOlTX8a+vBlj3qzIIU4zQJ9UdlN0lJLv69VnMZm9rAy7oHxRNrxZ1tMn7OyG+++oFp/
         hOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686840292; x=1689432292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01rML8QNhx1meW63X7YOChbwA/I11tVl46mShxzno8c=;
        b=GAC8Rf9LG6NYqF+8NGUqMUk2AlpUxqZJhwh/VX9FWKwLMF3e7BEG0Vl8MJDTjTOuew
         3lFmhrcOGxtyi3s/RwjSURBMmtk71ZrJbIycLRxdTm35HUjnEmfsWUFdstVD2gG8cn1v
         bn1A2kORfW97UTw0L/8PqLnAx/G4cXWbPA6VoK/XKi5prjNZdNQ+eC56bTLpBFc5tK5i
         qQcKGhici61eRwxCp+GSKwRY5XhZOcEWrlg8SS78Si61e92PqhMB/WsXu5M4cDiUzd9/
         Z7+R+PygiAG7kUc98g1dVQ9teBmGNg49bpOgDlAx2rglsZSexwoCNIosVFhiPDRkTwof
         Pxwg==
X-Gm-Message-State: AC+VfDxGzN5RgbDwj584+uFXMl4O2oo+1l8Bfgzvg4XBrnspZ/UfjyWc
	nmxEMBeELDTeLcMWQ0IX/A==
X-Google-Smtp-Source: ACHHUZ6/hm0iRAbwO9RB4MJBdUYxGo5Dp355lzxZq305nEDV93dKD4eDiVGsuSNkZv6TfnO+Lpc3Qg==
X-Received: by 2002:a19:641b:0:b0:4f8:451d:d2cf with SMTP id y27-20020a19641b000000b004f8451dd2cfmr1301114lfb.69.1686840291885;
        Thu, 15 Jun 2023 07:44:51 -0700 (PDT)
Received: from localhost.localdomain (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.gmail.com with ESMTPSA id h7-20020ac25967000000b004f13f4ec267sm244451lfp.186.2023.06.15.07.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 07:44:51 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 1/3] dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM controller
Date: Thu, 15 Jun 2023 17:43:56 +0300
Message-Id: <20230615144423.828698-2-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230615144423.828698-1-privatesub2@gmail.com>
References: <20230615144423.828698-1-privatesub2@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_074454_945255_B2AE1741 
X-CRM114-Status: GOOD (  13.89  )
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

Allwinner's D1, T113-S3 and R329 SoCs have a new pwm
controller witch is different from the previous pwm-sun4i.

D1 and T113s SoCs have one PWM controller with 8 channels.
R329 SoC has two PWM controllers in both power domains, one of
them has 9 channels (CPUX one) and the other has 6 (CPUS one).

Add a device tree binding for them.

Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
new file mode 100644
index 000000000000..e5f9cb2d5c4f
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/allwinner,sun20i-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner D1, T113-S3 and R329 PWM
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <mripard@kernel.org>
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    const: allwinner,sun20i-d1-pwm
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
+    items:
+      - description: module reset
+
+  allwinner,pwm-channels:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The number of PWM channels configured for this instance
+
+required:
+  - compatible
+  - reg
+  - "#pwm-cells"
+  - clocks
+  - clock-names
+  - resets
+  - allwinner,pwm-channels
+
+additionalProperties: false
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
+      allwinner,pwm-channels = <8>;
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
