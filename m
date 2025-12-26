Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563ECE8FDA2
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Dec 2025 15:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6w0s50xvKo5LUDhw/LiA8YLcmK7e8Os2V8kaUWh+eSs=; b=xZaC+kQb93oLK5RqEu5qiqMj5M
	GapcapcCNuxrXXvxQq0LvpHIGiZhwuey5Qnm68B96otNte9RPRP9U6Nez3WG6eIYV6XvFGxi1U2I9
	r6jNRfIGk6gTYy8A94iM1DBn1OZas2gBOzfSAUILrRBtMTAh4Tcs08wT2Yslw6FVp5B4y3Kao2hrb
	sQiB0RoRpjP8Uc48AKMmkmzOq5mjYUy9YBbfRr3JIJeBKtNMxWxWZFxmheEeCdYAdHqUvCp5Ajxtp
	eES05cUeRX1ZXZkyh1Zafz8ne2/dZvrPcaItxd8vRDhXFLsgAXLEv6vDOIOPGGOksEv0hMRrF69ZM
	8j925i5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ9m6-00000001HFi-2Kfz;
	Fri, 26 Dec 2025 15:30:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ9m5-00000001HFX-1Fph
	for linux-riscv@lists.infradead.org;
	Fri, 26 Dec 2025 15:30:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF68A6000A;
	Fri, 26 Dec 2025 15:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60CA9C116D0;
	Fri, 26 Dec 2025 15:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766763039;
	bh=RyZbK7uJYOhWI9dcoiLP7LXlTwKZf+N6eHUD0tVmLKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XOKc67KonQASLOJpRT1C3yITZWldDUqMnULeHL/+Zis5ZOxt6X7dmWNnfH0CJRoM5
	 p7NZMcsfOgVhMWxFg2zP2WSGuqHexkWDU9TkD7LWH9XMNZcZ9HOghiitLvJdLEzwQg
	 ztzDYeUwO9no08M8NQbDm8FFQfWek52GIjynfJhPmVPgIPUL30G07Iegpi7fb+vHh4
	 AJdlruOhI6dDtRMucpxsFYZqT3znNCrpVajLSOrRAwGsspOCeTl98sYgGBgmkoxwKo
	 zSNsPzt8NDnogyGA1cadVgazQMne0cMyUer52NhvtJfWOFrkWyn7L4FmRNfR+t8Xhi
	 0AGO6VCnjm99g==
Date: Fri, 26 Dec 2025 15:30:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: Yangyu Chen <cyy@cyyself.name>, linux-riscv@lists.infradead.org,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 10/11] riscv: dts: add initial canmv-k230 and k230-evb
 dts
Message-ID: <20251226-immunity-morale-67aad0a0fda1@spud>
References: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
 <tencent_DF5D7CD182AFDA188E0FB80E314A21038D08@qq.com>
 <aUzjn3XHJTSl3vY9@duge-virtual-machine>
MIME-Version: 1.0
In-Reply-To: <aUzjn3XHJTSl3vY9@duge-virtual-machine>
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
Content-Type: multipart/mixed; boundary="===============6168329551813799338=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6168329551813799338==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pv4dX9VFg9vNdESc"
Content-Disposition: inline


--pv4dX9VFg9vNdESc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 25, 2025 at 03:11:27PM +0800, Jiayu Du wrote:
> On Sat, Mar 23, 2024 at 08:12:22PM +0800, Yangyu Chen wrote:
> ...
> > diff --git a/arch/riscv/boot/dts/canaan/k230.dtsi b/arch/riscv/boot/dts=
/canaan/k230.dtsi
> ...
> > +
> > +	aliases {
> > +		serial0 =3D &uart0;
> > +	};
>=20
> The aliases should be set in the board-level dts file,
> so please consider removing the aliases.
>=20
> ...
> > +
> > +		plic: interrupt-controller@f00000000 {
> > +			compatible =3D "canaan,k230-plic" ,"thead,c900-plic";
> Incorrect comma separation. It should be: "canaan,k230-plic", "thead,c900=
-plic";

If you send a follow-up patch, I'll squash it into my current k230
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=3Dk2=
30-basic

> > +			reg =3D <0xf 0x00000000 0x0 0x04000000>;
> > +			interrupts-extended =3D <&cpu0_intc 11>, <&cpu0_intc 9>;
> > +			interrupt-controller;
> > +			#address-cells =3D <0>;
> > +			#interrupt-cells =3D <2>;
> ...
> > --=20
> > 2.43.0
> >=20
>=20

--pv4dX9VFg9vNdESc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaU6qGQAKCRB4tDGHoIJi
0k6AAP4u0EmWqs7RVpZTsIhPhImspKGTDirwrgX5zDYM35145wEAnxKsxiCGjnRF
5P5BedAwKl8ThZYT4gBz1GaGGbX1jgw=
=E41A
-----END PGP SIGNATURE-----

--pv4dX9VFg9vNdESc--


--===============6168329551813799338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6168329551813799338==--

