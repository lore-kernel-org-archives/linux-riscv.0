Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDE8C001DB
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 14:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yv0+Qs+f/kwvbbm12Gq4syDNQGhdPD/jRWy8TJ3p5ec=; b=pa9IJAbyT2U3F6kdlf/nIpkD3G
	dKhjOWIJQHUm9fmHMDgKVK3YNQ8eJ8RlRYymse66xlMB0W3omZoR+qsJE9vnfC73GEh+oOv5mCI5I
	MrIm1V4ywXibydNW/fnMuOxaDWLZksL+wf5AJ/RInHEzM/s2Hjnmgg7aYVBtuNJrvOppvKfVp9IKH
	tsXyCCwWrspD4qvkgUMfqFC1tsv6sBL90EGDyDftyG64E0VQTMOOLGi8XgwzPvGJj2okJHnNxgy3I
	fn8D3g6AKFHaRa48oFKotzN9GG52VQIDVA8F17GI9uwxNoioTlPYQqLDRhObvuacTLBGhVzuc4aYw
	UFGOXbFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTNkw-002l04-1q;
	Tue, 08 Aug 2023 14:32:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTNkt-002kzB-0r;
	Tue, 08 Aug 2023 14:32:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BE0E76259E;
	Tue,  8 Aug 2023 14:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5741BC433C7;
	Tue,  8 Aug 2023 14:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691505134;
	bh=MH6d9daFOxOoUw3EqmWMlFDO8lTspBrOmvGmg5d/GCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kicd1tuwLvqYGEBRTc+2ND/MElHfgmvgUIKu3m+om1pjy3kY6ZqlebNr8qgKCgVn8
	 DmlCKah98VHQjUuZdrBp7T5pXTRmw3Ourhp5kWvmKcBYMVo7VajksjhevF2ZTwvu4n
	 m57apNrM2w50viLchtbUFC0gl/yhib9TqJfr2SxOlit2SA1460rgCNo2UXh1UvMHBK
	 mf5XCu7uyuLXmg/IxQ3//algUxmj8dCVUvtp986iEq/nDYUp+ULtryf6c8/txD4oGq
	 RLkKGL4+3fo/0Keos+ZgbMOHt1ZjAoTebXafCiKrDwa1wQjLh1N33R0URvrPlZ8HyA
	 9hmBgKpTIpfcA==
Date: Tue, 8 Aug 2023 15:32:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH v3] riscv: dts: allwinner: d1: Add CAN controller nodes
Message-ID: <20230808-swerve-tartly-07140c59539e@spud>
References: <20230807191952.2019208-1-contact@jookia.org>
 <49ce2d9c-eb38-4ceb-bae1-0409df876e9b@web.de>
MIME-Version: 1.0
In-Reply-To: <49ce2d9c-eb38-4ceb-bae1-0409df876e9b@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_073215_355229_F9C4CEA1 
X-CRM114-Status: GOOD (  12.56  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, Palmer Dabbelt <palmer@dabbelt.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, John Watts <contact@jookia.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============3109744596282305988=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3109744596282305988==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xR/RJpD/V1xuh2KJ"
Content-Disposition: inline


--xR/RJpD/V1xuh2KJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 08, 2023 at 04:26:17PM +0200, Markus Elfring wrote:
> =E2=80=A6
> > Both of these fully support both CAN controllers.
>=20
> Please choose a corresponding imperative change suggestion.
>=20
> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv6.5-rc5#n94
>=20
>=20
> > Signed-off-by: John Watts <contact@jookia.org>
>=20
> I find the local-part of this email address suspicious according to the D=
eveloper's Certificate of Origin.
> Should it usually indicate an unique person instead of the shown key word?

Markus, please stop bothering developers with nuisance comments.

--xR/RJpD/V1xuh2KJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNJR5wAKCRB4tDGHoIJi
0tSMAQDUmixeOBSRBjyu3meJePjabfeS/tTiPYOosilEuZo+6gD/f+9hlaAzN9Mi
MaLnFLcKtF/WoYl6X7YRywa0eX7w2Ac=
=+rRS
-----END PGP SIGNATURE-----

--xR/RJpD/V1xuh2KJ--


--===============3109744596282305988==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3109744596282305988==--

