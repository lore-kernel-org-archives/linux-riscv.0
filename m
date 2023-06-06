Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BF5C7EE2F
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 22:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dB9Sjf6o8lDzo9KYYERkd+xlRWg6tuztCrY1/hoXxy8=; b=l37ALI8srDDDg0g60Het1ucxBq
	shde7xfwsm6w73JnXOqd+1I3qy+isaj2mQT8Kj5SCbZNdyoJcl2nGwKXUq90NBUr3MDV4Z8ZxoalL
	R5U+152Ykcy63gERKArW24aammgu8ceOvvNneScSDVh6SQe/ys3xQszcpiKk9GCNHHtr4WNGxAeCL
	dJd6AvfgbL1aVyFDXQW0Yu8XzpqoXLldsNlYP8falG/AHg/HtlwB6mi53DNPR8XPFDFFSDY2n/9XM
	Uv8+fia45k7MMwOi++bl/g09B7Gf1BB4jekWcXIkz/acewdOObn/jup51TRolr/SimA0UqLhA03wl
	DU6mybkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6fJW-003THM-17;
	Tue, 06 Jun 2023 22:38:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6fJT-003TGq-1l
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 22:38:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 067C6638AE;
	Tue,  6 Jun 2023 22:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AFA2C433EF;
	Tue,  6 Jun 2023 22:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686091081;
	bh=+d7JeMeUUdZO2aVYQ8oGUF7pb9l8qtsCjpkX1+tKZ0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ah/xpfYXpLSl/KXOtkf2COQ1AifCQwoMbz5GdNd9ACRL9pAXI9y5pmZwAaJiuFZTy
	 onaUd+OM2JgRXTnepEsVZZZyWcLJkgZfFeKsIsfdH7ovQw9K9sgVTVYjMcqM7D6nA9
	 hp6MJNabTZ5pUEYGZD3ZDKgehKx1/cBeVeWGsAexmiW6Du23w+QR4x5A55TodM83oa
	 91QKw/L/4nPKp2Cz68Z8OsFWACnxb0UsfN1nQG3MO4QLalWNIWmH7MH7HksH3/FyDv
	 mzpv63FSaBnTJ9AtPkRKj+sxtFNOsBR6Y5Sz/icdY9vgSCXdvfBFqUv4w9/M10dyUA
	 jCnwRE4nixJyA==
Date: Tue, 6 Jun 2023 23:37:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Keith Zhao <keith.zhao@starfivetech.com>,
	Shengyu Qu <wiagn233@outlook.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
	Chris Morgan <macromorgan@hotmail.com>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	Shengyang Chen <shengyang.chen@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: Re: [PATCH 1/9] dt-bindings: display: Add yamls for JH7110 display
 subsystem
Message-ID: <20230606-geometry-blurb-1f0f07d4bf6a@spud>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602-uncommon-rejoicing-e73c0c475f9f@spud>
 <TY3P286MB26116576E3E502CAE53834599852A@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
 <1991848.PYKUYFuaPT@diego>
MIME-Version: 1.0
In-Reply-To: <1991848.PYKUYFuaPT@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_153803_666074_1D75E29D 
X-CRM114-Status: GOOD (  30.59  )
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
Content-Type: multipart/mixed; boundary="===============7367901686084086324=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7367901686084086324==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1lwN/EJcI4S+S54L"
Content-Disposition: inline


--1lwN/EJcI4S+S54L
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 07, 2023 at 12:22:33AM +0200, Heiko St=FCbner wrote:
> Am Dienstag, 6. Juni 2023, 20:41:17 CEST schrieb Shengyu Qu:
> > > On Fri, Jun 02, 2023 at 03:40:35PM +0800, Keith Zhao wrote:
> > >> Add bindings for JH7110 display subsystem which
> > >> has a display controller verisilicon dc8200
> > >> and an HDMI interface.

> > >> +description:
> > >> +  The StarFive SoC uses the HDMI signal transmiter based on innosil=
icon IP
> > > Is innosilicon the same thing as verisilicon? Also
> > > s/transmiter/transmitter/, both here and in the title.
> >=20
> > I think that is not the same, I remember Rockchip has used a HDMI=20
> > transmitter from
> >=20
> > Innosilicon, and there is a existing driver for that in mainline.
>=20
> Yep, I think Innosilicon is the company you turn to when you want to save
> a bit of money ;-) . In the bigger SoCs Rockchip most of the time uses
> Designware hdmi blocks and looking at the history only the rk3036 ever
> used an Innosilicon block.
>=20
> Looking at the history, 2016 really was a long time ago :-D.
>=20
> > So Keith, if that's true, I think it is better to seperate the HDMI=20
> > stuff and reuse existing driver.
>=20
> I'm not so sure about that - at least from a cursory glance :-) .
>=20
> The registers do look slightly different and I don't know how much
> the IP changed between the rk3036-version and the jh7110 version.
>=20
> At the very least, I know my rk3036 board isn't booting right now, so
> I can't really provide help for generalizing the rockchip-driver.
>=20
> At the very least both the binding and driver could drop the "starfive-hd=
mi"
> and actually use the Innosilicon in the naming somewhere, so that it's
> clear for future developers :-)

Seeing "based on" always makes me a little bit nervous to be honest when
it comes to using a compatible from the IP. Is it the IP? What version
is it? etc. Perhaps "starfive,jh7110-hdmi" & falling back to some sort
of "innosilicon,hdmi" would be more future/IP-silliness proof.
Driver can always be generic & bind against "innosilicon,hdmi" until
that becomes impossible.

Cheers,
Conor.

--1lwN/EJcI4S+S54L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZH+1QQAKCRB4tDGHoIJi
0ihwAQC+3gfFJAPFBOT76QYpqrSJuQHRjE1iNJt0+04zAqcRDgD+KopK8i99wbS9
4s+s9CpPS+b/RBAa5Zq6Zq0Bynk3jgc=
=XnKq
-----END PGP SIGNATURE-----

--1lwN/EJcI4S+S54L--


--===============7367901686084086324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7367901686084086324==--

