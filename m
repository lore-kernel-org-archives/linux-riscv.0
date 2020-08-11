Return-Path: <SRS0=5c4l=BV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB1A0C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2020 18:46:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92A6D206B2
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2020 18:46:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KxuRt2Yf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="N2D4pMFg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92A6D206B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2kZBZ4LX5eiyhLS0ay+Lhh5gyK2tq+Eme9QdSC6c1B8=; b=KxuRt2YfuNfdrwPd3UH8qwyOU
	FKuB6CUM1B/vAoLnEe4n1wApNC0XkUyambJ/GOsH4vGyZ0sj4jSg7NKICyz4gP5TQBrjV23ypR9uF
	OAH4fnn9CiUJn1CJt069040Sah9QadbkMfedLQXpIWRf14vp54jVfYqfk0F6Kdvn9wEGyt5a0H2V3
	swa3H8c3fXT1TusEabTeFAtatQT4QK7lUwtosvQjVe4HrfGDsKFskXmScb7zWxEwZawrD8wVaYyZq
	5kth/mT9IzsL9FOZM8dyuOrewmLHDnzaaYpzuy2pKx2QMSyiVhd82SB/2a9cyeA5n/NX5motwF/2+
	qKwGTaEsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5ZHk-0000WX-Rg; Tue, 11 Aug 2020 18:46:08 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5ZHi-0000Vp-LW
 for linux-riscv@lists.infradead.org; Tue, 11 Aug 2020 18:46:07 +0000
Received: by mail-wm1-x341.google.com with SMTP id k8so3834098wma.2
 for <linux-riscv@lists.infradead.org>; Tue, 11 Aug 2020 11:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rcqr7IEEdVp/PYIy+e4k4nefLJLdXAwPGWDE8E1RWjc=;
 b=N2D4pMFgjGn4hATidL2UNDrGnhvfU/Y6zwGhWJT6Zf6uYI/CFGj7yAbBip75px+tZ2
 KkaQYHfPWXBJUU4yDGnGFtcIsyfz+NcUcyOmopTF1woRUFTR+Po3U93bhye+hXr6InbU
 dFBLQQsvYWzb5CkzGl/qmyq2biw3aDTyG50Qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rcqr7IEEdVp/PYIy+e4k4nefLJLdXAwPGWDE8E1RWjc=;
 b=c9/o6WuL3dhAxmiUTSiOavo1qT6BBW/gAflt3Yku2bQp8kmIwqbBaXOTwjdvAInU+w
 J8Fi7tB4zoT3vxEo3bgb6VQwFDveFnGwpxOJ1gGJG9NwYX5qCVnev+t2vI5xpTg/7+pC
 eKXyh+poskhj3B6w5HIjD759YUjXxk/ROpYakU+wus8zMdCYFsMzDtV1QgGlB2fhKd+A
 JlI0Pent/HIf8DWDen0fa+K/l9vQrOH4IGyW/mX0n4K1FNMqiC7pOBG9zmg43UK/U8UD
 Y6ctUdzxAPIj8JOW2xm6G2t1AKLs96sBTR68wsl6PjelaSh/34F0q3eunt2VT1/BZLcX
 oIfA==
X-Gm-Message-State: AOAM5308ts/7SsjKUH3nLBv+z10k2LrvRnMLemhNCRbS3fSr0EsCQCJ9
 i5MjF+uh0TwBsDsPIVdQaqjUGWPA/RZ9WkOsruQN
X-Google-Smtp-Source: ABdhPJysOcuj5YiKWDGh5hwJd0Sl52RDWE6niLmnCY6YAm9rQ8thDG8qu/k25x/glsPyyBm3TnzjZ9L//cSvLA5ajGI=
X-Received: by 2002:a1c:ba42:: with SMTP id k63mr4982540wmf.31.1597171563533; 
 Tue, 11 Aug 2020 11:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200811063659.284088-1-qiuwenbo@phytium.com.cn>
 <CAAhSdy1c=R6aUZ6EOggmJ_Bqm2O0VLKEku=zyFfabExSzOKErA@mail.gmail.com>
In-Reply-To: <CAAhSdy1c=R6aUZ6EOggmJ_Bqm2O0VLKEku=zyFfabExSzOKErA@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 11 Aug 2020 11:45:52 -0700
Message-ID: <CAOnJCUJiLVyzMFkn157Zmdrtm66Z=gWmQbXCJiMRY8LCJ3xkaw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Setup exception vector for K210 properly
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200811_144606_813367_55F3DA1E 
X-CRM114-Status: GOOD (  28.49  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <damien.lemoal@wdc.com>, Guo Ren <guoren@linux.alibaba.com>,
 Vincent Chen <vincent.chen@sifive.com>, Qiu Wenbo <qiuwenbo@phytium.com.cn>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 11, 2020 at 1:41 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Tue, Aug 11, 2020 at 12:07 PM Qiu Wenbo <qiuwenbo@phytium.com.cn> wrote:
> >
> > Exception vector is missing on nommu platform and it is a big issue.
> > This patch is tested in Sipeed MAIX Bit Dev Board.
> >
> > Fixes: 79b1feba5455 ("RISC-V: Setup exception vector early")
> > Signed-off-by: Qiu Wenbo <qiuwenbo@phytium.com.cn>

Thanks for testing it on the kendryte board.

> > ---
> >  arch/riscv/kernel/smpboot.c |  1 +
> >  arch/riscv/kernel/traps.c   | 11 ++++++++++-
> >  2 files changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> > index 356825a57551..23cde0ceb39d 100644
> > --- a/arch/riscv/kernel/smpboot.c
> > +++ b/arch/riscv/kernel/smpboot.c
> > @@ -154,6 +154,7 @@ asmlinkage __visible void smp_callin(void)
> >         mmgrab(mm);
> >         current->active_mm = mm;
> >
> > +       trap_init();
> >         notify_cpu_starting(curr_cpuid);
> >         update_siblings_masks(curr_cpuid);
> >         set_cpu_online(curr_cpuid, 1);
> > diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> > index ad14f4466d92..a390239818ae 100644
> > --- a/arch/riscv/kernel/traps.c
> > +++ b/arch/riscv/kernel/traps.c
> > @@ -174,7 +174,16 @@ int is_valid_bugaddr(unsigned long pc)
> >  }
> >  #endif /* CONFIG_GENERIC_BUG */
> >
> > -/* stvec & scratch is already set from head.S */
> > +/* stvec & scratch is already set from head.S when mmu is enabled */
> >  void trap_init(void)
> >  {
> > +#ifndef CONFIG_MMU
> > +       /*
> > +        * Set sup0 scratch register to 0, indicating to exception vector
> > +        * that we are presently executing in the kernel
> > +        */
> > +       csr_write(CSR_SCRATCH, 0);
> > +       /* Set the exception vector address */
> > +       csr_write(CSR_TVEC, &handle_exception);
> > +#endif
> >  }
> > --
> > 2.28.0
> >
>
> This issue seems to be only on the latest master branch of
> Linux stable tree so this fix need not be a stable fix.
>
> For MMU kernel, the CSR_TVEC is setup in relocate() function
> called from secondary_start_common() function of head.S
>
> For NoMMU kernel, we should set CSR_TVEC directly in
> secondary_start_common() function as "#else" case of the
> "#ifdef CONFIG_MMU".
>

That would enable the trap only for secondary harts. But the exception
vector on boot hart
is still uninitialized. How about this change ?

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index d0c5c316e9bb..7822054dbd88 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -77,16 +77,6 @@ relocate:
        csrw CSR_SATP, a0
 .align 2
 1:
-       /* Set trap vector to exception handler */
-       la a0, handle_exception
-       csrw CSR_TVEC, a0
-
-       /*
-        * Set sup0 scratch register to 0, indicating to exception vector that
-        * we are presently executing in kernel.
-        */
-       csrw CSR_SCRATCH, zero
-
        /* Reload the global pointer */
 .option push
 .option norelax
@@ -144,9 +134,23 @@ secondary_start_common:
        la a0, swapper_pg_dir
        call relocate
 #endif
+       call setup_trap_vector
        tail smp_callin
 #endif /* CONFIG_SMP */

+.align 2
+setup_trap_vector:
+       /* Set trap vector to exception handler */
+       la a0, handle_exception
+       csrw CSR_TVEC, a0
+
+       /*
+        * Set sup0 scratch register to 0, indicating to exception vector that
+        * we are presently executing in kernel.
+        */
+       csrw CSR_SCRATCH, zero
+       ret
+
 .Lsecondary_park:
        /* We lack SMP support or have too many harts, so park this hart */
        wfi
@@ -240,6 +244,7 @@ clear_bss_done:
        call relocate
 #endif /* CONFIG_MMU */

+       call setup_trap_vector
        /* Restore C environment */
        la tp, init_task
        sw zero, TASK_TI_CPU(tp)


> Regards,
> Anup
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
