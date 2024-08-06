Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73577C52D71
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 17:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMzqBBCUY4HFoABchfRUVQq5FFE9BFR8bBR61OXHCpg=; b=ysX9c0iZchNqpV/5qFogeBsYyI
	K3eBRkO7V7j7+gdOw1QWcakYeP9naeQh0gfinSQPqDt9gzNXzmvw0J1i4YwHspANIBx18NZfE/pcb
	JwkZLQ5CWDGKuhDj81QvYYsxXnvYu+tyalncwT+kxqVOF8UBSt/rSp2phDOFNnLne+j+JDTTR5cuo
	F12mi4jg/Ri5Gf4QJZQIvI4mwlRsXrgdHL19SF2FPSew4kutIiHPeS263jYjAIUBa+RbDAziCF/0h
	SlFiX4IIFnVRzYGYSHefA3tDMn63LX665MSuzaM4bb3UXw1xxrUalGxxWVtZu6p1+zub3/gaeg6YI
	cIGTX2pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbNpI-00000002THo-0b1J;
	Tue, 06 Aug 2024 17:18:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbNpF-00000002THN-0K4I
	for linux-riscv@lists.infradead.org;
	Tue, 06 Aug 2024 17:18:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D053161043;
	Tue,  6 Aug 2024 17:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93EE1C32786;
	Tue,  6 Aug 2024 17:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722964699;
	bh=lMmvftXT0qARD9+U3hEsUZ97wDlqfHLC8/iYV0EiQZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EgYD7TjTHhN+UtCwu3JwN6n8a0Lu9XRrHdWoP32RcC2fkiqTv0QuaunvhF6UKxz/w
	 wQ3vazd8pHr/e2Q/pqkGmRY7PkffrkceVCobYin4nVSCiVskuCQvELfxiMwAlNIdCJ
	 VwJ4qupBXhhXVHfnxZqP4NOog64lkRFnpyynkzsryz5ZnqOSrU1KAevuV8FPPrKaOE
	 Ss6aMQfhJpX5sjz50QmuZZqIgqGnAtzP8k4VmPlbGgDNR5A44hszUmz/MaZswP7nyi
	 My5Oi1/7FQZKuqYkqNVDpdcsqdPJTYraT3OOiaYG4gBQUhqfEbWELc1Ay9OHSAPc9G
	 vJQWxkp42O12g==
Date: Tue, 6 Aug 2024 18:18:14 +0100
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
Message-ID: <20240806-breeze-crazily-84d4e4af8f4e@spud>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
 <20240723-underage-wheat-7dd65c2158e7@wendy>
 <CACRpkdbRE695f-+do1HYpOZ6e4qxgUBWJzEPO2hTCuZ3xxYHQg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACRpkdbRE695f-+do1HYpOZ6e4qxgUBWJzEPO2hTCuZ3xxYHQg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_101821_270295_7C279899 
X-CRM114-Status: GOOD (  20.05  )
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
Content-Type: multipart/mixed; boundary="===============1648744083482278423=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1648744083482278423==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5jabDj4Nnku3Xl8d"
Content-Disposition: inline


--5jabDj4Nnku3Xl8d
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

I'll look into it - as I mentioned under the --- line, I really didn't
touch most of the driver and there's comments from Lewis' submission
that still apply.

Cheers,
Conor.

--5jabDj4Nnku3Xl8d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZrJa1gAKCRB4tDGHoIJi
0jHzAQC+jweV6m+T+08oxGBMTQuSWlDXOqewMXmPVahS1Jv8YQEAxkqQN9tcsEo/
l7nkZLcjH3APpMcJOO3PxtdcaQt9yQI=
=TeP1
-----END PGP SIGNATURE-----

--5jabDj4Nnku3Xl8d--


--===============1648744083482278423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1648744083482278423==--

