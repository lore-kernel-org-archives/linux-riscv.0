Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68751C3DA60
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 23:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=snydDX7MD6EuBZzVPhB3OaEH3u/kIaethdvsQY9rvbM=; b=Au4bxjYAxkQj0k
	UWgl2i0DIHkp4oTfOYWaBADi1dP5zdEwWkoFFmOINRtDWNnHTN80awnFGi6l83Rwz8dI5+o9aoUn6
	OnvnZMGD0wASibR8oOIKVZTGCniyZ7VCXLttavFL9s/PnTIIeSLHlZPjvOQng6/S4eNU+Y4/F0zys
	cm3rx7G3/bl8Ad31UGIydX62jxF09FWi9eMK0G0KYba+pgGHhBxACfJBI/ac4zxAGO7DbXJ/FP7+S
	RL6XzmtR++Rr3H/N9Oo2wdBV6dnwacYUkVil8rBXxgyllbC5MeiLGSx6Oe3rVph7PIxKUiaBZsqgP
	otKbdwVB8MtntuTLONnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUE9X-0000000FCTa-0Nkk;
	Wed, 17 Jul 2024 23:33:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUE9S-0000000FCSw-2gRw;
	Wed, 17 Jul 2024 23:33:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3527261976;
	Wed, 17 Jul 2024 23:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59E2C2BD10;
	Wed, 17 Jul 2024 23:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721259216;
	bh=/vntp9yziGCzvLchAgMHXkRgHgytqWIKu6wEIUPrxlQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=m/tYahsI7GcAsn0eTT4WF3W3BC90QDmQbipyzN62A8EQrxsGjJuDHvLvxJTe9ClPb
	 SxfN7qFIZCngz7gztSRBpz2eEzrUCy4jUV1ydb6l65kKp+wAq1QWNBsZy5KABTYVQR
	 tq+sCrNewY9i6SpEr8eZIOLHRCKt7Ey7NF7M1f0KLVQ+ZcrJeHrDZjeNPd1EsmFr+5
	 4zTlnoxdZoC9fCxuCKnodh5r8fGggVstFE9nygPb3O0rvXh68bBkRq/sZ9W1kFT6Vp
	 PNOejeGFpQtHdc4Q11bbXLpU6fBG4A6iIgpFlB92tbnMPPxy5xVe6T52lr0cg39ZBV
	 sbhS/c+mN45rg==
Message-ID: <1e36b1ba8af3584128550822a70cb072.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240717-of_property_for_each_u32-v2-1-4060990f49c9@bootlin.com>
References: <20240717-of_property_for_each_u32-v2-1-4060990f49c9@bootlin.com>
Subject: Re: [PATCH v2] of: remove internal arguments from of_property_for_each_u32()
From: Stephen Boyd <sboyd@kernel.org>
Cc: Peng Fan (OSS) <peng.fan@oss.nxp.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, patches@opensource.cirrus.com, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, Andre Przywara <andre.przywara@arm.com>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Richard Fitzgerald <rf@opensource.cirrus.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alim Akhtar <alim.akhtar@samsung.com>, Andreas Kemnade <andreas@kemnade.info>, Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Andersson <andersson@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Chen-Yu Tsai <wens@csie.org>, Chester Lin <chester62515@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Damien Le Moal <dlemoal@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>, Doug Berger <opendmb@gmail.com>, Emilio =?utf-8?q?L=C3=B3pez?= <emilio@elopez.com.ar>, Fabio Estevam <festevam@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jacky Bai <ping.bai@nxp.com>, Jaroslav Kysela <perex@perex.cz>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jiri Slaby
  <jirislaby@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Mark Brown <broonie@kernel.org>, Matthias Brugger <mbrugger@suse.com>, Michael Ellerman <mpe@ellerman.id.au>, Michael Turquette <mturquette@baylibre.com>, Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Naveen N. Rao <naveen.n.rao@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Richard Leitner <richard.leitner@linux.dev>, Rob Herring <robh@kernel.org>, Roger Quadros <rogerq@kernel.org>, Samuel Holland <samuel@sholland.org>, Saravana Kannan <saravanak@google.com>, Shawn Guo <shawnguo@kernel.org>, Takashi Iwai <tiwai@suse.com>, Thomas Gleixner 
 <tglx@linutronix.de>, Tony Lindgren <tony@atomide.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Date: Wed, 17 Jul 2024 16:33:34 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_163338_787073_50670111 
X-CRM114-Status: GOOD (  16.46  )
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

Quoting Luca Ceresoli (2024-07-17 09:16:32)
> diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
> index 4ce83c5265b8..d4904f59f83f 100644
> --- a/drivers/clk/clk-si5351.c
> +++ b/drivers/clk/clk-si5351.c
> @@ -1175,8 +1175,8 @@ static int si5351_dt_parse(struct i2c_client *client,
>  {
>         struct device_node *child, *np = client->dev.of_node;
>         struct si5351_platform_data *pdata;
> -       struct property *prop;
> -       const __be32 *p;
> +       u32 array[4];
> +       int sz, i;
>         int num = 0;
>         u32 val;
>  
> @@ -1191,20 +1191,24 @@ static int si5351_dt_parse(struct i2c_client *client,
>          * property silabs,pll-source : <num src>, [<..>]
>          * allow to selectively set pll source
>          */
> -       of_property_for_each_u32(np, "silabs,pll-source", prop, p, num) {
> +       sz = of_property_read_variable_u32_array(np, "silabs,pll-source", array, 2, 4);
> +       sz = (sz == -EINVAL) ? 0 : sz; /* Missing property is OK */
> +       if (sz < 0)
> +               return dev_err_probe(&client->dev, sz, "invalid pll-source");

Needs a newline on the printk message.

> +       if (sz % 2)
> +               return dev_err_probe(&client->dev, -EINVAL,
> +                                    "missing pll-source for pll %d\n", array[sz - 1]);
> +
> +       for (i = 0; i < sz; i += 2) {
> +               num = array[i];
> +               val = array[i + 1];
> +
>                 if (num >= 2) {
>                         dev_err(&client->dev,
>                                 "invalid pll %d on pll-source prop\n", num);
>                         return -EINVAL;
>                 }
>  
> -               p = of_prop_next_u32(prop, p, &val);
> -               if (!p) {
> -                       dev_err(&client->dev,
> -                               "missing pll-source for pll %d\n", num);
> -                       return -EINVAL;
> -               }
> -
>                 switch (val) {
>                 case 0:
>                         pdata->pll_src[num] = SI5351_PLL_SRC_XTAL;
> @@ -1232,19 +1236,24 @@ static int si5351_dt_parse(struct i2c_client *client,
>         pdata->pll_reset[0] = true;
>         pdata->pll_reset[1] = true;
>  
> -       of_property_for_each_u32(np, "silabs,pll-reset-mode", prop, p, num) {
> +       sz = of_property_read_variable_u32_array(np, "silabs,pll-reset-mode", array, 2, 4);
> +       sz = (sz == -EINVAL) ? 0 : sz; /* Missing property is OK */
> +       if (sz < 0)
> +               return dev_err_probe(&client->dev, sz, "invalid pll-reset-mode");

Needs a newline on the printk message.

> +       if (sz % 2)
> +               return dev_err_probe(&client->dev, -EINVAL,
> +                                    "missing pll-reset-mode for pll %d\n", array[sz - 1]);
> +

With those fixed

Acked-by: Stephen Boyd <sboyd@kernel.org> # clk

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
