Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6D8CC6B34
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 10:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E78aqaVMl331WttDS0kyAwKGD7I0HvLEfZR73WvjKCs=; b=4U0CMbr+ecuJa4YHczi1MNvj1o
	5QDJNUSVMn1hu0is0XqWC2Jz//+PusT8biee0QVDD2ue69SClygNU+a/6Kx2ewcrWbroU6n7cGxtX
	oyd8/TvlRYLwtGU0ZzquQnhRXn8pWvIZny1cTjqypN7NmfSEIOduS+FhsmxdsHUOkOmJv0NCpewoS
	SBNbFgziUzi6CRACWEVuYAMuKS4xbSP3JoVvN82ymSeSnp3dsiQCy87zSelcnMDI8B3l0XdxvwkwG
	QF5wWXmpgKSmPggf5kNezIcitjXnC4zxmgP6Tx0shytI/16h0FjBU52Lf3puTQrJ2V9NBdjC7zMzz
	aMis6knA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIa4-0000000HQ3v-0Dqx;
	Thu, 15 Oct 2026 10:21:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIa2-0000000HQ3o-0N2S
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 10:20:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 87A9D60120;
	Thu, 15 Oct 2026 10:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id B210D1F000C4;
	Thu, 15 Oct 2026 10:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792059657;
	bh=D0r+ZRTQkqkB0PvtjFaudvTYR8y4LWIG502oxgstgys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YMAF15e9HpVx9rUV375qLDuLoocXihQTYbIsrAc+lCMJL63FTwCyUsRZ04WSYPjQX
	 zwtKLU2H2xJ8eLVzwusm2jmwae6eAR3Rat92Hl5XfjBYR3LFCvy0+S5gStDv/VhpZ4
	 eDQQswq5CKF4USUF1+KnqR92yHKUekHyyadsZwP7uMnTYLs/PBcc0yA3DygL6FJ26C
	 Cm8N//IvmVgTIu+AdQ87gwGjwsmv3NSILLI4gZg6zse0Az5NpJYtsd7DUcZWxWKWrt
	 IxZl4kgHkAs9W0wOFGQgNecN5/cHcVsltQI8JYrS06hLbggZH1xmdp1nIGqm5opllP
	 zj2f4K5uifOPw==
Date: Thu, 15 Oct 2026 12:20:54 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hal Feng <hal.feng@starfivetech.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v23 1/2] dt-bindings: pwm: opencores: Update compatibles,
 examples and maintainers
Message-ID: <atCos9UIaZoRs4N8@monoceros>
References: <20261014110429.52762-1-hal.feng@starfivetech.com>
 <20261014110429.52762-2-hal.feng@starfivetech.com>
 <9c0737d8-455d-4025-8482-950b64029f35@kernel.org>
MIME-Version: 1.0
In-Reply-To: <9c0737d8-455d-4025-8482-950b64029f35@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============5594029726028236630=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5594029726028236630==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ql4e5cupjoadxutu"
Content-Disposition: inline


--ql4e5cupjoadxutu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v23 1/2] dt-bindings: pwm: opencores: Update compatibles,
 examples and maintainers
MIME-Version: 1.0

Hello Krzysztof,

On Thu, Oct 15, 2026 at 11:01:29AM +0200, Krzysztof Kozlowski wrote:
> On 14/10/2026 13:04, Hal Feng wrote:
> > Remove the jh8100 compatible since the JH8100 SoC has been canceled and
> > will not be released.
> >=20
> > Change the register size in examples to 0x10, since an OpenCores PTC IP
> > has only 4 32-bit registers: CNTR, HRC, LRC and CTRL.
> >=20
> > I will maintain this pwm module in place of William.
> >=20
> > Tested-by: Maud Spierings <maud_spierings@hotmail.com>
>=20
> Drop, did not happen. Is it so tricky to respond to the one patch here,
> where the tag would be applicable, instead of replying to cover letter?

I don't know what Maud did, but if they checked that the various dt
linters are still happy, that doesn't deserve a Tested-by:?

Best regards
Uwe

--ql4e5cupjoadxutu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrQqQQACgkQj4D7WH0S
/k7PIAf/X0MuEBIxbZRh0F/FP9Rs7R2pI9OL9EjSVgE6YYJ7giZMWHvgau/wK+oQ
/1K2oRxxnBy1xHda1owC8LkERBHXpdZIPIWdDzgubjgzbE4TqHxsdWlPiNQ1znMO
rZ2hAJQGXRpsZeWhAGfvJUOgh+hoTyp0TUDgN2qbewauiMRzEH28gx1FF4X4XFIu
yUReIyoxZAa6yGVKNv17ygnWXx4WEpQEteGyQO9c4KMUXdEzDJIM6sa4fQAXP6OK
C/82CB2/AEvO60ZXiZR6n1WFblFqvUCp4eNUGNcw83hjcTWEg0U8jskNm1u/U/VK
q0n4iJMFE4bA4TYCgishZ6DTP/cdNA==
=wAh6
-----END PGP SIGNATURE-----

--ql4e5cupjoadxutu--


--===============5594029726028236630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5594029726028236630==--

