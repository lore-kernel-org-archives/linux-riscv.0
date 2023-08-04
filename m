Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8770C001DF
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 18:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4QGqoQjhP8g5AhT/a6JcJLdcRrlfhQbFQBWXM5mk/yo=; b=AKmTETtLw1x829
	6mWlrSlzd6l2fV23HP8+Nah+B4A5pkSu31l2+AoxKxJn8oXWDCUlH6v6Zr/PiKDxNgjRDUvgR90xz
	rQ643dPQo9y2hOMjtmxizxoprna8G0/SGhIIFj3tT4vGEtbCNyXu5mWL5Nmzj+E6SBDWIdIxu95r9
	QuEZMFum+Rjinp/BYZBrQbWIOcg6xx5glIVzmU2nglWgfQYbuc/Iw2LOBWZf5avmTtYVTK/HjUcb1
	wp/NVdkzYma1hyWiDyr7Cfv8MrfJv5AWOzG1x43tHT06omtQp30EyNT4rUBklHEcF0D6FYx/WoK8a
	4tj5Gtc6+uqKZZVoX7RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRzuf-00D26w-2r;
	Fri, 04 Aug 2023 18:52:37 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRzua-00D1zs-25;
	Fri, 04 Aug 2023 18:52:34 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6bcd455fc88so870574a34.2;
        Fri, 04 Aug 2023 11:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691175147; x=1691779947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HItNTIMvCIXfonBezfurR93L/l9UQl6IcmZ4tatzJA=;
        b=mlUliX93F5qFHHI1eoLLCSxrP0sRwTu71E0+0iF7A2cwIL58bh7yKQ2Zd6VhPOrrVR
         4WdI+88TPtQ+l7NhMMov1wuxD/H4Wfpqib7Yg1CqBoLVgI9m47L6ZB6NS2aAqZe2o87V
         jYs5ldnsb607oh+VfEDrtHDLtwbY6DO6R6Ugm+ofDucq4j8Xc5ioeiscE+q98v0yR9a3
         RDVFTtbnWiWvOcsAhM3mLGK8JySKNDA30p9zWKdJUEpFB63B4SH4l7UsNu010WqETrWY
         l4LdvmiG2xu7jdQFyaLi3vGEmIrG+6Q/NS66/vkYPDGplv0UaIiAPepVwHTI+A+HM11B
         lAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691175147; x=1691779947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HItNTIMvCIXfonBezfurR93L/l9UQl6IcmZ4tatzJA=;
        b=i/n1/yyD7qvv686fVPAZ+zvOGxzNKATfTldsvKfrqUbneuwVqC+pwUJafWPAaiT2fs
         p5MkFPTTi9F9cVNfZYY/cBCLHIxDQoitt0fPesNivAT0rw89LtRuIBLRUo9CW7zjzQ6J
         qdv7ZP6AyW/PcaaTmNgaHqW4EUIpJapz9Um3ykD21hOhUNQgJN4UaBvwlhEchQ131eWP
         pjGK9dvToQA8NlaOSvmTodvrhPp4DXbJ0lF5zcdO24qPQkjAA/HTvvUuzKRSmW7welCh
         Aq4Lp+8Oeo8A17nicQxuvZajpxNE2KxrsyuQVFCUltfOrnQh1lZSxIfvmzagWv8y5VPw
         KdNw==
X-Gm-Message-State: AOJu0YySaehfEluJnyird6l60nzXBRoYbse4jUACUfFydx9/MkC4cclS
	pEXL9vwlWTBWZjhAH3i+1Suv/fV0qdI8ckKJXMA=
X-Google-Smtp-Source: AGHT+IGzp9pVDMXWry56NsZy1Wlu+pLORC3ORFvtBGhMu6TYOCe+P8wMbQo5bZqDncwUMYd/rqllnaxHLBBvOMv3P6I=
X-Received: by 2002:a05:6870:ac2a:b0:1be:feb0:33ff with SMTP id
 kw42-20020a056870ac2a00b001befeb033ffmr2969895oab.6.1691175147496; Fri, 04
 Aug 2023 11:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de> <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 4 Aug 2023 21:51:51 +0300
Message-ID: <CAHp75Vfr2VrKXiOnM7=+K6MvOdCdy52xb5PB+dzKMeHonF04eQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pwm: Manage owner assignment implicitly for drivers
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Alexander Shiyan <shc_work@mail.ru>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Paul Cercueil <paul@crapouillou.net>, 
	Vladimir Zapolskiy <vz@mleia.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Michael Walle <michael@walle.cc>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
	Hammer Hsieh <hammerh0314@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Sean Anderson <sean.anderson@seco.com>, 
	Michal Simek <michal.simek@amd.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Anjelique Melendez <quic_amelende@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Luca Weiss <luca@z3ntu.xyz>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, linux-pwm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_115232_693770_A4498FC9 
X-CRM114-Status: GOOD (  15.11  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBBdWcgNCwgMjAyMyBhdCA1OjI44oCvUE0gVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4KPiBJbnN0ZWFkIG9mIHJlcXVpcmlu
ZyBlYWNoIGRyaXZlciB0byBjYXJlIGZvciBhc3NpZ25pbmcgdGhlIG93bmVyIG1lbWJlcgo+IG9m
IHN0cnVjdCBwd21fb3BzLCBoYW5kbGUgdGhhdCBpbXBsaWNpdGx5IHVzaW5nIGEgbWFjcm8uIE5v
dGUgdGhhdCB0aGUKPiBvd25lciBtZW1iZXIgaGFzIHRvIGJlIG1vdmVkIHRvIHN0cnVjdCBwd21f
Y2hpcCwgYXMgdGhlIG9wcyBzdHJ1Y3R1cmUKPiB1c3VhbGx5IGxpdmVzIGluIHJlYWQtb25seSBt
ZW1vcnkgYW5kIHNvIGNhbm5vdCBiZSBtb2RpZmllZC4KPgo+IFRoZSB1cHNpZGUgaXMgdGhhdCBu
ZXcgbG93bGV2ZWwgZHJpdmVycyBjYW5ub3QgZm9yZ2V0IHRoZSBhc3NpZ25tZW50IGFuZAoKbG93
IGxldmVsCgo+IHNhdmUgb25lIGxpbmUgZWFjaC4gVGhlIHB3bS1jcmMgZHJpdmVyIGRpZG4ndCBh
c3NpZ24gLm93bmVyLCB0aGF0J3Mgbm90Cj4gYSBwcm9ibGVtIGluIHByYWN0aXNlIHRob3VnaCBh
cyB0aGUgZHJpdmVyIGNhbm5vdCBiZSBjb21waWxlZCBhcyBhCj4gbW9kdWxlLgoKLi4uCgo+ICBk
cml2ZXJzL3B3bS9wd20tbHBzcy5jICAgICAgICAgICAgICAgIHwgIDEgLQoKQWNrZWQtYnk6IEFu
ZHkgU2hldmNoZW5rbyA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4gIyBJbnRlbCBMUFNTCgot
LSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
