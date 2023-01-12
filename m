Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9CFC61DB3
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 21:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lmh5Jtk7OlTu52nsnRbdKKfQK2Ajk5sXt04R6EjLuaY=; b=hflIEkrJE7GGy4ql/49cAdi3RW
	pHgWfQo2dAVzqPrlg2oXTlflF1egQ1DTRL0yBC0O1oPkmYtaunx8v/TbvJd137XcpbnbnMQtkwjcx
	aDapK6VcSMuYU1DV4U0i19QR8hAuzmW7fFbj0rJeXO3y/G9tZhFQsEf1PYDLgQBn9T7dPPO6DLfM5
	hYK8gPem0gzFggn66guuBEDH0FUEXM3/xqMXKVUeQxesnGzsDyeEm8sheVyswZEhDHouHT4PCUClH
	pLvXdD2w6+lOQHhwlAt+qnGznIPLN9Elf/OnuXcx1kPyBoOc2ltAZvgIEV+usaS90tjy1e2xRSDvW
	z4uF8zFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG58C-00H8oV-VA; Thu, 12 Jan 2023 21:29:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG589-00H8nS-TR; Thu, 12 Jan 2023 21:29:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 47942621A3;
	Thu, 12 Jan 2023 21:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4595DC433EF;
	Thu, 12 Jan 2023 21:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673558940;
	bh=Vv3O916AOOxSA6qNPf8av52jiPoTdUqQzMpzIkzHZAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nviG3oG77pMLEvUdQq0PHjlQbAcVhTkU8JvlbhEzqvoErXA0Y9F8B3ct4pR6558sM
	 Bf23n9EsLkv0Kpms8nC1UeujfzlNSTjhX7ZS0S8/2C8J0RvVQw0v7K8aybl/OghUd1
	 0xF9WvjH0HjAjEXL7ZMJCFLnm2BpoZSdfi2FVyGEsTXyXsK7ISMo/jKP00LTO+wlCs
	 3AjLS7t1EtYni51xi1HwwtkU9njcowJi00vfYc2MXlmTlI9LK5mtfQ0Xbv3U7T4IBZ
	 jAc9JV2nLbkRdW4L2XZBGh6MRuaeeyMcjuKfai/JEcYzW5wRaEAn3U+B5FcTKIX+uD
	 kCWQ+g9ggFrpw==
Date: Thu, 12 Jan 2023 21:28:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v3 04/13] riscv: hwcap: make ISA extension ids can be
 used in asm
Message-ID: <Y8B7lw0iPXJlr8mB@spud>
References: <20230111171027.2392-1-jszhang@kernel.org>
 <20230111171027.2392-5-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230111171027.2392-5-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_132902_047472_05DE8C1E 
X-CRM114-Status: GOOD (  24.04  )
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
Content-Type: multipart/mixed; boundary="===============6524954117279082602=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6524954117279082602==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PRFHhOLbTp+eOclV"
Content-Disposition: inline


--PRFHhOLbTp+eOclV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Jisheng,

On Thu, Jan 12, 2023 at 01:10:18AM +0800, Jisheng Zhang wrote:
> We will make use of ISA extension in asm files, so make the multi-letter
>=20
> RISC-V ISA extension IDs macros rather than enums and move them and
> those base ISA extension IDs to suitable place.

=46rom v2:
Which base ISA extension IDs? Changelog should match the patch contents,
and it's a little unclear here since the base ISA extension IDs are
visible here but in the context not the diff.

How about something like:
"So that ISA extensions can be used in assembly files, convert the
multi-letter RISC-V ISA extension IDs enums to macros.
In order to make them visible, move the #ifndef __ASSEMBLY__ guard
to a later point in the header"

Pedantry perhaps, but referring to moving the base IDs looks odd, since
that is not what git thinks you did - even if that is the copy paste
operation you carried out.

Content itself is
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 45 ++++++++++++++++------------------
>  1 file changed, 21 insertions(+), 24 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index 86328e3acb02..09a7767723f6 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -12,20 +12,6 @@
>  #include <linux/bits.h>
>  #include <uapi/asm/hwcap.h>
> =20
> -#ifndef __ASSEMBLY__
> -#include <linux/jump_label.h>
> -/*
> - * This yields a mask that user programs can use to figure out what
> - * instruction set this cpu supports.
> - */
> -#define ELF_HWCAP		(elf_hwcap)
> -
> -enum {
> -	CAP_HWCAP =3D 1,
> -};
> -
> -extern unsigned long elf_hwcap;
> -
>  #define RISCV_ISA_EXT_a		('a' - 'a')
>  #define RISCV_ISA_EXT_c		('c' - 'a')
>  #define RISCV_ISA_EXT_d		('d' - 'a')
> @@ -46,22 +32,33 @@ extern unsigned long elf_hwcap;
>  #define RISCV_ISA_EXT_BASE 26
> =20
>  /*
> - * This enum represent the logical ID for each multi-letter RISC-V ISA e=
xtension.
> + * These macros represent the logical ID for each multi-letter RISC-V IS=
A extension.
>   * The logical ID should start from RISCV_ISA_EXT_BASE and must not exce=
ed
>   * RISCV_ISA_EXT_MAX. 0-25 range is reserved for single letter
>   * extensions while all the multi-letter extensions should define the ne=
xt
>   * available logical extension id.
>   */
> -enum riscv_isa_ext_id {
> -	RISCV_ISA_EXT_SSCOFPMF =3D RISCV_ISA_EXT_BASE,
> -	RISCV_ISA_EXT_SVPBMT,
> -	RISCV_ISA_EXT_ZICBOM,
> -	RISCV_ISA_EXT_ZIHINTPAUSE,
> -	RISCV_ISA_EXT_SSTC,
> -	RISCV_ISA_EXT_SVINVAL,
> -	RISCV_ISA_EXT_ID_MAX
> +#define RISCV_ISA_EXT_SSCOFPMF		26
> +#define RISCV_ISA_EXT_SVPBMT		27
> +#define RISCV_ISA_EXT_ZICBOM		28
> +#define RISCV_ISA_EXT_ZIHINTPAUSE	29
> +#define RISCV_ISA_EXT_SSTC		30
> +#define RISCV_ISA_EXT_SVINVAL		31
> +
> +#ifndef __ASSEMBLY__
> +#include <linux/jump_label.h>
> +/*
> + * This yields a mask that user programs can use to figure out what
> + * instruction set this cpu supports.
> + */
> +#define ELF_HWCAP		(elf_hwcap)
> +
> +enum {
> +	CAP_HWCAP =3D 1,
>  };
> -static_assert(RISCV_ISA_EXT_ID_MAX <=3D RISCV_ISA_EXT_MAX);
> +
> +extern unsigned long elf_hwcap;
> +
> =20
>  /*
>   * This enum represents the logical ID for each RISC-V ISA extension sta=
tic
> --=20
> 2.38.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--PRFHhOLbTp+eOclV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8B7lwAKCRB4tDGHoIJi
0skuAQCQWrG6EP11cnnr1Ue0/NgGhlWYgsbQDv1Qzs0hnpehqgEA4YJgeurFdoUm
Cb4+8Doogcxj9yvJYA8Zvteg6Bp4Rws=
=CkjQ
-----END PGP SIGNATURE-----

--PRFHhOLbTp+eOclV--


--===============6524954117279082602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6524954117279082602==--

