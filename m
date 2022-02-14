Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082DFC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 21:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hyw+TM8Xtv3TYNNmOUCcOTMNIisdHzZdTvHCiVXXFQU=; b=3w1S7C20MIJ/4f
	mRe6yxpMvqLpIrnNF7lhMoHj4ZDuaajtMdfxvKsTZvUetd0zskrXxmUGoq8FCEIGHjPNm8Mm2yU1w
	Lsi88keZhOIpdboqZp20UrSCcRCFDVHYnfhfqbCIJBQTbAWW8BWWVY+elwS0WDUOAS91i+DyL/bNF
	VzIFemRSU8f73aneZE7HqkY2nAlcuTM+vICY36Q8GJvE1sco960snODifcojidcuIpCiEKpXxkZ3E
	bmeGnxCGD32tI7yFWH6sgCB+Phx5ROHOQ5szlFKZUftzs8TLcqIb75J47Wrrq0yApNQ2IVvYkrsRu
	yijhOtUFzImL4agR4kWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJj1P-00H41P-F2; Mon, 14 Feb 2022 21:36:35 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJini-00GyPO-3n
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 21:22:27 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 55EE7402E0
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 21:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644873744;
 bh=rXTrjGyqcJ3i7iMn5DJq5QR/kPtoX00uoKdkO1EvWnA=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=Zqz7MgTVbdVyNvbnsoHSas4wE7LTxrPVTViPN3I/zc7QTZgQnG9v4sUc99M5ySEWZ
 ty+Vtmt0MdCZdFHgxW8TOswMj7j7pd+iNgAwRjcAwpJKUEvW4kvQD/2D45Zv1uxd8s
 HMEG5aDaS4NpYmY0ai83+ZGhZ4Cx3idQ8g3DNn/pZOe3giVge3XOtv2notWPL+yAvD
 CIqurwcLO4qU5sU9atPEszqydUdzpL5eP1aU+9rK8dkxQSRwgqVs5a5Vkf6QkEdFdD
 yCxH8IlCRV1lxXon+6cC0mWeymap/OWtHXAnftVGGmI31VI5rm8NlnPtZKTCre+dpN
 WDLNmV5FtXWxg==
Received: by mail-wm1-f70.google.com with SMTP id
 a8-20020a7bc1c8000000b0037bc4c62e97so142605wmj.0
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 13:22:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rXTrjGyqcJ3i7iMn5DJq5QR/kPtoX00uoKdkO1EvWnA=;
 b=0VHFTh3TOeuU/mwbpG8B9guqItXkQeSK5JRy8wzajRp5Bf24E9ymJjYwuvjZbDKYhA
 wJDYhpWRX55Yrnz9di6/krVfcotUc57QrNy3b/0Xtk3iTid85kA5ai5qyDthk8kfVujx
 OMjpPplqZNzxijr7jcwojwIBg4q/2d+cyiUDge84Z85XGi/rwoG2KFve0tklgxUr4DzM
 rrJ+FzYg3gJIGLl6C0Lbps4EpK5bR0pQtBSGtQ1aHftwknwActlrUP/hE/vyhwP4fJH2
 ra518b0dVPGhCJDS/I7DHmjDFv6Nltc3rYTPo9InpDzCIztiyaZqN9IQeLy67TxUDLgF
 aANg==
X-Gm-Message-State: AOAM53279b/baPjW03+BqgGay/mYgGQsoI+H1x+AvnK84mxozdzkrTBQ
 nGUWyoJuzQt9ZiVMex36VNhehS0/aQVWapPFsTstvDmP6gzIxYucNUWLiHBAmAzmgCB7wIgSVSo
 iehB188Ytu2hJ1m3vNdVX/LFIwTR4h5SPQmpQSpt6C4+1NQ==
X-Received: by 2002:a05:6402:34c7:: with SMTP id
 w7mr750369edc.397.1644873733081; 
 Mon, 14 Feb 2022 13:22:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhpmbRreV1af3l7NRnMOVACbyZVoBFnimePwQQgpSt+JN3lhtVVBwqSExQGXUXAJA1H+Jnfw==
X-Received: by 2002:a05:6402:34c7:: with SMTP id
 w7mr750338edc.397.1644873732938; 
 Mon, 14 Feb 2022 13:22:12 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id v24sm2327203ejf.7.2022.02.14.13.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 13:22:12 -0800 (PST)
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
Subject: [PATCH v2 08/15] dt-bindings: pwm: renesas,
 pwm: Include generic pwm schema
Date: Mon, 14 Feb 2022 22:21:47 +0100
Message-Id: <20220214212154.8853-9-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
References: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_132226_349062_66FF3E26 
X-CRM114-Status: GOOD (  11.21  )
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
