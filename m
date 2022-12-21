Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE20DC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Dec 2022 14:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNRvsIdiJ3YtWaiegjXDgI0b4rlQfTQsUY8gD2IPqfw=; b=l/gbj6cjn0+cHJzSFMWnwTrQU4
	IYZfNBcNsvVVH0cgxFk1sKFR2v4U9Gf80AJhs1F8vlqerte1zn0+wvU0Int0HtzJPDSCMimNA65td
	HfYyb6D2dQZqY/mtdSMWfAbm9U7WgL1CUaLWGkifV2px+kkkcggl0F18PurulTTTSxcaZU0VoMhdB
	rKyEZ71pbOwTITcTEwJwDFPzQIn397xojsSgGvt9lmjh0j2mcqwFjoeCeX8eafE7MI4H5ppzk6Ldr
	xnZgavK5OjcPqw9xtgFwQHM9+zmahcYcvByJuWRRsO6Mxzn+w+yt/EROsjVvXBY8/HwbmKdCI1Bj5
	TMpW6Wnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7zoH-00FU6T-HR; Wed, 21 Dec 2022 14:11:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7zjO-00FR6m-Pl
	for linux-riscv@lists.infradead.org; Wed, 21 Dec 2022 14:06:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2634C617DA;
	Wed, 21 Dec 2022 14:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C664EC433D2;
	Wed, 21 Dec 2022 14:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671631561;
	bh=Ck0yE0m3uMDWkByVfoktmC+dPVQRS8bJueL6UkGuRJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GcqohY7rBTQejUNU30H6ZXJlXV1gzopnDhB3YbngLQ5H4ldo3usPYtnwyMB8kehip
	 gvkecvTIlaby37F98ZnP2TaFpMvHqkW3nu3mnFMQVQzcGit5Uf4mzGz6/00VgOns5e
	 +DkoIaBbj+jtf1JQzp3AWGCBY5FRYlAPxhTcU2ig/aSgMuJSssckcsYAm7KCAczTqj
	 /YNTtSDeGUwiQ7vuuw6jSzmGezSVKD71n88RHUHG+No2ix3rpl2yWXfuLqMKD0tJda
	 0c9a78QIIYFk+PBbV4kx4eRC5M9kYLTOK3Kgxx/wquwmdODu7Ur1BWc9CglEF72NFd
	 caWVIAYIPqxLw==
Date: Wed, 21 Dec 2022 14:05:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-efi@vger.kernel.org
Subject: Re: [PATCH 4/6] riscv: Fix EFI stub usage of KASAN instrumented
 string functions
Message-ID: <Y6MSxBaJU7JqfkJO@spud>
References: <20221216162141.1701255-1-alexghiti@rivosinc.com>
 <20221216162141.1701255-5-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20221216162141.1701255-5-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_060603_216287_DFD0994C 
X-CRM114-Status: GOOD (  33.15  )
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
Content-Type: multipart/mixed; boundary="===============4178463201432161621=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4178463201432161621==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4Z+roZAZIwENsN21"
Content-Disposition: inline


--4Z+roZAZIwENsN21
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Alex!

On Fri, Dec 16, 2022 at 05:21:39PM +0100, Alexandre Ghiti wrote:
> The EFI stub must not use any KASAN instrumented code as the kernel
> proper did not initialize the thread pointer and the mapping for the
> KASAN shadow region.
>=20
> Avoid using generic string functions by copying stub dependencies from
> lib/string.c to drivers/firmware/efi/libstub/string.c as RISC-V does
> not implement architecture-specific versions of those functions.

To the unaware among us, how does this interact with Heiko's custom
functions for bitmanip extensions? Is this diametrically opposed to
that, or does it actually help avoid having to have special handling
for the efi stub?

Also, checkpatch seems to be rather unhappy with you here:
https://gist.github.com/conor-pwbot/e5b4c8f2c3b88b4a8fcab4df437613e2

Thanks,
Conor.

>=20
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/kernel/image-vars.h        |   8 --
>  drivers/firmware/efi/libstub/Makefile |   7 +-
>  drivers/firmware/efi/libstub/string.c | 133 ++++++++++++++++++++++++++
>  3 files changed, 137 insertions(+), 11 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-var=
s.h
> index d6e5f739905e..15616155008c 100644
> --- a/arch/riscv/kernel/image-vars.h
> +++ b/arch/riscv/kernel/image-vars.h
> @@ -23,14 +23,6 @@
>   * linked at. The routines below are all implemented in assembler in a
>   * position independent manner
>   */
> -__efistub_memcmp		=3D memcmp;
> -__efistub_memchr		=3D memchr;
> -__efistub_strlen		=3D strlen;
> -__efistub_strnlen		=3D strnlen;
> -__efistub_strcmp		=3D strcmp;
> -__efistub_strncmp		=3D strncmp;
> -__efistub_strrchr		=3D strrchr;
> -
>  __efistub__start		=3D _start;
>  __efistub__start_kernel		=3D _start_kernel;
>  __efistub__end			=3D _end;
> diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi=
/libstub/Makefile
> index b1601aad7e1a..031d2268bab5 100644
> --- a/drivers/firmware/efi/libstub/Makefile
> +++ b/drivers/firmware/efi/libstub/Makefile
> @@ -130,9 +130,10 @@ STUBCOPY_RELOC-$(CONFIG_ARM)	:=3D R_ARM_ABS
>  # also means that we need to be extra careful to make sure that the stub=
 does
>  # not rely on any absolute symbol references, considering that the virtu=
al
>  # kernel mapping that the linker uses is not active yet when the stub is
> -# executing. So build all C dependencies of the EFI stub into libstub, a=
nd do
> -# a verification pass to see if any absolute relocations exist in any of=
 the
> -# object files.
> +# executing. In addition, we need to make sure that the stub does not us=
e KASAN
> +# instrumented code like the generic string functions. So build all C
> +# dependencies of the EFI stub into libstub, and do a verification pass =
to see
> +# if any absolute relocations exist in any of the object files.
>  #
>  STUBCOPY_FLAGS-$(CONFIG_ARM64)	+=3D --prefix-alloc-sections=3D.init \
>  				   --prefix-symbols=3D__efistub_
> diff --git a/drivers/firmware/efi/libstub/string.c b/drivers/firmware/efi=
/libstub/string.c
> index 5d13e43869ee..5154ae6e7f10 100644
> --- a/drivers/firmware/efi/libstub/string.c
> +++ b/drivers/firmware/efi/libstub/string.c
> @@ -113,3 +113,136 @@ long simple_strtol(const char *cp, char **endp, uns=
igned int base)
> =20
>  	return simple_strtoull(cp, endp, base);
>  }
> +
> +#ifndef __HAVE_ARCH_STRLEN
> +/**
> + * strlen - Find the length of a string
> + * @s: The string to be sized
> + */
> +size_t strlen(const char *s)
> +{
> +	const char *sc;
> +
> +	for (sc =3D s; *sc !=3D '\0'; ++sc)
> +		/* nothing */;
> +	return sc - s;
> +}
> +EXPORT_SYMBOL(strlen);
> +#endif
> +
> +#ifndef __HAVE_ARCH_STRNLEN
> +/**
> + * strnlen - Find the length of a length-limited string
> + * @s: The string to be sized
> + * @count: The maximum number of bytes to search
> + */
> +size_t strnlen(const char *s, size_t count)
> +{
> +	const char *sc;
> +
> +	for (sc =3D s; count-- && *sc !=3D '\0'; ++sc)
> +		/* nothing */;
> +	return sc - s;
> +}
> +EXPORT_SYMBOL(strnlen);
> +#endif
> +
> +#ifndef __HAVE_ARCH_STRCMP
> +/**
> + * strcmp - Compare two strings
> + * @cs: One string
> + * @ct: Another string
> + */
> +int strcmp(const char *cs, const char *ct)
> +{
> +	unsigned char c1, c2;
> +
> +	while (1) {
> +		c1 =3D *cs++;
> +		c2 =3D *ct++;
> +		if (c1 !=3D c2)
> +			return c1 < c2 ? -1 : 1;
> +		if (!c1)
> +			break;
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL(strcmp);
> +#endif
> +
> +#ifndef __HAVE_ARCH_STRRCHR
> +/**
> + * strrchr - Find the last occurrence of a character in a string
> + * @s: The string to be searched
> + * @c: The character to search for
> + */
> +char *strrchr(const char *s, int c)
> +{
> +	const char *last =3D NULL;
> +	do {
> +		if (*s =3D=3D (char)c)
> +			last =3D s;
> +	} while (*s++);
> +	return (char *)last;
> +}
> +EXPORT_SYMBOL(strrchr);
> +#endif
> +
> +#ifndef __HAVE_ARCH_MEMCMP
> +/**
> + * memcmp - Compare two areas of memory
> + * @cs: One area of memory
> + * @ct: Another area of memory
> + * @count: The size of the area.
> + */
> +#undef memcmp
> +__visible int memcmp(const void *cs, const void *ct, size_t count)
> +{
> +	const unsigned char *su1, *su2;
> +	int res =3D 0;
> +
> +#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
> +	if (count >=3D sizeof(unsigned long)) {
> +		const unsigned long *u1 =3D cs;
> +		const unsigned long *u2 =3D ct;
> +		do {
> +			if (get_unaligned(u1) !=3D get_unaligned(u2))
> +				break;
> +			u1++;
> +			u2++;
> +			count -=3D sizeof(unsigned long);
> +		} while (count >=3D sizeof(unsigned long));
> +		cs =3D u1;
> +		ct =3D u2;
> +	}
> +#endif
> +	for (su1 =3D cs, su2 =3D ct; 0 < count; ++su1, ++su2, count--)
> +		if ((res =3D *su1 - *su2) !=3D 0)
> +			break;
> +	return res;
> +}
> +EXPORT_SYMBOL(memcmp);
> +#endif
> +
> +#ifndef __HAVE_ARCH_MEMCHR
> +/**
> + * memchr - Find a character in an area of memory.
> + * @s: The memory area
> + * @c: The byte to search for
> + * @n: The size of the area.
> + *
> + * returns the address of the first occurrence of @c, or %NULL
> + * if @c is not found
> + */
> +void *memchr(const void *s, int c, size_t n)
> +{
> +	const unsigned char *p =3D s;
> +	while (n-- !=3D 0) {
> +		if ((unsigned char)c =3D=3D *p++) {
> +			return (void *)(p - 1);
> +		}
> +	}
> +	return NULL;
> +}
> +EXPORT_SYMBOL(memchr);
> +#endif
> --=20
> 2.37.2
>=20
>=20

--4Z+roZAZIwENsN21
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6MSxAAKCRB4tDGHoIJi
0mbXAQCRub/h9CpyhAdOvFd4J3KWAuVL1MSqel/xv3XN0/rcygEArnRj9dMQHuyO
H7c87rEJ3F7mm/BJEC6mELfAmNm85QY=
=2eUj
-----END PGP SIGNATURE-----

--4Z+roZAZIwENsN21--


--===============4178463201432161621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4178463201432161621==--

