Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62D8C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 19:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sYHbGkeiEi3oL+GF31XuixnIu3XM4rnNvZX7oKaVS7s=; b=JgXHNGjfzk5oQ3
	snCP5tqUTXJA6++ZL7I8ZB3vQkPYhjTwiGXTtI7z8xYchL7EgYuHuKt3I32p7JXk2whn9YUk2YBYl
	6diiqJf8oEKUt/nDFPt7af+raGLJOhqh1rxPRfpeSzkFLBSeBl2Yk5sRcQZz0ZsaGZ60klCKrqJrt
	s0Sw+Wl9MAyZbjIFw0hDz/rqQeZhobHzgb6wazZO90lPhw+b/ePaSkeMtJOPTDV+ZAD6W/0rK/omq
	MSlNEO3FmvDtYjoHOkV7pPdGH5ko/TmCr8kU7bBMv0n8RM9bKrVdmmou3hfrLJHTucge7WzlTx7Mu
	emURS4uTrAcM8fz7+gBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCmQ4-007nAb-02;
	Mon, 11 Dec 2023 19:58:24 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCmPz-007n6N-1f
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 19:58:22 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d0a5422c80so42781215ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 11:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702324697; x=1702929497; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=udnVV+1LLo4lC1xfTDslzGTNJxjoPUuCwayPqZBU8LI=;
        b=aHdPL4LACYPEP03YnFvqwTiVxYGmCnwCgOR66687e910BxaLjqvpwVElJxGYBNmeiP
         e5BalEfXidF2s4Mn/ioo2FMDc8YXzbVXzKheym4VpYubRIR/4IYAzNydeT62fFACFroO
         c1Ruerwu2oZnn1aM+0dSD+UzSmV21c2UQNnD/tY1S9F9FdYlzH5yjWfHwNykYTBIGVYi
         t0BKl4COLFdVi8ZYKowbQ+0NUNdXIxLnaSVrqOCFtEvvT44P5F5h9ZHgTZr1mQpM6Y2K
         lDAcolG6hjSoPfPY44l1OyJvyiUv0vTZok5kucujLoMgHcHWgw1f6dTmSEc4U8Z9wbQE
         LeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702324697; x=1702929497;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=udnVV+1LLo4lC1xfTDslzGTNJxjoPUuCwayPqZBU8LI=;
        b=PoeoJdXxpLuf23ppajRhs0Hux1qIn8cfYaYWg33/hopT+IjAICyxsgDcr5N+xVr3a+
         a6uZs5QfCGRlDjhJ0uEXUhDVnNUzg/1UG7Lf3Ifg8HH748tTFbpw8c72Ulj1WTfoDIkx
         1mfysDZGkEu9Pu7z0VFYA4dgzDEcEHelvPNNL0hjkUacGt1TJMdbo++uD+Wr0hXxvVvv
         VJ2fk039B3LL0wEjT9Nzu6G8CLWuBQJjmJLnt/Kexn8zhh+bzgMBerjrw7zRcA8Dr7eK
         63WyO/wFVpBFES4sLuKUsoLp7NXRwfENlkx6Q0HPnYUCCtgoIY+Tya6VBB4FXtdpOsBj
         OT4g==
X-Gm-Message-State: AOJu0Yy+e7opHBbcrTspOz6X/Ae9kiI301GCSrHWbFR7Af7+brHaHj1+
	+ol0ByVNuFyRpKf1zOq8niv6Hw==
X-Google-Smtp-Source: AGHT+IF8qEC6cJmCNThPUuX1QiJVGVVFfPZYciPtFoh755w8NOMTAIh9h3+bcKDrrfs1KcEClSYy9Q==
X-Received: by 2002:a17:902:ced1:b0:1d0:b1f0:1006 with SMTP id d17-20020a170902ced100b001d0b1f01006mr4957616plg.101.1702324696738;
        Mon, 11 Dec 2023 11:58:16 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id f8-20020a170902ce8800b001cfc46baa40sm7051945plg.158.2023.12.11.11.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 11:58:16 -0800 (PST)
Date: Mon, 11 Dec 2023 11:58:13 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] riscv: Include riscv_set_icache_flush_ctx prctl
Message-ID: <ZXdp1WP+CNutw80I@ghost>
References: <20231130-fencei-v2-0-2cb623ab1b1f@rivosinc.com>
 <20231130-fencei-v2-1-2cb623ab1b1f@rivosinc.com>
 <42e0c9d4-318e-4c84-bdfb-fd364bea02d5@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <42e0c9d4-318e-4c84-bdfb-fd364bea02d5@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_115819_915745_608DA238 
X-CRM114-Status: GOOD (  34.48  )
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

On Mon, Dec 11, 2023 at 10:12:42AM +0100, Cl=E9ment L=E9ger wrote:
> =

> =

> On 01/12/2023 08:21, Charlie Jenkins wrote:
> > Support new prctl with key PR_RISCV_SET_ICACHE_FLUSH_CTX to enable
> > optimization of cross modifying code. This prctl enables userspace code
> > to use icache flushing instructions such as fence.i with the guarantee
> > that the icache will continue to be clean after thread migration.
> > =

> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/mmu.h       |  2 ++
> >  arch/riscv/include/asm/processor.h |  6 ++++++
> >  arch/riscv/mm/cacheflush.c         | 37 ++++++++++++++++++++++++++++++=
+++++++
> >  arch/riscv/mm/context.c            |  8 +++++---
> >  include/uapi/linux/prctl.h         |  3 +++
> >  kernel/sys.c                       |  6 ++++++
> >  6 files changed, 59 insertions(+), 3 deletions(-)
> > =

> > diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
> > index 355504b37f8e..60be458e94da 100644
> > --- a/arch/riscv/include/asm/mmu.h
> > +++ b/arch/riscv/include/asm/mmu.h
> > @@ -19,6 +19,8 @@ typedef struct {
> >  #ifdef CONFIG_SMP
> >  	/* A local icache flush is needed before user execution can resume. */
> >  	cpumask_t icache_stale_mask;
> > +	/* Force local icache flush on all migrations. */
> > +	bool force_icache_flush;
> >  #endif
> >  #ifdef CONFIG_BINFMT_ELF_FDPIC
> >  	unsigned long exec_fdpic_loadmap;
> > diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/as=
m/processor.h
> > index f19f861cda54..7eda6c75e0f2 100644
> > --- a/arch/riscv/include/asm/processor.h
> > +++ b/arch/riscv/include/asm/processor.h
> > @@ -84,6 +84,9 @@ struct thread_struct {
> >  	unsigned long vstate_ctrl;
> >  	struct __riscv_v_ext_state vstate;
> >  	unsigned long align_ctl;
> > +#ifdef CONFIG_SMP
> > +	bool force_icache_flush;
> > +#endif
> >  };
> >  =

> >  /* Whitelist the fstate from the task_struct for hardened usercopy */
> > @@ -145,6 +148,9 @@ extern int set_unalign_ctl(struct task_struct *tsk,=
 unsigned int val);
> >  #define GET_UNALIGN_CTL(tsk, addr)	get_unalign_ctl((tsk), (addr))
> >  #define SET_UNALIGN_CTL(tsk, val)	set_unalign_ctl((tsk), (val))
> >  =

> > +#define RISCV_SET_ICACHE_FLUSH_CTX(arg1, arg2)	riscv_set_icache_flush_=
ctx(arg1, arg2)
> > +extern int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long=
 per_thread);
> > +
> >  #endif /* __ASSEMBLY__ */
> >  =

> >  #endif /* _ASM_RISCV_PROCESSOR_H */
> > diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> > index 55a34f2020a8..3b2bf8256a10 100644
> > --- a/arch/riscv/mm/cacheflush.c
> > +++ b/arch/riscv/mm/cacheflush.c
> > @@ -5,6 +5,7 @@
> >  =

> >  #include <linux/acpi.h>
> >  #include <linux/of.h>
> > +#include <linux/prctl.h>
> >  #include <asm/acpi.h>
> >  #include <asm/cacheflush.h>
> >  =

> > @@ -152,3 +153,39 @@ void __init riscv_init_cbo_blocksizes(void)
> >  	if (cboz_block_size)
> >  		riscv_cboz_block_size =3D cboz_block_size;
> >  }
> > +
> > +/**
> > + * riscv_set_icache_flush_ctx() - Enable userspace to emit icache flus=
hing instructions.
> > + * @ctx: Sets the type of context
> > + *  - PR_RISCV_CTX_SW_FENCEI: Allow fence.i in userspace. Another fenc=
e.i will
> > + *			      emitted on thread/process migration.
> > + * @per_thread: When set to 0, will use the default behavior of settin=
g the
> > + *  icache flush context per process. When set to 1, will use a per th=
read
> > + *  context.
> > + *
> > + * When in per-process context, there may be multiple threads using th=
e same mm.
> > + * Therefore, the icache can never be assumed clean when. Multiple thr=
eads in
> > + * the process may modify instructions in the mm concurrently.
> > + *
> > + * In per-thread context, it can be assumed that all modifications to
> > + * instructions in memory will be performed by this thread. When the t=
hread is
> > + * migrated the icache will be flushed.
> > + *
> > + */
> > +int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long per_th=
read)
> > +{
> > +#ifdef CONFIG_SMP
> > +	switch (ctx) {
> > +	case PR_RISCV_CTX_SW_FENCEI:
> > +		if (per_thread)
> > +			current->thread.force_icache_flush =3D true;
> > +		else
> > +			current->mm->context.force_icache_flush =3D true;
> > +		break;
> > +
> > +	default:
> > +		break;
> > +	}
> > +#endif
> > +	return 0;
> > +}
> > diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> > index 217fd4de6134..a394b146e78a 100644
> > --- a/arch/riscv/mm/context.c
> > +++ b/arch/riscv/mm/context.c
> > @@ -297,12 +297,14 @@ static inline void set_mm(struct mm_struct *prev,
> >   *
> >   * The "cpu" argument must be the current local CPU number.
> >   */
> > -static inline void flush_icache_deferred(struct mm_struct *mm, unsigne=
d int cpu)
> > +static inline void flush_icache_deferred(struct mm_struct *mm, unsigne=
d int cpu,
> > +					 struct task_struct *task)
> >  {
> >  #ifdef CONFIG_SMP
> >  	cpumask_t *mask =3D &mm->context.icache_stale_mask;
> >  =

> > -	if (cpumask_test_cpu(cpu, mask)) {
> > +	if (cpumask_test_cpu(cpu, mask) || mm->context.force_icache_flush ||
> > +	    mm->context.force_icache_flush) {
> =

> Hey Charlie,
> =

> Looks like you duplicated "||=A0mm->context.force_icache_flush" here.
> =

Whoops, will send out a fix for that.

- Charlie

> Cl=E9ment
> =

> >  		cpumask_clear_cpu(cpu, mask);
> >  		/*
> >  		 * Ensure the remote hart's writes are visible to this hart.
> > @@ -332,5 +334,5 @@ void switch_mm(struct mm_struct *prev, struct mm_st=
ruct *next,
> >  =

> >  	set_mm(prev, next, cpu);
> >  =

> > -	flush_icache_deferred(next, cpu);
> > +	flush_icache_deferred(next, cpu, task);
> >  }
> > diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> > index 370ed14b1ae0..472801ea78cc 100644
> > --- a/include/uapi/linux/prctl.h
> > +++ b/include/uapi/linux/prctl.h
> > @@ -306,4 +306,7 @@ struct prctl_mm_map {
> >  # define PR_RISCV_V_VSTATE_CTRL_NEXT_MASK	0xc
> >  # define PR_RISCV_V_VSTATE_CTRL_MASK		0x1f
> >  =

> > +#define PR_RISCV_SET_ICACHE_FLUSH_CTX	71
> > +# define PR_RISCV_CTX_SW_FENCEI		0
> > +
> >  #endif /* _LINUX_PRCTL_H */
> > diff --git a/kernel/sys.c b/kernel/sys.c
> > index 420d9cb9cc8e..e806a8a67c36 100644
> > --- a/kernel/sys.c
> > +++ b/kernel/sys.c
> > @@ -146,6 +146,9 @@
> >  #ifndef RISCV_V_GET_CONTROL
> >  # define RISCV_V_GET_CONTROL()		(-EINVAL)
> >  #endif
> > +#ifndef RISCV_SET_ICACHE_FLUSH_CTX
> > +# define RISCV_SET_ICACHE_FLUSH_CTX(a, b)	(-EINVAL)
> > +#endif
> >  =

> >  /*
> >   * this is where the system-wide overflow UID and GID are defined, for
> > @@ -2739,6 +2742,9 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long=
, arg2, unsigned long, arg3,
> >  	case PR_RISCV_V_GET_CONTROL:
> >  		error =3D RISCV_V_GET_CONTROL();
> >  		break;
> > +	case PR_RISCV_SET_ICACHE_FLUSH_CTX:
> > +		error =3D RISCV_SET_ICACHE_FLUSH_CTX(arg2, arg3);
> > +		break;
> >  	default:
> >  		error =3D -EINVAL;
> >  		break;
> > =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
