Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45765C5AE59
	for <linux-riscv@archiver.kernel.org>; Wed, 28 May 2025 10:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=quKQS6eky3cRa1WdN3Y3WTEbnKKHytwmIFCzk6qc0zM=; b=MmWfOH1JN5iZiO
	zJoSxYWD5NFDmCELS6o+UBXjOdm+wAEX4HjzVFqAUrfObjr+/Bmd0Pa+SjgladuXGgikzzD7Op2oo
	ttVEaAGXvRRx16N0VYvU+9TSr54GVexd2kZXk1+fdB/1gifgbTvOYeTeELsYU7eN0O6wIza7bNqzk
	pQ2E3rXAOOwZ/M2sTVzP3KRg65qKEQXNYZ3PvONoFzaLXj8dIBh9Khr1O793TSLT56Te5b5Zab7ht
	k1YlodBDQdMHMWXtXmFnaTLJwqeiV85oYW3SLkgGZBkdU6LCEhaG7UXplrhFWZUc/BrU4VcAZwHyo
	wk6zAqG0Nl2ltk/STI2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEF6-0000000Ct6b-1ugl;
	Wed, 28 May 2025 10:42:40 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEEY-0000000CsUj-1XDc
	for linux-riscv@lists.infradead.org;
	Wed, 28 May 2025 10:42:08 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a4eb4dfd8eso29530f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 May 2025 03:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428924; x=1749033724; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mUavy7B2LDMdwrM/5bMX/h9Rv/lKrrO3+mfX8hz6Iuk=;
        b=wCJFUcQGDWGZt9jOwPTD5Gyu6lSwoaNu7Fu/varxDnBth+2sODsTo8mak+XQTKoVcW
         BlibNmMjt+IamL0a7OfUmmWaZ4LnFWB8RL0dRgLzK3ULGPNWjEh+Mc16tnP01zN5oq6v
         d1HF+qzUIPo3sp3UE6/taHh2/zN8F0e7mdSDvkHsUZWtMi6caUtJkhnphyQFucdRpjUt
         5fu7c4gRr4uxSX58dObjmu+2uwIaAzh3oDiQDa+HBIzR336571aOKa/WK3noLK1CXw4m
         B9SL+ze2sj3K6J3zIxOgawD8n6fG0xYka6OwaG8635p5yjBB41pcp2Kc18mcLYz6cxig
         8c7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428924; x=1749033724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mUavy7B2LDMdwrM/5bMX/h9Rv/lKrrO3+mfX8hz6Iuk=;
        b=wKA4BDHYS4S40CxDj4iyndEsuPiQvTwj4KDwEQYykvCbpxzlPRIl2omDcKYF45CwTU
         qji85+js4i+0sEOWDfcv2EbRuPNTfzZXmwjt74Fm/v6nMk64qU0Vzw9e82bJTlNAllsI
         GRZDRLkfXER0KZ9thbpTnwehfLMSGvuOajDdiloN8xpm8UHJSgaxch/BzPynzzypcVGb
         ZsOCdt0NumMp3nhUvd56NWYWfkIhQA5v2NLo6UgGTjT0rWoYqNwfgCJIingecYeubPoU
         J5zTKc6rNI75UzxcVBSgEWw1acScWnsFoApKEVKOjEhgOJBNzPlf+y5CQrzZJYi3xvRM
         UhAg==
X-Forwarded-Encrypted: i=1; AJvYcCXCg4TcddHK9D/mwoK593W5ohve9hc0BAg0qUBRM23Amse/noPeBDarLK5KUM0P3UzsG4Y/4rk7CgYg4w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOS7+jUVFn/JQx/kbf6//JvSkH2Atz5VrBcAIkKuoiWTrc+UHr
	4pJ5y8kwC9gVQGOnPkb50Vk3Ruiifb+DeD5JjImSyl7K59cqIlAZoieeSU3PH7ZS/Ew=
X-Gm-Gg: ASbGnctdtr8KcEWIiclskYEdd9LgYk1ty/2lCEptrt262q3e2UAilwM1Scc65KYzA/4
	RGXrmtMlzk4CzE/6GtHLmr43IrLaRlov/3Y45/HNzId1rfYSyKWDcN+kiuwMlhR+ka/71/gXhk5
	IXmferapCE9AS5M/tvYkbg+yZGlp36OZUlECkx37QdYkfM7Ilma17+Sj2zld4xGdRL9Z6evg46t
	q3WFo6ZaUZigHGQv7vMNw4eXvYBAcustLr47+e7TJKjXWEoiGwoibm6axdIs7HbXGN7Gv/M1mt6
	/zDqBr36a18rLi2fmecwqvWmEScqUGvOjbMHJfwPpA4Hj2RANLK08DBn3p5npwl1cSi5G8ZCJ53
	HHwy0rQ==
X-Google-Smtp-Source: AGHT+IHLM1FIhtqqL05DozCCpKQWY7ameEkMInI+HoHz6qQ+L3KMHdThy3m2Nh51nEncLqfROzqPGg==
X-Received: by 2002:a05:6000:2481:b0:3a4:d4a0:1315 with SMTP id ffacd0b85a97d-3a4d4a01404mr4061984f8f.6.1748428924388;
        Wed, 28 May 2025 03:42:04 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:42:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:06 +0200
Subject: [PATCH 10/17] pinctrl: bcm: cygnus-nsp: Move fixed assignments to
 'pinctrl_desc' definition
MIME-Version: 1.0
Message-Id: <20250528-pinctrl-const-desc-v1-10-76fe97899945@linaro.org>
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
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
 Lars Persson <lars.persson@axis.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Damien Le Moal <dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Michal Simek <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2020;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=AZcW1cQpsVdpMlMJDu5jWEgQJ6HALLwy007zMLKEIYo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhRNPIvcbeE3O4oOSmCsEkL1h48gBgln+KJb
 OsiC6vomEaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboUQAKCRDBN2bmhouD
 16dvD/4+GqEjL6kp16pjaPce/8s4v6Ut3thCgUQUhMlVSN3KQ5BciDx6aymKzKDe6Y385QtYh6/
 TTbLcF7wMxIsiys8zs4Joov8pnnsJFMs89/RxAHCkv0jVyWz1R82g5U3UxeAzVHOSClfzkG1ssx
 rukU7ZnCn8leZIhYYtv1kPDJSN5TvvmrLMqPDoeXKp/lmIMXMAfV7gA+hzg2SonnOP8zFIU/Cgk
 Bsnu0o5djTismPPoU+dVEC8OOtOQs51mMYYsJ3bpo6w+8AXjqnqHArInHHG+DyKfsdfpU2p8NqJ
 CLciuXZuNgs3KdwBmhn+8j50u4rJxhfzbl96q5Ni+ucZpmPmB8YxYQLGCUBO4LZ8SJQopvZsb/M
 1D8cTgPoL8lL1WXelX1KC3g47FDzSwwJt3+NZAP2BKjEwfdLYApjYJv1SJm1HhO2ce5DwkkZVsS
 /ROWyFqUhckAQmPUVie/ZniAhKPP5NTi+3jDxP4DWLXZqnPD/cogYNuFscfAWmwOnNkRuuWvYaP
 ji598GViXmlJqT0LLbAldcUL4DyM0ovnfcXI8abCONH0ZZVFzuPQ3PrnsyUe2LKxqoq9kV1uqCt
 wrnlxC3wix5d5II5R2Z1TpjlzSjyFuBlPhYTuEv/7Pl/umwQK+v7ZNFofeJ7Q4gFZDAw7FZIXgE
 CEW4yw0hnhFONeA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_034206_524402_9A245E63 
X-CRM114-Status: GOOD (  14.24  )
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-nsp-mux.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-mux.c b/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
index eb6298507c1d1873f9d5a90ec724b36af6d4da48..9b716c0d2b9456b9e64ca1094375effefdf4817c 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
@@ -525,6 +525,7 @@ static struct pinctrl_desc nsp_pinctrl_desc = {
 	.name = "nsp-pinmux",
 	.pctlops = &nsp_pinctrl_ops,
 	.pmxops = &nsp_pinmux_ops,
+	.npins = ARRAY_SIZE(nsp_pins),
 };
 
 static int nsp_mux_log_init(struct nsp_pinctrl *pinctrl)
@@ -556,7 +557,6 @@ static int nsp_pinmux_probe(struct platform_device *pdev)
 	struct resource *res;
 	int i, ret;
 	struct pinctrl_pin_desc *pins;
-	unsigned int num_pins = ARRAY_SIZE(nsp_pins);
 
 	pinctrl = devm_kzalloc(&pdev->dev, sizeof(*pinctrl), GFP_KERNEL);
 	if (!pinctrl)
@@ -589,11 +589,12 @@ static int nsp_pinmux_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	pins = devm_kcalloc(&pdev->dev, num_pins, sizeof(*pins), GFP_KERNEL);
+	pins = devm_kcalloc(&pdev->dev, ARRAY_SIZE(nsp_pins), sizeof(*pins),
+			    GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
 
-	for (i = 0; i < num_pins; i++) {
+	for (i = 0; i < ARRAY_SIZE(nsp_pins); i++) {
 		pins[i].number = nsp_pins[i].pin;
 		pins[i].name = nsp_pins[i].name;
 		pins[i].drv_data = &nsp_pins[i].gpio_select;
@@ -604,7 +605,6 @@ static int nsp_pinmux_probe(struct platform_device *pdev)
 	pinctrl->functions = nsp_pin_functions;
 	pinctrl->num_functions = ARRAY_SIZE(nsp_pin_functions);
 	nsp_pinctrl_desc.pins = pins;
-	nsp_pinctrl_desc.npins = num_pins;
 
 	pinctrl->pctl = devm_pinctrl_register(&pdev->dev, &nsp_pinctrl_desc,
 					 pinctrl);

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
