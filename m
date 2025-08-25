Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5087CA0EFA
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 17:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Flly/h7q7D0zG+gJeHi1wApoRAMSmMYDTtYc+mjexJs=; b=rVYv5SNlVOtKAFFWYHche3Wy72
	7cBAXZ/5Qqi0hFEXXdxtnvK9OMFuLzLkM4eoqyHaiGguAiGTVim07O3s4Pmq1fx+QE8/uIB6Q4WK6
	x+HkJIzkPkwnX0gGaHIbbmxV1fXvOxn9u2AtWQp1WlSU++hl1ftjxsrF7E4cgkivZZC4bCNDcdNUM
	hO8gnRlENqF5X+GztZ7JwpXyNJPwsGscExisRDCiuDfWyPH9+S8USiMLhDMPkNEkDIhM2vIZYASep
	B1lXxSKrCnhfOlkU4gyA4mtcVanFhLs40d/DvuQHwMdjTMVWMpS8OGuoMkqncBeZYQ+5Mq26XJjt8
	5ffqYNJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqapb-00000008oCA-0PJC;
	Mon, 25 Aug 2025 17:18:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqa1A-00000008eoQ-2N8c
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 16:26:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AEED46023B;
	Mon, 25 Aug 2025 16:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E43AC4CEED;
	Mon, 25 Aug 2025 16:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756139159;
	bh=J2gyzcKTE9GWvybDM3VRwRpqKIbNxUNphgPALDmkhfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=My3XKBs3+VVGigaoBXzAeoDS0/NPwxsVCWrVRF3m6R74kwo1y6l+1LH6Yff58avBS
	 Ywq9sGjcUaZOcAH1NZ7fwinfnW2lDrmKdHdEOHIz2bWXUZBZa7LJ82KTLATdQwG8aT
	 Bw+bkBbEG6cOs0WmPZLyvW/o/RDH7xbicdQfcL9EuRqF35FeGkX1ZP74QPyadM7x9t
	 2cImsZ2PbXfitV5+OOoenb06Ilz2WkbQICp/yqmXEJGh2bZvrywtTOBFe1h2LYB1pG
	 uBOnjj2g4QfTHS70weAlJTRZ+zQ+UC9RRewqihlj89RiNn602HB7seyKF9o/jVAhZd
	 LwBgGzfPGWnAA==
Date: Mon, 25 Aug 2025 17:25:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: E Shattow <e@freeshell.de>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Minda Chen <minda.chen@starfivetech.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: memory-controllers: add StarFive
 JH7110 SoC DMC
Message-ID: <20250825-deniable-quizzical-1d829756fff4@spud>
References: <20250823100159.203925-1-e@freeshell.de>
 <20250823100159.203925-2-e@freeshell.de>
 <20250824-new-messy-raccoon-1c26b7@kuoka>
MIME-Version: 1.0
In-Reply-To: <20250824-new-messy-raccoon-1c26b7@kuoka>
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
Content-Type: multipart/mixed; boundary="===============0160127825670445322=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0160127825670445322==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XpSz1rGszf+u1S0O"
Content-Disposition: inline


--XpSz1rGszf+u1S0O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 24, 2025 at 11:25:08AM +0200, Krzysztof Kozlowski wrote:
> On Sat, Aug 23, 2025 at 03:01:41AM -0700, E Shattow wrote:
> > Describe JH7110 SoC DDR external memory interface.
> >=20
> > Signed-off-by: E Shattow <e@freeshell.de>
> > ---
> >  .../starfive,jh7110-dmc.yaml                  | 74 +++++++++++++++++++
> >  1 file changed, 74 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/memory-controller=
s/starfive,jh7110-dmc.yaml
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> There is no memory controllers driver change, so I am fine if this goes
> via SoC/DTS tree.  If you want me to pick it up, please ping on IRC.

That's cool, I will take it with the dts changes. Thanks.

--XpSz1rGszf+u1S0O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKyOkwAKCRB4tDGHoIJi
0mVlAQDjFslnNMpDhJCuj60iIG8Y0qWw3himg2L42FsoPtlY8AEAwZ3JJLRx5z9H
v+mhaUKVytggyS5On5DkHtM7QaQe6Ao=
=Ff6V
-----END PGP SIGNATURE-----

--XpSz1rGszf+u1S0O--


--===============0160127825670445322==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0160127825670445322==--

