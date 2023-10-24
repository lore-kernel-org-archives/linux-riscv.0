Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBA4C07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 11:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgzYrogi1cNUaDQLqURe5DajqyPnABYrVAODkCBcQsM=; b=USaQZVHwEvfs9o1/fCPfkj05fu
	PNwQp0sxoVC8dtNjiGJhbxigzsKiNrO4SX3m6UOtH0VCscj+vK+KFUzuTXHtoXar5TMhLlzRQ8NY6
	gRwjskvKg8CKk7kk3ALrP1jwvHi54VONMTczA15dA/WURY4CErEngumCQ1Ly0vjJ0IlFeO/bz5fwS
	8nvfdZJnxQ6QM7/Y2+r3JIOqbgrWB8U7Ilqqh0wGC8QBB5IuAf9/UnpiR//m6TN6kO3PEEjV6MDF3
	aqJPvyjeMiMDhXZ/xIwzbHqGjGmMTYKnfyoeV5xWrWxlSCMGLGJRD8nGWr/bOvU2lz0kD8qeT3Xjb
	Q8IejabA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvFOa-009dUE-0p;
	Tue, 24 Oct 2023 11:16:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvFOW-009dSo-0G
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 11:16:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 38B10B824EA;
	Tue, 24 Oct 2023 11:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6CEC433C7;
	Tue, 24 Oct 2023 11:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698146177;
	bh=1tbURerriBcXiTgS5QjoIMC5iNcmgc81tEEgpcdtulI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QAC+phY4+lesri3RvlnIqZepvqck9gYdd0uMk1qbH3sk53qqEbMUBc9rzw73BfzHf
	 YkTAhx5sX6QXXHb81xtLIyap0xCcrIgl5QyP4ZAYBoiDAShxoNcOonl0IrbZaiWZOe
	 aBRYh0SJvnYc3zHAoNjCydfUixtIuAKlysuP0qGfccq0a8D2qTw0g33h9qAWw2ZidP
	 QX2eoDCKT5utPu6aHen++x6gjbxCX59VafJOz1W61zWyv+UYwl4n7k1A3I+X0H3j3K
	 QjfS44NsVK67SsXysyhu0J2xsJqjdZcMI6+WeIuyus1EvUKVSe1B9SShchuwowC+LM
	 oPS4I5ccsR0Jw==
Date: Tue, 24 Oct 2023 12:16:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, bjorn@kernel.org, peterz@infradead.org,
	tglx@linutronix.de, Vincent Chen <vincent.chen@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [v3, 1/5] riscv: Add support for kernel mode vector
Message-ID: <20231024-lubricant-safeness-af8de3e65f45@spud>
References: <20231019154552.23351-1-andy.chiu@sifive.com>
 <20231019154552.23351-2-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20231019154552.23351-2-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_041620_446528_58A75983 
X-CRM114-Status: GOOD (  32.92  )
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
Content-Type: multipart/mixed; boundary="===============2361920465127963234=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2361920465127963234==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GNSVN89s38jqtsBd"
Content-Disposition: inline


--GNSVN89s38jqtsBd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 03:45:48PM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>=20
> Add kernel_vector_begin() and kernel_vector_end() function declarations
> and corresponding definitions in kernel_mode_vector.c
>=20
> These are needed to wrap uses of vector in kernel mode.
>=20
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
> Changelog v3:
>  - Reorder patch 1 to patch 3 to make use of
>    {get,put}_cpu_vector_context later.
>  - Export {get,put}_cpu_vector_context.
>  - Save V context after disabling preemption. (Guo)
>  - Fix a build fail. (Conor)

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>  - Remove irqs_disabled() check as it is not needed, fix styling. (Bj=F6r=
n)
> Changelog v2:
>  - 's/kernel_rvv/kernel_vector' and return void in kernel_vector_begin
>    (Conor)
>  - export may_use_simd to include/asm/simd.h
> ---
>  arch/riscv/include/asm/simd.h          | 49 +++++++++++++
>  arch/riscv/include/asm/vector.h        |  4 ++
>  arch/riscv/kernel/Makefile             |  1 +
>  arch/riscv/kernel/kernel_mode_vector.c | 99 ++++++++++++++++++++++++++
>  4 files changed, 153 insertions(+)
>  create mode 100644 arch/riscv/include/asm/simd.h
>  create mode 100644 arch/riscv/kernel/kernel_mode_vector.c
>=20
> diff --git a/arch/riscv/include/asm/simd.h b/arch/riscv/include/asm/simd.h
> new file mode 100644
> index 000000000000..0c5ba555b460
> --- /dev/null
> +++ b/arch/riscv/include/asm/simd.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2017 Linaro Ltd. <ard.biesheuvel@linaro.org>
> + * Copyright (C) 2023 SiFive
> + */
> +
> +#ifndef __ASM_SIMD_H
> +#define __ASM_SIMD_H
> +
> +#include <linux/compiler.h>
> +#include <linux/irqflags.h>
> +#include <linux/percpu.h>
> +#include <linux/preempt.h>
> +#include <linux/types.h>
> +
> +#ifdef CONFIG_RISCV_ISA_V
> +
> +DECLARE_PER_CPU(bool, vector_context_busy);
> +
> +/*
> + * may_use_simd - whether it is allowable at this time to issue vector
> + *                instructions or access the vector register file
> + *
> + * Callers must not assume that the result remains true beyond the next
> + * preempt_enable() or return from softirq context.
> + */
> +static __must_check inline bool may_use_simd(void)
> +{
> +	/*
> +	 * vector_context_busy is only set while preemption is disabled,
> +	 * and is clear whenever preemption is enabled. Since
> +	 * this_cpu_read() is atomic w.r.t. preemption, vector_context_busy
> +	 * cannot change under our feet -- if it's set we cannot be
> +	 * migrated, and if it's clear we cannot be migrated to a CPU
> +	 * where it is set.
> +	 */
> +	return !in_hardirq() && !in_nmi() && !this_cpu_read(vector_context_busy=
);
> +}
> +
> +#else /* ! CONFIG_RISCV_ISA_V */
> +
> +static __must_check inline bool may_use_simd(void)
> +{
> +	return false;
> +}
> +
> +#endif /* ! CONFIG_RISCV_ISA_V */
> +
> +#endif
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vec=
tor.h
> index c5ee07b3df07..8b8ece690ea1 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -22,6 +22,10 @@
>  extern unsigned long riscv_v_vsize;
>  int riscv_v_setup_vsize(void);
>  bool riscv_v_first_use_handler(struct pt_regs *regs);
> +void kernel_vector_begin(void);
> +void kernel_vector_end(void);
> +void get_cpu_vector_context(void);
> +void put_cpu_vector_context(void);
> =20
>  static __always_inline bool has_vector(void)
>  {
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index 95cf25d48405..0597bb668b6e 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -62,6 +62,7 @@ obj-$(CONFIG_MMU) +=3D vdso.o vdso/
>  obj-$(CONFIG_RISCV_M_MODE)	+=3D traps_misaligned.o
>  obj-$(CONFIG_FPU)		+=3D fpu.o
>  obj-$(CONFIG_RISCV_ISA_V)	+=3D vector.o
> +obj-$(CONFIG_RISCV_ISA_V)	+=3D kernel_mode_vector.o
>  obj-$(CONFIG_SMP)		+=3D smpboot.o
>  obj-$(CONFIG_SMP)		+=3D smp.o
>  obj-$(CONFIG_SMP)		+=3D cpu_ops.o
> diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/k=
ernel_mode_vector.c
> new file mode 100644
> index 000000000000..74936e108771
> --- /dev/null
> +++ b/arch/riscv/kernel/kernel_mode_vector.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2012 ARM Ltd.
> + * Author: Catalin Marinas <catalin.marinas@arm.com>
> + * Copyright (C) 2017 Linaro Ltd. <ard.biesheuvel@linaro.org>
> + * Copyright (C) 2021 SiFive
> + */
> +#include <linux/compiler.h>
> +#include <linux/irqflags.h>
> +#include <linux/percpu.h>
> +#include <linux/preempt.h>
> +#include <linux/types.h>
> +
> +#include <asm/vector.h>
> +#include <asm/switch_to.h>
> +#include <asm/simd.h>
> +
> +DEFINE_PER_CPU(bool, vector_context_busy);
> +
> +/*
> + * Claim ownership of the CPU vector context for use by the calling cont=
ext.
> + *
> + * The caller may freely manipulate the vector context metadata until
> + * put_cpu_vector_context() is called.
> + */
> +void get_cpu_vector_context(void)
> +{
> +	bool busy;
> +
> +	preempt_disable();
> +	busy =3D __this_cpu_xchg(vector_context_busy, true);
> +
> +	WARN_ON(busy);
> +}
> +
> +/*
> + * Release the CPU vector context.
> + *
> + * Must be called from a context in which get_cpu_vector_context() was
> + * previously called, with no call to put_cpu_vector_context() in the
> + * meantime.
> + */
> +void put_cpu_vector_context(void)
> +{
> +	bool busy =3D __this_cpu_xchg(vector_context_busy, false);
> +
> +	WARN_ON(!busy);
> +	preempt_enable();
> +}
> +
> +/*
> + * kernel_vector_begin(): obtain the CPU vector registers for use by the=
 calling
> + * context
> + *
> + * Must not be called unless may_use_simd() returns true.
> + * Task context in the vector registers is saved back to memory as neces=
sary.
> + *
> + * A matching call to kernel_vector_end() must be made before returning =
=66rom the
> + * calling context.
> + *
> + * The caller may freely use the vector registers until kernel_vector_en=
d() is
> + * called.
> + */
> +void kernel_vector_begin(void)
> +{
> +	if (WARN_ON(!has_vector()))
> +		return;
> +
> +	BUG_ON(!may_use_simd());
> +
> +	get_cpu_vector_context();
> +
> +	riscv_v_vstate_save(current, task_pt_regs(current));
> +
> +	riscv_v_enable();
> +}
> +EXPORT_SYMBOL_GPL(kernel_vector_begin);
> +
> +/*
> + * kernel_vector_end(): give the CPU vector registers back to the curren=
t task
> + *
> + * Must be called from a context in which kernel_vector_begin() was prev=
iously
> + * called, with no call to kernel_vector_end() in the meantime.
> + *
> + * The caller must not use the vector registers after this function is c=
alled,
> + * unless kernel_vector_begin() is called again in the meantime.
> + */
> +void kernel_vector_end(void)
> +{
> +	if (WARN_ON(!has_vector()))
> +		return;
> +
> +	riscv_v_vstate_restore(current, task_pt_regs(current));
> +
> +	riscv_v_disable();
> +
> +	put_cpu_vector_context();
> +}
> +EXPORT_SYMBOL_GPL(kernel_vector_end);
> --=20
> 2.17.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--GNSVN89s38jqtsBd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTenegAKCRB4tDGHoIJi
0oNiAP0dGqKKsNzekp2VoGm53+epWuGUJ6OEvyPDMLMkqH4tBgD/WTq8daJISsJI
8EkLaXWKIBUTUhd2nxgkQ5uhM0XizA4=
=NuEm
-----END PGP SIGNATURE-----

--GNSVN89s38jqtsBd--


--===============2361920465127963234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2361920465127963234==--

