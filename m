Return-Path: <SRS0=gb7b=AR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B23BC433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 01:02:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EECD720739
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 01:02:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ASka0Coe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="l67xp6bG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EECD720739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=51DnTjCc2tKQPOzX5PbRMTXQ3UiTajRc9b8TnL71cD4=; b=ASka0Coe4Si3uCAVz4tMSnT5A
	Ogy1EcVcQa6OZlayS66VD3s5CS4XD6DtHjHUmYK7juNyePyMRcwzxpbfeiyZ1n7Pw594rGZw4u5/5
	af8F/P5afuR92GX/VCSitCWyuTROQOcVloeMDMK2VlNgolctLfXAQYfOKQLInWOMe7qeJFM/cOyAv
	yikDZqu0uT/cAecPBDS3B8mUp0qiMT6n7vOUH8hdYUeIUk3wfh69um7Ty7krpwryNi6zqKc2yUDSa
	Y+AnorrUiedz98M0CNz88mBivCYzeMFY6d3WoXdvpbjkQ3bp4gQnN2cQUqRcdmc3dTticgpry4yAs
	2dZXNKeDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsFWK-00009d-Ht; Mon, 06 Jul 2020 01:02:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsFWH-00009C-Kw
 for linux-riscv@lists.infradead.org; Mon, 06 Jul 2020 01:02:07 +0000
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5645B2074F
 for <linux-riscv@lists.infradead.org>; Mon,  6 Jul 2020 01:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593997324;
 bh=LqebZajuTrNEjjHajHRCQ35Qvk4gUVQQV87PbV+cOq8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=l67xp6bG2B1/sbk9ZohvkhFRyzXgrp3JP4RMnU1zKLntY3FskhU2EC0ds2CZldwZC
 4bAyxkpDl8P7MwhRBGTq32TCQDTkp32+Oft3JKQVSBXUABzt8XU+VGyfblfJS+vNuj
 3VBKolV7RHPE58mqIZxXEQWYq+V79u8Yl9j/kH4g=
Received: by mail-lj1-f169.google.com with SMTP id d17so28667807ljl.3
 for <linux-riscv@lists.infradead.org>; Sun, 05 Jul 2020 18:02:04 -0700 (PDT)
X-Gm-Message-State: AOAM532b1++SVJL2PU8jpoJx/X/4/2BN3BUshJYiqAOsUaWdLaQVQBQ5
 ODFEYoSyHMR5khO0Vjw5/wdQ+G34WZebmGx6ywY=
X-Google-Smtp-Source: ABdhPJzNCD8oHwSnnsDE6x/2dqhk9LSDUKVA5+59CBGYitqD8IoGxpOVly7D+jGJQOvbzn+FnIezm2PT5HdT0hn9JlU=
X-Received: by 2002:a2e:864e:: with SMTP id i14mr23462994ljj.441.1593997322637; 
 Sun, 05 Jul 2020 18:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <1593958397-62466-1-git-send-email-guoren@kernel.org>
 <202007051336.C9EA0ECF65@keescook>
In-Reply-To: <202007051336.C9EA0ECF65@keescook>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 6 Jul 2020 09:01:51 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR5Fc1wpjr1ZYZikS=hCP9rbjJVsH9b-z2nBxbBcfBoCA@mail.gmail.com>
Message-ID: <CAJF2gTR5Fc1wpjr1ZYZikS=hCP9rbjJVsH9b-z2nBxbBcfBoCA@mail.gmail.com>
Subject: Re: [RFC PATCH] riscv: enable per-task stack canaries
To: Kees Cook <keescook@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_210205_841266_FA181A38 
X-CRM114-Status: GOOD (  27.74  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 6, 2020 at 4:40 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Sun, Jul 05, 2020 at 02:13:17PM +0000, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > After compare arm64 and x86 implementations, seems arm64's is more
> > flexible and readable. The key point is how gcc get the offset of
> > stack_canary from gs/el0_sp.
> >
> > x86: Use a fix offset from gs, not flexible.
> >
> > struct fixed_percpu_data {
> >         /*
> >          * GCC hardcodes the stack canary as %gs:40.  Since the
> >          * irq_stack is the object at %gs:0, we reserve the bottom
> >          * 48 bytes of the irq stack for the canary.
> >          */
> >         char            gs_base[40]; // :(
> >         unsigned long   stack_canary;
> > };
>
> Yes, x86's compiler's implementation of "thread local" stack canary
> isn't great for the kernel.
>
> > arm64: Use -mstack-protector-guard-offset & guard-reg
> >
> > ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)
> > prepare: stack_protector_prepare
> > stack_protector_prepare: prepare0
> >        $(eval KBUILD_CFLAGS += -mstack-protector-guard=sysreg            \
> >                                -mstack-protector-guard-reg=sp_el0        \
> >                                -mstack-protector-guard-offset=$(shell    \
> >                        awk '{if ($$2 == "TSK_STACK_CANARY") print $$3;}' \
> >                                        include/generated/asm-offsets.h))
> > endif
> >
> > I prefer arm64, but x86 percpu_data design needs to be considered ?
>
> I don't know riscv internals, so I leave that to y'all! :)
>
> > After the discussion, let's continue the work for riscv gcc
> > stack-protector.
>
> I think you'll need some buy-in from GCC before this kernel patch can
> land.
exactly!

>
> > Here is arm64 gcc's work [1].
> >
> > [1] https://github.com/gcc-mirror/gcc/commit/cd0b2d361df82c848dc7e1c3078651bb0624c3c6
>
> Can this kind of thing be made general-purposes, instead of having to
> reimplement it each time there's a new arch wanting to do it?
Great idea. Now only x86 arm64 support, It's the right time point.

>
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Kees Cook <keescook@chromium.org>
> > ---
> >  arch/riscv/Kconfig                      |  7 +++++++
> >  arch/riscv/Makefile                     | 10 ++++++++++
> >  arch/riscv/include/asm/stackprotector.h |  3 ++-
> >  arch/riscv/kernel/asm-offsets.c         |  3 +++
> >  arch/riscv/kernel/process.c             |  2 +-
> >  5 files changed, 23 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 4b0e308..4b4e833 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -394,6 +394,13 @@ config CMDLINE_FORCE
> >
> >  endchoice
> >
> > +config CC_HAVE_STACKPROTECTOR_SYSREG
Should change to CC_HAVE_STACKPROTECTOR_GPR

> > +     def_bool $(cc-option,-mstack-protector-guard=gpr -mstack-protector-guard-reg=tp -mstack-protector-guard-offset=0)
>
> And, as I'm sure you realize, it's not supported by the riscv backend
> yet:
>
> riscv64-unknown-linux-gnu-gcc: error: unrecognized command line option '-mstack-protector-guard=gpr'; did you mean '-fstack-protector-strong'?
> riscv64-unknown-linux-gnu-gcc: error: unrecognized command line option '-mstack-protector-guard-reg=tp'; did you mean '-fstack-protector-strong'?
> riscv64-unknown-linux-gnu-gcc: error: unrecognized command line option '-mstack-protector-guard-offset=0'; did you mean '-fstack-protector-strong'?

Yeah! :) I just want to show you, how about the format: use tp in gpr
to do that. The format is similar to arm64.

tp is the task_struct point in riscv.

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
