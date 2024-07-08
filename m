Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F96C3271E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jul 2024 07:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5T+Du8WbFmDkltxMaRXnEuO2Tu/DkTIaUEZKywgMorA=; b=ai5SlzTT1qp3fQ
	PMd08luq0N4KD3TO35uFxsrGVIRDdG3lPWxvK7xGVSz3HDjBWvEu8CHc09brH++QXdhRbI4jLmiEs
	ER2+fKY2IckgnwuZE3i3mR64cqBkOAWMVOKD2JtpGq53I67RpknYCyJgS42UyOj4idngBHwDkh9ZQ
	sgb2CKN9oETAFAJmmqlLEdUw5oO2hIxSebLjcQkr5iU+XxTWLEk2UBjXODwC0e4apG5T+9KpzoOBA
	44Om+6mGiC2eFFtMI/d5WPiW2kgv+PZz9Zk8HPUip43aP1SJ9NGDS2EUjCLGL8/Z0inoSdWpBjN+p
	WFA9q49+cUMcjyP6Jlig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQj4R-000000034RF-2BPW;
	Mon, 08 Jul 2024 07:45:59 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQj4O-000000034Ov-1nqF
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jul 2024 07:45:58 +0000
X-Envelope-To: luca.ceresoli@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1720424745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6r0t4bqCeyTcKMQipHqJ13XIJ0M/NNLgBRa8TFFkq0k=;
	b=gh9N9Uw0u8C6T2INQwENuJbySC4x56TU/bCYId7J19tXTNv2leS8YvS59ZHGfqV5iEcc2W
	giRbXLJT0kVM9blL6cZF0eI0W/NaGwdLwsoCYd+qWtWL+ssOTOGgYIaHoZkEp8DXV+BDKD
	QBEscHkTSbtdZ0QzmCUfJBvJe1gdrAw=
X-Envelope-To: ojeda@kernel.org
X-Envelope-To: robh@kernel.org
X-Envelope-To: saravanak@google.com
X-Envelope-To: nathan@kernel.org
X-Envelope-To: mturquette@baylibre.com
X-Envelope-To: sboyd@kernel.org
X-Envelope-To: tony@atomide.com
X-Envelope-To: andersson@kernel.org
X-Envelope-To: emilio@elopez.com.ar
X-Envelope-To: wens@csie.org
X-Envelope-To: jernej.skrabec@gmail.com
X-Envelope-To: samuel@sholland.org
X-Envelope-To: krzk@kernel.org
X-Envelope-To: daniel.lezcano@linaro.org
X-Envelope-To: tglx@linutronix.de
X-Envelope-To: florian.fainelli@broadcom.com
X-Envelope-To: bcm-kernel-feedback-list@broadcom.com
X-Envelope-To: linus.walleij@linaro.org
X-Envelope-To: brgl@bgdev.pl
X-Envelope-To: jic23@kernel.org
X-Envelope-To: lee@kernel.org
X-Envelope-To: shawnguo@kernel.org
X-Envelope-To: kernel@pengutronix.de
X-Envelope-To: ukleinek@kernel.org
X-Envelope-To: gregkh@linuxfoundation.org
X-Envelope-To: jirislaby@kernel.org
X-Envelope-To: lgirdwood@gmail.com
X-Envelope-To: broonie@kernel.org
X-Envelope-To: nicolas.ferre@microchip.com
X-Envelope-To: mpe@ellerman.id.au
X-Envelope-To: npiggin@gmail.com
X-Envelope-To: christophe.leroy@csgroup.eu
X-Envelope-To: naveen.n.rao@linux.ibm.com
X-Envelope-To: dlemoal@kernel.org
X-Envelope-To: peng.fan@oss.nxp.com
X-Envelope-To: thomas.petazzoni@bootlin.com
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: llvm@lists.linux.dev
X-Envelope-To: linux-clk@vger.kernel.org
X-Envelope-To: linux-omap@vger.kernel.org
X-Envelope-To: linux-arm-msm@vger.kernel.org
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-sunxi@lists.linux.dev
X-Envelope-To: linux-samsung-soc@vger.kernel.org
X-Envelope-To: linux-gpio@vger.kernel.org
X-Envelope-To: linux-iio@vger.kernel.org
X-Envelope-To: linux-pwm@vger.kernel.org
X-Envelope-To: linux-serial@vger.kernel.org
X-Envelope-To: linux-usb@vger.kernel.org
X-Envelope-To: patches@opensource.cirrus.com
X-Envelope-To: linux-sound@vger.kernel.org
X-Envelope-To: linuxppc-dev@lists.ozlabs.org
X-Envelope-To: linux-riscv@lists.infradead.org
Date: Mon, 8 Jul 2024 09:45:39 +0200
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Bjorn Andersson <andersson@kernel.org>, 
	Emilio =?utf-8?B?TMOzcGV6?= <emilio@elopez.com.ar>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Damien Le Moal <dlemoal@kernel.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	llvm@lists.linux.dev, linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 15/20] usb: usb251xb: convert to
 of_property_for_each_u32_new()
Message-ID: <34bbebxag4neccfkb4isi4bx5uvi2dk446bqqmfmtru4vwbehk@hp7vufvfyon4>
References: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
 <20240703-of_property_for_each_u32-v1-15-42c1fc0b82aa@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240703-of_property_for_each_u32-v1-15-42c1fc0b82aa@bootlin.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_004556_794349_A6DA962D 
X-CRM114-Status: GOOD (  17.23  )
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

Hi Luca,

On Wed, Jul 03, 2024 at 12:36:59PM GMT, Luca Ceresoli wrote:
> Simplify code using of_property_for_each_u32_new() as the two additional
> parameters in of_property_for_each_u32() are not used here.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

please feel free to add:

Acked-by: Richard Leitner <richard.leitner@linux.dev>

> ---
>  drivers/usb/misc/usb251xb.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
> index 7da404f55a6d..490004dbb9d8 100644
> --- a/drivers/usb/misc/usb251xb.c
> +++ b/drivers/usb/misc/usb251xb.c
> @@ -382,11 +382,9 @@ static void usb251xb_get_ports_field(struct usb251xb *hub,
>  				    bool ds_only, u8 *fld)
>  {
>  	struct device *dev = hub->dev;
> -	struct property *prop;
> -	const __be32 *p;
>  	u32 port;
>  
> -	of_property_for_each_u32(dev->of_node, prop_name, prop, p, port) {
> +	of_property_for_each_u32_new(dev->of_node, prop_name, port) {
>  		if ((port >= ds_only ? 1 : 0) && (port <= port_cnt))
>  			*fld |= BIT(port);
>  		else
> 
> -- 
> 2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
