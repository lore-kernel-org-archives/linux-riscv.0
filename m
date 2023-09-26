Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7B0E7E621
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 11:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZZWnycxTCjzkTw70iubPbeSGSsXRQ2NH1uxAj2n1rM=; b=u2Zujvwcam0iDKr8GvcImpbz2l
	re1kBVXLMGtO6ddu2PTdNzSXnJmauCKxqN5EhfsCJXr34+ZyIMq4v2SzF0Jep9oabF1kXc+KefRa5
	R4NWsxnVv9cZdcS5wFsYSuX4njps/XFtLO8lTR7LwUmyVUvv5xMHYYJ6kA6ACTQznVSTIjLCtTzCU
	KnWA+XrsK8vB6D1yD/PrktOd0HMnhcQ+d2Wb12zeE3DAMJp/Av6BxlUKvK0KJKlf1LQyQNQlcRkUY
	E8jZQ7UN9g331Z35769IekdJKHHSx6f53W+uM3o6NNytgYoTY0xgtGAG6GkhMPl/6G7b8iqsE2wGh
	XwU0z+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql675-00GFLp-1R;
	Tue, 26 Sep 2023 11:20:23 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql671-00GFLK-1p
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 11:20:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 25896CE1288;
	Tue, 26 Sep 2023 11:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5948BC433C7;
	Tue, 26 Sep 2023 11:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695727214;
	bh=KLnmaGQ/nGnn5HVd4+w/PzRxL9sDX4hl2a5HTd5I3eM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GLKRjFFdc4gD7lH8b9vTMi19G1IqU3n9tcox/lHYwpcliiCjFjwN2dXbNeWNSJ6b3
	 UoMQIV60ngQFyV6+g9fsWDb8xvxu/tmCGgwHPKocmc46P3QY2iyBEA/omHnWS6oiZE
	 GjTXHeOYh2KbwjevtCyR30Kkkuv0MLtbGi1jZMpCA1ZPKlUydTnI0h761iZilXYNlN
	 hSsJRLkyJNyMp9UHwaoc1xVD6MVteeXUuYZrdfqaZ6bAa+ZRl/DjT0yrhOvo12Y5M5
	 Lh5IxP1VblszExht7dU/U9mxfPsxuy8Mkq8xRmtryLYhgVj4oFdWjFlS6Lkz6sK2l4
	 12gUKcCpFSkYw==
Date: Tue, 26 Sep 2023 12:20:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: changhuang.liang@starfivetech.com, ulf.hansson@linaro.org,
	Conor Dooley <conor.dooley@microchip.com>, arnd@arndb.de,
	jiajie.ho@starfivetech.com, linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org, robh@kernel.org,
	walker.chen@starfivetech.com
Subject: Re: [GIT PULL 2/5] dt-bindings: power: Add power-domain header for
 JH7110
Message-ID: <20230926-trio-sweat-9b878df53209@spud>
References: <20230913-bloomers-scorebook-fb45e0a2aa19@spud>
 <20230913-grumbly-rewrite-34c85539f2ed@spud>
 <CAMuHMdXmNCXvFj8gF0COQrvhbRuugrJN0sM_DL1vDE=4EU0bEA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXmNCXvFj8gF0COQrvhbRuugrJN0sM_DL1vDE=4EU0bEA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_042020_042332_22CE2907 
X-CRM114-Status: GOOD (  26.27  )
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
Content-Type: multipart/mixed; boundary="===============1027522858282741696=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1027522858282741696==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v+vIMjR+OVM3y5cd"
Content-Disposition: inline


--v+vIMjR+OVM3y5cd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2023 at 12:55:01PM +0200, Geert Uytterhoeven wrote:
> Hi Conor, Changhuang,
>=20
> On Wed, Sep 13, 2023 at 3:58=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> > From: Changhuang Liang <changhuang.liang@starfivetech.com>
> >
> > Add power-domain header for JH7110 SoC, it can use to operate dphy
> > power.
> >
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Thanks for your patch, which is now commit 41b66b54a72bd796
> ("dt-bindings: power: Add power-domain header for JH7110")
> in pmdomain/next.
>=20
> Conor: looks like you forgot to update the patch description, as promised=
 in
> https://lore.kernel.org/all/20230519-irk-dwelled-6a499c482e62@spud?

*sigh*, that's what happens when you apply the patches several months
after they were sent I guess. I'll try to make sure that that doesn't
happen again.

> > --- a/include/dt-bindings/power/starfive,jh7110-pmu.h
> > +++ b/include/dt-bindings/power/starfive,jh7110-pmu.h
> > @@ -1,6 +1,6 @@
> >  /* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> >  /*
> > - * Copyright (C) 2022 StarFive Technology Co., Ltd.
> > + * Copyright (C) 2022-2023 StarFive Technology Co., Ltd.
> >   * Author: Walker Chen <walker.chen@starfivetech.com>
> >   */
> >  #ifndef __DT_BINDINGS_POWER_JH7110_POWER_H__
> > @@ -14,4 +14,7 @@
> >  #define JH7110_PD_ISP          5
> >  #define JH7110_PD_VENC         6
> >
> > +#define JH7110_PD_DPHY_TX      0
> > +#define JH7110_PD_DPHY_RX      1
>=20
> These values are conflicting with similarly-named values above:
>=20
>     #define JH7110_PD_SYSTOP        0
>     #define JH7110_PD_CPU           1
>=20
> Upon closer look, and diving into the driver, this header file contains
> definitions for two separate number spaces: the first set is meant
> to be used in PM Domain specifiers referring to a node compatible
> with "starfive,jh7110-pmu", while the second set is meant to be
> used in PM Domain specifiers referring to a node compatible with
> "starfive,jh7110-aon-syscon".

Yeah, apologies for the confusion there. I maybe should have
requested an additional file, since the relevant compatibles
are different.

> I think it would be nice to have this reflected in the names of
> the defines (e.g. JH7110_PD_AON_DPHY_TX), and/or to add comments
> clearly delimiting the two separate number spaces, and explaining
> where they apply to.

Since this is 6.7 material, there's still plenty of time remaining to
make either of these changes. Changhuang Liang, do you think you would
be able to send a patch implementing either of the suggestions made by
Geert?

Thanks,
Conor.


--v+vIMjR+OVM3y5cd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRK+aQAKCRB4tDGHoIJi
0qdRAQCgkg2gvIyCQlhu9Kgi4WoUf3foxwC7G5VBz36iX0smcAEA+weWLhamLKuF
n2hwivXCDX0fFopjfXLuKFF81bzVpwg=
=5+xG
-----END PGP SIGNATURE-----

--v+vIMjR+OVM3y5cd--


--===============1027522858282741696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1027522858282741696==--

