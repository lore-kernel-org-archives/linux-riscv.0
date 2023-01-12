Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3F2C54EBD
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 07:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nULtAkXdpYCc2moocqxs5b4tgm19nfyzxMHJyXbGcWE=; b=lgir7EODjfUoY3W8UNXwS5p2oB
	WVcbQVb2OFCyDIX6eepSDOGYS0IUimPyf1UbrhmrHNx0UtQNU/JKdKRO7ED8BOH54VHAp6O/o5OCE
	2JwBbFpGc9xmYxjW0tz4cfiiR+RDE20WtaI6XNeE8Rnkic/uUmdRsy21rWLMhD1OooMaZgYnS1eP3
	Sv2B3tLcrKetBWoqKNfxVIN8m2CYoPoyiOvP8nX/pecXj4WY7jZ2jwfRdknuRI33KhY7B+weVpEk+
	QEKNjn0choAZ3Zh1mcALkpK5Jt4Mo4Ldj6QW/syJjBsqeqfRXxVx2JjmWiZ5eqr60RQFrBbC3l3ls
	NfmiDHkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFsKf-00E2fT-51; Thu, 12 Jan 2023 07:49:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFsKa-00E2e6-Qa; Thu, 12 Jan 2023 07:49:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673509740; x=1705045740;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vMUmhc0Tn/B+KYMP/tYkNeijDWua0V32T+gVHgjqFtE=;
  b=0vqMDLKz1UJlCFypQ7bDOHgcR49E5+uJKgdhWfo1lgS6M86qxEV+Tt8L
   V8HZvGWY3XRFiyGSkt14QENq74ZHLFQ6tUBo6mHrsCgbxrcognJUSPV4d
   M41EousGmNyl45LH1V6kfDz8yneML05pivpwTqj0vt4Ay9yVr3gk/ZU2d
   aqgLgr2qJGvusI4CnRciDe585quFRjMT7ZqqrpMVG8i3q0LDdEYEbBnar
   6rps88wzLFUmSyG2/Wva4eZdSayL05iw9b9dudgr0VM2/EE3P9rnuwKL6
   3JggiJ8YmlDPCmlzQtB76nBTjZhYN+hIQ6bmupuEZzyCM0dmddWLuraFq
   A==;
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; 
   d="asc'?scan'208";a="131964178"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jan 2023 00:48:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 00:48:54 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Thu, 12 Jan 2023 00:48:52 -0700
Date: Thu, 12 Jan 2023 07:48:29 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Jisheng Zhang <jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel
	<anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Heiko Stuebner
	<heiko@sntech.de>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
	<kvm-riscv@lists.infradead.org>, Guo Ren <guoren@kernel.org>, Andrew Jones
	<ajones@ventanamicro.com>
Subject: Re: [PATCH v3 10/13] riscv: alternative: patch alternatives in the
 vDSO
Message-ID: <Y7+7TRv7+V0nKNiZ@wendy>
References: <20230111171027.2392-1-jszhang@kernel.org>
 <20230111171027.2392-11-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230111171027.2392-11-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_234900_968994_98CBE645 
X-CRM114-Status: GOOD (  21.43  )
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
Content-Type: multipart/mixed; boundary="===============5868176996973138274=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5868176996973138274==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6yQljiZjzbsXjRJM"
Content-Disposition: inline

--6yQljiZjzbsXjRJM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Jisheng,

On Thu, Jan 12, 2023 at 01:10:24AM +0800, Jisheng Zhang wrote:
> Make it possible to use alternatives in the vDSO, so that better
> implementations can be used if possible.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

FYI, from this patch onwards the rv32 build is broken.
Should be reproduceable with the in-tree rv32_defconfig.

Unfortunately no logs for you, I've got a CI bug to fix!

Thanks,
Conor.

> ---
>  arch/riscv/include/asm/vdso.h     |  4 ++++
>  arch/riscv/kernel/alternative.c   | 25 +++++++++++++++++++++++++
>  arch/riscv/kernel/vdso.c          |  5 -----
>  arch/riscv/kernel/vdso/vdso.lds.S |  7 +++++++
>  4 files changed, 36 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/vdso.h b/arch/riscv/include/asm/vdso.h
> index a7644f46d0e5..f891478829a5 100644
> --- a/arch/riscv/include/asm/vdso.h
> +++ b/arch/riscv/include/asm/vdso.h
> @@ -28,8 +28,12 @@
>  #define COMPAT_VDSO_SYMBOL(base, name)						\
>  	(void __user *)((unsigned long)(base) + compat__vdso_##name##_offset)
> =20
> +extern char compat_vdso_start[], compat_vdso_end[];
> +
>  #endif /* CONFIG_COMPAT */
> =20
> +extern char vdso_start[], vdso_end[];
> +
>  #endif /* !__ASSEMBLY__ */
> =20
>  #endif /* CONFIG_MMU */
> diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternat=
ive.c
> index 3d4f1f32c7f6..a883a309139f 100644
> --- a/arch/riscv/kernel/alternative.c
> +++ b/arch/riscv/kernel/alternative.c
> @@ -11,7 +11,9 @@
>  #include <linux/cpu.h>
>  #include <linux/uaccess.h>
>  #include <asm/alternative.h>
> +#include <asm/module.h>
>  #include <asm/sections.h>
> +#include <asm/vdso.h>
>  #include <asm/vendorid_list.h>
>  #include <asm/sbi.h>
>  #include <asm/csr.h>
> @@ -160,6 +162,27 @@ static void __init_or_module _apply_alternatives(str=
uct alt_entry *begin,
>  				stage);
>  }
> =20
> +static void __init apply_vdso_alternatives(void)
> +{
> +	const struct elf64_hdr *hdr;
> +	const struct elf64_shdr *shdr;
> +	const struct elf64_shdr *alt;
> +	struct alt_entry *begin, *end;
> +
> +	hdr =3D (struct elf64_hdr *)vdso_start;
> +	shdr =3D (void *)hdr + hdr->e_shoff;
> +	alt =3D find_section(hdr, shdr, ".alternative");
> +	if (!alt)
> +		return;
> +
> +	begin =3D (void *)hdr + alt->sh_offset,
> +	end =3D (void *)hdr + alt->sh_offset + alt->sh_size,
> +
> +	_apply_alternatives((struct alt_entry *)begin,
> +			    (struct alt_entry *)end,
> +			    RISCV_ALTERNATIVES_BOOT);
> +}
> +
>  void __init apply_boot_alternatives(void)
>  {
>  	/* If called on non-boot cpu things could go wrong */
> @@ -168,6 +191,8 @@ void __init apply_boot_alternatives(void)
>  	_apply_alternatives((struct alt_entry *)__alt_start,
>  			    (struct alt_entry *)__alt_end,
>  			    RISCV_ALTERNATIVES_BOOT);
> +
> +	apply_vdso_alternatives();
>  }
> =20
>  /*
> diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
> index e410275918ac..4e631c098f4d 100644
> --- a/arch/riscv/kernel/vdso.c
> +++ b/arch/riscv/kernel/vdso.c
> @@ -22,11 +22,6 @@ struct vdso_data {
>  };
>  #endif
> =20
> -extern char vdso_start[], vdso_end[];
> -#ifdef CONFIG_COMPAT
> -extern char compat_vdso_start[], compat_vdso_end[];
> -#endif
> -
>  enum vvar_pages {
>  	VVAR_DATA_PAGE_OFFSET,
>  	VVAR_TIMENS_PAGE_OFFSET,
> diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/v=
dso.lds.S
> index 150b1a572e61..4a0606633290 100644
> --- a/arch/riscv/kernel/vdso/vdso.lds.S
> +++ b/arch/riscv/kernel/vdso/vdso.lds.S
> @@ -40,6 +40,13 @@ SECTIONS
>  	. =3D 0x800;
>  	.text		: { *(.text .text.*) }		:text
> =20
> +	. =3D ALIGN(4);
> +	.alternative : {
> +		__alt_start =3D .;
> +		*(.alternative)
> +		__alt_end =3D .;
> +	}
> +
>  	.data		: {
>  		*(.got.plt) *(.got)
>  		*(.data .data.* .gnu.linkonce.d.*)
> --=20
> 2.38.1
>=20

--6yQljiZjzbsXjRJM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7+7PwAKCRB4tDGHoIJi
0uEeAQD9G+uLbu+8Gxiocxeb/U5F/Z622cqxCP2S5hcdl9HrxAEA5R0sXrC2ZRY9
VB1eNSPNCHca9c/1ktnoYwr7MSa5TQc=
=LDuC
-----END PGP SIGNATURE-----

--6yQljiZjzbsXjRJM--


--===============5868176996973138274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5868176996973138274==--

