Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7E5C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jun 2022 09:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/aTyilyVbg2Mj/WSkqlzTLqY9Dfq0vKPQB+Oz/zVwy0=; b=ijYmSxOq1ER5gi
	DkUAhBk26zR7QLVdxvVpvBQN3T0ms9oyt7z4ew+vDOjuIq7r+3a3s8WnlZOLmhRah6wPYp66IMDa0
	kusHqZ7LOKqHoKu0WW3bzxPH+WB0TCHuiOrUMuQI1TMQcfbo86xLIlWkhP7k/1gDodGi1KF7Vn+Rw
	Hq2GKKJG0Z+ev0KpIs4Sxtssi9WzllwvHyEFjQ9E1MdaVnwvOnj0ePHzUKHcJ3utGRYqJo83nFXWa
	75zA5D6m41s5KgcHFGziVPTG2z/Bi/vElQfQUyIdjSAm4O/0am6AsyWr5Zgfv5ygUW71oQVqkDkLV
	bSwSW8CyiLn1H90JOOiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4IyM-00EIRN-E5; Thu, 23 Jun 2022 09:17:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4IyI-00EIPc-Qx
	for linux-riscv@lists.infradead.org; Thu, 23 Jun 2022 09:17:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4203661C3A
	for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 09:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA553C341C6
	for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 09:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655975873;
	bh=U8j5P0qtBZIDNBnCMPBu0upIuqsJV+Rdn2D6qm/fQeE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NtJ3Zr13mthb3BDCLbM39D2dq7T07zfd88Rhronw3t2GgWJdMTh5TzfHiFmSGDOwS
	 7EtsaQMNvrjA3NDtR+BnDeRTBb2N0wenD0R6Co5vP9meSLo8hpP0tDmNxS4TcSgtI+
	 rVzpEHUWoiS5UajU2zeJGjVXQRDehoCeEg4XJQTddGDOlTf4GXqlqg20zTqv5TC6pH
	 BugmY/ITKB1sS4tyYnN+EarvAlERWRFZrWlzq4DTegD8A5rv/4L2gRTemknuLyhjdf
	 aSOTuZEpDzMQreTcbsTIfNYCqZviWaFXXNcjQ1656vAzIwi6KyubK1KPd0w3uszi9x
	 74sXg+nUqfUsw==
Received: by mail-vs1-f42.google.com with SMTP id o13so7474682vsn.4
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 02:17:53 -0700 (PDT)
X-Gm-Message-State: AJIora8SQwHVbW6LfBv6RJZ/iOuXtO/W3MAovmXe6YdvvZkv/I4HraYq
	B4GY7T+GVlDIxbXtRWiMvrfJO+M6Ot7+F4RSZ/U=
X-Google-Smtp-Source: AGRyM1vRxDL3RZ5DSRydCo8VPaFKP8w64JSpP9HmeCA1/VJQQp5/RZMHA6dneZ6BrymmJh8xDJhiM4APQg/4l0bZllc=
X-Received: by 2002:a05:6102:3e93:b0:353:a8fb:e922 with SMTP id
 m19-20020a0561023e9300b00353a8fbe922mr11614815vsv.51.1655975872663; Thu, 23
 Jun 2022 02:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220621144920.2945595-1-guoren@kernel.org> <20220621144920.2945595-2-guoren@kernel.org>
 <CAK8P3a2rnz9mQqhN6-e0CGUUv9rntRELFdxt_weiD7FxH7fkfQ@mail.gmail.com>
In-Reply-To: <CAK8P3a2rnz9mQqhN6-e0CGUUv9rntRELFdxt_weiD7FxH7fkfQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 23 Jun 2022 17:17:41 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTagygiQmNnxFG01ZbVKoHNc0rSbaPAjNFxxf7D7te3uQ@mail.gmail.com>
Message-ID: <CAJF2gTTagygiQmNnxFG01ZbVKoHNc0rSbaPAjNFxxf7D7te3uQ@mail.gmail.com>
Subject: Re: [PATCH V6 1/2] asm-generic: spinlock: Move qspinlock &
 ticket-lock into generic spinlock.h
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Peter Zijlstra <peterz@infradead.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Conor Dooley <Conor.Dooley@microchip.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Xuerui Wang <kernel@xen0n.name>, Rui Wang <r@hev.cc>, Stafford Horne <shorne@gmail.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_021755_007541_A24360F2 
X-CRM114-Status: GOOD (  25.39  )
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

On Thu, Jun 23, 2022 at 4:33 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Jun 21, 2022 at 4:49 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Separate ticket-lock into tspinlock.h and let generic spinlock support
> > qspinlock or ticket-lock selected by CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> > config.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  include/asm-generic/spinlock.h        | 90 ++------------------------
> >  include/asm-generic/spinlock_types.h  | 14 ++--
> >  include/asm-generic/tspinlock.h       | 92 +++++++++++++++++++++++++++
> >  include/asm-generic/tspinlock_types.h | 17 +++++
>
> Unless someone has a very good argument for the "tspinlock" name, I would
> prefer naming the new file ticket_spinlock.h. While the 'qspinlock' name has
> an established meaning already, this is not the case for 'tspinlock', and
> the longer name would be less confusing in my opinion.
Okay. ticket_spinlock is also good to me.

>
> > +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> > +#include <asm/qspinlock.h>
> >  #include <asm/qrwlock.h>
> > +#else
> > +#include <asm-generic/tspinlock.h>
> > +#endif
>
> As Huacai Chen suggested in the other thread, the asm/qrwlock.h include should
> be outside of the #ifdef here.
Okay


>
> > diff --git a/include/asm-generic/spinlock_types.h b/include/asm-generic/spinlock_types.h
> > index 8962bb730945..9875c1d058b3 100644
> > --- a/include/asm-generic/spinlock_types.h
> > +++ b/include/asm-generic/spinlock_types.h
> > @@ -3,15 +3,11 @@
> >  #ifndef __ASM_GENERIC_SPINLOCK_TYPES_H
> >  #define __ASM_GENERIC_SPINLOCK_TYPES_H
> >
> > -#include <linux/types.h>
> > -typedef atomic_t arch_spinlock_t;
> > -
> > -/*
> > - * qrwlock_types depends on arch_spinlock_t, so we must typedef that before the
> > - * include.
> > - */
> > +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> > +#include <asm-generic/qspinlock_types.h>
> >  #include <asm/qrwlock_types.h>
> > -
> > -#define __ARCH_SPIN_LOCK_UNLOCKED      ATOMIC_INIT(0)
> > +#else
> > +#include <asm-generic/tspinlock_types.h>
> > +#endif
>
> I don't think this file warrants the extra indirection, since both
> versions have only a
> few lines. Just put it all into one file, and change the files that include
> asm-generic/qspinlock_types.h to use asm-generic/spinlock_types.h instead.

Okay, I'll try that.


>
>       Arnd



--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
