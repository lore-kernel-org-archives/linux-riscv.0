Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26385C4707B
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 11:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXBbk3olVMEdrzQMg/AWFDrYgWdbes4DIeLFpdd8Y3A=; b=MWWlbx6ThxpEBvbmYz+rneXNZW
	Et4bwDS11b699F8reJGtp9TgmHGh3DEe1Tw4hsa1kgZ3cUrUTvMjKPyA7PVmb8wsQcML0JZUhFX5f
	vQdjV44hETLzDVX50GBFmaDR/3FL0nqW5ti0i1y1zv0wY9gtGERYnNu+f9qrk4kUK+Qx7XHXT7xIS
	gT4JUCvPEyMwpWEkI1H2aOfHzYfNqn0O4jQv8kN6en5vDzwDyD4/JAiyDlXysaPV+p50a//koE/9j
	JO01oLilCZiGlvaRhD37+sYrFAGsC2QoLlbToZwYSg8txovHGxY5QRcN465OAwceTTftpoVUm5rIg
	nmNceieQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNWny-00BL8i-1H;
	Wed, 10 Jan 2024 11:31:30 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNWnw-00BL6X-1P
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 11:31:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 03C4FB81CBE;
	Wed, 10 Jan 2024 11:31:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC577C433C7;
	Wed, 10 Jan 2024 11:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704886286;
	bh=YijeE4lMHSCVvcttYBU3SInp/YKSJPvaHdxLhi+JtYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pcvTS9liGZeeFspyq8/b0JP1ZkBzGDTEnjvFv15DiD0vtEfUNzgIeodJnmxMDN8U3
	 rpYqy5NlhOXHJU6Ik3NTqDlmO+slV461IW+8mVSp5niGHKBvMSktqvxS2hqTG83yYp
	 Wu/D1yXDI70WeKACfCWat8Rc4SdYV0mpTR0xCGPKImGfTcHj2Y6tFGEaTZQUnbD525
	 uRQjZAKcoRiV+ip19HJhkNyUEJ0ni65fbN8/DTiGHVpsPeF/ooL2i+EY8LSQkQ9a0k
	 3it3s8ZktOm2N2mV9Pa89bDBR/sX1N7OHYVkGk2rF5mGFQ1+pmEtAuLffIoVycpSGq
	 1FSG1BXbJ96ew==
Date: Wed, 10 Jan 2024 11:31:21 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robbin Ehn <rehn@rivosinc.com>,
	Gianluca Guida <gianluca@rivosinc.com>
Subject: Re: [PATCH v2 4/6] riscv: add ISA extension parsing for Zacas
Message-ID: <20240110-creed-sturdily-c93c15fc6549@spud>
References: <20231220155723.684081-1-cleger@rivosinc.com>
 <20231220155723.684081-5-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20231220155723.684081-5-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_033128_627357_F262D5ED 
X-CRM114-Status: GOOD (  15.11  )
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
Content-Type: multipart/mixed; boundary="===============3535522622767075264=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3535522622767075264==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ltx+3bcvQMB0flo+"
Content-Disposition: inline


--ltx+3bcvQMB0flo+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 04:57:20PM +0100, Cl=E9ment L=E9ger wrote:
> Add parsing for Zacas ISA extension which was ratified recently in the
> riscv-zacas manual.
>=20
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  arch/riscv/include/asm/hwcap.h | 1 +
>  arch/riscv/kernel/cpufeature.c | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index 3b31efe2f716..34f86424d743 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -85,6 +85,7 @@
>  #define RISCV_ISA_EXT_ZVFHMIN		70
>  #define RISCV_ISA_EXT_ZFA		71
>  #define RISCV_ISA_EXT_ZTSO		72
> +#define RISCV_ISA_EXT_ZACAS		73
> =20
>  #define RISCV_ISA_EXT_MAX		128
>  #define RISCV_ISA_EXT_INVALID		U32_MAX
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 3eb48a0eecb3..9a9d915b5bb2 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -259,6 +259,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA(zihintntl, RISCV_ISA_EXT_ZIHINTNTL),
>  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>  	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
> +	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
>  	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
>  	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
>  	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
> --=20
> 2.43.0
>=20

--ltx+3bcvQMB0flo+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZZ6ACQAKCRB4tDGHoIJi
0v55AQDZdKqZq0LPpzAGZXePq06kU+fz6HskHPlQ+h2crRlRAwEAsHn72UEtafAE
4seP9ykxgZVOQtsIOdfyUSSVCueHwwA=
=imzt
-----END PGP SIGNATURE-----

--ltx+3bcvQMB0flo+--


--===============3535522622767075264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3535522622767075264==--

