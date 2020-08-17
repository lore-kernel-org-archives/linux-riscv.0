Return-Path: <SRS0=YzW2=B3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E17C433E1
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2020 12:47:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17D0E2072E
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2020 12:47:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n5lYqCCl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WLGovId1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17D0E2072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZVLza2XUOYvnP3Ra0A4G1IORTEvBw0bZwfZlDqW69d8=; b=n5lYqCClCJVa3nc68/+pulQJZ
	RPDBl8E7s8ErKfsIYGqHNW1VGMtaWXrQT8H5ueasoN/9f5v+YFbc/0ZejItwkUrW8dvde8b2T+GjN
	2sYU+AHPjbW4kg9D4Hqrc+DoM+aWuibbBIRSviHdeaVcP5hnSb+kW9pXRDjSgQ+cvu+W8fpT/+yHm
	Vxs4YvJvs3HbSuK0W0w6Epi3vw9wKU1BRoaf7oglp/A4WSOJHuaTwWwYZ3W3pM81CZJRxq9wVGBVi
	8mSjfPxvvglpydlR+kTD2pWN15zuKi19ianqbIkV/pBqbqblvCbxumIN7smS6ZzanQ8h/s/el1shS
	VHP2FdzJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7eY7-0008Bj-K6; Mon, 17 Aug 2020 12:47:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7eY5-0008BI-P8
 for linux-riscv@lists.infradead.org; Mon, 17 Aug 2020 12:47:38 +0000
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FA07207FF
 for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2020 12:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597668456;
 bh=F6AeSzf4yODe5VfS/mOvvXXrmYEDiPf8ncHRYGsJH9o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WLGovId1pF0RtoS/pxVhAbmTDQxL+wlb/YPyjGm4gwU7EG0HpRde71z58372pAGUI
 Mk7gmvMtdYHyCuhuPVYr4Pyx7oBmnbh5hBitrBnQEaY0aHR0Q7DRVQHu/ZXD3RYk4h
 ZjAMCDf1SsweOIV20FDlQU218t5SISXQewIF1Xjo=
Received: by mail-lj1-f175.google.com with SMTP id m22so17294082ljj.5
 for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2020 05:47:35 -0700 (PDT)
X-Gm-Message-State: AOAM532amJQiHJXXKTgZdwL5OsWrI5LVUKPB0n7yMvXE8lBLxPdIAUcI
 GroV9fz+M1L54rFhJAQaYHzAN7inXYzXZUZImVs=
X-Google-Smtp-Source: ABdhPJw1v8JVnt2oJ6bSCPU4EmN7bm2mGdNOp7Vx6uxxuEJFPNSCeEfTKhQjsXzu5H3BmOMqhHgKjHmNPG6tmd7ZCYE=
X-Received: by 2002:a2e:9bc1:: with SMTP id w1mr6581503ljj.79.1597668454259;
 Mon, 17 Aug 2020 05:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <1594683562-68149-4-git-send-email-guoren@kernel.org>
 <mhng-296dd63e-71de-4d30-acfb-df374d12388d@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-296dd63e-71de-4d30-acfb-df374d12388d@palmerdabbelt-glaptop1>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 17 Aug 2020 20:47:21 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTz_EFpzMoT3yBgCNTNme9_QbQ9b2dGZB3S0F5+O6Fpyw@mail.gmail.com>
Message-ID: <CAJF2gTTz_EFpzMoT3yBgCNTNme9_QbQ9b2dGZB3S0F5+O6Fpyw@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] riscv: Fixup kprobes handler couldn't change pc
To: Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_084737_939524_17F1B0AA 
X-CRM114-Status: GOOD (  25.65  )
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
Cc: =?UTF-8?Q?Patrick_St=C3=A4hlin?= <me@packi.ch>,
 Guo Ren <guoren@linux.alibaba.com>, Anup Patel <anup@brainfault.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Bjorn Topel <bjorn.topel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Aug 15, 2020 at 6:36 AM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> On Mon, 13 Jul 2020 16:39:18 PDT (-0700), guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > The "Changing Execution Path" section in the Documentation/kprobes.txt
> > said:
> >
> > Since kprobes can probe into a running kernel code, it can change the
> > register set, including instruction pointer.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Masami Hiramatsu <mhiramat@kernel.org>
> > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> > ---
> >  arch/riscv/kernel/mcount-dyn.S | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
> > index 35a6ed7..4b58b54 100644
> > --- a/arch/riscv/kernel/mcount-dyn.S
> > +++ b/arch/riscv/kernel/mcount-dyn.S
> > @@ -123,6 +123,7 @@ ENDPROC(ftrace_caller)
> >       sd      ra, (PT_SIZE_ON_STACK+8)(sp)
> >       addi    s0, sp, (PT_SIZE_ON_STACK+16)
> >
> > +     sd ra,  PT_EPC(sp)
> >       sd x1,  PT_RA(sp)
> >       sd x2,  PT_SP(sp)
> >       sd x3,  PT_GP(sp)
>
> So that's definately not going to be EPC any more.  I'm not sure that field is
> sanely named, though, as it's really just the PC when it comes to other ptrace
> stuff.
>
> > @@ -157,6 +158,7 @@ ENDPROC(ftrace_caller)
> >       .endm
> >
> >       .macro RESTORE_ALL
> > +     ld ra,  PT_EPC(sp)
> >       ld x1,  PT_RA(sp)
>
> x1 is ra, so loading it twice doesn't seem reasonable.
>
> >       ld x2,  PT_SP(sp)
> >       ld x3,  PT_GP(sp)
> > @@ -190,7 +192,6 @@ ENDPROC(ftrace_caller)
> >       ld x31, PT_T6(sp)
> >
> >       ld      s0, (PT_SIZE_ON_STACK)(sp)
> > -     ld      ra, (PT_SIZE_ON_STACK+8)(sp)
> >       addi    sp, sp, (PT_SIZE_ON_STACK+16)
> >       .endm
>
> If you're dropping the load you should drop the store above as well.  In
> general this seems kind of mixed up, both before and after this patch.

This is a wrong patch, it should be:

diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index 35a6ed7..d82b8f0 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -120,10 +120,10 @@ ENDPROC(ftrace_caller)
        .macro SAVE_ALL
        addi    sp, sp, -(PT_SIZE_ON_STACK+16)
        sd      s0, (PT_SIZE_ON_STACK)(sp)
-       sd      ra, (PT_SIZE_ON_STACK+8)(sp)
        addi    s0, sp, (PT_SIZE_ON_STACK+16)

-       sd x1,  PT_RA(sp)
+       sd ra,  PT_EPC(sp)
+       sd ra,  PT_RA(sp)
        sd x2,  PT_SP(sp)
        sd x3,  PT_GP(sp)
        sd x4,  PT_TP(sp)
@@ -157,7 +157,7 @@ ENDPROC(ftrace_caller)
        .endm

        .macro RESTORE_ALL
-       ld x1,  PT_RA(sp)
+       ld ra,  PT_EPC(sp)
        ld x2,  PT_SP(sp)
        ld x3,  PT_GP(sp)
        ld x4,  PT_TP(sp)
@@ -190,7 +190,6 @@ ENDPROC(ftrace_caller)
        ld x31, PT_T6(sp)

        ld      s0, (PT_SIZE_ON_STACK)(sp)
-       ld      ra, (PT_SIZE_ON_STACK+8)(sp)
        addi    sp, sp, (PT_SIZE_ON_STACK+16)
        .endm

Now, I'm developing livepatch and they are so mixed features (kprobe,
livepatch, ftrace, optprobes, STACK_WALK, -fpatchable-function-entry
'no -pg'). I'll test this patch in the next version of the patchset.

Thx for the review.

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
