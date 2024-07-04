Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DEFC30653
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 21:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lB16bPLYeDONvcTzPpsRXIyvgO13csOhwPHD7YijYDc=; b=oH58n2OyQms0fA
	SNQKBYIIM7rMhh8VQm2Gfyl4jsQYhEYlyNGmQ5Q8U/JuJrVEuvWwlEB84R+MzSqO/GO8a1ajI0c+Q
	HzykNlYYFf9qGUii6PKQ1cfGtlKTFYMeUyzGzgs1ycDqN9RRCpHOpkjsScPcngaMSMUITLPfgC4RZ
	IUNdkXoI7ymAk+aLIKpFphY/5mbS5Au6DOzBpKyv63uI8/GexCyZLuwjPHuSZkowDc6+x+olKCPIR
	Y1Z9FMOhCF3vtvDrgorR+HuM+7Yy9TOI6DLcJFVq+exdz5DYf/V9D4JRjwdpVsfrHOlro9mZc4BYL
	Vhlv2mSYx/Ke9uL7Xb8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPU5g-0000000ER99-0p4D;
	Thu, 04 Jul 2024 21:34:08 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPU5b-0000000ER88-0pCQ;
	Thu, 04 Jul 2024 21:34:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2FECD240006;
	Thu,  4 Jul 2024 21:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720128840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q5IBUlpk519TSgD6Osr1ZyaFchjMZnggQfjeK80Zda4=;
	b=OW87YyqxfC/aisrIaK1t9t5rNi1tv8W2h+PNzPy/mbY2MLmPV40lXp/tAQHoWvKu4AWsjJ
	t1azANkvi0z3C8c1zRY+dEwMFTe4IitMjntGqs0weShRTHE6S9YLuTRM50bq5PQggOGH3h
	VTb1TQxTb2kbXJ5aFHoZUbrXoTHiCyUiMq8h02kLT12CEGs/CoF9H4DdX4VqNE0u4czR5l
	eyYcAzvCetxJAj9pUcmrGPPibpICDtqgs90easLdjOXXyAP4rPd46IcoQOzY7rAZwcoezR
	bPShL3nDBJRC3irR8YI4aF7W8jyTpxGZxv27dKpKX4ap2xqwkURoZOagKsVprQ==
Date: Thu, 4 Jul 2024 23:33:46 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Bjorn Andersson <andersson@kernel.org>, Emilio
 =?UTF-8?Q?L=C3=B3pez?= <emilio@elopez.com.ar>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Krzysztof Kozlowski <krzk@kernel.org>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel
 review list <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan
 Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Uwe
 =?UTF-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Richard
 Leitner <richard.leitner@linux.dev>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, "Naveen N. Rao"
 <naveen.n.rao@linux.ibm.com>, Damien Le Moal <dlemoal@kernel.org>, "Peng
 Fan (OSS)" <peng.fan@oss.nxp.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, llvm@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH 20/20] of: deprecate and rename
 of_property_for_each_u32()
Message-ID: <20240704233346.478431f8@booty>
In-Reply-To: <20240703180111.GA1245093-robh@kernel.org>
References: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
	<20240703-of_property_for_each_u32-v1-20-42c1fc0b82aa@bootlin.com>
	<20240703180111.GA1245093-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_143403_559205_6852B29B 
X-CRM114-Status: GOOD (  22.23  )
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

Hello Rob,

On Wed, 3 Jul 2024 12:01:11 -0600
Rob Herring <robh@kernel.org> wrote:

> On Wed, Jul 03, 2024 at 12:37:04PM +0200, Luca Ceresoli wrote:
> > of_property_for_each_u32() is meant to disappear. All the call sites not
> > using the 3rd and 4th arguments have already been replaced by
> > of_property_for_each_u32_new().
> > 
> > Deprecate the old macro. Also rename it to minimize the number of new
> > usages and encourage conversion to the of_property_for_each_u32_new() macro
> > in not(-yet)-upstream code.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > 
> > ---
> > 
> > Notes:
> > 
> >  * The following files have not been build-tested simply because I haven't
> >    managed to have a config that enables them so far:
> > 
> >      drivers/irqchip/irq-pic32-evic.c
> >      drivers/pinctrl/pinctrl-k210.c
> > 
> >  * These have not been converted yet as they are not trivial, and they will
> >    need to use a more specific function that does the lookup they need and
> >    returns the result:
> > 
> >      drivers/clk/clk-si5351.c  
> 
> I would do something like this:

Thanks for the suggestions.

I literally did not even try to look at what the code does in these few
places, and still haven't, simply due to time availability. But I wanted
to get a first series out as soon as possible as it would probably be
useful to Peng [0]. Yours will be a good starting point for when I
tackle those few remaining usages of the "old" macro. Thanks.

[0] https://lore.kernel.org/all/20240628161617.6bc9ca3c@booty/

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
