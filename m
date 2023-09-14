Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DEEEDE9B8
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 12:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjKmvvyksAtqlrGhV6D6HRXlQtvrZqRvPzArIrEuw1U=; b=Fg/lBmADWG1VN2KJ1p8YelrBfy
	9zJ7GegtB6+q9W1SzpLMA9uzbrHXQJYr5exL2F5230idrDEDDxuScbsQKsvloMuRj4hxzR/V4Cj9k
	pDEnZLeqUqBciLXlqV/EWvB2ILcYsZ9nQer/KAXWfAPENU25Ohwj0h9l2scPKPTWYfKePWHLU1KWT
	uEp+ihU9nbXt521yWf1V1iwNsg7rCi6QUTudBp2NtGrfMV2kP8IK6krjBGtt3IKRz/e+BBVev1t4D
	Lf/Gv7cDP1CNNNSENLCcMT+yn3qE7QPJpzRwRMo2JCYef/kqzyILoOtfyVjjihTGxtkuV/Ftc9quJ
	m+B0erBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qglQ0-008K9Z-1A;
	Thu, 14 Sep 2023 12:26:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qglPw-008K8P-0E
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 12:25:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1694694355; x=1726230355;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HJlzrAeo93TkBO1fhktara6aQCFCKUQZNPHBitNOMUQ=;
  b=sdlhOLlKYVLf/B7hoVidiGM8sb+LC455bO9ibnXkY/9QzhlCfe08i6S+
   n/EPugJ3T+08y+gDXweSXFwMLxbwTOlu5PkDaEYDJidE8+ZM9sId30TP2
   sVm8Ae/QUNAIBZFClKh1E/nZqTsV+L/22uydNAoPZtAqjQ3h2BWZPzi8h
   TdyCCR5PFyGRapV+TNnAf2PTIAg9M9OcJK2JdVTAeeWBgMEUbK3tyoY6w
   RJxYLVGwjhCKmZUVF32yG7cHecOXRMXDO8VHwLyHx+galCdftMbZJ8qKk
   /GWy2Rht1bfRJrFgX3EYZ9g6rM4OToGqaHYuwy9gIdRm4aMlwQa57HNhu
   Q==;
X-CSE-ConnectionGUID: QKxE2V1US4G+wzgrB/0g+g==
X-CSE-MsgGUID: 89K2Ub50Tl6JuOGJN3+BYQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="asc'?scan'208";a="4509475"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Sep 2023 05:25:47 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 14 Sep 2023 05:25:41 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 14 Sep 2023 05:25:39 -0700
Date: Thu, 14 Sep 2023 13:25:23 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v4 2/5] riscv: Add checksum library
Message-ID: <20230914-mural-deskbound-0e37d0767f6f@wendy>
References: <20230911-optimize_checksum-v4-0-77cc2ad9e9d7@rivosinc.com>
 <20230911-optimize_checksum-v4-2-77cc2ad9e9d7@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230911-optimize_checksum-v4-2-77cc2ad9e9d7@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_052556_206176_71A6944D 
X-CRM114-Status: GOOD (  40.01  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4443411305438206208=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4443411305438206208==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r4YJk3IvZNW4gems"
Content-Disposition: inline

--r4YJk3IvZNW4gems
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 11, 2023 at 03:57:12PM -0700, Charlie Jenkins wrote:
> Provide a 32 and 64 bit version of do_csum. When compiled for 32-bit
> will load from the buffer in groups of 32 bits, and when compiled for
> 64-bit will load in groups of 64 bits. Benchmarking by proxy compiling
> csum_ipv6_magic (64-bit version) for an x86 chip as well as running
> the riscv generated code in QEMU, discovered that summing in a
> tree-like structure is about 4% faster than doing 64-bit reads.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/include/asm/checksum.h |  11 ++
>  arch/riscv/lib/Makefile           |   1 +
>  arch/riscv/lib/csum.c             | 210 ++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 222 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/c=
hecksum.h
> index 0d7fc8275a5e..a09a4053fb87 100644
> --- a/arch/riscv/include/asm/checksum.h
> +++ b/arch/riscv/include/asm/checksum.h
> @@ -16,6 +16,14 @@ typedef unsigned int csum_t;
>  typedef unsigned long csum_t;
>  #endif
> =20
> +/* Default version is sufficient for 32 bit */
> +#ifdef CONFIG_64BIT
> +#define _HAVE_ARCH_IPV6_CSUM
> +__sum16 csum_ipv6_magic(const struct in6_addr *saddr,
> +			const struct in6_addr *daddr,
> +			__u32 len, __u8 proto, __wsum sum);
> +#endif
> +
>  /*
>   *	Fold a partial checksum without adding pseudo headers
>   */
> @@ -90,6 +98,9 @@ static inline __sum16 ip_fast_csum(const void *iph, uns=
igned int ihl)
> =20
>  #define ip_fast_csum ip_fast_csum
> =20
> +extern unsigned int do_csum(const unsigned char *buff, int len);
> +#define do_csum do_csum
> +
>  #include <asm-generic/checksum.h>
> =20
>  #endif // __ASM_RISCV_CHECKSUM_H
> diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> index 26cb2502ecf8..2aa1a4ad361f 100644
> --- a/arch/riscv/lib/Makefile
> +++ b/arch/riscv/lib/Makefile
> @@ -6,6 +6,7 @@ lib-y			+=3D memmove.o
>  lib-y			+=3D strcmp.o
>  lib-y			+=3D strlen.o
>  lib-y			+=3D strncmp.o
> +lib-y			+=3D csum.o
>  lib-$(CONFIG_MMU)	+=3D uaccess.o
>  lib-$(CONFIG_64BIT)	+=3D tishift.o
>  lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+=3D clear_page.o
> diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
> new file mode 100644
> index 000000000000..47d98c51bab2
> --- /dev/null
> +++ b/arch/riscv/lib/csum.c
> @@ -0,0 +1,210 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * IP checksum library
> + *
> + * Influenced by arch/arm64/lib/csum.c
> + * Copyright (C) 2023 Rivos Inc.
> + */
> +#include <linux/bitops.h>
> +#include <linux/compiler.h>
> +#include <linux/kasan-checks.h>
> +#include <linux/kernel.h>
> +
> +#include <net/checksum.h>
> +
> +/* Default version is sufficient for 32 bit */
> +#ifndef CONFIG_32BIT
> +__sum16 csum_ipv6_magic(const struct in6_addr *saddr,
> +			const struct in6_addr *daddr,
> +			__u32 len, __u8 proto, __wsum csum)
> +{
> +	/*
> +	 * Inform the compiler/processor that the operation we are performing is
> +	 * "Commutative and Associative" by summing parts of the checksum in a
> +	 * tree-like structure (Section 2(A) of "Computing the Internet
> +	 * Checksum"). Furthermore, defer the overflow until the end of the
> +	 * computation which is shown to be valid in Section 2(C)(1) of the
> +	 * same handbook.
> +	 */
> +	unsigned long sum, sum1, sum2, sum3, sum4, ulen, uproto;
> +
> +	uproto =3D htonl(proto);
> +	ulen =3D htonl(len);
> +
> +	sum   =3D saddr->s6_addr32[0];
> +	sum  +=3D saddr->s6_addr32[1];
> +	sum1  =3D saddr->s6_addr32[2];
> +	sum1 +=3D saddr->s6_addr32[3];
> +
> +	sum2  =3D daddr->s6_addr32[0];
> +	sum2 +=3D daddr->s6_addr32[1];
> +	sum3  =3D daddr->s6_addr32[2];
> +	sum3 +=3D daddr->s6_addr32[3];
> +
> +	sum4  =3D csum;
> +	sum4 +=3D ulen;
> +	sum4 +=3D uproto;
> +
> +	sum  +=3D sum1;
> +	sum2 +=3D sum3;
> +
> +	sum +=3D sum2;
> +	sum +=3D sum4;
> +
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
> +	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> +		csum_t fold_temp;
> +
> +		/*
> +		 * Zbb is likely available when the kernel is compiled with Zbb
> +		 * support, so nop when Zbb is available and jump when Zbb is
> +		 * not available.
> +		 */
> +		asm_volatile_goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
> +					      RISCV_ISA_EXT_ZBB, 1)
> +				  :
> +				  :
> +				  :
> +				  : no_zbb);
> +		asm(".option push					\n\
> +		.option arch,+zbb					\n\
> +			rori	%[fold_temp], %[sum], 32		\n\
> +			add	%[sum], %[fold_temp], %[sum]		\n\
> +			srli	%[sum], %[sum], 32			\n\
> +			not	%[fold_temp], %[sum]			\n\
> +			roriw	%[sum], %[sum], 16			\n\
> +			subw	%[sum], %[fold_temp], %[sum]		\n\
> +		.option pop"
> +		: [sum] "+r" (sum), [fold_temp] "=3D&r" (fold_temp));
> +		return (__force __sum16)(sum >> 16);
> +	}
> +no_zbb:
> +	sum +=3D (sum >> 32) | (sum << 32);
> +	sum >>=3D 32;
> +	return csum_fold((__force __wsum)sum);
> +}
> +EXPORT_SYMBOL(csum_ipv6_magic);
> +#endif // !CONFIG_32BIT
> +
> +#ifdef CONFIG_32BIT
> +#define OFFSET_MASK 3
> +#elif CONFIG_64BIT
> +#define OFFSET_MASK 7
> +#endif
> +
> +/*
> + * Perform a checksum on an arbitrary memory address.
> + * Algorithm accounts for buff being misaligned.
> + * If buff is not aligned, will over-read bytes but not use the bytes th=
at it
> + * shouldn't. The same thing will occur on the tail-end of the read.
> + */
> +unsigned int __no_sanitize_address do_csum(const unsigned char *buff, in=
t len)
> +{
> +	unsigned int offset, shift;
> +	csum_t csum, data;
> +	const csum_t *ptr;
> +
> +	if (unlikely(len <=3D 0))
> +		return 0;
> +	/*
> +	 * To align the address, grab the whole first byte in buff.
> +	 * Since it is inside of a same byte, it will never cross pages or cache
> +	 * lines.
> +	 * Directly call KASAN with the alignment we will be using.
> +	 */
> +	offset =3D (csum_t)buff & OFFSET_MASK;
> +	kasan_check_read(buff, len);
> +	ptr =3D (const csum_t *)(buff - offset);
> +	len =3D len + offset - sizeof(csum_t);
> +
> +	/*
> +	 * Clear the most signifant bits that were over-read if buff was not
> +	 * aligned.
> +	 */
> +	shift =3D offset * 8;
> +	data =3D *ptr;
> +#ifdef __LITTLE_ENDIAN
> +	data =3D (data >> shift) << shift;
> +#else
> +	data =3D (data << shift) >> shift;
> +#endif
> +	/*
> +	 * Do 32-bit reads on RV32 and 64-bit reads otherwise. This should be
> +	 * faster than doing 32-bit reads on architectures that support larger
> +	 * reads.
> +	 */
> +	while (len > 0) {
> +		csum +=3D data;

arch/riscv/lib/csum.c:137:3: warning: variable 'csum' is uninitialized when=
 used here [-Wuninitialized]
                csum +=3D data;
                ^~~~
arch/riscv/lib/csum.c:104:13: note: initialize the variable 'csum' to silen=
ce this warning
        csum_t csum, data;
                   ^
                    =3D 0
> +		csum +=3D csum < data;
> +		len -=3D sizeof(csum_t);
> +		ptr +=3D 1;
> +		data =3D *ptr;
> +	}
> +
> +	/*
> +	 * Perform alignment (and over-read) bytes on the tail if any bytes
> +	 * leftover.
> +	 */
> +	shift =3D len * -8;
> +#ifdef __LITTLE_ENDIAN
> +	data =3D (data << shift) >> shift;
> +#else
> +	data =3D (data >> shift) << shift;
> +#endif
> +	csum +=3D data;
> +	csum +=3D csum < data;
> +
> +	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
> +		goto no_zbb;

I think this is missing a change for IS_ENABLED(CONFIG_RISCV_ISA_ZBB)?
arch/riscv/lib/csum.c:180:1: warning: unknown option, expected 'push', 'pop=
', 'rvc', 'norvc', 'relax' or 'norelax' [-Winline-asm]
                .option arch,+zbb                               \n\
^
<inline asm>:2:11: note: instantiated into assembly here
                .option arch,+zbb                              =20
                        ^
arch/riscv/lib/csum.c:181:1: error: instruction requires the following: 'Zb=
b' (Basic Bit-Manipulation) or 'Zbkb' (Bitmanip instructions for Cryptograp=
hy)
                        rori    %[fold_temp], %[csum], 32       \n\
^
<inline asm>:3:4: note: instantiated into assembly here
                        rori    a2, a0, 32     =20
                        ^
arch/riscv/lib/csum.c:184:1: error: instruction requires the following: 'Zb=
b' (Basic Bit-Manipulation) or 'Zbkb' (Bitmanip instructions for Cryptograp=
hy)
                        roriw   %[fold_temp], %[csum], 16       \n\
^
<inline asm>:6:4: note: instantiated into assembly here
                        roriw   a2, a0, 16     =20
                        ^
arch/riscv/lib/csum.c:188:1: error: instruction requires the following: 'Zb=
b' (Basic Bit-Manipulation) or 'Zbkb' (Bitmanip instructions for Cryptograp=
hy)
                        rev8    %[csum], %[csum]                \n\
^
<inline asm>:10:4: note: instantiated into assembly here
                        rev8    a0, a0         =20
                        ^
2 warnings and 3 errors generated.

clang before 17 doesn't support `.option arch`, so the guard is required
around any code using it. You've got the guard on the other `.option
arch` user above, so that one seems to have escaped notice ;)

Going forward, it'd be good to test this stuff with non-latest clang to
make sure you appropriately consider the !Zbb cases.


> +
> +	unsigned int fold_temp;
> +
> +	if (IS_ENABLED(CONFIG_32BIT)) {
> +		asm_volatile_goto(".option push			\n\
> +		.option arch,+zbb				\n\
> +			rori	%[fold_temp], %[csum], 16	\n\
> +			andi	%[offset], %[offset], 1		\n\
> +			add	%[csum], %[fold_temp], %[csum]	\n\
> +			beq	%[offset], zero, %l[end]	\n\
> +			rev8	%[csum], %[csum]		\n\
> +			zext.h	%[csum], %[csum]		\n\
> +		.option pop"
> +			: [csum] "+r" (csum), [fold_temp] "=3D&r" (fold_temp)
> +			: [offset] "r" (offset)
> +			:
> +			: end);
> +
> +		return csum;
> +	} else {
> +		asm_volatile_goto(".option push			\n\
> +		.option arch,+zbb				\n\
> +			rori	%[fold_temp], %[csum], 32	\n\
> +			add	%[csum], %[fold_temp], %[csum]	\n\
> +			srli	%[csum], %[csum], 32		\n\
> +			roriw	%[fold_temp], %[csum], 16	\n\
> +			addw	%[csum], %[fold_temp], %[csum]	\n\
> +			andi	%[offset], %[offset], 1		\n\
> +			beq	%[offset], zero, %l[end]	\n\
> +			rev8	%[csum], %[csum]		\n\
> +			srli	%[csum], %[csum], 32		\n\
> +			zext.h	%[csum], %[csum]		\n\
> +		.option pop"
> +			: [csum] "+r" (csum), [fold_temp] "=3D&r" (fold_temp)
> +			: [offset] "r" (offset)
> +			:
> +			: end);
> +
> +		return csum;
> +	}
> +end:
> +		return csum >> 16;
> +no_zbb:
> +#ifndef CONFIG_32BIT

These can also be moved to IS_ENABLED() FYI, since there's no 32-bit
stuff here that'd break the build for 64-bit. Ditto elsewhere where
you've got similar stuff.

Cheers,
Conor.

> +		csum +=3D (csum >> 32) | (csum << 32);
> +		csum >>=3D 32;
> +#endif
> +	csum =3D (unsigned int)csum + (((unsigned int)csum >> 16) | ((unsigned =
int)csum << 16));
> +	if (offset & 1)
> +		return (unsigned short)swab32(csum);
> +	return csum >> 16;
> +}
>=20
> --=20
> 2.42.0
>=20

--r4YJk3IvZNW4gems
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQL7swAKCRB4tDGHoIJi
0tyEAQDz9XuSg7SvCZ5yY6WFOSHOCoyIEcyEDhjHBLx1M0TQ9AEA3FUAFGMc1FNV
OUHdTLRu12PETsDfYD+lYftKer795AM=
=ec8q
-----END PGP SIGNATURE-----

--r4YJk3IvZNW4gems--


--===============4443411305438206208==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4443411305438206208==--

