Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748DFC61DA4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 07:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5J75Pke5jCQDQ5pIQ2xUWE0DDMG4zcF461Pn5YDc4po=; b=RxYb3KYQH1oSa0hTKFbFIeEpQz
	6+R2GJMRdLCvl5XLJ3PQqxuu5+0G8fQamniOP1zBPdlks62/3DWB4/rRmlAxjVb/duekWSnOQqdCF
	Smb9m51W07aehy8uref3XX9CIbf66ePiwcApPKeicruDYqJjZtqSL1Hqw6r4G66P8v2Rmw4haVo1t
	17nVnowy3tN86nq0RkNpkDc0MvwfubRfZD0fjX7DdXALCaqUN/FDJrcH2QOxsz8xwwRQ42E3OfPxM
	MyS4oIZ+U+RaXshSqnvxCM2nf7mOUFGJ3w1gScG3K+S+SEVK329CmXn32x6hbseRKjgqTGwAfzvpP
	ALsJtsUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqER-000jWE-TV; Fri, 03 Feb 2023 07:11:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqEN-000jUA-O7
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 07:11:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B4FE161DB9;
	Fri,  3 Feb 2023 07:11:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11249C433EF;
	Fri,  3 Feb 2023 07:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675408290;
	bh=s/L8jCQpw9WypHCvHy5kOslkA1eUfQ/UYZoJYWcByYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u8vxcdR2WrUevdg9dU1j6JMinjwp7XTCt+pKni5qXTgW8QJSMiKBHpW5oyK9srUF6
	 tTzsB02yQPvt8LscqYO+s1tZVAre/WdtenwuBzoHucmec3MRTfMIhKj0s/0run8hR1
	 5Ehyrytk1CTG7EhwlsqUmyGA0z4qVXSB808pR1p/Spu07lO/obSTsDhV4u00VNQQ3D
	 T1jMAAWaM9ko9W7tAqFMXviWrB3aCy52pjhHC4bOW0yyAzZNGe+wclXb0f0Rt+Qvdi
	 3M2SBLnNF8MTNE7WtEJ32cSA3lZvbCdVt0zalCb1mExwD0dimaJP6WS9P/PdmDcXno
	 0nf9asSyC4JUw==
Date: Fri, 3 Feb 2023 07:11:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: Only provide the single-letter extensions in
 HWCAP
Message-ID: <Y9yzigjy+Nm7nsQz@dizzy>
References: <20230202233832.11036-1-palmer@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230202233832.11036-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_231131_888162_8C10CB2E 
X-CRM114-Status: GOOD (  27.05  )
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
Content-Type: multipart/mixed; boundary="===============6947012771055455618=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6947012771055455618==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SoSb8XEwlijywC/Z"
Content-Disposition: inline


--SoSb8XEwlijywC/Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2023 at 03:38:32PM -0800, Palmer Dabbelt wrote:
> The recent refactoring led to us leaking some HWCAP bits to userspace
> that didn't make much sense.  With any luck we'll have a better scheme
> soon, but for now just mask off those bits to avoid polluting userspace.
>=20
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/riscv/include/asm/elf.h   | 10 ++++++----
>  arch/riscv/include/asm/hwcap.h |  8 --------
>  2 files changed, 6 insertions(+), 12 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
> index e7acffdf21d2..30e7d2455960 100644
> --- a/arch/riscv/include/asm/elf.h
> +++ b/arch/riscv/include/asm/elf.h
> @@ -14,6 +14,7 @@
>  #include <asm/auxvec.h>
>  #include <asm/byteorder.h>
>  #include <asm/cacheinfo.h>
> +#include <asm/hwcap.h>
> =20
>  /*
>   * These are used to set parameters in the core dumps.
> @@ -59,12 +60,13 @@ extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
>  #define STACK_RND_MASK		(0x3ffff >> (PAGE_SHIFT - 12))
>  #endif
>  #endif
> +
>  /*
> - * This yields a mask that user programs can use to figure out what
> - * instruction set this CPU supports.  This could be done in user space,
> - * but it's not easy, and we've already done it here.
> + * Provides information on the availiable set of ISA extensions to users=
pace,
> + * via a bitmap that coorespends to each single-letter ISA extension.  T=
his is
> + * essentially defunct, but will remain for compatibility with userspace.
>   */
> -#define ELF_HWCAP	(elf_hwcap)
> +#define ELF_HWCAP	(elf_hwcap & ((1UL << RISCV_ISA_EXT_BASE) - 1))

Should that not be a GENMASK, or is there a reason not to use that here?
Away from a setup where I can poke at it though, so, since you say this
has only been exported in for-next, preventing us running out of hwcap
sounds like a great idea.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>  extern unsigned long elf_hwcap;
> =20
>  /*
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index ee9c80fe0062..831bebacb7fb 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -52,18 +52,10 @@
> =20
>  #include <linux/jump_label.h>
> =20
> -/*
> - * This yields a mask that user programs can use to figure out what
> - * instruction set this cpu supports.
> - */
> -#define ELF_HWCAP		(elf_hwcap)
> -
>  enum {
>  	CAP_HWCAP =3D 1,
>  };
> =20
> -extern unsigned long elf_hwcap;
> -
>  struct riscv_isa_ext_data {
>  	/* Name of the extension displayed to userspace via /proc/cpuinfo */
>  	char uprop[RISCV_ISA_EXT_NAME_LEN_MAX];
> --=20
> 2.39.0
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
>=20

--SoSb8XEwlijywC/Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9yzhgAKCRB4tDGHoIJi
0g3ZAP93eOwG2y+YVyG10qaCQqhxbZXCJxM84AUh7tCqW0LVXwEAu3M0H1g8VaPf
ZR4HatmcZTP2dBa19c1u8xRdxJ9RJAk=
=2z0R
-----END PGP SIGNATURE-----

--SoSb8XEwlijywC/Z--


--===============6947012771055455618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6947012771055455618==--

