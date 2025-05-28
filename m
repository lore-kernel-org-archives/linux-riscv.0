Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FF6C3ABB2
	for <linux-riscv@archiver.kernel.org>; Wed, 28 May 2025 11:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4+XHdSJZfxbN6eZljHtF4XPd6ZyZCth0Y67k2enEyms=; b=NXnaAMYqb/NINs
	OYZTY6jqpHWYAW2ZcCuVhlidZqNvgRjwo/o2v2en+7P4kK6A9s5NMZtM4IBnvCcDdqKYEHK/9sM/1
	q2ThlHwkP2KKKz8eNvImNaocEcnlW3LZcZTHGkdh4TCSDeY65YkZhYpB9UwGgdyur2Q06bQ/v5u4D
	kB1/tSxu1nQjlVue3wsnRANsavkdstIdPsFzTYElB6YdYjOrwXCyFf+PpR6xSFMdaxq93MLv25yYh
	ya3ZtDom1BOgkQD5nB2W+s3Y9PK3WLmVd9qxViwYWxKlBhhGR0Y8NxD8hbJYfIq5TWtvtfS2Inanz
	UvJmqAmfTlacajzkb2GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKFJX-0000000D1RL-3XxS;
	Wed, 28 May 2025 11:51:19 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEEh-0000000Csfi-14wm
	for linux-riscv@lists.infradead.org;
	Wed, 28 May 2025 10:42:17 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-442f4d40152so5987795e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 May 2025 03:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428934; x=1749033734; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sCzXGrMy4mrth9Y9XnnMqTwemBq/IlPbQZ3QBo3OiYA=;
        b=WSy1UybyqlKuxs5fEtpjW4x/a9A/7qyRoxk+AOaseRWckjiuVU6zlCjRkJPNRkuywx
         Z5kWzHgENyuWA2JNF/DavxJwFbhvm7yDwkt+mV171DY1uqwCvM3mfx/OQpLft/nmqclh
         a/bcWbnuwjqefESOAY1KmOxor1EgsxJIVNJniEQ78k7Btu/Em2g7ge8iGUMKKZ4DMV+o
         cGXAzXA2Mrd1/J1Bwg2DlDSaUD+UQ7uAPcBfc/sTHextkQ5pYnngyJ0xjXH1TqKrvP88
         KwUx8j9YI48CErLJOGiJqDzihjSsoQp6Ikbp+VQshkE5HwRZKh7JvCPQWiMQ+/fE0q9q
         BP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428934; x=1749033734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCzXGrMy4mrth9Y9XnnMqTwemBq/IlPbQZ3QBo3OiYA=;
        b=kbTODwtg9v1L4SdW6Gb3qF68iYwV+ZNOJJA+yf/SXdDEBJulXQhOyD+MUeiSR6Z9JS
         JQ8M8cYoTu58ZXGQTnlGUCqo4bfXv9gA8F4PeZt93Ian3uRoT8uPQHgNALPl0X6CcB7H
         66FZ5M3Ot7FTzHkbTG7/gEsRWhps6jIXgzPW9xr6Zw6u52puSPf9kyRUDbtsUZE/7DCQ
         EJ5JpbdVL23zjYy8weUYjALmIWggMeIgHpektGE/jqw1R47ITwRBHX2DNmmfHczspRch
         pGQEY9ReKhsXrhh8jPTtd2IElkN63Ffxixt1Sg1PRiyf01XGutX+ptSKLE1GSNmFrDmR
         9tBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJQAfSzu3irx1zsHaEX2msoPlpTeObFBiPAsPZlrXXxcXVsG0SoD3chF2KiKbkqpjtjlZ3AljTBlvDPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKWpC7tgHnKoBzSvf+0wKbdq5wdfP2xPxROJaX/YdZ6bi/xQKW
	Zgy5Cd4THDIIN+b/mLXXKXOFdnbShOdiFhW0vvt8I+dQaEZsnkSZZUJAmATbPLkaS9U=
X-Gm-Gg: ASbGncs5MdqIrvL33lsGU+5d8IwSxt04ubB7pyQ1dd27vchEovmi8Ft++IMwXZMrahu
	skOssGmeOqZ2xw58Uwq9AqxCE2SZjvJVXnPQs0ACSkkgMnBQSDAgP6JbaKvJfnXvwLd2e9ISWo6
	9A0tTpn+PVXbCOxinasFWTg++yUVbNYvzW1gvjfuxlzW4yQla20dOnWRXMT2fbgvmlGGfepvFMi
	Csk6hC070dprHMtj6IzrGXZUy4o7qS5LlHSiLiAwpw6CnDpVB7llaE4P/GcCEQEWylcg3cU/2Xx
	Bqf0510ZbVDxq8j5ZtMOrbotDZ/9NcXFzQLbxoA7CeEiW1Z11b3pk6s5hQqJmJGuhwIHn8o=
X-Google-Smtp-Source: AGHT+IEezznZ4tc//+iyg9VgEejs2PqgHy+UHoiBZ9D2eixnIzEPRTC2rWF2EYyDVV6zOvpBJosC8Q==
X-Received: by 2002:a05:600c:1385:b0:43e:94fa:4aef with SMTP id 5b1f17b1804b1-44c93cae9acmr51123845e9.8.1748428933700;
        Wed, 28 May 2025 03:42:13 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:42:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:09 +0200
Subject: [PATCH 13/17] pinctrl: palmas: Move fixed assignments to
 'pinctrl_desc' definition
MIME-Version: 1.0
Message-Id: <20250528-pinctrl-const-desc-v1-13-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1235;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=dTmy1ylBupLBEHMWc/Z23V5px0USEJlmCJKSN1EAvfE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhUPwoRAjJQz5PFO5DfSHTMd24hsqTzRr2IB
 0jOv1r3k8mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboVAAKCRDBN2bmhouD
 1ynAD/49mYORosdid1df8HmR8x/OWiv0Zm6goccLiqpVflRmzsFrLN+cLFMbhxRMl34fM3yuPci
 b71Zx42gtn/VEKIdJ4nLISvF28thcNbAG/plhINy2OOwfUm060Kcfaafl/ZP4AiXH0q3u3BS5cs
 fRHQErxwUgQBlHIgCJL61LeQp1Whs8/m3ImG8NPjZwnPdezu9Oczth6hm/aG0Og6NB4QdZkVhtO
 5xyGBrnkXFjRo2HmrUPl2PTYkNrTEjBPv4EZH2uCaBsHPSd+ND4J/ajWESZ3Vh0wXEyzTcd3/jl
 dCsZE4KBxpy/+gWzMFnXBN0HYTkqwqwVnkosUS0jsWofWTu/7iijgYxr0xF9ikcr3aYdlxgxGE8
 kkh76EFKdrmG1NbdijJPiOC50b+vAChB+zRdWvfXUBnmWsm0/uJC0Z+ttf7Nxbq4uFdgZVfD95d
 z6ZimmSBL0cf2VB2RBfUdZPPyT2hWvFdDUyrrSsugiugcfo/m1MciUEAKpSK2bk6d7S6K/ZP+Ie
 ydztgCpY5oH2z4aXxETIgUcH2X5Zx4g5H+iwFhMME8VjfrLHe+T6xEeRsGvuWg4C7Ij2NMquouc
 skaEKK7orgbEC9jAJSV1kP4K0sFWd0Zdc431k7p0EaxblWY7N6iELiPx21AVf6/XJYBh9eoI0r1
 RBtd9sQPwZc6f+g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_034215_364946_4BA8B37A 
X-CRM114-Status: GOOD (  12.73  )
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
