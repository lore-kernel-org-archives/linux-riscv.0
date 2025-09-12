Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F513CAC582
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 17:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ER7tUIRpIYRSEjTnhHQ4qBFZ8XCJj/1fLSi4Y4m1w+M=; b=ExVU9S2OK84nbr92c1jmFjqg87
	i+3JbYKK4kqmzhfLjG4oe7wc0s+FxgGgUiv5NCFDk77ny7oILDA2GSJv44p716feug1c0WLgTGWbU
	dV7g/1G4fPmKLR60sCFG0rmDwslL1FYSBgsgAtFixIxs0ZPkJ6YlsfRxPyMtIk2KDr9Q3NDRSL0iy
	hDXSgb/p8g72cRHv/YfBtYxC78QFREIdjQJqeqA/jbR08DTxO3x+DVca7dPeAVFU/Aaf9LdSIYFC2
	Wl1k+5/Zf9vAiwA2HN77UrEMQrB3AW1cON/t/LKNjR+mc0EkQ/yj32vjOIdfYjR7Uh5sEUfQ9+wa4
	MjjEfcoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux81W-0000000Arm9-3gvf;
	Fri, 12 Sep 2025 17:57:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux81V-0000000ArlW-2kp7
	for linux-riscv@lists.infradead.org;
	Fri, 12 Sep 2025 17:57:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BC5CC601E9;
	Fri, 12 Sep 2025 17:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D36AC4CEF1;
	Fri, 12 Sep 2025 17:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757699844;
	bh=KPNrAy13TtrhHaKH+3BYicgz+OHEulIoe7vBIpR0wXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qvj/gePELH1Mire0C2L0UVcM9BdbqCs1qcb4DQkquNBdn46i5uoO8iJqr7N6PclWw
	 D+OZqTZ2cwvoylHY/NLWq2Djtem7HLrAcO5xshI8slUOUd5TSwEZNTpAutOWh6i0RR
	 MMBz7w4XQkH2gIZuhvIQZPIM7Y+ByzDNqbxe3+VQ3OqgfZNjTjrwtkvaJQaW0wAPPE
	 crjVFDER+/JXhOe5fQHNh0JdoijthKgYiVUGGyOQL3MyxX3dZjiPYASm+D2sWE0j+m
	 DriIFN5FgLhZyPALuwi0oS/vCIAaI7Vkvw7TrN0XavPhwK4GRzqB9HmlHWjgnPun5r
	 JbNU9uu63eGSw==
Date: Fri, 12 Sep 2025 18:57:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Han Gao <rabenda.cn@gmail.com>
Cc: devicetree@vger.kernel.org, Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Han Gao <gaohan@iscas.ac.cn>
Subject: Re: [PATCH 2/3] riscv: dts: thead: add ziccrse for th1520
Message-ID: <20250912-gander-fox-d20c2e431816@spud>
References: <20250911184528.1512543-1-rabenda.cn@gmail.com>
 <20250911184528.1512543-3-rabenda.cn@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250911184528.1512543-3-rabenda.cn@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============5570698981130047518=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5570698981130047518==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ckPI/e1OOmzor027"
Content-Disposition: inline


--ckPI/e1OOmzor027
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 02:45:27AM +0800, Han Gao wrote:
> th1520 support Ziccrse ISA extension [1].
>=20
> Link: https://lore.kernel.org/all/20241103145153.105097-12-alexghiti@rivo=
sinc.com/ [1]

I don't see what this link has to do with th1520 supporting the
extension. The kernel supporting it has nothing to do with whether it
should be in the dts or not. A useful link would substantiate your
claim.

> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

You only need to sign this off once.

Cheers,
Conor.

> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/=
thead/th1520.dtsi
> index 59d1927764a6..7f07688aa964 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -24,8 +24,10 @@ c910_0: cpu@0 {
>  			device_type =3D "cpu";
>  			riscv,isa =3D "rv64imafdc";
>  			riscv,isa-base =3D "rv64i";
> -			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", "zic=
sr",
> -					       "zifencei", "zihpm", "xtheadvector";
> +			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c",
> +					       "ziccrse", "zicntr", "zicsr",
> +					       "zifencei", "zihpm",
> +					       "xtheadvector";
>  			thead,vlenb =3D <16>;
>  			reg =3D <0>;
>  			i-cache-block-size =3D <64>;
> @@ -49,8 +51,10 @@ c910_1: cpu@1 {
>  			device_type =3D "cpu";
>  			riscv,isa =3D "rv64imafdc";
>  			riscv,isa-base =3D "rv64i";
> -			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", "zic=
sr",
> -					       "zifencei", "zihpm", "xtheadvector";
> +			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c",
> +					       "ziccrse", "zicntr", "zicsr",
> +					       "zifencei", "zihpm",
> +					       "xtheadvector";
>  			thead,vlenb =3D <16>;
>  			reg =3D <1>;
>  			i-cache-block-size =3D <64>;
> @@ -74,8 +78,10 @@ c910_2: cpu@2 {
>  			device_type =3D "cpu";
>  			riscv,isa =3D "rv64imafdc";
>  			riscv,isa-base =3D "rv64i";
> -			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", "zic=
sr",
> -					       "zifencei", "zihpm", "xtheadvector";
> +			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c",
> +					       "ziccrse", "zicntr", "zicsr",
> +					       "zifencei", "zihpm",
> +					       "xtheadvector";
>  			thead,vlenb =3D <16>;
>  			reg =3D <2>;
>  			i-cache-block-size =3D <64>;
> @@ -99,8 +105,10 @@ c910_3: cpu@3 {
>  			device_type =3D "cpu";
>  			riscv,isa =3D "rv64imafdc";
>  			riscv,isa-base =3D "rv64i";
> -			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", "zic=
sr",
> -					       "zifencei", "zihpm", "xtheadvector";
> +			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c",
> +					       "ziccrse", "zicntr", "zicsr",
> +					       "zifencei", "zihpm",
> +					       "xtheadvector";
>  			thead,vlenb =3D <16>;
>  			reg =3D <3>;
>  			i-cache-block-size =3D <64>;
> --=20
> 2.47.3
>=20

--ckPI/e1OOmzor027
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMRe/wAKCRB4tDGHoIJi
0gr6AQC0Z3lIIyuKe12SKlVpEupoqew2hhyVZcMRuRiWOky/wQEA/ZDm+1HCT2Mo
FCAHgHH2tK0RawGHqwpkhre5TmmsQwc=
=V2ZA
-----END PGP SIGNATURE-----

--ckPI/e1OOmzor027--


--===============5570698981130047518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5570698981130047518==--

