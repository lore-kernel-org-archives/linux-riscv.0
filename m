Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52777C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 21:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ug7peV6YT/NbCVy9gnfpa1CM1GjZaYK/N+HA9w4VYzQ=; b=n7W706dp1LiQU8
	z/y2Wk9fL7elw2OMxZZz8NQh0/tHdKYUwFHLgPEbJqTRn5dm9yFI/foyF5iDr72Zw3vArxQe9YYue
	UX8w/FZWt3mMdhcE+nMRKZKo+df83FVVrNHs+TdyJN6IRzN4WixwBOJD1AYTETOLwM6PqJnWOGkqy
	7bmrDFBIvdOjsXHkCbQKlsFNEtPP20GQOoce3w7FhJUdUPyatYMjQQ+/vBK1Orn5HqjVYztkm9uLp
	+CET+zEEdnIG5GtYijAEp0xGIxarBS8Fx0aBKtoeEb7o0tPGGoUVOdMqZ5itqYQUlc/itb5TFbOib
	e9ff93SpqcF79Yyn29Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJiz1-00H33w-Aq; Mon, 14 Feb 2022 21:34:07 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJine-00GyMd-U4
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 21:22:24 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 40D77407D3
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 21:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644873741;
 bh=fcG/L5ODzpr+LI/EAJmGBh5z8kctn/2OPAueI4k16fY=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=PZvLpvZ54Les/qR47ZKzOv0RNZKTHdKodzDXunhTdB5d2ELT3OCO2GM6QJWCLAz+O
 9XFKLd5IntVB8cbrDJ7yDAAKWN5QbqP1tDrYNPV86xKzqVwaM3bEAQnCj5l9kphEKQ
 /gkordEzTUJN/n98KYNu5CtrYjbuD7UXPtKL5Lw4I+edRMZGAIURIUipaiJYKiLDcs
 m83cCMEXehqn+25qXmhxpSvcrX0N+NTx3BmkRQCgBMKBrcYGl0dP6M7ONqiSh+kwFU
 qolHFkUKoEUZWB9t4u+g3tIkNTB63gO66wC3vE38pPoNj8xRB6k/qsuWSS/N91Kpy5
 HJ+Bm1wxwQWvA==
Received: by mail-ed1-f72.google.com with SMTP id
 w18-20020a056402269200b00410b0a48d56so3264530edd.17
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 13:22:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fcG/L5ODzpr+LI/EAJmGBh5z8kctn/2OPAueI4k16fY=;
 b=HYF3Uct+4zcGwUceg3+DM8WuFBrGS7ZZVjZyukrUbKPNh5vZ7yvE3CHI6a1H8MHwlQ
 FBezWaBImUdkqqWihcgARBMrSapPg1dPfdu0VQVUjl5dOCWPlGEmcGpuA8mc3eW7unTi
 +n/CSOCa8Ty6H88mqb3RpdgXTkNXTsaolOswHjVmQveYn7PO9lnnxmK5n882TSGhmsfd
 Mal8G1YNxahaIze/ot5e8YQ8d6aPviENOQV2Vzba7ZV1lsmfw33UEf+1ryyn3V2gpwbc
 pt8ATqoDk/uy+jL63QroVaEUI9Xnl3mVjCUn7yQBS98fZm3/D6y96+zjODfnO2LADoUZ
 QCDw==
X-Gm-Message-State: AOAM530tloTWkY63BhsqyiXCEGgVPwE4wX684h5P9w4zmX+4ZjfXQ2G8
 HmYHTtI+534EKS4ImJ+AlnLv8UuVAfiWMpwOuKIjcq0umL7NBMBGFSxAddBlokCSUmKq+hi6ACN
 EvXxT3mNiNX+8B32/Y+v+aLN/6eR2PaZtcZFrfCzTz7/hyg==
X-Received: by 2002:a17:907:1b24:: with SMTP id
 mp36mr543856ejc.519.1644873729721; 
 Mon, 14 Feb 2022 13:22:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzl9EVISrmS6C69YAe5K0Xxu1OTn1NN475W1VUcNCLsva3N5oY9yHZqeVlKnpSoM0+sjZgNNQ==
X-Received: by 2002:a17:907:1b24:: with SMTP id
 mp36mr543835ejc.519.1644873729549; 
 Mon, 14 Feb 2022 13:22:09 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id v24sm2327203ejf.7.2022.02.14.13.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 13:22:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Philipp Zabel <p.zabel@pengutronix.de>, Anson Huang <anson.huang@nxp.com>,
 Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>,
 Rahul Tanwar <rtanwar@maxlinear.com>, Jeff LaBundy <jeff@labundy.com>,
 Yash Shah <yash.shah@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Vignesh R <vigneshr@ti.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v2 06/15] dt-bindings: pwm: rockchip: Include generic pwm
 schema
Date: Mon, 14 Feb 2022 22:21:45 +0100
Message-Id: <20220214212154.8853-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
References: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_132223_200041_C373376A 
X-CRM114-Status: GOOD (  12.96  )
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

Include generic pwm.yaml schema, which enforces PWM node naming and
brings pwm-cells requirement.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 .../devicetree/bindings/pwm/pwm-rockchip.yaml | 74 ++++++++++---------
 1 file changed, 38 insertions(+), 36 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml b/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
index 81a54a4e8e3e..a336ff9364a9 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
@@ -51,42 +51,44 @@ properties:
 required:
   - compatible
   - reg
-  - "#pwm-cells"
-
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - rockchip,rk3328-pwm
-          - rockchip,rv1108-pwm
-
-then:
-  properties:
-    clocks:
-      items:
-        - description: Used to derive the functional clock for the device.
-        - description: Used as the APB bus clock.
-
-    clock-names:
-      items:
-        - const: pwm
-        - const: pclk
-
-  required:
-    - clocks
-    - clock-names
-
-else:
-  properties:
-    clocks:
-      maxItems: 1
-      description:
-        Used both to derive the functional clock
-        for the device and as the bus clock.
-
-  required:
-    - clocks
+
+allOf:
+  - $ref: pwm.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3328-pwm
+              - rockchip,rv1108-pwm
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Used to derive the functional clock for the device.
+            - description: Used as the APB bus clock.
+
+        clock-names:
+          items:
+            - const: pwm
+            - const: pclk
+
+      required:
+        - clocks
+        - clock-names
+
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+          description:
+            Used both to derive the functional clock
+            for the device and as the bus clock.
+
+      required:
+        - clocks
 
 additionalProperties: false
 
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
