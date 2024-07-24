Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD883C3DA63
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jul 2024 13:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+JTVM4KciWb/yVUTI2VLkXOgWPjjxVLyV/6D8VpKzZ4=; b=fbZ4Iz5NhaJ28m
	1XgmnstLNHYgcM7NKf8SwSmoV9FcKmMIZXE8saEEgXXtKiQW4a8A1MYwHlDOD8QrB4JKkq/aan9Dk
	8iRH7C+etjdtuEBFhLqrVimEbI+ZI67soObYArNS30XbDsOzLiJ5BLLBo7ulgUJK2emioMYftUjSk
	MvlDWQWbDSdu36tWQO+bTU5XmOd14dQjE2aynT3egrdUbBS+UmMT48T9UxVHFq3TggIlJol+tU4xr
	Q/plsIayXTYo+L/qTLbzF5GLEsuwBhqB50QOgJEFCbKr8S3fT1kkROt5gEPDj0cq59rjrmjQ7hVpY
	krPtTn4kMT3GPxlWLNpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWcRJ-0000000FVWI-22oa;
	Wed, 24 Jul 2024 13:53:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWcRD-0000000FVTI-48Vq;
	Wed, 24 Jul 2024 13:53:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7F6FF6120A;
	Wed, 24 Jul 2024 13:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33237C4AF15;
	Wed, 24 Jul 2024 13:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721829229;
	bh=JHsErZ1Ymd3xIUMEC7/hpzB8p/mlL/O9e+IDU+AKN8I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SEaWmgjaMdyUPpB+3WNdnu/Gu9TlKShfVaI3kaPtTDUgi1+yOW7Vw3WRWHs1vW6yC
	 Y3vEwLQLJbKWWj7Dx4mkYjG+Fx1/bCL3TcivZM6ZsDaDYvp/z9r7LEiiNnP5NYrZkJ
	 SYAnbs406vjYmOQu2+pBQlU/xloyJFw0x9MXtYErO8Y/t++x+Y1gVMuplBSs0dRN1A
	 aFLBZLP7F5kEjA3DsPqSbJfUS1DcN6ec3Q2ZQcBVKquPBr0eI+0v6rCG5wVA5SqCn8
	 HZaFcNq4Nj/FL+NccJEe0+3FebAjkiI31jd7YbrmcZFhm5ZDnSwVEnGW06SIOREjmw
	 xrF3Btp6K9YPg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52f0277daa5so5767301e87.0;
        Wed, 24 Jul 2024 06:53:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUwi9iV/HQewlb7XtGQXCAXBNkWQu4TZmBYVQKeSJTE2E/T4o9j+qYizpkxt8mF06mSlrQ9AcqSilxkphukHOgdgMnP0HKXbsaqss4OcCVOZeFliHvPkCgGO3KPec2IFq6lwO/yCyGtwzm81uVlJ/0oLTZq98Y=
X-Gm-Message-State: AOJu0YzwWuAk+ovAt0y0D9jgsycmQCWtn3nHOYgUDMyMjo9IR5EY8TCH
	J+XBRLVtvxzuR0AhcLlMtJJK7Gb8X6zzinxtOcM82PdzZ+5kWHCY2p056V/IXup9R+CDlJO3dvJ
	9Bpaa5xJvugk0JsPev/o2Aqx9Hg==
X-Google-Smtp-Source: AGHT+IEk3YhHLLuWHQez8La65BtnRIR9t5/9BONqzEk5mOwWdTbwESXZpTYF2WmMXYwp6gfL+EkMMSd8FeS9sIIdSCk=
X-Received: by 2002:a05:6512:3984:b0:51a:f689:b4df with SMTP id
 2adb3069b0e04-52efb7db65bmr9357884e87.44.1721829216849; Wed, 24 Jul 2024
 06:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240717-of_property_for_each_u32-v2-1-4060990f49c9@bootlin.com>
 <1e36b1ba8af3584128550822a70cb072.sboyd@kernel.org> <20240718085651.63ddfb20@booty>
In-Reply-To: <20240718085651.63ddfb20@booty>
From: Rob Herring <robh@kernel.org>
Date: Wed, 24 Jul 2024 08:53:24 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKtOTgoDgfwq9Guvt_LbtnHHGJ+PDt-wgVRHU=oVzwhHw@mail.gmail.com>
Message-ID: <CAL_JsqKtOTgoDgfwq9Guvt_LbtnHHGJ+PDt-wgVRHU=oVzwhHw@mail.gmail.com>
Subject: Re: [PATCH v2] of: remove internal arguments from of_property_for_each_u32()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Andreas Kemnade <andreas@kemnade.info>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Bjorn Andersson <andersson@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Chen-Yu Tsai <wens@csie.org>, 
	Chester Lin <chester62515@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Damien Le Moal <dlemoal@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Doug Berger <opendmb@gmail.com>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	Fabio Estevam <festevam@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jacky Bai <ping.bai@nxp.com>, 
	Jaroslav Kysela <perex@perex.cz>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jiri Slaby <jirislaby@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, 
	Matthias Brugger <mbrugger@suse.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Michael Turquette <mturquette@baylibre.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Richard Leitner <richard.leitner@linux.dev>, 
	Roger Quadros <rogerq@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Saravana Kannan <saravanak@google.com>, Shawn Guo <shawnguo@kernel.org>, 
	Takashi Iwai <tiwai@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Tony Lindgren <tony@atomide.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	llvm@lists.linux.dev, linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, Andre Przywara <andre.przywara@arm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_065352_268631_3AB51DE0 
X-CRM114-Status: GOOD (  14.69  )
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

T24gVGh1LCBKdWwgMTgsIDIwMjQgYXQgMTo1N+KAr0FNIEx1Y2EgQ2VyZXNvbGkgPGx1Y2EuY2Vy
ZXNvbGlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gU3RlcGhlbiwKPgo+IE9uIFdlZCwg
MTcgSnVsIDIwMjQgMTY6MzM6MzQgLTA3MDAKPiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gPiA+IEBAIC0xMTkxLDIwICsxMTkxLDI0IEBAIHN0YXRpYyBpbnQgc2k1
MzUxX2R0X3BhcnNlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsCj4gPiA+ICAgICAgICAgICog
cHJvcGVydHkgc2lsYWJzLHBsbC1zb3VyY2UgOiA8bnVtIHNyYz4sIFs8Li4+XQo+ID4gPiAgICAg
ICAgICAqIGFsbG93IHRvIHNlbGVjdGl2ZWx5IHNldCBwbGwgc291cmNlCj4gPiA+ICAgICAgICAg
ICovCj4gPiA+IC0gICAgICAgb2ZfcHJvcGVydHlfZm9yX2VhY2hfdTMyKG5wLCAic2lsYWJzLHBs
bC1zb3VyY2UiLCBwcm9wLCBwLCBudW0pIHsKPiA+ID4gKyAgICAgICBzeiA9IG9mX3Byb3BlcnR5
X3JlYWRfdmFyaWFibGVfdTMyX2FycmF5KG5wLCAic2lsYWJzLHBsbC1zb3VyY2UiLCBhcnJheSwg
MiwgNCk7Cj4gPiA+ICsgICAgICAgc3ogPSAoc3ogPT0gLUVJTlZBTCkgPyAwIDogc3o7IC8qIE1p
c3NpbmcgcHJvcGVydHkgaXMgT0sgKi8KPiA+ID4gKyAgICAgICBpZiAoc3ogPCAwKQo+ID4gPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoJmNsaWVudC0+ZGV2LCBzeiwgImlu
dmFsaWQgcGxsLXNvdXJjZSIpOwo+ID4KPiA+IE5lZWRzIGEgbmV3bGluZSBvbiB0aGUgcHJpbnRr
IG1lc3NhZ2UuCj4KPiBPdWNoISBGaXggcXVldWVkIGZvciB2My4KCkkgbmVlZCB2MyBsaWtlIHRv
ZGF5IGlmIEknbSBnb2luZyB0byBzZW5kIGl0IGZvciByYzEuCgpSb2IKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
