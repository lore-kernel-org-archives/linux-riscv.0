Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04A4C27C4F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 14:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VNHWVl8wc/TyaeFM3OM1IUBQMTXgPskBUZRBNY1vY34=; b=2rgnVwZLLPeozUq7T38p7pgisA
	+pQs6u6VBDn/AImlmt7+aBag0kW5nHjxOpNYpvRrsPLYGwKtoBK+eVlo7miaoDE/j5TW9eIQfMCIY
	y4pXU4NtysDy0AsixwNjFk1nMWbEkl6nMHT94CZhO08HREgnuEnNWiR1PPRuxHqMi8rsedJJSNgz/
	ijPxditrIFBQOHq6Bd8nJ2/4kOLVzhGBcR/7PHv1Vv/yyMoAoGEP1oHpEj/FLSXlyp9xrJM7nAC95
	Mv5EhU2cemzSzSMx7+zojcDjdkT32aDw6SzWj/h9HtMmufa6nRKveDHkmyM/Vs1zzxr8EmACOFPt1
	UP6Jqnww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHlYk-0000000GxzC-41vg;
	Thu, 13 Jun 2024 14:36:14 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHlYi-0000000GxxT-0onq
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 14:36:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 189BDCE262E;
	Thu, 13 Jun 2024 14:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4141FC32786;
	Thu, 13 Jun 2024 14:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718289367;
	bh=7wnmI7TeP0WeiVAAxGMFZ1X0/xHdMvNM5Is10JfsQQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ltyFxSs01wKpY81IY1J3YZdqf+5LLaFA/jSLklfqk4FtGIgkp1xEd95Fg5ULZhSt/
	 VyrfeCXcKW2m/KsS8kUcgsniM3BH5EjUYh8eWdNjBgL9vhV/+98aREYEmXdc33CXvb
	 wUmPmg0w3dZFZw4bERwHHbmafeZx9eonN6Ksj0X0T0zAp6fYa1ikpokzQjtCFg9uLM
	 bpAMm2RJK3UAc4aZRL2HuZsFi/BdBepXZVdC1FH69KNy8Wl5XEKPKDudrdhda5zhy1
	 3H1cCYksPlDDT4RSNpY/25yepKhyyY3hv8ed/Iv610517KkqLA8KFGKhbpnS06hARH
	 Xt2xTho9jQwDA==
Date: Thu, 13 Jun 2024 15:36:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Message-ID: <20240613-luxury-marigold-d1c7099ab944@spud>
References: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
 <20240610-xtheadvector-v2-3-97a48613ad64@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240610-xtheadvector-v2-3-97a48613ad64@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_073612_512726_B2BD4935 
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
Content-Type: multipart/mixed; boundary="===============8443174663476707254=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8443174663476707254==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="P927rlnZ+YfGx1Bx"
Content-Disposition: inline


--P927rlnZ+YfGx1Bx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 03:56:40PM -0700, Charlie Jenkins wrote:
> The D1/D1s SoCs support xtheadvector so it can be included in the
> devicetree. Also include vlenb for the cpu.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/b=
oot/dts/allwinner/sun20i-d1s.dtsi
> index 64c3c2e6cbe0..6367112e614a 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -27,7 +27,8 @@ cpu0: cpu@0 {
>  			riscv,isa =3D "rv64imafdc";
>  			riscv,isa-base =3D "rv64i";
>  			riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", "zic=
sr",
> -					       "zifencei", "zihpm";
> +					       "zifencei", "zihpm", "xtheadvector";
> +			thead,vlenb =3D <128>;
>  			#cooling-cells =3D <2>;
> =20
>  			cpu0_intc: interrupt-controller {
>=20
> --=20
> 2.44.0
>=20

--P927rlnZ+YfGx1Bx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmsD0QAKCRB4tDGHoIJi
0savAP4lXMAN/lrY71frvXJaVaDKC7qZVjR7y/fNATh/HEaRnQEAr04KLzlaDWhh
9w9mRAzQd3WkOuRXmnk+DeCQb9Ll2Qo=
=Q6OS
-----END PGP SIGNATURE-----

--P927rlnZ+YfGx1Bx--


--===============8443174663476707254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8443174663476707254==--

