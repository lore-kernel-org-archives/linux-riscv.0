Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BD0C47422
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 22:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8PB3Eyfudjwk7eGCOtfLeGJfiq8dRHZAmc0hyqS8sM4=; b=M+xeiP5rB6OYePXMS73unUKAll
	PYNej24mcXpy42eVwaF1BsLUBnAc4VDjnHXmKWDo5icmQBNldPfqU35QW620ITGnjo0hOHX9n77wL
	w5f6YkzjVaskQ9UjkZXRuKRCQVLiAjUdbb5JP5qULWWtp9JuiJmVDmVLagKYjCfER5MY1hzExUftf
	YkJyQf79hZbMytAzKY2/NkCt8WYcKESEACrauikrZqNSmpnkOIw1L0C2sRVNlYok3c+3hw1LAuelB
	ZfGr4DAjBkYXrLo3XRnyxMrJnKwERzb3lS24PY/Gk0MgU7Q7JFeIgd+depHqdSQovukEba+7eLGbx
	lGDBG5kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQaWH-003xxo-2s;
	Thu, 18 Jan 2024 22:05:53 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQaWE-003xxS-2m
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jan 2024 22:05:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2E0A2CE1ADF;
	Thu, 18 Jan 2024 22:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F037FC433F1;
	Thu, 18 Jan 2024 22:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705615548;
	bh=Q+pX89EmEj04h50yCe1VL5XHOahd2MD8MrvKmiempYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CNbE/DSA1PztMn+pO4MdBoIICDaUBsbIzCzZ5Ac2UfyLf55lezcOOFY7ENy72YJpg
	 MhPRW9MlcVv7fNBgw8f79OkTk1f2hhznZ8mRS7I5NCTZRGNvj2y1PnpA+zat0ixpY/
	 sbc2viqRM4rc3odbhaV1BzoU4sBZInarilSrdEbWjZFc7tbpJetoB+mWJO0Q/tAbZI
	 UNWoim7wx/kNmm1Zm063ZwaptO0ZqPIWd/CKQhmdFfA+h+1WjdL+s4eqmhyBNlxuEX
	 /Jv6nGR599BKQcVdICb/tSbvW2QUlRMAEdpquDX94FkGKC2XeF01l2KIzUfCdYzYLL
	 24vWRWGr/YFHg==
Date: Thu, 18 Jan 2024 22:05:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: lib: Support csum on GCC <11
Message-ID: <20240118-museum-ample-11d649f95de8@spud>
References: <20240118-csum_remove_output_operands_asm_goto-v1-1-47c672bb9d4b@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240118-csum_remove_output_operands_asm_goto-v1-1-47c672bb9d4b@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_140551_272449_D41CAC06 
X-CRM114-Status: GOOD (  20.21  )
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
Content-Type: multipart/mixed; boundary="===============5254807180118039596=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5254807180118039596==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pl1prUg+ekIn2nNV"
Content-Disposition: inline


--pl1prUg+ekIn2nNV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 01:53:59PM -0800, Charlie Jenkins wrote:
> The OutputOperands field for asm goto statements is only supported
> starting from GCC 11. Split the asm goto to remove the use of this
> feature.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Fixes: a04c192eabfb ("riscv: Add checksum library")
> ---
> The OutputOperands field for asm goto statements is only supported
> starting from GCC 11. Split the asm goto to remove the use of this
> feature.

Maybe this is a super naive question, but is it possible to just not
use the custom csum code for gcc older than 11?

> ---
>  arch/riscv/lib/csum.c | 42 ++++++++++++++++++++++++++++++------------
>  1 file changed, 30 insertions(+), 12 deletions(-)
>=20
> diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
> index 06ce8e7250d9..23be289f52b6 100644
> --- a/arch/riscv/lib/csum.c
> +++ b/arch/riscv/lib/csum.c
> @@ -177,22 +177,35 @@ do_csum_with_alignment(const unsigned char *buff, i=
nt len)
>  				  : no_zbb);
> =20
>  #ifdef CONFIG_32BIT
> -		asm_volatile_goto(".option push			\n\
> +		/*
> +		 * OutputOperands in asm goto is not supported until GCC 11, so
> +		 * this asm has to be split to be compatible.
> +		 */
> +		asm (".option push				\n\
>  		.option arch,+zbb				\n\
>  			rori	%[fold_temp], %[csum], 16	\n\
>  			andi	%[offset], %[offset], 1		\n\
>  			add	%[csum], %[fold_temp], %[csum]	\n\
> -			beq	%[offset], zero, %l[end]	\n\
> -			rev8	%[csum], %[csum]		\n\
>  		.option pop"
>  			: [csum] "+r" (csum), [fold_temp] "=3D&r" (fold_temp)
> -			: [offset] "r" (offset)
> -			:
> -			: end);
> +			: [offset] "r" (offset));
> +
> +		if (offset =3D=3D 0)
> +			goto end;
> +
> +		asm (".option push				\n\
> +		.option arch, +zbb				\n\
> +			rev8	%[csum], %[csum]		\n\
> +		.option pop"
> +			: [csum] "+r" (csum));
> =20
>  		return (unsigned short)csum;
>  #else /* !CONFIG_32BIT */
> -		asm_volatile_goto(".option push			\n\
> +		/*
> +		 * OutputOperands in asm goto is not supported until GCC 11, so
> +		 * this asm has to be split to be compatible.
> +		 */
> +		asm (".option push				\n\
>  		.option arch,+zbb				\n\
>  			rori	%[fold_temp], %[csum], 32	\n\
>  			add	%[csum], %[fold_temp], %[csum]	\n\
> @@ -200,13 +213,18 @@ do_csum_with_alignment(const unsigned char *buff, i=
nt len)
>  			roriw	%[fold_temp], %[csum], 16	\n\
>  			addw	%[csum], %[fold_temp], %[csum]	\n\
>  			andi	%[offset], %[offset], 1		\n\
> -			beq	%[offset], zero, %l[end]	\n\
> -			rev8	%[csum], %[csum]		\n\
>  		.option pop"
>  			: [csum] "+r" (csum), [fold_temp] "=3D&r" (fold_temp)
> -			: [offset] "r" (offset)
> -			:
> -			: end);
> +			: [offset] "r" (offset));
> +
> +		if (offset =3D=3D 0)
> +			goto end;
> +
> +		asm (".option push				\n\
> +		.option arch, +zbb				\n\
> +			rev8	%[csum], %[csum]		\n\
> +		.option pop"
> +			: [csum] "+r" (csum));
> =20
>  		return (csum << 16) >> 48;
>  #endif /* !CONFIG_32BIT */
>=20
> ---
> base-commit: 080c4324fa5e81ff3780206a138223abfb57a68e
> change-id: 20240118-csum_remove_output_operands_asm_goto-49922c141ce7
> --=20
> - Charlie
>=20
>=20

--pl1prUg+ekIn2nNV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZamguAAKCRB4tDGHoIJi
0piAAP43AO2qeJIkMIMNCYDRVUHlOx4Fd4fKJBeaGX7Pc1EjlQD+Klh3LfS4rMLi
BXwU/T016C4F2KPCyItXgiwTbGy4SwU=
=Yi8l
-----END PGP SIGNATURE-----

--pl1prUg+ekIn2nNV--


--===============5254807180118039596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5254807180118039596==--

