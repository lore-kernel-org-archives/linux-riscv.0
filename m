Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D09C46CD2
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 16:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucHlc2kFUi3NcL0e43l2AbInzCs7HNcfOgiTVw/pODs=; b=ppsktYVS+spn2UW4hXIUsfguYR
	YcrhlaFgbC2ikDXgDUpeXhdrmiQ1zAlwqkYGOoMWgCGQusCkRLCPQIWGUinfkL+d66yE8a/rUTgWq
	tN15uh0Vbax4m5NQL1PFg06u65VyDEh0lG8G6SP5lJ1MnW3A5Zg2LSQkkgE1qwrHi8Z7eQp+RxRa5
	QMzZT1zYrrcVA4Jnlfe8wIoh46Ar05rOGlTgQip9M4nsWFdMpeJcjz+ONiLah3hMwgBMyeD1wwJVe
	6Unls0aCqBNYzj03vTfrRey+rBaGN5FLz/tDmyw/t0F5bUuSh5SUdCinOnR/MYDFXwM3eKVexjjQB
	QwUCUMuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFGLA-00BQ0m-34;
	Mon, 18 Dec 2023 16:19:37 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFGKv-00BPui-3A;
	Mon, 18 Dec 2023 16:19:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 3EC85B80E28;
	Mon, 18 Dec 2023 16:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F15C433C7;
	Mon, 18 Dec 2023 16:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702916359;
	bh=O2FEuDifDL2P4lnmBQkiXP99VZ+Qm7eQRuu60BX1nSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IXfV4YdXf5jsq5qlVkCEFGHdm48BTHmeqPG6MW0lYxHcHpDvZ6a7qmRepwayqI7UG
	 CreEzroBp3BvhY7ErEe7YGRp5mb2mR+AgdIw7ayhcvN6F/d8EAQImqvz8Ua+akkib9
	 4+gI4V5eldQgpJ3GG9okMaI2YbyNNIAYwIOhPQfYZM4ySzQhk9RCFf9EMhHKtXxDwy
	 XZPk2WBOHiUbfvnny+tP/H3N5O1wKLEx3LpOUPVUDEzlW8aHSiSAbYygJECrRaDgJ6
	 9EwZPHaKEYtrgwiPmcMuL2wsXYVFCOLpEwIjxnWTqLH+2QSEQD0uq4hr8eMMAMXOf1
	 xgrMS3GbdCDpQ==
Date: Mon, 18 Dec 2023 16:19:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Brandon Cheo Fusi <fusibrandon13@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/5] cpufreq: sun50i: Add D1 support
Message-ID: <20231218-qualified-mahogany-05e1d6630152@spud>
References: <20231218110543.64044-1-fusibrandon13@gmail.com>
 <20231218110543.64044-4-fusibrandon13@gmail.com>
 <20231218-blabber-slapstick-ab7ae45af019@spud>
 <20231218155345.476e71ea@donnerap.manchester.arm.com>
MIME-Version: 1.0
In-Reply-To: <20231218155345.476e71ea@donnerap.manchester.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_081922_758940_83CC8230 
X-CRM114-Status: GOOD (  21.42  )
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
Content-Type: multipart/mixed; boundary="===============3919385826522655016=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3919385826522655016==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WIOIVM4fGS0/A+5Z"
Content-Disposition: inline


--WIOIVM4fGS0/A+5Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 03:53:45PM +0000, Andre Przywara wrote:
> On Mon, 18 Dec 2023 14:55:30 +0000
> Conor Dooley <conor@kernel.org> wrote:
>=20
> Hi,
>=20
> > On Mon, Dec 18, 2023 at 12:05:41PM +0100, Brandon Cheo Fusi wrote:
> > > Add support for D1 based devices to the Allwinner H6 cpufreq
> > > driver
> > >=20
> > > Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> > > ---
> > >  drivers/cpufreq/sun50i-cpufreq-nvmem.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq=
/sun50i-cpufreq-nvmem.c
> > > index 32a9c88f8..ccf83780f 100644
> > > --- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > > +++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > > @@ -160,6 +160,7 @@ static struct platform_driver sun50i_cpufreq_driv=
er =3D {
> > > =20
> > >  static const struct of_device_id sun50i_cpufreq_match_list[] =3D {
> > >  	{ .compatible =3D "allwinner,sun50i-h6" },
> > > +	{ .compatible =3D "allwinner,sun20i-d1" }, =20
> >=20
> > I thought the feedback in v2 was to drop this change, since the
> > devicetree has the sun50i-h6 as a fallback compatible?
>=20
> Well, this is the *board* (fallback) compatible string, so we cannot assi=
gn

Oh of course... That's both me and Jernej that tripped up on this.
Brandon, please ignore the comment from me on this patch.

Thanks,
Conor.

--WIOIVM4fGS0/A+5Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZYBxAAAKCRB4tDGHoIJi
0vwCAP9HxMt2rr0zzqQjlPunuOySoBKZQSCHZ/XtknDCK5QmRAEAmC4SAoti4deM
mI0Y9cwGsZF8WY18EbSqa4VWObGbdwA=
=bD8L
-----END PGP SIGNATURE-----

--WIOIVM4fGS0/A+5Z--


--===============3919385826522655016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3919385826522655016==--

