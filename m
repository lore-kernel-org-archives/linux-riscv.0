Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E77CDB465
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 14:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IanL8fkTsZHlyURosww9ud3bxv+XSlVwlZdaO/UEsl4=; b=FIE7PMa8+xAMBcHQ414j0RmZIg
	4A6RWvbKceUKrEsdVi82glVtw7LQD3BiOFaMothZMTRHwZl99f6gjAAJyrrHaruhSQSg8jZdP0NYl
	1dB33hAQ072cQCyOt6jEwqbkolAo6WXRKH0W9y612g4GyfiX4LHDLGvLfcTt5oMXE6MgOeSQCdcwh
	OKQ7MtMRYoHbJrbpkYH6T/2Jjqvqwr3g/WznB0ZIZlnjvt3frHRpKJLWuGh28+/nLvQsB4OkOxTFm
	mrx+ge1E+Xel0HVL/o4xOS1P0nPuWA4jzn41O7tJCc29e0g+2nXqxYJtp0IW+2WLwj7W8/rQg6lkm
	vZKmtqyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtTdw-0000rg-1K;
	Thu, 19 Oct 2023 14:04:56 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtTdt-0000oi-0S
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 14:04:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DF6B3CE2D98;
	Thu, 19 Oct 2023 14:04:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D3CC433C7;
	Thu, 19 Oct 2023 14:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697724288;
	bh=xtme3jJusxVUa9FbYH1+EvMXHDNXjJxBF7Z86EuaCY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ggAbf4wp3vSh5284kcig1pPPsSidHG15qglwc71EcbD47XdClE1fuh5T6bGJWQym0
	 nV78AjAWd5j3cKm3rSV6aIE2+p/6c3n2QvwqCK/dFGWBjle+tmv4nZOS78m1cY04NC
	 RsTNfYd7mU3vr32pqTAW5cgsVLc9lG0vxi/6stMX0+cZtd5TYVQSew8LZACHTK4C5d
	 vWqkW899KSwASIC66uivQTu8GDuICN627eekP4A3A0gIXmtK48SFfCJFKSYiJ663ar
	 O0tHBqkCwZ6xD8zHT1f9m3VGmjoIUzFxS+4kr8d1QPdJ65GxurgBx1Q6pX4XSP5HU2
	 DZM+fsLGTyclg==
Date: Thu, 19 Oct 2023 15:04:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 0/7] Add Huashan Pi board support
Message-ID: <20231019-amused-agonize-bcb8787c6f6f@spud>
References: <IA1PR20MB495399CAF2EEECC206ADA7ABBBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB495399CAF2EEECC206ADA7ABBBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_070453_533225_EADBF9D6 
X-CRM114-Status: GOOD (  16.80  )
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
Content-Type: multipart/mixed; boundary="===============6525663476583145354=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6525663476583145354==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tVeLnAzB+nEjs8bs"
Content-Disposition: inline


--tVeLnAzB+nEjs8bs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Thu, Oct 19, 2023 at 07:18:00AM +0800, Inochi Amaoto wrote:
> Huashan Pi board is an embedded development platform based on the
> CV1812H chip. Add minimal device tree files for this board.
> Currently, it can boot to a basic shell.

Just pointing out that this series is too late for v6.7, so you probably
won't hear anything from me until v6.7-rc1 has been tagged.

Cheers,
Conor.

>=20
> NOTE: this series is based on the Jisheng's Milk-V Duo patch.
>=20
> Link: https://en.sophgo.com/product/introduce/huashan.html
> Link: https://en.sophgo.com/product/introduce/cv181xH.html
> Link: https://lore.kernel.org/linux-riscv/20231006121449.721-1-jszhang@ke=
rnel.org/
>=20
> Changed from v3:
> 1. merge the patch 4 and 5 of v2 to preserve bisectability.
>=20
> Changed from v2:
> 1. use dt override to save code.
> 2. code cleanup.
>=20
> Changed from v1:
> 1. split the patch into several patch and refactor them.
>=20
> Inochi Amaoto (7):
>   dt-bindings: interrupt-controller: Add SOPHGO CV1812H plic
>   dt-bindings: timer: Add SOPHGO CV1812H clint
>   dt-bindings: riscv: Add SOPHGO Huashan Pi board compatibles
>   riscv: dts: sophgo: Separate compatible specific for CV1800B soc
>   riscv: dts: sophgo: cv18xx: Add gpio devices
>   riscv: dts: sophgo: add initial CV1812H SoC device tree
>   riscv: dts: sophgo: add Huashan Pi board device tree
>=20
>  .../sifive,plic-1.0.0.yaml                    |   1 +
>  .../devicetree/bindings/riscv/sophgo.yaml     |   4 +
>  .../bindings/timer/sifive,clint.yaml          |   1 +
>  arch/riscv/boot/dts/sophgo/Makefile           |   1 +
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi       | 119 +----------
>  .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |  48 +++++
>  arch/riscv/boot/dts/sophgo/cv1812h.dtsi       |  24 +++
>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi        | 193 ++++++++++++++++++
>  8 files changed, 279 insertions(+), 112 deletions(-)
>  create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
>  create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h.dtsi
>  create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>=20
> --
> 2.42.0
>=20

--tVeLnAzB+nEjs8bs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTE3egAKCRB4tDGHoIJi
0n41APwMeOxLjPmDl9G45xdD40nzpk/P7fEfNvMDqL6OV9fjfwD9H+4j5zSNJa5V
vAl9NCqwS1HSCxO8bydUCObAQsUjZww=
=+zw9
-----END PGP SIGNATURE-----

--tVeLnAzB+nEjs8bs--


--===============6525663476583145354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6525663476583145354==--

