Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E76EE4999
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 19:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2B+pf6lhQ4d5LYkVL69CgmfU2pKocZJdCny2cp7w+G0=; b=LLDDd7VjHfYrL6CuxXf5bGjUK/
	CDoc6Xo4zZ/SbkQeXIlD4nDBwGYUfbxChyHBswTy/JcD4XDNA47pcHWfsTvTo2iwl6LZQskcp70OW
	liTUmUkTNdq3yrxQWaxcJtHky3yD/Ij06BLCePNdINwNaB28fqyDU+Cx6idiDs1b4RRpo0Q2PDRKT
	mEfPTk17nqebz14sYXLyMu2a/V3RHRgVw5lvANM8UyvkBm/ydDb6o9pm7tS9QbQdBsPQ249BiRaEm
	OqEa8mMUMx5m0b2aQ1XUhLnH+o051IOqYeCtGXooNB25MFlZHObOGgAszuk2xfTgL4RTrofL37y0T
	nvmDJNhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vafHp-00000005Ecl-24ao;
	Tue, 30 Dec 2025 19:21:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vafHn-00000005Ecb-2wCn
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 19:21:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F2B960017;
	Tue, 30 Dec 2025 19:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7355FC4CEFB;
	Tue, 30 Dec 2025 19:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767122498;
	bh=JHeq0sE7x9XUxdE+MvcareElflUYAz3cTd2iOEHjm14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mVbdb2wawJgVjJSiF2Us8b8tX5zz+NUWRGvyeOax0xnxWmGR+1GEb4iHW7MkGuh96
	 Nz5pY3xwmumiVuqWQlIVU/lSiOsMmOwAZX5bv9VZhCWAq2bLj4WyShbmAYVXLpGq5b
	 CS9sCr3E0amfDJ4+Ix00gVjykICjtgomP5vSZ6wftkUXKMveVNJvv9GSKly1E38h+8
	 ZYtilKgFaHk3ps9mW6LOUzqtxucZG2KX2JWVCpWnGoyU4zEHlGpExINl8E/7e+dvtD
	 T7G3e1EJ7YFVkZRbJ8/NS5Sw9pKFkZ0t8mOZjitsNDjrCWkvh6Opl3cSlWCf3D9eNf
	 scACs6G9H8Wnw==
Date: Tue, 30 Dec 2025 19:21:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: Guodong Xu <guodong@riscstar.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Yangyu Chen <cyy@cyyself.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Heinrich Schuchardt <xypron.glpk@gmx.de>,
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 07/13] dt-bindings: riscv: Add B ISA extension
 description
Message-ID: <20251230-unselect-canon-842bc2403c47@spud>
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-7-3af3f3cd0f8a@riscstar.com>
 <20251222-stitch-preachy-3fab87fd6f0f@spud>
 <CAH1PCMZ7ywZ3unLy0yHYK+fFHk0y=q2cEtPnRi=qSpf=fc75rw@mail.gmail.com>
 <66c0676a-7920-4825-b916-3c00b1648a08@riscstar.com>
 <20251230-imprison-sleet-6b5a1e26d34b@spud>
 <dc87a3c0-8627-4328-a17a-6510ee8245ac@riscstar.com>
 <20251230-ungloved-unworthy-cacc7e22e1c7@spud>
 <55c2c0e2-2213-4cc9-a752-fce17149bc35@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <55c2c0e2-2213-4cc9-a752-fce17149bc35@riscstar.com>
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
Content-Type: multipart/mixed; boundary="===============0175011529278333766=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0175011529278333766==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1e9YdYuLH+dKIj17"
Content-Disposition: inline


--1e9YdYuLH+dKIj17
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 12:06:39PM -0600, Alex Elder wrote:


> I think it's too bad these "equivalent" extensions can't be used
> to simplify things.
>=20
> I really dislike requiring the both a simpler extension *and*
> the others that it represents/implies.

They generally have been done they way you'd expect, this one just
differs because b is being added much later on rather than at the same
time.

--1e9YdYuLH+dKIj17
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaVQmOwAKCRB4tDGHoIJi
0kGhAQCxAzMhUD4RufMSgiCXLmxQYYsaVF6keAz3iTra6Co1VAD9El+gIhJwMplP
Ub7eTbrTxBVP7WgRNQQWd1iA4ooCQwg=
=uC2U
-----END PGP SIGNATURE-----

--1e9YdYuLH+dKIj17--


--===============0175011529278333766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0175011529278333766==--

