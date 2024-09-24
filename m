Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AD8CF9C6F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 16:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nhvVScI3gC6NWJctF66t0rYQjkIDYGg2qr6ewpz2T9g=; b=M93hyL3uOimPLOdyaPUVycTa3f
	QYWcvbDY6QO8PvR9bXnnnX27W0kyAifsG7iwgC7ljsuSd6O6B51OvMuLou+JAadppRUrYrBfB4qN5
	KBc0Cz80L+WzjvCnYdDrwbH4DV3VCxNau8M3PhX1bglV3CmYwP47HIil7EtpmoE6uudjkFW28X6w4
	XtvkMaC2moycXBMn9kXinBNIfTRDjdugo8UUzOxuFTHncl/B775/Oa5hnu4W4yd90T9ACwtw6j1i5
	7eSnXBHOkm44OrAHGn5M6caenWGu7NK6VL/c7n8KCxmuLHLywa9NYI6aVXDbAeMP0aNIRaC/PjuO0
	L/ni0yww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st8Oh-00000002pM3-34Dm;
	Tue, 24 Sep 2024 16:28:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st8Mr-00000002oz7-2Hl4
	for linux-riscv@lists.infradead.org;
	Tue, 24 Sep 2024 16:26:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BCC82A43704;
	Tue, 24 Sep 2024 16:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87435C4CEC4;
	Tue, 24 Sep 2024 16:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727195184;
	bh=DOqNrBus5khy2mu8X0lPPo/d0p67Z7fHJKwABB8mpW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fyeZO+mErroNrBSgULOwcva6kbr76WvSP5MArjfRJ/kNS/YZWjX4sr9KJz58a1z/T
	 /x1eX6pq7RKF9bz/Tztk3WjgN+3BZXBtU+H0QYoHdltwtITBxSHsLeYtWyhbkS4zyI
	 U6QSf7T3aH3WB7Ipe1Jpptj3i1KYZFSO/ZN/VJF9vN7RDMcTu2Jdnr54EBTAC3ygr7
	 8tVOMveqPV0xZfpTzGe2E13C3ztIwlrK96p2qxjQY8hXz8LuP3q6Nqo9RYUTHsOEmQ
	 PUlqjPOLuv8xY5qKsVVL7bLwfcKVmQ8oINOGkGp/chYK+O0cpDcz2bdY9hnx0nixc4
	 aBdC4Bty8Rf8w==
Date: Tue, 24 Sep 2024 17:26:18 +0100
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: Sandie Cao <sandie.cao@deepcomputing.io>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dhs@frame.work, ams@frame.work,
	gregkh@linuxfoundation.org, yuning.liang@deepcomputing.io,
	huiming.qiu@deepcomputing.io
Subject: Re: [patch v2 3/3] riscv: dts: starfive: add framework dts
Message-ID: <20240924-ended-tactics-b2e779875a76@spud>
References: <20240924080650.1345485-4-sandie.cao@deepcomputing.io>
 <75d4f0395187f7950e0450a91fbe087d@milecki.pl>
MIME-Version: 1.0
In-Reply-To: <75d4f0395187f7950e0450a91fbe087d@milecki.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_092625_679578_1C547DD7 
X-CRM114-Status: GOOD (  15.40  )
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
Content-Type: multipart/mixed; boundary="===============2275888308510008596=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2275888308510008596==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f5CsaSLaLqFN6mer"
Content-Disposition: inline


--f5CsaSLaLqFN6mer
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 11:55:44AM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> On 2024-09-24 10:06, Sandie Cao wrote:
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110-framework.dts
> > b/arch/riscv/boot/dts/starfive/jh7110-framework.dts
> > new file mode 100644
> > index 000000000000..ff12c24ebab3
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-framework.dts
> > @@ -0,0 +1,34 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +/*
> > + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> > + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
> > + */
> > +
> > +/dts-v1/;
> > +#include "jh7110-common.dtsi"
> > +
> > +/ {
> > +	model =3D "Framework FRANME0000";
> > +	compatible =3D "deepcomputing,fm7110", "starfive,jh7110";
> > +};
>=20
> Nitpicking: property "compatible" should go first.
>=20
> See Documentation/devicetree/bindings/dts-coding-style.rst

I think "model" usually goes before compatible, I wouldn't change it
here.

--f5CsaSLaLqFN6mer
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvLoKgAKCRB4tDGHoIJi
0hEwAP9qlgaPcQGuJMokpi9NuIXGcdP7TrRN34mjUCdLTxXL0QEA0I5qKOqWwcj5
GLvAFrTd6v2Fb1p45ufZ1Vfl/Ff4Jws=
=AnWM
-----END PGP SIGNATURE-----

--f5CsaSLaLqFN6mer--


--===============2275888308510008596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2275888308510008596==--

