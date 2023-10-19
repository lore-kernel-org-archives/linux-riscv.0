Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D04ACDB465
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 16:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcINWpnKtBLGBrVEwPnfurF+W/bscktdGRvEYvW1S+8=; b=mY1qP/U7dYIEIgs/ZIIGEtByqf
	G9yQmJbQw/klNHCsovnkfWwfHDqig31x9CCUdf7b+6PuSgunajUhSOT22xjTbFGQBY8SQCPwabxWQ
	tV80BbpdNj5JgdLUPGKDACrXjxUeGJtat4HfM3Uia5q5/pTeXpTdOqNf91a8KDRHBC9GR55ZcfzQJ
	EY65bc1epXWB6ttTrG3CwAoKrEbpT6UjQYUfXTR7B+xnOuj1oeI96OfjpQji5H7N5ucAfR+tmaHNu
	Wuk2KYEWh8RMKF7bj5VUK+BQYepid4M7KMvFb6/pOBPfO5Wu9Fjy5NfLEGmcec7ftyzjgfup1MH8D
	spC4fIfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtViK-000Isy-07;
	Thu, 19 Oct 2023 16:17:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtViH-000Irz-03
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 16:17:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7E565CE2F79;
	Thu, 19 Oct 2023 16:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3897C433C8;
	Thu, 19 Oct 2023 16:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697732248;
	bh=wwtqeVi8T90A9eG78e3y+UAer9+rhT+4XKm5eCrsfu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qU8+NRhCGj0wLiyKMJejDFBHY6PyTE12U0baIO6jDJBN9PY79b+2NYYh8cjCY4QBW
	 2OyhriUXBhcz6Boz/gmmhlb5nFahk6hNpabaYoz3/ON2tnCyQZQVocpOFoRRirrRoS
	 eohAeVEnuu/jmJkBtGbMROoWtQS8BHkV8HJD9iAgyjSMOtlThdZVFgVWbpa6yzwYtn
	 +M2S2aGcbUc9d/bTlY1xxJw4F0CV0CENipv0WVZbJRpbWn6eWCYdBtpEN0lw7228b0
	 g+cP/w3Pv5qi8qi0jdmzFLggdETfmRwVIvoYI/QZr+J5MFlF4QJ7KHWXNWAJuu97B1
	 EFkkqdzzXGDZw==
Date: Thu, 19 Oct 2023 17:17:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Yu Chien Peter Lin <peterlin@andestech.com>
Subject: Re: [PATCH v2 01/10] riscv: errata: Rename defines for Andes
Message-ID: <20231019-shrimp-configure-0eb42294d459@spud>
References: <20231019135329.3654793-1-peterlin@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20231019135329.3654793-1-peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_091733_407875_D8D5377E 
X-CRM114-Status: GOOD (  20.66  )
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
Cc: tim609@andestech.com, aou@eecs.berkeley.edu, ycliang@andestech.com, heiko@sntech.de, samuel@sholland.org, locus84@andestech.com, dminus@andestech.com, dylan@andestech.com, prabhakar.mahadev-lad.rj@bp.renesas.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, evan@rivosinc.com, palmer@dabbelt.com, jszhang@kernel.org, paul.walmsley@sifive.com, guoren@kernel.org, linux-riscv@lists.infradead.org, ajones@ventanamicro.com
Content-Type: multipart/mixed; boundary="===============5515697591865879054=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5515697591865879054==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j/9DDxIzSK4GeIB/"
Content-Disposition: inline


--j/9DDxIzSK4GeIB/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 09:53:29PM +0800, Yu Chien Peter Lin wrote:
> Using "ANDES" rather than "ANDESTECH" to unify the naming
> convention with OpenSBI and U-Boot, and reduce the number
> of characters per line.

NGL, I think this is just churn and the 4-characters-per-line
saving is a weak argument & u-boot/opensbi alignment is not really
relevant. A better argument for it is probably unification with the
directory/file names, Kconfig options and with the
ANDES_SBI_EXT_OPCP_SW_WORKAROUND definitions.

/shrug,
Conor.

>=20
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Reviewed-by: Charles Ci-Jyun Wu <dminus@andestech.com>
> Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> ---
> Changes v1 -> v2:
>   - No change
> ---
>  arch/riscv/errata/andes/errata.c       | 10 +++++-----
>  arch/riscv/include/asm/errata_list.h   |  4 ++--
>  arch/riscv/include/asm/vendorid_list.h |  2 +-
>  arch/riscv/kernel/alternative.c        |  2 +-
>  4 files changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes/e=
rrata.c
> index 197db68cc8da..d2e1abcac967 100644
> --- a/arch/riscv/errata/andes/errata.c
> +++ b/arch/riscv/errata/andes/errata.c
> @@ -18,9 +18,9 @@
>  #include <asm/sbi.h>
>  #include <asm/vendorid_list.h>
> =20
> -#define ANDESTECH_AX45MP_MARCHID	0x8000000000008a45UL
> -#define ANDESTECH_AX45MP_MIMPID		0x500UL
> -#define ANDESTECH_SBI_EXT_ANDES		0x0900031E
> +#define ANDES_AX45MP_MARCHID		0x8000000000008a45UL
> +#define ANDES_AX45MP_MIMPID		0x500UL
> +#define ANDES_SBI_EXT_ANDES		0x0900031E
> =20
>  #define ANDES_SBI_EXT_IOCP_SW_WORKAROUND	1
> =20
> @@ -32,7 +32,7 @@ static long ax45mp_iocp_sw_workaround(void)
>  	 * ANDES_SBI_EXT_IOCP_SW_WORKAROUND SBI EXT checks if the IOCP is missi=
ng and
>  	 * cache is controllable only then CMO will be applied to the platform.
>  	 */
> -	ret =3D sbi_ecall(ANDESTECH_SBI_EXT_ANDES, ANDES_SBI_EXT_IOCP_SW_WORKAR=
OUND,
> +	ret =3D sbi_ecall(ANDES_SBI_EXT_ANDES, ANDES_SBI_EXT_IOCP_SW_WORKAROUND,
>  			0, 0, 0, 0, 0, 0);
> =20
>  	return ret.error ? 0 : ret.value;
> @@ -43,7 +43,7 @@ static bool errata_probe_iocp(unsigned int stage, unsig=
ned long arch_id, unsigne
>  	if (!IS_ENABLED(CONFIG_ERRATA_ANDES_CMO))
>  		return false;
> =20
> -	if (arch_id !=3D ANDESTECH_AX45MP_MARCHID || impid !=3D ANDESTECH_AX45M=
P_MIMPID)
> +	if (arch_id !=3D ANDES_AX45MP_MARCHID || impid !=3D ANDES_AX45MP_MIMPID)
>  		return false;
> =20
>  	if (!ax45mp_iocp_sw_workaround())
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/as=
m/errata_list.h
> index b55b434f0059..c190393aa9db 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -12,8 +12,8 @@
>  #include <asm/vendorid_list.h>
> =20
>  #ifdef CONFIG_ERRATA_ANDES
> -#define ERRATA_ANDESTECH_NO_IOCP	0
> -#define ERRATA_ANDESTECH_NUMBER		1
> +#define ERRATA_ANDES_NO_IOCP 0
> +#define ERRATA_ANDES_NUMBER 1
>  #endif
> =20
>  #ifdef CONFIG_ERRATA_SIFIVE
> diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/=
asm/vendorid_list.h
> index e55407ace0c3..2f2bb0c84f9a 100644
> --- a/arch/riscv/include/asm/vendorid_list.h
> +++ b/arch/riscv/include/asm/vendorid_list.h
> @@ -5,7 +5,7 @@
>  #ifndef ASM_VENDOR_LIST_H
>  #define ASM_VENDOR_LIST_H
> =20
> -#define ANDESTECH_VENDOR_ID	0x31e
> +#define ANDES_VENDOR_ID		0x31e
>  #define SIFIVE_VENDOR_ID	0x489
>  #define THEAD_VENDOR_ID		0x5b7
> =20
> diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternat=
ive.c
> index 319a1da0358b..0128b161bfda 100644
> --- a/arch/riscv/kernel/alternative.c
> +++ b/arch/riscv/kernel/alternative.c
> @@ -43,7 +43,7 @@ static void riscv_fill_cpu_mfr_info(struct cpu_manufact=
urer_info_t *cpu_mfr_info
> =20
>  	switch (cpu_mfr_info->vendor_id) {
>  #ifdef CONFIG_ERRATA_ANDES
> -	case ANDESTECH_VENDOR_ID:
> +	case ANDES_VENDOR_ID:
>  		cpu_mfr_info->patch_func =3D andes_errata_patch_func;
>  		break;
>  #endif
> --=20
> 2.34.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--j/9DDxIzSK4GeIB/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTFWkgAKCRB4tDGHoIJi
0vKcAQD7/5ed28QgqwN8OzDUvTDRZVQYxWaeLacNvyAa8AY6KQEA8Hf8qaNx+/BH
SIyVv6jWcKM5owcNlut0TDNs15Sc3g0=
=BfbK
-----END PGP SIGNATURE-----

--j/9DDxIzSK4GeIB/--


--===============5515697591865879054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5515697591865879054==--

