Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5585C83F26
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxWk4Wnqrtv5+Lx3A0ELSd2VzICnINmKT9foRpR17Is=; b=12dzX+2aTaPXwng0KK36Pa8H5X
	TWY++7Fh+GhijHjdIkGt/Xvk9NJTU/rmWz2A0egu8TBJEoKwazZo9G8yyU9noVh1mOwNxUEpY0qTY
	wNg6kOcs7C10Dq+9Lbh68Glm3GIjJQ9E9RxKyHSqdmIUKDiB+/ltpcPKncPOBRh2DOZpD1CmwRwSd
	CBuTTRRjugLWB0e3apTzDEQkxX8RefPAbIeR2w8cJfewm6nLfjo8roN6GaX1Az/4tXnLH7gvpz5JU
	zxdS6TTstu74btAYkB6Pog+l1PeIa8EEoTLsqMJe1CAXIhihC4svT+zIB+c/x3FNX9kpeCRL10Mzi
	LEng3Z7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTjB-0000000FIs1-0d2K;
	Mon, 28 Jul 2025 19:41:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTei-0000000FHTO-1u7K
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 19:37:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 43DF3A54CFF;
	Mon, 28 Jul 2025 19:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B69EC4CEE7;
	Mon, 28 Jul 2025 19:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753731422;
	bh=2Sb9fBblq1FYAwuJDHOTzzqKufW/7NOkzrWORdlvt30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r/efa2CU5jy3bq6KVvHApUHYUdpj8gSEzMyPr/A7154pGp9h8XxnYd4B3+CDkCLip
	 ZR0LivYkT3kYCE2li8Ar5OSQ2JGfX5KLj4pTvWRejo4cMT+yY/Rq+FK22Kt04sQz5H
	 ys/LtSV3lnG3XwJu+49VIxE+lfbutX/0i9uMwFX57cFUZRGfJ3FtH+6qf5mbsMrleL
	 RJYU3zbi3yxU+CZwVUKvDIyFvNjYb+0mLdQHmJK+zl1GVbD8yKFYRRDGSqNyAq24aH
	 HhGjDZGmnNSrxKwaFI9x+I6QDlroHFbdCMSjtmb4Uy/I6KU2b7MPqYifQCIxP/zR22
	 wv21/l5M4Z39w==
Date: Mon, 28 Jul 2025 20:36:57 +0100
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	William Qiu <william.qiu@starfivetech.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>,
	Minda Chen <minda.chen@starfivetech.com>
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: drop no-sdio
 property from mmc1
Message-ID: <20250728-urethane-backside-52dfb7b96b3b@spud>
References: <20250724075600.239522-1-e@freeshell.de>
 <20250724-equal-limb-2922f240961e@spud>
 <43c5908c-c478-4e00-b1e5-955296e4ec24@freeshell.de>
 <20250725-disorder-graceless-23c95454244d@spud>
 <8841923c-cbb6-4cce-97f4-a851783b6102@freeshell.de>
MIME-Version: 1.0
In-Reply-To: <8841923c-cbb6-4cce-97f4-a851783b6102@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_123704_564865_CCA5756D 
X-CRM114-Status: GOOD (  18.03  )
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
Content-Type: multipart/mixed; boundary="===============8099795417878974143=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8099795417878974143==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="T4MMNLS7LDfTamu7"
Content-Disposition: inline


--T4MMNLS7LDfTamu7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 27, 2025 at 08:52:50PM -0700, E Shattow wrote:

> >> Yes, I can rephrase a bit like "relax no-sdio restriction on mmc1 for
> >> jh7110 boards", or else reconsider the approach. I was going to approa=
ch
> >> with `/delete-property/ no-sdio;` later elsewhere but after testing on
> >> Pine64 Star64 with similar configuration to VisionFive2 mmc interfaces,
> >> and knowing that Milk-V Mars CM Lite WiFi detects AP6256 SDIO peripher=
al
> >> at mmc1 when this property is dropped (and with a few additional
> >> things)... I prefer to reduce the problems that would need to be avoid=
ed.
> >=20
> > I think using /delete-property/ would be unwise, properties shouldn't be
> > in the common dtsi if they are not, in fact, common.
> >=20
>=20
> Ack, you wanted these moved out into each board dts? That would be okay
> with me. I suspected that `no-sdio` `no-mmc` don't belong so I'm still
> in favor of dropping them overall. I think nothing will break but I want
> more data from users.

Ye, moved out to the board dts is my preference over using /delete-property=
/.
Things that aren't actually common shouldn't be in the common file. I do
agree that in this case, removal entirely is probably the right call.
There's some sdio wifi cards that can go into sd card slots, so just
because the mmc controller is connected to a sd card slot doesn't mean
no-sdio should be used.

--T4MMNLS7LDfTamu7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaIfRWQAKCRB4tDGHoIJi
0nmjAQCEANsDtguhRuMO4ZhwOLtWZ/dXuKM5l8uct25QPgTicAEAoy8sjgj/KZDz
gsDMRaML2ZB4DzXwCewRrkeNo73JDw4=
=opz+
-----END PGP SIGNATURE-----

--T4MMNLS7LDfTamu7--


--===============8099795417878974143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8099795417878974143==--

