Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C492C71137
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 15:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=sk01zkXxgdDXrysqnxAGyvInXfiYhUVAGIuzdrfzmIs=; b=mhqIsk4M28TOQpZxy5gsgYLkal
	wCm929Tvy6Ebqk7dQA4cTiWXzDeK/ywHIvGwIiF6q15FzZ150I2S+Z4bZoWj8jfnhE0+euKXnQH4v
	woYuKzhRIPewcFGWgxRWh/E0T0BSdPt0QdAzsy/aBlIkYbiLtAMjsVqbqr2fzsQK5h6hnTNImU0sh
	eBFBsbx7TRKG8ogfVc8Dy2l5TMcAVKd/ciEQfYABVTpBxbqoUMfdFcLAGJDS/bCbFl1m9a4bpLYT6
	OSoSWFA3cDutTluErpEHe3LJayaJN/7s8ytlkgFgDPSoCk79ly+ZccJZdjNDK0EfvYeolW9j4pX22
	sYHseC/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNoz-0000000AW6G-0pUn;
	Wed, 11 Jun 2025 15:57:01 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKtC-00000009sUD-0XDy
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 12:49:12 +0000
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 81A8F3F73C
	for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 12:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1749646140;
	bh=bELfz3w2j893PNHUaLtbdQ42P6gz+Z983PYtPwmORCE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=BBSImZ1+tybxpvjY+IybdNVTkyIe5JEVQQCKpwONXGrZDG70upsHmJ9CklBueXqu2
	 TvqnzJ3sX5nA20tmELLVGJNZvwRJ5oJMWa/URO0WA6X4FEehKYvA4J4hsyXX75Q0WS
	 wTjD+TRmirHpjAJs0MFalXyIM2pzbBqFE1aObKumo3DsSEikVhyTj/sAZX7/CgFEJ2
	 VlxQcf6+8qJgG7DX9HsTfBgWXrqopy+F4sGY7DUDhZq+Ek+qPsGip/mCT5EfrYE5Nu
	 Xuducgdgbv2YWmVmtGdMt0OK7Oizmk3k3lYkUfJFMaabYVNX/bPay7x9fk6fZims0E
	 N/tPOsMLQev4w==
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-2e933923303so4911621fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 05:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646139; x=1750250939;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bELfz3w2j893PNHUaLtbdQ42P6gz+Z983PYtPwmORCE=;
        b=JyCd+E0AH8+2qnFdKjiBwK72zdVQSYGg/+f4wxkIsexR6MuCr+vkbBq9vmOeI6u3Lx
         NF9rVZGAY2EQXY4VO7zo70NypSb9MFptuvGL/4AC9D7lLII2XAK02gENzwHpQLmvpR/2
         VedY3cpf9WLG/e5SvtxAEoeI+rhxV4H6+0nc+oTm4DAKlGve3nO2ru29fldSdUPRnS8a
         VUQ7I0+il8Qd2P99sulMB7WGKxlL56YqhnrWbMlJo2I8qP9BfxQdAYE+CqvnsrjKPPPD
         h0UtYxucV1COJBKahZZpFrPxiOuLmLcAzxZmt35b+AmOjN+PQAa2qs5CJt2XVLdKRErE
         ra8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUoZXnJxbaxCOIIqiaR+sLb56Yr/6MyL4LGiJp6ejYN3ljujm+IGRrSWAkbl5esrDUSqrMzHp+9ZHEv2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4xn0Y/VNcQMFHvZGvBnvD1IZXGymaQOYM1WGjuueC+6AMy0bx
	dDXPtLQj54qySIM77NH4ZdJoiL/faNcUndAzSDLL5Hfsuag1VbwP3/fUatw80xq4H7ZdQFGEIfG
	Jdgm/hRpJ10tiJVQegy1Ej8fPSzyCP6tyhfYws3eXRG0klG9dF9xOeEz+cOgb29Sfdo9edXF2AF
	NovmYRqiaM520KAn1GCxBAnefoaseYqdulFCeIkHNQ6OLO+rpblNTyfKHm9v7K
X-Gm-Gg: ASbGncvxvbWUw8urW6EGgNhUqVVkHfIByp3dt2G0yI/uxi4GuXfJRaYb/ic/KVdRnXO
	rc5w5PVuIMLEPESn3bv6dukTFdwzDI5LQiNXYVv4GwJgv0OKhn0L2l10xwjmWyobxhJ1cNTXQjd
	Auwg==
X-Received: by 2002:a05:6871:e803:b0:289:2126:6826 with SMTP id 586e51a60fabf-2ea96f18fc2mr1940844fac.30.1749646138952;
        Wed, 11 Jun 2025 05:48:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzhqyM2kCCDhwaEPz02MLETIROTaGu5WeJENkIMCzCu3hfLe4ldyitgFfsfYyGdI6dZNlApiM1ratiR1ypk/k=
X-Received: by 2002:a05:6871:e803:b0:289:2126:6826 with SMTP id
 586e51a60fabf-2ea96f18fc2mr1940818fac.30.1749646138634; Wed, 11 Jun 2025
 05:48:58 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Jun 2025 07:48:57 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250611-pinctrl-const-desc-v2-1-b11c1d650384@linaro.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org> <20250611-pinctrl-const-desc-v2-1-b11c1d650384@linaro.org>
Mime-Version: 1.0
Date: Wed, 11 Jun 2025 07:48:57 -0500
X-Gm-Features: AX0GCFuz_RtY5rxDREJdwFYXLGRQkyQfytWb3LifI1_It-SfpAfrMZfWta2TVOY
Message-ID: <CAJM55Z9WzsxWGmQYH05hSisigTRaHuKOn8g3AsLJ9h6Womy2dg@mail.gmail.com>
Subject: Re: [PATCH v2 01/17] pinctrl: starfive: Allow compile testing on
 other platforms
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
	linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_054910_555460_CA3BA8A7 
X-CRM114-Status: GOOD (  11.73  )
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

Krzysztof Kozlowski wrote:
> Always descent to drivers/pinctrl/starfive/ because limiting it with
> SOC_STARFIVE is redundant since its Makefile doesn't build anything if
> no Starfive-specific pin control Kconfig options are enabled.  This
> allows compile testing on other architectures with allyesconfig.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  drivers/pinctrl/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index 65dac8e387985ac7f865d13325eb903f64645a2a..de80f3ee52c40f3a817f229a751909c590161594 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -83,7 +83,7 @@ obj-y				+= sophgo/
>  obj-y				+= spacemit/
>  obj-$(CONFIG_PINCTRL_SPEAR)	+= spear/
>  obj-y				+= sprd/
> -obj-$(CONFIG_SOC_STARFIVE)	+= starfive/
> +obj-y				+= starfive/
>  obj-$(CONFIG_PINCTRL_STM32)	+= stm32/
>  obj-y				+= sunplus/
>  obj-$(CONFIG_PINCTRL_SUNXI)	+= sunxi/
>
> --
> 2.45.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
