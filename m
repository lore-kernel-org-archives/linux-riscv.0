Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41665C07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 11:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFsFoGhwY/SYZn4u197FhMi15ssYWTOljjixqAfh29A=; b=QU3SJyocv5blIbgdXgYB5dCeMy
	FrgpIpsnW8FWNl4y6qTKSof87HKUQGibzQk3ibrzHKHHO1TPjOqYjubDVLTZLKL0JxBDDmWyHknXc
	dG0XihHYZCfnfogsw6BLnVd4oNWBmZpD5fy9SsZHPRLWeJ7pXKDZRoXT1/4pm19jSTt8lHj64Ol7Q
	aibcS7Z/0Qb2aLyymeLWjRmA+THuj+2pJOUTxP3ev6QtsaqvPT5zYIW694KQzgJi5l8msPTqveW/e
	yj/1josBUNE6UCM5Dr+l0EBPw9Yyq9OwZnrifCq57NVqE2wzOBwD9r6oyCT9h41wSzszNlYRlywz8
	x3boK6Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvFWR-009e4d-1t;
	Tue, 24 Oct 2023 11:24:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvFWO-009e3u-1p
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 11:24:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D98CF60B0C;
	Tue, 24 Oct 2023 11:24:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD50CC433C8;
	Tue, 24 Oct 2023 11:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698146666;
	bh=3T2GxPQXkPvrvw3g0AZkXcH/KPXK6Sjl+tGkCSWchRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dZlO1eIs+09H/Wsh2LDdDjPIH8dB/dbZSul9ybENwFGG7A1rfgyS1N7JIEjduysXD
	 ThMCcLrkrJVqSpZo4nZN5A9flqq+5Oya4GLMuDt3mxI73g4AZw8ZTVUHYSJWCVP3bH
	 reawXospL3e3ta2/dnF8w0c/yAYWU75cuZkonZlgS/SjLAj6x32h//xacwsFzhz+CF
	 Z8IQQdEK5HyyyEYCNW89PLBLIlbJm2v4UlKwwEaFb8/81IWFldiEuJAOvMM9O70P0D
	 LP+8wOwTrs0X9Ef3KYvR6vlIUfNWY5SdCazweAJb8tp3RX3iWSfjgrfpjJVGbHcAG6
	 sMnpMyb6YCuLA==
Date: Tue, 24 Oct 2023 12:24:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, bjorn@kernel.org, peterz@infradead.org,
	tglx@linutronix.de, Albert Ou <aou@eecs.berkeley.edu>,
	Oleg Nesterov <oleg@redhat.com>, Guo Ren <guoren@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Mathis Salmen <mathis.salmen@matsal.de>
Subject: Re: [v3, 3/5] riscv: sched: defer restoring Vector context for user
Message-ID: <20231024-dictate-fable-af45b5283e63@spud>
References: <20231019154552.23351-1-andy.chiu@sifive.com>
 <20231019154552.23351-4-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20231019154552.23351-4-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_042428_686896_574990C7 
X-CRM114-Status: GOOD (  34.84  )
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
Content-Type: multipart/mixed; boundary="===============0418792343387307179=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0418792343387307179==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="P/zjrc3cKxut5UUQ"
Content-Disposition: inline


--P/zjrc3cKxut5UUQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Andy,

On Thu, Oct 19, 2023 at 03:45:50PM +0000, Andy Chiu wrote:
> User will use its Vector registers only after the kernel really returns
> to the userspace. So we can delay restoring Vector registers as long as
> we are still running in kernel mode. So, add a thread flag to indicates
> the need of restoring Vector and do the restore at the last
> arch-specific exit-to-user hook. This save the context restoring cost
> when we switch over multiple processes that run V in kernel mode. For
> example, if the kernel performs a context swicth from A->B->C, and
> returns to C's userspace, then there is no need to restore B's
> V-register.
>=20

> Besides, this also prevents us from repeatedly restoring V context when
> executing kernel-mode Vector multiple times for the upcoming kenel-mode
> Vector patches.

This comment now seems misplaced, as this patch has moved after adding
kernel mode vector in the series.

> The cost of this is that we must disable preemption and mark vector as
> busy during vstate_{save,restore}. Because then the V context will not
> get restored back immediately when a trap-causing context switch happens
> in the middle of vstate_{save,restore}.
>=20
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
> Changelog v3:
>  - Guard {get,put}_cpu_vector_context between vstate_* operation and
>    explain it in the commit msg.
>  - Drop R-b from Bj=F6rn and A-b from Conor.

You can keep mine,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> Changelog v2:
>  - rename and add comment for the new thread flag (Conor)
> ---
>  arch/riscv/include/asm/entry-common.h  | 17 +++++++++++++++++
>  arch/riscv/include/asm/thread_info.h   |  2 ++
>  arch/riscv/include/asm/vector.h        | 11 ++++++++++-
>  arch/riscv/kernel/kernel_mode_vector.c |  2 +-
>  arch/riscv/kernel/process.c            |  2 ++
>  arch/riscv/kernel/ptrace.c             |  5 ++++-
>  arch/riscv/kernel/signal.c             |  5 ++++-
>  arch/riscv/kernel/vector.c             |  2 +-
>  8 files changed, 41 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/entry-common.h b/arch/riscv/include/a=
sm/entry-common.h
> index 6e4dee49d84b..8d64f1c18169 100644
> --- a/arch/riscv/include/asm/entry-common.h
> +++ b/arch/riscv/include/asm/entry-common.h
> @@ -4,6 +4,23 @@
>  #define _ASM_RISCV_ENTRY_COMMON_H
> =20
>  #include <asm/stacktrace.h>
> +#include <asm/thread_info.h>
> +#include <asm/vector.h>
> +
> +static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
> +						  unsigned long ti_work)
> +{
> +	if (ti_work & _TIF_RISCV_V_DEFER_RESTORE) {
> +		clear_thread_flag(TIF_RISCV_V_DEFER_RESTORE);
> +		/*
> +		 * We are already called with irq disabled, so go without
> +		 * keepping track of vector_context_busy.

nit: s/keepping/keeping/

Cheers,
Conor.

> +		 */
> +		riscv_v_vstate_restore(current, regs);
> +	}
> +}
> +
> +#define arch_exit_to_user_mode_prepare arch_exit_to_user_mode_prepare
> =20
>  void handle_page_fault(struct pt_regs *regs);
>  void handle_break(struct pt_regs *regs);
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/as=
m/thread_info.h
> index 1833beb00489..b182f2d03e25 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -93,12 +93,14 @@ int arch_dup_task_struct(struct task_struct *dst, str=
uct task_struct *src);
>  #define TIF_NOTIFY_SIGNAL	9	/* signal notifications exist */
>  #define TIF_UPROBE		10	/* uprobe breakpoint or singlestep */
>  #define TIF_32BIT		11	/* compat-mode 32bit process */
> +#define TIF_RISCV_V_DEFER_RESTORE	12 /* restore Vector before returing t=
o user */
> =20
>  #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
>  #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
>  #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
>  #define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
>  #define _TIF_UPROBE		(1 << TIF_UPROBE)
> +#define _TIF_RISCV_V_DEFER_RESTORE	(1 << TIF_RISCV_V_DEFER_RESTORE)
> =20
>  #define _TIF_WORK_MASK \
>  	(_TIF_NOTIFY_RESUME | _TIF_SIGPENDING | _TIF_NEED_RESCHED | \
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vec=
tor.h
> index 8b8ece690ea1..2f11c6f3ad96 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -188,6 +188,15 @@ static inline void riscv_v_vstate_restore(struct tas=
k_struct *task,
>  	}
>  }
> =20
> +static inline void riscv_v_vstate_set_restore(struct task_struct *task,
> +					      struct pt_regs *regs)
> +{
> +	if ((regs->status & SR_VS) !=3D SR_VS_OFF) {
> +		set_tsk_thread_flag(task, TIF_RISCV_V_DEFER_RESTORE);
> +		riscv_v_vstate_on(regs);
> +	}
> +}
> +
>  static inline void __switch_to_vector(struct task_struct *prev,
>  				      struct task_struct *next)
>  {
> @@ -195,7 +204,7 @@ static inline void __switch_to_vector(struct task_str=
uct *prev,
> =20
>  	regs =3D task_pt_regs(prev);
>  	riscv_v_vstate_save(prev, regs);
> -	riscv_v_vstate_restore(next, task_pt_regs(next));
> +	riscv_v_vstate_set_restore(next, task_pt_regs(next));
>  }
> =20
>  void riscv_v_vstate_ctrl_init(struct task_struct *tsk);
> diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/k=
ernel_mode_vector.c
> index 74936e108771..fa01dc62256f 100644
> --- a/arch/riscv/kernel/kernel_mode_vector.c
> +++ b/arch/riscv/kernel/kernel_mode_vector.c
> @@ -90,7 +90,7 @@ void kernel_vector_end(void)
>  	if (WARN_ON(!has_vector()))
>  		return;
> =20
> -	riscv_v_vstate_restore(current, task_pt_regs(current));
> +	riscv_v_vstate_set_restore(current, task_pt_regs(current));
> =20
>  	riscv_v_disable();
> =20
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index e32d737e039f..ec89e7edb6fd 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -153,6 +153,7 @@ void flush_thread(void)
>  	riscv_v_vstate_off(task_pt_regs(current));
>  	kfree(current->thread.vstate.datap);
>  	memset(&current->thread.vstate, 0, sizeof(struct __riscv_v_ext_state));
> +	clear_tsk_thread_flag(current, TIF_RISCV_V_DEFER_RESTORE);
>  #endif
>  }
> =20
> @@ -169,6 +170,7 @@ int arch_dup_task_struct(struct task_struct *dst, str=
uct task_struct *src)
>  	*dst =3D *src;
>  	/* clear entire V context, including datap for a new task */
>  	memset(&dst->thread.vstate, 0, sizeof(struct __riscv_v_ext_state));
> +	clear_tsk_thread_flag(dst, TIF_RISCV_V_DEFER_RESTORE);
> =20
>  	return 0;
>  }
> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> index 2afe460de16a..7b93bcbdf9fa 100644
> --- a/arch/riscv/kernel/ptrace.c
> +++ b/arch/riscv/kernel/ptrace.c
> @@ -99,8 +99,11 @@ static int riscv_vr_get(struct task_struct *target,
>  	 * Ensure the vector registers have been saved to the memory before
>  	 * copying them to membuf.
>  	 */
> -	if (target =3D=3D current)
> +	if (target =3D=3D current) {
> +		get_cpu_vector_context();
>  		riscv_v_vstate_save(current, task_pt_regs(current));
> +		put_cpu_vector_context();
> +	}
> =20
>  	ptrace_vstate.vstart =3D vstate->vstart;
>  	ptrace_vstate.vl =3D vstate->vl;
> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> index 180d951d3624..d31d2c74d31f 100644
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c
> @@ -86,7 +86,10 @@ static long save_v_state(struct pt_regs *regs, void __=
user **sc_vec)
>  	/* datap is designed to be 16 byte aligned for better performance */
>  	WARN_ON(unlikely(!IS_ALIGNED((unsigned long)datap, 16)));
> =20
> +	get_cpu_vector_context();
>  	riscv_v_vstate_save(current, regs);
> +	put_cpu_vector_context();
> +
>  	/* Copy everything of vstate but datap. */
>  	err =3D __copy_to_user(&state->v_state, &current->thread.vstate,
>  			     offsetof(struct __riscv_v_ext_state, datap));
> @@ -134,7 +137,7 @@ static long __restore_v_state(struct pt_regs *regs, v=
oid __user *sc_vec)
>  	if (unlikely(err))
>  		return err;
> =20
> -	riscv_v_vstate_restore(current, regs);
> +	riscv_v_vstate_set_restore(current, regs);
> =20
>  	return err;
>  }
> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index 8d92fb6c522c..9d583b760db4 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -167,7 +167,7 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
>  		return true;
>  	}
>  	riscv_v_vstate_on(regs);
> -	riscv_v_vstate_restore(current, regs);
> +	riscv_v_vstate_set_restore(current, regs);
>  	return true;
>  }
> =20
> --=20
> 2.17.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--P/zjrc3cKxut5UUQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTepZAAKCRB4tDGHoIJi
0jvhAP47fg2c+gPT0ekK6Xdq4mGgFECSchiXSRbUhGK4bOhD9wEA9v3kg2URYfSt
YyTWtuR6QOTi9cn3qwbylxK7O7mzqQc=
=HLCy
-----END PGP SIGNATURE-----

--P/zjrc3cKxut5UUQ--


--===============0418792343387307179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0418792343387307179==--

