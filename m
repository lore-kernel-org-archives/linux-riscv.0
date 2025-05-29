Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5EFC5AD49
	for <linux-riscv@archiver.kernel.org>; Thu, 29 May 2025 11:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bf7UwzUO+Li+hiIxE9n0QK9njw1UzD+0yDDH5wJKcoU=; b=r/Jo0DakSOaqYDi75o2evNWG9t
	Ia4nwkneavLkKGmLdoonNKkePIstLP+zGoJK5pZups0KxSgYDuJP1wmB7NXZRidZQNUtczX/dnDtO
	2xO4MRucS4D1kL2kYqEylJlL873cGh7esDyNP9v13woaT0+unOYqMtYqM/B1EuexruP5NlAbJTkRb
	xehPnbI1oOGeInUzPOgKfv7WsXUPq81nHGO0RDEMCayQe5U3yn74a3qFQVDOyTTFh51H343dCwxq8
	OeOrXbGTIR6Mu5l5fjVU1rZKGHE5Pcak/jtAvS7ChUgx5uMNeKjn2xawGugvf9UUOUaUuL4ZmVEAW
	IIKWNNBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbv2-0000000Fgz5-1guN;
	Thu, 29 May 2025 11:59:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbLZ-0000000FbMU-1oNT
	for linux-riscv@lists.infradead.org;
	Thu, 29 May 2025 11:22:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BC700A4F871;
	Thu, 29 May 2025 11:22:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3EAC4CEE7;
	Thu, 29 May 2025 11:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748517771;
	bh=dV/0sTKRb/rUIweWWF6haVE0P/cXtjrDmiNmJdFO6YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dc3It4qAFErG8zaqtNNMFIyKNhXsHwAGEtvPrUIKhSiDOgXLUTnliqgcIf+ulWeDx
	 FZFPyrxkI/ixqR0nVC1BqdEm0poRWiAA1Ko+LA/E0mrDCcAYORlKhu4/pqX1TYFKgK
	 bIfSqPUKiULm6L5HoWwX7c9YWZW3kibcmaoUq4m2v4xrQfHFqWBVIadj0wuGjDbBpi
	 AtIEE8lhtIDid0oQ/XC+RgmquZcVH6XbOlGFSDPXyH8LjbIaxSUXUOTVdrxLf/y2QY
	 9F2LH+V4GVS5uZFumAEjqNZpgjccCKv31D9X2O2gdwotlffSDz56b3t23vMoedTeCU
	 D3Q5ivPKDqDDA==
Date: Thu, 29 May 2025 13:22:47 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Nylon Chen <nylon.chen@sifive.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v15 0/5] Change PWM-controlled LED pin active mode and
 algorithm
Message-ID: <jfql74ayb42fzmakpz4sfyr2mnv62srpzh3ut4tdmnmipwoboy@uxumfy5kq54j>
References: <20250529035341.51736-1-nylon.chen@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20250529035341.51736-1-nylon.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_042253_570998_3AAFEE4E 
X-CRM114-Status: GOOD (  13.95  )
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
Content-Type: multipart/mixed; boundary="===============2359308443567300243=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2359308443567300243==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t7jb6esylkpa6lhn"
Content-Disposition: inline


--t7jb6esylkpa6lhn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v15 0/5] Change PWM-controlled LED pin active mode and
 algorithm
MIME-Version: 1.0

Hello Nylon,

On Thu, May 29, 2025 at 11:53:38AM +0800, Nylon Chen wrote:
> According to the circuit diagram of User LEDs - RGB described in the
> manual hifive-unleashed-a00.pdf[0] and hifive-unmatched-schematics-v3.pdf=
[1].
>=20
> The behavior of PWM is acitve-high.
>=20
> According to the descriptionof PWM for pwmcmp in SiFive FU740-C000 Manual=
[2].
>=20
> The pwm algorithm is (PW) pulse active time  =3D (D) duty * (T) period.
> The `frac` variable is pulse "inactive" time so we need to invert it.
>=20
> So this patchset removes active-low in DTS and adds reverse logic to the =
driver.

Applied to

	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for=
-nexxt

as 6.17-rc1 material. I pondered if this should go in earlier and/or
should get marked for stable. I'm unsure and willing to consider input
here. The problem I see is that while this is a fix, the change is a
breaking one and you need the dts change and the code change applied
either both or none.

Best regards
Uwe

--t7jb6esylkpa6lhn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmg4Q4QACgkQj4D7WH0S
/k5Lgwf/SP6TM6iinfR+nLxITKK64by0Ws8lMmVkyjSrhRXh82uC0AGWdbgwYdK/
PG/mYXTKZ5HCxZSKN6tLrwBlv7274OvSlMHKm5ECqfx2SfOVVonLNGPFPHqSio5T
fuxD5PyJyJfArppWLvZDc53PZLoXyRWVWMVIQTAz6xsbZSwg46HFKnKKW8gdi+pp
xGf62lktVUk42OfBKcs4naXobSACqiyG1BES/W+s5Z3o1rWghbdNCj3d/zNtLsUu
6kGM/uh5xmcM804K0N44LUGmfBFuVNyGepR75baQxSB//3OCrQ9X24M1QfEH8WC4
swfkxqbXkPf0v5zpt7Rq0afo+gNZ+w==
=nB9p
-----END PGP SIGNATURE-----

--t7jb6esylkpa6lhn--


--===============2359308443567300243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2359308443567300243==--

