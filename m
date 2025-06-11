Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A843C61CE7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 06:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4+XHdSJZfxbN6eZljHtF4XPd6ZyZCth0Y67k2enEyms=; b=UMr8NHa2x2pygr
	Y13h7wsSfq4d2DVclQWnUt+BUu8L8MrAyMY86P4R39s51LT/xdHrJWfQacvBI5LRh43xpm5/YPd7D
	o8BcHjCnPB8yUAVXObYNjgNcHJzBTKajFnp+91E3iAAr/DE7XctWW2lLJPdYwD9x7fBpeGg+YRfhY
	gbMORato17rfJlmMFfSodMt9OIcNE9QA8zU9Rg5KgAJq6gtdi21+a6ykB3+LOBTsJpO9wtitB8eoT
	IGO6QbCpu23uMYnmQFc+7i6UbLJ4gljkAawLfd/puex74Cz71rekB7fYzn2StIu+W4yLa1On0csxj
	w0Gh5ETqyabGglbBxOqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEjm-00000008xAV-0ngA;
	Wed, 11 Jun 2025 06:15:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEjk-00000008x8h-3VLs
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 06:15:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sCzXGrMy4mrth9Y9XnnMqTwemBq/IlPbQZ3QBo3OiYA=; b=Av7MvnsXy+dvgntuA7EaTil+1w
	HsTcFHSZgIhg+jPr4908AW6BlEG2T5CQ09HNNqQPE4jbemTzL18rBUFa4iCFdX2Aiol2S9Bs8oyxP
	vgqFNo4H3VaroeFTEdOJuaMrYsNtvTo8KFAuahRruHPlNDBVOlCt6KYsbgcSTYZlhaqM3KMDVcj/c
	mz2zN1Q+Z1Nb0Tcl5OUOMXu4ovm51EOGTB0CyGoAwImpJxfEZ/XT4hwMfpx0IwgYpdFHDZ9+8P/my
	FTsZ5RBzyfGREvzdLQe0tp5RI2O4iyzFOpEW4ZFizNK8odHx3AH/T8YzK5FNT6H83TvP77KqQmx4n
	cqJhjB/Q==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEjj-000000027jC-04IZ
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 06:15:00 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so32912f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 23:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622497; x=1750227297; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sCzXGrMy4mrth9Y9XnnMqTwemBq/IlPbQZ3QBo3OiYA=;
        b=xz7tyYinAUq63LIeovROqsgoSUxO+7Zg0tBkSIPQvduu+9cEltRLQOHgprzNlyhQl/
         ULMyd3ZdyN//Hb6uTJPrTk4pWYtmVJMLH9+FJFusL5egp5lXQwJrgWTYaD6AeJaEtVcm
         M/Nf2py7KhG42/iVe6WW9UeHE6+Pb18z1qlYQiZx2Hcx+soEXC68EwS5k3rhyN+aEAR+
         NSQtNnYtpM395Isf/7DaymYbNP4HuvEkA5zetzkkXBX3RhjtwT4xVRBSlHEOr9MYTKse
         PRhTedlucZt8Z+TIgbwXTPyaeDpF8nfrKHde8grqMATtnN2wUsBTMkxkyXReahmmdovx
         878g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622497; x=1750227297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCzXGrMy4mrth9Y9XnnMqTwemBq/IlPbQZ3QBo3OiYA=;
        b=abX5zFymR+4hSZwMQmOQQmvpWjZeW1jD2RzSLD16/blrJQo+RnEyEP/fh7iKtbLEDK
         bcHTeVjQuV8aOvfWwiyFgt5SYzq6cMpgdrPez0BVDFVvNHSQIzwTSGYpT5DdW2s/rQAc
         sT7cN/1fbAzccOdXSvV+4tylcUD4alSqBTLFpY5UvbS3OAyYYEyTb93MUIJKlSt7QKCF
         6BNsy3Y6D7hgdSMQ9KbMxJCSePrKosthCRrtmjsspG+enSNJQ6+5XTb8wj0jok6ReMzF
         wYL3GV0Z8OYx7uQAGMckHfF3FdgRs0fOJSSf5TZBrQu2Gt3BRY+I++qk7XNuzAgBjOLL
         Pwsg==
X-Forwarded-Encrypted: i=1; AJvYcCVSkjLgwJG4f5JkxAEqWHA6d/43PACeF5sXJm+lYC99tox+1ZjzsFU5BMGFrihychA/4872yvNM7ItFZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxiztUdw5YwEJqahAS090nXwzLrzOWf0r1NxoEyHEz9FjjLJbSC
	LdKWoHtIFT7YCQqWFgaRtistLugaVScGQSM8oYQl8n+gdm7oZazDsBpEWnbJbAf/7GA=
X-Gm-Gg: ASbGncsa51krMvPUbJs6z32ctFYlSW9uzng+GHNr5gHsZgDVoM7chvcFLJ2SOZvwWmB
	Xd/teSOSVQ0H32E77KYDJ1YBCgZXSodSMo84CHOoXN9lYJOcc5C3es/2eYBzvktC4uvo/OWDZQY
	PFDcgLkt9xmdXnxcrjHWQKltN4mhZalyQOHhechKSBpYDL0NlSOjVThww0IWeSD9vIAlRLGSB8d
	Fspk8bniVn9CeYrr6lWJb7HdM18Sl5jBS8fa9GSuU5N3YtZh7WYLy7AxEauZkAMvH076NWU0NxT
	vdhkBwtM6LnHo4hWpcr13BxFSr3980eYXJi3d1qv93dfk9NV7H1yAwiqoYlkSBl2Sj/O8mfTvS1
	c+YOXBi8=
X-Google-Smtp-Source: AGHT+IH0XZ1xTYWRRaO/KxoZgyHwo88VqXTdr3SM+3aZCDHpuiwknECFcoWGBMSsZB+S7AbudZJGmw==
X-Received: by 2002:a05:6000:40c9:b0:3a5:22bb:8b41 with SMTP id ffacd0b85a97d-3a5586c6283mr513239f8f.6.1749622496932;
        Tue, 10 Jun 2025 23:14:56 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:45 +0200
Subject: [PATCH v2 13/17] pinctrl: palmas: Move fixed assignments to
 'pinctrl_desc' definition
MIME-Version: 1.0
Message-Id: <20250611-pinctrl-const-desc-v2-13-b11c1d650384@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1235;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=dTmy1ylBupLBEHMWc/Z23V5px0USEJlmCJKSN1EAvfE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6q4AzpL6d1wSLiktMd45hf80LKncfJThmGJ
 j9tWAIcbRqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeqgAKCRDBN2bmhouD
 1zW2D/9sgizTHa8UYpq5W08yfaWQQY5LIJPddSSvcnOBIPHSGldHl5KnuPm5CR7btgpemW+s5wk
 +B7d3ypQAREOql3KHh3KhN4AIXdCBqYRhiXPktlMuJullbPSpdfQwUDGPWbKkl5ZGYFsutt8LXO
 2oR/wII7OuWQyqXM+zszHSuArLZ91UWpjox09xD2BjvaZqbt4U7WBXnpdBM6EirqirObi7+Unmx
 vRD2aXkAFWnCt5fSmhwFsxQ87SO68h+yAaVnpgUVxzSeE5DSZaynVyvBTcjnMZ4pPo8j7uxX9ee
 Brc7ycoIJiDUuzzcHWIpF6ebtMZtGNyZWC79sMRgTW4btZZyj0A78+J7yoEX8MRDbdfBLYL+fv5
 SmdiydXrA1oaQHQbUJBiSlHx1gEFO4BiG4ZnAaNY5m3JU2P0un6OAzOE9a/dEOMpbHazykDXjD5
 jcyV8+Eh9nGCS8xrgB+uEOfLCMuG2/VXTxXBxhkRQj0uAjevYzMJm3kovLQh4nKH4talFCxMtLb
 aUDFOmzG/NXN1+jKrev2W+nylhYVoF2QCLptpuvwWkWS/XOJJ0xJpd0gJX+TtLSBwdgyXUDey9E
 CmgGts4sk2ZGmkIIwag50Rlholelm/UNtTVFHxIYfZjshyD22hdqRuS4j3hnI7uREsSTOniRjoR
 /5HfKm3NrrNXYxQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_071459_158376_D3A63971 
X-CRM114-Status: GOOD (  12.67  )
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

Assign 'struct pinctrl_desc' .pins and .npins members in definition to
make clear that number of pins is fixed and have less code in the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-palmas.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-palmas.c b/drivers/pinctrl/pinctrl-palmas.c
index 9e272f9deb4f8c49f91d2f09c2c100018a7617f8..d69f114e46426c345d9ffe7567a326eecdd91bb5 100644
--- a/drivers/pinctrl/pinctrl-palmas.c
+++ b/drivers/pinctrl/pinctrl-palmas.c
@@ -956,6 +956,8 @@ static struct pinctrl_desc palmas_pinctrl_desc = {
 	.pmxops = &palmas_pinmux_ops,
 	.confops = &palmas_pinconf_ops,
 	.owner = THIS_MODULE,
+	.pins = palmas_pins_desc,
+	.npins = ARRAY_SIZE(palmas_pins_desc),
 };
 
 struct palmas_pinctrl_data {
@@ -1023,8 +1025,6 @@ static int palmas_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	palmas_pinctrl_desc.name = dev_name(&pdev->dev);
-	palmas_pinctrl_desc.pins = palmas_pins_desc;
-	palmas_pinctrl_desc.npins = ARRAY_SIZE(palmas_pins_desc);
 	pci->pctl = devm_pinctrl_register(&pdev->dev, &palmas_pinctrl_desc,
 					  pci);
 	if (IS_ERR(pci->pctl)) {

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
