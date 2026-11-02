Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01174606A324
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 18:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dxojqQri;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kcl+JEKa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=frJQuR55C7DLg8UqmNkHSwLQT+BMpZeg1WVFit3HXb4=; b=dxojqQrioifYU4VK8S0jZgHanp
	EuVkEsB45CDD10tAEp3/FOmwvT7gIqN342Ewl9LZgzGE161FLhUIluB4dZb0+IEqD67ROqpOhMbxe
	3IZEAkyN6EIrPoWe9YSM0GxmVYJYKIwAQrTbzw8tbgkS8EEgPcp3Tpk8UW15ASrUGptFtnWqF7ufN
	k+ZLDP3Pg4z/TqhO/wQoDKG1qdpXWHPJQkFleYLL5FP/5ZwpTK+y6wRAgPKS4wm21Rmx633Zv1l/4
	bZPclQy5IEb0FpKhsBEXm+wM8obk2HRpT7lB7sbpBriG2vWcxzdVC98xYx4xP3ksEznSfE5oFDos+
	m1oeH/qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNx34-0000000016S-0lym;
	Mon, 02 Nov 2026 18:46:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNx32-0000000016L-2bOv
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 18:46:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E5F0441E48;
	Mon,  2 Nov 2026 18:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C601F00A16;
	Mon,  2 Nov 2026 18:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793645183;
	bh=DQcF0odyCIUlrfVPEjnim+XwFPEmtuNJchmElHw/5yQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kcl+JEKaPVFrx07fMcveGiworBDB7WGqmq+A0TVBZpsEDr17BXTsVxrfg185sNGv9
	 BeR7Ip0lrwtecW830MaW9Y21d/hzHNaVMnP+hfHrGW7CMLvskc1PF43EbelQw/ZRuD
	 61HMNgouKww8jc07mplKrjDHRmHxjuysnwRAceYYrFTaF7xcsSNiDHwjKXlYrDFsMA
	 dp5zNrwu2lUCNPWpF8gmk6kN+1iRUVW2K/G+QMcXk0EAqRjq+LDFlHQPxrzHbjQs3a
	 5mAm5ivKcO6TX//yPUaTO7QqSxLGwK0qYwuiAYH62PFgPR7nAaxeqhNqoSC4NC6Alq
	 AdzNWLIC9tVcQ==
Date: Mon, 2 Nov 2026 18:46:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, cfu@wavecomp.com,
	torvalds@linux-foundation.org, olof@lixom.net,
	aleksa.paunovic@htecgroup.com, arikalo@gmail.com,
	Boqun Feng <boqun@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] riscv: build kernel atomics from LR/SC when Zaamo
 is disabled
Message-ID: <20261102-persuader-catering-5ed81c35ae0e@spud>
References: <20261026-lrsc-only-v3-0-ec29c8190fb1@mobileye.com>
 <20261026-lrsc-only-v3-1-ec29c8190fb1@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261026-lrsc-only-v3-1-ec29c8190fb1@mobileye.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7583413514543023997=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7583413514543023997==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="74/AMNX5qTZlduSM"
Content-Disposition: inline

--74/AMNX5qTZlduSM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 11:20:02AM +0200, Vladimir Kondratiev wrote:
> The A extension is Zaamo plus Zalrsc. MIPS P8700 implements only
> Zalrsc, and its AMO instructions trap to SBI. A typical atomic is
> about 40 cycles with LR/SC and about 600 cycles with an emulated AMO,
> so keep the existing AMO sequences when the toolchain defines
> __riscv_zaamo or __riscv_atomic, and use an LR/SC loop otherwise.
>=20
> Add RISCV_ISA_ZAAMO and RISCV_ISA_ZALRSC. Both default on, and that
> selection still passes "a" in -march. Zaamo can be turned off only
> with CONFIG_NONPORTABLE; Zalrsc remains required because cmpxchg and
> the conditional atomics are LR/SC sequences. An LR/SC-only build
> passes _zalrsc instead of "a".
>=20
> Suggested-by: Chao-ying Fu <cfu@wavecomp.com>
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>

As you can see by the lkp reports, this is not the right way to do this.

> ---
>  arch/riscv/Kconfig               | 23 +++++++++++++++++
>  arch/riscv/Makefile              | 15 ++++++++---
>  arch/riscv/include/asm/atomic.h  | 56 ++++++++++++++++++++++++++++++++++=
+++++-
>  arch/riscv/include/asm/bitops.h  | 51 ++++++++++++++++++++++++++++++++++=
++
>  arch/riscv/include/asm/cmpxchg.h | 18 +++++++++++++
>  arch/riscv/include/asm/futex.h   | 53 ++++++++++++++++++++++++++++++++++=
+++
>  arch/riscv/kernel/entry.S        |  9 +++++++
>  arch/riscv/kernel/head.S         | 14 ++++++++++
>  8 files changed, 234 insertions(+), 5 deletions(-)
> +
>  config TOOLCHAIN_HAS_ZBB
>  	bool
>  	default y
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 5874ca30f4f6..1403445482b9 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -730,6 +730,29 @@ config RISCV_ISA_ZACAS
> =20
>  	  If you don't know what to do here, say Y.
> =20
> +config RISCV_ISA_ZAAMO
> +	bool "Zaamo extension support for AMO atomics" if NONPORTABLE
> +	default y
> +	help
> +	  Use AMO instructions for kernel atomic memory operations. When
> +	  disabled, those operations are built from LR/SC and the kernel
> +	  is compiled with zalrsc instead of the A extension.
> +
> +	  Disable this only for a hart that implements Zalrsc but not
> +	  Zaamo, such as the MIPS P8700. The resulting kernel cannot run
> +	  on a hart without LR/SC.

The text here doesn't really make much sense, given it is default
disabled as it depends on NONPORTABLE that is default disabled.
If this is retained, it should be default n and the text reworded.

> +
> +	  If you don't know what to do here, say Y.
> +
> +config RISCV_ISA_ZALRSC
> +	def_bool y
> +	help
> +	  Zalrsc provides LR/SC. cmpxchg and the conditional atomics
> +	  require it, so it is always enabled.

So why have a kconfig option for it then? It's pointless if always
enabled.

> +
> +config RISCV_ISA_A
> +	def_bool RISCV_ISA_ZAAMO && RISCV_ISA_ZALRSC

I think this all needs a redo...

> diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/ato=
mic.h
> index 616b8b332ac5..dc6a8c95c975 100644
> --- a/arch/riscv/include/asm/atomic.h
> +++ b/arch/riscv/include/asm/atomic.h
> @@ -50,6 +50,7 @@ static __always_inline void arch_atomic64_set(atomic64_=
t *v, s64 i)
>   * have the AQ or RL bits set.  These don't return anything, so there's =
only
>   * one version to worry about.
>   */
> +#if defined(__riscv_atomic) || defined(__riscv_zaamo)
>  #define ATOMIC_OP(op, asm_op, I, asm_type, c_type, prefix)		\
>  static __always_inline							\
>  void arch_atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)	\
> @@ -59,7 +60,25 @@ void arch_atomic##prefix##_##op(c_type i, atomic##pref=
ix##_t *v)	\
>  		: "+A" (v->counter)					\
>  		: "r" (I)						\
>  		: "memory");						\
> -}									\
> +}
> +#elif defined(__riscv_zalrsc)

=2E..why are we making this a compiletime decision in the first place?
Why can't this be an alternative, starting with the zalrsc stuff and
moving to the better implementation if available?
Is there some zaamo code that gets generated automatically that we lose
out on by always building the kernel with zalrsc instead of with all of a?

> +#define ATOMIC_OP(op, asm_op, I, asm_type, c_type, prefix)		\
> +static __always_inline							\
> +void arch_atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)	\
> +{									\
> +	register c_type ret, temp;					\
> +	__asm__ __volatile__ (						\
> +		"1:	lr." #asm_type " %1, %0\n"			\
> +		"	" #asm_op " %2, %1, %3\n"			\
> +		"	sc." #asm_type " %2, %2, %0\n"			\
> +		"	bnez %2, 1b\n"					\
> +		: "+A" (v->counter), "=3D&r" (ret), "=3D&r" (temp)		\
> +		: "r" (I)						\
> +		: "memory");						\
> +}
> +#else
> +#error "Need AMO or LR/SC atomics"
> +#endif
> =20
>  #ifdef CONFIG_GENERIC_ATOMIC64
>  #define ATOMIC_OPS(op, asm_op, I)					\
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 44f5a439741a..23ecf68a761d 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -58,8 +58,9 @@ ifeq ($(CONFIG_SHADOW_CALL_STACK),y)
>  endif
> =20
>  # ISA string setting
> -riscv-march-$(CONFIG_ARCH_RV32I)	:=3D rv32ima
> -riscv-march-$(CONFIG_ARCH_RV64I)	:=3D rv64ima
> +riscv-march-$(CONFIG_ARCH_RV32I)	:=3D rv32im
> +riscv-march-$(CONFIG_ARCH_RV64I)	:=3D rv64im
> +riscv-march-$(CONFIG_RISCV_ISA_A)	:=3D $(riscv-march-y)a
>  riscv-march-$(CONFIG_FPU)		:=3D $(riscv-march-y)fd
>  riscv-march-$(CONFIG_RISCV_ISA_C)	:=3D $(riscv-march-y)c
>  riscv-march-$(CONFIG_RISCV_ISA_V)	:=3D $(riscv-march-y)v
> @@ -75,9 +76,15 @@ else
>  riscv-march-$(CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI) :=3D $(ris=
cv-march-y)_zicsr_zifencei
>  endif
> =20
> -KBUILD_BASE_ISA =3D -march=3D$(shell echo $(riscv-march-y) | sed -E 's/(=
rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
> +KBUILD_BASE_ISA =3D -march=3D$(shell echo $(riscv-march-y) | sed -E 's/(=
rv32ima?|rv64ima?)fd([^v_]*)v?/\1\2/')
>  export KBUILD_BASE_ISA
> =20
> +# if "A" not supported, toolchain shall support zaamo/zalrsc

Obviously this is not true, disabling some Kconfig option has no bearing
on what a toolchain is capable of. You cannot put _foo in here without
checking if the toolchain actually supports it.
If no zaamo instructions are automatically generated, this dance isn't
needed, so my suggestions for how to proceed depend on the answer to
that question.

pw-bot: changes-requested

Thanks,
Conor.

> +ifneq ($(CONFIG_RISCV_ISA_A),y)
> +riscv-march-$(CONFIG_RISCV_ISA_ZAAMO) :=3D $(riscv-march-y)_zaamo
> +riscv-march-$(CONFIG_RISCV_ISA_ZALRSC) :=3D $(riscv-march-y)_zalrsc
> +endif
> +
>  # Remove F,D,V from isa string for all. Keep extensions between "fd" and=
 "v" by
>  # matching non-v and non-multi-letter extensions out with the filter ([^=
v_]*)
>  KBUILD_CFLAGS +=3D $(KBUILD_BASE_ISA)
> @@ -85,7 +92,7 @@ KBUILD_CFLAGS +=3D $(KBUILD_BASE_ISA)
>  KBUILD_AFLAGS +=3D -march=3D$(riscv-march-y)
> =20
>  # For C code built with floating-point support, exclude V but keep F and=
 D.
> -CC_FLAGS_FPU  :=3D -march=3D$(shell echo $(riscv-march-y) | sed -E 's/(r=
v32ima|rv64ima)([^v_]*)v?/\1\2/')
> +CC_FLAGS_FPU  :=3D -march=3D$(shell echo $(riscv-march-y) | sed -E 's/(r=
v32ima?|rv64ima?)([^v_]*)v?/\1\2/')
> =20
>  KBUILD_CFLAGS +=3D -mno-save-restore
> =20


--74/AMNX5qTZlduSM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaujaegAKCRB4tDGHoIJi
0twEAQDDW6aEG4OTEFj6k3Zk47Dtt0u0/OQa8WYeKCAzHSbaeAD/Zxuo2XAaZ1ga
snL5+uj2Xkkjkwiv7H8qVuxx5ynvIwc=
=PfX1
-----END PGP SIGNATURE-----

--74/AMNX5qTZlduSM--


--===============7583413514543023997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7583413514543023997==--

