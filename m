Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA592C10F15
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 16:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33scMBuSUbA6jkFu+zU75GvXIzo1Hwk4vjc+BCONVmI=; b=uAPzkbgLAOoYAB4/PiMWV3G8Au
	dbLM6rriQXcKPR6c5WFjtNvPNJnEKgdvnwb2OoAF0+CFy/5zNT4uz7kiq1L8IvJ1GR9NLmj66+M0E
	zYRaD23tpn7YtQ6lp1S/x1XNM646n/Nh5MGPpvbmEKKpDRTVcefLP8eYasIHWZ/JIExh4YAjV9tGH
	F2e4agfYrjVN+24IZbltk+jjMVoNRI5uZaGc9T7hLIAIby049QwFV56Lw/zJJoFTeVuMHXSVLvIsY
	OLMamToEmb0NXQDA5tFe/zMSugIGNIL52dufPZSsgrpKA474aMXzToajrIQtQVkpSYP5tJuhfCvK1
	J2KC7Dzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s024K-00000009P2U-2IZT;
	Thu, 25 Apr 2024 16:35:32 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s024G-00000009P0b-1C02
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 16:35:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7CF4DCE12B4;
	Thu, 25 Apr 2024 16:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9264BC113CC;
	Thu, 25 Apr 2024 16:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714062925;
	bh=eKZlsQ9ssnVdmKeVleGh1NSZKulcJ3+HKLLsNghHnu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iv060KnjxmA7fLWlZ2OQqxD7BnIl9ihl3lADBe/dGP51maPHYJo7imXVbeqPDvpzJ
	 2G3Ep0+sM2DU69wnd8nHJY3w2xPWuZgVisM/bOtj3Swu+twTrlc/JueteQeeb0P1hI
	 U2nOi1q5rEN3K45PVwKP4GUw2YKlxWq89J77quWGlEs+ktazNFFWT7D4XcFC0d/tIj
	 zJ7eHL4DL0CQL8gV+CvB+z43sKJPU+ck8PorLRM44rVHGI+EhmKZTIaEKkLV/A6iKr
	 IZrsOcOphJ6SFxRarvCFpiuIc3Iht/UoAoIf8nerhHEbe7eNqtNvBa6p2r5AaSZlOX
	 ln+faTFS950NQ==
Date: Thu, 25 Apr 2024 17:35:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	andi.shyti@kernel.org, jszhang@kernel.org,
	miquel.raynal@bootlin.com, linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org, thomas.petazzoni@bootlin.com,
	guoren@kernel.org, wefu@redhat.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
	krzk+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com
Subject: Re: [PATCH 0/4] Add I2C support on TH1520
Message-ID: <20240425-script-fondness-0e80bfa31615@spud>
References: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
 <171405653346.2527762.16827325392956038580.robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <171405653346.2527762.16827325392956038580.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_093528_711003_B2F6A446 
X-CRM114-Status: GOOD (  25.45  )
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
Content-Type: multipart/mixed; boundary="===============1688644366573700559=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1688644366573700559==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LvUcHBMg/ZVHkvhr"
Content-Disposition: inline


--LvUcHBMg/ZVHkvhr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 09:51:26AM -0500, Rob Herring wrote:
>=20
> On Thu, 25 Apr 2024 10:21:31 +0200, Thomas Bonnefille wrote:
> > This adds I2C support in the device tree of the T-Head TH1520 RISCV-SoC
> > and a default configuration for the BeagleV-Ahead. It appears that the
> > TH1520 I2C is already supported in the upstream kernel through the
> > Synopsis Designware I2C adapter driver.
> > As there is no clock driver for this board as of today, this patch
> > series uses a fixed-clock named i2c_ic_clk.
> > There is also no pinctrl driver yet so pinmux must be handled manually
> > for now.
> > It also fixes the order of the nodes in the device tree to comply with
> > device-tree coding-style.
> >=20
> > Thomas Bonnefille (4):
> >   dt-bindings: i2c: dw: Document compatible thead,th1520-i2c
> >   riscv: boot: dts: thead: Fix node ordering in TH1520 device tree
> >   riscv: dts: thead: Add TH1520 I2C nodes
> >   riscv: dts: thead: Enable I2C on the BeagleV-Ahead
> >=20
> >  .../bindings/i2c/snps,designware-i2c.yaml     |  12 ++
> >  .../boot/dts/thead/th1520-beaglev-ahead.dts   |  22 ++++
> >  arch/riscv/boot/dts/thead/th1520.dtsi         | 120 ++++++++++++++----
> >  3 files changed, 127 insertions(+), 27 deletions(-)
> >=20
> > --
> > 2.44.0
> >=20
> >=20
> >=20
>=20
>=20
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>=20
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>=20
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>=20
>   pip3 install dtschema --upgrade
>=20
>=20
> New warnings running 'make CHECK_DTBS=3Dy thead/th1520-beaglev-ahead.dtb'=
 for 20240425082138.374445-1-thomas.bonnefille@bootlin.com:
>=20
> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: i2c-clock: clock-freq=
uency:0:0: 50000000 is greater than the maximum of 5000000

The bot is not freaking out here, 50 MHz is indeed more than 5 MHz :)

--LvUcHBMg/ZVHkvhr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiqGSAAKCRB4tDGHoIJi
0o+gAQD9y0YVzRTF8HegZu1SkndMW+2UKrW5hDZMBdhYKLCsJgEA2lS/uw7PcBKt
sur9daO8spSl/mTvxgKzvuVTXvZQqAk=
=kJRE
-----END PGP SIGNATURE-----

--LvUcHBMg/ZVHkvhr--


--===============1688644366573700559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1688644366573700559==--

