Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9CBC0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 16:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iyY5l2spOxQzxSOpgoORItcQWM7SqLaoet7QVOvROzU=; b=pULJc7hhXRzRMoTM0wdf2kj515
	awPVvrRv7V27T/2G66m4kRdec3Sdgcs8tz6sm5oB+YCYlqqPZPsrSI3sw+s9nRQaoONKj0zWawPsu
	WT1YLhH5LgUdhoLgLjNjKJ3bUeryyrp5FcUPO0gNZIx0G7/1HEhgP2kiujrMo80LWos9esbPjC+Ze
	WCxem06x5qHzyfQXO1OUUCv/yrHD/AXwlgM0GlP11Q+GYsWaLlVvtZy++QCGij+xRJeBOzd/Vqh1I
	ps7aVGqQYXis8DLKqsmKZ1mdKSgdpxDItL5e7VJuBJ+RS1jO5eWUN6xL+zvM48L1Tvw1eYzZS6L84
	aqjyCuyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNyO3-004sCx-1C;
	Mon, 24 Jul 2023 16:26:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNyO0-004sCI-1d
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 16:26:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 63CDC61261;
	Mon, 24 Jul 2023 16:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 421B8C433C7;
	Mon, 24 Jul 2023 16:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690215974;
	bh=S4iXMNvQ4V2uDDdlbSF7AZ4f7ou50WR5oCjfkEMSxzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kHpaZWw6WwygNEO3T5yP0B71FFGKHMJKdKncEpr/XoELnnLGrp51KPF6ocP0DYe1C
	 VOAql/yWZ/IcaJZLlzcOrlMQaBClTWEzX/aAHOOyfTYMVor56uxHTnYkX/9wf1AXRp
	 YwcwvwwBeBvxZbEgtsAQJiXtCFRNLkgDSKY42IACPHf4jzTqUWaLkJKANaFdyA0cmK
	 9l9uDZVqLhYp0+7JtS21mddhb/MAYoAYwgB68YflLV5afXWlWtsTjoDcGKtXgagr8S
	 9QVsS62o3bdMtiHlJJ48nj3mSul35eaaTJK3TAbXZkW9F7hVIPnqBFQLL5Q1sxplbj
	 S3GW/S5yuiGvg==
Date: Mon, 24 Jul 2023 17:26:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	vineetg@rivosinc.com, bjorn@kernel.org, greentime.hu@sifive.com,
	paul.walmsley@sifive.com, guoren@linux.alibaba.com,
	anup@brainfault.org, atishp@atishpatra.org, heiko.stuebner@vrull.eu,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Fangrui Song <maskray@google.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [v2, 5/5] riscv: vector: allow kernel-mode Vector with preemption
Message-ID: <20230724-enroll-scraggly-066ecbf5aae2@spud>
References: <20230721112855.1006-1-andy.chiu@sifive.com>
 <20230721112855.1006-6-andy.chiu@sifive.com>
 <20230724-frosting-luminance-93bcb317740a@wendy>
 <CABgGipXgV=Rtw4J-xPQG69p9Uw8Q13D_92SHM-jj_PyTW2rivQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABgGipXgV=Rtw4J-xPQG69p9Uw8Q13D_92SHM-jj_PyTW2rivQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_092616_651089_786D1C5F 
X-CRM114-Status: GOOD (  58.22  )
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
Content-Type: multipart/mixed; boundary="===============8401594632999452096=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8401594632999452096==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6YG4mVHEP9YhvF2X"
Content-Disposition: inline


--6YG4mVHEP9YhvF2X
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2023 at 11:45:47PM +0800, Andy Chiu wrote:
> On Mon, Jul 24, 2023 at 8:19=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> > On Fri, Jul 21, 2023 at 11:28:55AM +0000, Andy Chiu wrote:
> > > Add kernel_vstate to keep track of kernel-mode Vector registers when
> > > trap introduced context switch happens. Also, provide trap_pt_regs to
> > > let context save/restore routine reference status.VS at which the trap
> > > takes place. The thread flag TIF_RISCV_V_KERNEL_MODE indicates whether
> > > a task is running in kernel-mode Vector with preemption 'ON'. So cont=
ext
> > > switch routines know and would save V-regs to kernel_vstate and resto=
re
> > > V-regs immediately from kernel_vstate if the bit is set.
> > >
> > > Apart from a task's preemption status, the capability of
> > > running preemptive kernel-mode Vector is jointly controlled by the
> > > RISCV_V_VSTATE_CTRL_PREEMPTIBLE mask in the task's
> > > thread.vstate_ctrl. This bit is masked whenever a trap takes place in
> > > kernel mode while executing preemptive Vector code.
> > >
> > > Also, provide a config CONFIG_RISCV_ISA_V_PREEMPTIVE to give users an
> > > option to disable preemptible kernel-mode Vector at build time. Users
> > > with constraint memory may want to disable this config as preemptible
> > > kernel-mode Vector needs extra space for tracking per thread's
> > > kernel-mode V context. Or, users might as well want to disable it if =
all
> > > kernel-mode Vector code is time sensitive and cannot tolerate context
> > > swicth overhead.
> > >
> > > Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> > > ---
> > > Changelog v2:
> > >  - fix build fail when compiling without RISCV_ISA_V (Conor)
> > >  - 's/TIF_RISCV_V_KMV/TIF_RISCV_V_KERNEL_MODE' and add comment (Conor)
> > >  - merge Kconfig patch into this oine (Conor).
> > >  - 's/CONFIG_RISCV_ISA_V_PREEMPTIVE_KMV/CONFIG_RISCV_ISA_V_PREEMPTIVE=
/'
> > >    (Conor)
> > >  - fix some typos (Conor)
> > >  - enclose assembly with RISCV_ISA_V_PREEMPTIVE.
> > >  - change riscv_v_vstate_ctrl_config_kmv() to
> > >    kernel_vector_allow_preemption() for better understanding. (Conor)
> > >  - 's/riscv_v_kmv_preempitble/kernel_vector_preemptible/'
> > > ---
> > >  arch/riscv/Kconfig                     | 10 +++++
> > >  arch/riscv/include/asm/processor.h     |  2 +
> > >  arch/riscv/include/asm/simd.h          |  4 +-
> > >  arch/riscv/include/asm/thread_info.h   |  4 ++
> > >  arch/riscv/include/asm/vector.h        | 27 +++++++++++--
> > >  arch/riscv/kernel/asm-offsets.c        |  2 +
> > >  arch/riscv/kernel/entry.S              | 45 ++++++++++++++++++++++
> > >  arch/riscv/kernel/kernel_mode_vector.c | 53 ++++++++++++++++++++++++=
--
> > >  arch/riscv/kernel/process.c            |  8 +++-
> > >  arch/riscv/kernel/vector.c             |  3 +-
> > >  10 files changed, 148 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index 4c07b9189c86..0622951b15dd 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -507,6 +507,16 @@ config RISCV_ISA_V_DEFAULT_ENABLE
> > >
> > >         If you don't know what to do here, say Y.
> > >
> > > +config RISCV_ISA_V_PREEMPTIVE
> > > +     bool "Run kernel-mode Vector with kernel preemption"
> > > +     depends on PREEMPTION
> > > +     depends on RISCV_ISA_V
> > > +     default y
> > > +     help
> > > +       Ordinarily the kernel disables preemption before running in-k=
ernel
> > > +       Vector code. This config frees the kernel from disabling pree=
mption
> > > +       by adding memory on demand for tracking kernel's V-context.
> > > +
> > >  config TOOLCHAIN_HAS_ZBB
> > >       bool
> > >       default y
> > > diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/=
asm/processor.h
> > > index c950a8d9edef..497c0dd30b2a 100644
> > > --- a/arch/riscv/include/asm/processor.h
> > > +++ b/arch/riscv/include/asm/processor.h
> > > @@ -42,6 +42,8 @@ struct thread_struct {
> > >       unsigned long bad_cause;
> > >       unsigned long vstate_ctrl;
> > >       struct __riscv_v_ext_state vstate;
> > > +     struct pt_regs *trap_pt_regs;
> > > +     struct __riscv_v_ext_state kernel_vstate;
> > >  };
> > >
> > >  /* Whitelist the fstate from the task_struct for hardened usercopy */
> > > diff --git a/arch/riscv/include/asm/simd.h b/arch/riscv/include/asm/s=
imd.h
> > > index ef70af78005d..a54a0ce58f4d 100644
> > > --- a/arch/riscv/include/asm/simd.h
> > > +++ b/arch/riscv/include/asm/simd.h
> > > @@ -12,6 +12,7 @@
> > >  #include <linux/percpu.h>
> > >  #include <linux/preempt.h>
> > >  #include <linux/types.h>
> > > +#include <linux/thread_info.h>
> > >
> > >  #ifdef CONFIG_RISCV_ISA_V
> > >
> > > @@ -35,7 +36,8 @@ static __must_check inline bool may_use_simd(void)
> > >        * where it is set.
> > >        */
> > >       return !in_irq() && !irqs_disabled() && !in_nmi() &&
> > > -            !this_cpu_read(vector_context_busy);
> > > +            !this_cpu_read(vector_context_busy) &&
> > > +            !test_thread_flag(TIF_RISCV_V_KERNEL_MODE);
> > >  }
> > >
> > >  #else /* ! CONFIG_RISCV_ISA_V */
> > > diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/includ=
e/asm/thread_info.h
> > > index b182f2d03e25..8797d520e8ef 100644
> > > --- a/arch/riscv/include/asm/thread_info.h
> > > +++ b/arch/riscv/include/asm/thread_info.h
> > > @@ -94,6 +94,7 @@ int arch_dup_task_struct(struct task_struct *dst, s=
truct task_struct *src);
> > >  #define TIF_UPROBE           10      /* uprobe breakpoint or singles=
tep */
> > >  #define TIF_32BIT            11      /* compat-mode 32bit process */
> > >  #define TIF_RISCV_V_DEFER_RESTORE    12 /* restore Vector before ret=
uring to user */
> > > +#define TIF_RISCV_V_KERNEL_MODE                      13 /* kernel-mo=
de Vector run with preemption-on */
> > >
> > >  #define _TIF_NOTIFY_RESUME   (1 << TIF_NOTIFY_RESUME)
> > >  #define _TIF_SIGPENDING              (1 << TIF_SIGPENDING)
> > > @@ -101,9 +102,12 @@ int arch_dup_task_struct(struct task_struct *dst=
, struct task_struct *src);
> > >  #define _TIF_NOTIFY_SIGNAL   (1 << TIF_NOTIFY_SIGNAL)
> > >  #define _TIF_UPROBE          (1 << TIF_UPROBE)
> > >  #define _TIF_RISCV_V_DEFER_RESTORE   (1 << TIF_RISCV_V_DEFER_RESTORE)
> > > +#define _TIF_RISCV_V_KERNEL_MODE     (1 << TIF_RISCV_V_KERNEL_MODE)
> > >
> > >  #define _TIF_WORK_MASK \
> > >       (_TIF_NOTIFY_RESUME | _TIF_SIGPENDING | _TIF_NEED_RESCHED | \
> > >        _TIF_NOTIFY_SIGNAL | _TIF_UPROBE)
> > >
> > > +#define RISCV_V_VSTATE_CTRL_PREEMPTIBLE      0x20
> > > +
> > >  #endif /* _ASM_RISCV_THREAD_INFO_H */
> > > diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm=
/vector.h
> > > index 3b783b317112..c2776851d50d 100644
> > > --- a/arch/riscv/include/asm/vector.h
> > > +++ b/arch/riscv/include/asm/vector.h
> > > @@ -195,9 +195,24 @@ static inline void __switch_to_vector(struct tas=
k_struct *prev,
> > >  {
> > >       struct pt_regs *regs;
> > >
> > > -     regs =3D task_pt_regs(prev);
> > > -     riscv_v_vstate_save(&prev->thread.vstate, regs);
> > > -     riscv_v_vstate_set_restore(next, task_pt_regs(next));
> > > +     if (IS_ENABLED(CONFIG_RISCV_ISA_V_PREEMPTIVE) &&
> > > +         test_tsk_thread_flag(prev, TIF_RISCV_V_KERNEL_MODE)) {
> > > +             regs =3D prev->thread.trap_pt_regs;
> > > +             WARN_ON(!regs);
> >
> > In what cases could these WARN_ON()s be triggered?
>=20
> It probably happens when a kernel thread calls schedule() in the
> middle of preemptible kernel mode Vector code. Because the kernel sets
> trap_pt_regs only at trap entries. For example
>=20
> // assume preemption =3D "ON" and memory allocation
> // for kernel_vstate.datap success
> kernel_vector_begin();
> // some vector code
> ...
> schedule();
> ...
> kernel_vector_end();
>=20
> It is possible to support making scheduler calls in preemptible kernel
> mode Vector though. We just need to save nothing (all V regs are
> caller-save) and set an appropriate status.VS for the "next" process.

I'm struggling to theorycraft where this can go wrong, because my
knowledge in this area is limited. If the only way it can go wrong is by
calling schedule() in a "protected" section like this, that seems
"okay". Are there not non-trap induced context switches that we need to
worry about?

> > > +             riscv_v_vstate_save(&prev->thread.kernel_vstate, regs);
> > > +     } else {
> > > +             regs =3D task_pt_regs(prev);
> > > +             riscv_v_vstate_save(&prev->thread.vstate, regs);
> > > +     }
> > > +
> > > +     if (IS_ENABLED(CONFIG_RISCV_ISA_V_PREEMPTIVE) &&
> > > +         test_tsk_thread_flag(next, TIF_RISCV_V_KERNEL_MODE)) {
> > > +             regs =3D next->thread.trap_pt_regs;
> > > +             WARN_ON(!regs);
> > > +             riscv_v_vstate_restore(&next->thread.kernel_vstate, reg=
s);
> > > +     } else {
> > > +             riscv_v_vstate_set_restore(next, task_pt_regs(next));
> > > +     }
> > >  }
> >
> >
> > >  /*
> > >   * kernel_vector_begin(): obtain the CPU vector registers for use by=
 the calling
> > >   * context
> > > @@ -70,11 +109,14 @@ void kernel_vector_begin(void)
> > >
> > >       riscv_v_vstate_save(&current->thread.vstate, task_pt_regs(curre=
nt));
> > >
> > > -     get_cpu_vector_context();
> > > +     if (!preemptible() || !kernel_vector_preemptible()) {
> > > +             get_cpu_vector_context();
> > > +     } else {
> > > +             if (riscv_v_start_kernel_context())
> > > +                     get_cpu_vector_context();
> >
> > What happens here if riscv_v_start_kernel_context() fails w/ -ENOMEM?
>=20
> Here we would fallback to starting kernel-mode Vector with preemption
> disabled, by calling get_cpu_vector_context(). This makes calling
> kernel_vector_begin() end up with 2 possible consequences, if the
> caller runs in a preemptible context. One, which is the success path
> of riscv_v_start_kernel_context(), will not alter the preemption
> status but may increase memory usage if the context does not exist
> yet.
>=20
> However, if, on the other path, riscv_v_start_kernel_context() fails
> with -ENOMEM, then the kernel-mode Vector code will be executed with
> preemption "off".
>=20
> Another way of solving this ambiguity is to add another function to
> enable kernel mode Vector with preemption, and let the user check if
> the allocation fails. So users who really want to run their Vector
> code with preemption shall make this call. Otherwise, kernel mode
> Vector runs with preemption off. However, I don't really want to add
> it because I'd like to make the "upgrade" transparent to the caller.
>=20
> >
> > > +     }
> > >
> > >       riscv_v_enable();
> > > -
> > > -     return 0;
> > >  }
> > >  EXPORT_SYMBOL_GPL(kernel_vector_begin);
> > >
> > > @@ -96,6 +138,9 @@  void kernel_vector_end(void)
> > >
> > >       riscv_v_disable();
> > >
> > > -     put_cpu_vector_context();
> > > +     if (!test_thread_flag(TIF_RISCV_V_KERNEL_MODE))
> > > +             put_cpu_vector_context();
> > > +     else
> > > +             riscv_v_stop_kernel_context();
> > >  }
> >
> > Probably just missing something here, but how come we don't need to call
> > put_cpu_vector_context() here. I'm just a little confused, since, in
> > kernel_vector_begin, get_cpu_vector_context() is called.
>=20
> If "TIF_RISCV_V_KERNEL_MODE" is set, then we are running kernel-mode
> Vector with preemption "ON". In such cases we don't need to call
> put_cpu_vector_context(), which is the epilogue of kernel-mode Vector
> with preemption "OFF". Instead, we should call
> riscv_v_stop_kernel_context() to end the session.

I think, for these last two comments, I screwed up. I misread
if (riscv_v_start_kernel_context())
as
if (!riscv_v_start_kernel_context())
which is the source of my confusion about this being imbalanced.

Thanks for your explanations however!

--6YG4mVHEP9YhvF2X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZL6mHwAKCRB4tDGHoIJi
0tKAAP9CbmzBwsbJwJBfi2ANt3sL1kxx9x5zG2wsIKAEWNJnxwD/UJg1ZlfKQIhb
JeMy0zGWvSP9FkbwWoaw8MrBORJeeg8=
=gOcv
-----END PGP SIGNATURE-----

--6YG4mVHEP9YhvF2X--


--===============8401594632999452096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8401594632999452096==--

