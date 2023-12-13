Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E61C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 15:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKQHs8ZsbX5XmcaGlk763ME4QqfNT7b/u9k3RlLRZLM=; b=Snv7+TKD9IuHJtMC3QrX5tWS+w
	ul8XEYNM4u8auRVswYyQhmXG9CuA2hG5zO0Sx4vCIvw8ChwapnWM6uy6/cuzPjEgZ1BxTlb6hMhia
	Jvap9P8r0wXzfKOdWJ+QOQ6w7Hf5NSRioxmPh3QUdD5UsY6xoeEBAj2Ec/LR8DMboUfGSjcGsENY4
	+eiz4ri6y0C9YKJKVy2H1GsOsdEV20jDfk793hhiVH/nQOo/aGgxP0M/n8Jqqtpn/i3gzvDfuNtq1
	y4o3dTiVS01sTVwljjfUsoof8hk9yjqzw2a3uq1pwC6NMUuFfUtAmmF2FEwtAws+g6iJ55XmdXypi
	nmKdpyLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDR5r-00FC7p-0t;
	Wed, 13 Dec 2023 15:24:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDR5m-00FC46-2R;
	Wed, 13 Dec 2023 15:24:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1FB8E61DC8;
	Wed, 13 Dec 2023 15:24:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03851C433C9;
	Wed, 13 Dec 2023 15:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702481049;
	bh=B5L29gqlycO+tPIZOgKNoV72HJ6XozjWlal3rU7LPKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lVPC/6+XKyyz0tIrqIutuGinsKshmtQX9K9wxTkm3sC1+rQIPyzaW5Cjv4jVXGnH9
	 lG0FrO6RJ7FNRNrF4ho41HaV4bgCsb5fi+Puj4KSFCVE41SB2TrIl48EH8pi6l213Z
	 oIIgM0F4YQIBnV2z+ONV5tSR4gXdYrVOgx6x88N5/gFRZ1RJP4clRZLd0+5raV1c3E
	 mWb7cHLKOtcBgcNNfl6GEtn3PundzviEcUBUwS6Pmh5O1G6icpeA6vK0Thcjaa2M1S
	 0lEoeSN+0+1GxrD0xPR2nM3K7KBwiAZFC9IgQfaEKATuKipcEHnT7bPZtlgGkazYTi
	 1dZYUH51ac3Kg==
Date: Wed, 13 Dec 2023 15:23:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Yu Chien Peter Lin <peterlin@andestech.com>
Subject: Re: [PATCH v5 14/16] riscv: dts: thead: Add T-Head PMU extension for
 th1520
Message-ID: <20231213-placate-flashily-fa1032e5fbbe@spud>
References: <20231213070301.1684751-1-peterlin@andestech.com>
 <20231213070301.1684751-15-peterlin@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20231213070301.1684751-15-peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_072410_881763_3AD7C1DD 
X-CRM114-Status: GOOD (  14.16  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: multipart/mixed; boundary="===============4327831960587618082=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4327831960587618082==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5R35S9X3begUNP/4"
Content-Disposition: inline


--5R35S9X3begUNP/4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 03:02:59PM +0800, Yu Chien Peter Lin wrote:
> xtheadpmu stands for T-Head Performance Monitor Unit extension.
> Based on the added T-Head PMU ISA string, the SBI PMU driver
> will make use of the non-standard irq source.
>=20
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
> Changes v4 -> v5:
>   - New patch
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/=
thead/th1520.dtsi
> index ba4d2c673ac8..2dad2b22824a 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -22,7 +22,7 @@ c910_0: cpu@0 {
>  			riscv,isa =3D "rv64imafdc";
>  			riscv,isa-base =3D "rv64i";
>  			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", "zic=
sr",
> -					       "zifencei", "zihpm";
> +					       "zifencei", "zihpm", "xtheadpmu";
>  			reg =3D <0>;
>  			i-cache-block-size =3D <64>;
>  			i-cache-size =3D <65536>;
> @@ -46,7 +46,7 @@ c910_1: cpu@1 {
>  			riscv,isa =3D "rv64imafdc";
>  			riscv,isa-base =3D "rv64i";
>  			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", "zic=
sr",
> -					       "zifencei", "zihpm";
> +					       "zifencei", "zihpm", "xtheadpmu";
>  			reg =3D <1>;
>  			i-cache-block-size =3D <64>;
>  			i-cache-size =3D <65536>;
> @@ -70,7 +70,7 @@ c910_2: cpu@2 {
>  			riscv,isa =3D "rv64imafdc";
>  			riscv,isa-base =3D "rv64i";
>  			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", "zic=
sr",
> -					       "zifencei", "zihpm";
> +					       "zifencei", "zihpm", "xtheadpmu";
>  			reg =3D <2>;
>  			i-cache-block-size =3D <64>;
>  			i-cache-size =3D <65536>;
> @@ -94,7 +94,7 @@ c910_3: cpu@3 {
>  			riscv,isa =3D "rv64imafdc";
>  			riscv,isa-base =3D "rv64i";
>  			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", "zic=
sr",
> -					       "zifencei", "zihpm";
> +					       "zifencei", "zihpm", "xtheadpmu";
>  			reg =3D <3>;
>  			i-cache-block-size =3D <64>;
>  			i-cache-size =3D <65536>;
> --=20
> 2.34.1
>=20

--5R35S9X3begUNP/4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXnMjgAKCRB4tDGHoIJi
0v2NAP4zNu9pr4WPo9WN/ELqPU2GWRrlI7mWHne1++rLjDRSLwD8Da4c43TnGhZq
l90y1Ur6ue8V2btuBqhGss/ahqCyhQs=
=CibF
-----END PGP SIGNATURE-----

--5R35S9X3begUNP/4--


--===============4327831960587618082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4327831960587618082==--

