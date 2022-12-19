Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D2CC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Dec 2022 18:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6OcbB9RRkVZuKXxrEaJP/FFnVfLDWdMHoBhAzhgARMU=; b=KcC8RX31VcPTuveh1e49xEHaPA
	leu3+46RpQJRNs3s2sx8s2JhPcshvESLFqwculbUKBmDP9DvJpmMYyl2LpIEBnPDEstmeIdzRxj4a
	z3tJ/DKKijDuTsTy6XLfMHb+a2IQsypBXLtBYK7g9KChrBZYQnMdzGM/CHX5jB5WnyyDM/qpP/IvO
	OmlMVl0GCRj1Qeuu/hadDPCGZVusVBAH+VGWFDtDiuYqj/vOqHSg0h0lYpVRlVPsLs3wkkF5J7+uz
	nqapBgspcXbz8526Ni3KIq9ISLQEzGxCKUhb9dEKEIMpWKAS6Vbgi3wTvHoUdPivAf9FfBon/RexX
	yD93p5cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7LBc-000Bol-Bd; Mon, 19 Dec 2022 18:48:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7JVE-00GQYw-Dy; Mon, 19 Dec 2022 17:00:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 56EE961077;
	Mon, 19 Dec 2022 17:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6ED3C433D2;
	Mon, 19 Dec 2022 17:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671469234;
	bh=k0vP8vhlTYUEUENAWD2qoXo6BWQdHZVBcBn/j/1G/UY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SpIxsUctCG+ggHNypNGWg+9ZKP1xB1X3d6338HaxLzLoBGYMLoShGsAahMpVuX1xd
	 xr0udtMZ5DWFPVMgD5lFU5X+5jfNUh5PdmlyyZVTIp9bPZwrQ6jbh0HU5eOdbjMR9M
	 fcFKSg00/u4zb7jDL+fh9bsJt7RSCfLd29hjSSw3/yHSz2u1Btg8WGSKkFvpDNTaeg
	 5Dp9rxZyOXA5LNovbUpw+IGevsKGX6HiVleb30fNYx8gnkasQs3IRhT9bXeTKa15pS
	 5sxKMWzy5q4moFqYR/WNnBRw9IOsF+9DsG+yRO1BsqV0nPQgZ+/qUiVyxoskZ5E+MJ
	 OBYDT+mbweh4A==
Date: Mon, 19 Dec 2022 17:00:29 +0000
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Jisheng Zhang <jszhang@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v3 00/12] riscv: Allwinner D1/D1s platform support
Message-ID: <Y6CYrVukEW1VMf8R@spud>
References: <20221208090237.20572-1-samuel@sholland.org>
 <Y53/ruLoggBDXozF@spud>
 <e9428f30cf0c6a239af01c0c2db9c511f3561a8c.camel@icenowy.me>
MIME-Version: 1.0
In-Reply-To: <e9428f30cf0c6a239af01c0c2db9c511f3561a8c.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_090041_391241_B3F3C1A5 
X-CRM114-Status: GOOD (  26.49  )
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
Content-Type: multipart/mixed; boundary="===============9022582228486819735=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9022582228486819735==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1Myp6idsTSAhtZvC"
Content-Disposition: inline


--1Myp6idsTSAhtZvC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2022 at 05:43:17PM +0800, Icenowy Zheng wrote:
> =E5=9C=A8 2022-12-17=E6=98=9F=E6=9C=9F=E5=85=AD=E7=9A=84 17:43 +0000=EF=
=BC=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
> > On Thu, Dec 08, 2022 at 03:02:25AM -0600, Samuel Holland wrote:
> > > This series adds the Kconfig/defconfig plumbing and devicetrees for
> > > a
> > > range of Allwinner D1 and D1s-based boards. Many features are
> > > already
> > > enabled, including USB, Ethernet, and WiFi.
> > >=20
> > > The devicetrees use bindings from the following series which have
> > > not
> > > yet been merged to linux-next:
> > > =C2=A0- In-package LDO regulators:
> > > =C2=A0=C2=A0
> > > https://lore.kernel.org/lkml/20221208084127.17443-1-samuel@sholland.o=
rg/
> > > =C2=A0- Ethernet MAC binding fix (not a new issue with D1):
> > > =C2=A0=C2=A0
> > > https://lore.kernel.org/lkml/20221208061616.7806-1-samuel@sholland.or=
g/
> > > =C2=A0- TI ADC101C ADC (accepted, not yet in linux-next):
> > > =C2=A0=C2=A0
> > > https://lore.kernel.org/lkml/20221125220903.8632-1-samuel@sholland.or=
g/
> > >=20
> > > The only remaining DT validation issue is that gpio-fan is missing
> > > a
> > > YAML conversion, although one is on the list here:
> > > https://lore.kernel.org/lkml/20220126200350.3633576-1-clabbe@baylibre=
=2Ecom/
> >=20
> > With the above 4 in next:
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Corentin's patch looked like it needed only minor changes. I shall go
> > ping it :)
>=20
> In addition I think Corentin's patch shouldn't be a blocking issue.
> This patchset does not depend on DT binding being converted to YAML,
> TXT binding is enough as dependency.

I rid RISC-V of warnings and I would like it to stay that way please.
There's other stuff outstanding anyway and Corentin has already sent a
v2 :)


--1Myp6idsTSAhtZvC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6CYrQAKCRB4tDGHoIJi
0jm1AQCxFAoy0OVLOEwILVBPezoKFbbLuL52TrriLLuZyhtvxAD+P99BF/pHCiDs
qImJEY24BG8loa7iDlE9m0SUWZl8qA0=
=r6VJ
-----END PGP SIGNATURE-----

--1Myp6idsTSAhtZvC--


--===============9022582228486819735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9022582228486819735==--

