Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36064C71135
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 07:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZQp+wIo8ZaYftvpKGf8M7496RCBiZgMpMyHYhwvufmY=; b=mV2NDC1WbOD4/0
	Eg7bqEsHr99Hg/+AhfaHubx+vwPNSJCzmRibT5HfiCDBScnYez7aUbUb8HbP4Coc32RzYXpqz7tzI
	CZu9ElK7xc7mbSZAoA67ZULlmetdwUJUCYeRgHGr4VKc/6hF+lJK1fbdTMIERXceRIiQFiuVRisFq
	SxUSA5zc4c+cT40S6Myqe/bcbx60kGvqpu2RBEnKZd8LfBfyM+nXyZ7N6QEk3uPn7kKCwbf7+keMa
	iAJWQRXrXonmfCTQvJ9jj0gH1P43M30hwHaGPX5DpPJZ+LypoKfsOCFFWhtYYMrROXg7qE2Ij4ZkZ
	K7ZpfAMBb9merGqn92OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPFoZ-000000095Qf-3WnB;
	Wed, 11 Jun 2025 07:24:03 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEjU-00000008wqU-1IOH
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 06:14:45 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a4e62619afso22908f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 23:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622483; x=1750227283; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsgXI4B2PtLxGVvjlo+6E+TN7UEoR/brseumFotN0IU=;
        b=OMa8vz2GnduojZwH1aibHL18mG5cxnHOSyJYhaRj4ucPme2bDLai3ym3FKqbS1Zcfu
         yz2z+SJcrSa5sAK/tVGPKoFYGZTu0CbUzJ01bM/jVOShzvJVoVyVSV3/gFxs08MuBWl+
         dy151p1Cp1CW1b+jEj06UqS0FCXstuwQbYI9RJxWVmPJ7W+qbplKv/mYMzJ/xMBFi3te
         EwH/8tz4SnbNi8NhczPg04nA+L7t9CdW3g0gAJwQEgyu+nxjs0a9FpW9uBVydSGp0yLI
         w4kPvdpYoIICn/991c7ciFS+a8UyxTWtFP4IdlkSI+mP/7zBjDrIIiXlmGOWyPg3Gpn9
         MyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622483; x=1750227283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsgXI4B2PtLxGVvjlo+6E+TN7UEoR/brseumFotN0IU=;
        b=Jq5tPaICb68NDDYnhzNQDqhy0y3IRL/HQ7JRxmbgb6XUf30JX5o0Gmw9Xo/5v4oaHh
         +PDDbSJi2Ou4xckhlmFTavxAGZfZCJWmCAdMIrAr9Cn93Lxhrh8aPDWJKoWiONfyOIe7
         4Brd/nMANMCVSWTE6jD8j67L8t4EIP91wRHM225o9zeqVfI+YGfh9f1Og9fTH4KQgAio
         UyWyOCrwdfH7hUZZRXbaRJzdHP86ljQU2d0Ln2uSYDXKJSpmP/43lzreE3LOYH6AooqQ
         CPD6lxyc+MDAbd7hvUg+vQGu5HlIkeooyK/+VEcKGtdVGjYbLbMzw+AjlfDKi9K/xSY3
         N6HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbw3lZKVEENBXTw2f3325TizTi5wvlfxc5iJHQN7jqXHFNT1zmoZFilYnNfHGB7yansmVcLp90PsH4+A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1Wd3Ab0M9AcaSMvLriTBLnR+07sMMT6KIBsw/P9kN98lkb3Tx
	T2AAZ/7ujwl/J6jmHSBBnnjn/URsUeW1tV7XsAGxcYPspyoszFaC90Un9vMRa/K/kag=
X-Gm-Gg: ASbGncufKARk+xxxdZkx+/iFXpU7KtzDfN7EX/BqGJLQ4Kf7oXbFGwHn4Rl3dh39gW/
	Qb0vuaDU2az1hRu0GR/Z6dCPg0/L7NpxW2Hz2fa/x/Dxqiqqp2BS3TiIgV2oXOGkDv7L6/fxsth
	rRMRuEpYG7byetJSE4FMNcKmSNrx+voINOi52q9SYUj9SbC98eFpW2TSD8afcnIySx5Tyb3MSH+
	3rVLMuK03Xg1iB0rV+JZYxpxzRkSSx1xoGU+OfvrQvMTnz6VssJtFNtakpwFf1FlQ+amvfUMn59
	AwbP8Iv3/TV9R90uc4ayeQtq/hb4/oMUqz+AhwqLPCjOTROrp65USpnzB92yXcDVPlCtyv9W/ng
	WR2AsABs=
X-Google-Smtp-Source: AGHT+IFLtmW6b7D9+O2NLZ8hADlUJWZ1Zra0CDRSmw1bBjFKMHIhCxju9chZEeLj/rRLY7C0uzCZNw==
X-Received: by 2002:a05:6000:40c9:b0:3a5:22bb:8b41 with SMTP id ffacd0b85a97d-3a5586c6283mr512971f8f.6.1749622482841;
        Tue, 10 Jun 2025 23:14:42 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:41 +0200
Subject: [PATCH v2 09/17] pinctrl: bcm: cygnus-ns2: Move fixed assignments
 to 'pinctrl_desc' definition
MIME-Version: 1.0
Message-Id: <20250611-pinctrl-const-desc-v2-9-b11c1d650384@linaro.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
In-Reply-To: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2076;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=oujbO0vd7z9+7S7Dumee/cfvfloJlAjLJrEg6CF9wFQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6mfuZb7tQiO77XcefLLGrVblzxwrSovVkXX
 cwivTfGRymJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkepgAKCRDBN2bmhouD
 11HiD/4xfmHoNJDh/S3CTGyURdVO6HJ20Md3oC9K4sMgDqvNeAzwsNayXPh8CQBqxZrfrPtfTEe
 EKJouf9bclFwhb6t7Z+x4Es2OUbtNyIKSqtw7R3vlMtw96fS+499jkyjprTViJtSFMpSo96VYuK
 BN5NaTb+P6TYsoop5UmihTuguxkVBH8jl/aasttq5TSupl67L3T67CDxwwZ42gZT8mImJvH94aJ
 OUaV/cRxEBTcOSurX9xTvFzKS6sSdilSEQHYvTDt05U1fZ7B4FRiNdQf0zYovRIT4FQopoXPh7l
 kMW3Mx8XWrjuWUb3v55s7eohdKrymxUnopB+/tTpjd1LwdZPdVR5yLrlO8CReZHJaJ3erKp+3Fk
 sEHN3AK4RtYIjlUM+o/3V/eGhwdUqSSml3pFKNEIePrZ5SZQGzTBbjQFfBroRKa0yrKKzRvKD7z
 0wgIMguwbM8Iz6ynYPcO7YB0Ao/ugOxLGbP0PYjn94OFTWxINL5wpl+0ly+zsGAhMRxcWhmKvWS
 2ziJK2Xd8WxHchwpTv1vk2Z71cDm6mQWuzLUHbDGcbsPuKrXblGw+ujIpW4FOo/8OrhQjAXpBz+
 MHBHNsoSYjVI+Nn9wm0liTIbSji44ugG2ZEZyX2gqMIDf6qzqfrXGE4SSBlOScO/SxFfdugKToh
 vqoClCRF0JCU/og==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_231444_879600_710DD4BB 
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

Assign 'struct pinctrl_desc' .npins member in definition to make clear
that number of pins is fixed and have less code in the probe.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
index 04f4fca854cc05c6ccc75fbcb640b18fcfd37453..23ab3ab064b6f2b0aaa15afd6b9c582f1a1256b2 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
@@ -971,6 +971,7 @@ static struct pinctrl_desc ns2_pinctrl_desc = {
 	.pctlops = &ns2_pinctrl_ops,
 	.pmxops = &ns2_pinmux_ops,
 	.confops = &ns2_pinconf_ops,
+	.npins = ARRAY_SIZE(ns2_pins),
 };
 
 static int ns2_mux_log_init(struct ns2_pinctrl *pinctrl)
@@ -1026,7 +1027,6 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
 	struct resource *res;
 	int i, ret;
 	struct pinctrl_pin_desc *pins;
-	unsigned int num_pins = ARRAY_SIZE(ns2_pins);
 
 	pinctrl = devm_kzalloc(&pdev->dev, sizeof(*pinctrl), GFP_KERNEL);
 	if (!pinctrl)
@@ -1060,11 +1060,12 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	pins = devm_kcalloc(&pdev->dev, num_pins, sizeof(*pins), GFP_KERNEL);
+	pins = devm_kcalloc(&pdev->dev, ARRAY_SIZE(ns2_pins), sizeof(*pins),
+			    GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
 
-	for (i = 0; i < num_pins; i++) {
+	for (i = 0; i < ARRAY_SIZE(ns2_pins); i++) {
 		pins[i].number = ns2_pins[i].pin;
 		pins[i].name = ns2_pins[i].name;
 		pins[i].drv_data = &ns2_pins[i];
@@ -1075,7 +1076,6 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
 	pinctrl->functions = ns2_pin_functions;
 	pinctrl->num_functions = ARRAY_SIZE(ns2_pin_functions);
 	ns2_pinctrl_desc.pins = pins;
-	ns2_pinctrl_desc.npins = num_pins;
 
 	pinctrl->pctl = pinctrl_register(&ns2_pinctrl_desc, &pdev->dev,
 			pinctrl);

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
