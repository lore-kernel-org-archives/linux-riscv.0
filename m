Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAF2C64ED6
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 23:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W6ky+uiOkuQ9I5AHcXiLQhzPv3ZasFOMN8vKnndEJAs=; b=yvhxrdz5BpkyjwPTpnq+0Sc+Cy
	7KZzI28WhYefMffB6y/l3mDyI7P1QVfTeJRAm4dHG+d6gVsqGIWwa9c7OAge4Or8lEuxtl0LWACNA
	Qq9B6yBe94Cc0XOj06WNyBtPNgL4KCdwHDQqDCeE1DQPH9VDen6S0BuE+dvA5SPYW42NaT0Vr+C5n
	F76JbX9HTam+3s8v7c7GlLn8blWA3sZf4JT0f/rRPw/f2G50SA+oR5x0MwyvRUxvDuKeef56S+IXC
	aj983473RSCHukWuQQsoreMCi7kkfiS7AFIAQ+p9Z22exuNWuZcoGlZZyW7g9Zi8fbNoTNCpoj74b
	dcSL1neA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVKnN-000ZxE-Rq; Thu, 23 Feb 2023 23:14:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVKnK-000Zvn-HW
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 23:14:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A7B53617B0;
	Thu, 23 Feb 2023 23:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35EAC433D2;
	Thu, 23 Feb 2023 23:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677194070;
	bh=+TKOeKXsb49Kz1XrCK6gviIGDzh2zti0rrhV6AluQ1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RodNCR9AT7zE8VAGiNydoL5R0vU1wSQhQCo9qfahJxjAQpFWd8LEIEirqUUMX+BvN
	 v4LhsCw3SiDUVn0kaJeYGRxXKm1/TXfD+tXiRCMrd4bvrD1gUJEpEtlb7mNrC33c7Y
	 bI8bsvWPgsHrUuCxU6cmh9Nt6gEs/xWU0HLfVOatrAjZlPynqs+7JvmO98nnIVVdLu
	 FaQa/GmqTZmk7hebwiqrg9Om1nrA0K4HVtPqQkKk/H8UvrwdCPu6BpdZkqTPfpLnaQ
	 hu8mfAAYMTWQX8B/PuFTw2FwfAJkRaagxYV1M+VASLjMGXm+/k4E0O4oyQPVF1va+a
	 XeXFLkih1BACg==
Date: Thu, 23 Feb 2023 23:14:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, 'Jisheng Zhang ' <jszhang@kernel.org>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 2/5] riscv: alternatives: Remove unnecessary define and
 unused struct
Message-ID: <Y/fzUt7gs6U+MANi@spud>
References: <20230221185603.570882-1-ajones@ventanamicro.com>
 <20230221185603.570882-3-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230221185603.570882-3-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_151434_677788_75D21431 
X-CRM114-Status: GOOD (  21.54  )
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
Content-Type: multipart/mixed; boundary="===============7037214559362611384=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7037214559362611384==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="O4fyq8phM3Botw0r"
Content-Disposition: inline


--O4fyq8phM3Botw0r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 07:56:00PM +0100, Andrew Jones wrote:
> A define and a struct were introduced with commit 6f4eea90465a
> ("riscv: Introduce alternative mechanism to apply errata solution"),
> which introduced alternatives to RISC-V. The define is used for
> an arbitrary string length, specific to sifive errata, so just use
> the number directly there instead. The struct has never been used,
> so remove it.
>=20
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/errata/sifive/errata.c    | 2 +-
>  arch/riscv/include/asm/alternative.h | 7 -------
>  2 files changed, 1 insertion(+), 8 deletions(-)
>=20
> diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive=
/errata.c
> index ef9a4eec0dba..9e7dffa800f2 100644
> --- a/arch/riscv/errata/sifive/errata.c
> +++ b/arch/riscv/errata/sifive/errata.c
> @@ -13,7 +13,7 @@
>  #include <asm/errata_list.h>
> =20
>  struct errata_info_t {
> -	char name[ERRATA_STRING_LENGTH_MAX];
> +	char name[32];

If it were me, I'd probably have moved the define - but hardly matters,
it's a one time use, arbitrary number I suppose.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

>  	bool (*check_func)(unsigned long  arch_id, unsigned long impid);
>  };
> =20
> diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/as=
m/alternative.h
> index b8648d4f2ac1..3beef400a971 100644
> --- a/arch/riscv/include/asm/alternative.h
> +++ b/arch/riscv/include/asm/alternative.h
> @@ -6,8 +6,6 @@
>  #ifndef __ASM_ALTERNATIVE_H
>  #define __ASM_ALTERNATIVE_H
> =20
> -#define ERRATA_STRING_LENGTH_MAX 32
> -
>  #include <asm/alternative-macros.h>
> =20
>  #ifndef __ASSEMBLY__
> @@ -43,11 +41,6 @@ struct alt_entry {
>  	u32 errata_id;		/* The errata id */
>  };
> =20
> -struct errata_checkfunc_id {
> -	unsigned long vendor_id;
> -	bool (*func)(struct alt_entry *alt);
> -};
> -
>  void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry =
*end,
>  			      unsigned long archid, unsigned long impid,
>  			      unsigned int stage);
> --=20
> 2.39.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--O4fyq8phM3Botw0r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/fzUgAKCRB4tDGHoIJi
0lRBAP9ds/7u7rNXk6+uFQk1kvLtjvgAKfTX86dEKrHu6o9K/gD/f7oAvatD2THu
Tvs9ovxI57xt1h2XyjPX26O/vWhxRQA=
=Fotf
-----END PGP SIGNATURE-----

--O4fyq8phM3Botw0r--


--===============7037214559362611384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7037214559362611384==--

