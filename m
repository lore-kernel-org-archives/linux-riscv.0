Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDD4C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 01:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/HZvSCaoC2EQD6bMp+PrKvTQJ1VSgBo3/SsGRgWyTV4=; b=uaxmHLD3a/GM1P
	6RkvaiYLO9NNdF1FVDivC4jN5x17sbYY18kQboxHvw9jwkah0djo5nWgKpO1wHdhA4YfxuUodcX5l
	3NTc8V//paxGpbw9TOnDub46rOgkUk+65IaVoP9StFAP/gIAYMoeW7kyItoCW4ndXkk734yfmhmeN
	fdhuSe31SpSb/Ub7cFi5Q03Yn5zoxhaCFx4KY//EgGJ0mo4GMv5f6uuGP+Sn2pd8KW4aJsN7NgEpt
	Y4BOhVN3FxwRe0sB2Z0qSDJDsJ14YCJ0S/JGBXLdqqzVT5WiPbii+1CFinqYAo85/52iIp4cWIJWA
	kJPijZZiNm2ADhdhJuTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6ML1-008t8j-Gl; Wed, 29 Jun 2022 01:17:51 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6MKy-008t7G-Id
	for linux-riscv@lists.infradead.org; Wed, 29 Jun 2022 01:17:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C3807B81F16
	for <linux-riscv@lists.infradead.org>; Wed, 29 Jun 2022 01:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59A0FC385A5
	for <linux-riscv@lists.infradead.org>; Wed, 29 Jun 2022 01:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656465462;
	bh=qwLxFYOuowxIe8KZeDT2ewzdtv2FMZ3tEfCQjPwD+r0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EDAetCCmvnZHcxyz0H1XLFh0XtVkVcZUDpSkexY/oY3ava9yp5Y9OFaWYO/z7bC3t
	 goxVcYCawDgwDstnfUtkNRo0ZCKZNcSSD2YcLOoZ3PzVZAh8qA10coEWDEmipjlbMa
	 Ftlct2aG7fLfKxDGAXd+AEg03+fDA39hLgyeEaOfpJjY91lSJ7zX7zvecJf/DYivTb
	 0q42U1H4PL13VVSfvOk++cKE4iNXJTFKzA2yQCflUTODj6KySNelHBdnwQ7tKOprD/
	 nTse+T9QdSXfi0hArQgygf1rC5fabJud30KQTLjg8Nae/hwm2Mp4e7+F1DLL7gKZKf
	 KqPjafRUm1odA==
Received: by mail-ua1-f48.google.com with SMTP id s3so3391707uag.10
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jun 2022 18:17:42 -0700 (PDT)
X-Gm-Message-State: AJIora8imGhlXoPBVcTuqsUq1495mm70thvghtzciqCcgWsecNn8Y0pS
	mB+2e5KQO7frYP6ZKYj/Dmpg4zHnh/tP1igsWvE=
X-Google-Smtp-Source: AGRyM1st40hCRJVtOkY/GgEh2hf0RL+nbenkSflSWZSZDWsDeubLW9YCT+HEpSzX2QJvuFM4OduPHYtkSBkJGtts9uQ=
X-Received: by 2002:ab0:6704:0:b0:37c:c743:eebe with SMTP id
 q4-20020ab06704000000b0037cc743eebemr257481uam.84.1656465461345; Tue, 28 Jun
 2022 18:17:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220628081707.1997728-1-guoren@kernel.org> <20220628081707.1997728-5-guoren@kernel.org>
 <09abc75e-2ffb-1ab5-d0fc-1c15c943948d@redhat.com>
In-Reply-To: <09abc75e-2ffb-1ab5-d0fc-1c15c943948d@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 29 Jun 2022 09:17:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQZzOtOsq0DV48Gi76UtBSa+vdY7dLZmoPD_OFUZ0Wbrg@mail.gmail.com>
Message-ID: <CAJF2gTQZzOtOsq0DV48Gi76UtBSa+vdY7dLZmoPD_OFUZ0Wbrg@mail.gmail.com>
Subject: Re: [PATCH V7 4/5] asm-generic: spinlock: Add combo spinlock (ticket
 & queued)
To: Waiman Long <longman@redhat.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
	Peter Zijlstra <peterz@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_181748_923410_26F9B0E2 
X-CRM114-Status: GOOD (  28.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jun 29, 2022 at 2:13 AM Waiman Long <longman@redhat.com> wrote:
>
> On 6/28/22 04:17, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Some architecture has a flexible requirement on the type of spinlock.
> > Some LL/SC architectures of ISA don't force micro-arch to give a strong
> > forward guarantee. Thus different kinds of memory model micro-arch would
> > come out in one ISA. The ticket lock is suitable for exclusive monitor
> > designed LL/SC micro-arch with limited cores and "!NUMA". The
> > queue-spinlock could deal with NUMA/large-scale scenarios with a strong
> > forward guarantee designed LL/SC micro-arch.
> >
> > So, make the spinlock a combo with feature.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Palmer Dabbelt <palmer@rivosinc.com>
> > ---
> >   include/asm-generic/spinlock.h | 43 ++++++++++++++++++++++++++++++++--
> >   kernel/locking/qspinlock.c     |  2 ++
> >   2 files changed, 43 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
> > index f41dc7c2b900..a9b43089bf99 100644
> > --- a/include/asm-generic/spinlock.h
> > +++ b/include/asm-generic/spinlock.h
> > @@ -28,34 +28,73 @@
> >   #define __ASM_GENERIC_SPINLOCK_H
> >
> >   #include <asm-generic/ticket_spinlock.h>
> > +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> > +#include <linux/jump_label.h>
> > +#include <asm-generic/qspinlock.h>
> > +
> > +DECLARE_STATIC_KEY_TRUE(use_qspinlock_key);
> > +#endif
> > +
> > +#undef arch_spin_is_locked
> > +#undef arch_spin_is_contended
> > +#undef arch_spin_value_unlocked
> > +#undef arch_spin_lock
> > +#undef arch_spin_trylock
> > +#undef arch_spin_unlock
> >
> >   static __always_inline void arch_spin_lock(arch_spinlock_t *lock)
> >   {
> > -     ticket_spin_lock(lock);
> > +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> > +     if (static_branch_likely(&use_qspinlock_key))
> > +             queued_spin_lock(lock);
> > +     else
> > +#endif
> > +             ticket_spin_lock(lock);
> >   }
>
> Why do you use a static key to control whether to use qspinlock or
> ticket lock? In the next patch, you have
>
> +#if !defined(CONFIG_NUMA) && defined(CONFIG_QUEUED_SPINLOCKS)
> +       static_branch_disable(&use_qspinlock_key);
> +#endif
>
> So the current config setting determines if qspinlock will be used, not
> some boot time parameter that user needs to specify. This patch will
> just add useless code to lock/unlock sites. I don't see any benefit of
> doing that.
This is a startup patch for riscv. next, we could let vendors make choices.
I'm not sure they like cmdline or vendor-specific errata style.

Eventually, we would let one riscv Image support all machines, some
use ticket-lock, and some use qspinlock.

>
> Cheers,
> Longman
>



--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
