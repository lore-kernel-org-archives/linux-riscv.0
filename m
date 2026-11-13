Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCD0606A893
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 13:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pi14iX3Q;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BcUyBfO6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aFCKmfK1Dx+fKxWko52lF5by1j4AGZNiCS14ZfSrM8Q=; b=pi14iX3QjH1jwwmMb3flIaNgyo
	WYP0qILBpYnhVYk3djOJ6mDxu92Q3WgBxnJiKcV546oDzhIOYgVHY/9q4M4EZR8JwLhMFFgyLctlo
	SLuclUJ1rvG4pyoOte6J6/bqMsFtWt1ERHtOdldyIbD9aej5fukZ9BRThtnKoa09ac/ZLZ1tPY+eU
	VCDYZD2GSLxGTYNBZz6xgouB+tKEKp1pSFGNAxP/sknrJxYZx6MY8GwLAC6lKR5KIubyvJkdXw49a
	QeXfIbMi49xx375n4FDODkIFGOIVpwnKwECALgDE7R13+bbUbbew9w4HSQ82ED8KZcg9+sHmC+Y4y
	VwjmjeSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRroF-0000000D3xq-1ZNX;
	Fri, 13 Nov 2026 13:59:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRroE-0000000D3xS-1cKI
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 13:59:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 76B5E6120B;
	Fri, 13 Nov 2026 13:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD8C1F000C4;
	Fri, 13 Nov 2026 13:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794578357;
	bh=SLapHPY+ZKGZOWH+JW2R8xpjxB46dnr0RISc4rUkHUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BcUyBfO6RLcShSnPkDpLgFJr1jVWLgK/zsG5lOFBKpb4s4WSAOdpsY41rPe7uYiym
	 YlGzfMN9AbiP1gLH5cgTMiImbIYfheFqMahTjdFzG6a3PxdJX84WRGPMB6GSA3S7AW
	 27zvFLQ8TvI91nxWU54T8mM2RaIfpLx2IjzRs4f9hFFhhen9lm8LoWVhu9xPwQerVb
	 krgHxUCVS90wAJK51jtGruljulheIEPBZSMEeJOuFjcSEmK42CC15KgImAhj59mdHk
	 ijy6m82XUeWZyPCColnJGffBzV+wIBACksLEv3QuXlhhTOniV6xehrjsm7+jGiD5av
	 F37GxWewIFfkw==
Date: Fri, 13 Nov 2026 13:59:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Mina Hui-Min Chou <minachou@andestech.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, jic23@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	randolph@andestech.com, cyyang772@andestech.com,
	tim609@andestech.com, az70021@gmail.com
Subject: Re: [PATCH v2 17/19] riscv: errata: andes: generalize cache errata
 for Andes cores
Message-ID: <20261113-voice-pledge-d0b4e1420676@spud>
References: <20261113071143.1446167-1-minachou@andestech.com>
 <20261113071143.1446167-18-minachou@andestech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261113071143.1446167-18-minachou@andestech.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4417088383188532092=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4417088383188532092==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NYom5XXD5Tcu9bMR"
Content-Disposition: inline

--NYom5XXD5Tcu9bMR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 03:11:41PM +0800, Mina Hui-Min Chou wrote:
> The Andes cache errata probe only runs on AX45MP: it matches
> ANDES_AX45MP_MARCHID/MIMPID and then asks the Andes SBI extension
> whether IOCP is missing. Other Andes cores that need CCTL-based cache
> maintenance, such as the A27L2, which has neither IOCP nor Zicbom, are
> silently skipped.
>=20
> The IOCP_SW_WORKAROUND SBI call cannot simply be used on every Andes
> core: OpenSBI checks the IOCP bit in mmsc_cfg[47], which only exists on
> RV64 cores. RV32 cores such as the A45MP report IOCP in mmsc_cfg2
> instead, and cores such as the A25/A27 do not support IOCP at all.
>=20
> Keep the existing SBI-based check for AX45MP. On other Andes cores, use
> the Andes CCTL operations for cache maintenance when the core does not
> implement Zicbom.
>=20
> As the probe is no longer only about IOCP, rename errata_probe_iocp()
> to errata_probe_andes_cache(), ERRATA_ANDES_NO_IOCP to
> ERRATA_ANDES_CACHE, and the ERRATA_ANDES prompt from "Andes AX45MP
> errata" to "Andes errata".
>=20
> Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
> ---
>  arch/riscv/Kconfig.errata                    |  2 +-
>  arch/riscv/errata/andes/errata.c             | 13 +++++++------
>  arch/riscv/include/asm/errata_list_vendors.h |  2 +-
>  3 files changed, 9 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index 3c43e065aa01..ca8e52bee497 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -1,7 +1,7 @@
>  menu "CPU errata selection"
> =20
>  config ERRATA_ANDES
> -	bool "Andes AX45MP errata"
> +	bool "Andes errata"
>  	depends on RISCV_SBI
>  	help
>  	  All Andes errata Kconfig depend on this Kconfig. Disabling
> diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes/e=
rrata.c
> index dcc9d1ee5ffd..530d2df216e0 100644
> --- a/arch/riscv/errata/andes/errata.c
> +++ b/arch/riscv/errata/andes/errata.c
> @@ -39,7 +39,7 @@ static long ax45mp_iocp_sw_workaround(void)
>  	return ret.error ? 0 : ret.value;
>  }
> =20
> -static void errata_probe_iocp(unsigned int stage, unsigned long arch_id,=
 unsigned long impid)
> +static void errata_probe_andes_cache(unsigned int stage, unsigned long a=
rch_id, unsigned long impid)

Just call it probe so that you dont rename it again when the next
erratum shows up?

>  {
>  	static bool done;
> =20
> @@ -51,11 +51,12 @@ static void errata_probe_iocp(unsigned int stage, uns=
igned long arch_id, unsigne
> =20
>  	done =3D true;
> =20
> -	if (arch_id !=3D ANDES_AX45MP_MARCHID || impid !=3D ANDES_AX45MP_MIMPID)
> -		return;
> -
> -	if (!ax45mp_iocp_sw_workaround())
> +	if (arch_id =3D=3D ANDES_AX45MP_MARCHID && impid =3D=3D ANDES_AX45MP_MI=
MPID) {
> +		if (!ax45mp_iocp_sw_workaround())
> +			return;
> +	} else if (riscv_isa_extension_available(NULL, ZICBOM)) {
>  		return;
> +	}

Is this correct? The code goes on to always mark noncoherent stuff
supported, so this means that every andes device must then support
noncoherent. The commit message's wording isn't that strong.

> =20
>  	/* Set this just to make core cbo code happy */

This comment is no longer accurate because you gave this value special
meaning elsewhere in the series.
That patch needs to change this comment.

Cheers,
Conor.

>  	riscv_cbom_block_size =3D 1;
> @@ -69,7 +70,7 @@ void __init_or_module andes_errata_patch_func(struct al=
t_entry *begin, struct al
>  	BUILD_BUG_ON(ERRATA_ANDES_NUMBER >=3D RISCV_VENDOR_EXT_ALTERNATIVES_BAS=
E);
> =20
>  	if (stage =3D=3D RISCV_ALTERNATIVES_BOOT)
> -		errata_probe_iocp(stage, archid, impid);
> +		errata_probe_andes_cache(stage, archid, impid);
> =20
>  	/* we have nothing to patch here ATM so just return back */
>  }
> diff --git a/arch/riscv/include/asm/errata_list_vendors.h b/arch/riscv/in=
clude/asm/errata_list_vendors.h
> index 02b5ab0d23a8..d2fbef69f421 100644
> --- a/arch/riscv/include/asm/errata_list_vendors.h
> +++ b/arch/riscv/include/asm/errata_list_vendors.h
> @@ -4,7 +4,7 @@
>  #define ASM_ERRATA_LIST_VENDORS_H
> =20
>  #ifdef CONFIG_ERRATA_ANDES
> -#define	ERRATA_ANDES_NO_IOCP 0
> +#define	ERRATA_ANDES_CACHE 0
>  #define	ERRATA_ANDES_NUMBER 1
>  #endif
> =20
> --=20
> 2.34.1
>=20

--NYom5XXD5Tcu9bMR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavcXrwAKCRB4tDGHoIJi
0mUyAQC0Njm9VgKtr3oSzGJ04nseC1dvDXZiJ9ezyBZyaunQvAD9EXLfI/VdA9M7
KESl+lZQXuUyTsv1/BGbcZq3daXoqgw=
=dkDf
-----END PGP SIGNATURE-----

--NYom5XXD5Tcu9bMR--


--===============4417088383188532092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4417088383188532092==--

