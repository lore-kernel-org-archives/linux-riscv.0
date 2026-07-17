Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFF0C4451C
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 12:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MvEqwCIdosrENti2YBScJ3hLYQk3ewVJq3HS1Xtj2Lo=; b=RzO9iuXYmGUf0k
	tEVdd/+bcy5fgVNnolGJ8Vy6lgp/Al40oy11Gkgs60jfRNpFANCdDMmqMh9kjTr6fvu0kjPM3DrwT
	BV+Xd8wfxgunf74dpMIif8pjhGhg3kmJ53KVXGhbpYAL5oTnJQ9xm00fEhVzQXujDb12VZFhVgqFk
	b4u07XR4x/vH5nr5T805NPAWupWLNVs7GoK8OQ63G7dcASkRK7k5pAjXJb21zxoudQHTi8+aV5Ucf
	PNOLXO+aq6m82xypLt74Py4F41rcprMiDFH/9PhnviARdgpcA6sQVbSdpOBFQrUcdOcMpcf6oPppR
	Al0DSbWsqMjuIy6F8YIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhog-00000002IyA-26Dz;
	Fri, 17 Jul 2026 12:37:22 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhoe-00000002IxT-0jQP
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 12:37:21 +0000
Date: Fri, 17 Jul 2026 14:37:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784291837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ous9T1OifkieYAddXD/qSd5Bb5rc4D0/T59mWTAeVmk=;
	b=O5Ws/EVGp4lerZ/AXCHpqyNnzBAzq8uyl+qAH3pCfuWujdOkqWw5iSO8oE1Zle5cmuvuGG
	8LeidrWE1MyibP5ctNWXLl+ckyf4oB+pRbbI9B8VK1QZbDckidokTDcDzINhSfEEjpcOFD
	UzdhxrKdVc4EqBjMpa6M+UJEje0k8oH5mCG4QixVq2LFPQRQnP8JuXvXETNrvFdZgs5eJ3
	1EGUlKBENm1akmoPOwYTku/nj4m+0nM9aZAdcyveYgbyLPKljYb+TwABks1y7lWSUvHIBE
	RERAhW+g5pjWPAWeCCVQQuRR1bR27NX6s331y54Fjlbgh5roDVh/rXDPrUb3yw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784291837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ous9T1OifkieYAddXD/qSd5Bb5rc4D0/T59mWTAeVmk=;
	b=xzV1iAWQ9Exz10a6Fv+tAdwxdmyFXLXz6l6Wf5rcDYM+IhLuU+m0xf69t+zZvO0vqKIYwl
	7s9Gu6J0E7IVaCDg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Thomas Gleixner <tglx@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH v3 5/5] riscv: vdso: Implement
 __vdso_futex_robust_try_unlock()
Message-ID: <20260717142423-c5be3c7c-d4cb-4a68-8e85-3e3754e42666@linutronix.de>
References: <cover.1784274927.git.namcao@linutronix.de>
 <b3447fdd87cdd607b685940a1801b841066337fa.1784274927.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b3447fdd87cdd607b685940a1801b841066337fa.1784274927.git.namcao@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_053720_352303_D564BC5F 
X-CRM114-Status: GOOD (  19.70  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 17, 2026 at 10:06:38AM +0200, Nam Cao wrote:
(...)

> Signed-off-by: Nam Cao <namcao@linutronix.de>

One question about the toolchain detection.
With that cleared up:

Reviewed-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>

(Minus the asm bits...)

> ---
>  arch/riscv/Kconfig                         |  1 +
>  arch/riscv/include/asm/cpufeature-macros.h |  2 +
>  arch/riscv/include/asm/futex_robust.h      | 16 +++++
>  arch/riscv/include/asm/vdso/futex.h        | 14 ++++
>  arch/riscv/kernel/compat_vdso/Makefile     |  7 +-
>  arch/riscv/kernel/compat_vdso/futex.c      |  3 +
>  arch/riscv/kernel/vdso.c                   | 61 ++++++++++++++++
>  arch/riscv/kernel/vdso/Makefile            | 14 +++-
>  arch/riscv/kernel/vdso/futex.c             | 84 ++++++++++++++++++++++
>  arch/riscv/kernel/vdso/vdso.lds.S          |  8 +++
>  10 files changed, 208 insertions(+), 2 deletions(-)
>  create mode 100644 arch/riscv/include/asm/futex_robust.h
>  create mode 100644 arch/riscv/include/asm/vdso/futex.h
>  create mode 100644 arch/riscv/kernel/compat_vdso/futex.c
>  create mode 100644 arch/riscv/kernel/vdso/futex.c

(...)

> diff --git a/arch/riscv/include/asm/futex_robust.h b/arch/riscv/include/a=
sm/futex_robust.h
> new file mode 100644
> index 000000000000..16ec58e925c8
> --- /dev/null
> +++ b/arch/riscv/include/asm/futex_robust.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_RISCV_FUTEX_ROBUST_H
> +#define _ASM_RISCV_FUTEX_ROBUST_H
> +
> +#include <asm/ptrace.h>
> +#include <asm/vdso/futex.h>
> +
> +static inline void __user *arch_futex_robust_unlock_get_pop(struct pt_re=
gs *regs)
> +{
> +	if (cpu_supports_zacas())
> +		return (regs->a0 =3D=3D regs->a1) ? (void __user *)regs->a2 : NULL;
> +	else
> +		return (regs->t0 =3D=3D 0) ? (void __user *)regs->a2 : NULL;
> +}

Can it ever happen that the toolchain has differing zacas support between
32-bit and 64-bit? Then cpu_supports_zacas() may not be sufficient.
If it is guaranteed to be in sync I would prefer to reuse
CONFIG_TOOLCHAIN_HAS_ZACAS instead of the cc-option check in the Makefile
to make that clear and error out early if it should ever change.

Also this assumes that compat vDSO alternative patching works.
But this is not the case. My series [0] to implement it has not yet been
applied. This revision is missing the note about this dependency.

[0] https://lore.kernel.org/all/20260630-riscv-vdso32-alternative-v1-0-a32f=
d89b7b1c@linutronix.de/

> +#endif /* _ASM_RISCV_FUTEX_ROBUST_H */

(...)

> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Mak=
efile
> index 8dbf2532a573..d4238db8c6d3 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -27,12 +27,24 @@ asflags-y +=3D -DVDSO_CFI=3D1
>  endif
>  =

>  # Files to link into the vdso
> -obj-vdso =3D $(patsubst %, %.o, $(vdso-syms)) note.o
> +obj-vdso :=3D $(patsubst %, %.o, $(vdso-syms)) note.o
>  =

>  ifdef CONFIG_VDSO_GETRANDOM
>  obj-vdso +=3D vgetrandom-chacha.o
>  endif
>  =

> +ifdef CONFIG_FUTEX_ROBUST_UNLOCK
> +
> +obj-vdso +=3D futex.o
> +
> +ifdef CONFIG_64BIT
> +vdso-syms +=3D __vdso_futex_robust_list64_try_unlock
> +else
> +vdso-syms +=3D __vdso_futex_robust_list32_try_unlock
> +endif

Could be :

vdso-syms +=3D __vdso_futex_robust_list$(BITS)_try_unlock

> +
> +endif
> +
>  ccflags-y :=3D -fno-stack-protector
>  ccflags-y +=3D -DDISABLE_BRANCH_PROFILING
>  ccflags-y +=3D -fno-builtin

(...)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
