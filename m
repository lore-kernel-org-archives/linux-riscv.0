Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE50D0EE13
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 19:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AV5vQEt4VkO78QiGHqO9m/C2VO80j1O/wcECkGeV9E=; b=W9b2xHfGFsErncAWRscsU7W5bW
	VqkIYOVoShtiHNkFyC6XtyvJ/Y15bmzlFFb4saUu8gChU3Ph0XdVOiq4ECiDH6oAl2JejVZsOjtfz
	1neUwh1K3q/mY+iGXzYPOvU6LfZlyDlOG8Amp2iQGwan1Xw0sudWt6LyZMLYiOOZ5InaxrubMYNcv
	3J/+uNcOuYu4NRMzDbjP8mrJojZ8U/pnR88qbBwaVZQmvGYlnRhuyflP5HSdCnbjCdbYkp2WMnuqR
	OQwoW0meeira8+bOc5Jl53MjvR7k1NT6rWDsMe3Bgw/mq4MBnUcQCEXhakgZgLcG5STMk67Ojyk5y
	cJOS1N9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNyUN-0000000DoFl-3WYo;
	Tue, 25 Nov 2025 19:14:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNyUM-0000000DoFW-3yhw
	for linux-riscv@lists.infradead.org;
	Tue, 25 Nov 2025 19:14:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 11FBD60133;
	Tue, 25 Nov 2025 19:14:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC2C2C116B1;
	Tue, 25 Nov 2025 19:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764098049;
	bh=9YyxCftvyPpNqO/zThdyq9ELQ/bGk2MOT5444oriALA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n2sBjc92dFvvPUgZI/0U/1Hz+lghtF6AxW0U/tsgEUcYqIzJDGL3VtABJmqo6qpiU
	 vTER+dnCVeREKbDUoq9oCE7qABlMYm0ldShIbZJM1R/4U43Eqez5fzcdDpAcg+vtKd
	 93HgsUlQVplInfBuz1H1rwjo+KNgFx6+uyunnatJuHAIw8mucxEeUJpXRku+BPF4mf
	 NGapG36PdOWX6+wJS9ycHstRG35CHDyJl44gRl9bNsmyY99eNXqNwbWKRfXGel4dlm
	 gfYNirE5cWtRqFUGNJSU/i4SD2GAozo2WSr5sojMi9AI5sPM3cOczGmSNZRXZB5aGK
	 lo/MMOgEFqFOQ==
Date: Tue, 25 Nov 2025 19:14:04 +0000
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Subject: Re: [PATCH v3 1/2] dt-bindings: riscv: starfive: add
 xunlong,orangepi-rv
Message-ID: <20251125-borrowing-arming-9c256497af8f@spud>
References: <20251123225059.49665-1-e@freeshell.de>
 <20251123225059.49665-2-e@freeshell.de>
 <20251124-free-bandicoot-of-skill-fa7d9a@kuoka>
 <20251124-state-campsite-3e7788a495c1@spud>
 <0e851ca0-1f56-437d-ae14-094c114d3b77@freeshell.de>
 <dc48fa76-0a08-4c9d-a3d7-724eb255aff8@kernel.org>
 <ff1f0e6b95150896136ab31ce13e0a2c7a3a5fe3.camel@icenowy.me>
 <489e9d44-fac6-4aa8-b094-ef20196e392b@kernel.org>
 <0a2104faee332ee143b5499c18aea3625971156c.camel@icenowy.me>
 <fb9ca9fd-1591-4e43-b055-b6ea8d55a42a@freeshell.de>
MIME-Version: 1.0
In-Reply-To: <fb9ca9fd-1591-4e43-b055-b6ea8d55a42a@freeshell.de>
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
Cc: linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, Drew Fustini <drew@beagleboard.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Michael Zhu <michael.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>
Content-Type: multipart/mixed; boundary="===============1681877695564632721=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1681877695564632721==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="70y7hwIBPKmbUhHP"
Content-Disposition: inline


--70y7hwIBPKmbUhHP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 05:07:00AM -0800, E Shattow wrote:
>=20
>=20
> On 11/25/25 00:01, Icenowy Zheng wrote:
> > =E5=9C=A8 2025-11-25=E6=98=9F=E6=9C=9F=E4=BA=8C=E7=9A=84 08:48 +0100=EF=
=BC=8CKrzysztof Kozlowski=E5=86=99=E9=81=93=EF=BC=9A
> >> On 25/11/2025 08:33, Icenowy Zheng wrote:
> >>> =E5=9C=A8 2025-11-25=E6=98=9F=E6=9C=9F=E4=BA=8C=E7=9A=84 08:28 +0100=
=EF=BC=8CKrzysztof Kozlowski=E5=86=99=E9=81=93=EF=BC=9A
> >>>> On 24/11/2025 22:59, E Shattow wrote:
> >>>>>
> >>>>> On 11/24/25 05:22, Conor Dooley wrote:
> >>>>>> On Mon, Nov 24, 2025 at 08:28:10AM +0100, Krzysztof Kozlowski
> >>>>>> wrote:
> >>>>>>> On Sun, Nov 23, 2025 at 02:50:44PM -0800, E Shattow wrote:
> >>>>>>>> From: Icenowy Zheng <uwu@icenowy.me>
> >>>>>>>>
> >>>>>>>> Add "xunlong,orangepi-rv" as a StarFive JH7110 SoC-based
> >>>>>>>> board.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> >>>>>>>> Signed-off-by: E Shattow <e@freeshell.de>
> >>>>>>>
> >>>>>>> <form letter>
> >>>>>>> This is a friendly reminder during the review process.
> >>>>>>>
> >>>>>>> It looks like you received a tag and forgot to add it.
> >>>>>>
> >>>>>> It's from me, don't resubmit just to add it since it'll be me
> >>>>>> applying
> >>>>>> anyway.
> >>>>>>
> >>>>>
> >>>>> Hi Conor,
> >>>>>
> >>>>> Okay. Yes I'd dropped the tag since the commit message is
> >>>>> appreciably
> >>>>> different, and you would be handling it again anyways. Thanks!
> >>>>> And
> >>>>> thank
> >>>>> you Krzysztof for the reminder -E
> >>>>
> >>>>
> >>>> And where did you explain that you dropped the tag because of
> >>>> that?
> >>>> Please read the form letter carefully.
> >>>
> >>> Well I think there's no clear definition of "the patch has changed
> >>> substantially" here.
> >>>
> >>> E may think for this such-short patch, the commit message weighs a
> >>> lot
> >>> and the change to it is significant to the patch (e.g. making the
> >>> patch
> >>> not clear enough).
> >>
> >> You still did not bother to read what we expect. I do not discuss if
> >> this changed significantly or not, although it is obvious that it did
> >> not change and tag should have been retained.
> >>
> >> Look again:
> >> <QUOTE>
> >> Please read:
> >> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/proces=
s/submitting-patches.rst#L577
> >>
> >> If a tag was not added on purpose, please state why and what changed.
> >> </QUOTE>
> >>
> >> Where did you explain that?
> >=20
> > Sure, I agree that explaination of this should be delivered.
> >=20
> >>
> >>
> >> Best regards,
> >> Krzysztof
> >=20
>=20
> Krzysztof,
>=20
> The submitting-patches document does not support your assertion in this
> situation. I evidently have a different understanding of than you, as
> when I read it before sending the series I did arrive at the action of:
>=20
> 1. Acked-by is less formal and so it is a matter of opinion and
> judgement whether to retain it or not. I choose not to here due to
> changes visible in the commit log (the commit messages and titles). I
> would let Conor decide if they will acknowledge the revised series
> instead of making that decision for them.

If anything, acked-by being "less formal" would mean that it's more
resistant to chances in the patch.

> 2. I am not required to mention the drop of any Acked-by tag in the
> cover letter for this situation. Conor is handling this series so I do
> need to participate on the mailing list when there's a question or
> comment about picking up the lack of Acked-by.

If I were you, I would pretty much always mention the reason for
dropping tags unless the changelog or cover letter contains some pretty
drastic changes between versions thereby making it really obvious why
the tags are gone.

--70y7hwIBPKmbUhHP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSX//AAKCRB4tDGHoIJi
0itWAP4liiNjiJ+0fpF83sw6dcznvAKjeJUH0cyzATI3hQeTjwD+IoEOlLMs4aoR
6c19DoYnPnMiAFJAjV3jf16Tenw3mQE=
=WIRP
-----END PGP SIGNATURE-----

--70y7hwIBPKmbUhHP--


--===============1681877695564632721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1681877695564632721==--

