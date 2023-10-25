Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB53C07545
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 14:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CI1OCXpfmTizonK4d/wYjd1mYjWg6lPCvCLHqMVg564=; b=A/djlh/JebFgai7MV7Ggm2ESDb
	LL7T8kyNoTwRk0F+GIGPRELEW9pg8WcLcHUBIZMar6N/RLkDKoUXnZxPy7Dh5YVROngB2Qa5OCoHa
	LVsTKFhjvv6/1FOI3mdu9Ej1jeadxyFQCbKZd1A7tnJ2nbHzKLW1XKz0j7dZV2sXAj0BEuN4KlkBc
	2z0RwKsaKBKgWZRKIz11II4SRaoVttadl/zDpujNbsJaU5HolIRSD++EZULGoJryTBr410NYNT/lg
	e3m9rQrXXhs9vlbr2jJIyMpodXReMUNemhk079Xsv18l6qmPzG0a9+GhU0N9trJh9GkzsHPieoKSG
	3sJqmlAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qveca-00CULY-1Z;
	Wed, 25 Oct 2023 14:12:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvecW-00CUKC-1u
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 14:12:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 18A65B82F6C;
	Wed, 25 Oct 2023 14:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B295C433C7;
	Wed, 25 Oct 2023 14:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698243146;
	bh=q8F2mFd6CImLzNK99x7rHDG+F1bVa1gJCgNVAIBLG/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fa2CjzMmnPB1Vv5v/Pj+OQfsAWkGvN3dFH2tb5BEpfxZMBT11FWppbZPhXnuKKCAo
	 rEwTYJmjaj7cwFStsB0PBCQZq+Z0hV25Kz4qfJ9reXiVVSsJ0QapbtZ5PqK+1KzlT6
	 VkPg0YH1xriRN7GlydwW2Gv9QeuFIRKS7MM8cbWfz8z79Z9M05A+AyiFLt2SF6Wy94
	 ccqqFHYWiDwlX4OKAccp5W/zFZ3NKn1xh7BCXkrfw1KE8E3i64YortLQocPE0s6kPI
	 8bE8GX0n+FJuim5VtjYXs25em/+oaM4oL2gAsQYsaPtanJ5Qk0sB1pjQD0JWas6ru7
	 gLwz9f17C1NVA==
Date: Wed, 25 Oct 2023 15:12:20 +0100
From: Conor Dooley <conor@kernel.org>
To: shravan chippa <shravan.chippa@microchip.com>
Cc: green.wan@sifive.com, vkoul@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, conor+dt@kernel.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	nagasuresh.relli@microchip.com, praveen.kumar@microchip.com
Subject: Re: [PATCH v3 4/4] riscv: dts: microchip: add specific compatible
 for mpfs' pdma
Message-ID: <20231025-pang-unstuffed-4d8bf48baf21@spud>
References: <20231025102251.3369472-1-shravan.chippa@microchip.com>
 <20231025102251.3369472-5-shravan.chippa@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20231025102251.3369472-5-shravan.chippa@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_071228_763672_C2606A3F 
X-CRM114-Status: GOOD (  14.21  )
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
Content-Type: multipart/mixed; boundary="===============6965522376757647503=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6965522376757647503==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qwZ+jMYzinWm1SqJ"
Content-Disposition: inline


--qwZ+jMYzinWm1SqJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 25, 2023 at 03:52:51PM +0530, shravan chippa wrote:
> From: Shravan Chippa <shravan.chippa@microchip.com>
>=20
> Add specific compatible for PolarFire SoC for The SiFive PDMA driver
>=20

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> ---
>  arch/riscv/boot/dts/microchip/mpfs.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dt=
s/microchip/mpfs.dtsi
> index 104504352e99..f43486e9a090 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> @@ -221,7 +221,7 @@ plic: interrupt-controller@c000000 {
>  		};
> =20
>  		pdma: dma-controller@3000000 {
> -			compatible =3D "sifive,fu540-c000-pdma", "sifive,pdma0";
> +			compatible =3D "microchip,mpfs-pdma", "sifive,pdma0";
>  			reg =3D <0x0 0x3000000 0x0 0x8000>;
>  			interrupt-parent =3D <&plic>;
>  			interrupts =3D <5 6>, <7 8>, <9 10>, <11 12>;
> --=20
> 2.34.1
>=20

--qwZ+jMYzinWm1SqJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTkiRAAKCRB4tDGHoIJi
0sEJAQCHzvvzlWORtnYlb+uw/EMYHDQckws0ffM81OhwMCFujAD/bvpu5fSldrSt
ZlX/mfkXv0hoIFwpIi4+lGF8Y7p/Jgw=
=ip81
-----END PGP SIGNATURE-----

--qwZ+jMYzinWm1SqJ--


--===============6965522376757647503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6965522376757647503==--

