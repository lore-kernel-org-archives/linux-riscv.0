Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4977C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jun 2022 22:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bXY9S+t19YtEoPpfoMD9d7kUjLNOvG9eM0go8yejzKE=; b=RJsKHrKZ8eP7eA
	jSJWmOSnAvJS7VTp+iyUkrWKWXOvqG0Fn7yFwltZUx6TgIB6CLtlJshNnBcj6U27+k2s/FDaFQcK2
	p0hvDu0pAWtcaVbQDDXDmFX6VyV2Anj6lOlb/HRmW5HXcEYR2YgxJASx28fU1mlyK1pUM5tS3mm/X
	DUMQ9t7+XX/6EUFa3rqMC1DAynO7zKebzx0/u807E5c5TeERWj3D/flI82txRi0XDjZJjdtgoRmku
	losn4aRTEH1+rY+Zy8S1ToGdg0SAG35kYuq9oB7vA5dDMx14tRUlcJGpdv7FSSqIR0D1BeVm2lFgc
	3mwT0vijRRl0Z5TkJ8kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3QBr-002inM-6T; Mon, 20 Jun 2022 22:48:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3QBn-002imF-Dg
	for linux-riscv@lists.infradead.org; Mon, 20 Jun 2022 22:48:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DB177B81213
	for <linux-riscv@lists.infradead.org>; Mon, 20 Jun 2022 22:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84CCC36AE3
	for <linux-riscv@lists.infradead.org>; Mon, 20 Jun 2022 22:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655765288;
	bh=F1MFlX9p99cf5xJ+vWIrpSxEkV+myAxGug3dmZFii1k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EscGU+l1+yRofgP4Cbam5CzzW4Y0q/yc/CAFQ2GCNZIjVdIN+keCY1ZDzpmQ7rC5G
	 b1tmiQIMOl4plRI5KT5knyDGriY9DvFmHmV2a8RiyMyxjQLvEoYwhTkT5DD/QMXw5O
	 K5zTMPm0iLeVpiwtsoxa5PoMLUnhUnoaVS9gHZ7zuNRO3dIl0gOlbp4PPfp9Ywy9K4
	 5ZQ0bgwagU9J/ZNuSDxznJIlE0vh1tbwYcQSYOrB0Zcd5cX9hCklAbrBbHPmypwVMA
	 jj/p5wogBKvWJ5ZppCKu6mg6sySqQzJc1NRM167f92EILJMjJN7xuN3esiexia9zBm
	 lds8vhAHci3cQ==
Received: by mail-ua1-f44.google.com with SMTP id b7so3215916uap.5
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jun 2022 15:48:08 -0700 (PDT)
X-Gm-Message-State: AJIora+86VAHnBiFrOvRLnyZjiXr3fFSrTzHMPzhPGwu3xpUksNvzD8V
	cEgSRGPIMQm7IlXQkCzV+1Ei+fgFPkKB84zWVv0=
X-Google-Smtp-Source: AGRyM1sRx1+JA8cZQ05e7AUt1+f+8rCbotdZ08KaW9u7r0MGfLB3MMfclBmsXUd+QhSL8qbBsXd4XqT7NzihUgJyA84=
X-Received: by 2002:a9f:23c2:0:b0:365:958:e807 with SMTP id
 60-20020a9f23c2000000b003650958e807mr8884819uao.114.1655765287621; Mon, 20
 Jun 2022 15:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220620155404.1968739-1-guoren@kernel.org> <CAK8P3a2enbvE9a5V=JpUFt7FfyDGLQHTWTszibqqLVoeiMAo5Q@mail.gmail.com>
 <f6513b4f-ef62-fd40-b031-27c9b7f57e00@redhat.com>
In-Reply-To: <f6513b4f-ef62-fd40-b031-27c9b7f57e00@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 21 Jun 2022 06:47:56 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSQ17YQ41G+e0TBp2njPzx4LBGZw0GhyKCBqDW5AAuYaw@mail.gmail.com>
Message-ID: <CAJF2gTSQ17YQ41G+e0TBp2njPzx4LBGZw0GhyKCBqDW5AAuYaw@mail.gmail.com>
Subject: Re: [PATCH V5] riscv: Add qspinlock support
To: Waiman Long <longman@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_154811_792965_ED5D482A 
X-CRM114-Status: GOOD (  25.42  )
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

On Tue, Jun 21, 2022 at 5:16 AM Waiman Long <longman@redhat.com> wrote:
>
>
> On 6/20/22 16:42, Arnd Bergmann wrote:
> > On Mon, Jun 20, 2022 at 5:54 PM <guoren@kernel.org> wrote:
> >>> +config RISCV_USE_QUEUED_SPINLOCKS
> >> +       bool "Using queued spinlock instead of ticket-lock"
> > Maybe we can just make ARCH_USE_QUEUED_SPINLOCKS
> > user visible and give users the choice between the two generic
> > implementations across all architectures that support the qspinlock
> > variant.
> >
> > In arch/riscv, you'd then just have a
> >
> >          select ARCH_HAVE_QUEUED_SPINLOCKS
> >
> > diff --git a/arch/riscv/include/asm/spinlock.h
> > b/arch/riscv/include/asm/spinlock.h
> >> new file mode 100644
> >> index 000000000000..fd3fd09cff52
> >> --- /dev/null
> >> +++ b/arch/riscv/include/asm/spinlock.h
> >> @@ -0,0 +1,12 @@
> >> +/* SPDX-License-Identifier: GPL-2.0 */
> >> +#ifndef __ASM_SPINLOCK_H
> >> +#define __ASM_SPINLOCK_H
> >> +
> >> +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> >> +#include <asm/qspinlock.h>
> >> +#include <asm/qrwlock.h>
> >> +#else
> >> +#include <asm-generic/spinlock.h>
> >> +#endif
> >> +
> > Along the same lines:
> >
> > I think I'd prefer the header changes to be done in the asm-generic
> > version of this file, so this can be shared across all architectures
> > that want to give the choice between ticket and queued spinlock.
>
> I concur. Qspinlock is only needed if we want to support systems with a
> large number of CPUs. For systems with a small number of CPUs. It
> doesn't matter if qspinlock or the ticket lock is being used.
RISC-V has had NUMA scenario. Think two AI chips with CCIX ports, they
could be flexibly connected when needed.

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
