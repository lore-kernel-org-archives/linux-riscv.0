Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174C1CD3424
	for <linux-riscv@archiver.kernel.org>; Sun,  3 May 2026 17:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jl+3/xkJx6EBsYThAyJxpMJYS8Wl0ZKwh2cMPFVJNms=; b=o3NPHm1LyOY0mOKin1sYWvXB9X
	HaMOdY4sPw2pr/nsHSg9vtUQQn+6c/oKaEM2pLJl1ju9OwAoDHUuKM+IXP5MMqpSdoWCM2WfOUffo
	/2vWsTpmzBhafWhsAw5A2CgzcW61jc7ndk75taPc31aSo8VR/tXAqV8ol4CtEQxJUTDBJjBMo9Hj7
	R1ZZYOnahxUy7zZG7Jf4ZKDzn/wYzHWPY0emJXfBItfOJ8O6KsaTYDucpvh3025iLuMxGycrahWJU
	j9GE7Dd9ll/GsVuZB3Lt7dSLVhRNjGauigxXkWwjpd4mqKhGKgwGo1jq4QBxhYg3adJ4cyINRkMov
	Mh2UOvQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJb5S-0000000BSZR-0rbP;
	Sun, 03 May 2026 17:58:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJb5Q-0000000BSZA-12xg
	for linux-riscv@lists.infradead.org;
	Sun, 03 May 2026 17:58:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A91660008;
	Sun,  3 May 2026 17:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6E6C2BCB4;
	Sun,  3 May 2026 17:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777831115;
	bh=G4/3gd/o1gO9SZAsmmNBBlFd2V9XHZiz8iCfzpt/auo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jZuZc5UoHtO3Z7zkqNvNSTrmM7JHHjAwtj3X9zUn8I4bIX44Ba8Rj0I7CHp6regZd
	 t9Aj7/2TV5+1BGSgMPyFyNzh/vOsrDi96koHfisBL2ZPfYRPQpDzs+KGUOG6SAzoDm
	 g4q9U59asC8fNpTR4SdezFhjOxbzoYkYbw8T3K7FD1SYQcCpW/QCy6hsvbgKqH6hfN
	 RhsR3XHgm2edqiEramjIYBHaJhnQUV6PqeJgAcdykdd51SF7ViGYTyF+0ZRakO38ss
	 1ljbbhDTMzbzIY95m872bPCuVERl27l4yhoYvwUl9pWBisADdUZosZ9cJOx9gPQTVO
	 Y3Oa8v7lnauPA==
Date: Sun, 3 May 2026 18:58:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dts: spacemit: set console baud rate on bpif3
Message-ID: <20260503-unlucky-tattling-fbe1f81467e4@spud>
References: <20260430-reword-overstep-3be08b7eab25@spud>
 <20260502120102-GKC3266396@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260502120102-GKC3266396@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============3743630002457753827=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3743630002457753827==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F4dPXMhXmlug+BoG"
Content-Disposition: inline


--F4dPXMhXmlug+BoG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 02, 2026 at 12:01:02PM +0000, Yixun Lan wrote:
> Hi Conor,
>=20
> On 19:52 Thu 30 Apr     , Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Because the default console's baud rate is not set, defconfig kernels do
> > not have any serial output on this platform. Set the baud rate to
> > 115200, matching what is used by U-Boot etc on this platform.
> >=20
> > Suggested-by: Vivian Wang <wangruikang@iscas.ac.cn>
> > Fixes: d60d57ab6b2a8 ("riscv: dts: spacemit: add Banana Pi BPI-F3 board=
 device tree")
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > CC: Rob Herring <robh@kernel.org>
> > CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > CC: Conor Dooley <conor+dt@kernel.org>
> > CC: Yixun Lan <dlan@kernel.org>
> > CC: devicetree@vger.kernel.org
> > CC: linux-riscv@lists.infradead.org
> > CC: spacemit@lists.linux.dev
> > CC: linux-kernel@vger.kernel.org
> > ---
> >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 2 +-
>=20
> Looks good to me, but I think the fix should also apply to other boards,
> so do you want to fix other dts? I'd be fine if you keep it to BPI-F3 only

I don't have any other boards, didn't/don't want to make the change
elsewhere where I cannot test it.

>=20
>=20
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/ris=
cv/boot/dts/spacemit/k1-bananapi-f3.dts
> > index 5790d927b93db..333ac8ebf3f51 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > @@ -19,7 +19,7 @@ aliases {
> >  	};
> > =20
> >  	chosen {
> > -		stdout-path =3D "serial0";
> > +		stdout-path =3D "serial0:115200n8";
> >  	};
> > =20
> >  	leds {
> > --=20
> > 2.53.0
> >=20
>=20
> --=20
> Yixun Lan (dlan)

--F4dPXMhXmlug+BoG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafeMxgAKCRB4tDGHoIJi
0mHiAQCbEcDRsIdWUcZDNAPijtOhudJZ91LwkR1CJnv8h/O1fQEA4zoB/HOltfr3
MeH9y2VvOekfgCbRpQJWXkxbdksWgwU=
=6GNj
-----END PGP SIGNATURE-----

--F4dPXMhXmlug+BoG--


--===============3743630002457753827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3743630002457753827==--

