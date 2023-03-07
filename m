Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44547C6FA99
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 21:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JtoadouQZZBOYvY48sRDMfYiiHUCyeXXWp3tVQZmnDw=; b=BZ+EcE/Ipetn8iJ+QRkYAawCOK
	LNbRc1ZcNV6ia/op9F/qEORC2nXG04TU8YDIR+Ef45GnhE4pXGbdllsQXMnDemJ7qfMVhfdfghC6s
	JMlnxYtYTTjZy7xnDKXXjhOqS2VC4RIDIop8bWnbhMSo3hKfi6O84jFaiNF9dBtObrUZ+/x3yAYGW
	lYFEFzxuiBP/CGNwu9B+kQz97LnTOD9y2pbinkuMIi7xpAg3/PjMfMSL+fcdpbN6fHV/MBOk5r74G
	MWzGkcsta5XeHeqxR/8zkkU1FylQWchFvUikEKQiGdvwDeESQK1N30wK18bFH2S7NrN39QhuTbk3G
	3X1VXFxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZeuX-002VlY-9N; Tue, 07 Mar 2023 21:31:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZeuV-002Vki-0u
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 21:31:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5DEEB61567;
	Tue,  7 Mar 2023 21:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55B9C433D2;
	Tue,  7 Mar 2023 21:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678224709;
	bh=XJoWJjOjUesnzXVQnA9D7xje2G0OktODWHP8qCs7gMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VL3eZsS+CCO8EknlbxQ7AOquiKpGtwnIMJOso/62ng/w9tojZZEWwj2ywyuLRs5q1
	 knTupynbQa3CnJ/R0E9B5IFqbm0aEjKHS82tb3qYuEz5FVu1qaJwLIJcZloO5fRmV2
	 Qro0nqsDKqcdPdJXLor0vXfEubvxl4xPpBlFaw5+jO20EXkZsFzzCV8pLcf4GN4gOk
	 8Fjyyi9n9o1CuXIZDgYx3ZJzSw2o6A9r5PVMcffGhObiR/Wuap2GVIjWLBir4QSVGC
	 t9FWipwj6fCnrQGtUxSeLQpjMnU1rb6ma3yRziaCGbNhoP+LPZwsK/FKwOhgtyMnkE
	 mVHCLl8y8ZU5w==
Date: Tue, 7 Mar 2023 21:31:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, heiko.stuebner@vrull.eu,
	conor.dooley@microchip.com, ajones@ventanamicro.com
Subject: Re: [PATCH 1/2] riscv: alternatives: add 3-config alternative set
Message-ID: <d22da238-9f7a-420b-b02a-20ccee20eff4@spud>
References: <20230307205834.1426289-1-ben.dooks@codethink.co.uk>
 <20230307205834.1426289-2-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
In-Reply-To: <20230307205834.1426289-2-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_133151_161888_7C42030D 
X-CRM114-Status: GOOD (  17.77  )
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
Content-Type: multipart/mixed; boundary="===============4345622962631913523=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4345622962631913523==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y8JR232RJpE2o5oK"
Content-Disposition: inline


--Y8JR232RJpE2o5oK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Ben,

On Tue, Mar 07, 2023 at 08:58:33PM +0000, Ben Dooks wrote:
> Add a 3-config alternative macro set for cases where there are
> three different choices for a given erratum. This will be used
> when we come to patch the issues with SVPBMT and ZICBOM.
>=20
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  arch/riscv/include/asm/alternative-macros.h | 38 +++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/inc=
lude/asm/alternative-macros.h
> index 51c6867e02f3..8c74b00d707c 100644
> --- a/arch/riscv/include/asm/alternative-macros.h
> +++ b/arch/riscv/include/asm/alternative-macros.h
> @@ -50,8 +50,18 @@
>  	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
>  .endm
> =20
> +.macro ALTERNATIVE_CFG_3 old_c, new_c_1, vendor_id_1, errata_id_1, enabl=
e_1,	\
> +				new_c_2, vendor_id_2, errata_id_2, enable_2,	\
> +				new_c_3, vendor_id_3, errata_id_3, enable_3
> +	ALTERNATIVE_CFG "\old_c", "\new_c_1", \vendor_id_1, \errata_id_1, \enab=
le_1
> +	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
> +	ALT_NEW_CONTENT \vendor_id_3, \errata_id_3, \enable_3, \new_c_3

A matter of opinion maybe, but there was a previous ALTERNATIVE_CFG_3
posting that was implemented using ALTERNATIVE_CFG_2 that, to me, is
easier to grok:
https://lore.kernel.org/linux-riscv/20221212115505.36770-2-prabhakar.mahade=
v-lad.rj@bp.renesas.com/
It's certainly an easier pattern to replicate for the inevitable
ALTERNATIVE_CFG_4,5,6,7 etc.

I'm not super bothered either way, but worth considering I think.

Cheers,
Conor.

> +.endm
> +
> +

btw, here & further down in the patch there's some instances of double
newlines that automation is gonna whinge about.

>  #define __ALTERNATIVE_CFG(...)		ALTERNATIVE_CFG __VA_ARGS__
>  #define __ALTERNATIVE_CFG_2(...)	ALTERNATIVE_CFG_2 __VA_ARGS__
> +#define __ALTERNATIVE_CFG_3(...)	ALTERNATIVE_CFG_3 __VA_ARGS__
> =20
>  #else /* !__ASSEMBLY__ */
> =20
> @@ -98,6 +108,13 @@
>  	__ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1)	\
>  	ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)
> =20
> +#define __ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, en=
able_1,	\
> +				   new_c_2, vendor_id_2, errata_id_2, enable_2, \
> +				   new_c_3, vendor_id_3, errata_id_3, enable_3)	\
> +	__ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1)	\
> +	ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)		\
> +	ALT_NEW_CONTENT(vendor_id_3, errata_id_3, enable_3, new_c_3)
> +=09
>  #endif /* __ASSEMBLY__ */
> =20
>  #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k)	\
> @@ -108,6 +125,13 @@
>  	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLE=
D(CONFIG_k_1),	\
>  				   new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2))
> =20
  ^ there's also trailing whitespace here that git am complains about.

> +#define _ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, CON=
FIG_k_1,		\
> +				  new_c_2, vendor_id_2, errata_id_2, CONFIG_k_2,		\
> +				  new_c_3, vendor_id_3, errata_id_3, CONFIG_k_3)		\
> +	__ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLE=
D(CONFIG_k_1),	\
> +				   new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2),   \
> +				   new_c_3, vendor_id_3, errata_id_3, IS_ENABLED(CONFIG_k_3))
> +=09
>  #else /* CONFIG_RISCV_ALTERNATIVE */
>  #ifdef __ASSEMBLY__
> =20
> @@ -121,6 +145,9 @@
>  #define _ALTERNATIVE_CFG_2(old_c, ...)	\
>  	ALTERNATIVE_CFG old_c
> =20
  ^ and here too.

--Y8JR232RJpE2o5oK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAetQQAKCRB4tDGHoIJi
0vJ6AP9lO4rcV8fbCxjnBYQHAInyvMD0U6vnRjiO3XxVTwGkQQEAktyRM74GS/pE
IJWvPLjYiLPrbE4JyFNEcn3wKEK3OAs=
=eEWb
-----END PGP SIGNATURE-----

--Y8JR232RJpE2o5oK--


--===============4345622962631913523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4345622962631913523==--

