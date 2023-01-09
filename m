Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33546C5479D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 22:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrYSazuNsL6ue4g2ghkDj2i6WGNECxJ/ysuzidDHDr0=; b=EzF6I8xCsueI7F8NC4lDJQqgCz
	MqeBzPMmhQoRlpHRA5AqHDEWb5z4qcN3+nVY0+nFI1ABKdAXA4OLNWvEUHiT4gn+/zOjuWjictweD
	+7MD5oTetqsfNEaAgsRwZNKuG1z1SZa8yW3gKW82gzsGTzCtgthVhFui3Xoiyb5IE0uxfL6uDAEvu
	UD0NsgfD4gNNm8J4TGJuladPNWk3ICU2gUp4FCdnKP41hWvuZm/+zrT25vbC+pxrDNZ8RJkkLWbzO
	yZPbj7R8hdF7kCziyhePZf0csD8UQsNQTDmOgL6lCQucTrDdFLhCgQYaOUXkmVH56mXtBaWHrNhWS
	iA6jUr2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF0mC-004Vnv-Ns; Mon, 09 Jan 2023 22:37:56 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF0m9-004Vmb-Fr
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 22:37:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1B78CB81074;
	Mon,  9 Jan 2023 22:37:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D2B9C433EF;
	Mon,  9 Jan 2023 22:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673303869;
	bh=0tzv+NPEv8PAe4bjORRXn2A25NN8VO0RygaOf0htzDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KMBRq3lij49mCrFBNfoYdjSamMToQLnb3SdZQhCBxpHCwW0VBiJwzehxmV03wcSJW
	 R1/l21K7/LQ5qYdTUeQgePNsIKPi6I6to2bO1gOexre7ewZSbOyhn/tYhobtuwVsU/
	 VB+Sz4kC3adeaLHg5DXRGWjinjw7uTyWdPidbRkeuQbxk8nIGTXOcm2Y5KYMf8IFqf
	 aPdm1YeoHe3BdVM6pNhxEy52YVYHjj5n9c4AM13B4+W/TKvVhTdOl8a3xYZq15ar9R
	 IPiI22UD6m7oachWHN3HB9WdqWyplPJB0fgi/6RkveMCHmr3OXHacKjmPmL2yTQM2L
	 P76/DBcB0XEmA==
Date: Mon, 9 Jan 2023 22:37:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
	ajones@ventanamicro.com, jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 4/5] RISC-V: add infrastructure to allow different
 str* implementations
Message-ID: <Y7yXOfIAKj9ct1SD@spud>
References: <20230109181755.2383085-1-heiko@sntech.de>
 <20230109181755.2383085-5-heiko@sntech.de>
MIME-Version: 1.0
In-Reply-To: <20230109181755.2383085-5-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_143753_852725_B836C184 
X-CRM114-Status: GOOD (  24.93  )
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
Content-Type: multipart/mixed; boundary="===============5998550590942842889=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5998550590942842889==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RyaBGhJt1xJ/vInx"
Content-Disposition: inline


--RyaBGhJt1xJ/vInx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 09, 2023 at 07:17:54PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>=20
> Depending on supported extensions on specific RISC-V cores,
> optimized str* functions might make sense.
>=20
> This adds basic infrastructure to allow patching the function calls
> via alternatives later on.
>=20
> The Linux kernel provides standard implementations for string functions
> but when architectures want to extend them, they need to provide their
> own.
>=20
> The added generic string functions are done in assembler (taken from
> disassembling the main-kernel functions for now) to allow us to control
> the used registers and extend them with optimized variants.
>=20
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

asm looks the same as what I previously provided a review for, but I
assume you dropped cos of the EFI stub stuff? You can have it back I
suppose..
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  arch/riscv/include/asm/string.h | 10 +++++++++
>  arch/riscv/kernel/riscv_ksyms.c |  3 +++
>  arch/riscv/lib/Makefile         |  3 +++
>  arch/riscv/lib/strcmp.S         | 37 ++++++++++++++++++++++++++++++
>  arch/riscv/lib/strlen.S         | 28 +++++++++++++++++++++++
>  arch/riscv/lib/strncmp.S        | 40 +++++++++++++++++++++++++++++++++
>  arch/riscv/purgatory/Makefile   | 13 +++++++++++
>  7 files changed, 134 insertions(+)
>  create mode 100644 arch/riscv/lib/strcmp.S
>  create mode 100644 arch/riscv/lib/strlen.S
>  create mode 100644 arch/riscv/lib/strncmp.S
>=20
> diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/str=
ing.h
> index 909049366555..a96b1fea24fe 100644
> --- a/arch/riscv/include/asm/string.h
> +++ b/arch/riscv/include/asm/string.h
> @@ -18,6 +18,16 @@ extern asmlinkage void *__memcpy(void *, const void *,=
 size_t);
>  #define __HAVE_ARCH_MEMMOVE
>  extern asmlinkage void *memmove(void *, const void *, size_t);
>  extern asmlinkage void *__memmove(void *, const void *, size_t);
> +
> +#define __HAVE_ARCH_STRCMP
> +extern asmlinkage int strcmp(const char *cs, const char *ct);
> +
> +#define __HAVE_ARCH_STRLEN
> +extern asmlinkage __kernel_size_t strlen(const char *);
> +
> +#define __HAVE_ARCH_STRNCMP
> +extern asmlinkage int strncmp(const char *cs, const char *ct, size_t cou=
nt);
> +
>  /* For those files which don't want to check by kasan. */
>  #if defined(CONFIG_KASAN) && !defined(__SANITIZE_ADDRESS__)
>  #define memcpy(dst, src, len) __memcpy(dst, src, len)
> diff --git a/arch/riscv/kernel/riscv_ksyms.c b/arch/riscv/kernel/riscv_ks=
yms.c
> index 5ab1c7e1a6ed..a72879b4249a 100644
> --- a/arch/riscv/kernel/riscv_ksyms.c
> +++ b/arch/riscv/kernel/riscv_ksyms.c
> @@ -12,6 +12,9 @@
>  EXPORT_SYMBOL(memset);
>  EXPORT_SYMBOL(memcpy);
>  EXPORT_SYMBOL(memmove);
> +EXPORT_SYMBOL(strcmp);
> +EXPORT_SYMBOL(strlen);
> +EXPORT_SYMBOL(strncmp);
>  EXPORT_SYMBOL(__memset);
>  EXPORT_SYMBOL(__memcpy);
>  EXPORT_SYMBOL(__memmove);
> diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> index 25d5c9664e57..6c74b0bedd60 100644
> --- a/arch/riscv/lib/Makefile
> +++ b/arch/riscv/lib/Makefile
> @@ -3,6 +3,9 @@ lib-y			+=3D delay.o
>  lib-y			+=3D memcpy.o
>  lib-y			+=3D memset.o
>  lib-y			+=3D memmove.o
> +lib-y			+=3D strcmp.o
> +lib-y			+=3D strlen.o
> +lib-y			+=3D strncmp.o
>  lib-$(CONFIG_MMU)	+=3D uaccess.o
>  lib-$(CONFIG_64BIT)	+=3D tishift.o
> =20
> diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
> new file mode 100644
> index 000000000000..94440fb8390c
> --- /dev/null
> +++ b/arch/riscv/lib/strcmp.S
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <linux/linkage.h>
> +#include <asm/asm.h>
> +#include <asm-generic/export.h>
> +
> +/* int strcmp(const char *cs, const char *ct) */
> +SYM_FUNC_START(strcmp)
> +	/*
> +	 * Returns
> +	 *   a0 - comparison result, value like strcmp
> +	 *
> +	 * Parameters
> +	 *   a0 - string1
> +	 *   a1 - string2
> +	 *
> +	 * Clobbers
> +	 *   t0, t1, t2
> +	 */
> +	mv	t2, a1
> +1:
> +	lbu	t1, 0(a0)
> +	lbu	t0, 0(a1)
> +	addi	a0, a0, 1
> +	addi	a1, a1, 1
> +	beq	t1, t0, 3f
> +	li	a0, 1
> +	bgeu	t1, t0, 2f
> +	li	a0, -1
> +2:
> +	mv	a1, t2
> +	ret
> +3:
> +	bnez	t1, 1b
> +	li	a0, 0
> +	j	2b
> +SYM_FUNC_END(strcmp)
> diff --git a/arch/riscv/lib/strlen.S b/arch/riscv/lib/strlen.S
> new file mode 100644
> index 000000000000..09a7aaff26c8
> --- /dev/null
> +++ b/arch/riscv/lib/strlen.S
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <linux/linkage.h>
> +#include <asm/asm.h>
> +#include <asm-generic/export.h>
> +
> +/* int strlen(const char *s) */
> +SYM_FUNC_START(strlen)
> +	/*
> +	 * Returns
> +	 *   a0 - string length
> +	 *
> +	 * Parameters
> +	 *   a0 - String to measure
> +	 *
> +	 * Clobbers:
> +	 *   t0, t1
> +	 */
> +	mv	t1, a0
> +1:
> +	lbu	t0, 0(t1)
> +	bnez	t0, 2f
> +	sub	a0, t1, a0
> +	ret
> +2:
> +	addi	t1, t1, 1
> +	j	1b
> +SYM_FUNC_END(strlen)
> diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
> new file mode 100644
> index 000000000000..493ab6febcb2
> --- /dev/null
> +++ b/arch/riscv/lib/strncmp.S
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <linux/linkage.h>
> +#include <asm/asm.h>
> +#include <asm-generic/export.h>
> +
> +/* int strncmp(const char *cs, const char *ct, size_t count) */
> +SYM_FUNC_START(strncmp)
> +	/*
> +	 * Returns
> +	 *   a0 - comparison result, value like strncmp
> +	 *
> +	 * Parameters
> +	 *   a0 - string1
> +	 *   a1 - string2
> +	 *   a2 - number of characters to compare
> +	 *
> +	 * Clobbers
> +	 *   t0, t1, t2
> +	 */
> +	li	t0, 0
> +1:
> +	beq	a2, t0, 4f
> +	add	t1, a0, t0
> +	add	t2, a1, t0
> +	lbu	t1, 0(t1)
> +	lbu	t2, 0(t2)
> +	beq	t1, t2, 3f
> +	li	a0, 1
> +	bgeu	t1, t2, 2f
> +	li	a0, -1
> +2:
> +	ret
> +3:
> +	addi	t0, t0, 1
> +	bnez	t1, 1b
> +4:
> +	li	a0, 0
> +	j	2b
> +SYM_FUNC_END(strncmp)
> diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
> index dd58e1d99397..d16bf715a586 100644
> --- a/arch/riscv/purgatory/Makefile
> +++ b/arch/riscv/purgatory/Makefile
> @@ -2,6 +2,7 @@
>  OBJECT_FILES_NON_STANDARD :=3D y
> =20
>  purgatory-y :=3D purgatory.o sha256.o entry.o string.o ctype.o memcpy.o =
memset.o
> +purgatory-y +=3D strcmp.o strlen.o strncmp.o
> =20
>  targets +=3D $(purgatory-y)
>  PURGATORY_OBJS =3D $(addprefix $(obj)/,$(purgatory-y))
> @@ -18,6 +19,15 @@ $(obj)/memcpy.o: $(srctree)/arch/riscv/lib/memcpy.S FO=
RCE
>  $(obj)/memset.o: $(srctree)/arch/riscv/lib/memset.S FORCE
>  	$(call if_changed_rule,as_o_S)
> =20
> +$(obj)/strcmp.o: $(srctree)/arch/riscv/lib/strcmp.S FORCE
> +	$(call if_changed_rule,as_o_S)
> +
> +$(obj)/strlen.o: $(srctree)/arch/riscv/lib/strlen.S FORCE
> +	$(call if_changed_rule,as_o_S)
> +
> +$(obj)/strncmp.o: $(srctree)/arch/riscv/lib/strncmp.S FORCE
> +	$(call if_changed_rule,as_o_S)
> +
>  $(obj)/sha256.o: $(srctree)/lib/crypto/sha256.c FORCE
>  	$(call if_changed_rule,cc_o_c)
> =20
> @@ -77,6 +87,9 @@ CFLAGS_ctype.o			+=3D $(PURGATORY_CFLAGS)
>  AFLAGS_REMOVE_entry.o		+=3D -Wa,-gdwarf-2
>  AFLAGS_REMOVE_memcpy.o		+=3D -Wa,-gdwarf-2
>  AFLAGS_REMOVE_memset.o		+=3D -Wa,-gdwarf-2
> +AFLAGS_REMOVE_strcmp.o		+=3D -Wa,-gdwarf-2
> +AFLAGS_REMOVE_strlen.o		+=3D -Wa,-gdwarf-2
> +AFLAGS_REMOVE_strncmp.o		+=3D -Wa,-gdwarf-2
> =20
>  $(obj)/purgatory.ro: $(PURGATORY_OBJS) FORCE
>  		$(call if_changed,ld)
> --=20
> 2.35.1
>=20

--RyaBGhJt1xJ/vInx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7yXOQAKCRB4tDGHoIJi
0mCzAQCPNTDUCTiW7s6RaPjQnfVsaVvhYcnJmPe5EMNDt6vIEAEA8H09ruZl0itq
ZzFoaojajDPByN9quNTa7cdMxHINPQI=
=rlIQ
-----END PGP SIGNATURE-----

--RyaBGhJt1xJ/vInx--


--===============5998550590942842889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5998550590942842889==--

