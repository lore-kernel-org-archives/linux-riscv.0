Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FD2C001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 07:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2HZrNtskbfOJQhcvtmV8zkLsCpX9/Nft7zF7rQ6VZg=; b=MN2q8Os0EmqALauK5jZX2PrqAd
	ZDC9E/DIsTS9m2r9vWqFfxLLmkv0bXd7MaKa1/yoreebpFb3baLS5Sx0hp11k9bRBWJc8fNHwQf43
	iKxgjJHMk51yOIL32DbKTmagoiBYPxgJJF+RByQFMSqwZS+WhQ2b1f8U/hlJcRH2u6qVc1eo9Ig2j
	7s09sh0aTULdftWdb+6QjTapk9gEdotl+19lGwwrEx40NDcIcLbZXN4LVqBbXsTxgfJBATvFgfCEC
	d86bZAN42INlh6459e0bMFdYvYU0btr4owPHCDegT3HXgFTRRYw3I6Mgaf6v6ta06I4FNK35LwJcf
	RGsrfeqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSCk-00GOXc-2t;
	Mon, 14 Aug 2023 07:41:34 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSCf-00GOTq-2Y
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 07:41:33 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fe1a17f983so36191225e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Aug 2023 00:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691998886; x=1692603686;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zitqku576TZpQnQPr3Oh2ohHuEFbeZPBBxEvo1sZc+Q=;
        b=c2ibWsrtxlpOl2l93H8I7dwO30O1xssdh4p/RrE2q8N2J8sUQOiLfPy4jrHUDNecWQ
         B9Xl7UbuevI0/fpeC3Cqz4JjJBdAc1fM3Sx+NRxxOWZwKyMRK3wSy1FRjBCN1vRcCJ3V
         iNaGpXWAcpuPTu7ilq8+T4iAp1Du1dTft6ZdWvtZ4YteQjS4RMAl8rEkUzkK3U48fPQ3
         Ta+6PDHsz/O7Bxk8FyAYZKsv9wLW0hBYeG+zmWBSRbPB9cFQZwP3sWc7W4O0II/GdFDH
         XLs0zYerpdo1H3GjEXSiYzl+d1vN7CnfVNDwP6MnTibEClBZjnwlup1Vh8wpi7JEvqyE
         zjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691998886; x=1692603686;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zitqku576TZpQnQPr3Oh2ohHuEFbeZPBBxEvo1sZc+Q=;
        b=eEWB2guLUxKksemKKQAAc3kUN4PvaFf3VSAWX1cKfKTsDZ6wbPMXxotpyKiLlwWXdK
         RMvvjy/z+W2zUQHXXTp+DuIulhahuTNcbodxd7NjRFTqOl2mSCdSpVTiftV6IMMk/0Kn
         YsaFk1eHaRNokvxOhJTMTNz5LdDHBh+DMnhuTdngSlGKi6O3M4IGel6Tw1hk4Ms8Zdcc
         rikyVbRzEq+Sh7OomoSPnJMmBwtJErgpRtVayQQf8JEV5oHJuiACgD9Gj3VvLsSScNQr
         KkiMyRLSiq0YJUM4bdgA9nFhEL9C6c/MvpPOYQgJJ6blpZOY7OrMhFZuLsvmsWsbQoVn
         2Phg==
X-Gm-Message-State: AOJu0YzOM6IqTtZu9/Xao7ISFXd23XMeO/WGeT7L9emt5aODDS3QuBT1
	D7ILTj09e/TNzLhkNU6Gnje2rQ==
X-Google-Smtp-Source: AGHT+IFYfAjXxtZPBAO6xzW1e3FH1h7mkoQ3yNtVsbL8sLdvSW5eTgH/X76mW18QMBp5iOQDIcXGqw==
X-Received: by 2002:adf:ee87:0:b0:317:5e0d:c249 with SMTP id b7-20020adfee87000000b003175e0dc249mr6776837wro.35.1691998885785;
        Mon, 14 Aug 2023 00:41:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0? ([2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0])
        by smtp.gmail.com with ESMTPSA id k3-20020a5d6283000000b00317643a93f4sm13507243wru.96.2023.08.14.00.41.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 00:41:25 -0700 (PDT)
Message-ID: <81500a13-0fed-e9d4-7f51-552b888a98e1@linaro.org>
Date: Mon, 14 Aug 2023 09:41:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] pwm: Manage owner assignment implicitly for
 drivers
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Alexander Shiyan <shc_work@mail.ru>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Michael Walle <michael@walle.cc>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Hammer Hsieh <hammerh0314@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Nobuhiro Iwamatsu
 <nobuhiro1.iwamatsu@toshiba.co.jp>, Sean Anderson <sean.anderson@seco.com>,
 Michal Simek <michal.simek@amd.com>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anjelique Melendez <quic_amelende@quicinc.com>,
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
References: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de>
 <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
Organization: Linaro Developer Services
In-Reply-To: <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_004129_834685_61439715 
X-CRM114-Status: GOOD (  20.91  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDQvMDgvMjAyMyAxNjoyNywgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSW5zdGVhZCBv
ZiByZXF1aXJpbmcgZWFjaCBkcml2ZXIgdG8gY2FyZSBmb3IgYXNzaWduaW5nIHRoZSBvd25lciBt
ZW1iZXIKPiBvZiBzdHJ1Y3QgcHdtX29wcywgaGFuZGxlIHRoYXQgaW1wbGljaXRseSB1c2luZyBh
IG1hY3JvLiBOb3RlIHRoYXQgdGhlCj4gb3duZXIgbWVtYmVyIGhhcyB0byBiZSBtb3ZlZCB0byBz
dHJ1Y3QgcHdtX2NoaXAsIGFzIHRoZSBvcHMgc3RydWN0dXJlCj4gdXN1YWxseSBsaXZlcyBpbiBy
ZWFkLW9ubHkgbWVtb3J5IGFuZCBzbyBjYW5ub3QgYmUgbW9kaWZpZWQuCj4gCj4gVGhlIHVwc2lk
ZSBpcyB0aGF0IG5ldyBsb3dsZXZlbCBkcml2ZXJzIGNhbm5vdCBmb3JnZXQgdGhlIGFzc2lnbm1l
bnQgYW5kCj4gc2F2ZSBvbmUgbGluZSBlYWNoLiBUaGUgcHdtLWNyYyBkcml2ZXIgZGlkbid0IGFz
c2lnbiAub3duZXIsIHRoYXQncyBub3QKPiBhIHByb2JsZW0gaW4gcHJhY3Rpc2UgdGhvdWdoIGFz
IHRoZSBkcml2ZXIgY2Fubm90IGJlIGNvbXBpbGVkIGFzIGEKPiBtb2R1bGUuCj4gCj4gU2lnbmVk
LW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5k
ZT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3Bpby9ncGlvLW12ZWJ1LmMgICAgICAgICAgICAgfCAgMSAt
Cj4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jIHwgIDEgLQo+ICAgZHJp
dmVycy9sZWRzL3JnYi9sZWRzLXFjb20tbHBnLmMgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdt
L2NvcmUuYyAgICAgICAgICAgICAgICAgICAgfCAyNCArKysrKysrKysrKysrKy0tLS0tLS0tLS0K
PiAgIGRyaXZlcnMvcHdtL3B3bS1hYjg1MDAuYyAgICAgICAgICAgICAgfCAgMSAtCj4gICBkcml2
ZXJzL3B3bS9wd20tYXBwbGUuYyAgICAgICAgICAgICAgIHwgIDEgLQo+ICAgZHJpdmVycy9wd20v
cHdtLWF0bWVsLWhsY2RjLmMgICAgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdtL3B3bS1hdG1l
bC10Y2IuYyAgICAgICAgICAgfCAgMSAtCj4gICBkcml2ZXJzL3B3bS9wd20tYXRtZWwuYyAgICAg
ICAgICAgICAgIHwgIDEgLQo+ICAgZHJpdmVycy9wd20vcHdtLWJjbS1pcHJvYy5jICAgICAgICAg
ICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdtL3B3bS1iY20ta29uYS5jICAgICAgICAgICAgfCAgMSAt
Cj4gICBkcml2ZXJzL3B3bS9wd20tYmNtMjgzNS5jICAgICAgICAgICAgIHwgIDEgLQo+ICAgZHJp
dmVycy9wd20vcHdtLWJlcmxpbi5jICAgICAgICAgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdt
L3B3bS1icmNtc3RiLmMgICAgICAgICAgICAgfCAgMSAtCj4gICBkcml2ZXJzL3B3bS9wd20tY2xr
LmMgICAgICAgICAgICAgICAgIHwgIDEgLQo+ICAgZHJpdmVycy9wd20vcHdtLWNscHM3MTF4LmMg
ICAgICAgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdtL3B3bS1jcm9zLWVjLmMgICAgICAgICAg
ICAgfCAgMSAtCj4gICBkcml2ZXJzL3B3bS9wd20tZHdjLmMgICAgICAgICAgICAgICAgIHwgIDEg
LQo+ICAgZHJpdmVycy9wd20vcHdtLWVwOTN4eC5jICAgICAgICAgICAgICB8ICAxIC0KPiAgIGRy
aXZlcnMvcHdtL3B3bS1mc2wtZnRtLmMgICAgICAgICAgICAgfCAgMSAtCj4gICBkcml2ZXJzL3B3
bS9wd20taGlidnQuYyAgICAgICAgICAgICAgIHwgIDEgLQo+ICAgZHJpdmVycy9wd20vcHdtLWlt
Zy5jICAgICAgICAgICAgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdtL3B3bS1pbXgtdHBtLmMg
ICAgICAgICAgICAgfCAgMSAtCj4gICBkcml2ZXJzL3B3bS9wd20taW14MS5jICAgICAgICAgICAg
ICAgIHwgIDEgLQo+ICAgZHJpdmVycy9wd20vcHdtLWlteDI3LmMgICAgICAgICAgICAgICB8ICAx
IC0KPiAgIGRyaXZlcnMvcHdtL3B3bS1pbnRlbC1sZ20uYyAgICAgICAgICAgfCAgMSAtCj4gICBk
cml2ZXJzL3B3bS9wd20taXFzNjIwYS5jICAgICAgICAgICAgIHwgIDEgLQo+ICAgZHJpdmVycy9w
d20vcHdtLWp6NDc0MC5jICAgICAgICAgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdtL3B3bS1r
ZWVtYmF5LmMgICAgICAgICAgICAgfCAgMSAtCj4gICBkcml2ZXJzL3B3bS9wd20tbHAzOTQzLmMg
ICAgICAgICAgICAgIHwgIDEgLQo+ICAgZHJpdmVycy9wd20vcHdtLWxwYzE4eHgtc2N0LmMgICAg
ICAgICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdtL3B3bS1scGMzMnh4LmMgICAgICAgICAgICAgfCAg
MSAtCj4gICBkcml2ZXJzL3B3bS9wd20tbHBzcy5jICAgICAgICAgICAgICAgIHwgIDEgLQo+ICAg
ZHJpdmVycy9wd20vcHdtLW1lZGlhdGVrLmMgICAgICAgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMv
cHdtL3B3bS1tZXNvbi5jICAgICAgICAgICAgICAgfCAgMSAtCgpBY2tlZC1ieTogTmVpbCBBcm1z
dHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+ICMgcHdtLW1lc29uCgo+ICAgZHJpdmVy
cy9wd20vcHdtLW1pY3JvY2hpcC1jb3JlLmMgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdtL3B3
bS1tdGstZGlzcC5jICAgICAgICAgICAgfCAgMSAtCj4gICBkcml2ZXJzL3B3bS9wd20tbXhzLmMg
ICAgICAgICAgICAgICAgIHwgIDEgLQo+ICAgZHJpdmVycy9wd20vcHdtLW50eGVjLmMgICAgICAg
ICAgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdtL3B3bS1vbWFwLWRtdGltZXIuYyAgICAgICAg
fCAgMSAtCj4gICBkcml2ZXJzL3B3bS9wd20tcGNhOTY4NS5jICAgICAgICAgICAgIHwgIDEgLQo+
ICAgZHJpdmVycy9wd20vcHdtLXB4YS5jICAgICAgICAgICAgICAgICB8ICAxIC0KPiAgIGRyaXZl
cnMvcHdtL3B3bS1yYXNwYmVycnlwaS1wb2UuYyAgICAgfCAgMSAtCj4gICBkcml2ZXJzL3B3bS9w
d20tcmNhci5jICAgICAgICAgICAgICAgIHwgIDEgLQo+ICAgZHJpdmVycy9wd20vcHdtLXJlbmVz
YXMtdHB1LmMgICAgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdtL3B3bS1yb2NrY2hpcC5jICAg
ICAgICAgICAgfCAgMSAtCj4gICBkcml2ZXJzL3B3bS9wd20tcnotbXR1My5jICAgICAgICAgICAg
IHwgIDEgLQo+ICAgZHJpdmVycy9wd20vcHdtLXNhbXN1bmcuYyAgICAgICAgICAgICB8ICAxIC0K
PiAgIGRyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYyAgICAgICAgICAgICAgfCAgMSAtCj4gICBkcml2
ZXJzL3B3bS9wd20tc2wyOGNwbGQuYyAgICAgICAgICAgIHwgIDEgLQo+ICAgZHJpdmVycy9wd20v
cHdtLXNwZWFyLmMgICAgICAgICAgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdtL3B3bS1zcHJk
LmMgICAgICAgICAgICAgICAgfCAgMSAtCj4gICBkcml2ZXJzL3B3bS9wd20tc3RpLmMgICAgICAg
ICAgICAgICAgIHwgIDEgLQo+ICAgZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMgICAgICAgICAg
ICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi5jICAgICAgICAgICAgICAgfCAgMSAt
Cj4gICBkcml2ZXJzL3B3bS9wd20tc3RtcGUuYyAgICAgICAgICAgICAgIHwgIDEgLQo+ICAgZHJp
dmVycy9wd20vcHdtLXN1bjRpLmMgICAgICAgICAgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdt
L3B3bS1zdW5wbHVzLmMgICAgICAgICAgICAgfCAgMSAtCj4gICBkcml2ZXJzL3B3bS9wd20tdGVn
cmEuYyAgICAgICAgICAgICAgIHwgIDEgLQo+ICAgZHJpdmVycy9wd20vcHdtLXRpZWNhcC5jICAg
ICAgICAgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMvcHdtL3B3bS10aWVocnB3bS5jICAgICAgICAg
ICAgfCAgMSAtCj4gICBkcml2ZXJzL3B3bS9wd20tdHdsLWxlZC5jICAgICAgICAgICAgIHwgIDIg
LS0KPiAgIGRyaXZlcnMvcHdtL3B3bS10d2wuYyAgICAgICAgICAgICAgICAgfCAgMiAtLQo+ICAg
ZHJpdmVycy9wd20vcHdtLXZpc2NvbnRpLmMgICAgICAgICAgICB8ICAxIC0KPiAgIGRyaXZlcnMv
cHdtL3B3bS12dDg1MDAuYyAgICAgICAgICAgICAgfCAgMSAtCj4gICBkcml2ZXJzL3B3bS9wd20t
eGlsaW54LmMgICAgICAgICAgICAgIHwgIDEgLQo+ICAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
cHdtLmMgICAgICAgICB8ICAxIC0KPiAgIGluY2x1ZGUvbGludXgvcHdtLmggICAgICAgICAgICAg
ICAgICAgfCAxMCArKysrKystLS0tCj4gICA2OCBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25z
KCspLCA4MiBkZWxldGlvbnMoLSkKPiAKCjxzbmlwPgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
d20vcHdtLW1lc29uLmMgYi9kcml2ZXJzL3B3bS9wd20tbWVzb24uYwo+IGluZGV4IDI1NTE5Y2Rk
YzJhOS4uNWJlYTUzMjQzZWQyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5j
Cj4gKysrIGIvZHJpdmVycy9wd20vcHdtLW1lc29uLmMKPiBAQCAtMzM1LDcgKzMzNSw2IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgcHdtX29wcyBtZXNvbl9wd21fb3BzID0gewo+ICAgCS5mcmVlID0g
bWVzb25fcHdtX2ZyZWUsCj4gICAJLmFwcGx5ID0gbWVzb25fcHdtX2FwcGx5LAo+ICAgCS5nZXRf
c3RhdGUgPSBtZXNvbl9wd21fZ2V0X3N0YXRlLAo+IC0JLm93bmVyID0gVEhJU19NT0RVTEUsCj4g
ICB9Owo+ICAgCj4gICBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IHB3bV9tZXNvbjhiX3BhcmVu
dF9uYW1lc1tdID0gewoKPHNuaXA+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
