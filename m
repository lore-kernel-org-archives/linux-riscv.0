Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3766C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 08:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LeOsJgBTC2YG9Y15wFsV5DhV9EXxlTnYTdow0ypjel8=; b=InM4Y5JjLLpUJA
	X4e9OMiiB5JuwziefaOCtySrpn2dtiTi8n17OHIqX6PHaT5r3Pn8TW435lOfO8fbDF7iZfoUpt7wY
	L0BbCwy2tIh+wieMkN4yOoTYHKTO9LBWjujO+YU0ONmssEFabh2O7qLefaS4PErzGBF+kwJ2+oNxZ
	9hDvv8apTbn0IK7wCXrvFtvKmE9gT/HYQGktjgc6nZl2R/ZkEggn/svaC5QK637J+jaA/7Hc53N3V
	rBri3zvxOel0E3GN5wlFd/1knPlOZau3sHk5iPMTo5wk85ZxUokxStXOLOyqGpAc/ve5ExG7hhQsO
	nYGdX/RU2wPcI2kqOeqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJWdY-00DsfY-D7; Mon, 14 Feb 2022 08:23:08 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJWXd-00DpS0-2l
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 08:17:08 +0000
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CE03640519
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 08:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644826619;
 bh=RUrvha3jd75o7xb7qinVq9MRNe4Hz0+UgFNjZM5U/KA=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=GHv29UtdT/V61WTDyx9yaS+IdCELdrolgeKusUgfzxrvCzeD6TVD4nvtUMOliGtUu
 o5eBvPm3iq9VbP9vpeskxtXqjDWTjQ5uvPwAF5AffgphbPlWHgFw3l48PvXbevyaQb
 45XOtHRJ38ZlhhSuQUjOMT7NrmK9L9tN9prE/kFldzP5FVUHKrZPvdB1cqiz0dLH7j
 K0md/jyE+UkVqZhYAW4Hgg2dIoHg1Nj64+88Ru4QUSoQ11veQcIHWcfwCsEYYE7txn
 Qu39hTgMLbmOplPLjq7AbODmN0S4OwecHAqsWrmIJvF3P3pXbdRQibPU+wa083XOvZ
 fvbMDMTRsxFyQ==
Received: by mail-wm1-f71.google.com with SMTP id
 r187-20020a1c44c4000000b0037bb51b549aso5670930wma.4
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 00:16:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RUrvha3jd75o7xb7qinVq9MRNe4Hz0+UgFNjZM5U/KA=;
 b=GWg+pQIdqDDwPkwmzyuNz1jgwUG32ddx1gqxUN9ss+Mh8A+evH5WI4cbecrbF17wNY
 QgnqoVvEbVKVMQJVssngb417jkJ0iDWzY0VViYdI+kkzhrmvkBUucx5FOROHkccbZZv1
 FF7g+Osra57awClzZw5GHAWTAuKVytk5MzBmVQC6SztMAqj5+m9FenMd2OBDGZb6L8lm
 1ZXfEXCNWt2MJzzeUqhhTs7PVeVUbkvLB8weFVatqGsWUJ+tqXua0GsJidH1j00AlPWe
 0bKMpzpbXACozdH8dOWcAg/AT8Qw6iahfZLI7/N1fZR6fwVH1iiqeAQzHa3CE96oFB9s
 FiQQ==
X-Gm-Message-State: AOAM532TqcU2NaFf6Kud6RUW8bsNVlYHEhUj7LkrS6ZKrc7C/RCaRbYV
 o4WTAqk+B+xn+BkiPCPeukMYZXpILWGmZ+YInYECv3JPH/OD49CHfY2BvDVwc7Msq4TZF4uwPnF
 JTKVVBqkP4MLQD+RLwir0lFybw0f0feCjDa+qjBdAspBgSg==
X-Received: by 2002:a05:6402:2683:: with SMTP id
 w3mr14323053edd.405.1644826609105; 
 Mon, 14 Feb 2022 00:16:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzkuxNo1QP+7t12yVjZD9t3Y/Itl5ApNf4frcHdZJDQgI3MTIUIYVP/fV2AVsdZ2EHF8ILcQ==
X-Received: by 2002:a05:6402:2683:: with SMTP id
 w3mr14323005edd.405.1644826608899; 
 Mon, 14 Feb 2022 00:16:48 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id t21sm3363642edd.74.2022.02.14.00.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:16:48 -0800 (PST)
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
Subject: [PATCH 06/15] dt-bindings: pwm: rockchip: include generic pwm schema
Date: Mon, 14 Feb 2022 09:15:56 +0100
Message-Id: <20220214081605.161394-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
References: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_001701_270508_A61BE048 
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

Include generic pwm.yaml schema, which enforces PWM node naming and
brings pwm-cells requirement.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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
