Return-Path: <SRS0=17fP=LL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC254C2B9F4
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 09:15:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B8456128C
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 09:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B8456128C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FNitRk+YoeOabNMD6Tuslrn6poWesQMWZ99GDIA6cV4=; b=fYPIzK+3oByFbr
	FswqGwVObH54ci91X+CnSrG/bM48myYOllj0S/DGmcbZQC6pH8tdGTBJjxzLeYb3rW+yvm84gMs9K
	WYWKBMfQM5sVv84/F7JmhmedzTiW/78wCVewo+L1LNHQfeUcZ9iwvPDdwCPzRe6dVMEe6WUsDasHz
	h93usWdsup615Yrwtao/+67d4mwHRJaODEbDornq9LStmLlBcLKzLRe1keqpkGfodUhy7MhmBEHwO
	QJ3HZzO4NaoRbNDofvYU+bQpnMrov1CEvgLeAPz5wSEynEjuXEmfubj7dmfclGGvbfeN3Ylp3K7uK
	BV2iq7TqVe7CtajB0opQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lto7A-009cAa-Rn; Thu, 17 Jun 2021 09:15:08 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lto76-009c7L-FE
 for linux-riscv@lists.infradead.org; Thu, 17 Jun 2021 09:15:06 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id k8so163853vsg.12
 for <linux-riscv@lists.infradead.org>; Thu, 17 Jun 2021 02:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NiiU6fiVLbE4syulfvGQUEnbQNZvmtFPXY1KRGZ4VKs=;
 b=tspUddDmWP1nXGb8dYzDapkXukDhtaQZ8yVoZQOykE4MszNmnQ2Jc7pAu3v7qBcemT
 UyLs98rU9nEy8e3wRIJkxsl8g3L8Eb/AvQODxlfCIA8Y+SqSVtbG2msAYvDIZFEizfbY
 20UD8As6h7+oRqO/LBfp1JKzos5qS4bIZn22juJCAEEZOMhbhqM1f/S6KCbcFkkK35Tr
 P7laFgsJQmqhNYip+ALRHKPPvbOtIHBYtRpZR/hgm9hpO06Ne5Y1MzvmGVRytTLSpocX
 +CLKqhQk6OUYMP0R+b/JJQ4/QkH+6e5JGgp8Hm8OfSHuZ6CIo4hVwTpj+jWWd51a3cq+
 7N8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NiiU6fiVLbE4syulfvGQUEnbQNZvmtFPXY1KRGZ4VKs=;
 b=g3AtOyvKTkHn6sA0/JunOuex17upxIogT4T+ccNk7PtXubFUdf9wg1sOzTPWPdXyD6
 adi3EDesk51a++PeosJ1sles2sPoPdjMgxnzl/BMNb1BMJflmCoPkhJtRY+7+NYl9/Gy
 6G3XI1fXF84E2whgxa6wudFCgjHmw/oSimCbf001xMWBPM6sKEVBRwKQLxuuAHDf3h4c
 x/c3ZXoCTzyxQdQ4ZPqnbY74AmCBlQx9mmka57rnQaXxXDaatSDg32BoFFdMkkk3AeCk
 MLThcyO1myyYIiQXP9HI6IFt9ubgjTkUJSdzcfrCKWWI8qrJeqPdF/pSJplGOe+MmO9n
 YuZA==
X-Gm-Message-State: AOAM531Qw8fgSAMvoo3j6h/tIoJMHSOpfGQLj6KOWMQplEKbcHs8jqe4
 QGO49YyVrcgFnBRpLqTmp8C/vt+VR2TuaHn6ZEqbsQ==
X-Google-Smtp-Source: ABdhPJyDDRUn2syWiuy8XigFtL3iDYKz59Ub/6ekAvgFfmAY9tRuxX/nulbHrrDC8J99+RHvCUQeMQ9XnjKDaURJSR4=
X-Received: by 2002:a05:6102:2159:: with SMTP id
 h25mr3349328vsg.19.1623921301368; 
 Thu, 17 Jun 2021 02:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210615191543.1043414-1-robh@kernel.org>
In-Reply-To: <20210615191543.1043414-1-robh@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 17 Jun 2021 11:14:25 +0200
Message-ID: <CAPDyKFrY4UOO5CbZ8Bj7AH2+3Wo1PRpUv+Zs96tub=MzGuGrrQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop redundant minItems/maxItems
To: Rob Herring <robh@kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-ide@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-crypto@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, dmaengine@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, 
 alsa-devel@alsa-project.org, 
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, 
 netdev <netdev@vger.kernel.org>, linux-can@vger.kernel.org, 
 Linux PCI <linux-pci@vger.kernel.org>, linux-phy@lists.infradead.org, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-rtc@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
 Linux PM <linux-pm@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>,
 linux-watchdog@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, 
 Stephen Boyd <sboyd@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, 
 Joerg Roedel <joro@8bytes.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Jakub Kicinski <kuba@kernel.org>, 
 Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Andrew Lunn <andrew@lunn.ch>, 
 Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Kishon Vijay Abraham I <kishon@ti.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Lee Jones <lee.jones@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alessandro Zummo <a.zummo@towertech.it>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_021504_600150_2A40BB0C 
X-CRM114-Status: GOOD (  19.53  )
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

T24gVHVlLCAxNSBKdW4gMjAyMSBhdCAyMToxNSwgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBJZiBhIHByb3BlcnR5IGhhcyBhbiAnaXRlbXMnIGxpc3QsIHRoZW4gYSAn
bWluSXRlbXMnIG9yICdtYXhJdGVtcycgd2l0aCB0aGUKPiBzYW1lIHNpemUgYXMgdGhlIGxpc3Qg
aXMgcmVkdW5kYW50IGFuZCBjYW4gYmUgZHJvcHBlZC4gTm90ZSB0aGF0IGlzIERUCj4gc2NoZW1h
IHNwZWNpZmljIGJlaGF2aW9yIGFuZCBub3Qgc3RhbmRhcmQganNvbi1zY2hlbWEgYmVoYXZpb3Iu
IFRoZSB0b29saW5nCj4gd2lsbCBmaXh1cCB0aGUgZmluYWwgc2NoZW1hIGFkZGluZyBhbnkgdW5z
cGVjaWZpZWQgbWluSXRlbXMvbWF4SXRlbXMuCj4KPiBUaGlzIGNvbmRpdGlvbiBpcyBwYXJ0aWFs
bHkgY2hlY2tlZCB3aXRoIHRoZSBtZXRhLXNjaGVtYSBhbHJlYWR5LCBidXQKPiBvbmx5IGlmIGJv
dGggJ21pbkl0ZW1zJyBhbmQgJ21heEl0ZW1zJyBhcmUgZXF1YWwgdG8gdGhlICdpdGVtcycgbGVu
Z3RoLgo+IEFuIGltcHJvdmVkIG1ldGEtc2NoZW1hIGlzIHBlbmRpbmcuCj4KPiBDYzogSmVucyBB
eGJvZSA8YXhib2VAa2VybmVsLmRrPgo+IENjOiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5v
cmc+Cj4gQ2M6IEhlcmJlcnQgWHUgPGhlcmJlcnRAZ29uZG9yLmFwYW5hLm9yZy5hdT4KPiBDYzog
IkRhdmlkIFMuIE1pbGxlciIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+Cj4gQ2M6IERhdmlkIEFpcmxp
ZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
Pgo+IENjOiBWaW5vZCBLb3VsIDx2a291bEBrZXJuZWwub3JnPgo+IENjOiBCYXJ0b3N6IEdvbGFz
emV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgo+IENjOiBLYW1hbCBEYXN1IDxrZGFz
dS5rZGV2QGdtYWlsLmNvbT4KPiBDYzogSm9uYXRoYW4gQ2FtZXJvbiA8amljMjNAa2VybmVsLm9y
Zz4KPiBDYzogTGFycy1QZXRlciBDbGF1c2VuIDxsYXJzQG1ldGFmb28uZGU+Cj4gQ2M6IFRob21h
cyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+IENjOiBNYXJjIFp5bmdpZXIgPG1hekBr
ZXJuZWwub3JnPgo+IENjOiBKb2VyZyBSb2VkZWwgPGpvcm9AOGJ5dGVzLm9yZz4KPiBDYzogSmFz
c2kgQnJhciA8amFzc2lzaW5naGJyYXJAZ21haWwuY29tPgo+IENjOiBNYXVybyBDYXJ2YWxobyBD
aGVoYWIgPG1jaGVoYWJAa2VybmVsLm9yZz4KPiBDYzogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
eXN6dG9mLmtvemxvd3NraUBjYW5vbmljYWwuY29tPgo+IENjOiBVbGYgSGFuc3NvbiA8dWxmLmhh
bnNzb25AbGluYXJvLm9yZz4KPiBDYzogSmFrdWIgS2ljaW5za2kgPGt1YmFAa2VybmVsLm9yZz4K
PiBDYzogV29sZmdhbmcgR3JhbmRlZ2dlciA8d2dAZ3JhbmRlZ2dlci5jb20+Cj4gQ2M6IE1hcmMg
S2xlaW5lLUJ1ZGRlIDxta2xAcGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IEFuZHJldyBMdW5uIDxhbmRy
ZXdAbHVubi5jaD4KPiBDYzogVml2aWVuIERpZGVsb3QgPHZpdmllbi5kaWRlbG90QGdtYWlsLmNv
bT4KPiBDYzogVmxhZGltaXIgT2x0ZWFuIDxvbHRlYW52QGdtYWlsLmNvbT4KPiBDYzogQmpvcm4g
SGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KPiBDYzogS2lzaG9uIFZpamF5IEFicmFoYW0g
SSA8a2lzaG9uQHRpLmNvbT4KPiBDYzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5h
cm8ub3JnPgo+IENjOiAiVXdlIEtsZWluZS1Lw7ZuaWciIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0
cm9uaXguZGU+Cj4gQ2M6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gQ2M6IE9o
YWQgQmVuLUNvaGVuIDxvaGFkQHdpemVyeS5jb20+Cj4gQ2M6IE1hdGhpZXUgUG9pcmllciA8bWF0
aGlldS5wb2lyaWVyQGxpbmFyby5vcmc+Cj4gQ2M6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVu
Z3V0cm9uaXguZGU+Cj4gQ2M6IFBhdWwgV2FsbXNsZXkgPHBhdWwud2FsbXNsZXlAc2lmaXZlLmNv
bT4KPiBDYzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KPiBDYzogQWxiZXJ0
IE91IDxhb3VAZWVjcy5iZXJrZWxleS5lZHU+Cj4gQ2M6IEFsZXNzYW5kcm8gWnVtbW8gPGEuenVt
bW9AdG93ZXJ0ZWNoLml0Pgo+IENjOiBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxv
bmlAYm9vdGxpbi5jb20+Cj4gQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91
bmRhdGlvbi5vcmc+Cj4gQ2M6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4KPiBDYzog
WmhhbmcgUnVpIDxydWkuemhhbmdAaW50ZWwuY29tPgo+IENjOiBEYW5pZWwgTGV6Y2FubyA8ZGFu
aWVsLmxlemNhbm9AbGluYXJvLm9yZz4KPiBDYzogV2ltIFZhbiBTZWJyb2VjayA8d2ltQGxpbnV4
LXdhdGNoZG9nLm9yZz4KPiBDYzogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pgo+
IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CgpBY2tlZC1ieTog
VWxmIEhhbnNzb24gPHVsZi5oYW5zc29uQGxpbmFyby5vcmc+ICMgZm9yIE1NQwoKWy4uLl0KCktp
bmQgcmVnYXJkcwpVZmZlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
