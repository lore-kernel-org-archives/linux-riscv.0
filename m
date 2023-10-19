Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096B4CDB465
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 16:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPlidMvQYw/l+3Bk04DRkJNiUkdngIosRV2xDojr34w=; b=4Ikpxl97HesP11UyxftL5s4sn4
	CBcluSGi8vUPWutuaEJYS3j9AFBP0exgtVNmhXEXmoMCdtP1MMUc008Khck/czD7UGURE8Rp1f6jh
	iSSpCTy/oVbDZLLaW4cG1kqNBtpzZFZg3rmcumPxeBBD+wd508lox+Uuux2Q/b75DD6501QWBuKad
	8I9vYjcoBuX/ipXUMszyGE2Homx7dMgaNI1b7xreVg/MBt3lUW5AyDThJKQ1jHxtGwQG8elAD7wUX
	qRZBZDK+1mUNx5K9252XoML3fTp0EpCYZ+D+809yEuxx09rDgEqVIIduAZy5Bv1UHuURdfHaqSpwB
	v8rUYYmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtVTh-000HDc-2R;
	Thu, 19 Oct 2023 16:02:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtVTe-000HCh-1W;
	Thu, 19 Oct 2023 16:02:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A08426150E;
	Thu, 19 Oct 2023 16:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30FCC433C7;
	Thu, 19 Oct 2023 16:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697731345;
	bh=yZXzCmRk3ufriSIQXgt6TeP6axLbf0VDHMcw/aRKvKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ha4MIUcOWDM7KryrnXdqTqRki9LFrT+ZiU8klxqgx9E5zJ2tEPgOkSmjU9KM8sV6v
	 EYu9Qdi7wK1elAyP6K0JEc4nff0FHIxl1+P8YXxwGgnOuMBqMCBJJ6sRwBKOCkItTe
	 GN0G6KNB47iwp0RvTWKHSK6uVOR2+pmvwWyD3GuSo38wCRzNdvvxLaYFPB+ZhW7Z4K
	 vpbT0QbhZ8q9/4GVzGiR34VkhGulJK96eAP92C9mfEKGRNq9jxiJws+HCaIJLTarxB
	 sBtQlK7pQqMfhzLI9MKpMpCW3GjCvgXepBAMja6QBjf+s7nwP4eNBfSC93WR5UZ9VG
	 wXmqb6peDMoYw==
Date: Thu, 19 Oct 2023 17:02:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Yu Chien Peter Lin <peterlin@andestech.com>
Subject: Re: [RFC PATCH v2 08/10] perf: RISC-V: Introduce Andes PMU for perf
 event sampling
Message-ID: <20231019-daybed-preschool-8663d5a86798@spud>
References: <20231019140156.3660000-1-peterlin@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20231019140156.3660000-1-peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_090226_601141_C0D44E71 
X-CRM114-Status: GOOD (  17.71  )
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
Cc: mark.rutland@arm.com, heiko@sntech.de, atishp@atishpatra.org, conor.dooley@microchip.com, jszhang@kernel.org, linux-riscv@lists.infradead.org, will@kernel.org, anup@brainfault.org, dminus@andestech.com, dylan@andestech.com, ajones@ventanamicro.com, aou@eecs.berkeley.edu, locus84@andestech.com, prabhakar.mahadev-lad.rj@bp.renesas.com, tim609@andestech.com, paul.walmsley@sifive.com, linux-arm-kernel@lists.infradead.org, Leo Yu-Chi Liang <ycliang@andestech.com>, linux-kernel@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com
Content-Type: multipart/mixed; boundary="===============5858093493999720646=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5858093493999720646==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x6otgCaD773VMsNY"
Content-Disposition: inline


--x6otgCaD773VMsNY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 10:01:56PM +0800, Yu Chien Peter Lin wrote:
> The Andes PMU extension provides the same mechanism as Sscofpmf,
> allowing us to reuse the SBI PMU driver to support event sampling
> and mode filtering.
>=20
> To make use of this custom PMU extension, "xandespmu" needs
> to be appended to the riscv,isa-extensions for each cpu node
> in device-tree, and enable CONFIG_ANDES_CUSTOM_PMU.
>=20
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Reviewed-by: Charles Ci-Jyun Wu <dminus@andestech.com>
> Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> Co-developed-by: Locus Wei-Han Chen <locus84@andestech.com>
> Signed-off-by: Locus Wei-Han Chen <locus84@andestech.com>
> ---
> Changes v1 -> v2:
>   - New patch
> ---
>  arch/riscv/include/asm/hwcap.h |  1 +
>  arch/riscv/kernel/cpufeature.c |  1 +
>  drivers/perf/Kconfig           | 14 ++++++++++++++
>  drivers/perf/riscv_pmu_sbi.c   | 35 +++++++++++++++++++++++++++++-----
>  4 files changed, 46 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index d3082391c901..eecfe95d5050 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -59,6 +59,7 @@
>  #define RISCV_ISA_EXT_ZIFENCEI		41
>  #define RISCV_ISA_EXT_ZIHPM		42
>  #define RISCV_ISA_EXT_XTHEADPMU		43
> +#define RISCV_ISA_EXT_XANDESPMU		44
> =20
>  #define RISCV_ISA_EXT_MAX		64
> =20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 4a3fb017026c..a8e71c6dfb3e 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -182,6 +182,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>  	__RISCV_ISA_EXT_DATA(xtheadpmu, RISCV_ISA_EXT_XTHEADPMU),
> +	__RISCV_ISA_EXT_DATA(xandespmu, RISCV_ISA_EXT_XANDESPMU),

This does not following the ordering convention (see the comment above
this datastructure) and is not documented in the dt-binding AFAICT.

Cheers,
Conor.

--x6otgCaD773VMsNY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTFTCgAKCRB4tDGHoIJi
0nKIAP0UYudx+3t/W6mnFhUaOfIabhcVo8jVyLwKpJExRKvqSQEA5xL0ZAdqpAiu
Ivu2MDucdOVHqs2n8o6sWhz+K4N3UAY=
=k5/I
-----END PGP SIGNATURE-----

--x6otgCaD773VMsNY--


--===============5858093493999720646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5858093493999720646==--

