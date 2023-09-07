Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFDEEE14D6
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 09:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NQx0jL6IyOvRTGctTO5C5d1ew1OE+mD6fpdyRSDizWQ=; b=nEenSQFYPGkJvvE3teJb0aXBZH
	YrPtZpYZqgyp7eouGpl5HvUyUstKMI1KQkB0SYCV6NQqsLgtq9WJGtxDlTVum7ibC5ta5stiKJkWG
	27iQKWeTjlcp96+aGlUannzM8apGlXdaUHxwENiwmj9F8S30ZsV+wY20J3FrC6D0/epBjmwofqOz2
	G6vcfY+pBTsgVC8pQ2cJhGVlnXEC73wyLvwIvIflhI1h6VOemoGsESiRY7u82o9rbajbPCK8oBxiK
	AsF94IIXOwarM8HwfJXAgFjs6Xn7dBfZebCxIccwG/mV6hzKjh+yLnCdPBigs3Sphq+vwIXfm11Xx
	BcBeZzCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeBVY-00BhWr-1X;
	Thu, 07 Sep 2023 09:41:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeBVW-00BhWJ-0F
	for linux-riscv@lists.infradead.org;
	Thu, 07 Sep 2023 09:41:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B7759B81D91;
	Thu,  7 Sep 2023 09:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC2BC433BB;
	Thu,  7 Sep 2023 09:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694079659;
	bh=fVwmDBjeb+tD3UPCUflOOiky/QrJqD59Xdcd3KL0bCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P/osNB8gCPqa2lRmfE87JqSmWRoXMV3dskjicYBovNM9zCcUpyYTNtIYIvmazwCEQ
	 p5YTTpENLPn3nOoM1a0p2GNeb8YIxNkP3Ukh1pmHnzopHSeMfsO6LzoA9jiJvHfuz+
	 qlaHcPPm4HPXsTtRkCM5/eDYTKB9+WyWwXP6sfnnvFHNYBO2aG+cqbBQ5eut6zLwW9
	 2o9hU3Cyj69tRWiTWyj90C/frxOfdp9UIrc3QhtsWm/QGMMz7q1ZdhtxhO8ru9AwT1
	 litUokOsMXNx3Sj0azyaycZOBIfWirQGfCqEPOoudORgd3o85XZqGJ0e14IHotiLZk
	 N7/N8c/XN4Fgw==
Date: Thu, 7 Sep 2023 10:40:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v2 1/5] riscv: Checksum header
Message-ID: <20230907-f8c8993dbeb24d5ea5310ec7@fedora>
References: <20230905-optimize_checksum-v2-0-ccd658db743b@rivosinc.com>
 <20230905-optimize_checksum-v2-1-ccd658db743b@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230905-optimize_checksum-v2-1-ccd658db743b@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_024102_377622_12F56EE2 
X-CRM114-Status: GOOD (  28.88  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4188188415848678093=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4188188415848678093==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PvA718pBPhJra4oM"
Content-Disposition: inline


--PvA718pBPhJra4oM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Charlie,

Just a passing thought that I can't really test since I am meant to be
on holidays...

On Tue, Sep 05, 2023 at 09:46:50PM -0700, Charlie Jenkins wrote:
> Provide checksum algorithms that have been designed to leverage riscv
> instructions such as rotate. In 64-bit, can take advantage of the larger
> register to avoid some overflow checking.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/include/asm/checksum.h | 96 +++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 96 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/c=
hecksum.h
> new file mode 100644
> index 000000000000..573714b9ea15
> --- /dev/null
> +++ b/arch/riscv/include/asm/checksum.h
> @@ -0,0 +1,96 @@
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
> +#ifdef CONFIG_32BIT
> +typedef unsigned int csum_t;
> +#else
> +typedef unsigned long csum_t;
> +#endif
> +
> +/*
> + *	Fold a partial checksum without adding pseudo headers
> + */
> +static inline __sum16 csum_fold(__wsum sum)
> +{
> +	sum +=3D (sum >> 16) | (sum << 16);
> +	return (__force __sum16)(~(sum >> 16));
> +}
> +
> +#define csum_fold csum_fold
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
> +	csum_t csum =3D 0;
> +	int pos =3D 0;
> +
> +	do {
> +		csum +=3D ((const unsigned int *)iph)[pos];
> +#ifdef CONFIG_32BIT
> +		csum +=3D csum < ((const unsigned int *)iph)[pos];
> +#endif // !CONFIG_32BIT

Some of this ifdeffery really should become IS_ENABLED(), there's
nothing in some of them that can't just get removed by the compiler.

> +	} while (++pos < ihl);
> +
> +#ifdef CONFIG_RISCV_ISA_ZBB

This here I can't test since I'm supposed to be AFK, but can this also
be an IS_ENABLED()? I know it is guarding code that the toolchain may
not support, but does it get removed before that matters?

I mainly ask because there's a host of ifdeffery here & the code would
be a lot easier to understand if we could cut it down to a minimum.

> +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> +		csum_t fold_temp;
> +
> +		asm_volatile_goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
> +					      RISCV_ISA_EXT_ZBB, 1)
> +		    :
> +		    :
> +		    :
> +		    : no_zbb);
> +#ifdef CONFIG_32BIT
> +		asm(".option push				\n\
> +		.option arch,+zbb				\n\
> +			rori %[fold_temp],%[csum],16		\n\
> +			add %[csum],%[fold_temp],%[csum]	\n\
> +		.option pop"
> +		: [csum] "+r" (csum), [fold_temp] "=3D&r" (fold_temp));
> +#else // !CONFIG_32BIT
> +		asm(".option push				\n\
> +		.option arch,+zbb				\n\
> +		    rori %[fold_temp], %[csum], 32		\n\
> +		    add %[csum], %[fold_temp], %[csum]		\n\
> +		    srli %[csum], %[csum], 32			\n\
> +		    roriw %[fold_temp], %[csum], 16		\n\
> +		    addw %[csum], %[fold_temp], %[csum]		\n\
> +		.option pop"
> +		: [csum] "+r" (csum), [fold_temp] "=3D&r" (fold_temp));
> +#endif // !CONFIG_32BIT

These 3 I think are pretty easy to follow immediately, but...

> +		return ~(csum >> 16);
> +	}
> +	/*
> +	 * ZBB only saves three instructions on 32-bit and five on 64-bit so not
> +	 * worth checking if supported without Alternatives.
> +	 */
> +no_zbb:
> +#endif // CONFIG_RISCV_ISA_ZBB
> +#ifdef CONFIG_32BIT
> +#else // !CONFIG_32BIT
> +	csum +=3D (csum >> 32) | (csum << 32);
> +	csum >>=3D 16;
> +#endif // !CONFIG_32BIT

=2E..these ones here could be converted too, afaict.

Thanks,
Conor.

> +	return csum_fold((__force __wsum)csum);
> +}
> +
> +#define ip_fast_csum ip_fast_csum
> +
> +#include <asm-generic/checksum.h>
> +
> +#endif // __ASM_RISCV_CHECKSUM_H
>=20
> --=20
> 2.42.0
>=20

--PvA718pBPhJra4oM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPmapgAKCRB4tDGHoIJi
0lt2AQCbafR8hu15IRQ5HxwqjZt2awaWYUECINcNIg8CoyA1rwEA4K4H9iZ3I9ZJ
PGMG08r7ADQFrFvhT2ccfF2mxHkk/wQ=
=XATt
-----END PGP SIGNATURE-----

--PvA718pBPhJra4oM--


--===============4188188415848678093==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4188188415848678093==--

