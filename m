Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806E9C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 08:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hyw+TM8Xtv3TYNNmOUCcOTMNIisdHzZdTvHCiVXXFQU=; b=rn/Xj1hpPyqPzy
	2ZdYJRWWxo5HcF3jNGYxDas3dQT8Sy+joTUkoF34PLF9cFbMEbC6wxAzySZHBNDbQAPPzzZNF/urv
	xQflEy1iHl9/Qh/SzrrN7/V+A24muCcKEXyphaTFVvgi6e6nsmXAxgQ1b2L6fJOPUM8/g96EY7iP/
	Rkj6vG2oQ0ehFn5OyqJB1gH0S4fefpcxkbtrUxmrjkXXgn6e9vEzRnOE+tg1AYW6q8H+Zx873CXZm
	TkiyZnlpqG8oof+wapWb7b70KWHwieHthimEeP3RMug6s0k/jSBadlmePWmvSkgPNzb4Id79lA8yW
	0pUhZU4bad/ukvsvEoMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJWZP-00DqUK-28; Mon, 14 Feb 2022 08:18:51 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJWXa-00DpON-Hp
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 08:17:01 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 89E3840513
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 08:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644826612;
 bh=rXTrjGyqcJ3i7iMn5DJq5QR/kPtoX00uoKdkO1EvWnA=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=XguQib6tqbQdHn2xFczwuTV9mnJe52komOQN1koFGv95u6P2pbaz8YonvIdH3LHsh
 jphP7OwoTCNldHaEcDFVqdFgSXhiOO0jhZyhHIhK9Czvdfruq8jj+9jHY8nLiUo/gK
 vqFOfdB2MZE+Lr1LRc0El3+TKF+aU2Wg3OPKhU7/jXMx62+u/BFnMVY/xJJVoRksYb
 1kpzFSRf+syeTny0SBg0unbbNn4t/ANMMILrFG8MdYOrEX0qY3SNmS0K3p3CxpLR22
 gD0DrZlj6PLBVwRhiQZvOUaVOcKmmsKNXYTsddH3K1cRcfi4d6SDeaRudhJ6Zre+GF
 InqLUFQfdzOUg==
Received: by mail-ed1-f69.google.com with SMTP id
 d11-20020a50c88b000000b00410ba7a14acso1120468edh.6
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 00:16:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rXTrjGyqcJ3i7iMn5DJq5QR/kPtoX00uoKdkO1EvWnA=;
 b=qzMzkJpPCiQcUqg7ym2tO+7dTJih/dvGYP4KYkOGifgmkjqZrQ7DzHtSzjSxReEW1/
 y9lq18cjIDmXmZ+DVmwP6EIba7HIrmrpaJimbNzbAHXRdwhxBkxKm8dBpSrOeYKP/fIl
 W315JAqJ8AmqMf4cvFwZMe2WLbzDD2BkufPbjQ+oCDKLHUm7EHpGTYFKWzYOjybcctla
 Q3Hvmh8siOcvH3hvu5mJ+b37nqMgYJucJ7iIB+nJJb1hSlkVAgGf6PLLm3PqeGSZrf0e
 DLicev2k3GOZo+Y0X3QsEcgB+l1lllPmcAN31vgAoXNGEMV+eB82s3HLbdAAh3V6aqVf
 htrw==
X-Gm-Message-State: AOAM531hq4jiENvx432CwARGjoUEqmqfgBwmAHVwlXntRQGY1Dncpnu3
 8tzj9TKns5uzoGyXLhkZUOJfnw1On9tv1dkwaGqkatA2jfzqO9KAhv9KvJDxJfza8FcjPQyAmdK
 DsijyINZyWkJEwSMqNr+5ngclRPlBMtqpdciNWi+LQcoFow==
X-Received: by 2002:a05:6402:c1a:: with SMTP id
 co26mr8160860edb.442.1644826612062; 
 Mon, 14 Feb 2022 00:16:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwS9jQ9wGixoRtv+jL2Y9f4opmRogKX8GhZRCH8lW8x+aJuR/wbCf92drFjmIbNOrRWeCUm2w==
X-Received: by 2002:a05:6402:c1a:: with SMTP id
 co26mr8160813edb.442.1644826611896; 
 Mon, 14 Feb 2022 00:16:51 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id t21sm3363642edd.74.2022.02.14.00.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:16:51 -0800 (PST)
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
Subject: [PATCH 08/15] dt-bindings: pwm: renesas,
 pwm: include generic pwm schema
Date: Mon, 14 Feb 2022 09:15:58 +0100
Message-Id: <20220214081605.161394-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
References: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_001658_835021_251F3287 
X-CRM114-Status: GOOD (  11.29  )
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
 .../bindings/pwm/renesas,pwm-rcar.yaml        | 26 ++++++++++---------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.yaml b/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.yaml
index 7ea1070b4b3a..1c94acbc2b4a 100644
--- a/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.yaml
+++ b/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.yaml
@@ -59,21 +59,23 @@ properties:
 required:
   - compatible
   - reg
-  - '#pwm-cells'
   - clocks
   - power-domains
 
-if:
-  not:
-    properties:
-      compatible:
-        contains:
-          enum:
-            - renesas,pwm-r8a7778
-            - renesas,pwm-r8a7779
-then:
-  required:
-    - resets
+allOf:
+  - $ref: pwm.yaml#
+
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - renesas,pwm-r8a7778
+                - renesas,pwm-r8a7779
+    then:
+      required:
+        - resets
 
 additionalProperties: false
 
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
