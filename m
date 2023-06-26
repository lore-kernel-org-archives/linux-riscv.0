Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBEE7C0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 14:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AK93dS0n/mIB4pqtA8p0iXk6NWrbSvAXoF1+JDeqzvY=; b=i5Jg54nn+Kp0ng6x6Mif9s+qX0
	HtEQoHdLG54iwTsumCig7ccT00ZgEUvCmgkcb5t/A/2KYyIqloq4M9RzCu2qMWucStgE/iHzZPrRN
	tfdx6JTEZJDIsXwWKJoJevJHTAVygWEfSLdIvbcnCu531eYffdObhurnqNPrLlfdwdqfI9e7uK+eF
	KOOxxRyiKbIamBfqgcwaKDulnK7V3dyMbocUgbtx1YaUNhR6rttKZ5h42ZgfqxL0X2wxHiLyyRxka
	A0KgmVcttA4zD3Tsg3ETOW76Tzjdc+rrLHnVJBtWAKovIn4zW6MnMF1inReDPvPOM9VtuGayOAagZ
	w7XD7LzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDn0E-00AN0E-2d;
	Mon, 26 Jun 2023 14:15:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDn0A-00AMyL-2L
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 14:15:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687788934; x=1719324934;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EOL0bYi5YqXT5l339gZWbhX8NGlzc7WUULnLm/RbjRE=;
  b=g2lJUCqIR+ebzJmmOmyM5hKjCWuee+oqQUxOjN1ebyZDiaUoGlSzGTrt
   1YmtiPsuDTaSRpbTNCD6r2VsodRpFj/7vPeDr0TkR3glPOB/tAq8/piGb
   hlEVQtG/oMTwjZuHhl1DkqYY2zn4VybR2rS1BZF0qi7zANgoWvX+Xiq7O
   MAw1Gqs6UUiAZzxgn00zrhoJi7bMMDkXEH/03DSopQjLjm38RAEUKAJh/
   YVyr9U+Pye9y6OuY2M/RRu6gak5Ttfd9cV+lNOQUPsaE4QT61d7J9rdit
   m9VIBn43oZW1YPy5MnL5Punwwott315uq4LG9irqhtXRBwfd99E71w5Aq
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="asc'?scan'208";a="219871761"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jun 2023 07:15:29 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 26 Jun 2023 07:15:23 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 26 Jun 2023 07:15:19 -0700
Date: Mon, 26 Jun 2023 15:14:51 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH 1/2] RISC-V: Probe for unaligned access speed
Message-ID: <20230626-veneering-superglue-751719bd967c@wendy>
References: <20230623222016.3742145-1-evan@rivosinc.com>
 <20230623222016.3742145-2-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230623222016.3742145-2-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_071534_772543_0D7150A6 
X-CRM114-Status: GOOD (  33.73  )
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
Cc: linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Xianting Tian <xianting.tian@linux.alibaba.com>, Masahiro Yamada <masahiroy@kernel.org>, Greentime Hu <greentime.hu@sifive.com>, Simon Hosie <shosie@rivosinc.com>, Li Zhengyu <lizhengyu3@huawei.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org, Sia Jee Heng <jeeheng.sia@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andy.chiu@sifive.com>
Content-Type: multipart/mixed; boundary="===============0238390917551254109=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0238390917551254109==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1MEGOhFv0/yGwOYN"
Content-Disposition: inline

--1MEGOhFv0/yGwOYN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Evan,

Some minor nitpickery comments & one actual one.

On Fri, Jun 23, 2023 at 03:20:15PM -0700, Evan Green wrote:
> Rather than deferring misaligned access speed determinations to a vendor

Could you pick a consistent word to use? You've got "unaligned",
"misaligned" and "noalign" sprinkled through out the series.

> function, let's probe them and find out how fast they are. If we
> determine that a misaligned word access is faster than N byte accesses,
> mark the hardware's misaligned access as "fast".
>=20
> Fix the documentation as well to reflect this bar. Previously the only
> SoC that returned "fast" was the THead C906. The change to the
> documentation is more a clarification, since the C906 is fast in the
> sense of the corrected documentation.
>=20
> Signed-off-by: Evan Green <evan@rivosinc.com>
> ---
>=20
>  Documentation/riscv/hwprobe.rst     |  8 +--
>  arch/riscv/include/asm/cpufeature.h |  2 +
>  arch/riscv/kernel/Makefile          |  1 +
>  arch/riscv/kernel/copy-noalign.S    | 71 ++++++++++++++++++++++++++
>  arch/riscv/kernel/copy-noalign.h    | 13 +++++
>  arch/riscv/kernel/cpufeature.c      | 78 +++++++++++++++++++++++++++++
>  arch/riscv/kernel/smpboot.c         |  2 +
>  7 files changed, 171 insertions(+), 4 deletions(-)
>  create mode 100644 arch/riscv/kernel/copy-noalign.S
>  create mode 100644 arch/riscv/kernel/copy-noalign.h
>=20
> diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprob=
e.rst
> index 19165ebd82ba..710325751766 100644
> --- a/Documentation/riscv/hwprobe.rst
> +++ b/Documentation/riscv/hwprobe.rst
> @@ -88,12 +88,12 @@ The following keys are defined:
>      always extremely slow.
> =20
>    * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned accesses are su=
pported
> -    in hardware, but are slower than the cooresponding aligned accesses
> -    sequences.

Nice, fixed the typo by removing the offender ;)

> +    in hardware, but are slower than N byte accesses, where N is the nat=
ive
> +    word size.
> =20
>    * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned accesses are su=
pported
> -    in hardware and are faster than the cooresponding aligned accesses
> -    sequences.
> +    in hardware and are faster than N byte accesses, where N is the nati=
ve
> +    word size.
> =20
>    * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned accesses=
 are
>      not supported at all and will generate a misaligned address fault.
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm=
/cpufeature.h
> index 23fed53b8815..b8e917176616 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -30,4 +30,6 @@ DECLARE_PER_CPU(long, misaligned_access_speed);
>  /* Per-cpu ISA extensions. */
>  extern struct riscv_isainfo hart_isa[NR_CPUS];
> =20
> +void check_misaligned_access(int cpu);
> +
>  #endif
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index a42951911067..f934d7ab7840 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -34,6 +34,7 @@ extra-y +=3D vmlinux.lds
>  obj-y	+=3D head.o
>  obj-y	+=3D soc.o
>  obj-$(CONFIG_RISCV_ALTERNATIVE) +=3D alternative.o
> +obj-y	+=3D copy-noalign.o
>  obj-y	+=3D cpu.o
>  obj-y	+=3D cpufeature.o
>  obj-y	+=3D entry.o
> diff --git a/arch/riscv/kernel/copy-noalign.S b/arch/riscv/kernel/copy-no=
align.S
> new file mode 100644
> index 000000000000..3807fc2324b2
> --- /dev/null
> +++ b/arch/riscv/kernel/copy-noalign.S
> @@ -0,0 +1,71 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (C) 2023 Rivos Inc. */
> +
> +#include <linux/linkage.h>
> +#include <asm/asm.h>
> +
> +	.text
> +
> +/* void __copy_words_unaligned(void *, const void *, size_t) */
> +/* Performs a memcpy without aligning buffers, using word loads and stor=
es. */
> +/* Note: The size is truncated to a multiple of 8 * SZREG */
> +ENTRY(__copy_words_unaligned)
> +	andi a4, a2, ~((8*SZREG)-1)
> +	beqz a4, 2f
> +	add a3, a1, a4
> +1:
> +	REG_L a4,       0(a1)
> +	REG_L a5,   SZREG(a1)
> +	REG_L a6, 2*SZREG(a1)
> +	REG_L a7, 3*SZREG(a1)
> +	REG_L t0, 4*SZREG(a1)
> +	REG_L t1, 5*SZREG(a1)
> +	REG_L t2, 6*SZREG(a1)
> +	REG_L t3, 7*SZREG(a1)
> +	REG_S a4,       0(a0)
> +	REG_S a5,   SZREG(a0)
> +	REG_S a6, 2*SZREG(a0)
> +	REG_S a7, 3*SZREG(a0)
> +	REG_S t0, 4*SZREG(a0)
> +	REG_S t1, 5*SZREG(a0)
> +	REG_S t2, 6*SZREG(a0)
> +	REG_S t3, 7*SZREG(a0)
> +	addi a0, a0, 8*SZREG
> +	addi a1, a1, 8*SZREG
> +	bltu a1, a3, 1b
> +
> +2:
> +	ret
> +END(__copy_words_unaligned)
> +
> +/* void __copy_bytes_unaligned(void *, const void *, size_t) */
> +/* Performs a memcpy without aligning buffers, using only byte accesses.=
 */
> +/* Note: The size is truncated to a multiple of 8 */
> +ENTRY(__copy_bytes_unaligned)
> +	andi a4, a2, ~(8-1)
> +	beqz a4, 2f
> +	add a3, a1, a4

Could you align operands for ASM please, to make this a little easier to
read?

> +1:
> +	lb a4, 0(a1)
> +	lb a5, 1(a1)
> +	lb a6, 2(a1)
> +	lb a7, 3(a1)
> +	lb t0, 4(a1)
> +	lb t1, 5(a1)
> +	lb t2, 6(a1)
> +	lb t3, 7(a1)
> +	sb a4, 0(a0)
> +	sb a5, 1(a0)
> +	sb a6, 2(a0)
> +	sb a7, 3(a0)
> +	sb t0, 4(a0)
> +	sb t1, 5(a0)
> +	sb t2, 6(a0)
> +	sb t3, 7(a0)
> +	addi a0, a0, 8
> +	addi a1, a1, 8
> +	bltu a1, a3, 1b
> +
> +2:
> +	ret
> +END(__copy_bytes_unaligned)
> diff --git a/arch/riscv/kernel/copy-noalign.h b/arch/riscv/kernel/copy-no=
align.h
> new file mode 100644
> index 000000000000..99fbb9c763e0
> --- /dev/null
> +++ b/arch/riscv/kernel/copy-noalign.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023 Rivos, Inc.
> + */
> +#ifndef __RISCV_KERNEL_COPY_NOALIGN_H
> +#define __RISCV_KERNEL_COPY_NOALIGN_H
> +
> +#include <linux/types.h>
> +
> +void __copy_words_unaligned(void *dst, const void *src, size_t size);
> +void __copy_bytes_unaligned(void *dst, const void *src, size_t size);
> +
> +#endif /* __RISCV_KERNEL_COPY_NOALIGN_H */
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index bdcf460ea53d..3f7200dcc00c 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -19,11 +19,21 @@
>  #include <asm/cacheflush.h>
>  #include <asm/cpufeature.h>
>  #include <asm/hwcap.h>
> +#include <asm/hwprobe.h>
>  #include <asm/patch.h>
>  #include <asm/processor.h>
>  #include <asm/vector.h>
> =20
> +#include "copy-noalign.h"
> +
>  #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
> +#define MISALIGNED_ACCESS_JIFFIES_LG2 1
> +#define MISALIGNED_BUFFER_SIZE 0x4000
> +#define MISALIGNED_COPY_SIZE ((MISALIGNED_BUFFER_SIZE / 2) - 0x80)
> +

I think this blank line is misplaced, it should go after NUM_ALPHA_EXTS
instead of (or as well as) here.

> +#define MISALIGNED_COPY_MBS(_count) \
> +	((HZ * (_count) * MISALIGNED_COPY_SIZE) >> \
> +	 (20 + MISALIGNED_ACCESS_JIFFIES_LG2))
> =20
>  unsigned long elf_hwcap __read_mostly;
> =20
> @@ -396,6 +406,74 @@ unsigned long riscv_get_elf_hwcap(void)
>  	return hwcap;
>  }
> =20
> +void check_misaligned_access(int cpu)
> +{
> +	unsigned long j0, j1;
> +	struct page *page;
> +	void *dst;
> +	void *src;
> +	long word_copies =3D 0;
> +	long byte_copies =3D 0;
> +	long speed =3D RISCV_HWPROBE_MISALIGNED_SLOW;

Is this not a change from current behaviour, that may actually lead to
incorrect reporting. Presently, only T-Head stuff sets a speed, so
hwprobe falls back to UNKNOWN for everything else. With this, we will
get slow set, for anything failing the test.
Slow is defined as "Misaligned accesses are supported in hardware, but
are slower than the cooresponding aligned accesses sequences (sic)", but
you have no way of knowing, based on the test you are performing, whether
the hardware supports it or if it is emulated by firmware.
Perhaps that is not relevant to userspace, but wanted to know your
thoughts.

> +
> +	page =3D alloc_pages(GFP_NOWAIT, get_order(MISALIGNED_BUFFER_SIZE));
> +	if (!page) {
> +		pr_warn("Can't alloc pages to measure memcpy performance");
> +		return;
> +	}
> +
> +	/* Make a misaligned destination buffer. */
> +	dst =3D (void *)((unsigned long)page_address(page) | 0x1);
> +	/* Misalign src as well, but differently (off by 1 + 2 =3D 3). */
> +	src =3D dst + (MISALIGNED_BUFFER_SIZE / 2);
> +	src +=3D 2;
> +	/* Do a warmup. */
> +	__copy_words_unaligned(dst, src, MISALIGNED_COPY_SIZE);
> +	preempt_disable();
> +	j0 =3D jiffies;
> +	while ((j1 =3D jiffies) =3D=3D j0)
> +		cpu_relax();
> +
> +	while (time_before(jiffies,
> +			   j1 + (1 << MISALIGNED_ACCESS_JIFFIES_LG2))) {

Does this not fit in 100 chars?

> +
> +		__copy_words_unaligned(dst, src, MISALIGNED_COPY_SIZE);
> +		word_copies +=3D 1;
> +	}
> +
> +	__copy_bytes_unaligned(dst, src, MISALIGNED_COPY_SIZE);
> +	j0 =3D jiffies;
> +	while ((j1 =3D jiffies) =3D=3D j0)
> +		cpu_relax();
> +
> +	while (time_before(jiffies,
> +			   j1 + (1 << MISALIGNED_ACCESS_JIFFIES_LG2))) {

Ditto here, no?

Cheers,
Conor.

--1MEGOhFv0/yGwOYN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJmdWwAKCRB4tDGHoIJi
0iWSAP4xarrlPG4R9SkLJFxVubg2IFOuYkh5xuvlZV+pd0+1zgD/UCRP7ocj6ZPy
guF6fu4HqRSO9y5bxS8fFD2xYLWmlQk=
=pvWh
-----END PGP SIGNATURE-----

--1MEGOhFv0/yGwOYN--


--===============0238390917551254109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0238390917551254109==--

