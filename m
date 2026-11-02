Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD9A606A324
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 20:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kVLjMIRM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CSRZODUK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=v0E+Kh+DlBYS4p8pHNOmP1N2vJgUMXc9Kg4yi+rbKew=; b=kVLjMIRMLrXR0ZCZCjUH0+mZFz
	etyZOXQBZw7ARElpAD6cGuBDiaieDJo+7bpua4sdX+3UFfOWgMxL1gGpZDUCIiSQO9iyMjE/jZ9w+
	leHiL/JFIIzJFiV8ats2khU9FDMoz8iszKkuOZEq7Hl5Yy1DxgPVZpvrYUl9fWWbq5nlYNfV0YS2C
	QaidU/c/dkjgVYpI8oWWYrAtbiLEJrZ+G4oFyBOQTOsPfRfkUlatrAb12kaCqjl7XVdiwrtqg38bR
	RhJt63jRpKZEHMczQT8lvENgOTdqnzDTHCXK4Z0ro9xZLLiDhoCfgbL197jPC2pOvCnC/jY0EwpPA
	kOr/H00g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxRn-0000000044m-0nan;
	Mon, 02 Nov 2026 19:11:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxRl-0000000044W-1xgf
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 19:11:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C9E1A43C7A;
	Mon,  2 Nov 2026 19:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A077A1F00A16;
	Mon,  2 Nov 2026 19:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793646716;
	bh=AgYWzVkrd0FAA36W9FOipwPtzV7qJco9n4AtSE0Qekc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CSRZODUKiphAyBEKGfeVwgnNBvUueO5U6sCBRCmxRs67dyjtWJTfBCLDQAuhqm0L5
	 iJmYwfHwfYLIIOjFVr8YK3uMncDHOO1huqnoGMYLsfWhO4pzkbbBssdyyfiroon+fg
	 avu6VfYlpaFzex4ztPnRoTqh6TRLTY9WkkhUZSYDSG38hIjVQW3E4L/5L9rD+mWwyK
	 mA1Qia9mYcHjT7ikcZc+4vCuFPzcbjB1/dpLMAgCbcPJ/eV1MAJDee7kOO/44HsVvz
	 TZeyfJH5UVInpRn5wMxZjuxayvuzK7DQ747dN32zRg5hEzGLRFz+c5dLoETU0PRQMw
	 QD2GavBw5SSMg==
Date: Mon, 2 Nov 2026 19:11:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Han Gao <rabenda.cn@gmail.com>
Cc: gaohan@iscas.ac.cn, Drew Fustini <fustini@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>,
	Radu Rendec <radu@rendec.net>,
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>
Subject: Re: [PATCH 17/18] riscv: defconfig: enable A210 support
Message-ID: <20261102-conductor-expanse-db86270fc1a6@spud>
References: <20261022-concrete-rebound-593001f1ac18@spud>
 <20261102142300.3784622-1-rabenda.cn@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261102142300.3784622-1-rabenda.cn@gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4551410945271622442=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4551410945271622442==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gquej4m2ddx2wa7L"
Content-Disposition: inline

--Gquej4m2ddx2wa7L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2026 at 10:22:53PM +0800, Han Gao wrote:
> On Thu, 22 Oct 2026 19:50:51 +0100 Conor Dooley <conor@kernel.org> wrote:
>=20
> > On Thu, Oct 22, 2026 at 03:53:37AM +0800, Han Gao via B4 Relay wrote:
> > > From: Han Gao <gaohan@iscas.ac.cn>
> > >=20
> > > Enable A210 platform drivers and reserve ten 8250 UART ports.
> > >=20
> > > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > > ---
> > >  arch/riscv/configs/defconfig | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >=20
> > > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defcon=
fig
> > > index 04ae305d5511..b9b3bca12089 100644
> > > --- a/arch/riscv/configs/defconfig
> > > +++ b/arch/riscv/configs/defconfig
> > > @@ -33,6 +33,7 @@ CONFIG_SOC_STARFIVE=3Dy
> > >  CONFIG_ARCH_SUNXI=3Dy
> > >  CONFIG_ARCH_TENSTORRENT=3Dy
> > >  CONFIG_ARCH_THEAD=3Dy
> > > +CONFIG_ARCH_ZHIHE=3Dy
> > >  CONFIG_ARCH_ULTRARISC=3Dy
> > >  CONFIG_ARCH_VIRT=3Dy
> > >  CONFIG_ARCH_CANAAN=3Dy
> > > @@ -149,6 +150,8 @@ CONFIG_KEYBOARD_GPIO=3Dy
> > >  CONFIG_KEYBOARD_SUN4I_LRADC=3Dm
> > >  CONFIG_SERIAL_8250=3Dy
> > >  CONFIG_SERIAL_8250_CONSOLE=3Dy
> > > +CONFIG_SERIAL_8250_NR_UARTS=3D10
> > > +CONFIG_SERIAL_8250_RUNTIME_UARTS=3D10
> >=20
> > Why are these options needed?
>=20
> The A210 has 10 UARTs and the TH1520 has 6. With the default of 4,
> UARTs beyond the 4th don't get a fixed ttyS index and end up in
> whatever slot is free. Raising both to 10 keeps the index stable.

Put this in the commit message please.

>=20
> >=20
> > >  CONFIG_SERIAL_8250_DW=3Dy
> > >  CONFIG_SERIAL_OF_PLATFORM=3Dy
> > >  CONFIG_SERIAL_EARLYCON_RISCV_SBI=3Dy
> > > @@ -167,6 +170,7 @@ CONFIG_SPI_PL022=3Dm
> > >  CONFIG_SPI_SIFIVE=3Dy
> > >  CONFIG_SPI_SUN6I=3Dy
> > >  # CONFIG_PTP_1588_CLOCK is not set
> > > +CONFIG_PINCTRL_A210=3Dy
> > >  CONFIG_PINCTRL_TH1520=3Dy
> > >  CONFIG_PINCTRL_SOPHGO_CV1800B=3Dy
> > >  CONFIG_PINCTRL_SOPHGO_CV1812H=3Dy
> > >=20
> > > --=20
> > > 2.55.0
> > >=20
> > >=20
> >=20
>=20
> Sent using hkml (https://github.com/sjp38/hackermail)

--Gquej4m2ddx2wa7L
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaujgdQAKCRB4tDGHoIJi
0jPcAQDKI8weKUpx73/mvAz55ZSZJ2tWU0Rex9ydvDyirhyY6AEAgAFedfAkbkLn
qFuD39PtQFQgsFubq8Zyvj5bZZDhNQw=
=TAKE
-----END PGP SIGNATURE-----

--Gquej4m2ddx2wa7L--


--===============4551410945271622442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4551410945271622442==--

