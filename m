Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF41CEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 11:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jPS6Q3hZQZLcuqAk2aKQOFLIJtyVLIkGWide/QiCyes=; b=UrTTXKlbb5b4MueucAj74eKeQ8
	ukbug451U7ebmfBa+AKee3pl4Jar345PhVKeC2qZlvcblVAxerrJr2Yp6RM9dCRAHIQMlJpQObNsP
	ZGR0mN0WAaRRBQTFpSzC6Mz9jh7/0h3wQdwwRsCJHCMOveb01uzj0dB5iShwR7bsNpq9yYtCh2RrS
	xldNP8XGyzFM9dJpMLQy4CGP0QPmpnxmxuyPBmd3fE/dzS9+o9+5mbqkS0JPjhWFGYkKLeoKoaJF8
	JMQ1r4FjHWc3YKO3Ll5ga8wcmRRKzKeZ2kgZ0V72kvC9gQlLe+fAGT6M+W4Hko82Aap0M9QkaDk1r
	aYQt6v/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLM46-003orG-0K;
	Mon, 17 Jul 2023 11:06:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLM3N-003oh1-0z
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 11:06:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689591969; x=1721127969;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L9vqnXdx9t2Oro/JiqIj9V69YePpOXuHnoS13WCSDU4=;
  b=zVqWGIEQyh8zO6hmiKf5RSlGaG6D+PJ7PiiFYFRNT1X+ZnmJDmHaVkst
   /atmzbPHNYWJ5BFNyVA0igt8m8RpWVGc1YU3Y8MHSmcVPso84nmUI459T
   CnIkJrhUWUBDOAhIcluPk1QHmsQhJc2hSssCdSWYGSVHcjtX6rnZRSl0J
   PVj5ML2HPhVq0ChH+QpMpgsq5yMWyOZEzb+b8SqIlesZvbuJ2wCyMSVqI
   XObYNZdCh4PUsCOvFzXEHuzZIjvfVhH4Jww2f/Bd0U6rbrh/ymun7SQiW
   3crzZ+9ZnBMJbUFQrJxs0e0EAbtyh2UVKpo9yZwoEmNqVOwJNQVTgyU13
   g==;
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="asc'?scan'208";a="225008957"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jul 2023 04:06:07 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 17 Jul 2023 04:06:00 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 17 Jul 2023 04:05:56 -0700
Date: Mon, 17 Jul 2023 12:05:23 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andy Chiu <andy.chiu@sifive.com>
CC: <linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>, Kefeng Wang
	<wangkefeng.wang@huawei.com>, <guoren@linux.alibaba.com>, Peter Zijlstra
	<peterz@infradead.org>, Andrew Bresticker <abrestic@rivosinc.com>,
	<paul.walmsley@sifive.com>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?=
	<bjorn@rivosinc.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang
	<jszhang@kernel.org>, Fangrui Song <maskray@google.com>, Vincent Chen
	<vincent.chen@sifive.com>, Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	<anup@brainfault.org>, <greentime.hu@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	<vineetg@rivosinc.com>, <atishp@atishpatra.org>, <heiko.stuebner@vrull.eu>,
	Nick Knight <nick.knight@sifive.com>, <bjorn@kernel.org>
Subject: Re: [v1, 5/6] riscv: vector: allow kernel-mode Vector with preemption
Message-ID: <20230717-duller-skinning-4591dfbf20a1@wendy>
References: <20230715150032.6917-1-andy.chiu@sifive.com>
 <20230715150032.6917-6-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230715150032.6917-6-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_040612_726986_CF366751 
X-CRM114-Status: GOOD (  31.29  )
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
Content-Type: multipart/mixed; boundary="===============3346186671044119646=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3346186671044119646==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="win5rYPsEYD4Z4oJ"
Content-Disposition: inline

--win5rYPsEYD4Z4oJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 15, 2023 at 03:00:31PM +0000, Andy Chiu wrote:
> Add kernel_vstate to keep track of kernel-mode Vector registers when
> trap introduced context switch happens. Also, provide trap_pt_regs to
> let context save/restore routine reference status.VS at which the trap
> takes place. The thread flag TIF_RISCV_V_KMV indicates whether a task is
> running in kernel-mode Vector with preemption 'ON'. So context switch
> routines know and would save V-regs to kernel_vstate and restore V-regs
> immediately from kernel_vstate if the bit is set.
>=20
> Apart from a task's preemption status, the capability of
> running preemptive kernel-mode Vector is jointly controlled by the
> RISCV_V_VSTATE_CTRL_KMV_PREEMPTIBLE mask in the task's
> thread.vstate_ctrl. This bit is masked whenever a trap takes place in
> kernel mode while executing preemptive Vector code.
>=20
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/include/asm/processor.h     |  2 +
>  arch/riscv/include/asm/thread_info.h   |  4 ++
>  arch/riscv/include/asm/vector.h        | 27 ++++++++++--
>  arch/riscv/kernel/asm-offsets.c        |  2 +
>  arch/riscv/kernel/entry.S              | 41 ++++++++++++++++++
>  arch/riscv/kernel/kernel_mode_vector.c | 57 ++++++++++++++++++++++++--
>  arch/riscv/kernel/process.c            |  8 +++-
>  arch/riscv/kernel/vector.c             |  3 +-
>  8 files changed, 136 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/=
processor.h
> index e82af1097e26..d337b750f2ec 100644
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
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/as=
m/thread_info.h
> index d83975efe866..59d88adfc4de 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -102,6 +102,7 @@ int arch_dup_task_struct(struct task_struct *dst, str=
uct task_struct *src);
>  #define TIF_UPROBE		10	/* uprobe breakpoint or singlestep */
>  #define TIF_32BIT		11	/* compat-mode 32bit process */
>  #define TIF_RISCV_V_DEFER_RESTORE	12
> +#define TIF_RISCV_V_KMV			13

Same comment about comments.

Also, the "V" here is a dupe, since you have RISCV_V in the name.
Ditto everywhere else, afaict. Perhaps you could do s/KMV/KERNEL_MODE/?

>  #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
>  #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
> @@ -109,9 +110,12 @@ int arch_dup_task_struct(struct task_struct *dst, st=
ruct task_struct *src);
>  #define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
>  #define _TIF_UPROBE		(1 << TIF_UPROBE)
>  #define _TIF_RISCV_V_DEFER_RESTORE	(1 << TIF_RISCV_V_DEFER_RESTORE)
> +#define _TIF_RISCV_V_KMV		(1 << TIF_RISCV_V_KMV_TASK)

Where is KMV_TASK defined?

> =20
>  #define _TIF_WORK_MASK \
>  	(_TIF_NOTIFY_RESUME | _TIF_SIGPENDING | _TIF_NEED_RESCHED | \
>  	 _TIF_NOTIFY_SIGNAL | _TIF_UPROBE)
> =20
> +#define RISCV_V_VSTATE_CTRL_KMV_PREEMPTIBLE	0x20
> +
>  #endif /* _ASM_RISCV_THREAD_INFO_H */
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vec=
tor.h
> index 50c556afd95a..d004c9fa6a57 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -25,6 +25,12 @@ bool riscv_v_first_use_handler(struct pt_regs *regs);
>  int kernel_rvv_begin(void);
>  void kernel_rvv_end(void);
> =20
> +#ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE_KMV
> +void riscv_v_vstate_ctrl_config_kmv(bool preemptive_kmv);
> +#else
> +#define riscv_v_vstate_ctrl_config_kmv(preemptive_kmv)	do {} while (0)
> +#endif

For clang/llvm allmodconfig:
=2E./arch/riscv/kernel/process.c:213:2: error: call to undeclared function =
'riscv_v_vstate_ctrl_config_kmv'; ISO C99 and later do not support implicit=
 function declarations [-Wimplicit-function-declaration]

Probably also happens when vector is disabled?


> +
>  static __always_inline bool has_vector(void)
>  {
>  	return riscv_has_extension_unlikely(RISCV_ISA_EXT_v);
> @@ -195,9 +201,24 @@ static inline void __switch_to_vector(struct task_st=
ruct *prev,
>  {
>  	struct pt_regs *regs;
> =20
> -	regs =3D task_pt_regs(prev);
> -	riscv_v_vstate_save(prev->thread.vstate, regs);
> -	riscv_v_vstate_set_restore(next, task_pt_regs(next));
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_V_PREEMPTIVE_KMV) &&

w.r.t. this symbol, just drop the KMV?

> +	    test_tsk_thread_flag(prev, TIF_RISCV_V_KMV)) {
> +		regs =3D prev->thread.trap_pt_regs;
> +		WARN_ON(!regs);
> +		riscv_v_vstate_save(&prev->thread.kernel_vstate, regs);
> +	} else {
> +		regs =3D task_pt_regs(prev);
> +		riscv_v_vstate_save(&prev->thread.vstate, regs);
> +	}
> +
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_V_PREEMPTIVE_KMV) &&

Possibly stupid question, but not explained by the patch, why would we
ever want to have RISCV_ISA_V_PREEMPTIVE_KMV disabled?

> +	    test_tsk_thread_flag(next, TIF_RISCV_V_KMV)) {
> +		regs =3D next->thread.trap_pt_regs;
> +		WARN_ON(!regs);
> +		riscv_v_vstate_restore(&next->thread.kernel_vstate, regs);
> +	} else {
> +		riscv_v_vstate_set_restore(next, task_pt_regs(next));
> +	}
>  }
> =20
>  void riscv_v_vstate_ctrl_init(struct task_struct *tsk);
> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offs=
ets.c
> index d6a75aac1d27..4b062f7741b2 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -38,6 +38,8 @@ void asm_offsets(void)
>  	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
>  	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
>  	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
> +	OFFSET(TASK_THREAD_TRAP_REGP, task_struct, thread.trap_pt_regs);
> +	OFFSET(TASK_THREAD_VSTATE_CTRL, task_struct, thread.vstate_ctrl);
> =20
>  	OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
>  	OFFSET(TASK_THREAD_F1,  task_struct, thread.fstate.f[1]);
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 143a2bb3e697..42b80b90626a 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -66,6 +66,27 @@ _save_context:
>  	REG_S s4, PT_CAUSE(sp)
>  	REG_S s5, PT_TP(sp)
> =20
> +	/*
> +	 * Reocrd the register set at the frame where in-kernel V registers are

nit: s/Reocrd/Record/

> diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/k=
ernel_mode_vector.c
> index 30f1b861cac0..bcd6a69a5266 100644
> --- a/arch/riscv/kernel/kernel_mode_vector.c
> +++ b/arch/riscv/kernel/kernel_mode_vector.c
> @@ -10,6 +10,7 @@
>  #include <linux/percpu.h>
>  #include <linux/preempt.h>
>  #include <linux/types.h>
> +#include <linux/slab.h>
> =20
>  #include <asm/vector.h>
>  #include <asm/switch_to.h>
> @@ -35,7 +36,8 @@ static __must_check inline bool may_use_vector(void)
>  	 * where it is set.
>  	 */
>  	return !in_irq() && !irqs_disabled() && !in_nmi() &&
> -	       !this_cpu_read(vector_context_busy);
> +	       !this_cpu_read(vector_context_busy) &&
> +	       !test_thread_flag(TIF_RISCV_V_KMV);
>  }
> =20
>  /*
> @@ -69,6 +71,47 @@ static void put_cpu_vector_context(void)
>  	preempt_enable();
>  }
> =20
> +#ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE_KMV
> +void riscv_v_vstate_ctrl_config_kmv(bool preemptive_kmv)

I don't understand what this function is trying to do, based on the
function name. The lack of a verb in it is somewhat confusing.

> +{
> +	if (preemptive_kmv)
> +		current->thread.vstate_ctrl |=3D RISCV_V_VSTATE_CTRL_KMV_PREEMPTIBLE;
> +	else
> +		current->thread.vstate_ctrl &=3D ~RISCV_V_VSTATE_CTRL_KMV_PREEMPTIBLE;
> +}
> +
> +static bool riscv_v_kmv_preempitble(void)

Beyond the ible/able stuff, there's a typo in this function name.

> +{
> +	return !!(current->thread.vstate_ctrl & RISCV_V_VSTATE_CTRL_KMV_PREEMPT=
IBLE);
> +}

Little comment on the rest, not qualified to do so :)

Thanks,
Conor.

--win5rYPsEYD4Z4oJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLUgcwAKCRB4tDGHoIJi
0op1AQDUrg3F9C11aX3zA1f14ITg739sPzsjO/MkRBG++th9+QEAwNo7NXKENeK3
A1mXtbkut8MDLr+DXNejaQs4MXuCqgk=
=TIcZ
-----END PGP SIGNATURE-----

--win5rYPsEYD4Z4oJ--


--===============3346186671044119646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3346186671044119646==--

