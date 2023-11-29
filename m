Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAA5C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 14:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HlDWHCsZUHJH5/9bLL7/X5jwcR021JL8Tf1tkqz1mr0=; b=Y2WQJSzxMOHmxBIuukF+rwb0i7
	UaNc09sxOJFcxLwfh4tBzepYMS3odOhwriMCfNis2IkipDpVsjdDTOsA8CRq0sW6wcs0Zc+77Y5ua
	+TYGvZw1tPrsBMtI2Q1SCSQGnzl+LCR7T0nlt1iE3SAjHVlVssSfjgImycLELuB8vgo4VGcL8JJfG
	ZjjwPVcIdyUQvic2Ffgj/VHvSKCODCWJ/o+8nVPBCXZmPo9T8iTc5sbNiakCwLEjYlEWd0mxfAHaq
	MFgFbiAuukb5urAsst21hUvZAsKSUMormkD5ZA5XKhGJ+maIv8uhpH4LB6rZgMz4p7zze90R6s03W
	RlE4cXRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8LrB-008gLc-1X;
	Wed, 29 Nov 2023 14:48:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Lr9-008gKd-26
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 14:48:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C2EAE61BF4;
	Wed, 29 Nov 2023 14:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F44C433C8;
	Wed, 29 Nov 2023 14:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701269282;
	bh=PI1weq/pnE/jDDTHXdI0Ix4uqb+JeIDqc0bU61UT7wY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ca6EXan6a9dO9rm3hsPemNIdm96eOx2BlqY79kMTc+6YsKK55tn40Opi7Ogmbysa3
	 8Lt5ztvKuynShJKZ6xi2yiDJ6bdF70RdNPV0cnXOhqhRgUYOI3yayy5ar7PrcJnTfR
	 v6Fd58NES9svvhbylPRDfiNIhPsCUWp4FuLZQpQOW3uSJ6AbEknkKW2MXGj9tPBwM9
	 3u5t2bN9IKHJo5X+C/qUBY2QcyO42ke2I3SyXwYDmKNFT1BNTOsjO2qPsr/WHfCdQl
	 FXQkEjn8a6uZlRIfTD9VPY53ouEwYaL9sy5kRbppjNy+/mVhGsn30CvMvVOm7G8UtO
	 Uo1S1JTLLT/EQ==
Date: Wed, 29 Nov 2023 14:47:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: kernel@esmil.dk, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	krzk@kernel.org, conor+dt@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	daniel.lezcano@linaro.org, tglx@linutronix.de, anup@brainfault.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	michal.simek@amd.com, michael.zhu@starfivetech.com,
	drew@beagleboard.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	leyfoon.tan@starfivetech.com
Subject: Re: [PATCH v2 2/6] dt-bindings: riscv: Add StarFive JH8100 SoC
Message-ID: <20231129-staple-filter-4a1e9494c00c@spud>
References: <20231129060043.368874-1-jeeheng.sia@starfivetech.com>
 <20231129060043.368874-3-jeeheng.sia@starfivetech.com>
 <20231129-thrower-umbilical-f11ee0749800@spud>
MIME-Version: 1.0
In-Reply-To: <20231129-thrower-umbilical-f11ee0749800@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_064803_732630_72429397 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============5548282340975037103=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5548282340975037103==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mHpRZgRE9TQM1U6p"
Content-Disposition: inline


--mHpRZgRE9TQM1U6p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 02:46:26PM +0000, Conor Dooley wrote:
> On Wed, Nov 29, 2023 at 02:00:39PM +0800, Sia Jee Heng wrote:
> > Add device tree bindings for the StarFive JH8100 RISC-V SoC.
> >=20
> > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

(with the whitespace thing that Krzk pointed out fixed, just noticed
that)

--mHpRZgRE9TQM1U6p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWdPHAAKCRB4tDGHoIJi
0tOJAP9enRl8M+ZWxXhgOFJE/TEI8bZPpSIv5hOkVolw8Y/X3AEA2OShFNPWpbKo
LpDiLZXdIPt9gnT2lHE3G6wCHR//awU=
=xkmZ
-----END PGP SIGNATURE-----

--mHpRZgRE9TQM1U6p--


--===============5548282340975037103==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5548282340975037103==--

