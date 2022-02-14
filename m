Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65063C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 08:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vmn4ZTcRjDj/T1IPuXbXdCU/DQXTI2sYxEsMdh8EjMY=; b=S2e+A24Yc9EZgL
	h7sTgf4diLZoEzgtlIAK9mE/knRp+DV/Npka2beIioonixtH1w90yKRLquodHGgptbSff3o7cD703
	9OgaTDfMK2CDQPfG1PMivRhe+PQ9/tinLEGhEeQ48/ER9yxpLL7K7xvY2m5s5GmEG3sg2LB2zl14j
	DRX/iwjBiWB/bC5KRk1t2fGru8J7opc8r26UhJ1gXdZlEKU1HRHRhXEgGJIIp3Kppi+7wDzOZv2YO
	k+3LwzcFKd0Wqh8al/XSQiwZKntuBMNeRe9d0SnupVZdVmbpD/3NBrx+K5bBan/jFB3oeN3+TC+q2
	bNWjbDt18HIe0ELC8qsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJWb4-00DrX7-NB; Mon, 14 Feb 2022 08:20:34 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJWXa-00DpOQ-LN
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 08:17:03 +0000
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2F9EC40524
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 08:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644826613;
 bh=3IKrMG5sgA9nuG1n0JrwWMFi9IjPyF8pWWijGFM2qQk=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=i79I2qa47alM5wkWj2yK0klr14FGqox2CzMSWnj2Lt2l0NlRGUoS7wFRAGkR4HFVN
 XVCOHVKhvOfO7U33kG8pHvmmR6xdQzoCtVYiKrFQingC2luIidjo918UqTkgG5Xcqo
 /eZB4cy1UkXHSGL/9b6laxvTd1QX5TUauviCdV336gKWT1wdNBlMDcCjYFdJu3vwry
 T/cRrE5EGAt6WQHAbHrOLBzEZsoUoDPJ7PinBq7LDbmpzIFoq5GBxQhR3thQ+rcGRu
 sNQC6blE9BU4JQfQa0Y9q2qgn7S/pZ8v2c3TJGOvi5JVQ//Xv95aM06jzN0gdS6Bfy
 /jfsT9tDDw+Dw==
Received: by mail-lf1-f71.google.com with SMTP id
 z37-20020a0565120c2500b004433b7d95d3so1025651lfu.4
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 00:16:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3IKrMG5sgA9nuG1n0JrwWMFi9IjPyF8pWWijGFM2qQk=;
 b=vXp9XHovlRwJpLt0ybTlY3odySPedzYiXx7y2BCn0Y8o+8cfBOHAXlPMc6qgRoR/MQ
 bMM9eyRe1NkyaBbbO6r7DY3TBpZoD6TpruCNffrViUaPcSSzHjYUS8NtCULarP1F6Vor
 TIs1gP0gLsHEA7Q+J6sPlfe9vUcuI+ebWUgBSh5cDhSUs3X4zpX6srrSd6kDNJBVXUn2
 dxcaQ/zJz95FCg4BzEOdBoBSIcPyD0DeQ0Frx7I+DyP8v7TAeA6h+XIe1ho5AvEG7H1/
 TrlZST8j14uNQroeR+XObK28ULUHGUlPg4VfHAA1YP7h4QYIUQoLGij5RDCN00U50Hke
 zf5g==
X-Gm-Message-State: AOAM531yvUH//026PKdf6CnIZIOACbsmNez0KNkH7nV1L052Dc42m92Y
 tOg+mGRkNannnH7VpQcFCKmIc23Mb+MSxaXJduHUX0k3hZJBAczRW+ZJEHiDOf7APDFEoQgRQbH
 MpSx497V9xfctHJ+DV3z66CWhp4GLAMzZLUEab25MhA13Sg==
X-Received: by 2002:aa7:c90b:: with SMTP id b11mr13704777edt.378.1644826602009; 
 Mon, 14 Feb 2022 00:16:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgHjuUJhQbPl50s1KVPp6UQx9W5/7E84exEe5joEuH25s16vRC22QO8sTEVBDCljC9Ui8TEg==
X-Received: by 2002:aa7:c90b:: with SMTP id b11mr13704730edt.378.1644826601747; 
 Mon, 14 Feb 2022 00:16:41 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id t21sm3363642edd.74.2022.02.14.00.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:16:41 -0800 (PST)
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
Subject: [PATCH 01/15] dt-bindings: pwm: allwinner,
 sun4i-a10: include generic pwm schema
Date: Mon, 14 Feb 2022 09:15:51 +0100
Message-Id: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_001658_892579_5C8D3BC1 
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
 .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml | 53 ++++++++++---------
 1 file changed, 28 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
index 800d511502c4..e93e935564fb 100644
--- a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
@@ -52,33 +52,36 @@ properties:
   resets:
     maxItems: 1
 
-if:
-  properties:
-    compatible:
-      contains:
-        const: allwinner,sun50i-h6-pwm
-
-then:
-  properties:
-    clocks:
-      maxItems: 2
-
-    clock-names:
-      items:
-        - const: mod
-        - const: bus
-
-  required:
-    - clock-names
-    - resets
-
-else:
-  properties:
-    clocks:
-      maxItems: 1
+
+allOf:
+  - $ref: pwm.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h6-pwm
+
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+
+        clock-names:
+          items:
+            - const: mod
+            - const: bus
+
+      required:
+        - clock-names
+        - resets
+
+    else:
+      properties:
+        clocks:
+          maxItems: 1
 
 required:
-  - "#pwm-cells"
   - compatible
   - reg
   - clocks
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
