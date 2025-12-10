Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C38AD3C928
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Dec 2025 16:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OaxVel99PgJCE8wDKxI07k2IHX0nQIQ2NrO+ItZEuSw=; b=ySaeZRPAjhIap9cWodjqCrq68L
	jWhOsUbNFyfmqrXQtf/2iT5QWkmSM59zTZhcEkFJKztbxyIFrnnBTBGs0HMvumFADBkV/y+G3+ppy
	TXSZpBW8+Yaw/WSrhdTtwZFO7klIKI0t/Qs9HiiVZL8UZWrVU9+TPkqqQUYwmXBLBB3w3DzY8kvXD
	90f2bhuI6Hmg2SaIjCpEFvoo3LqcO/QpOwwh8RZ1scUY8EcfuKCHjdcn4jrE80YAUS0JD3tJdAnec
	YIlNBFC3JbiZVlwlxgQEilxQA198l4QTi/OzBxW0W5SBLv9z2meL1EOjhzNJHm3KM3xtQ0RErcBlU
	xjzF/IvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTNI4-0000000FewT-0STu;
	Wed, 10 Dec 2025 16:43:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTNI2-0000000Fevv-0TDt
	for linux-riscv@lists.infradead.org;
	Wed, 10 Dec 2025 16:43:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 39B7644361;
	Wed, 10 Dec 2025 16:43:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FEFFC4CEF1;
	Wed, 10 Dec 2025 16:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765385023;
	bh=vX82vHpfuSWdB2Gu15A/XQ203JPU6YTJg2N9kCrjbV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hDWqVryAgEe8uGEOAbB827iUYnBqCyZF8ZgzA2fsbaE8CMs6jzHSXkQjlFH8cP4tB
	 KU4DLLZJ8UhHy6gvsbzsIBUs7hHBP5MK9uX5Juo17CzfMp8LYuXltVxKddfNVhB3zM
	 hxmgKU2sTpZN4FFEGcrbVycC+vhcLa9O1/waqdAjbsnC1/co/pTrS11XbMriMYVB0f
	 WwHIxDCMR60dXsjloJpfd5FqluJGfcuhT7dF07UHBHPSVLg2HEqwoE/p/WVrByVEH8
	 jNzeRgT+p2dtQ9xZ/py8MWSXtlPJAgXq6o+kglkq4EamV4Q30Rn8ZiMNuNZ22XzKGz
	 CVrbRU4TMlUmg==
Date: Wed, 10 Dec 2025 16:43:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: E Shattow <e@freeshell.de>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v1] riscv: dts: starfive: Append starfive,jh7110
 compatible to VisionFive 2 Lite
Message-ID: <20251210-pull-pleading-57c880596510@spud>
References: <20251206204540.112614-1-e@freeshell.de>
 <20251208-jogging-morally-9b787b7ab1b8@spud>
 <a18850ad-b6de-4444-9daf-a4a653f4f9ae@canonical.com>
 <0bb12889-cb28-44e7-b2d6-7ecba6264d1a@freeshell.de>
 <d8fa12cc-7a03-4954-8ea5-1e2edf9a149d@sifive.com>
MIME-Version: 1.0
In-Reply-To: <d8fa12cc-7a03-4954-8ea5-1e2edf9a149d@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_084346_193980_E0315463 
X-CRM114-Status: GOOD (  23.24  )
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
Content-Type: multipart/mixed; boundary="===============7910197426833810039=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7910197426833810039==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zCievs4J+eiCE9vK"
Content-Disposition: inline


--zCievs4J+eiCE9vK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 09, 2025 at 03:18:58PM +0900, Samuel Holland wrote:
> On 2025-12-09 9:53 AM, E Shattow wrote:
> > The unanswered question what I was asking in the code review of StarFiv=
e=20
> > VisionFive 2 Lite series: What is the normal thing to do for compatible=
=20
> > strings of relabeled silicon when there is a suggestion of different=20
> > operational parameters?
> I don't think we are very consistent on this, and some of it depends on h=
ow
> different the binned chips are from each other.

Largely I think the lack of consistency stems from there being relatively
few users of these soc-level compatibles, so there's nothing really gained
=66rom having one in a lot of cases.

> Example 1: Rockchip RK3399 has several bins. RK3399-S and RK3399-T just o=
verride
> the OPPs, but reuse the SoC compatible string without change. On the othe=
r hand
> RK3399pro is a superset of RK3399, but uses a new compatible string witho=
ut a
> fallback.
>=20
> Example 2: Allwinner H616 (https://linux-sunxi.org/H616) has multiple
> bins/packages/die revisions. H313 is a down-binned version of H616, which=
 reuses
> the SoC compatible string without change. H700 is a superset of H616 (sam=
e die,
> more pins), but uses a new compatible string without a fallback.
>=20
> > I can include the (paraphrased) above summary by Heinrich, yes. Although
> > now I doubt whether this is the best approach, when removal of
> > "starfive,jh7110s" compatible is potentially an equally valid fix, or if
> > we're rather considering JH7110 at 1.5GHz maximum to be a superset of
> > itself at 1.25GHz maximum (JH-7110S). Would we want to change all the
> > JH-7110 boards to then have JH-7110S as the least-compatible, if I am
> > understanding that meaning of "superset"? I would like to know what is
> > expected.
>=20
> If starfive,jh7110 is a superset of starfive,jh7110s, yes, it would be va=
lid to
> add starfive,jh7110s as a fallback compatible string in all of the existi=
ng
> board bindings. But this is not very useful, as existing software already=
 looks
> for starfive,jh7110, and you can't replace that without breaking compatib=
ility
> with existing DTs. So the advantage of one compatible string (mostly) cov=
ering
> both SoCs only applies to new software.

Yeah, adding it to the existing stuff provides no real benefit.

--zCievs4J+eiCE9vK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaTmjOQAKCRB4tDGHoIJi
0so3AQD3KkPLV7QxsDVX34aXmDpzy7tqoYbs2VYHfVRVM4Qu0wD+KLORYZ1rE4aP
9WtBk/WpLmKag2G2+OqeLI/H/hzxRAg=
=Gfec
-----END PGP SIGNATURE-----

--zCievs4J+eiCE9vK--


--===============7910197426833810039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7910197426833810039==--

