Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16998E77184
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 18:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sopBsrQTqVJTz7HEGENmoRGwfI7qVleGdyKtMXWrwd8=; b=UdMYeTU37ugKaUawBcZHM2f0lV
	jKI6KVfUSUgnvTpkhkbu05KirJNCzQFo9e1l6JPE9aAYeNN2Wiz+QmTdYVj46FESXtx2JL2SMs1Fx
	VVoq+nz7jeYE6f4OQ+XGAd20NN3TVZUDv/FQRUyZ3dOoZeVltIF0CBvnOxyV6+m8RvDl6CvMQokxr
	hj818EFrYRmwNGljfzMLL3RuWFJmVZnRLPtEqi14SGVBvixsu9ShbAWSvQVfZEidkt1+CNHuA8i9x
	A9zS8ul/g6O+esPJIa1p7/+rRKMylT2krl3IxqsSxr4G46G/MaEA2KYAXrMDDcw7SfRovwTjyCOJm
	HLaFs4eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNcAZ-0000000EVox-2yoZ;
	Tue, 17 Dec 2024 18:19:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNcAX-0000000EVoK-39VZ
	for linux-riscv@lists.infradead.org;
	Tue, 17 Dec 2024 18:19:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4B2ABA40FA3;
	Tue, 17 Dec 2024 18:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E703C4CED3;
	Tue, 17 Dec 2024 18:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734459580;
	bh=zjTy9PBs8BSDM1TkG0RnyrT/0yguGM7/vr/qLKrQTkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qiYNZob8Ax8L07w3zPUx50m7fFlOxbbbRMUmalVLA5KBGu07rZWlzo8Oab2wphGl7
	 xPDMkjDVFdxFcYTMmsvqxBFdTW/RTGgrLqa5WH2r+8KrEghEqSjt2uhQoCwQK3nVDC
	 /+XR2GUNF4C+bQFAtdAbDaWyXMH9Sm2nffyRKHs/2MErB8+PwsgHgbtMjaqO/GJlE/
	 Ao6y+2rOJuXRM3G3kkCjWHDPObsFeTgXC3FI+y6KluojcL3oJLaAFvdft7ERX8vEpL
	 hSI6IIl/JiSbVIBLtt89SpXzjmDHwWM1MTusWCwnO2HGv+iUnfvzYIi8cOlJ79JbVi
	 JAaRArGrBeawQ==
Date: Tue, 17 Dec 2024 18:19:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, conor+dt@kernel.org,
	jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/4] riscv: sbi: vendorid_list: Add Microchip
 Technology to the vendor list
Message-ID: <20241217-jokester-sift-b37121e01c90@spud>
References: <20241217113134.3508333-1-valentina.fernandezalanis@microchip.com>
 <20241217113134.3508333-2-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20241217113134.3508333-2-valentina.fernandezalanis@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_101941_859976_BB955919 
X-CRM114-Status: GOOD (  12.49  )
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
Content-Type: multipart/mixed; boundary="===============4558733465265644038=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4558733465265644038==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YZciibEyPyM8v9fA"
Content-Disposition: inline


--YZciibEyPyM8v9fA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 11:31:31AM +0000, Valentina Fernandez wrote:
> Add Microchip Technology to the RISC-V vendor list.
>=20
> Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.c=
om>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  arch/riscv/include/asm/vendorid_list.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/=
asm/vendorid_list.h
> index 2f2bb0c84f9a..a5150cdf34d8 100644
> --- a/arch/riscv/include/asm/vendorid_list.h
> +++ b/arch/riscv/include/asm/vendorid_list.h
> @@ -6,6 +6,7 @@
>  #define ASM_VENDOR_LIST_H
> =20
>  #define ANDES_VENDOR_ID		0x31e
> +#define MICROCHIP_VENDOR_ID	0x029
>  #define SIFIVE_VENDOR_ID	0x489
>  #define THEAD_VENDOR_ID		0x5b7
> =20
> --=20
> 2.34.1
>=20

--YZciibEyPyM8v9fA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2HAuAAKCRB4tDGHoIJi
0hBGAQCPyVG132M5iB3YlvelNPQPD5CsGWjpcHNrXltseqFkaQD/Vill4S/cEaIZ
n4wyM5C0r8vQ3RvGkWdGEVSwACFEaQ8=
=KcMb
-----END PGP SIGNATURE-----

--YZciibEyPyM8v9fA--


--===============4558733465265644038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4558733465265644038==--

