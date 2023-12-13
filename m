Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05335C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 15:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHEPp0Q0bBl7XBSP8pMZYhIVXrpWMY7Sw+Zj9CiC4AA=; b=HdR7oRc7JxQFKTx4ODgKJ5jqWB
	BuxT5gLfPfMnD8vm4T2CSto2LEAMq75dOCsk9zhKyHz25ZpHoLpMA8nWrh+lohUwtvpnt1AaP2gLc
	ymgurnCCmrH9/rSRcbjgjyj83Xs7Ga/gEhjPjzPObcw1xOpq9aBOpPN0an1iQBfVfwHq7ZyCrFH6h
	NffCe35myzF6/lhrUxvHfoHUSRt/gUgHEuh7mLryB51va0w9kK/M4jekU/RwInE3GcSXqoM4eITo4
	5AQ+VwC11RVWeWTaB/iKVi2ZuzeNmlrkfa5w/egZ3/0qp/YExqy6AxJAHXXwCoMZpdOX2Zv6vVePa
	ffQToqEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDR5Q-00FByI-12;
	Wed, 13 Dec 2023 15:23:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDR5M-00FBxM-35;
	Wed, 13 Dec 2023 15:23:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4918E61C5E;
	Wed, 13 Dec 2023 15:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E72DC433C8;
	Wed, 13 Dec 2023 15:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702481024;
	bh=EFRc6UVTwIWenNtxGxnM8RzMypWh/l2lfE9FSSBCHws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VUOYHFHIjy03kSSFNFMEdc2Djz773PL8oreL5RyNIuYOHDRkJuFvdw8mg1DB1urzk
	 olaPsMkRQJ38qKNEBZk3H5Nn/KZdRhloMDP7ejcvz9GJnYjmNaOejGWC4z6J/+kroN
	 qUo51gHGDFKlPcaS1yljqVA/n0OhA0ammjI6es/zfSEKpDYCy3Yw/vAjatGVIhJHzv
	 m5Gu3JMAjsxxxyP+Vq8xmO5QQl3HfRRGDBsd4XnBMuP+6qBNuyAiBbbjdrH5okn6OQ
	 YIVpVask+OOTPMuXjwskwXHiugCKSVTAwtRu945HyoCGJ16Vgv0RG/5BxwKN/OfADF
	 3gFfNW0BRsdRg==
Date: Wed, 13 Dec 2023 15:23:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Yu Chien Peter Lin <peterlin@andestech.com>
Subject: Re: [PATCH v5 12/16] riscv: dts: sophgo: Add T-Head PMU extension
 for cv1800b
Message-ID: <20231213-creatable-skintight-be6749ec63e5@spud>
References: <20231213070301.1684751-1-peterlin@andestech.com>
 <20231213070301.1684751-13-peterlin@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20231213070301.1684751-13-peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_072345_088667_163D31D1 
X-CRM114-Status: GOOD (  14.77  )
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
Content-Type: multipart/mixed; boundary="===============2680216183077777676=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2680216183077777676==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Jn6e/Uvtr8zl2RKI"
Content-Disposition: inline


--Jn6e/Uvtr8zl2RKI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 03:02:57PM +0800, Yu Chien Peter Lin wrote:
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
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dt=
s/sophgo/cv1800b.dtsi
> index aec6401a467b..8c0143f0a01b 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> @@ -29,7 +29,7 @@ cpu0: cpu@0 {
>  			riscv,isa =3D "rv64imafdc";
>  			riscv,isa-base =3D "rv64i";
>  			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", "zic=
sr",
> -					       "zifencei", "zihpm";
> +					       "zifencei", "zihpm", "xtheadpmu";
> =20
>  			cpu0_intc: interrupt-controller {
>  				compatible =3D "riscv,cpu-intc";
> --=20
> 2.34.1
>=20

--Jn6e/Uvtr8zl2RKI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXnMXwAKCRB4tDGHoIJi
0nfMAQD+JdQJ/3wj3stiTH2LRo8GYWgrPUpFyuVFHlior4g4aQD/bEX0chKiIaFn
EaPiDpwt8shNTKdrqX6XtyHtp/yDoQg=
=NpnV
-----END PGP SIGNATURE-----

--Jn6e/Uvtr8zl2RKI--


--===============2680216183077777676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2680216183077777676==--

