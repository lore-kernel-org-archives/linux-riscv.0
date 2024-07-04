Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C7DC3271F
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 21:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WVOdO4BO7oK13HUNbTXB9dUydgVz4Afu0zuEW0UVcxQ=; b=jf9f2QnX+0DPt5
	dTEnVyN47+ysyHcidHsugieu1UaBt995g0dLCE+bCLBIf2JEJbcUQrv3q/YQy9ZO1A7Brsya/uDIJ
	gt7bHOmrdCuXilBfwdHaLgLv49unSpr16SkiuIaHA7C9+dca07YoD7Dfq1RleSnaP+LMbPQjWWYse
	P1BD59LTOG2YIP8nAZi8m3ATF5+Xb8d/GO60mB2+hEluQEKvbsZ3Ec9pNemAyOygrEyAVayIYwr72
	/STADO54Yr0dRM0yO/b6rsOIEf+mV0ybJ+LlAC9PtUNEJQWSd9czIp993bW7q8+EPHZkMAleRtnAn
	aXftisXXiI8LP4FsLWpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPU3w-0000000EQuw-48v8;
	Thu, 04 Jul 2024 21:32:20 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPU3s-0000000EQtr-1dN5;
	Thu, 04 Jul 2024 21:32:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD86AFF802;
	Thu,  4 Jul 2024 21:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720128729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rey18xTlnMgOgIPL25ImB7B15sMWYzxAsvnHNthV5S0=;
	b=S0JEVBhI3tfc5ntPMObRrKKeyUXsGRrO+dmrSHHiA/CXiaTrDzUnuWN/8RLan/W8yEPBYy
	WTaC4P67s78ijbrvczP1KnuPtKQbrRcwlYEqUPZPpZW0nhX/siqNP/GhziUB79nYOQPi8r
	PhP0fpq9va52mSjevxSqg9gaf/S2Ukug9XtKh8mzSUYLpNZp80MAwL96mMkrYY7WNzzmay
	5AT/X7DCWHP8tVhsE6o3C1PHb0Q9g3z2DXN4uHMidHU5Rwoaz4Y/LepANuZA6Uuvs21L3L
	95mP/Ounvba0aITTStBPv4Esd+fhuzK/5YdBxhSIiG700JAP0NMtF9NGxcnshQ==
Date: Thu, 4 Jul 2024 23:31:55 +0200
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
Subject: Re: [PATCH 00/20] Simplify of_property_for_each_u32()
Message-ID: <20240704233155.61b5323c@booty>
In-Reply-To: <20240703180742.GB1245093-robh@kernel.org>
References: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
	<20240703180742.GB1245093-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_143216_754211_ABAD456A 
X-CRM114-Status: GOOD (  29.92  )
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

On Wed, 3 Jul 2024 12:07:42 -0600
Rob Herring <robh@kernel.org> wrote:

> On Wed, Jul 03, 2024 at 12:36:44PM +0200, Luca Ceresoli wrote:
> > [Note: to reduce the noise I have trimmed the get_maintainers list
> > manually. Should you want to be removed, or someone else added, to future
> > versions, just tell me. Sorry for the noise.]
> > 
> > This series aims at simplifying of_property_for_each_u32() as well as
> > making it more difficult to misuse it in the future.
> > 
> > The long-term goal is changing this pattern:
> > 
> >   struct property *prop;
> >   const __be32 *p;
> >   u32 val;
> >  
> >   of_property_for_each_u32(np, "xyz", prop, p, val) { ... }
> > 
> > to this:
> > 
> >   u32 val;
> > 
> >   of_property_for_each_u32(np, "xyz", val) { ... }
> > 
> > So, removing the 3rd and 4th arguments which are typically meant to be
> > internal. Those two parameters used to be unavoidable until the kernel
> > moved to building with the C11 standard unconditionally. Since then, it is
> > now possible to get rid of them. However a few users of
> > of_property_for_each_u32() do actually use those arguments, which
> > complicates the transition. For this reason this series does the following:
> > 
> >  * Add of_property_for_each_u32_new(), which does not have those two
> >    arguments (patch 1)
> >  * Convert _almost_ every usage to of_property_for_each_u32_new()
> >  * Rename of_property_for_each_u32() to of_property_for_each_u32_old() and
> >    deprecate it, as a incentive to code not (yet) in mainline to upgrade
> >    to the *_new() version (last patch)  
> 
> I don't really see the point of introducing the _old variant. Let's get 
> this done in one step.
> 
> > 
> > The plan for the next series is to additionally:
> > 
> >  * Convert the few remaining of_property_for_each_u32_old() instantes to
> >    of_property_for_each_u32_new()
> >  * Remove of_property_for_each_u32_old()
> >  * Rename of_property_for_each_u32_new() to of_property_for_each_u32()  
> 
> Honestly, I think there's few enough users we could just convert the 
> whole thing in one patch. It's all got to go thru 1 tree anyways. If 
> there's new cases in -next, then I'd be happy to send it to Linus at the 
> end of the merge window.

Sure, make sense. I'll need to convert the few remaining users, then
I'm sending a squashed v2.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
