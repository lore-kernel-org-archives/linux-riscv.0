Return-Path: <SRS0=uiah=DN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4B6C47423
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2020 06:58:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75ED220760
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2020 06:58:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hSSDW6f4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jn2dIC4K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75ED220760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V6WT4u5mtaR9kcmLQknEKK9mwuSDT5WdJTkVyFaGDr4=; b=hSSDW6f4d4lK3r1dSk9WuQt02
	0l81AGBVqOc6/3TDPSv+RaVHs9lmT8tQvgZbwu+Ei9j7tHZ/jUxr7nqO2QQe4jbE7lTvkhbBtFUXP
	nhgQdt20wLbXXO1pzS8+aQW7nxoyWUSNJkFNHJp4AMuBbBg60nnGTDSPzBAortJWLtr4KNAstRsBi
	DtBDRPfpTbBujTBIKUfTF6ipDSszemnR37kWVchpAaO8BiptN1Z5ZeM8BfBK5+5wq9gUYdIDbiqEm
	/3IHhivysM8msxBRvIb61ltJ6Li7lcBWDd8oShvfDhrByU9IQ4NYSI6btlVyfeuJh2jbKcQ3JqT3b
	r1SDFCTUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPgvg-0003Au-C5; Tue, 06 Oct 2020 06:58:32 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPgvc-00039g-7y
 for linux-riscv@lists.infradead.org; Tue, 06 Oct 2020 06:58:30 +0000
Received: by mail-wm1-x344.google.com with SMTP id 13so1764633wmf.0
 for <linux-riscv@lists.infradead.org>; Mon, 05 Oct 2020 23:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=hye8oZPllXv0LLz+UWG2B82nJ6IN2QnHfKrsEX8XCOU=;
 b=jn2dIC4KneJcMCE5DY3o93rmWgdTmK7NJWwKNWGocC7HbxwqveIdxS9nVru8ryq+P9
 s4//ef94qJ6Y8ujWnpglPZlIlD6sJ33blfTKKcaCdwJolql9IFEUfzJMHCTe1JnaG8Iw
 b+YeHxV9DI6DSD3tgOAF3IaWem5VxRfAN0ODuGo/qw2A8ReI6qDWtdlFFibEvRuFiEoQ
 dhilbFbgvuG8V67ydtdAffL1xmKMRbv76Ctys34uqkoMVb3gFX2RETn3H/bHFtSxghuV
 ji7JhUukKOJOEajfS3LrzYX2Rf2L6FpU2JZ9jHfMZk5oQaZMZKMZfy/k1RR5/u729NJu
 K0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hye8oZPllXv0LLz+UWG2B82nJ6IN2QnHfKrsEX8XCOU=;
 b=nVUrzayz902uBQFMVgbtxNgBqMXNuYn0F5+6I3K7wZGPSZMgmnc7URie0Aqu4uDI+6
 pgR8jm8ByyGnesjDZIDTyk4thSiH/cTJSqvDKtQNrbAEB74oyGJIxsMgyemgfIkVlQ45
 9/N9/w+UbzC7P8CSZy1xT2g2/qU5v30dqeov+hBXSXVbLZpVbDszVTYfmhSJ0iNPjdzm
 4DeDMkJRm1Zogaky2BUsloMC3FfBDnwKRJGBc3O23xRuAsgEel0WUQ1b2UtPgB5P1jnL
 SU6LgwJYCh08zaTcq3p1HziiW3jKSeim3QXoILnZfSjv6/jeQTzkLnSdtFk97NeXitLW
 SH8A==
X-Gm-Message-State: AOAM532cwduyfMByfBc3xR3ocfK2/lu6MIjqGBShxsd8iUy7ca6ExAdi
 Sqan8GO69BNeA7/LqQvjeYre8Q==
X-Google-Smtp-Source: ABdhPJxsvKtzCqkv4fxGZg3y/AIgf4rU1S8D4EatsKLRXGnqjE4r6Ftdz8iBdl2gfcmAi+GG7YDezw==
X-Received: by 2002:a1c:2cc2:: with SMTP id s185mr3211564wms.77.1601967506851; 
 Mon, 05 Oct 2020 23:58:26 -0700 (PDT)
Received: from dell ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id u12sm3158245wrt.81.2020.10.05.23.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 23:58:26 -0700 (PDT)
Date: Tue, 6 Oct 2020 07:58:20 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/4] dt-bindings: Explicitly allow additional properties
 in common schemas
Message-ID: <20201006065820.GY6148@dell>
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-5-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005183830.486085-5-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_025828_318978_FF7ED8B4 
X-CRM114-Status: GOOD (  13.13  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-usb@vger.kernel.org, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-ide@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-riscv@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-rtc@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, linux-mips@vger.kernel.org,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, linux-pm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-watchdog@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-i2c@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Richard Weinberger <richard@nod.at>, dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAwNSBPY3QgMjAyMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cgo+IEluIG9yZGVyIHRvIGFk
ZCBtZXRhLXNjaGVtYSBjaGVja3MgZm9yIGFkZGl0aW9uYWwvdW5ldmFsdWF0ZWRQcm9wZXJ0aWVz
Cj4gYmVpbmcgcHJlc2VudCwgYWxsIHNjaGVtYSBuZWVkIHRvIG1ha2UgdGhpcyBleHBsaWNpdC4g
QXMgY29tbW9uL3NoYXJlZAo+IHNjaGVtYSBhcmUgaW5jbHVkZWQgYnkgb3RoZXIgc2NoZW1hcywg
dGhleSBzaG91bGQgYWx3YXlzIGFsbG93IGZvcgo+IGFkZGl0aW9uYWxQcm9wZXJ0aWVzLgoKQWNr
ZWQtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgotLSAKTGVlIEpvbmVzIFvm
nY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5h
cm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFy
bzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
