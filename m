Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD74C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 21:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=luorwTIVXQyPFCz72Kr5nvXBS2SsDWqEDJDYFCHtC9M=; b=do4GBQKo2w4NRF
	FGcKGAT52914c7poq3zkEXh0mqP7WnWqgpv23/1p94Tga7UmfHbpDU4DQM2A7c+6KOHVYakS2VQK2
	iOu3HctJRkt40p3VW+DWwgmMK2w8/Jv5UIYuCW0WCRaAAnuc4kI+GL2WGfidMFlA/Z51v84vnDs3J
	wJ0ZnbxIEJJrZ58vVYcpIsM2mkhqJUHswn8oKIpk/rQ3urtsmn1NkBlmUabaWzKrI+2DPEewKzZRU
	sTN5UWiHgiUMXB21iJiwC0ONI1XDWZn8ftr3G/HrZYssol9xvqK4/GDlGKfuMxT5pkQF+0XMfYYIe
	UND9tFxad6DVx2KQo2lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJj3b-00H4rA-Pg; Mon, 14 Feb 2022 21:38:52 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJinl-00GySi-Jy
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 21:22:31 +0000
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D083140344
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 21:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644873747;
 bh=0Dk3kP2LcmOur99Xj+FmPMKKDcu6NdY88HV+BhS2v74=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=djXZ5eIga0IVyb4o1EziJx71NlbRvlJuU7lpMHA9fORO+/f/QGcQsHy9CD+HsCyUC
 0MY1EWjUNaNAkSV3gQUjp2qI4zA87MingvHNfB+vyF2DWShNvYLhBcabzaMLCKC9DO
 GJBQbx8G8mw1zNMekGI8ClsqwWC9VDsKdGCsNukutGwMJ04OZ7b6dQ59b3Ih1EoEkx
 gZU2ca1B8Pox97ZO1qeRGigz7YKJTmHFOyQ9AVajN+LW2c2/XmSnEqCkZqKAQP6nCM
 smX1mZtglICFoTb+8SZsI52kT1GbwW23n77hZ29S3JQOSHct1LAzGZ+17od6p0xv7G
 vxX5zhzrEcDqg==
Received: by mail-lf1-f70.google.com with SMTP id
 w42-20020a0565120b2a00b00432f6a227e0so5617425lfu.3
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 13:22:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Dk3kP2LcmOur99Xj+FmPMKKDcu6NdY88HV+BhS2v74=;
 b=USFhtXc6yYxkkuSXMYlJevdgqBW9KD5gOqAWFGEQP3kj7dcSwRal0B0JQs6E2pQKvr
 mDOKbM8mKS/oLL5zUEk2FV0p8wF8+XmEychHWI2QDP3xSPdJ8iWQQilrvpCT6FVnqy6G
 JBn1tTfN0n5MEvmHvxV1Nqpwl3qGQvioVsrJJkavEvkdvIDAQMTecKt0Br81I/kKh7jN
 MCpXD6d0HXmkWqqQ5lLHzk1soFbWjWVUZV4rjwYQeNmxSqTO4PmXExO3Y2yPtSwjb22b
 u+kgW8S11oKRJAYAnlXQJJhw7Eub6VoR9+wmRSY3SBW0rfLWQeD5pfLZzwGg4V92Iv5r
 AJuQ==
X-Gm-Message-State: AOAM5333jtRw0Cc+cOmFUsFp1n+g6gHF0WCXXR6awrjSp5BZ7Fjuh7Ho
 ykxTBZRJQFrS2yq43uOhN25RlHcCG35V2szaOcdNCakCEkmAk6nciCeHsLdhe/yvH+iOTL3UmUS
 46xyzURn1cr0fhM0t5WofEuoXSVwlqvGEO4OqhGnllFcWyA==
X-Received: by 2002:a50:eb46:: with SMTP id z6mr774714edp.229.1644873736959;
 Mon, 14 Feb 2022 13:22:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqQkxT5GkrKkpkI1jpRkimV8tYbLj7FNI3K2NGaV+hzyOeRr8raElR8r83H6B6TAN4ZZ/sJA==
X-Received: by 2002:a50:eb46:: with SMTP id z6mr774682edp.229.1644873736779;
 Mon, 14 Feb 2022 13:22:16 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id v24sm2327203ejf.7.2022.02.14.13.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 13:22:16 -0800 (PST)
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
Subject: [PATCH v2 10/15] dt-bindings: pwm: brcm,
 bcm7038: Do not require pwm-cells twice
Date: Mon, 14 Feb 2022 22:21:49 +0100
Message-Id: <20220214212154.8853-11-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
References: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_132229_822640_1A29860A 
X-CRM114-Status: GOOD (  11.60  )
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

pwm-cells property is already required by pwm.yaml schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml b/Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml
index 4080e098f746..119de3d7f9dd 100644
--- a/Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/brcm,bcm7038-pwm.yaml
@@ -28,7 +28,6 @@ properties:
 required:
   - compatible
   - reg
-  - "#pwm-cells"
   - clocks
 
 additionalProperties: false
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
