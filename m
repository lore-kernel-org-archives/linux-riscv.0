Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D973CDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 14:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWrvInpqZaZjhFDF7qODklNw8THE5s1MF1OWwiZIqA0=; b=vnDpcIzFexqCnEt+4hyGNv2iDN
	vPg1wXwOJB0Y51/hvHOpO3VY8o2SgpaA2uqMGC2jHnt6xHS9kwkxxa168NwUlwaurZKtKXvs6a7Y2
	PyFBjMQ/OIfQcfdsDWjUjiqQrwISaVV+t+1YHAuVb3k9bGcsiNqH4ixPXT7FBlnuEsN7o9aElnaQz
	PLVVuToYYfAlkDzLY7OqBGh8m7XoLHsz5xrluKLw9OcnCyjYvZPDbUw+/ahQNeeHP72dXmi5K5gwy
	ANNraEOv/bkHn07F8FixksINNKdX46GhARuy1wZA4ypwIpUI+xIBulDqZ5wNneQgXl3+Jy9AQo342
	pVqU6eig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqx52-001E5f-0f;
	Thu, 12 Oct 2023 14:54:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqx4y-001E4b-0I
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 14:54:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 4B94CB82458;
	Thu, 12 Oct 2023 14:54:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96553C433C7;
	Thu, 12 Oct 2023 14:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697122461;
	bh=+ojXCG56gMjVZw+vx9Pj6zEubeSQNGY9Yfj0hYNQrvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iqiaPRzY62d+KCn53LW4SeKoB5rJrf8XYH/0uzqIfa+WEd6tvkNAvImgd25Eql9wm
	 z9SfRMb3GsqCHUZiyrFhNSSR9eOR9DWiBiJALphEf+A+CboBiAb8nis1weMnpwdvZa
	 mQEeZBoedIqE1bXF3we+nYFkHweXsTDXK6AnC6i1vyuCJvN0UEShPSfclDBRB/zTmK
	 A7Rx/IhBWKziaV8gjoOEa1V6QyZyYYFqLiaKiSGBqKRWV1hFYRvJ38h1BCceYQtOn8
	 RdYbxGhpJlllcCDQYeSXQGXbiTwQS+NoB6f+ktAc8O2hFHaWBZd9V16tJZWUC01r8u
	 kH7rHVW6l27mg==
Date: Thu, 12 Oct 2023 15:54:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v7 2/4] riscv: Checksum header
Message-ID: <20231012-directory-drapery-fec6c7e2419d@spud>
References: <20230919-optimize_checksum-v7-0-06c7d0ddd5d6@rivosinc.com>
 <20230919-optimize_checksum-v7-2-06c7d0ddd5d6@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230919-optimize_checksum-v7-2-06c7d0ddd5d6@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_075424_449074_E1ECB326 
X-CRM114-Status: GOOD (  24.44  )
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
Cc: linux-arch@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4435737669001855464=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4435737669001855464==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/uRjsvow0K0+ny7V"
Content-Disposition: inline


--/uRjsvow0K0+ny7V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 11:44:31AM -0700, Charlie Jenkins wrote:
> Provide checksum algorithms that have been designed to leverage riscv
> instructions such as rotate. In 64-bit, can take advantage of the larger
> register to avoid some overflow checking.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

Same here,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

I think there are some "issues" attributed to this patch by the
automation - but they spurious. This diff here could not cause a
drivers/block/drbd/drbd_bitmap.c:1271: warning: Function parameter or membe=
r 'peer_device' not described in 'drbd_bm_write_copy_pages'
after all.

Cheers,
Conor.

> ---
>  arch/riscv/include/asm/checksum.h | 79 +++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 79 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/c=
hecksum.h
> new file mode 100644
> index 000000000000..dc0dd89f2a13
> --- /dev/null
> +++ b/arch/riscv/include/asm/checksum.h
> @@ -0,0 +1,79 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * IP checksum routines
> + *
> + * Copyright (C) 2023 Rivos Inc.
> + */
> +#ifndef __ASM_RISCV_CHECKSUM_H
> +#define __ASM_RISCV_CHECKSUM_H
> +
> +#include <linux/in6.h>
> +#include <linux/uaccess.h>
> +
> +#define ip_fast_csum ip_fast_csum
> +
> +#include <asm-generic/checksum.h>
> +
> +/*
> + * Quickly compute an IP checksum with the assumption that IPv4 headers =
will
> + * always be in multiples of 32-bits, and have an ihl of at least 5.
> + * @ihl is the number of 32 bit segments and must be greater than or equ=
al to 5.
> + * @iph is assumed to be word aligned.
> + */
> +static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
> +{
> +	unsigned long csum =3D 0;
> +	int pos =3D 0;
> +
> +	do {
> +		csum +=3D ((const unsigned int *)iph)[pos];
> +		if (IS_ENABLED(CONFIG_32BIT))
> +			csum +=3D csum < ((const unsigned int *)iph)[pos];
> +	} while (++pos < ihl);
> +
> +	/*
> +	 * ZBB only saves three instructions on 32-bit and five on 64-bit so not
> +	 * worth checking if supported without Alternatives.
> +	 */
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> +	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> +		unsigned long fold_temp;
> +
> +		asm_volatile_goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
> +					      RISCV_ISA_EXT_ZBB, 1)
> +		    :
> +		    :
> +		    :
> +		    : no_zbb);
> +
> +		if (IS_ENABLED(CONFIG_32BIT)) {
> +			asm(".option push				\n\
> +			.option arch,+zbb				\n\
> +				not	%[fold_temp], %[csum]		\n\
> +				rori	%[csum], %[csum], 16		\n\
> +				sub	%[csum], %[fold_temp], %[csum]	\n\
> +			.option pop"
> +			: [csum] "+r" (csum), [fold_temp] "=3D&r" (fold_temp));
> +		} else {
> +			asm(".option push				\n\
> +			.option arch,+zbb				\n\
> +				rori	%[fold_temp], %[csum], 32	\n\
> +				add	%[csum], %[fold_temp], %[csum]	\n\
> +				srli	%[csum], %[csum], 32		\n\
> +				not	%[fold_temp], %[csum]		\n\
> +				roriw	%[csum], %[csum], 16		\n\
> +				subw	%[csum], %[fold_temp], %[csum]	\n\
> +			.option pop"
> +			: [csum] "+r" (csum), [fold_temp] "=3D&r" (fold_temp));
> +		}
> +		return csum >> 16;
> +	}
> +no_zbb:
> +#ifndef CONFIG_32BIT
> +	csum +=3D (csum >> 32) | (csum << 32);
> +	csum >>=3D 32;
> +#endif
> +	return csum_fold((__force __wsum)csum);
> +}
> +
> +#endif // __ASM_RISCV_CHECKSUM_H
>=20
> --=20
> 2.42.0
>=20

--/uRjsvow0K0+ny7V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSgImQAKCRB4tDGHoIJi
0vbVAPwKRp4UXBThl9GOTew5j0FmY9XGj3v2k798QY2F9FGN2QEA6p0JzpE5uOBn
UP4ZzpdYbI/4Col0rf3CIiy6hz1TkA8=
=R5LB
-----END PGP SIGNATURE-----

--/uRjsvow0K0+ny7V--


--===============4435737669001855464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4435737669001855464==--

