Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CBEC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 08:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d33jLMZ6gqNGhf3iEwuWVpHUgo+G8TQzjnGN5TX6LXU=; b=wUlQNHcR7rdXLf
	YZkaxBWVxJoqYna/pzM/8BG8DRYnziVCFbs0GzISIaxLfJwuNCJQfQg1VefKdJNG/YLEWacVNHBo/
	OIoR6va1vbrntt4YNBW5RMx+2RjzrlNGj+jjRW3ScZ0CDL6cj6iD/HGnA/OMjfMmfXxm3zHmGGOdh
	Dhg6OdXtSLk8lJDM04xS+AA40FQlRib8URkN+G3hwEkWh4lyzDXSXW2SIX8Pjrr74kuX6m3UhPoHg
	NvWPKgoj0gm7aupHe2+FK9Rp2ESVnuP8MdWsvpCYgsyONOr80r3SKNcHGttOknn4+oSmw2jJZtFzx
	KNAESWoI8f/JxMZXGIqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMnQT-00DLOS-VQ; Wed, 23 Feb 2022 08:55:10 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMnQ6-00DLG2-Th; Wed, 23 Feb 2022 08:54:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 41D4CB81E90;
 Wed, 23 Feb 2022 08:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEECBC340EF;
 Wed, 23 Feb 2022 08:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645606478;
 bh=E/2Z4Vy9mxZGDI8XrK5Vjz10Eu6BNFSrCZQ+fcA0AuU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jWVgvaV9s3ebvbdrT2CL5hnpR4A74HcLjaNJPgrF3Ih66h3roPkwMiZZ09OJbX0o4
 dLizcrVUD9YE1YjQ5Tk0ay19dHsJ76iEB4fS5Cyq4lL8tHhCGJTtx3r2Ro3qLxrHoX
 XoncbDx8q1qIgsei84o8OtDZpuPPcrctcRUAlWjQ5wiQGgzRKe+3riYoTQuRKSDm2g
 it/L4+LOb+Di0mF5TiGRDuyHxCd5WcQn84cZ/kYVMz1z8spqeoMy8AYEQaa5hjulgK
 ZDxHsSQf4UwYbRx15jokiMWMIKPn1bx6Ph3ZE4XKssuFjEfidUPsTbGwwFAe/yLvLm
 Q2MQQiKn8TpqA==
Received: by mail-vk1-f182.google.com with SMTP id w128so11157850vkd.3;
 Wed, 23 Feb 2022 00:54:38 -0800 (PST)
X-Gm-Message-State: AOAM533jy1aU+M4N0qcqe/Bjwh9HZZmu2bnGEWwOzoID5jVxfdhW0UQa
 kw/BcJrvqLo4EZfMfkCHSTPKY1MaQMeOgWJbXb0=
X-Google-Smtp-Source: ABdhPJwWW6G4x9OFAhhFWSWfocQLhP1I117Bx4K85d+PzjcITJADDiakZphcZmjJzU/UZPrPS/vziQCTmEPnC0Gezro=
X-Received: by 2002:a05:6122:24b:b0:320:a9b7:f709 with SMTP id
 t11-20020a056122024b00b00320a9b7f709mr12200542vko.2.1645606477843; Wed, 23
 Feb 2022 00:54:37 -0800 (PST)
MIME-Version: 1.0
References: <20220201150545.1512822-10-guoren@kernel.org>
 <mhng-c74f1c06-0caa-4a71-82fa-7cf58a1ac0ca@palmer-ri-x1c9>
In-Reply-To: <mhng-c74f1c06-0caa-4a71-82fa-7cf58a1ac0ca@palmer-ri-x1c9>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 23 Feb 2022 16:54:27 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS8EnPeTRj72UE2KehAqFEZ5PFVAQWgBvWRbLkGsOyXCg@mail.gmail.com>
Message-ID: <CAJF2gTS8EnPeTRj72UE2KehAqFEZ5PFVAQWgBvWRbLkGsOyXCg@mail.gmail.com>
Subject: Re: [PATCH V5 09/21] riscv: compat: Add basic compat data type
 implementation
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>, 
 Greg KH <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_005447_327180_C70916AD 
X-CRM114-Status: GOOD (  24.21  )
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

On Wed, Feb 23, 2022 at 9:42 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Tue, 01 Feb 2022 07:05:33 PST (-0800), guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Implement riscv asm/compat.h for struct compat_xxx,
> > is_compat_task, compat_user_regset, regset convert.
> >
> > The rv64 compat.h has inherited most of the structs
> > from the generic one.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > ---
> >  arch/riscv/include/asm/compat.h      | 129 +++++++++++++++++++++++++++
> >  arch/riscv/include/asm/thread_info.h |   1 +
> >  2 files changed, 130 insertions(+)
> >  create mode 100644 arch/riscv/include/asm/compat.h
> >
> > diff --git a/arch/riscv/include/asm/compat.h b/arch/riscv/include/asm/compat.h
> > new file mode 100644
> > index 000000000000..2ac955b51148
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/compat.h
> > @@ -0,0 +1,129 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASM_COMPAT_H
> > +#define __ASM_COMPAT_H
> > +
> > +#define COMPAT_UTS_MACHINE   "riscv\0\0"
> > +
> > +/*
> > + * Architecture specific compatibility types
> > + */
> > +#include <linux/types.h>
> > +#include <linux/sched.h>
> > +#include <linux/sched/task_stack.h>
> > +#include <asm-generic/compat.h>
> > +
> > +static inline int is_compat_task(void)
> > +{
> > +     return test_thread_flag(TIF_32BIT);
> > +}
> > +
> > +struct compat_user_regs_struct {
> > +     compat_ulong_t pc;
> > +     compat_ulong_t ra;
> > +     compat_ulong_t sp;
> > +     compat_ulong_t gp;
> > +     compat_ulong_t tp;
> > +     compat_ulong_t t0;
> > +     compat_ulong_t t1;
> > +     compat_ulong_t t2;
> > +     compat_ulong_t s0;
> > +     compat_ulong_t s1;
> > +     compat_ulong_t a0;
> > +     compat_ulong_t a1;
> > +     compat_ulong_t a2;
> > +     compat_ulong_t a3;
> > +     compat_ulong_t a4;
> > +     compat_ulong_t a5;
> > +     compat_ulong_t a6;
> > +     compat_ulong_t a7;
> > +     compat_ulong_t s2;
> > +     compat_ulong_t s3;
> > +     compat_ulong_t s4;
> > +     compat_ulong_t s5;
> > +     compat_ulong_t s6;
> > +     compat_ulong_t s7;
> > +     compat_ulong_t s8;
> > +     compat_ulong_t s9;
> > +     compat_ulong_t s10;
> > +     compat_ulong_t s11;
> > +     compat_ulong_t t3;
> > +     compat_ulong_t t4;
> > +     compat_ulong_t t5;
> > +     compat_ulong_t t6;
> > +};
> > +
> > +static inline void regs_to_cregs(struct compat_user_regs_struct *cregs,
> > +                              struct pt_regs *regs)
> > +{
> > +     cregs->pc       = (compat_ulong_t) regs->epc;
> > +     cregs->ra       = (compat_ulong_t) regs->ra;
> > +     cregs->sp       = (compat_ulong_t) regs->sp;
> > +     cregs->gp       = (compat_ulong_t) regs->gp;
> > +     cregs->tp       = (compat_ulong_t) regs->tp;
> > +     cregs->t0       = (compat_ulong_t) regs->t0;
> > +     cregs->t1       = (compat_ulong_t) regs->t1;
> > +     cregs->t2       = (compat_ulong_t) regs->t2;
> > +     cregs->s0       = (compat_ulong_t) regs->s0;
> > +     cregs->s1       = (compat_ulong_t) regs->s1;
> > +     cregs->a0       = (compat_ulong_t) regs->a0;
> > +     cregs->a1       = (compat_ulong_t) regs->a1;
> > +     cregs->a2       = (compat_ulong_t) regs->a2;
> > +     cregs->a3       = (compat_ulong_t) regs->a3;
> > +     cregs->a4       = (compat_ulong_t) regs->a4;
> > +     cregs->a5       = (compat_ulong_t) regs->a5;
> > +     cregs->a6       = (compat_ulong_t) regs->a6;
> > +     cregs->a7       = (compat_ulong_t) regs->a7;
> > +     cregs->s2       = (compat_ulong_t) regs->s2;
> > +     cregs->s3       = (compat_ulong_t) regs->s3;
> > +     cregs->s4       = (compat_ulong_t) regs->s4;
> > +     cregs->s5       = (compat_ulong_t) regs->s5;
> > +     cregs->s6       = (compat_ulong_t) regs->s6;
> > +     cregs->s7       = (compat_ulong_t) regs->s7;
> > +     cregs->s8       = (compat_ulong_t) regs->s8;
> > +     cregs->s9       = (compat_ulong_t) regs->s9;
> > +     cregs->s10      = (compat_ulong_t) regs->s10;
> > +     cregs->s11      = (compat_ulong_t) regs->s11;
> > +     cregs->t3       = (compat_ulong_t) regs->t3;
> > +     cregs->t4       = (compat_ulong_t) regs->t4;
> > +     cregs->t5       = (compat_ulong_t) regs->t5;
> > +     cregs->t6       = (compat_ulong_t) regs->t6;
> > +};
> > +
> > +static inline void cregs_to_regs(struct compat_user_regs_struct *cregs,
> > +                              struct pt_regs *regs)
> > +{
> > +     regs->epc       = (unsigned long) cregs->pc;
> > +     regs->ra        = (unsigned long) cregs->ra;
> > +     regs->sp        = (unsigned long) cregs->sp;
> > +     regs->gp        = (unsigned long) cregs->gp;
> > +     regs->tp        = (unsigned long) cregs->tp;
> > +     regs->t0        = (unsigned long) cregs->t0;
> > +     regs->t1        = (unsigned long) cregs->t1;
> > +     regs->t2        = (unsigned long) cregs->t2;
> > +     regs->s0        = (unsigned long) cregs->s0;
> > +     regs->s1        = (unsigned long) cregs->s1;
> > +     regs->a0        = (unsigned long) cregs->a0;
> > +     regs->a1        = (unsigned long) cregs->a1;
> > +     regs->a2        = (unsigned long) cregs->a2;
> > +     regs->a3        = (unsigned long) cregs->a3;
> > +     regs->a4        = (unsigned long) cregs->a4;
> > +     regs->a5        = (unsigned long) cregs->a5;
> > +     regs->a6        = (unsigned long) cregs->a6;
> > +     regs->a7        = (unsigned long) cregs->a7;
> > +     regs->s2        = (unsigned long) cregs->s2;
> > +     regs->s3        = (unsigned long) cregs->s3;
> > +     regs->s4        = (unsigned long) cregs->s4;
> > +     regs->s5        = (unsigned long) cregs->s5;
> > +     regs->s6        = (unsigned long) cregs->s6;
> > +     regs->s7        = (unsigned long) cregs->s7;
> > +     regs->s8        = (unsigned long) cregs->s8;
> > +     regs->s9        = (unsigned long) cregs->s9;
> > +     regs->s10       = (unsigned long) cregs->s10;
> > +     regs->s11       = (unsigned long) cregs->s11;
> > +     regs->t3        = (unsigned long) cregs->t3;
> > +     regs->t4        = (unsigned long) cregs->t4;
> > +     regs->t5        = (unsigned long) cregs->t5;
> > +     regs->t6        = (unsigned long) cregs->t6;
> > +};
> > +
> > +#endif /* __ASM_COMPAT_H */
> > diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> > index 60da0dcacf14..9392e35c689d 100644
> > --- a/arch/riscv/include/asm/thread_info.h
> > +++ b/arch/riscv/include/asm/thread_info.h
> > @@ -91,6 +91,7 @@ struct thread_info {
> >  #define TIF_SECCOMP          8       /* syscall secure computing */
> >  #define TIF_NOTIFY_SIGNAL    9       /* signal notifications exist */
> >  #define TIF_UPROBE           10      /* uprobe breakpoint or singlestep */
> > +#define TIF_32BIT            11      /* 32bit process */
>
> Presumably that's just meant for 32-bit processes on rv64?  Probably
> best to have the comment say that explicitly.
/* compat-mode 32bit process */

>
> >  #define _TIF_SYSCALL_TRACE   (1 << TIF_SYSCALL_TRACE)
> >  #define _TIF_NOTIFY_RESUME   (1 << TIF_NOTIFY_RESUME)



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
