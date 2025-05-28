Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43728C5AD49
	for <linux-riscv@archiver.kernel.org>; Wed, 28 May 2025 10:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QiR2B6syCB9kjv4Xp6G9XLDc+jIm6asj48l6iFn3cvk=; b=UkmuW1yKngfYsU
	e2zRicmdfcOB6M3vuN2KisV6R4kTGpgY46HWyio5gmkmA2VWd28o7V7YbzhuCR316t8VB2A0z5kae
	/Jw6ffrpyqoynVYCKDvrSMp/C2XGTCSIBUCZ8ZWuHRDdafvBzSK6EQT1kcJX1tGftp9lM8/RdcNhX
	J4ONi+UQe3gvfzoH6ps2qyX1NqM72J27HPjdQRmsSBB0OaLT2gqoOqFIOP71D2tAeUv9RGsAoPyii
	failhWs1kuHAmXlefwsccp3UAMIhmHicAuFa04hK+WHXKCJJ65urzcpUvlFJo6JHINYI/VHYk6dC8
	JLxdsC65XbI6sLBgdnuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEEc-0000000CsbL-0zFi;
	Wed, 28 May 2025 10:42:10 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEEH-0000000CsFA-3OTf
	for linux-riscv@lists.infradead.org;
	Wed, 28 May 2025 10:41:53 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso5069425e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 May 2025 03:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428908; x=1749033708; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eCWZ95h3v8faxWII4r+ll4sOFmAUxo+1NhX1BBWmSo0=;
        b=iqrJywAkMvgAxzRJoj+QtrBl8XrhUGyJsUhQLgxJ7Qlm0uqGYnEPFZIgiTBbu+WHVN
         d/JEPh5u1NGy45oQvAV0qWuqVfkm3DFG804AncUV9MF7T9KQVFjnq7XRdIJCoi5OL1nW
         JkhCLBxrK/iv7e9a6icNGmvJd/pEXuQKZhoGLmSrckf9nJcrsNgGWsGwrKqguiS5LNKa
         MNCq8GrL2WrAGWReL0fhrGQ8P4ZKsv0dj9S1w4zfVHwuGeE+9ujQrm2RwF5nyLBglzLm
         nE205G8F4Of78slW3JZCULr5nfGm4uRHLQW4LtCM/A8TeXqTNbmGttoCrn+b6eNkMl5f
         Pcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428908; x=1749033708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eCWZ95h3v8faxWII4r+ll4sOFmAUxo+1NhX1BBWmSo0=;
        b=lrn37kn+STy6UR5q6SFeDdjePVOpa7Zg301AAktPHO9XxeIGvo09IE51xZimOFDIpm
         TgxvNfVaBoO2XgN9JWEgpIJyWACkeqk0BiIgEV67zhyIh+8C4lYjzg8if4K619WQW0ha
         QCjsYJzRKNGcI2maaV0kHJoJOEQI4FLNFW2fdDC3bNshjzdUxLHzhDbRM+/xuAt4CEbw
         X5jIgqCWTx6AMsyFZMyBkJ4hh+/JrSArgjI6/SkmtUwzvbIU6jBQ+l1OH2mO6ClBbmEI
         kpi+BW8Wlk6HF4F/cvlje+tbuaKOrsNrdKhGVfTJCtNkeHeBdXkALMiX7iAdc9Bepz1d
         q5Ug==
X-Forwarded-Encrypted: i=1; AJvYcCXhR/F+iuF3fEY1fXMr2s5qDIB2cQPB7FGeuhkW9SU5h2HtgD9IJ5ZMFwLCAJArCdHszeAt1/alGC0RSw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzdz+rybhE4N1+Zfm5uX+fky4c4aK3/vUFIaVPtgk+Xe52Gp6bH
	G+Uh+vpp8ISIz4cPxdL51kvWlS6XiZCwjGjR1UwvylaGcFDytyyhkdRij+U1g5uhEcQ=
X-Gm-Gg: ASbGncsOWinnCpDFGpST2XY+BfwnD5eWAR3ZUrzuj3rYZSsNjggyvsE92bAWQIhV0f0
	cQ9WkSY9wa1+Wr7Q7AaVurHjMawqAlvjUva5OOUsQhOn/YhkPg61vBAo+rPcI8cAVgVYMfxpY3M
	zTKk4jM7fc4+9wZXTahrhl3u4zCKcFUXfN30/5RK2/Farwf4U5ItXZTqUCto5Pro+VhtOzTM7mx
	WEvotgX6ZaWPRSs1w6/lq/FplW7P1KpLBnzcbVE9Hv6OnF/YQ5Od93yXF/bPGuFl8zs4o/ciwqO
	mjdPKm+iQiLnzJGM3j5v4qkodJ1StIqCD8gkV5VotiSnJJiEnCSILdIGq4Hcunq9TfG24eQ=
X-Google-Smtp-Source: AGHT+IE/LJaHWTe9SYlHoYiKsnsZsaOAKKUrQJlJHOckCVYd00NuFwaRx6BpFbRuXnZ9itlqpT5fMg==
X-Received: by 2002:a05:600c:c0c3:10b0:439:94f8:fc7b with SMTP id 5b1f17b1804b1-44c90f4ccb1mr34271245e9.0.1748428907943;
        Wed, 28 May 2025 03:41:47 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:41:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:01 +0200
Subject: [PATCH 05/17] pinctrl: aspeed: Constify static 'pinctrl_desc'
MIME-Version: 1.0
Message-Id: <20250528-pinctrl-const-desc-v1-5-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3756;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=bPCkHXtxmRdHSBbvdS8jXvx5ZcbYrMBVxN7TAPQmEWo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhN3yUYNRVGlDm5GKvUjHRKmpO0NkcKTivqS
 rQ9YFsZsAGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboTQAKCRDBN2bmhouD
 15PsD/wN1dSXzevKC2HHXVm7rrp8PsHK6/O5ksoH/BLBd4VXwlPyIgGgkZ8jbISY8fCS0s7jAvE
 JbaDoYx6YKMIDEZRd/TdeBOLU2GWPzSgWvdOYA4LPr5cATQfbPRHhZIyCpk6FC4PPnfW8vfFrYy
 LKqeFzOpOHKIxR7MrchXNRqtxM+664l1K8Tb3XnT6+ojdbePdy7aXcAe3l7OG76wwg7sTwksB9A
 XcirEY5EnVp9kjB0/fwjQn3HwmrmC5zVzpgyqLm0uNEeDVJmu3CY/KxoGLqtzBfo+0xfopGAmAC
 fZ5m5O68s0ez/Xt46UgSW5XjyxlPGZkkQFz7Ba3qhVhc7GJsBR2ivHY8liIYf+UypZN3cDDN42N
 MyixdpJwa5XFsJnT+SiJ14/2t6Vu20ObUTXCfeto3WTYA6uIFk3QEktZFxNV/MQtBjA7SW59alS
 UdvaEjwa5LNRjWATKwCsWjkKNjj2zvgXhPO/kWHSySyYkAqHCAMtzWuRpLirzgARamkkw7eWkSD
 XXllk4esE/ckh1ZPaVSD4+yZ74jjdqWrNQSmFdzA6C+EA6M3BHIKo/NcQJg6NPBSnex2IGipA08
 KABgrW8+YQC/zSQ7VoZ6RwXHfcNuIMQ0ri/JoENVnFPqdN5ZVSijqUw1jZoLhXuA5LwDkWd248s
 5NOQtmWzYeMwnKA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_034149_898099_C9AC0CFF 
X-CRM114-Status: GOOD (  13.13  )
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

The local static 'struct pinctrl_desc' is not modified, so can be made
const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c    | 2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.h    | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index 774f8d05142f2d90c238f8e6661eca4685601db7..cb295856dda1244f2205305cf4c505d4ea4a326f 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -2653,7 +2653,7 @@ static const struct pinconf_ops aspeed_g4_conf_ops = {
 	.pin_config_group_set = aspeed_pin_config_group_set,
 };
 
-static struct pinctrl_desc aspeed_g4_pinctrl_desc = {
+static const struct pinctrl_desc aspeed_g4_pinctrl_desc = {
 	.name = "aspeed-g4-pinctrl",
 	.pins = aspeed_g4_pins,
 	.npins = ARRAY_SIZE(aspeed_g4_pins),
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 5bb8fd0d1e41bda799119a67887ccbc277e0f9f4..792089628362a1ed1c3eccd4e46c41a3ac7a79f6 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -2845,7 +2845,7 @@ static const struct pinconf_ops aspeed_g5_conf_ops = {
 	.pin_config_group_set = aspeed_pin_config_group_set,
 };
 
-static struct pinctrl_desc aspeed_g5_pinctrl_desc = {
+static const struct pinctrl_desc aspeed_g5_pinctrl_desc = {
 	.name = "aspeed-g5-pinctrl",
 	.pins = aspeed_g5_pins,
 	.npins = ARRAY_SIZE(aspeed_g5_pins),
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 5a7cd0a8868764dc5e3dc70f325c25ba29d50a64..51a63cf92023f7dc7a27466331c77bb5dcbaa9bb 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -2763,7 +2763,7 @@ static const struct pinconf_ops aspeed_g6_conf_ops = {
 	.pin_config_group_set = aspeed_pin_config_group_set,
 };
 
-static struct pinctrl_desc aspeed_g6_pinctrl_desc = {
+static const struct pinctrl_desc aspeed_g6_pinctrl_desc = {
 	.name = "aspeed-g6-pinctrl",
 	.pins = aspeed_g6_pins,
 	.npins = ARRAY_SIZE(aspeed_g6_pins),
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 9c6ee46ac7a096ce693639d88d387b089ffe5239..7e0ebf11af163c90184231686b1e0d9920755d76 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -441,7 +441,7 @@ int aspeed_gpio_request_enable(struct pinctrl_dev *pctldev,
 }
 
 int aspeed_pinctrl_probe(struct platform_device *pdev,
-			 struct pinctrl_desc *pdesc,
+			 const struct pinctrl_desc *pdesc,
 			 struct aspeed_pinctrl_data *pdata)
 {
 	struct device *parent;
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
index 4dcde3bc29c825cbc6be954dae9a654a310b4cd8..28f3bde25081b2c8099977129acdcdfb3e4b1dd5 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
@@ -102,7 +102,7 @@ int aspeed_gpio_request_enable(struct pinctrl_dev *pctldev,
 		struct pinctrl_gpio_range *range,
 		unsigned int offset);
 int aspeed_pinctrl_probe(struct platform_device *pdev,
-		struct pinctrl_desc *pdesc,
+		const struct pinctrl_desc *pdesc,
 		struct aspeed_pinctrl_data *pdata);
 int aspeed_pin_config_get(struct pinctrl_dev *pctldev, unsigned int offset,
 		unsigned long *config);

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
