Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E656C0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 12:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKIUUq9FDAmdwirGu+Hi6UoLKIdG6LYeU4Zr98Ptbrk=; b=Kt4UqX9qvqFhXe4v8h1+SbQlEg
	n9eDaAgp8Nfq5/1kS+t2HHGCOo6qyYG1hnfF2iBb5+MtEWirgzsVDgklRzt6rGSd4MYVQFeASHlwY
	oyp4gnWgOaePV8SQEMU41cfEloZ68DIM0mKzohNBE2MzkX0x4CRGlnsS4lo/i/XcjX1v5s2AX9iXv
	+BF/dbaw7Cw7QLG8RQH/2x/I8VTva2EOxVAs3in2Ipj9CA08FMcD/w3UICWdsTkr7oQ0CQjcv6nPK
	yhPchY4eKfGKQhAOVe4ZpPPguVQp3RGw0w8KRPmptTruLEZIkVPHCyHq0yLsc35UM0k7g5FPkvdA/
	S9wi0few==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNuWp-004CyM-1l;
	Mon, 24 Jul 2023 12:19:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNuWl-004CwE-14
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 12:19:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690201143; x=1721737143;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZF+Y6lwWIuu+l+2o5E/weLECP6XzLaTHYKYkfLiuSIM=;
  b=Xa5F1/bquUcqla605Ok+lbVKJV433GS+hTtlsYwQQk6+m902BIK40kJZ
   k7zsn4H6EcUGbDeO7B/xeEVaw4gBSQ0Zzm+1lsmAbnZ8f+NK9bFPjYmqr
   76aBzBjuTjHo53Jla0LxwUQfoPZibbhZvL7c6SzNJrmJlVQ7Y109Dp7P3
   tfWlXP69utaT0ly7MDTgaDBMvUXSklSZChXJOC3RmhPG1j80F5mQKM/Kf
   roILwVe55yLm5MVO1BVUEd/b+E08ikOabvoM78Xe7pfMDsR2HUuhztFAr
   eWDOa4iAWLtGn0hzioVwscsy/EfZpy2GLgBpruzD25EK9BSbr0zJvftUB
   A==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="asc'?scan'208";a="237320767"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Jul 2023 05:19:01 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 24 Jul 2023 05:19:00 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 24 Jul 2023 05:18:57 -0700
Date: Mon, 24 Jul 2023 13:18:23 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andy Chiu <andy.chiu@sifive.com>
CC: <linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<vineetg@rivosinc.com>, <bjorn@kernel.org>, <greentime.hu@sifive.com>,
	<paul.walmsley@sifive.com>, <guoren@linux.alibaba.com>,
	<anup@brainfault.org>, <atishp@atishpatra.org>, <heiko.stuebner@vrull.eu>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Vincent Chen
	<vincent.chen@sifive.com>, Heiko Stuebner <heiko@sntech.de>, Kefeng Wang
	<wangkefeng.wang@huawei.com>, Jisheng Zhang <jszhang@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, Sia Jee Heng
	<jeeheng.sia@starfivetech.com>, Mason Huo <mason.huo@starfivetech.com>,
	Andrew Bresticker <abrestic@rivosinc.com>, Fangrui Song <maskray@google.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [v2, 5/5] riscv: vector: allow kernel-mode Vector with preemption
Message-ID: <20230724-frosting-luminance-93bcb317740a@wendy>
References: <20230721112855.1006-1-andy.chiu@sifive.com>
 <20230721112855.1006-6-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230721112855.1006-6-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_051903_514405_D8C5AC13 
X-CRM114-Status: GOOD (  36.11  )
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
Content-Type: multipart/mixed; boundary="===============7272483823957203896=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7272483823957203896==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Nl5jW/yX4mL5BbD1"
Content-Disposition: inline

--Nl5jW/yX4mL5BbD1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Andy,

On Fri, Jul 21, 2023 at 11:28:55AM +0000, Andy Chiu wrote:
> Add kernel_vstate to keep track of kernel-mode Vector registers when
> trap introduced context switch happens. Also, provide trap_pt_regs to
> let context save/restore routine reference status.VS at which the trap
> takes place. The thread flag TIF_RISCV_V_KERNEL_MODE indicates whether
> a task is running in kernel-mode Vector with preemption 'ON'. So context
> switch routines know and would save V-regs to kernel_vstate and restore
> V-regs immediately from kernel_vstate if the bit is set.
>=20
> Apart from a task's preemption status, the capability of
> running preemptive kernel-mode Vector is jointly controlled by the
> RISCV_V_VSTATE_CTRL_PREEMPTIBLE mask in the task's
> thread.vstate_ctrl. This bit is masked whenever a trap takes place in
> kernel mode while executing preemptive Vector code.
>=20
> Also, provide a config CONFIG_RISCV_ISA_V_PREEMPTIVE to give users an
> option to disable preemptible kernel-mode Vector at build time. Users
> with constraint memory may want to disable this config as preemptible
> kernel-mode Vector needs extra space for tracking per thread's
> kernel-mode V context. Or, users might as well want to disable it if all
> kernel-mode Vector code is time sensitive and cannot tolerate context
> swicth overhead.
>=20
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
> Changelog v2:
>  - fix build fail when compiling without RISCV_ISA_V (Conor)
>  - 's/TIF_RISCV_V_KMV/TIF_RISCV_V_KERNEL_MODE' and add comment (Conor)
>  - merge Kconfig patch into this oine (Conor).
>  - 's/CONFIG_RISCV_ISA_V_PREEMPTIVE_KMV/CONFIG_RISCV_ISA_V_PREEMPTIVE/'
>    (Conor)
>  - fix some typos (Conor)
>  - enclose assembly with RISCV_ISA_V_PREEMPTIVE.
>  - change riscv_v_vstate_ctrl_config_kmv() to
>    kernel_vector_allow_preemption() for better understanding. (Conor)
>  - 's/riscv_v_kmv_preempitble/kernel_vector_preemptible/'
> ---
>  arch/riscv/Kconfig                     | 10 +++++
>  arch/riscv/include/asm/processor.h     |  2 +
>  arch/riscv/include/asm/simd.h          |  4 +-
>  arch/riscv/include/asm/thread_info.h   |  4 ++
>  arch/riscv/include/asm/vector.h        | 27 +++++++++++--
>  arch/riscv/kernel/asm-offsets.c        |  2 +
>  arch/riscv/kernel/entry.S              | 45 ++++++++++++++++++++++
>  arch/riscv/kernel/kernel_mode_vector.c | 53 ++++++++++++++++++++++++--
>  arch/riscv/kernel/process.c            |  8 +++-
>  arch/riscv/kernel/vector.c             |  3 +-
>  10 files changed, 148 insertions(+), 10 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 4c07b9189c86..0622951b15dd 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -507,6 +507,16 @@ config RISCV_ISA_V_DEFAULT_ENABLE
> =20
>  	  If you don't know what to do here, say Y.
> =20
> +config RISCV_ISA_V_PREEMPTIVE
> +	bool "Run kernel-mode Vector with kernel preemption"
> +	depends on PREEMPTION
> +	depends on RISCV_ISA_V
> +	default y
> +	help
> +	  Ordinarily the kernel disables preemption before running in-kernel
> +	  Vector code. This config frees the kernel from disabling preemption
> +	  by adding memory on demand for tracking kernel's V-context.
> +
>  config TOOLCHAIN_HAS_ZBB
>  	bool
>  	default y
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/=
processor.h
> index c950a8d9edef..497c0dd30b2a 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -42,6 +42,8 @@ struct thread_struct {
>  	unsigned long bad_cause;
>  	unsigned long vstate_ctrl;
>  	struct __riscv_v_ext_state vstate;
> +	struct pt_regs *trap_pt_regs;
> +	struct __riscv_v_ext_state kernel_vstate;
>  };
> =20
>  /* Whitelist the fstate from the task_struct for hardened usercopy */
> diff --git a/arch/riscv/include/asm/simd.h b/arch/riscv/include/asm/simd.h
> index ef70af78005d..a54a0ce58f4d 100644
> --- a/arch/riscv/include/asm/simd.h
> +++ b/arch/riscv/include/asm/simd.h
> @@ -12,6 +12,7 @@
>  #include <linux/percpu.h>
>  #include <linux/preempt.h>
>  #include <linux/types.h>
> +#include <linux/thread_info.h>
> =20
>  #ifdef CONFIG_RISCV_ISA_V
> =20
> @@ -35,7 +36,8 @@ static __must_check inline bool may_use_simd(void)
>  	 * where it is set.
>  	 */
>  	return !in_irq() && !irqs_disabled() && !in_nmi() &&
> -	       !this_cpu_read(vector_context_busy);
> +	       !this_cpu_read(vector_context_busy) &&
> +	       !test_thread_flag(TIF_RISCV_V_KERNEL_MODE);
>  }
> =20
>  #else /* ! CONFIG_RISCV_ISA_V */
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/as=
m/thread_info.h
> index b182f2d03e25..8797d520e8ef 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -94,6 +94,7 @@ int arch_dup_task_struct(struct task_struct *dst, struc=
t task_struct *src);
>  #define TIF_UPROBE		10	/* uprobe breakpoint or singlestep */
>  #define TIF_32BIT		11	/* compat-mode 32bit process */
>  #define TIF_RISCV_V_DEFER_RESTORE	12 /* restore Vector before returing t=
o user */
> +#define TIF_RISCV_V_KERNEL_MODE			13 /* kernel-mode Vector run with pree=
mption-on */
> =20
>  #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
>  #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
> @@ -101,9 +102,12 @@ int arch_dup_task_struct(struct task_struct *dst, st=
ruct task_struct *src);
>  #define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
>  #define _TIF_UPROBE		(1 << TIF_UPROBE)
>  #define _TIF_RISCV_V_DEFER_RESTORE	(1 << TIF_RISCV_V_DEFER_RESTORE)
> +#define _TIF_RISCV_V_KERNEL_MODE	(1 << TIF_RISCV_V_KERNEL_MODE)
> =20
>  #define _TIF_WORK_MASK \
>  	(_TIF_NOTIFY_RESUME | _TIF_SIGPENDING | _TIF_NEED_RESCHED | \
>  	 _TIF_NOTIFY_SIGNAL | _TIF_UPROBE)
> =20
> +#define RISCV_V_VSTATE_CTRL_PREEMPTIBLE	0x20
> +
>  #endif /* _ASM_RISCV_THREAD_INFO_H */
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vec=
tor.h
> index 3b783b317112..c2776851d50d 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -195,9 +195,24 @@ static inline void __switch_to_vector(struct task_st=
ruct *prev,
>  {
>  	struct pt_regs *regs;
> =20
> -	regs =3D task_pt_regs(prev);
> -	riscv_v_vstate_save(&prev->thread.vstate, regs);
> -	riscv_v_vstate_set_restore(next, task_pt_regs(next));
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_V_PREEMPTIVE) &&
> +	    test_tsk_thread_flag(prev, TIF_RISCV_V_KERNEL_MODE)) {
> +		regs =3D prev->thread.trap_pt_regs;
> +		WARN_ON(!regs);

In what cases could these WARN_ON()s be triggered?

> +		riscv_v_vstate_save(&prev->thread.kernel_vstate, regs);
> +	} else {
> +		regs =3D task_pt_regs(prev);
> +		riscv_v_vstate_save(&prev->thread.vstate, regs);
> +	}
> +
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_V_PREEMPTIVE) &&
> +	    test_tsk_thread_flag(next, TIF_RISCV_V_KERNEL_MODE)) {
> +		regs =3D next->thread.trap_pt_regs;
> +		WARN_ON(!regs);
> +		riscv_v_vstate_restore(&next->thread.kernel_vstate, regs);
> +	} else {
> +		riscv_v_vstate_set_restore(next, task_pt_regs(next));
> +	}
>  }


>  /*
>   * kernel_vector_begin(): obtain the CPU vector registers for use by the=
 calling
>   * context
> @@ -70,11 +109,14 @@ void kernel_vector_begin(void)
> =20
>  	riscv_v_vstate_save(&current->thread.vstate, task_pt_regs(current));
> =20
> -	get_cpu_vector_context();
> +	if (!preemptible() || !kernel_vector_preemptible()) {
> +		get_cpu_vector_context();
> +	} else {
> +		if (riscv_v_start_kernel_context())
> +			get_cpu_vector_context();

What happens here if riscv_v_start_kernel_context() fails w/ -ENOMEM?

> +	}
> =20
>  	riscv_v_enable();
> -
> -	return 0;
>  }
>  EXPORT_SYMBOL_GPL(kernel_vector_begin);
> =20
> @@ -96,6 +138,9 @@  void kernel_vector_end(void)
> =20
>  	riscv_v_disable();
> =20
> -	put_cpu_vector_context();
> +	if (!test_thread_flag(TIF_RISCV_V_KERNEL_MODE))
> +		put_cpu_vector_context();
> +	else
> +		riscv_v_stop_kernel_context();
>  }

Probably just missing something here, but how come we don't need to call
put_cpu_vector_context() here. I'm just a little confused, since, in
kernel_vector_begin, get_cpu_vector_context() is called.

--Nl5jW/yX4mL5BbD1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZL5sDwAKCRB4tDGHoIJi
0uEhAQD3Z5UGjA/qxvCEpRpFyjDlHZTBssTfNariH0v/ytWh8QD/aTCGvzBD5Mww
xulQuATUqM9rh0ncTqsdCKpLFzhf7Qo=
=XcYt
-----END PGP SIGNATURE-----

--Nl5jW/yX4mL5BbD1--


--===============7272483823957203896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7272483823957203896==--

