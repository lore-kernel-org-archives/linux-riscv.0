Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9CDC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 15:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cTIEGwttZZZn7Woo897lCRy2QqQV10CMTkG1BiEkDHY=; b=Bg7RGdp+b7FeLfKe2Z47N8+ckW
	beDss11At/zfKYuio1Q/CpjQnHqXIASGCkJVwGUzi4i1O5J3A7Eiuc+c9ULi3/wyexE218Qao0ojG
	BMvqb45puwYqsCK2kNkKnsMZ8W+Kn1iEkoWwubpd0pMuRU58MgEILk/YuhXFddmRiSBjbztsmmU6D
	VDfxXrRvMqV357ki7Kz9bOlsLDo2uziIXPy6EFgceYrN4WrnTz9DgJ7MCS2hnf27ybZGWP8rzcR8R
	Gh+fIKP5kx95ImbLOoWNfBiVXoyh/283B9Uz4bF6xwQYzZ2pwh6NNjBqQ/dy6fcX3HTCdfoyDroY0
	R/QA2FJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD5Ro-009zlM-3s; Wed, 04 Jan 2023 15:12:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD3pj-009JY3-7M
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 13:29:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4CDB36120A;
	Wed,  4 Jan 2023 13:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09798C433EF;
	Wed,  4 Jan 2023 13:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672838969;
	bh=HwageEAr9XpD8+aQ2SGxy4GEG5iMZorrFhBrZljHxd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G4tIO1zmiODIFhCQrWdogP8SV1bpk/8DqnPTgQsw0mOS/oS8f3SQrNY2zS+9/J90g
	 4MmpFFrO+E65KZkXLycyR8oU/lqKM9JFlsKOJT4zn0ogOaNqWw5lBOm9NrXiZ2u8E1
	 MTr7HOwMHQz3EdAVlEU7dtaVD2OxVPRVxHzvmYn4lmvZbG16trDBnJgFU9xIEZMuuE
	 U035esgUM+BULzwi+OM7GzQj1PSiqtn1ze9PJz27uNxVK0KgerkIUD2OMYFbkU2EUt
	 Whu8yci1VtB0VxHZzdsqNzBmFDV/i1w6hUgRjgqnd0riHNYBi8eyYiKAKdCRjsHHQy
	 iL+I+5se1bcIQ==
Date: Wed, 4 Jan 2023 13:29:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>, palmer@dabbelt.com
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
	ajones@ventanamicro.com, Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH] RISC-V: fix compile error from decuplicated
 __ALTERNATIVE_CFG_2
Message-ID: <Y7V/NZdDf4TpPBh9@spud>
References: <20230103214228.841297-1-heiko@sntech.de>
MIME-Version: 1.0
In-Reply-To: <20230103214228.841297-1-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_052932_057242_9080F57F 
X-CRM114-Status: GOOD (  27.86  )
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
Content-Type: multipart/mixed; boundary="===============6640134061640814729=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6640134061640814729==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1iRR16OAeJN5WFD0"
Content-Disposition: inline


--1iRR16OAeJN5WFD0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 03, 2023 at 10:42:28PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>

> RISC-V: fix compile error from decuplicated __ALTERNATIVE_CFG_2

Hey Heiko/Palmer,

Was a little hard to tell from Drew's mail if he was objecting to this
variant of the patch, but FWIW s/decup/dedup/ if this gets applied
as-is.

Thanks,
Conor.

> On the non-assembler-side wrapping alternative-macros inside other macros
> to prevent duplication of code works, as the end result will just be a
> string that gets fed to the asm instruction.
>=20
> In real assembler code, wrapping .macro blocks inside other .macro blocks
> brings more restrictions on usage and the optimization done by
> commit 2ba8c7dc71c0 ("riscv: Don't duplicate __ALTERNATIVE_CFG in __ALTER=
NATIVE_CFG_2")
> results in a compile error like:
>=20
> ../arch/riscv/lib/strcmp.S: Assembler messages:
> ../arch/riscv/lib/strcmp.S:15: Error: too many positional arguments
> ../arch/riscv/lib/strcmp.S:15: Error: backward ref to unknown label "886:"
> ../arch/riscv/lib/strcmp.S:15: Error: backward ref to unknown label "887:"
> ../arch/riscv/lib/strcmp.S:15: Error: backward ref to unknown label "886:"
> ../arch/riscv/lib/strcmp.S:15: Error: backward ref to unknown label "887:"
> ../arch/riscv/lib/strcmp.S:15: Error: backward ref to unknown label "886:"
> ../arch/riscv/lib/strcmp.S:15: Error: attempt to move .org backwards
>=20
> Going back to the original code for the non-assembler-part makes that
> code work again. So this reverts the #ifdef ASSEMBLY part of that commit
> to the previous variant with duplicated base.
>=20
> Fixes: 2ba8c7dc71c0 ("riscv: Don't duplicate __ALTERNATIVE_CFG in __ALTER=
NATIVE_CFG_2")
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
> I was of two minds about either to revert the full patch, or doing just
> this partial one for the ASSEMBLY part. I did go with this variant, as I
> still like the idea of deduplicating as much as possible :-)
>=20
>  arch/riscv/include/asm/alternative-macros.h | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/inc=
lude/asm/alternative-macros.h
> index 7226e2462584..e7bdb2a510a4 100644
> --- a/arch/riscv/include/asm/alternative-macros.h
> +++ b/arch/riscv/include/asm/alternative-macros.h
> @@ -44,9 +44,20 @@
>  	ALT_NEW_CONTENT \vendor_id, \errata_id, \enable, \new_c
>  .endm
> =20
> +/*
> + * Using ALTERNATIVE_CFG inside ALTERNATIVE_CFG_2 results in compile err=
ors.
> + * So the common code needs to stay duplicated.
> + */
>  .macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enabl=
e_1,	\
>  				new_c_2, vendor_id_2, errata_id_2, enable_2
> -	ALTERNATIVE_CFG \old_c, \new_c_1, \vendor_id_1, \errata_id_1, \enable_1
> +886 :
> +	.option push
> +	.option norvc
> +	.option norelax
> +	\old_c
> +	.option pop
> +887 :
> +	ALT_NEW_CONTENT \vendor_id_1, \errata_id_1, \enable_1, \new_c_1
>  	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
>  .endm
> =20
> --=20
> 2.35.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--1iRR16OAeJN5WFD0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7V/NQAKCRB4tDGHoIJi
0m2qAQD5TeRJ5EeTyceYmZeCCHzncqvUiAWdCtjtr/klLEScVgEAw9NVZszJVaRi
A1Tz/y9FlaHKbLDqYwh8Rwk928qF0gU=
=xHYR
-----END PGP SIGNATURE-----

--1iRR16OAeJN5WFD0--


--===============6640134061640814729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6640134061640814729==--

