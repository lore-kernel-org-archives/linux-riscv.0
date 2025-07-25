Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00A8C87FCA
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 18:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+TYklGrkXQBJ0GAsq/0R6qM32IjQ4Rva6JLSyhNjELo=; b=XYXoabd/xYq7TWKsBC4fH48RVT
	vmI2U63749Ee3xyIvQ5h2F8lgDBzuCan05lY/VAEhJJ+Ao/nc0msP4vd+LAM0cJURO0eYQdFomqBo
	3NlW9HHqpTSOuxDD0MiR0N1MhLAIaVpSahjcED4uJoEK93QsFk083YNvmDRIc2a2iQNfU4uz/htUM
	oNZJWnxTpVSsz1HZ1VsVu2y4bHhOrNU0TuUnzh6XllBu3C3JquvxpACUgMVo7jOJG8ySE2s42GT2n
	g36oA+Qeaj6PhAcJad8O9YUfwFq2InfKSwjLKYWdXmCPPLGMTzGZF+Kr6aV2js+7K6hhh0WBNSKdx
	zR2HFfhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufMsh-0000000APFm-2ivx;
	Fri, 25 Jul 2025 18:10:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufMse-0000000APEm-3iFx
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 18:10:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A94015C6B7A;
	Fri, 25 Jul 2025 18:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21D2FC4CEE7;
	Fri, 25 Jul 2025 18:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753467051;
	bh=ri7jZCPA0DuqHqHzf3trIUgc4pLAhXJnKkCs7V2+7sI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IGzw35ga3OQ59CyvGtuk2QLwuybS3IELuNLY9mFhjKQhkAgyeOWTTij5StjKAYitj
	 BQomCsvSUxK+cNQaB0WcAR+HF5rieI6Dj/HzG18FplUyWsnGrMzqlk464c4vkg8anY
	 mTsDmxXfnMT5cBhNL1vEKsnIk8ocVbHd8RdVG8wpkCDluhgVvmBHU/L37KGbIoIGuD
	 2zI4wdHdtO4QBlPZZ0Mq/KNIlhc1+jXqIMU6SED3nvteXGJ+wa6TEaPskzXjaja6Fi
	 cvJGCicMsuEMKT5W9aTRFbyZfqj7/gn+lXJYSCnftpRRFZ1IiusnrGbmScb518FV1C
	 oLLvgnllFaPTQ==
Date: Fri, 25 Jul 2025 19:10:46 +0100
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	William Qiu <william.qiu@starfivetech.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: drop no-sdio
 property from mmc1
Message-ID: <20250725-disorder-graceless-23c95454244d@spud>
References: <20250724075600.239522-1-e@freeshell.de>
 <20250724-equal-limb-2922f240961e@spud>
 <43c5908c-c478-4e00-b1e5-955296e4ec24@freeshell.de>
MIME-Version: 1.0
In-Reply-To: <43c5908c-c478-4e00-b1e5-955296e4ec24@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_111053_008736_9D8E38B2 
X-CRM114-Status: GOOD (  42.60  )
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
Content-Type: multipart/mixed; boundary="===============1505826508399598181=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1505826508399598181==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vFc/GG+76alb8wgR"
Content-Disposition: inline


--vFc/GG+76alb8wgR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 10:13:47PM -0700, E Shattow wrote:
> On 7/24/25 09:51, Conor Dooley wrote:
> > On Thu, Jul 24, 2025 at 12:55:53AM -0700, E Shattow wrote:
> >> Drop no-sdio property avoids a delete-property on variant board dts
> >> having an SDIO wireless module connected to mmc1.
> >=20
> > I'm struggling to understand why this change is correct.
> >=20
> > If there are specific boards that have wireless modules connected
> > instead of using sdcards, how come the no-sdio property isn't moved to =
the
> > the boards that do have sdcard slots?
>=20
> Why is 'no-sdio' property there to begin with...
>=20
> > The property was added for the visionfive 2, and only on mmc1, so should
> > it be retained for boards that match the visionfive 2 in terms of how
> > they use mmc?
>=20
> Ref.:
> https://lore.kernel.org/lkml/20221207131731.1291517-4-william.qiu@starfiv=
etech.com/
>=20
> My theory is VisionFive2 board hardware can support connecting up some
> SDIO module there with ready-made available adapters, it may be possible
> (if unusual) that would work? SDIO is 4-wide and some voltage
> requirements, and a couple of GPIO, so I'm aware that's a stretch of a
> statement but it could be done without soldering. I wouldn't expect it,
> but why restrict this everywhere inheriting from jh7110-common.dtsi with
> 'no-sdio' and then (needs testing!) if it doesn't matter one way or the

In case it was not clear, I am not questioning removing it from the
common file, just that you're removing it entirely.

> other for VisionFive2 just drop it I think as being inaccurate/unnecessar=
y?
>=20
> JH7110 CPU supports two interfaces of SDIO3.0/eMMC so it's not clear to
> me if there's some reason for 'no-sdio' property to be there. Does
> allowing SDIO (?) break eMMC and SD Card devices, is it destructive?
>=20
> Not knowing what 'no-sdio' does technically I dropped the property and
> tested with the hardware I do have. The 'no-sdio' property
> present/absent does not appear to do anything user-impactful on Pine64
> Star64 that has SD Card slot on mmc1, and as would be expected on Milk-V
> Mars CM Lite WiFi when there's an SDIO module at mmc1 it then fails to
> initialize if 'no-sdio' property is present.

The original addition looks very intentional - however I didn't look at
the commit message itself last night, just the diff. I wonder if "no-sdio"
and "no-mmc" were just added because William intended to restrict SD
cards since sdio1 is the SD card slot, rather than because the use of
sdio or mmc commands during init would cause problems. The wording of "Set
sdioo node to emmc and set sdio1 node to sd" is what makes me think
that.

> > Could you add an explanation for why removing this entirely is the right
> > thing to do, rather than only removing it for these variant boards?
>=20
> Yes, I can rephrase a bit like "relax no-sdio restriction on mmc1 for
> jh7110 boards", or else reconsider the approach. I was going to approach
> with `/delete-property/ no-sdio;` later elsewhere but after testing on
> Pine64 Star64 with similar configuration to VisionFive2 mmc interfaces,
> and knowing that Milk-V Mars CM Lite WiFi detects AP6256 SDIO peripheral
> at mmc1 when this property is dropped (and with a few additional
> things)... I prefer to reduce the problems that would need to be avoided.

I think using /delete-property/ would be unwise, properties shouldn't be
in the common dtsi if they are not, in fact, common.

> I have done all the testing I can do with hardware I have. As-is it's
> just like I wrote, we'll have to solicit some testing feedback on that
> and wait to learn what this does for the other boards.

I'd kinda be inclined to apply this diff, with a better commit message,
shortly after -rc1, unless someone comes forward with a justification
for it being there on the vf2. I figure it's only in the common dtsi
because it was not problematic until now cos noone tried to use the sdio
aspect.

> Aside, anyone want to chime in what is the utility of 'no-sdio'
> property, how do you know from a schematic if it is appropriate, can it
> be simply dropped as I suggest for JH7110 boards?

My (limited) understanding, mostly from looking at the caps in
mmc/host.h because I find the binding description obtuse, is that these
properties (no-sdio and no-mmc) block the use of commands that would
cause a device to malfunction. They don't appear to be required at all just
because the board layout doesn't support these types of devices.

Conor.

--vFc/GG+76alb8wgR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaIPIpgAKCRB4tDGHoIJi
0mBcAQD+A96JAVhCxAjxPYXSaFPQqB2LxWezej/NuFO0RC1CHwEAy2m06gpZsX5l
9XUN6qKUEUe8ijVeBcUwf9m8mN75SQI=
=EhER
-----END PGP SIGNATURE-----

--vFc/GG+76alb8wgR--


--===============1505826508399598181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1505826508399598181==--

