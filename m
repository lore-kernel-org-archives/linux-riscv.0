Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0745C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 20:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyTyG/4E9sT3+Da0cuRIXhvmf75WZDtsNkvxQ8QpqvI=; b=SVAnBPTn+541UiIPBu6oVJbr+h
	LB7Liu7IfOrEH/4KAaThFWVkS+KtbyBPWWVhRsblovcVMZDwwGkePv8WWf5rvfyivePUlhobSOOb4
	1wKlCPFNuyQLObMejkEW74gTtQzBT5ynAWtug1jUe3NUJiv0LtbfIcQKUTTak7vPOuQoUs4p3Yx/y
	zgGBa+fd3wPscFej4eLdSxGdZ4aY6mWpKDKldiP7PIAY1W+qnvcI7CC7zwjvb0YrmJeWhoY3EB9/d
	ztRiT54D9LEuOmacowT5YfjXtUFSomm9/X46F4C98S4pY6y97kgpzwMVcv+oJRG5H8nP9mVQZCOUy
	dF8jg29Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2dNP-00Eee4-0s;
	Mon, 13 Nov 2023 20:17:43 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2dNM-00EedO-1f
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 20:17:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7F940B8100C;
	Mon, 13 Nov 2023 20:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32326C433C8;
	Mon, 13 Nov 2023 20:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699906657;
	bh=SwYHSTS3rTDa7Clubx8Dvf8G10g50QTr2Ibg/KW4oWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WEVjZcuRKwNGSQo9Z6hggcHjls2BO5bwob2sN4A61qPt1Uh6cI04CVwi9R2lNafsk
	 xPKVEfsNctoAo553B7Xq6hoXvJFPysMDNE78i1wBmptzl6gqTGF5BgB0N28fEzY1aK
	 st537PkxXo0+tfaXS9L3+rfGrv5TIvO1ysTsQjMGfxC+Zt/mxpI/56hN+xtKlrezi8
	 e4PO3k//uYLFRfXmK8+nPg2pCeTZeLHCYVSS/oA04kREcTwxfn/FHl1IxxIEQh3ZXk
	 x74FxaEUvqhxZAVD1rKJkcBXFuibj9IRyz3Tf9ouXuS/KIM2exjrISpl9x0hTn9VlI
	 E8nyjOsK4wQDg==
Date: Mon, 13 Nov 2023 20:17:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-pwm@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Hal Feng <hal.feng@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v7 1/4] dt-bindings: pwm: Add OpenCores PWM module
Message-ID: <20231113-sprung-tantrum-94659009b9d4@squawk>
References: <20231110062039.103339-1-william.qiu@starfivetech.com>
 <20231110062039.103339-2-william.qiu@starfivetech.com>
 <afce202d-6234-4c5f-9018-facd9a56b5eb@linaro.org>
 <f4551a7a-61e6-4d97-94c2-da2e4e9e8cb3@starfivetech.com>
 <824cee7b-e4d3-461a-8bfb-4ad095c240fd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <824cee7b-e4d3-461a-8bfb-4ad095c240fd@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_121740_863278_4ADEEAC9 
X-CRM114-Status: GOOD (  16.70  )
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
Content-Type: multipart/mixed; boundary="===============1577190156725224525=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1577190156725224525==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+lpp7srQCeLErYm2"
Content-Disposition: inline


--+lpp7srQCeLErYm2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 09:07:15PM +0100, Krzysztof Kozlowski wrote:
> On 13/11/2023 10:42, William Qiu wrote:
> > Will update.
> >>> +
> >>> +allOf:
> >>> +  - $ref: pwm.yaml#
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    oneOf:
> >>> +      - items:
> >>> +          - enum:
> >>> +              - starfive,jh7100-pwm
> >>> +              - starfive,jh7110-pwm
> >>> +          - const: opencores,pwm
> >>
> >> That's a very, very generic compatible. Are you sure, 100% sure, that
> >> all designs from OpenCores from now till next 100 years will be 100%
> >> compatible?
> >>
> > My description is not accurate enough, this is OpenCores PTC IP, and PWM
> > is one of those modes, so it might be better to replace compatible with
> > "opencores, ptc-pwm"
> >=20
> > What do you think?
>=20
> Sorry, maybe this answers maybe doesn't. What is "PTC"?

"pwm timer counter". AFAIU, the IP can be configured to provide all 3.
I think that William pointed out on an earlier revision that they have
only implemented the pwm on their hardware.
I don't think putting in "ptc" is a sufficient differentiator though, as
clearly there could be several different versions of "ptc-pwm" that have
the same concern about "all designs from OpenCores for now till the next
100 years" being compatible.

Cheers.
Conor.

--+lpp7srQCeLErYm2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVKEWgAKCRB4tDGHoIJi
0lg6AQDoetFH+2Q0R2VopRs52W7OWITEOpAFd04nMYVyHdsONgD+LawAuiiSLaEB
0ECkKGOudEZJ6nR1cZ/Vt+FGfB1MyAs=
=sVnT
-----END PGP SIGNATURE-----

--+lpp7srQCeLErYm2--


--===============1577190156725224525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1577190156725224525==--

