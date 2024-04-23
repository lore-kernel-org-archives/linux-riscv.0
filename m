Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F732C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 16:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmmfIirD0oSYj8H/afDDr7RAoQpbyNihwNWSLhjz8Hw=; b=CqytPSRsnj1uWde8+9vESmGRt9
	BMk3yOGdOC86CADm1ylZ2uPWUvGoPb3/UynOqTp9OZ0+luJ/yfT9YlOnOsf509n2Bkj3DU/6zp8X1
	z5VnEs+XLKCBqHrExnnQw4Es+Gf3w7HqsQbwHCf8BT6SKDU6joAU96PWcgbh6YTfU+sO+I0XjQ5nE
	DUZ2UDtO41phbRYZBnNUR2PnlM/yGfJZmUabXtcWaqjGr+2Fl+0akDD1jTxud3GWpr03PGEhS6UGh
	HwsvNLIcgtix1PXV3+QkmbzpqgKwI3ZBtfn0bGlRkUBze6PJkzCYegl/iLA8kRnAwWTI4z7w7C9lf
	fWq3j3+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzJJs-00000000ocP-19Gb;
	Tue, 23 Apr 2024 16:48:36 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzJJo-00000000oaz-1Ysa;
	Tue, 23 Apr 2024 16:48:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 430D1CE1256;
	Tue, 23 Apr 2024 16:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2099AC116B1;
	Tue, 23 Apr 2024 16:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713890909;
	bh=dDcEPFI4Ualc1uLvugD6+grOLhPWeZRyR8kTPMNYs3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H0N9z2Dpb8WrHvqNLiT000UhV8Y+9krxRJtMDjYhIaBZP1030Bof/Sp/hOK16Vnyt
	 pbVCxC1D1O5/vA65C3BsscHOwlAvYg1UpOpQ3EVxyzDTLUE1ZM+lZ8cmZu3/NkS3Tw
	 xVOk1gKZBGsmyD84IVNwPtg+ESwZW+XFy+bMdvO5bjU1uLsENudLBOWWYEhZMMT8Fa
	 vyNNR8+roNhWc/HCa+cWfetSA9UjIquzJOhYsoF6WnUMrvgZez9qPfpY5616SRkjrl
	 L6wHTtaUP4o+WnWmTSYwHJWDswPA3+5pzcdxtnlLflvYjbQiJdjWqAwg5QkWxRyxD2
	 yBGwCrlwvy10w==
Date: Tue, 23 Apr 2024 17:48:24 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/5] riscv: add ISA extension parsing for Zimop
Message-ID: <20240423-juiciness-unethical-90ec18e4fabe@spud>
References: <20240404103254.1752834-1-cleger@rivosinc.com>
 <20240404103254.1752834-3-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240404103254.1752834-3-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_094832_943092_A25552B2 
X-CRM114-Status: GOOD (  14.50  )
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
Content-Type: multipart/mixed; boundary="===============2441926314579025699=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2441926314579025699==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Zc1JrpErq69EY9Ys"
Content-Disposition: inline


--Zc1JrpErq69EY9Ys
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 04, 2024 at 12:32:48PM +0200, Cl=E9ment L=E9ger wrote:
> Add parsing for Zimop ISA extension which was ratified in commit
> 58220614a5f of the riscv-isa-manual.
>=20
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  arch/riscv/include/asm/hwcap.h | 1 +
>  arch/riscv/kernel/cpufeature.c | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index e17d0078a651..543e3ea2da0e 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -81,6 +81,7 @@
>  #define RISCV_ISA_EXT_ZTSO		72
>  #define RISCV_ISA_EXT_ZACAS		73
>  #define RISCV_ISA_EXT_XANDESPMU		74
> +#define RISCV_ISA_EXT_ZIMOP		75
> =20
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> =20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 3ed2359eae35..115ba001f1bc 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -256,6 +256,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA(zihintntl, RISCV_ISA_EXT_ZIHINTNTL),
>  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>  	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
> +	__RISCV_ISA_EXT_DATA(zimop, RISCV_ISA_EXT_ZIMOP),
>  	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
>  	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
>  	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
> --=20
> 2.43.0
>=20

--Zc1JrpErq69EY9Ys
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZifmVwAKCRB4tDGHoIJi
0rtUAQCfFhskrVJaQGT4zQgAGIaJX6eQRM8RECwtSJ2o0cGu0gD+IKq0dbK1gZnO
+otlDf1x+J0DKBOQ9YLeg8J2xFWRTAk=
=AiuW
-----END PGP SIGNATURE-----

--Zc1JrpErq69EY9Ys--


--===============2441926314579025699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2441926314579025699==--

