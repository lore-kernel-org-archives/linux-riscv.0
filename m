Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE00C2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 18:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/k0HSMomNZtvONYaA8toTEpfHzxAPnYf9YCJv5dNrRM=; b=u5MyUSAL3Z6LD6
	OFj9EGi7F6e7R3uUVqCQHAJQPhY62D81q8Tiify1qY5kr6joLP8JU/H74YJJHEpLFQcCtIInyhREm
	F8+JNZX9l+/Y5+v/uJJX+l1t+bCuXp4aEOHS0/+r1sW/kwGQn+u6WV7ZUHuhjvMLmhn0L3V9rziRs
	jn02cOoB5ieF0PnjAdg06FW5UZm5YjwV/HihZgj92wcG9ONYg4Y/fq5+BEQkNGDQjsRhTeiAUKRny
	x4EYYbC4Cfnd80lpKIkt7a0zuhQLmkkzGKmPPJek61SsUlbetS8ri0/q3De4Jl0rMjzqGJ2gjwrxv
	bXGaVO+700kxMz/IIn5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP4OY-0000000B71r-1Bk8;
	Wed, 03 Jul 2024 18:07:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP4OQ-0000000B71E-05yh;
	Wed, 03 Jul 2024 18:07:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B6D6623B5;
	Wed,  3 Jul 2024 18:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2346AC2BD10;
	Wed,  3 Jul 2024 18:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720030063;
	bh=7VkdfXXbnQAAagurnl0t1uowHfXXxqv6JWqV5yzvHyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X3bpvJgxZPWMXNOzcyielDafYLsorlGeMfGsYxZsE3DcfgNG38u+IpqkFauqV7JBb
	 5vrbm1WYc3A6PpB/BYRkykAD7OTF0Cj7mNGz1MOi0sa5ZMS/EgfduMIqZfBT2ojOEE
	 bFo2aTY3NN6jY868V+Ef+HPG5nwsrIILcL4gaARoEmQ/3VJxlw8KNvls5K1NJbvrcL
	 liQUqmGsYZrzJg5w0kk4/LvcK6Tdp62Zk7+kzOZ/GnWL+VAWuwzwfMk9DNJ/Cy73bN
	 +KSVQC/fntqBgC8EoMj80EdF4hoVvz6Kgpa3QHWVeUvUPp8LsLtGUtLPC5Ip21htEj
	 aLChwBO4AdEcA==
Date: Wed, 3 Jul 2024 12:07:42 -0600
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
Subject: Re: [PATCH 00/20] Simplify of_property_for_each_u32()
Message-ID: <20240703180742.GB1245093-robh@kernel.org>
References: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_110747_231047_7B9B60D4 
X-CRM114-Status: GOOD (  23.58  )
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

On Wed, Jul 03, 2024 at 12:36:44PM +0200, Luca Ceresoli wrote:
> [Note: to reduce the noise I have trimmed the get_maintainers list
> manually. Should you want to be removed, or someone else added, to future
> versions, just tell me. Sorry for the noise.]
> 
> This series aims at simplifying of_property_for_each_u32() as well as
> making it more difficult to misuse it in the future.
> 
> The long-term goal is changing this pattern:
> 
>   struct property *prop;
>   const __be32 *p;
>   u32 val;
>  
>   of_property_for_each_u32(np, "xyz", prop, p, val) { ... }
> 
> to this:
> 
>   u32 val;
> 
>   of_property_for_each_u32(np, "xyz", val) { ... }
> 
> So, removing the 3rd and 4th arguments which are typically meant to be
> internal. Those two parameters used to be unavoidable until the kernel
> moved to building with the C11 standard unconditionally. Since then, it is
> now possible to get rid of them. However a few users of
> of_property_for_each_u32() do actually use those arguments, which
> complicates the transition. For this reason this series does the following:
> 
>  * Add of_property_for_each_u32_new(), which does not have those two
>    arguments (patch 1)
>  * Convert _almost_ every usage to of_property_for_each_u32_new()
>  * Rename of_property_for_each_u32() to of_property_for_each_u32_old() and
>    deprecate it, as a incentive to code not (yet) in mainline to upgrade
>    to the *_new() version (last patch)

I don't really see the point of introducing the _old variant. Let's get 
this done in one step.

> 
> The plan for the next series is to additionally:
> 
>  * Convert the few remaining of_property_for_each_u32_old() instantes to
>    of_property_for_each_u32_new()
>  * Remove of_property_for_each_u32_old()
>  * Rename of_property_for_each_u32_new() to of_property_for_each_u32()

Honestly, I think there's few enough users we could just convert the 
whole thing in one patch. It's all got to go thru 1 tree anyways. If 
there's new cases in -next, then I'd be happy to send it to Linus at the 
end of the merge window.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
