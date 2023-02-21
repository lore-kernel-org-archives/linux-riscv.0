Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A4CC636D7
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 16:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fLfLZ9hITgtvTItSVIylsJvmUcYJZ6LaNvF8OWMly4I=; b=mwZ1hpP7oyIuscvE2gYCzf+sKh
	0CKiKU9N5vCtY/1AD795rRU2HkzJzLRyoT4OLY0yJsMOb++z3zWvOyiNy4U/EmuBUBWtrqhiBbXRm
	zvsn0JiQe27cLcE+DfMbfiolMQZbPTpigVMz8L9t4yF8uyxddYBnH2m0RD3MOXqZfJK5+EnEPSR1u
	e3k99jA35QGntD2HRat0AY+4Hmbi1UJWdatjwW2Qq6sh1Q2BLC7d1rjcU13bU84rfhFs7njDr8VRJ
	mYD200CiyGT0kc5FY8f5k4gN5DsP1y0i1Q3e19Mr1iZrl5v6fPD5s7OeP2t/Bmnxqh06sTEQQxHWP
	yMbkdBzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUVav-008yaY-7N; Tue, 21 Feb 2023 16:34:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUVas-008ya7-VV
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 16:34:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 51BC960FC5;
	Tue, 21 Feb 2023 16:34:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A406C433D2;
	Tue, 21 Feb 2023 16:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676997257;
	bh=rScjK5VMyCZR5Ghp9Xxc1QS4YiviN+AcyuGZCuMiRvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vBMq8NWq57Shnjk1qmarEq628THtxn2i9weKpl5EIslwqdTn0RISvGrycnu0NMX7D
	 NX4jLf0LWPPdx+gVdgfq2CbeWU11SEWV2rGpC5nUGS6smzJSnoXTsK5RoLKstj5h1c
	 yGLQp/4NJ9ITBs+TsO+x2U6jANTN++82vMCXCWJ8W5pfaVpSco8GMcUghkq+btNfYk
	 LakAdK2joxng/PVW5RWh3Hp/vJdM1+/Jw1kgIVrGDscMmUCdYNYTxZJp3Mb7S38SP4
	 9nleouZkPbo0xCQrwJe/l9vr/bRnKNtZnPbir2/ULiUu7RvVGkVobN8DCZKYK1cUa0
	 +M0PKpVMOLAqA==
Date: Tue, 21 Feb 2023 16:34:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Hal Feng <hal.feng@starfivetech.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 13/19] reset: starfive: Add StarFive JH7110 reset
 driver
Message-ID: <Y/TygwbxyuhbDooX@spud>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-14-hal.feng@starfivetech.com>
 <CAJM55Z_O9K=sCRXga9pMOXk9YjXc1v_V0e5S-8xN9Mi8gvHzvg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z_O9K=sCRXga9pMOXk9YjXc1v_V0e5S-8xN9Mi8gvHzvg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_083419_111849_4A56AB47 
X-CRM114-Status: GOOD (  21.32  )
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
Content-Type: multipart/mixed; boundary="===============0685846602056402158=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0685846602056402158==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="di8SMzK5TxlOLwpm"
Content-Disposition: inline


--di8SMzK5TxlOLwpm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 04:33:09PM +0100, Emil Renner Berthing wrote:
> On Tue, 21 Feb 2023 at 03:47, Hal Feng <hal.feng@starfivetech.com> wrote:
> >
> > Add auxiliary driver to support StarFive JH7110 system
> > and always-on resets.
> >
> > Reported-by: kernel test robot <lkp@intel.com>

Drop the reported-by here too please Hal.

> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>

> > +static int jh7110_reset_probe(struct auxiliary_device *adev,
> > +                             const struct auxiliary_device_id *id)
> > +{
> > +       struct reset_info *info =3D (struct reset_info *)(id->driver_da=
ta);
> > +       void __iomem **base =3D (void __iomem **)dev_get_drvdata(adev->=
dev.parent);
>=20
> Hi Hal,
>=20
> I saw the kernel test robot complain about this, but I still wonder if
> the extra level of indirection is really needed. Isn't it enough to
> just add the explicit casts, so
>=20
> dev_set_drvdata(priv->dev, (void *)priv->base);
>=20
> in the clock drivers and here just
>=20
> void __iomem *base =3D (void __iomem *)dev_get_drvdata(adev->dev.parent);

I *think* if you do that, sparse will complain that you cast away the
__iomem. The complaint is something like "cast removes address space
qualifier from expression".

The other option is, rather than set the base as the drvdata, just pass
the whole priv struct. That's what I did for mpfs at least & I thought I
had suggested it on v3, but must not have.
It looks prettier than the casting madness at least ;)

> > +
> > +       if (!info || !base)
> > +               return -ENODEV;
> > +
> > +       return reset_starfive_jh71x0_register(&adev->dev, adev->dev.par=
ent->of_node,
> > +                                             *base + info->assert_offs=
et,
> > +                                             *base + info->status_offs=
et,
> > +                                             NULL,
> > +                                             info->nr_resets,
> > +                                             NULL);
> > +}

--di8SMzK5TxlOLwpm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/TybAAKCRB4tDGHoIJi
0pUxAQC1ZljYcv5/Q6mze0u0z96Oz5pkrLAITwYsm92VzYEYpAEAk6PbItP1RJvB
MFzAwz5syZ6Y4U9Krg0CMdAnSOLNGQ8=
=u5Rk
-----END PGP SIGNATURE-----

--di8SMzK5TxlOLwpm--


--===============0685846602056402158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0685846602056402158==--

