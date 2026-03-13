Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C233105F7A6
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 13:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHOEVruwvMoy/T/s52OSwcnUc5zwg0k24/9kej+7bv0=; b=j50VNhLIbxtGwhNN3YDxHpTotU
	zW9F3VtaLHxpAdhEkmtdtyXUqR9n9CoOArQAm10OghtH6SYPzxo+RGOywCQ8jBDnMhsGzQ1+uLFVw
	OhvHPq6IpEaGdvsZGu40ZEd9Gi/bLt9FeCLl7yZnkaaoCZyf8DR/6QULKKK2jnThS2LDkImBpQfho
	tDoII1seQAHAfgEpI2ar/PinlgYAW19bppjaNHn7OW4uTVPClJu/Xu/+JgXdSZwIgNj3BWgM8lGbD
	DmLbWB6ABhvnE94LqmOiriTt9U5VW+JNwdEucIYwZH49YvJHzpOj7Mfum4wznYe8NAnyNRcC3ned/
	hXdXSBKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12Vj-00000000DrS-1tME;
	Fri, 13 Mar 2026 13:25:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12Vi-00000000DrG-0lm5
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 13:25:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9141461841;
	Fri, 13 Mar 2026 13:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3BBFC4AF09;
	Fri, 13 Mar 2026 13:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773408301;
	bh=05lkidRgkYX4u94JvRMAQRYMhMl6EroU7eeEV4XMgtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UERPfxRWZwSyvA+CJinrifBL7unWAl9fvdV+SqD9qA+1fGMxXIvolK73vFWhkMLuS
	 jSrwkzB4njHTnRUj7B853pSlizCcuHvANrvx1gQzC2OmjDb/nJWGzPFAzdW62APmjD
	 Fg4ZLQCsphq2HWvF6y0B70R6K5x9zi//HKDTn4HSbl6Nueh3ejk5NEsf0aqpqplTEV
	 eB43Y5tuh8tEn7z95vAxhktcKO7q/QBT+nIp+Bh6V3yHF4kIa3ydvsmEPhXZhE+52g
	 inZyf+6MnT+QSKqM7C3Qc/43ByXhD6crm9UzaxDBkW2eiES/mchDqmyxmjb25M6C0O
	 sQ9wJEkl5UnhQ==
Date: Fri, 13 Mar 2026 13:24:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Bo Gan <ganboing@gmail.com>
Cc: linux-riscv@lists.infradead.org, samuel.holland@sifive.com,
	david@redhat.com, palmer@dabbelt.com, pjw@kernel.org,
	gaohan@iscas.ac.cn, me@ziyao.cc, lizhi2@eswincomputing.com,
	hal.feng@starfivetech.com, marcel@ziswiler.com, kernel@esmil.dk,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 3/6] riscv: apply page table attribute bits for
 XPbmtUC
Message-ID: <20260313-breezy-from-6b5ad9e9a5ac@spud>
References: <20260313084407.29669-1-ganboing@gmail.com>
 <20260313084407.29669-4-ganboing@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260313084407.29669-4-ganboing@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============3037483055035505335=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3037483055035505335==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="udfzb/ArxreH5LW+"
Content-Disposition: inline


--udfzb/ArxreH5LW+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 01:44:04AM -0700, Bo Gan wrote:
> Apply the UC bit like Svpbmt and THEAD_MAE does. Also changed the
> _PAGE_PFN_MASK definition to exclude the UC bit, as it's position
> is now determined at runtime, and can be part of PPN.
>=20
> Signed-off-by: Bo Gan <ganboing@gmail.com>

This should be squashed with the patch adding detection and the Kconfig
option.

> ---
>  arch/riscv/include/asm/errata_list.h | 17 +++++++++++++++--
>  arch/riscv/include/asm/pgtable-64.h  |  9 ++++++++-
>  2 files changed, 23 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/as=
m/errata_list.h
> index 6694b5ccdcf85..ba0f3d4dd0cbb 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -53,6 +53,16 @@ asm(ALTERNATIVE(	\
>  	: /* no inputs */	\
>  	: "memory")
> =20
> +#ifdef CONFIG_64BIT
> +#define ALT_PAGE_CUST_BIT(_bit)						\
> +asm(ALTERNATIVE("li %0, 0\t\nnop",					\
> +		"1: auipc %0, %%pcrel_hi(riscv_xpbmtuc_mask)\t\n"	\
> +		      "ld %0, %%pcrel_lo(1b)(%0)", 0,			\
> +			RISCV_ISA_EXT_XPBMTUC,				\
> +			CONFIG_RISCV_ISA_XPBMTUC)			\
> +		: "=3Dr"(_bit))
> +#endif
> +
>  /*
>   * _val is marked as "will be overwritten", so need to set it to 0
>   * in the default case.
> @@ -60,11 +70,14 @@ asm(ALTERNATIVE(	\
>  #define ALT_SVPBMT_SHIFT 61
>  #define ALT_THEAD_MAE_SHIFT 59
>  #define ALT_SVPBMT(_val, prot)						\
> -asm(ALTERNATIVE_2("li %0, 0\t\nnop",					\
> +asm(ALTERNATIVE_3("li %0, 0\t\nnop",					\
>  		  "li %0, %1\t\nslli %0,%0,%3", 0,			\
>  			RISCV_ISA_EXT_SVPBMT, CONFIG_RISCV_ISA_SVPBMT,	\
>  		  "li %0, %2\t\nslli %0,%0,%4", THEAD_VENDOR_ID,	\
> -			ERRATA_THEAD_MAE, CONFIG_ERRATA_THEAD_MAE)	\
> +			ERRATA_THEAD_MAE, CONFIG_ERRATA_THEAD_MAE,	\
> +		  "1: auipc %0, %%pcrel_hi(riscv_xpbmtuc_mask)\t\n"	\
> +			"ld %0, %%pcrel_lo(1b)(%0)", 0,			\
> +			RISCV_ISA_EXT_XPBMTUC, XPBMTUC_HAS##prot)	\
>  		: "=3Dr"(_val)						\
>  		: "I"(prot##_SVPBMT >> ALT_SVPBMT_SHIFT),		\
>  		  "I"(prot##_THEAD >> ALT_THEAD_MAE_SHIFT),		\
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm=
/pgtable-64.h
> index 1a6d04884111d..aab6990d92238 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -76,7 +76,14 @@ typedef struct {
>   * | 63 | 62 61 | 60 54 | 53  10 | 9             8 | 7 | 6 | 5 | 4 | 3 |=
 2 | 1 | 0
>   *   N      MT     RSV    PFN      reserved for SW   D   A   G   U   X  =
 W   R   V
>   */
> -#define _PAGE_PFN_MASK  GENMASK(53, 10)
> +static inline u64 riscv_pfn_mask(void)
> +{
> +	u64 cust_bit;
> +
> +	ALT_PAGE_CUST_BIT(cust_bit);
> +	return GENMASK(53, 10) ^ cust_bit;
> +}
> +#define _PAGE_PFN_MASK  riscv_pfn_mask()
> =20
>  /*
>   * [63] Svnapot definitions:
> --=20
> 2.34.1
>=20

--udfzb/ArxreH5LW+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabQQKAAKCRB4tDGHoIJi
0rTrAP9idBaaUTjEQII58LnomdoIaRZ94azL4xZjKiCZNcz7dgEA3p8stxS1Q6ah
9aWfVTsiho43IARnT/EmXKNFQAk5ygo=
=pFvp
-----END PGP SIGNATURE-----

--udfzb/ArxreH5LW+--


--===============3037483055035505335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3037483055035505335==--

