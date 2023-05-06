Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA60DC77B75
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 14:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5eCUxAc4oWRtHybvH++/uuJcov81NAUjGWguTXJFok8=; b=kQoj6synAE2NI2w1LBXQJB7HnB
	EjAfhgyFFHNj6pqGR+cjLXzS/bGkAUKMlfdJ6OcVb83GlNCEW7x0JufCgXNGZBRBQ1BylxVo0cwF6
	geRrfpgQWx+QNz7TvqlNRBbt+UbZBe/nO/dHbwD4TLXnxkYIN+SsHA6KgEfmqTx8wZb8d1oOzmhMd
	8adYP083PLn1q2fAxdN0+3MIu1Tjb8z7YwWZptf5I2ceBev3jYP28jMFif/xhu3qa6P29+o22b3Vj
	dCyCOpwRwz4guksCmAkk1rpV4MbvKv8uby7AQKOR/21sqO44imnynK2i15I8ATB3npftosPF7d69/
	1fUZxlqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvIXU-00DeoG-1C;
	Sat, 06 May 2023 14:05:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvIXR-00Dehi-1a
	for linux-riscv@lists.infradead.org;
	Sat, 06 May 2023 14:05:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 105A061978;
	Sat,  6 May 2023 14:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB5EC433D2;
	Sat,  6 May 2023 14:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683381918;
	bh=y0WUlgC0WNbDSzHmroKR1xYfLSonnnO8yE7x3BwO8Co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NMu3vWPzkqw2+2Xyps4vtfabZ3xscPVhWaFOYJ3xR/Uv6tRaOhc0UhspeEOi5iC5b
	 esk6lhSRWmC+Dh3UqpDhLQvNAnkhqPinu3hGt2e1YfQxE2VRUyYDAFBOiJuxi8QLMz
	 nxqXzcoqw+Ls9q5OPlkfeXUPnCkBlG/f+wpUfsqzsUgC0sy7ON/b3eY1pl5LVsRviO
	 1P1Hd5IWqR3TO2fk69rCy+okOzcQ5fbBwy01kvnKECoDyI4tTQ8g9rcERRtAOIsJih
	 ferfKXjPSLYJP3csrBHWmUUYJm2VKu6MnwVSs1av5hpoMUsb4sqJq0Kig9mO3feAgv
	 Ej1yfVMbijnXw==
Date: Sat, 6 May 2023 15:05:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Shengyu Qu <wiagn233@outlook.com>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Walker Chen <walker.chen@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [RESEND v2 5/6] soc: starfive: Add JH7110 AON PMU support
Message-ID: <20230506-doorpost-cranberry-59a46968f15e@spud>
References: <20230419035646.43702-1-changhuang.liang@starfivetech.com>
 <20230419035646.43702-6-changhuang.liang@starfivetech.com>
 <TY3P286MB2611D930A36FDC4EA431D77398739@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <TY3P286MB2611D930A36FDC4EA431D77398739@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_070529_598689_71A38DDA 
X-CRM114-Status: GOOD (  10.47  )
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
Content-Type: multipart/mixed; boundary="===============6219925637656576983=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6219925637656576983==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6JSd8vtVYWFfu/f7"
Content-Disposition: inline


--6JSd8vtVYWFfu/f7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 06, 2023 at 09:58:39PM +0800, Shengyu Qu wrote:
> > +static const struct jh71xx_domain_info jh7110_aon_power_domains[] =3D {
> > +	[JH7110_PD_DPHY_TX] =3D {
> > +		.name =3D "DPHY-TX",
> > +		.bit =3D 30,
> > +	},
> > +	[JH7110_PD_DPHY_RX] =3D {
> > +		.name =3D "DPHY-RX",
> > +		.bit =3D 31,
>=20
> Where are JH7110_PD_DPHY_RX and JH7110_PD_DPHY_TX defined?

In the dt-binding header added in 1/6.

Cheers,
Conor.


--6JSd8vtVYWFfu/f7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFZemQAKCRB4tDGHoIJi
0nuqAP9R4qyILj4K9sBrUCVnY6cUY3qlE2a2ZHQIZzt1hlTrkgD+M8Yq641T2EMD
nB2i4m6nEnTrd0ecq0vgyQa3k3i9xAc=
=5hOP
-----END PGP SIGNATURE-----

--6JSd8vtVYWFfu/f7--


--===============6219925637656576983==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6219925637656576983==--

