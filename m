Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6177DC3DA45
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 16:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFymVm+KsmiBe2aNpF69cGW/qWm+QQrKnZOyI5PbgYM=; b=3Hkaoof3mjR4FYu/mcaWN5MUNm
	NryBWRemJlpRwT0kcir6Kd1m19D9rgW50ivVHYUEpKQFTJD323i9Bensw9AB8osDWebXFtj1A4hQG
	ZL5mogLpaaFbVwfruoj27ccFX5VMfOXrNmd/swhA7N0QgT7EN84BScc1d27c6HjPcz/P50naF0S3W
	aOT3qCnZO1kHWuA+iyYkqInfbGB9oBuXrmrVdkrkuRMwY8q5PMUuGnGIxTLigaNsZiJ+nM2iYrXkU
	+BXlkQNnO9wsMTbRND9Ld8lbKjJvhcaKRTWRgyKYnLZMVRoZpu67V83J9cQvTOhBbOMXzFStpEUHp
	8QokUbSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRwLv-0000000EcXb-1Dey;
	Thu, 11 Jul 2024 16:09:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRwLg-0000000EcTy-41Gy
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 16:08:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2724261D70;
	Thu, 11 Jul 2024 16:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C810CC32786;
	Thu, 11 Jul 2024 16:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720714127;
	bh=dArFzUR62pjSDR9oi4NDee62Jbu4M80ZlukA3ud/HGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N3/bYjJg8XrRRFZG4jagVHinO0jvF/xbwEHRbT+2yY4CWE87TDAJsJPbYz5HNdZOy
	 DS3Rct7Y0KOEvuCpeMMEAFKopRpAqf36oYGIKlLWee+vTXkbPea64LNAa9IPTru1C0
	 jBRNWB0TpyFD5ads4B0ATRVghEhFlZ1n9td1recL8zT7LSFlOpo4Ib+J+beaC9hN1u
	 DRMnZ/0AfwlsA5toyp/BYS52ehT2zLRByxCtWXUST5G08ZABsY5TLsCb9GBAqFKfvR
	 BOD5xnIcKYwcPs1SvVwIEwuwAaop3CR5X5vdUrMrWfHLVep+3s6PuUdACnfbJ41dkp
	 U3u3WD7YCnX4g==
Date: Thu, 11 Jul 2024 17:08:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v4 00/10] riscv: add initial support for SpacemiT K1
Message-ID: <20240711-zeppelin-property-aef2ee5fe999@spud>
References: <20240709-k1-01-basic-dt-v4-0-ae5bb5e56aaf@gentoo.org>
MIME-Version: 1.0
In-Reply-To: <20240709-k1-01-basic-dt-v4-0-ae5bb5e56aaf@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_090849_086930_CE869DE3 
X-CRM114-Status: GOOD (  14.86  )
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
Cc: Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, Meng Zhang <zhangmeng.kevin@spacemit.com>, Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-serial@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Lubomir Rintel <lkundrak@v3.sk>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Matthias Brugger <matthias.bgg@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: multipart/mixed; boundary="===============0823260512799903917=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0823260512799903917==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yHpvReNwxF6wUK2f"
Content-Disposition: inline


--yHpvReNwxF6wUK2f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 09, 2024 at 03:18:43AM +0000, Yixun Lan wrote:
> SpacemiT K1 is an ideal chip for some new extension such as RISC-V Vector
> 1.0 and Zicond evaluation now. Add initial support for it to allow more
> people to participate in building drivers to mainline for it.
>=20
> This kernel has been tested upon Banana Pi BPI-F3 board on vendor U-Boot
> bootflow generated by Armbian SDK[1] and patched OpenSBI[2] to enable
> Zicboz, which does not in the vendor dts on its U-Boot. Then successfully
> booted to busybox on initrd with this log[3].
>=20
> As previous discussion in patch v1[4], maintainer expect more basic drive=
rs
> ready before really merging it, which would be fine. For other follow-up =
patches,=20
> that are clk, pinctrl/gpio, reset.. My current goal would target at a hea=
dless
> system including SD card, emmc, and ethernet.

This stuff is already too late for 6.11 as I already sent my PRs, so
there's no immediate rush. Is there any progress made on creating the
clock or pinctrl drivers?

Cheers,
Conor.

--yHpvReNwxF6wUK2f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpADiAAKCRB4tDGHoIJi
0r+HAP4kQtP7z7FMirQkNnNga/iok/jbgojhmbMGEJinXvYMeQEAlQegTv/hhWUO
JANgyTGsSPtmecPs/EU62TinIgodsgE=
=13ox
-----END PGP SIGNATURE-----

--yHpvReNwxF6wUK2f--


--===============0823260512799903917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0823260512799903917==--

