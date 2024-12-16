Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9DBE77180
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 20:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOFddKaTeKjFTZxirfB378m8F2cp03azSOJJOaXOxX8=; b=ij/5UAhTNMf7UiNVFVxPj+nyvd
	IbXkaTzJiuEslEweD+Z651qI5JrIHz6a276dXGlriJCMsbKm9WkajTlqVpmkQ/cDHaxcgvx++V6/s
	ZKvWyIsi9xfu7UG7+iRQCETrXR5ytzVcPRnz6kKfb9+V+lffum+no0Br87eNYO8VMhETex2LsYGDz
	CRFMNZ7JzgqnAayL4gna0LSKCtcuzWAVbRfGRM8AuGuMSla4/xiN6XAFW+GXCMZ8XMnU+VayHqNPn
	M0rgQKfdx+ZHaW6RRv8QZVCalaUChiIk6hHl7m31pno9FOOTApLYCfh5POyZWLSB+OQd9N+RtM9CL
	nNeQik7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNHP3-0000000BD8K-1KXY;
	Mon, 16 Dec 2024 20:09:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNHP1-0000000BD7v-0S2S
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 20:09:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 911ECA41A6E;
	Mon, 16 Dec 2024 20:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57697C4CED0;
	Mon, 16 Dec 2024 20:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734379754;
	bh=Ajv+SLsg/GiAOURmWAmHL8wxGVRWma3tzp34DC7dGEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T7bxWYQRt2nRAiP3KX4O/Wmpbcdn962UVtW4c5BVLQeAYnPksk2d5swqx5iiEPUpq
	 WEoRiJO0Idppg/6TvTM1mw05rUKVwjdEXuqIp0FWcFimvIZTWXmBHWc96MOHF+AFeB
	 FrpkyfXKq60blPQMSZoaEgCK6P9LrZ/GylbhNaNdfN5Gn94w63fmtcdp3Ke1xjE7Dk
	 CYFO0kCyILaKOzQ+ahwqqoEKRNwDS6KSQNF+pKj2EpOhEHKNhCNxphvU2JNSfRJF0x
	 HDkDSIbGVt5lc5DOVRrojG02MTaSiIo0qwqMXpXV90rnANrQTafK9Idi4f4bQU3LVn
	 eblfrdJwUfafg==
Date: Mon, 16 Dec 2024 20:09:09 +0000
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: Fix a typo in StarFive JH7110 pin
 function definitions
Message-ID: <20241216-nuttiness-arrogant-27063bd1c47b@spud>
References: <20241210042002.165297-1-e@freeshell.de>
 <oacmcw5yvdlsmvqbt4dbdmsx6rvd6x43qv2ejmypw57jgraqu7@txhhsxdg2agq>
 <e4e19875-c02c-4673-814b-86090223b55d@freeshell.de>
MIME-Version: 1.0
In-Reply-To: <e4e19875-c02c-4673-814b-86090223b55d@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_120915_219634_605D89FC 
X-CRM114-Status: GOOD (  22.96  )
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
Content-Type: multipart/mixed; boundary="===============8688488204695847354=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8688488204695847354==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="N6lwbiqT70gdwRWZ"
Content-Disposition: inline


--N6lwbiqT70gdwRWZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 11:58:29AM -0800, E Shattow wrote:
> Hi Krzysztof,
>=20
> On 12/13/24 01:37, Krzysztof Kozlowski wrote:
> > On Mon, Dec 09, 2024 at 08:19:56PM -0800, E Shattow wrote:
> > > Fix a typo in StarFive JH7110 pin function definitions for GPOUT_SYS_=
SDIO1_DATA4
> > >=20
> > > Fixes: e22f09e598d12 ("riscv: dts: starfive: Add StarFive JH7110 pin =
function definitions")
> > > Signed-off-by: E Shattow <e@freeshell.de>
> > > Acked-by: Hal Feng <hal.feng@starfivetech.com>
> > > ---
> >=20
> > Why are you sending the same multiple times? Where is the changelog and
> > proper patch versioning?
> >=20
> > Best regards,
> > Krzysztof
> >=20
>=20
> I did respond to Hal's comment that the patch is missing a commit title
> description and that I would re-send. How instead should the message be
> formatted so the patch commit title description is changed but the patch =
is
> not the same being sent multiple times?  And now, again, based on your
> comment that this is not a typo I will again change the commit description
> but I don't know how to do that without sending again as a duplicate.
>=20
> Thank you for the review and for your patience with me when I am learning
> how to participate.

FWIW, this should be v2. Don't resend for that.

--N6lwbiqT70gdwRWZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2CI5QAKCRB4tDGHoIJi
0h8XAQDfEK+StAVpeKk1JbjwhFO7IWDiTdyVJYwV3RBO+0EpTgEAnW4HWnSV4NCp
1mo5X7aeQN0fSR+A+l16E/NBUXLECAc=
=grkq
-----END PGP SIGNATURE-----

--N6lwbiqT70gdwRWZ--


--===============8688488204695847354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8688488204695847354==--

