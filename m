Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3744BCCD1AB
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 10:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bviJmrEUJS2QsoR0tLYLvU8dczFdBWGfGvrDZGbwfkI=; b=yufx82ORlZBYGEeFXuaEMrRJlD
	Sxd/G+2s7xF+GSVmFkkn6YRHQ6QlfIH/hjA9N2MjeD/8JIqm+3L43GsnkYwYaftQyV7oH8/V2OTX0
	8ZKxGXJ/DjEZG/l4LDWhk/wtMy/i+dlTi9+wWQisuSyiKIzKGoml49U7XmbMZVaMMx5VTLngc9eeH
	ojqOFoXbNoP0xwsHnhQ395gdssZAlK4EomfGagi/10K+LYKZ0KUF40HD5fMI/R5F7EkWmwEQg4PFT
	woajtSaA+jJWzEUwa2zb2pV4U+jNcVm25CgsHDAZpI0ivHdzsRYV1lhIoYEBAD9yTFEH+8O4C/l70
	ptUu+oDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCF3o-0000000926K-1LsY;
	Fri, 24 Oct 2025 10:30:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCF3m-00000009268-3LTx
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 10:30:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DD1261E04;
	Fri, 24 Oct 2025 10:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0A9C4CEF5;
	Fri, 24 Oct 2025 10:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761301813;
	bh=JU9mlLt5OFRo9F3ipiVVfRJPb3nIO9fCv0eDi81ROAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GWjDwZ9npxXBtV2wwplsijKuUsN0XUNVpsE05e6x/WQuRcMorBffSwDuHBbrW15kC
	 Tv1HyF+JDvnLqZ3EQoqMdRUX4xBLxYUUMHgCaIx+SrlMwrvEAJPjUh+kg2cwE7q6ko
	 Iypv+pjIalmm+SxDbaLkPvrDWdwTFVXu2JzNq0l3tq7kConUDhsDI2Xp48Mh4idl4F
	 samQXBBSIHg35Ebu29n64Q8Pj0BRmkVTc2Fqhp96tvPyxh6K/HVlA1331/2/WQl64Q
	 RpIhVDJaAmSlbgwWH2X5UZjDY4yNOo79AUA8xvxwalNDuYrNXnqDwS0eRZN6JrDn4Z
	 dljrzU5iAzZ0A==
Date: Fri, 24 Oct 2025 11:30:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v5 5/9] clk: microchip: mpfs: use regmap for clocks
Message-ID: <20251024-vocalist-irritable-dcac9f7db3ce@spud>
References: <20251013-album-bovine-faf9f5ebc5d4@spud>
 <20251013-undercook-flatfoot-70dca974cd19@spud>
 <ab443375-524d-4e6c-a640-7e580c2d0c64@tuxon.dev>
 <20251024-dimness-everyday-1c074ce1f203@spud>
MIME-Version: 1.0
In-Reply-To: <20251024-dimness-everyday-1c074ce1f203@spud>
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
Content-Type: multipart/mixed; boundary="===============8683199912566391119=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8683199912566391119==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cmdZOH2jDCUBULep"
Content-Disposition: inline


--cmdZOH2jDCUBULep
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 11:20:23AM +0100, Conor Dooley wrote:
> On Thu, Oct 23, 2025 at 07:06:01AM +0300, Claudiu Beznea wrote:
> > On 10/13/25 20:45, Conor Dooley wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > > +static int mpfs_cfg_clk_set_rate(struct clk_hw *hw, unsigned long ra=
te, unsigned long prate)
> > > +{
> > > +	struct mpfs_cfg_hw_clock *cfg_hw =3D to_mpfs_cfg_clk(hw);
> > > +	struct mpfs_cfg_clock *cfg =3D &cfg_hw->cfg;
> > > +	unsigned long flags;
> > > +	u32 val;
> > > +	int divider_setting;
> >=20
> > This could be moved near flags to keep the reverse christmas tree order=
 as
> > in the rest of this patch.
>=20
> The driver doesn't (intentionally) use reverse christmas tree. If it
> does, that's just a byproduct of putting bigger types before smaller
> ones.
>=20
> > > +	divider_setting =3D divider_get_val(rate, prate, cfg->table, cfg->w=
idth, 0);
> > > +
> > > +	if (divider_setting < 0)
> > > +		return divider_setting;
> > > +
> > > +	spin_lock_irqsave(&mpfs_clk_lock, flags);
> >=20
> > As spin locking is introduced in this file by this patch, you can go
> > directly w/ cleanup helpers for locking.

Actually, if using regmap_update_bits(), locking might be entirely
removable. Depends on if there's some rmw sequence that can't move to
that.

> >=20
> > > +
> > > +	regmap_read(cfg->map, cfg->map_offset, &val);
> > > +	val &=3D ~(clk_div_mask(cfg->width) << cfg_hw->cfg.shift);
> >=20
> > Why cfg_hw->cfg.shift here --------------------^ but cfg->shift on the =
next
> > line?
> >=20
> > > +	val |=3D divider_setting << cfg->shift;
> > > +	regmap_write(cfg->map, cfg->map_offset, val);
> >=20
> > Can't the regmap_read() + updated + regmap_write() be replaced by
> > regmap_update_bits() ?
>=20
> Yeah, I suppose it could. Ultimately what's here is a revert of with
> readl()/writel() replaced by regmap operations directly, so the answer
> to the above three items is that that's how they were done before the
> patch I am reverting. That's probably the answer to 90% of the things
> you've said here, this is how they were done prior to the commit I am
> reverting.
>=20



--cmdZOH2jDCUBULep
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPtVMAAKCRB4tDGHoIJi
0uf0AQDkUwMVo2nLuCjUiqS8lzzjgsUHyqv+EenABprkO/fhJAEAzoGnYa8a2STF
Q4Yml7WMygK6osuskoNBZTG8Nj5Trw0=
=qgBc
-----END PGP SIGNATURE-----

--cmdZOH2jDCUBULep--


--===============8683199912566391119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8683199912566391119==--

