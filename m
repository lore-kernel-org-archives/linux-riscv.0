Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDAFC3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 15:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VpIvqZ5dVI5oLPH3M5JtvR+6yXVXlysxkRyckZ8UyqM=; b=VcRgAEIGPa7IPr0Kt4GBMnI+4w
	aiRwYWMlymL1qGIb6lhgjQU8guRhgxohM9YWfiKl24peQXxjx0og0A4sOotvTf9ghE6H1hZ7yGpP4
	mVuUfmwgKLAdo1Qtl7f8XrvLdEoAooXIGgt9ghOv6ILtOsuhIky1YI1zwL7gNaAaj/kawjagYw/bT
	/kz7J6y6k8lwWSlUF/tyd57OviFGFowi3VC5OjOZDYHhIk/+x6YgJfDUD10SOWuWYklVFuNiXSfAx
	mO6AqT4p7lNAeo69h2eDQNUU7ecagVMIZqzQ3n0P7iMcTNSfAXUFM32loeXPVfkaGX8KKqgzZEO4i
	s+MlDesg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZXRI-00000005nke-1qB8;
	Thu, 01 Aug 2024 15:10:00 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZXRF-00000005nk7-03Kz
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 15:09:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4F217CE0B55;
	Thu,  1 Aug 2024 15:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8095C32786;
	Thu,  1 Aug 2024 15:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722524994;
	bh=kbvV4AlvhMw0jKJGpx/bRqh4DWyE7ZqZruWEjEQ6LL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HdY7X/tFmCpcXLqCSIZGKkUOsNwAms3dfdCuzutVEYV21FG9OekVPWjti7ryadq8y
	 SyR+NUgifiWNearG3mufdQdbV/YT0W3ngrOBL8yoziKgZCRh6d8aSzXqw63TgvrXo7
	 4hJ+4wPVPp2Ct+B49GFQVFgGSvt2ihNr2sQxXPk0TjERG8VdtBerrehCFA8aK8Gok6
	 15DhSVzsrv6tCELNnL+6bR0SbQO9F9Pf3kjZ8mINK3ze0Qobr/eyApZ3hWj+WOGxNS
	 ZpVIkR9J0yKI7kBVtYlrjrU/BBCTAqMPNF6tss46OGuonqfTKcSmyKxZsvbwZF/SgU
	 b5GyxIZpx58zQ==
Date: Thu, 1 Aug 2024 16:09:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC v7 3/6] irqchip: add mpfs gpio interrupt mux
Message-ID: <20240801-palpitate-swinger-7bc8ae8deaaf@spud>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
 <20240723-flatworm-cornflake-8023212f6584@wendy>
 <87le1k8oq2.ffs@tglx>
MIME-Version: 1.0
In-Reply-To: <87le1k8oq2.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_080957_423573_D83F3BC4 
X-CRM114-Status: GOOD (  25.56  )
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
Content-Type: multipart/mixed; boundary="===============5902705488622322453=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5902705488622322453==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="11AmpaTIfaZfcutl"
Content-Disposition: inline


--11AmpaTIfaZfcutl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 12:41:25PM +0200, Thomas Gleixner wrote:
> On Tue, Jul 23 2024 at 12:27, Conor Dooley wrote:
> > +
> > +struct mpfs_irq_mux_bank_config {
> > +	u32 mask;
> > +	u8 shift;
> > +};
>=20
> Please see:
>=20
>   https://www.kernel.org/doc/html/latest/process/maintainer-tip.html
>=20
> vs. coding style.
>=20
> > +/*
> > + * Returns an unsigned long, where a set bit indicates the correspondi=
ng
> > + * interrupt is in non-direct/muxed mode for that bank/GPIO controller.
> > + */
> > +static inline unsigned long mpfs_irq_mux_get_muxed_irqs(struct mpfs_ir=
q_mux *priv,
> > +							unsigned int bank)
> > +{
> > +	unsigned long mux_config =3D priv->mux_config, muxed_irqs =3D -1;
> > +	struct mpfs_irq_mux_bank_config bank_config =3D mpfs_irq_mux_bank_con=
figs[bank];
> > +
> > +	/*
> > +	 * If a bit is set in the mux, GPIO the corresponding interrupt from
> > +	 * controller 2 is direct and that controllers 0 or 1 is muxed.
>=20
> This is not a coherent sentence.

It should read "controller 0 or 1;s interrupt is muxed". Does that make
more sense to you?

> > +	 * Invert the bits in the configuration register, so that set bits
> > +	 * equate to non-direct mode, for GPIO controller 2.
> > +	 */
> > +	if (bank =3D=3D 2u)
> > +		mux_config =3D ~mux_config;
> > +
>=20
> > +static int mpfs_irq_mux_nondirect_alloc(struct irq_domain *d, unsigned=
 int virq,
> > +					struct irq_fwspec *fwspec, struct mpfs_irq_mux *priv)
> > +{
> > +	unsigned int bank =3D fwspec->param[0] / MPFS_MAX_IRQS_PER_GPIO;
> > +
> > +	if (bank > 2)
> > +		return -EINVAL;
> > +
> > +	priv->nondirect_irqchips[bank].domain =3D d;
> > +
> > +	irq_domain_set_hwirq_and_chip(d, virq, fwspec->param[0],
> > +				      &mpfs_irq_mux_nondirect_irq_chip, priv);
> > +	irq_set_chained_handler_and_data(virq, handle_untracked_irq,
>=20
> Why does this use handle_untracked_irq()?

I'll have to go and dig back in my notes as to why it is untracked. It
was probably something like irqd_set() in handle_irq_event() blowing up
on the irq_data being invalid (which I figure could relate back to my
questions in the cover letter about issues with irqd_to_hwirq()) - but
I'll double check what exactly prompted it when I get back from my
holidays, but...

> This sets up a chained handler
> but handle_untracked_irq() is a regular interrupt handler.

=2E..what I was likely using before was handle_simple_irq() which isn't
chained either. You're expecting to see mpfs_irq_mux_nondirect_handler()
here I suppose?

>+static void mpfs_irq_mux_nondirect_handler(struct irq_desc *desc)
>+{
>+	struct mpfs_irq_mux_irqchip *irqchip_data =3D irq_desc_get_handler_data(=
desc);
>+	struct mpfs_irq_mux *priv =3D container_of(irqchip_data, struct mpfs_irq=
_mux,
>+						 nondirect_irqchips[irqchip_data->bank]);
>+	unsigned long muxed_irqs;
>+	int pos;
>+
>+	chained_irq_enter(irq_desc_get_chip(desc), desc);
>+
>+	muxed_irqs =3D mpfs_irq_mux_get_muxed_irqs(priv, irqchip_data->bank);
>+
>+	for_each_set_bit(pos, &muxed_irqs, MPFS_MAX_IRQS_PER_GPIO)
>+		generic_handle_domain_irq(irqchip_data->domain, irqchip_data->offset + =
pos);
>+
>+	chained_irq_exit(irq_desc_get_chip(desc), desc);
>+}

Given you've only commented on one significant issue and two minor items,
is it safe to conclude that the overall approach doesn't have you
screaming and running for the hills?

Cheers,
Conor.

> > +					 &priv->nondirect_irqchips[bank]);

--11AmpaTIfaZfcutl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZqulPQAKCRB4tDGHoIJi
0sKFAP9oHaSYPhW8FIkf4ssGaWWv0SILb0BeDNlL+8x69V02NwEAiitNydpF/yk7
SFtK2kbzZYCnFccFMEDAeC8qRGJpQQ0=
=MaNi
-----END PGP SIGNATURE-----

--11AmpaTIfaZfcutl--


--===============5902705488622322453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5902705488622322453==--

