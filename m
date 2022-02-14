Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB046C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 08:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mym2ekleQVIfog4PvmiVIQArtO9r4sdMGOtXqFTUVr4=; b=XmkK5gUeoMYe5+
	rnPL87nzOXWyCNekLUoSaA3BRmjB42M460sNRZdLRN7VAyDK09b+WZE1+K24TwUNb8fSpgVPlkPMo
	y26HXDQT4mpodP61i4FFHC8NvbTKPlyKo+pr9Xxcf5OeoWiLBcYbVVQVfqTcnWAdJzaVCTwuyzyej
	gX25tVtGNnsi6txOMMtbZ9rv6WCnBGhvqo7Ah58S3rqQe6G12G4sVbSdBvl8YE6Td2twWl/2LAuDd
	kMuJ9V1EezvRhUNClsgnSj7PIPjiz3qrP7iXVpM/Wbj7iyITCqDeC1xdAN8l9avQg6+TplzIErO4H
	1IPwojdkI+ImGtL766Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJWas-00DrPC-Eq; Mon, 14 Feb 2022 08:20:22 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJWXa-00DpOb-R7
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 08:17:03 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 96711407DC
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 08:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644826614;
 bh=DkqOnedmg2q9ShhWATftW6XUUTgR2TrUisQLyEAw/GA=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=cxIZq0u3HmjdsAiPqVRsO/aDVPuLRl/+LeiUDRmn48lGJyS+LWSPc1huKPtqHCsyD
 1RL9MYmvIE0GLazWTFFcOql4+46B7CEsMpkO3Ljl/jFsVHrPlu6+CksYRuL8Ce0TTM
 e/2PcFDUzBfGIsxvmXHB+1GUC7Una9VABbFebmRgyvYieNViPFjtbhqlFzyljzdHeC
 ON89LnDH4jRPPlj4c1Iv/txDVSah/xCgfve2yarGDHQojJdk8kdTyCjlX1oA4k2A3r
 QJlsQx+G5/DP2itscrpxIl+g+EhPjPbY23SV0uLwgXLDLsi7i6UxYRTXE4R7fSJh+V
 JJZ+KOiH6Sm+g==
Received: by mail-ed1-f69.google.com with SMTP id
 g3-20020a056402424300b004107aa941ffso5237478edb.14
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 00:16:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DkqOnedmg2q9ShhWATftW6XUUTgR2TrUisQLyEAw/GA=;
 b=wTYyAHoZMebPvDV02kd2SbBso4h7snXQ/ZZRH4Sxu0t3qNKnR0yUn/asuGbuA4mUw3
 i/814WUSDKPFBNhUz/1pPtqVv8454Fvnd0jYsxdvdcbEJ9CWCdaZeDMf16uDhzTnByBT
 wfX3ETIzgBAQl0fTK9yu/nyC3yJibVxwOT40lwMeE5KkRF3/+ky8UVno8aX3DrV3cyEh
 VVwAcfAz7ZptIQjKYOE8CjfESQ3P6mxa99zY+y+NfusFNiwjg7uUzKa8dBnKqaHy7XzX
 wzma5v7/7tyqltiu6j+yIZjcgGT//1exMrShICcdU2YMuVFm/OK3X3F+Ff7EcvfnLjKy
 uwcA==
X-Gm-Message-State: AOAM533Gf8JDtAuusLOrrtCYMItT1CpaA/WCA5fYtzQyy2S1BSyfxaQH
 TALIKtm+MiOdLbupd+obOLLOSuzRrDe3fapZDgcD6qpITXkQRi1lHSMHV+cAQq56J4q8X2axX8A
 zub9FxY8cHGKZar/Ys6aaNhR5Jz1pMz293r3syxafxqSM1Q==
X-Received: by 2002:a17:907:86a0:: with SMTP id
 qa32mr1461131ejc.23.1644826614001; 
 Mon, 14 Feb 2022 00:16:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDJTIba5Olc1DBbdAqq71XRQ9UAPJIT4SQ1cNLOsvgwe2lpelu0Q6nUssQgmN6E/2sLjNFyg==
X-Received: by 2002:a17:907:86a0:: with SMTP id
 qa32mr1461109ejc.23.1644826613791; 
 Mon, 14 Feb 2022 00:16:53 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id t21sm3363642edd.74.2022.02.14.00.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:16:53 -0800 (PST)
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
Subject: [PATCH 09/15] dt-bindings: pwm: toshiba,
 visconti: include generic pwm schema
Date: Mon, 14 Feb 2022 09:15:59 +0100
Message-Id: <20220214081605.161394-9-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
References: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_001659_022858_B4A6F7D8 
X-CRM114-Status: GOOD (  12.47  )
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
 .../devicetree/bindings/pwm/toshiba,pwm-visconti.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/toshiba,pwm-visconti.yaml b/Documentation/devicetree/bindings/pwm/toshiba,pwm-visconti.yaml
index d350f5edfb67..46622661e5fb 100644
--- a/Documentation/devicetree/bindings/pwm/toshiba,pwm-visconti.yaml
+++ b/Documentation/devicetree/bindings/pwm/toshiba,pwm-visconti.yaml
@@ -9,6 +9,9 @@ title: Toshiba Visconti PWM Controller
 maintainers:
   - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
 
+allOf:
+  - $ref: pwm.yaml#
+
 properties:
   compatible:
     items:
@@ -23,7 +26,6 @@ properties:
 required:
   - compatible
   - reg
-  - '#pwm-cells'
 
 additionalProperties: false
 
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
