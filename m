Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2EBE7717F
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 18:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXejqJFxCrNUhS//nlRf55SIM1tT6T1Uib+lQBTRBxc=; b=PV1J5IY6jS3CoIkkReEWu2tEtW
	yi3sMfuZJ2mQjX3elSPsv4K/YprY8ObPYJr7Qrl/LnLJChlRuKsp5x9cPc6qXJY2KfdnWRPCHdOge
	b/KkBLx2/OLN0UNF9TLjM/03Eu5u4N8yqKSML3GWk6ZVYpUrMYbktJFL1ICYooWEReysK+5cHQctN
	zzO0DQmW0Xmpl7FRM2rLa46Mtc+J9FTSxMceS4AhcVm2Mo1OgwY24No/Z12RXoc72ck3t0Tl3+3Rr
	NJzhJCBRndgV/Z9ter3MPu74q4witxNPBzp4L7z4EqYEHEiy84l2Pjb4U6ztp6ccZ54761uNJokqZ
	abzlFMbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNcNn-0000000EYey-4Ak2;
	Tue, 17 Dec 2024 18:33:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNcNk-0000000EYeK-3UMM
	for linux-riscv@lists.infradead.org;
	Tue, 17 Dec 2024 18:33:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 627F5A41E96;
	Tue, 17 Dec 2024 18:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A324C4CED3;
	Tue, 17 Dec 2024 18:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734460399;
	bh=0LJCNoyysYP8N431fASKThLoY2yTIEXftjPpfxsGsqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qrw/fJ4ehP2/+6XX1m6k5ZoHxty43jYoXBs94Aacn8MwgJFX21xvjtT4BC5CsEanf
	 e4H2pmtX5beery5cYDuj7D7clLV7o0+2vdQ9mWbt6QHvUEF5TIsMvRUyxO0Gn9Mtte
	 BqHiLY1O3xEOokKRqqXj0evcxTl8XfaZlYBKz31idBrrw8+HBy+ikgPVd1CnNwp+iI
	 h+7Rrd1EInJV6VJtMAabVGXtTdCIUapKf7TZuuDm2Yz6JjqUshQ9ManzY33b7uWAwD
	 jGeivwQHcOBUvTF2OafyQUTDI9vhWaW0UjxGTvBP/T7jBLNw9mmvNQcSVgxMzkNF2h
	 0MxgTzy8XD2YA==
Date: Tue, 17 Dec 2024 18:33:14 +0000
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Hal Feng <hal.feng@starfivetech.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: Use named
 definition for mmc1 card detect
Message-ID: <20241217-strained-latch-52bf7d03716d@spud>
References: <20241210040652.164030-1-e@freeshell.de>
 <20241216-elixir-cupped-f7a83bce4e12@spud>
 <ZQ2PR01MB1307F1FC7EEB8701525AC9DEE604A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <bd4df536-0a5d-4ba9-ad0c-51a7828acd9c@freeshell.de>
MIME-Version: 1.0
In-Reply-To: <bd4df536-0a5d-4ba9-ad0c-51a7828acd9c@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_103320_996145_E58332BF 
X-CRM114-Status: GOOD (  17.55  )
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
Content-Type: multipart/mixed; boundary="===============2135973789613315680=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2135973789613315680==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zM9vNY+QhMihoDl/"
Content-Disposition: inline


--zM9vNY+QhMihoDl/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 07:25:59PM -0800, E Shattow wrote:
> Hi, Hal
>=20
> On 12/16/24 18:02, Hal Feng wrote:
> > > On 17.12.24 04:13, Conor Dooley wrote:
> > > On Mon, 09 Dec 2024 20:06:46 -0800, E Shattow wrote:
> > > > Use named definition for mmc1 card detect GPIO instead of numeric l=
iteral.
> > > >=20
> > > >=20
> > >=20
> > > Applied to riscv-dt-for-next, thanks!
> > >=20
> > > [1/1] riscv: dts: starfive: jh7110-common: Use named definition for m=
mc1
> > > card detect
> > >        https://git.kernel.org/conor/c/c96f15d79172
> >=20
> > No, here "41" means the GPIO number, but GPI_SYS_SDIO1_CD means the
> > multiplexed function and should be used by pinctrl pinmux not gpio subs=
ystem.
> > Although GPI-SYS_SDIO1_CD is numerically the same as 41.
> >=20
> > Best regards,
> > Hal
>=20
> You're right, Hal. I'm confused trying to make sense of this.
>=20
> From dts/upstream/src/riscv/starfive/jh7110-pinfunc.h:
>=20
> "gpio nr:  gpio number, 0 - 63"
>=20
> And yet in dts/upstream/src/riscv/starfive/jh7110-common.dtsi there's:
>=20
> >                        pinmux =3D <PINMUX(64, 0)>,
> >                                 <PINMUX(65, 0)>,
> >                                 <PINMUX(66, 0)>,
> >                                 <PINMUX(67, 0)>,
> >                                 <PINMUX(68, 0)>,
> >                                 <PINMUX(69, 0)>,
> >                                 <PINMUX(70, 0)>,
> >                                 <PINMUX(71, 0)>,
> >                                 <PINMUX(72, 0)>,
> >                                 <PINMUX(73, 0)>;
>=20
>=20
> Loosely on the subject of MMC interface and GPIO numbering, what is the
> above code doing? These are not GPIO numbers 0-63 so what is this?
>=20
> I'm trying to understand this so I can write the Mars CM (-Lite) dts.
>=20


> Conor, and Hal: sorry for the mistake there.

No worries, I've dropped the patch.

--zM9vNY+QhMihoDl/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2HD6gAKCRB4tDGHoIJi
0hx5AQCjUaWDZdSICwuiFgW3qzlx/fAJ5VM/9GybUgK3QXXf2wEA4m4EvN0dnQ9y
4vL2IE0lHykSUmNH+cll76hi+n8ciwY=
=90mb
-----END PGP SIGNATURE-----

--zM9vNY+QhMihoDl/--


--===============2135973789613315680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2135973789613315680==--

