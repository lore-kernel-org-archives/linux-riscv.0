Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AB8D12696
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Dec 2025 09:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=meIyd8dDccU8XL9hv2QlfVBm6whF4i5gxOiDVdKnuE0=; b=EksSHqAWLqhYGHADT9UDAIwt5e
	C3lyq7inwTrsnFTrDowl0dySTFCGJd+pxDLRt7mctZtTQlTTT69SNPbngzWG2m6ahsWi7doqbKrI/
	g7kRYaKPSSLJOOMTl+37HZndzK4AKCpr6fzA/1l0wAbeLWgxhxt997s9MUU3ITpll9faReVHqjF/S
	AMP0SUKTZ7zf/MwFgT4hy5sgvaHVvBsXtWNusK1+S2yc1AiDMos1WuPf7AFdF/SHcKaHEzhronmGa
	9xfKzlIdGRKWVF45hJzXYqTfdpdXuXi68bPsygXJ/pX+BJSDeA8XhvIKuz4PaJdIM+rdPra+SZWzE
	/CmUKO5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQje7-00000006QuT-3wd9;
	Wed, 03 Dec 2025 09:59:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQje7-00000006QuJ-0kuc
	for linux-riscv@lists.infradead.org;
	Wed, 03 Dec 2025 09:59:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 946B66019C;
	Wed,  3 Dec 2025 09:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CEB7C116B1;
	Wed,  3 Dec 2025 09:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764755978;
	bh=6PyAJ7Eg3clMxeFkKYcFWYPwBDOpc67yNwjsHzUqEDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jg0a5Jw15hTfmxhXB/43MkYtQbAbuvrZ3oGP7F/MgEsT4NlSQ8jmWxHis/Bmtv70F
	 fvqVYrjBzpFLkOg47NdjSd/OePQxNQ89IdiWjIu0/Z2+heTC/rBdv60NtjttJfMuEd
	 LIf8qkebWNtc1Nx5CfQDDVABmXa2O4y6wTxJ3cEg3r/DDUKnqz5Yt/qi7lZBqaLcrJ
	 LJD5g9PXnivpTkcr2/iybdKl7PohB7vloQhgy7J3ql5SSRMGDN1U7cVtH/nOfI0uN/
	 xOcQQlnqJw+4VvdqFFZnGuv+JV+JHHHLhD4aXbkdhU8ykahrPhz/9+USvdWtcTzNpG
	 xmDyzdqU0Z6vw==
Date: Wed, 3 Dec 2025 09:59:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: q691800735@163.com, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: canaan: Add K230 clock provider DTSI
Message-ID: <20251203-glowing-janitor-7220bf3bcadc@spud>
References: <20251203092643.219600-1-q691800735@163.com>
 <935ab772-fc9d-443b-8c8d-f2d17f9259aa@kernel.org>
MIME-Version: 1.0
In-Reply-To: <935ab772-fc9d-443b-8c8d-f2d17f9259aa@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============2109017318701241447=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2109017318701241447==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qb3wmTQxO5Vd90Cz"
Content-Disposition: inline


--Qb3wmTQxO5Vd90Cz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 03, 2025 at 10:50:18AM +0100, Krzysztof Kozlowski wrote:
> On 03/12/2025 10:26, q691800735@163.com wrote:
> > From: jybruceupup <q691800735@163.com>
> >=20
> > Add clock provider DTSI for Kendryte K230 SoC, required for subsystem
> > clock management and boot.
> >=20
> > Signed-off-by: jybruceupup <q691800735@163.com>
> > ---
> >  .../boot/dts/canaan/k230_clock_provider.dtsi  | 2724 +++++++++++++++++
> >  1 file changed, 2724 insertions(+)
> >  create mode 100644 arch/riscv/boot/dts/canaan/k230_clock_provider.dtsi
> >=20
> > diff --git a/arch/riscv/boot/dts/canaan/k230_clock_provider.dtsi b/arch=
/riscv/boot/dts/canaan/k230_clock_provider.dtsi
> > new file mode 100644
> > index 000000000..9d193ca22
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/canaan/k230_clock_provider.dtsi
> > @@ -0,0 +1,2724 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +/*
> > + * Copyright (c) 2023, Canaan Bright Sight Co., Ltd
> > + * Copyright (c) 2025 jybruceupup <q691800735@163.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +&sysctl_boot {
> > +/* osc24m clock */
> > +	osc24m: osc24m {
> > +		#clock-cells		=3D <0>;	/* only one clock output */
> > +		compatible		=3D "fixed-clock";/* It's clock source, no parent */
> > +		clock-frequency		=3D <24000000>;	/* clock freqence is 24MHz */
> > +		clock-accuracy		=3D <0>;	/* software assume clock no jitter/wander.*/
> > +		status				=3D "okay";
> > +		read-only			=3D <0>;
> > +	};
> > +
> > +	/* pll clock */
> > +	pll0: pll0 {
>=20
>=20
> NAK.
>=20
> Not at all Linux style (actually DTS coding style), not used, no benefit
> of any of this.

I don't really understand what jybryceupup is doing here, because there
is someone actually working on a clk driver etc that is in a pretty good
state.

--Qb3wmTQxO5Vd90Cz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaTAKBQAKCRB4tDGHoIJi
0tYaAP4+hSGWXAONngfqJuubpxx6tF0rLWldnj+M0HistGEVwwD9HkUpndb4OF9/
b2heGIhfOB0l3II+tibN53ZkH+l6pgM=
=Q6Oy
-----END PGP SIGNATURE-----

--Qb3wmTQxO5Vd90Cz--


--===============2109017318701241447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2109017318701241447==--

