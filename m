Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D26C3DA60
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 06:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D+nNaV87rJ9b6lN5txU8N6djsnLDbU0avq6qqAS0TYM=; b=uCUlM1oT2LB4Ic
	Vz+GNaSPkRCInOB3VbIqbHx0KYVtjuab4GY58N2OuyFMHWEok5rY3NIaqOl5OPvnSSNZ/eJuYrI8T
	+v4nP/l4/94EhSseXIShxRefnrkwo4faQxbWw+xcyOGf044iLINubSThL+pTYE/PqkVXUnxFk5MJ8
	zZGeEJ/eK/KkrIiMR7rRO1fZptUwWm1gUDQH8b/10bufMTNKOrS0v8rphONUxHMGCnH5lMV5etf6R
	MFbQP1ITSSEpAlpcEe94sq1kyV+MXmQT7o9Ed8kmrJ2npLId287X6hpJ50C7FxWj5RojeqsmCUpHP
	ieFaxwjedH14WsGlyEPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUL4g-0000000G3un-2QWY;
	Thu, 18 Jul 2024 06:57:10 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUL4a-0000000G3ts-3lV1;
	Thu, 18 Jul 2024 06:57:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66B00C0011;
	Thu, 18 Jul 2024 06:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721285821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TgZHkXL2FGs1/bjZPDSboGR72yBe//NfgloPvNTjUQ0=;
	b=OlB6nsD5RtGZmYjd7bhjEoZx7QMkbbOT8V45YhxxCFz4y2iiCJe+cf2PVPl+VsXD6UUMqk
	Yc28bGhZQ13OubzP5CW/pjPqqFo91MRM0eVoREVGLvn0MLgNZy6pPxquFKWhNBkv4SbFT2
	sax9ioW5vC5M5bokQz4XncM9ZdU0GCDemzBwA+l1XJdTnXTEUKHI48dxPqMAjv00+G3aQG
	rBXI5/ojqb79XSjovNP74Rn6wSf1My85vfzfK9OmlUEoc3d8vGPg+knHhqSD5yHTRQLUcZ
	BDxiKiWHxBRawYhcLiwX+N2Krj0xmgk4IRTokaqbJaztXMntEG+p6mo1v3ON7A==
Date: Thu, 18 Jul 2024 08:56:51 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Andreas Kemnade <andreas@kemnade.info>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Bjorn Andersson <andersson@kernel.org>, Broadcom internal
 kernel review list <bcm-kernel-feedback-list@broadcom.com>, Chen-Yu Tsai
 <wens@csie.org>, Chester Lin <chester62515@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Damien Le Moal <dlemoal@kernel.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>, Doug
 Berger <opendmb@gmail.com>, Emilio =?UTF-8?Q?L=C3=B3pez?=
 <emilio@elopez.com.ar>, Fabio Estevam <festevam@gmail.com>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Ghennadi Procopciuc
 <ghennadi.procopciuc@oss.nxp.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jacky Bai <ping.bai@nxp.com>, Jaroslav Kysela
 <perex@perex.cz>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jiri Slaby 
 <jirislaby@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Kevin Hilman
 <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>, Lars-Peter
 Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown
 <broonie@kernel.org>, Matthias Brugger <mbrugger@suse.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Michael Turquette <mturquette@baylibre.com>,
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Nicholas Piggin
 <npiggin@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Richard Leitner
 <richard.leitner@linux.dev>, Rob Herring <robh@kernel.org>, Roger Quadros
 <rogerq@kernel.org>, Samuel Holland <samuel@sholland.org>, Saravana Kannan
 <saravanak@google.com>, Shawn Guo <shawnguo@kernel.org>, Takashi Iwai
 <tiwai@suse.com>, Thomas Gleixner  <tglx@linutronix.de>, Tony Lindgren
 <tony@atomide.com>, Uwe =?UTF-8?Q?Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, llvm@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, Andre Przywara <andre.przywara@arm.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Uwe =?UTF-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>
Subject: Re: [PATCH v2] of: remove internal arguments from
 of_property_for_each_u32()
Message-ID: <20240718085651.63ddfb20@booty>
In-Reply-To: <1e36b1ba8af3584128550822a70cb072.sboyd@kernel.org>
References: <20240717-of_property_for_each_u32-v2-1-4060990f49c9@bootlin.com>
	<1e36b1ba8af3584128550822a70cb072.sboyd@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_235705_930785_B99F3528 
X-CRM114-Status: GOOD (  13.34  )
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

Hello Stephen,

On Wed, 17 Jul 2024 16:33:34 -0700
Stephen Boyd <sboyd@kernel.org> wrote:

> > @@ -1191,20 +1191,24 @@ static int si5351_dt_parse(struct i2c_client *client,
> >          * property silabs,pll-source : <num src>, [<..>]
> >          * allow to selectively set pll source
> >          */
> > -       of_property_for_each_u32(np, "silabs,pll-source", prop, p, num) {
> > +       sz = of_property_read_variable_u32_array(np, "silabs,pll-source", array, 2, 4);
> > +       sz = (sz == -EINVAL) ? 0 : sz; /* Missing property is OK */
> > +       if (sz < 0)
> > +               return dev_err_probe(&client->dev, sz, "invalid pll-source");  
> 
> Needs a newline on the printk message.

Ouch! Fix queued for v3.

Thanks,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
