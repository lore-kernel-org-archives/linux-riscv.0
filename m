Return-Path: <SRS0=C6y2=2T=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37137C2D0C6
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 29 Dec 2019 08:18:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0938D20748
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 29 Dec 2019 08:18:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uIeu+DTf";
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EoJ20ykz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0938D20748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nA6GTFWnPYD1qaFXEcR2M91m1jofmHZ10xgJuVtHDf4=; b=uIeu+DTfembPOU
	r8nvwJHwBvg8yU3i5nesbGwrnH7LU6Ci9BwwAQVrdiOD3Ypy6qiERf83/arInWygz/0Kuu6warpX/
	Qb1EZsQmJ9Ddkbil/309s8M+QUt5hRmCnS17F0vv9PyUs4/df8Qj4siwvpoV97+Tv7izEte9o1Ad5
	wUjUOPiajiUKRxID6xh836GgrDlgIWxO44aMRzZVg6v8iCxOVDTsRDCEMXn+MWQfNpDo664/jEfVg
	XacHCJ3IM9WxIf2tDiFp9Bpm0Q0zii6tufs6Yteua5A7aqIF6t5YeMoxJXluaVv7ENaNZDMnjN+XE
	qctXoDXlbs1mhtKAxtWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilTmL-0005Fc-Dp; Sun, 29 Dec 2019 08:18:25 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilTaf-0000qb-Uh; Sun, 29 Dec 2019 08:06:23 +0000
Received: by mail-pj1-x1042.google.com with SMTP id r67so6626681pjb.0;
 Sun, 29 Dec 2019 00:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nA6GTFWnPYD1qaFXEcR2M91m1jofmHZ10xgJuVtHDf4=;
 b=EoJ20ykzty4LDXb464VSekkPU78MYEIXpid7/8bd/VwMGSGiE4zgDkUKpwKxKieTds
 CTH964cbdpQG2yrkwaDcNEQ9JFz0Yblm6OekguaCnkqmF8WjH3VhQyxeWt7PUF2cQBCK
 xWNMIid/vQhbtwPTHrm56VMbV9kEnRugE0/DWNZ/w7jZIc/xIxFB4MhLkvXpRSW0ReUe
 DiwUT2BXf4mkWXxiGdj79xEVkQSL5k1TaJpc+/Ap419iCR9L3njXec/P2Npjj2RIU/Wc
 hj4Z565yL7f5pqcs0SkowL/QQAOKW2nU1ACYgMMW6NYduMKkgIR6fgjzKIanVruKQA+m
 ZtSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nA6GTFWnPYD1qaFXEcR2M91m1jofmHZ10xgJuVtHDf4=;
 b=JtbIDiORqCWc8vZIUMm9r2DsVliZyaG0JOcxjoowuBbegLtfzQfcRhbmol9M0qZejb
 cPRo/qGbw6stDCTyz12vGtvejYtbd6uP3sCssD9PGWAItRYCELIeQWkgQT43KF2OhJNa
 m9I9MCGd1YG88h/raCWR4glROYGpUDCu8EIhva99dfj30zQWNZG05ISfkI4JuDIR+I+x
 Nt5bM7SiJDihIm5gRQn5KbeGkmN4oCdr1uLRIsfvtfJhAA5iKg+NdRRprLIGKeuzuTqE
 eEjrF4sbQpKPWdwL+iHQ2vOtRYGEAE5pPH/eks6XU9gQfQHUPVL3Km0XXmiJB/DNxZCx
 0IyA==
X-Gm-Message-State: APjAAAUuqTe3eR3gZiI+a/DW6aTU+ws0MS987+wYqhoxiTiAILiY0rsK
 xTrNAcK1U+8P3MXSwVf4MpU=
X-Google-Smtp-Source: APXvYqxiuA860xAI7DlETD65hf7fsheQt96c2h3gdtB5uY98twAIIIJUm/SIgtNjjfbaqGCDo+0p5w==
X-Received: by 2002:a17:90a:974b:: with SMTP id
 i11mr37927812pjw.47.1577606781207; 
 Sun, 29 Dec 2019 00:06:21 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id 133sm46245208pfy.14.2019.12.29.00.06.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Dec 2019 00:06:20 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: claudiu.beznea@microchip.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com,
 nsaenzjulienne@suse.de, shc_work@mail.ru, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, vz@mleia.com, slemieux.tyco@gmail.com,
 khilman@baylibre.com, matthias.bgg@gmail.com, heiko@sntech.de,
 palmer@dabbelt.com, paul.walmsley@sifive.com, mripard@kernel.org,
 wens@csie.org, jonathanh@nvidia.com, linux@prisktech.co.nz,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH 05/32] pwm: ep93xx: convert to devm_platform_ioremap_resource
Date: Sun, 29 Dec 2019 08:05:43 +0000
Message-Id: <20191229080610.7597-5-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229080610.7597-1-tiny.windzz@gmail.com>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_000622_020357_2A32E52B 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Yangtao Li <tiny.windzz@gmail.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/pwm/pwm-ep93xx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-ep93xx.c b/drivers/pwm/pwm-ep93xx.c
index 4bab73073ad7..c9fc6f223640 100644
--- a/drivers/pwm/pwm-ep93xx.c
+++ b/drivers/pwm/pwm-ep93xx.c
@@ -169,15 +169,13 @@ static const struct pwm_ops ep93xx_pwm_ops = {
 static int ep93xx_pwm_probe(struct platform_device *pdev)
 {
 	struct ep93xx_pwm *ep93xx_pwm;
-	struct resource *res;
 	int ret;
 
 	ep93xx_pwm = devm_kzalloc(&pdev->dev, sizeof(*ep93xx_pwm), GFP_KERNEL);
 	if (!ep93xx_pwm)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ep93xx_pwm->base = devm_ioremap_resource(&pdev->dev, res);
+	ep93xx_pwm->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ep93xx_pwm->base))
 		return PTR_ERR(ep93xx_pwm->base);
 
-- 
2.17.1


