Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3677FC352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 17:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JdwydnJoqObgbFvlQ5ZzxmfTO26zGl9YwEK+11X6Dis=; b=ZksOdwqEk2i/MwYVE5IhqI7Awf
	kVtSm60Dsac8gH4EA6lRULSJEObyHUztRfjtTTpn7Ji4uuI7AWJOEdzsAf4AphBPxZWizJD8oP/NM
	7KKwM2x1hC9sg4EumMNcWkoQjXe/fX6ctTedA2kNM7w562Z2r18mqG3dyrUW3SQ1dSAsgEniqbSu2
	1ncY7amjyp3bPAQzlwfnGB/cYeFPZTyFxeUILXvhG+uUdzfEzkVWzjlhL10Z6iFwXl3XNxWBxYYu0
	X/c4iGeV6c0StVPz0Fq7yEQxozqiG9YoVX1ReI+4OtRiozXe31AyqULgQBIh9fySnSEqq31WxzuHV
	sqkqXCKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2yg4-007nKJ-U2; Wed, 07 Dec 2022 17:57:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2yg1-007nF6-KU
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 17:57:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F1511B81E74;
	Wed,  7 Dec 2022 17:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF20C433D7;
	Wed,  7 Dec 2022 17:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670435866;
	bh=LhVnou7euGRoHnGynoXRarxeXUqTVVCmQs1M4k6YuEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mc+Ob3oeu9W2hO59ji1/bsUZkN2CwzAbxa4951Fk0kCyH+kSKlyGGX95WJUkHaJHZ
	 ABqo7g5q7lLiEhDJyL6CW5irLeZsD5mfkuQ7gmtINlnm2d3owbJSHaEU3kQ1gaTlRf
	 0TId8ORw/GgSPM8FHXiFlsiQY0MWaaidViA2jBxwi8/mtzHFTJwKLcKHuTll7htiP9
	 wlPpLSIyp7BEAwq460BolxOgChKD02wgYFK2S8FwAwJthvHD9wylcr3Yr4Wa/W74oI
	 Oc3JNWWWZHMJ+mGpBk0mH4t5TCh4X/D1pswNNb1CFWlRwKjPO+hGpD5AJXumWoxRMa
	 2HWtBmVWdJflg==
Date: Wed, 7 Dec 2022 17:57:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	prabhakar.csengg@gmail.com
Subject: Re: [PATCH v2 0/4] riscv: alternative-macros.h cleanups
Message-ID: <Y5DUFrAXGZOdz+CI@spud>
References: <20221129150053.50464-1-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20221129150053.50464-1-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_095749_988689_EA33AC0B 
X-CRM114-Status: GOOD (  27.28  )
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
Content-Type: multipart/mixed; boundary="===============1290561244350369296=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1290561244350369296==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ycZEJexJnhWkP7o3"
Content-Disposition: inline


--ycZEJexJnhWkP7o3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2022 at 04:00:49PM +0100, Andrew Jones wrote:
> This series is a collection of cleanups for alternative-macros.h with
> the main motivation being that adding new ALTERNATIVE_3, ALTERNATIVE_4,
> ... will be possible without lots of bloat. For example, adding
> ALTERNATIVE_3 should look something like the diff below and
> ALTERNATIVE_4 the same. This has really only been compile tested, as
> not all alternatives are used when quickly booting over QEMU, which
> I also did.
>=20
> Thanks,
> drew

I was trying to find the cover from patchwork - but it really hates this
diff for some reason and treats it like another patch... I dunno how you
would work around that, maybe put a -- line above the patch?

Anyways, what was going to say was that it'd be nice if you had the
inter-version changelog somewhere - especially for something touching
this neck of the woods. b4 diff to the rescue though, it is just the
missing \s from v1.

I'm kinda with Heiko in the "I'll leave the judgement on its viability
to others" camp, but I'm in favour of simplifying the process of adding
alternatives so:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/inc=
lude/asm/alternative-macros.h
> index 7226e2462584..be9a09313499 100644
> --- a/arch/riscv/include/asm/alternative-macros.h
> +++ b/arch/riscv/include/asm/alternative-macros.h
> @@ -50,8 +50,17 @@
>  	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
>  .endm
> =20
> +.macro ALTERNATIVE_CFG_3 old_c, new_c_1, vendor_id_1, errata_id_1, enabl=
e_1,		\
> +				new_c_2, vendor_id_2, errata_id_2, enable_2,		\
> +				new_c_3, vendor_id_3, errata_id_3, enable_3
> +	ALTERNATIVE_CFG_2 \old_c, \new_c_1, \vendor_id_1, \errata_id_1, \enable=
_1,	\
> +				  \new_c_2, \vendor_id_2, \errata_id_2, \enable_2
> +	ALT_NEW_CONTENT \vendor_id_3, \errata_id_3, \enable_3, \new_c_3
> +.endm
> +
>  #define __ALTERNATIVE_CFG(...)		ALTERNATIVE_CFG __VA_ARGS__
>  #define __ALTERNATIVE_CFG_2(...)	ALTERNATIVE_CFG_2 __VA_ARGS__
> +#define __ALTERNATIVE_CFG_3(...)	ALTERNATIVE_CFG_3 __VA_ARGS__
> =20
>  #else /* !__ASSEMBLY__ */
> =20
> @@ -98,6 +107,13 @@
>  	__ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1)	\
>  	ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)
> =20
> +#define __ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, en=
able_1,	\
> +				   new_c_2, vendor_id_2, errata_id_2, enable_2,	\
> +				   new_c_3, vendor_id_3, errata_id_3, enable_3)	\
> +	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,=
	\
> +				   new_c_2, vendor_id_2, errata_id_2, enable_2)	\
> +	ALT_NEW_CONTENT(vendor_id_3, errata_id_3, enable_3, new_c_3)
> +
>  #endif /* __ASSEMBLY__ */
> =20
>  #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k)	\
> @@ -108,6 +124,13 @@
>  	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLE=
D(CONFIG_k_1),	\
>  				   new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2))
> =20
> +#define _ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1,	errata_id_1, CON=
FIG_k_1,		\
> +				  new_c_2, vendor_id_2, errata_id_2, CONFIG_k_2,		\
> +				  new_c_3, vendor_id_3,	errata_id_3, CONFIG_k_3)		\
> +	__ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLE=
D(CONFIG_k_1),	\
> +				   new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2),	\
> +				   new_c_3, vendor_id_3, errata_id_3, IS_ENABLED(CONFIG_k_3))
> +
>  #else /* CONFIG_RISCV_ALTERNATIVE */
>  #ifdef __ASSEMBLY__
> =20
> @@ -121,6 +144,9 @@
>  #define _ALTERNATIVE_CFG_2(old_c, ...)	\
>  	ALTERNATIVE_CFG old_c
> =20
> +#define _ALTERNATIVE_CFG_3(old_c, ...)	\
> +	ALTERNATIVE_CFG old_c
> +
>  #else /* !__ASSEMBLY__ */
> =20
>  #define __ALTERNATIVE_CFG(old_c)	\
> @@ -132,6 +158,9 @@
>  #define _ALTERNATIVE_CFG_2(old_c, ...)	\
>  	__ALTERNATIVE_CFG(old_c)
> =20
> +#define _ALTERNATIVE_CFG_3(old_c, ...)	\
> +	__ALTERNATIVE_CFG(old_c)
> +
>  #endif /* __ASSEMBLY__ */
>  #endif /* CONFIG_RISCV_ALTERNATIVE */
> =20
> @@ -163,4 +192,11 @@
>  	_ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, errata_id_1=
, CONFIG_k_1,	\
>  					new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2)
> =20
> +#define ALTERNATIVE_3(old_content, new_content_1, vendor_id_1, errata_id=
_1, CONFIG_k_1,		\
> +				   new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2,		\
> +				   new_content_3, vendor_id_3, errata_id_3, CONFIG_k_3)		\
> +	_ALTERNATIVE_CFG_3(old_content, new_content_1, vendor_id_1, errata_id_1=
, CONFIG_k_1,	\
> +					new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2,	\
> +					new_content_3, vendor_id_3, errata_id_3, CONFIG_k_3)
> +
>  #endif
>=20
> Andrew Jones (4):
>   riscv: Don't duplicate __ALTERNATIVE_CFG in __ALTERNATIVE_CFG_2
>   riscv: alternatives: Don't name unused macro parameters
>   riscv: alternatives: Drop the underscores from the assembly macro
>     names
>   riscv: Don't duplicate _ALTERNATIVE_CFG* macros
>=20
>  arch/riscv/include/asm/alternative-macros.h | 99 +++++++--------------
>  1 file changed, 30 insertions(+), 69 deletions(-)
>=20
> --=20
> 2.38.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
>=20

--ycZEJexJnhWkP7o3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY5DUFgAKCRB4tDGHoIJi
0jdxAP9fVoHPWm2hgtW+jLq+tlTA3ifLJWolSohw96lOMFtZ1gEA/vGgnuNC/X5X
xjq4a7olcOlJLDFKjVdqsmpQc/tkfQU=
=7TG+
-----END PGP SIGNATURE-----

--ycZEJexJnhWkP7o3--


--===============1290561244350369296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1290561244350369296==--

