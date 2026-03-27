Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9805510ED641
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 09:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0LnkZF9c/7fcVnMvipUMHRdypSdbYsC43EtMh0zxwOQ=; b=LGO7EaTDdd/GYVlV6l8gftQ/07
	MGTQ6QBEDXS3zX7xH4mnEgVrMtLaOCkZM7hCQv+Zrk719fCByRg4bsuTb7cedZQY9NTlSDGH66jIT
	s55z5+bViEhyUN7ibgbYWAh0TgZG6tTulXIko+gGoFwtlD5wyYp7BBfHk4ZOZZKU5/IANCC8AuEuG
	xeyVO1cu8vPO9akyUkyjybeAxa5JzHy05ir3hkffEDJL2YcdHtL3ulZR0wpWDCstQko4MLYlC8FVZ
	wAVvWQl+FJ5R9Ll1PfUynsFmJEgDNcEOgdavkx0RhpLvGoZi67G8loxFuZpuGZWSyFId9S8fSXncS
	9ixwRm9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63ki-000000076Y1-2L7o;
	Fri, 27 Mar 2026 09:45:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63kg-000000076XS-23re
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 09:45:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D165A40C30;
	Fri, 27 Mar 2026 09:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A6A7C19423;
	Fri, 27 Mar 2026 09:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774604713;
	bh=bSFcA1xaFxUDcmqgYDyvVstsL1ofyhDCy8ifaE4w2d8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XGBpav1HJZ9DCPV3EvdYAIfqRgOIPHHmCTN20l9o7LjoiKF+t7rlyL58Dgl+uYfy/
	 uJ2hmpP1wdZ5NQ8Pw8QHEMOifzX/bFAczBEBA6sDSmuXDMcm2IIZFUPFa37Rf5dVqc
	 G0nlV87/p2LNXTSHACMZpX1HizW6n+17wYexcWSSKR7hh2SP8ambiMB2TYBFxo7r7u
	 Z5+K+T8yr4XDtjAgXYBg5rNlgo1tnimUTErret+sEXCL0VDF2dP+FpnRI8KcZg21W0
	 47iKC3Ho/Gl6xfjjK6xMOSgTyuj5trOa9YJpY5XJJ00IoieX/pBrmAUCIsFB2Xr+c4
	 ixsqS8m9HEXhQ==
Date: Fri, 27 Mar 2026 09:45:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	E Shattow <e@freeshell.de>, soc@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Ilya Sorochan <k0tran@altlinux.org>
Subject: Re: [GIT PULL] ~RISC-V~Starfive devicetrees fixes for v7.0-rc6
Message-ID: <20260327-tapestry-frightful-de17113da7d3@spud>
References: <20260326-astrology-rephrase-836ec663228b@spud>
 <4dd4ffe6-307a-442b-ae99-50c88d4e5b84@freeshell.de>
 <20260326-viscous-rigor-4beb18f77eec@spud>
 <9ec329b9-144f-4896-a89c-3af0b23e631e@canonical.com>
 <d7eb716d-9b9c-4474-a9ca-d44e96c46fc8@kernel.org>
MIME-Version: 1.0
In-Reply-To: <d7eb716d-9b9c-4474-a9ca-d44e96c46fc8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_024514_593436_CE2E44C8 
X-CRM114-Status: GOOD (  37.44  )
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
Content-Type: multipart/mixed; boundary="===============5727574630958738500=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5727574630958738500==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zKp8myknkVHehXUQ"
Content-Disposition: inline


--zKp8myknkVHehXUQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 09:19:37AM +0100, Krzysztof Kozlowski wrote:
> On 26/03/2026 16:44, Heinrich Schuchardt wrote:
> >>
> >>> I have done an ~80%+ analysis on Ghidra decompilation of the JH-7110
> >>> BootROM, and openly invite anyone that would like to help get this
> >>> effort to 100% is welcome to so that we may publish and refer to this
> >>> for technical competence. I do not object to the community supporting
> >>> this deprecated capability if there is any real documentation not bas=
ed
> >>> on rumors and memes; but no one has offered to do take a moment to do
> >>> this most basic of fact finding. Evidently the StarFive maintainer(s)
> >>> have refused to support this, GPL non-compliance persists and only a
> >>> rough description from Hal has been written to the U-Boot developer m=
ail
> >>> list that does not match my analysis, all while complaining about the
> >>> capability not being supported going forward.
> >>>
> >>> I object to this PR it is NAK from me on the basis of stuffing this in
> >>> sideways without technical justification or review. Also I do object =
to
> >=20
> > Concerning technical justification it is clear:
> >=20
> > Distro images have been supplied with U-Boot on SD-card for years and=
=20
> > the recent work in Linux and U-Boot broke booting them. This needs to b=
e=20
> > fixed.
> >=20
> >>
> >> The technical justification seemed to me to be multiple people saying =
"we
> >> need this added so that u-boot can use the sd-card". The patch has been
> >> on the list for over three weeks at this point, so there was definitely
> >> opportunity to comment on it. I don't think I have been unreasonable
> >> here. If current U-Boot needs it, then I'd still like to have it merge=
d.
> >> If you work pulls through and this becomes no-longer required, then I'd
> >> be happy to take it back out again.
> >>




> >>> "riscv: dts: starfive: Milk-V Mars CM Lite broken-cd" as this goes the
> >>> wrong way around, it does not describe the hardware; if some external
> >>> carrier boards cannot deal with the capability of the Mars CM
> >>> system-on-module having card detect line then that should be dealt wi=
th
> >>> as a dtbo per-carrier board and not be replaced in the dts by a
> >>> broken-cd, although at least we had this discussion and Conor made a
> >>> decision with all the facts and discussion available.
> >>>
> >=20
> > As my patch points out the CD line is broken because it does not confor=
m=20
> > to the standard established by Raspberry.
>=20
> Initial E Shattow answer is not placed under specific commit, so I can
> only guess that it is about "riscv: dts: starfive: Milk-V Mars CM Lite
> broken-cd".

This part is about about that patch, everything else in this chain is
about "riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from
SD-card" that adds a bootph to a shared dtsi.

> The commit touches only DTS, not DTSO, so how can you claim that a DTS
> file change breaks some completely other board (Raspberry)?
>=20
> This DTS file is nowhere included (and should not be).
>=20
> Of course maybe the true question would be why anyone described a hat as
> DTS file...
>=20
> >=20
> > E. we know that by chance you have found a base board that ignores the=
=20
> > standard.
> >=20
> > Your patch 4cce8b2503ab5 made my standard compliant baseboard unusable.=
=20
>=20
> DTS of some board is a final product, so it cannot be applied to a
> baseboard, that's pretty messed DTS tree...

The cm-lite is a rpi compute module compatible device, the base boards
don't have any devices on them in a lot of cases and just provide
physical connectors, so there's no point having a distinct dts for every
baseboard of that type.
https://www.waveshare.com/product/cm4-io-base-a.htm

>=20
> > My patch in the pull request does not stop your board from booting but=
=20
> > re-enables mine.
> >=20
> > Best regards
> >=20
> > Heinrich
>=20
>=20
> Best regards,
> Krzysztof

--zKp8myknkVHehXUQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacZRpQAKCRB4tDGHoIJi
0vozAQCo9tQ//iCvrSScFC3DG5a+aZKVcy8BrKwyJSv0sAWMNAD/SBtHe6dbgU99
POVtL4iNjjxQQ0L6nNYnp5QcRDmv7A8=
=Dyc4
-----END PGP SIGNATURE-----

--zKp8myknkVHehXUQ--


--===============5727574630958738500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5727574630958738500==--

