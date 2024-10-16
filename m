Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63251D1AD39
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 09:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33IsBzXtO0gScdDJ6wSMXCC0KalP0FCfIOIlmq3BJWs=; b=WG3BpoOsctE0e8jxVI69ulJUd1
	ybC15j+RV5clqOFfu/vX9XxXRB1NJlV4Wrk83F2TwRobVzNxtGWfgmcoCInpItyCC7CuH8qtxutEU
	tDWEGd8rHcdbi5j5h7emTppwBP4tE7JQDZ9OUeZYBAruoFh/yONQXnXN+bmgnawMCFeLGs3CPSbAs
	jdjAX1P3iz7KB9mRzOOm/kaFk13lg46ntGJmdgYCy/r25/FffnYy+Qq/96p2YLtCONFdDNlL/BUyx
	P/kuXZnksXZTumwYYeWWlH+KiSNm5v4PpSPecHmQZUEn4uJkbrqSG72Ge0lWLkwCq1OgDRsdYIPUd
	ZMt9zddQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t10om-0000000BKxu-2rOf;
	Wed, 16 Oct 2024 09:59:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t10li-0000000BK99-0Z9G
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 09:56:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 51E7AA43C80;
	Wed, 16 Oct 2024 09:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43752C4CECD;
	Wed, 16 Oct 2024 09:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729072597;
	bh=uHq88diJm1dWVxmjE2s3IC5aG27pU9tVf1Cdl6SO7SA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZMGuS0Z82CFjZ/mSuxpZsQ4WNn5OYkcC/UShO3npG9FAWIjCi9p3dpvGhvFMN16N0
	 LA/IJiRA6dpp40RyTJ2ZypXwstUzmOzwR3W061jldmzlNkQhZpmBrG7Fh62PCGgU4o
	 C/X4VmlaFpel8ZKOWznCKTyDskr4ACAnMSBa1KGRHJsfLufx1mWgIv12U/6KhNarh1
	 rGNBHEayWjBNZcB2v/ruk9BJ+f7bYDU+Xu3J8XeB2owI0salOZ32epGLEWGJnUhXTM
	 DLcflSfzpGBH5qHgZO0ah4D3AQGfMOIQOIlIMCwAjt8/pKSJSGBEmfrbIb8IWuODKq
	 HYC/cFR4OO0dw==
Date: Wed, 16 Oct 2024 10:56:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Lewis Hanly <lewis.hanly@microchip.com>
Subject: Re: [RFC v7 4/6] gpio: mpfs: add polarfire soc gpio support
Message-ID: <20241016-shallot-nerd-51eeba039ba0@spud>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
 <20240723-underage-wheat-7dd65c2158e7@wendy>
 <CACRpkdbRE695f-+do1HYpOZ6e4qxgUBWJzEPO2hTCuZ3xxYHQg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACRpkdbRE695f-+do1HYpOZ6e4qxgUBWJzEPO2hTCuZ3xxYHQg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_025638_328133_8399FB2A 
X-CRM114-Status: GOOD (  23.68  )
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
Content-Type: multipart/mixed; boundary="===============4002781491312481280=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4002781491312481280==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8DGd6hZF1FungGf/"
Content-Disposition: inline


--8DGd6hZF1FungGf/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 05, 2024 at 10:04:53AM +0200, Linus Walleij wrote:
> On Tue, Jul 23, 2024 at 1:28=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
>=20
>=20
> > From: Lewis Hanly <lewis.hanly@microchip.com>
> >
> > Add a driver to support the Polarfire SoC gpio controller
> >
> > Signed-off-by: Lewis Hanly <lewis.hanly@microchip.com>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Just a comment on second thought:
>=20
> > +config GPIO_POLARFIRE_SOC
> > +       bool "Microchip FPGA GPIO support"
> > +       depends on OF_GPIO
> > +       select GPIOLIB_IRQCHIP
>=20
> select GPIO_GENERIC?
>=20
> > +static int mpfs_gpio_direction_input(struct gpio_chip *gc, unsigned in=
t gpio_index)
> > +{
> > +       struct mpfs_gpio_chip *mpfs_gpio =3D gpiochip_get_data(gc);
> > +       u32 gpio_cfg;
> > +       unsigned long flags;
> > +
> > +       raw_spin_lock_irqsave(&mpfs_gpio->lock, flags);
> > +
> > +       gpio_cfg =3D readl(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index)=
);
> > +       gpio_cfg |=3D MPFS_GPIO_EN_IN;
> > +       gpio_cfg &=3D ~(MPFS_GPIO_EN_OUT | MPFS_GPIO_EN_OUT_BUF);
>=20
> OK this part is unique...
>=20
> > +static int mpfs_gpio_direction_output(struct gpio_chip *gc, unsigned i=
nt gpio_index, int value)
> > +{
> > +       struct mpfs_gpio_chip *mpfs_gpio =3D gpiochip_get_data(gc);
> > +       u32 gpio_cfg;
> > +       unsigned long flags;
> > +
> > +       raw_spin_lock_irqsave(&mpfs_gpio->lock, flags);
> > +
> > +       gpio_cfg =3D readl(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index)=
);
> > +       gpio_cfg |=3D MPFS_GPIO_EN_OUT | MPFS_GPIO_EN_OUT_BUF;
>=20
> Also here
>=20
> > +static int mpfs_gpio_get_direction(struct gpio_chip *gc,
> > +                                  unsigned int gpio_index)
> > +static int mpfs_gpio_get(struct gpio_chip *gc,
> > +                        unsigned int gpio_index)
> > +static void mpfs_gpio_set(struct gpio_chip *gc, unsigned int gpio_inde=
x, int value)
>=20
> But these are just MMIO functions.
>=20
> Is it possible to use augmented generic MMIO, i.e just override these
> two functions that
> need special handling?

So, I've been looking into this again (finally), with an eye to stripping
the interrupt handling bits out, and trying to upstream this in pieces.
I dunno if I'm making a mistake here, but I don't know if there's much
value in implementing this suggestion - as far as I can tell only the
get()/set() functions can be replaced by what's provided by gpio-mmio.c.
There are no controller wide registers that control direction and so
bgpio_get_dir() can't be used - direction is read from the same
mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index) registers that it is set
using. Adding bgpio stuff, to just go ahead and overwrite it, to save on
trivial get()/set() implementations seems to me like adding complication
rather than removing it. What am I missing here?

Cheers,
Conor.

--8DGd6hZF1FungGf/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZw+N0AAKCRB4tDGHoIJi
0ky/AQDkGqoBAGYEZCFxxWUyqZ4vmPR3ldX2O9Zq2lny2GgGNQD/bK8MIRUqZSos
inSPCxcBYpf1M6iVGSB5AkOOp0NPcQs=
=EK75
-----END PGP SIGNATURE-----

--8DGd6hZF1FungGf/--


--===============4002781491312481280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4002781491312481280==--

