Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBA2D68BC9
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 00:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ecFjKFRHAWiRqVXCubqjqEN1LzsdGg2ruk2tjsr97ro=; b=IAJ7w4eC89Qoh/q7JByreB77lz
	mwt2EpgxS0vNQWI3Soz55C15+uIs4iLJs91nQd6sD1DkW9ZPnOcFF5X8UFqMd3li+M+ndL0vWF39h
	axhnOpGTau4mELho9u91zY/rRm9Tt08UMPDxAoTX/apXW2eGjiwrp/hxdWgYJnJx01snvBqxmpyH4
	ZwwAYODAB9einlbyN8mmp4nyNElxJv/mNSl8rcSjYWaO31oevn15TalVZxchlZqgaJXobU6ILpomB
	RLETmpX59+wrVfBa0mfle5iUpZiJACyMTETPSOeqH5oTE6bAdSesNHo+evYgerKnmELIV5NNKHjUr
	uVPxXeCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW2K2-00000007d3x-0UA8;
	Thu, 18 Dec 2025 00:56:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW2K0-00000007d3a-2DlB
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 00:56:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4CAA843A4E;
	Thu, 18 Dec 2025 00:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82BDBC4CEF5;
	Thu, 18 Dec 2025 00:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766019407;
	bh=czY9Sg+ZSc2N2YE8/B4cFKlElc2FQdkFTzwudxE1otI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LwdgXbeepYIRgtYqXKfF8dOGLwjuiOW/GhDBYtui5LtESSDqgSyxnOc5Ye1R2lDF/
	 o35uXTvJDjvNrg9t+gl1w8jQqzHdWu4EJ86aqem8AxI8vNFaB408hkAA+APshO9xS5
	 noBGt6iaR4KrK800Z22nZrKCdaz1bighCM6ZT1mCKXmQl0HhW9sz+YVBzJXtNKs6DY
	 Ym8UTx+fjZBVfyqqrE40Cggk8gb12R9VeuRTXsiCisLZXzoAsDPpihNd37g5nSGuiq
	 X2sq1v7a1GsH8C6Lzpba4R2Rppm+S7uqN4qYs06eT7KSP3pNyh2oCGGJxa911LrnUd
	 9163xbnjQ6SDw==
Date: Thu, 18 Dec 2025 00:56:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Guodong Xu <guodong@riscstar.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
	linux-serial@vger.kernel.org, Rob Herring <robh@kernel.org>,
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
	Yangyu Chen <cyy@cyyself.name>
Subject: Re: [PATCH 7/8] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
Message-ID: <20251218-basil-quantum-225ce16e4699@spud>
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-7-a0d256c9dc92@riscstar.com>
 <60948ca2-ed3d-485b-9b11-15df7ef8791d@canonical.com>
 <CAH1PCMb=+TvB1w+G6a2ANDp05HUwC4r6CFBDHXFwSmoP3Mm8xw@mail.gmail.com>
 <f9b6b5e2-ec9e-4208-8267-77020e0a9411@canonical.com>
MIME-Version: 1.0
In-Reply-To: <f9b6b5e2-ec9e-4208-8267-77020e0a9411@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_165648_592816_9ECCA205 
X-CRM114-Status: GOOD (  14.08  )
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
Content-Type: multipart/mixed; boundary="===============4302177141277897455=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4302177141277897455==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YFkdgQHnjYXqwI/e"
Content-Disposition: inline


--YFkdgQHnjYXqwI/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 09:07:14AM +0100, Heinrich Schuchardt wrote:
> On 12/17/25 08:11, Guodong Xu wrote:

> > Specifically, I must adhere to
> > Documentation/devicetree/bindings/riscv/extensions.yaml (and cpus.yaml =
for
> > properties like 'riscv,sv39' which stands for the extension Sv39). If I
> > add extension strings that are not yet defined in these schemas, such as
> > supm, running 'make dtbs_check W=3D3' fails with: 'supm' is not one of
> > ['i', 'm', 'a', ...], followed by "Unevaluated properties are not allow=
ed."
>=20
> If Documentation/devicetree/bindings/riscv/extensions.yaml is incomplete
> with respect to ratified extensions, I guess the right approach is to ame=
nd
> it and not to curtail the CPU description.

Absolutely. If the cpu supports something that is not documented, then
please document it rather than omit from the devicetree.

--YFkdgQHnjYXqwI/e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUNRRwAKCRB4tDGHoIJi
0gf2AP9Ah7Huy/7R/LqU1VTWwMbhQ8V/6Rgj7cDeXHtSYrlVewD7BBA6UzEp4aPh
lCEBxyTGjP6CciQj2IG9BLkKRj66nwk=
=HlHn
-----END PGP SIGNATURE-----

--YFkdgQHnjYXqwI/e--


--===============4302177141277897455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4302177141277897455==--

