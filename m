Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0CAC48BF6
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 07:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNVa/5IGGIIER7DcvmBcp/WYPJ+6BuahYShZVvYCNPE=; b=ogL6KdbtGj2gOsfR426GvrL7+J
	M49gH0A532Bo+pKUOuVNQqcYVSUqbfYmJ6osspwku2q+VgneUh4pF+K7cbrbTWKioaHH9mlsXhLF+
	t2Sz/NtIPTjUIJZzV8rdrMibepD2SqtFahVgvKzEjpKOKwjHJYRiKHcOrEjDG6MrEw7TY8TiAgoIe
	HEgxOlag4Ik3/BQU4IDZJj+MIiYNMKakQMKeRdU1Wrz/6ylXtZ6rKuluBGBrt6yUyutujtsjWFz9f
	xJBrLvGNNyNV9k5w62glAZFjLmESXvEI0Xwz47SFgPJeqaOnohCx9TLFQR3lH5VA4Fl9eyNBe0CCN
	jPHmQr1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri8WB-00000003VFx-3z3o;
	Thu, 07 Mar 2024 07:50:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri8W8-00000003VFF-3pVD
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 07:50:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1709797816; x=1741333816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zaZejvaxya+QcPBAYnl0R1xoXRC+3MKw9yhltV+Izyk=;
  b=CWxXVfGxL2q+zuAuqnB3zFJZHZEAvV7yM5yqq1T0a7UGDQUgsTiAFGNu
   5+bqxmhI2jo1k01LWml/r1/rUbmLhGbKOxwEnF5/npPSSiT/8m1igc7Lx
   wDsvEAkwdZVvSkiBS+z7DdPHMwutknT161nUXOHbjKIV6xDrVmFKHm35E
   8YvntkJSMuCRjXNc5Lw1ndg8mBdzo652PigUliUPDGyJRQUk1bw7ruhcI
   n75VDK2AZO+9gJ96yT4cetwH6IesuE8kmMAbG7gILm5sXTKoJ2JvjVfG5
   oyR3vE6LrzlHKQEZl02I53aE2WitRhYhglI6OuKNitg1WRF84XKPnNfNU
   Q==;
X-CSE-ConnectionGUID: GFFPYmVfTf+KMi7QeExFDg==
X-CSE-MsgGUID: U1mtnhNgTSWbawu19moz/Q==
X-IronPort-AV: E=Sophos;i="6.06,210,1705388400"; 
   d="asc'?scan'208";a="184603276"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Mar 2024 00:50:14 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 00:50:03 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Mar 2024 00:50:01 -0700
Date: Thu, 7 Mar 2024 07:49:17 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v7 1/4] riscv: lib: Introduce has_fast_unaligned_access
 function
Message-ID: <20240307-coronary-snagged-cf3409df8f7a@wendy>
References: <20240306-disable_misaligned_probe_config-v7-0-6c90419e7a96@rivosinc.com>
 <20240306-disable_misaligned_probe_config-v7-1-6c90419e7a96@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240306-disable_misaligned_probe_config-v7-1-6c90419e7a96@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_235017_045289_D6FF8678 
X-CRM114-Status: GOOD (  20.46  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, linux-riscv@lists.infradead.org, Charles Lohr <lohr85@gmail.com>
Content-Type: multipart/mixed; boundary="===============4222834785842664270=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4222834785842664270==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sY3+K8PtRfDhOk5h"
Content-Disposition: inline

--sY3+K8PtRfDhOk5h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 06, 2024 at 12:00:01PM -0800, Charlie Jenkins wrote:

$subject: riscv: lib: Introduce has_fast_unaligned_access function

nit - s/ function/()/ & put the () after function names in commit
messages please.

> Create has_fast_unaligned_access to avoid needing to explicitly check
> the fast_misaligned_access_speed_key static key.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Evan Green <evan@rivosinc.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  arch/riscv/include/asm/cpufeature.h | 11 ++++++++---
>  arch/riscv/kernel/cpufeature.c      |  6 +++---
>  arch/riscv/lib/csum.c               |  7 ++-----
>  3 files changed, 13 insertions(+), 11 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm=
/cpufeature.h
> index 5a626ed2c47a..466e1f591919 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * Copyright 2022-2023 Rivos, Inc
> + * Copyright 2022-2024 Rivos, Inc
>   */
> =20
>  #ifndef _ASM_CPUFEATURE_H
> @@ -53,6 +53,13 @@ static inline bool check_unaligned_access_emulated(int=
 cpu)
>  static inline void unaligned_emulation_finish(void) {}
>  #endif
> =20
> +DECLARE_STATIC_KEY_FALSE(fast_unaligned_access_speed_key);
> +
> +static __always_inline bool has_fast_unaligned_accesses(void)
> +{
> +	return static_branch_likely(&fast_unaligned_access_speed_key);
> +}
> +
>  unsigned long riscv_get_elf_hwcap(void);
> =20
>  struct riscv_isa_ext_data {
> @@ -135,6 +142,4 @@ static __always_inline bool riscv_cpu_has_extension_u=
nlikely(int cpu, const unsi
>  	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
>  }
> =20
> -DECLARE_STATIC_KEY_FALSE(fast_misaligned_access_speed_key);
> -
>  #endif
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 89920f84d0a3..7878cddccc0d 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -810,14 +810,14 @@ static void check_unaligned_access_nonboot_cpu(void=
 *param)
>  		check_unaligned_access(pages[cpu]);
>  }
> =20
> -DEFINE_STATIC_KEY_FALSE(fast_misaligned_access_speed_key);
> +DEFINE_STATIC_KEY_FALSE(fast_unaligned_access_speed_key);
> =20
>  static void modify_unaligned_access_branches(cpumask_t *mask, int weight)
>  {
>  	if (cpumask_weight(mask) =3D=3D weight)
> -		static_branch_enable_cpuslocked(&fast_misaligned_access_speed_key);
> +		static_branch_enable_cpuslocked(&fast_unaligned_access_speed_key);
>  	else
> -		static_branch_disable_cpuslocked(&fast_misaligned_access_speed_key);
> +		static_branch_disable_cpuslocked(&fast_unaligned_access_speed_key);
>  }
> =20
>  static void set_unaligned_access_static_branches_except_cpu(int cpu)
> diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
> index af3df5274ccb..7178e0acfa22 100644
> --- a/arch/riscv/lib/csum.c
> +++ b/arch/riscv/lib/csum.c
> @@ -3,7 +3,7 @@
>   * Checksum library
>   *
>   * Influenced by arch/arm64/lib/csum.c
> - * Copyright (C) 2023 Rivos Inc.
> + * Copyright (C) 2023-2024 Rivos Inc.
>   */
>  #include <linux/bitops.h>
>  #include <linux/compiler.h>
> @@ -318,10 +318,7 @@ unsigned int do_csum(const unsigned char *buff, int =
len)
>  	 * branches. The largest chunk of overlap was delegated into the
>  	 * do_csum_common function.
>  	 */
> -	if (static_branch_likely(&fast_misaligned_access_speed_key))
> -		return do_csum_no_alignment(buff, len);
> -
> -	if (((unsigned long)buff & OFFSET_MASK) =3D=3D 0)
> +	if (has_fast_unaligned_accesses() || (((unsigned long)buff & OFFSET_MAS=
K) =3D=3D 0))
>  		return do_csum_no_alignment(buff, len);
> =20
>  	return do_csum_with_alignment(buff, len);
>=20
> --=20
> 2.43.2
>=20

--sY3+K8PtRfDhOk5h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZelxZAAKCRB4tDGHoIJi
0hJKAQC2W/fGv9uhQGFJKKVUxs4qVTbkPKTSpM7O//BztxDsbQEAvy0LTEPXat2c
sWGUnjelciGQEV/dSAdDnYTNHFkXsws=
=wVOO
-----END PGP SIGNATURE-----

--sY3+K8PtRfDhOk5h--


--===============4222834785842664270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4222834785842664270==--

