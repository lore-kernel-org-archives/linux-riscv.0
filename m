Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7ACC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 08:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y8mLMHDvmzT6h1AOWuMNs3UHU00be6/7wDIfBIz5DQE=; b=ax3zRR4qlSwzeH
	sE8E3TLN7AHD1TiCaCoEpAjFSvFudpicyXLpWHszQ3Rw3VxWV+1wU+99ehWcDzQZwFwfVeLl5kJ/R
	xA2KG42WCkiJjly1tdfznUgu35VGGxMB20o2m5WPW1r0WdLiG3HbB78smDA8jaUhkFBvcRU7VPnvj
	f86ZXzUIEIKGmHQ79olQ+YCSTJYUXfhnJ+OGnG2XNtqcFN/U2vXK4FO6X9sCEBjYonjhF5SFHAkly
	cqni+6q1hveBiKXCf6Yg0U+YyuMvWmTniNiaJeMls4XV0abUyyCY3GL7HLNuy2ZItRbLf48kRn+st
	O4E/0X1f4vMKYFLxpkGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJWYe-00Dq3e-VL; Mon, 14 Feb 2022 08:18:05 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJWXW-00DpJC-Qh
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 08:16:58 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9E9E840341
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 08:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644826606;
 bh=05sXSD4PIb8v0ICor9Lwlzw82mhcHvJZHXpVeLkjK/k=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=aLG5u0EEqZ+k+XDmUs8TGF/olqL6f1JhByoVCnw9hRu+TY0pT4ZV2DOs8I59x6qg8
 ev50SgiBio9wxOKqlajm6bSvh+bzyhNPqnpX8rBdCILKEAwMchThCwGOMvVI3+g+WZ
 xpW0yKa6LRzuwzXQeb4lEsWWsR0l8i/aWNIrW6mOFYwob3bGx+qeCaEKd1Fed+SUK9
 OyY0RD1aqUAqOzxENyh8XcwUB1H2ychj+BAtlwVb4dtoEUnwq6eVUlqbvM35Pk//5W
 onEsrVi2pyUH8fk9MRC02LiKDZZQDx9+7Vi97DGDEXBMy2HMEkWB2JrupAm0kcfb02
 Kz9CXUffvolVg==
Received: by mail-ed1-f72.google.com with SMTP id
 z21-20020a05640235d500b0041092b29ad6so3539464edc.19
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 00:16:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=05sXSD4PIb8v0ICor9Lwlzw82mhcHvJZHXpVeLkjK/k=;
 b=dTgitErtEsu5wdDICq0uc1Q1khyJwP/wtfgkTIoAYzvM3n5ygzDqQSuJ2giu8AdtHO
 c4pAOfzPkr7j8ebvhg3jU9N8+XXQIu7FRosARQPADeQ7PumLJu+K50zfqbMG0bL2/GjT
 iupbQ+0tVvsTRuwQ08zmm2bIXi0bfZnTzm3ly1mamh9H2DbtM/BLDV0co5ZON+ZNZbB8
 pamkNk8lZ1jkLbHsDNz1uiPgPhHHXibnjM8VLKeNV6yER/LkOpTKsaC7BC2k8oi8Q3V+
 tNgLBklJPfejI4CITZI20qvoeGvdSs1D/Yrj5YwnWsS/Sxkk6hfvDOw7/HVs5znAmLa+
 dMdA==
X-Gm-Message-State: AOAM533J+W+qjHW2X+/382EeyuJzuN6fITXABP5y4b9wVsCXmAeKm2X6
 1H+s+SENQdRE06JdnBg1jE8WdZp5RLsm1OGRwM6ZZxqahg5+i94IZL5fPE5xKHLr2+XIbiQBrAh
 Ehn3+Lp6tzJ1N/gtyNEKv0BEUOLCdkWwUxfHvH+0E/YvXxQ==
X-Received: by 2002:a17:907:3f09:: with SMTP id
 hq9mr10433655ejc.388.1644826606212; 
 Mon, 14 Feb 2022 00:16:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+ZKNecHLHlMF1p9Zdz7frO6KM7oerLABDg+IKR8oKqn7czs7ZE3TIi9GnMTbsd5cUpiNWFQ==
X-Received: by 2002:a17:907:3f09:: with SMTP id
 hq9mr10433614ejc.388.1644826605951; 
 Mon, 14 Feb 2022 00:16:45 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id t21sm3363642edd.74.2022.02.14.00.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:16:45 -0800 (PST)
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
Subject: [PATCH 04/15] dt-bindings: pwm: iqs620a: include generic pwm schema
Date: Mon, 14 Feb 2022 09:15:54 +0100
Message-Id: <20220214081605.161394-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
References: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_001655_038255_0EF2759E 
X-CRM114-Status: GOOD (  11.83  )
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
 Documentation/devicetree/bindings/pwm/iqs620a-pwm.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/iqs620a-pwm.yaml b/Documentation/devicetree/bindings/pwm/iqs620a-pwm.yaml
index 1d7c27be50da..0a46af240d83 100644
--- a/Documentation/devicetree/bindings/pwm/iqs620a-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/iqs620a-pwm.yaml
@@ -15,6 +15,9 @@ description: |
   Documentation/devicetree/bindings/mfd/iqs62x.yaml for further details as
   well as an example.
 
+allOf:
+  - $ref: pwm.yaml#
+
 properties:
   compatible:
     enum:
@@ -25,7 +28,6 @@ properties:
 
 required:
   - compatible
-  - "#pwm-cells"
 
 additionalProperties: false
 
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
