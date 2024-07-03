Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612D0C30653
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 18:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bkhHH3j98jxDSBnJrW1CmKYwXmw1Dug3r+4ad6T4HKk=; b=YXrhHc6Z6odbsN
	42o8y+FRBS2n+8/2bbBBtc4lnYFb2l2oQYy5NrygKE5XtcLewf7zGXMTtIt+dW55A7Pyq+IMNF6fI
	by9/Ztl9EouJi/b2zopzShLQE7TCPGmoKo3Apiv8zI2DqFZ0Ex1+ieWUkGz7hnaEbWsIPoj+jAl5a
	C5J1s18VYmoa0W5iysfkmDMKK0EpuTcPIt4DxAaTyfbwOM9yL+hmJp7h3Ntbq3akxoRBLn6Z5I6eR
	tsiIvBdZRtWvYuRc4siqiEV7jMJn7K6Af+PhmFmYKJ54Zw2j8O8/5pxLZgci9vBVnR7hVIHo9ibke
	LCtWCR5jP4UmbXeQFF1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP4IC-0000000B4hT-0nJM;
	Wed, 03 Jul 2024 18:01:20 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP4I7-0000000B4gi-2SmL;
	Wed, 03 Jul 2024 18:01:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D9016CE2BBC;
	Wed,  3 Jul 2024 18:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF3A5C2BD10;
	Wed,  3 Jul 2024 18:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720029672;
	bh=Zf7O3ePlvok3MwLuehq8buoZy5+PWBs/kgvIKrrVIKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rdkJI5WT7xR8B3hhsVMq+7XqeIkJEsIaADXyaLtB4dJe9NXrYcxikXDJ/5KktssvA
	 7etBQGsm2VyizVMZQmA9ihpwtZYUhvkMhDqqm7DZaL9YJ8uOiDoPSmPVoICg9OuK8h
	 kf2w10dmNI2g0dOA0U+6i+Cgm8jgljOb/gfgRYI1OPkrO1v+GfL/rY1cUvohqOzaun
	 TOkDyEhrJNtkGWe8cABu77lnRtMdZJu1H5b2xga3Mp3ipQTM+FMCsdeacpzsjDre6d
	 /YbhzFbSXtxBcBUyDKr/EWUY3kR0SbLGgb2vJo3YUT8TlNsacvEqcfVsQLO/+01IoD
	 8zVzREV5iKd4A==
Date: Wed, 3 Jul 2024 12:01:11 -0600
From: Rob Herring <robh@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Richard Leitner <richard.leitner@linux.dev>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	llvm@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 20/20] of: deprecate and rename of_property_for_each_u32()
Message-ID: <20240703180111.GA1245093-robh@kernel.org>
References: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
 <20240703-of_property_for_each_u32-v1-20-42c1fc0b82aa@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240703-of_property_for_each_u32-v1-20-42c1fc0b82aa@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_110116_006759_5DD17303 
X-CRM114-Status: GOOD (  21.36  )
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

On Wed, Jul 03, 2024 at 12:37:04PM +0200, Luca Ceresoli wrote:
> of_property_for_each_u32() is meant to disappear. All the call sites not
> using the 3rd and 4th arguments have already been replaced by
> of_property_for_each_u32_new().
> 
> Deprecate the old macro. Also rename it to minimize the number of new
> usages and encourage conversion to the of_property_for_each_u32_new() macro
> in not(-yet)-upstream code.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Notes:
> 
>  * The following files have not been build-tested simply because I haven't
>    managed to have a config that enables them so far:
> 
>      drivers/irqchip/irq-pic32-evic.c
>      drivers/pinctrl/pinctrl-k210.c
> 
>  * These have not been converted yet as they are not trivial, and they will
>    need to use a more specific function that does the lookup they need and
>    returns the result:
> 
>      drivers/clk/clk-si5351.c

I would do something like this:

	sz = of_property_read_variable_u32_array(np, "silabs,pll-source", array, 2, 4);
	if (sz >= 2)
		pdata->pll_src[array[0]] = val_to_src(array[1]);
	if (sz >= 4)
		pdata->pll_src[array[2]] = val_to_src(array[3]);


>      drivers/clk/clk.c

Wouldn't this work:

8<------------------------------------------------------

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 8cca52be993f..33a8cc193556 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -5371,6 +5371,7 @@ const char *of_clk_get_parent_name(const struct device_node *np, int index)
        int rc;
        int count;
        struct clk *clk;
+       bool found = false;
 
        rc = of_parse_phandle_with_args(np, "clocks", "#clock-cells", index,
                                        &clkspec);
@@ -5383,15 +5384,16 @@ const char *of_clk_get_parent_name(const struct device_node *np, int index)
        /* if there is an indices property, use it to transfer the index
         * specified into an array offset for the clock-output-names property.
         */
-       of_property_for_each_u32(clkspec.np, "clock-indices", prop, vp, pv) {
+       of_property_for_each_u32_new(clkspec.np, "clock-indices", pv) {
                if (index == pv) {
                        index = count;
+                       found = true;
                        break;
                }
                count++;
        }
        /* We went off the end of 'clock-indices' without finding it */
-       if (prop && !vp)
+       if (of_property_present(clkspec.np, "clock-indices") && !found)
                return NULL;
 
        if (of_property_read_string_index(clkspec.np, "clock-output-names",

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
