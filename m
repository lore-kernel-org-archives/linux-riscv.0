Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CE0E6B25B
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 23:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ahMGqJCqItJI/Dp1sWpRuNzUl9/qSz45TnHBX0dIQQg=; b=0ztRAOTF7TMGIn
	ry/+ek8BCXR/9w2kAfKXnGXRYmTDPnCRTF11pAt0COtqp574irbLvrcQNR7N0LJ5YTUlTdGLKniyz
	wd02D6LCuFeEOIH0C/Db3Mv0Okjo/ioWcJKew49Hm3N4G8ppWSxm/LdmlzNROst40/wO12h7OqrWF
	a28VhVzGHa9Q21zrsBCvlHGKfQSRfQqinKdHuRZQ4VE9iyokbg2a0rLHkHNQWza/lHPhWYEkPCr2X
	41CjAO6awfQ2cl0AavJJ9izZzVgO0drSbikvK9jzJzcbJ9vjsK/0fhGWP5TJ9ZwDDBG95GaWc4BRT
	QypvzRYFpvF4tq4czHgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXowQ-0000000EFcx-01cK;
	Mon, 22 Dec 2025 23:03:50 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXowN-0000000EFcY-21lu
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 23:03:48 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id F01CF340FA7;
	Mon, 22 Dec 2025 23:03:42 +0000 (UTC)
Date: Tue, 23 Dec 2025 07:03:38 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/3] pinctrl: spacemit: k3: add initial pin support
Message-ID: <20251222230338-GYA1980456@gentoo.org>
References: <20251220-02-k3-pinctrl-v1-0-f6f4aea60abf@gentoo.org>
 <20251220-02-k3-pinctrl-v1-2-f6f4aea60abf@gentoo.org>
 <74FFF1F2D1BF3EFF+aUjsbTB607IkAY87@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <74FFF1F2D1BF3EFF+aUjsbTB607IkAY87@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_150347_567730_672474AC 
X-CRM114-Status: GOOD (  15.76  )
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

Hi Troy,

On 14:59 Mon 22 Dec     , Troy Mitchell wrote:
> On Sat, Dec 20, 2025 at 06:14:54PM +0800, Yixun Lan wrote:
> > For the pinctrl IP of SpacemiT's K3 SoC, it has different register offset
> > comparing with previous SoC generation, so introduce a function to do the
> > pin to offset mapping. Also add all the pinctrl data.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  drivers/pinctrl/spacemit/Kconfig      |   4 +-
> >  drivers/pinctrl/spacemit/pinctrl-k1.c | 354 +++++++++++++++++++++++++++++++++-
> >  2 files changed, 352 insertions(+), 6 deletions(-)
> > 
> [...]
> > diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> [...]
> > +static unsigned int spacemit_k3_pin_to_offset(unsigned int pin)
> > +{
> > +	unsigned int offset = pin > 130 ? (pin + 2) : pin;
> Is this necessary? I think it's hard to read. Why not:
> ```
> if (pin > 130)
>   pin += 2;
> 
> return pin << 2;
> ```
> This avoids the extra variable and makes the code clearer.
> > +
> > +	return offset << 2;
No, I do not want to change, it's pretty much a personal taste here,
I did similar as k1_pin_to_offset(), explicitly introduce a variable offset
to let reader know it convert from pin to offsett, which is more readable..

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
