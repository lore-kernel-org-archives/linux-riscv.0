Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF6BFEC0E6
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 17:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJAVooUPiNQfMb0QIQij39qaNqwZb9p+FzXypiDhA3s=; b=SPrMwOcYjBqIbm3DCgUH+ZRiO2
	JLt/0kzred8haIorZLM3S3SvowUKC4IBjHV7mq/QW7RjyQ3GSlkSu8IictiEjjFwzX7/z+yoch1ka
	F/vVPDDJw/g0rPV1DpVpkwPKBliDfZ2g3D/TJtbnKK/WXA9CtmAlYGhYlpCcJ3+a4B2e/fgf/NOPl
	0ZBEPhFkW4cg2M0626nBXz8qvFTktSm1YRXayKbQSvRRaGZBAt9apZiaYLI9b2LZxyqf9Br/IwbPG
	Tw3/OjugEVGXJ3Ye/00ymjYDnK3mO5QSMZMrxhCDu41fiLZnib3jMIe6Wv6qd2EBJbN5xyvmW3kGJ
	MYWTEAug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55p4-000000021LD-3cUF;
	Tue, 24 Mar 2026 17:45:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55p2-000000021Kd-3t8X
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 17:45:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E9B7435B9;
	Tue, 24 Mar 2026 17:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F335AC19424;
	Tue, 24 Mar 2026 17:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774374344;
	bh=upGFHp7lyoGcE1KG0T65EXU8eX+EfmbRVqdvqDeIAUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q53Uk/5NNGvIwCylp+3SADOvVjiS9lI19E4nwffc+W+jPguD3LZXlfftiMeo5crNU
	 TgX2WXgSwVn3XLcam/6EC6/4KEqZf4nDLCX92j+I8yEWZr+hjxLh8h7pVUKYecONEz
	 qdWCrjPj1iBBNV9Yq+3s2AZrM2G9CT1iupVi5obIom5M5JiUKE6ViZGY9tlfGYh48Z
	 e3hsjZF+Wc68XDsUhinxv0FoV/RqQkOqblpzRRwQ2ZOn2YjSgYZ8DY8KLdEOX2UBMW
	 86yKUKKwTyPvehziOoiVWCZpTEIsgT+kdKFoLM6WGwqvso1Rky4DZEFiZ2OhOMlqNw
	 B/2KA7mdl51ag==
Date: Tue, 24 Mar 2026 17:45:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: Re: (subset) [PATCH v13 0/5] PolarFire SoC GPIO interrupt support
Message-ID: <20260324-grub-finless-bacbd4d6ff94@spud>
References: <20260318-gift-nearest-fd3ef3e4819b@spud>
 <177425976898.21144.1074460491522922532.b4-ty@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <177425976898.21144.1074460491522922532.b4-ty@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_104544_992036_AE83ECC0 
X-CRM114-Status: GOOD (  12.52  )
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
Content-Type: multipart/mixed; boundary="===============8279711824885127205=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8279711824885127205==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BcLAMXhdpy+bmO3t"
Content-Disposition: inline


--BcLAMXhdpy+bmO3t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 10:56:20AM +0100, Bartosz Golaszewski wrote:
>=20
> On Wed, 18 Mar 2026 11:04:31 +0000, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Yo,
> >=20
> > Here's a v3 with an extra patch updating the gpio binding from fished
> > out from my old branch, fixing the examples and setting the permitted
> > values of gpios for the controllers on polarfire soc and the existing
> > binding patch's example fixed.
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [1/5] dt-bindings: gpio: fix microchip,mpfs-gpio interrupt documentation
>       https://git.kernel.org/brgl/c/ececb46fc947705f22cc8c1f9182224e7ec4b=
b97

Am I to interpret this being all you applied and the driver getting an
ack as meaning I should take the driver change with the mux driver
through the soc tree?

Cheers,
Conor.

--BcLAMXhdpy+bmO3t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacLNwgAKCRB4tDGHoIJi
0v92AP9QtYZ5z+bPYKGuedxGPgH9ZXMFl7PX5WuGUMEFrWPrSAD/c15IGtL/CEKi
ha8FmsQczul0R8gZyiQtGTaBH23qAwA=
=/NsT
-----END PGP SIGNATURE-----

--BcLAMXhdpy+bmO3t--


--===============8279711824885127205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8279711824885127205==--

