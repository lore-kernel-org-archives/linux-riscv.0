Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A325BECAAD5
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Sep 2022 09:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uTPpPdA3LLV0qRQ4WPMVhSut5IksIdUAZALGn2kklB8=; b=alCjCFNxLJrQ88
	x/LE+IOF+xaTzp8UH7jjEIsxbQOCvrkl7fg+KWdqh/CKDVmP/MswEtkJgCBw57fev1zgU+Iy7BiBB
	wzJs6cxLqHZlBfJLRi+Qpn+6tEef1s91iKSXZWUELsUqYPXkMDzg7+y9Tcy8LrgDct9nTX75KjWLE
	4tIpDBxKjaOeZ8aFRyEWjoVH9pVlUr4ILef0to/O4jysx3D2c6lPsFC2E0ZB6H7HLzA3zylYje4fH
	kecf1F1iTMwv5x/k3Goe0tK3ez7jCHtvENhGpIp1dEUY52UIEkGo6yeyygI0FW7Wgr24yii7LcU5V
	9e4tvGu1sMMwoswRL1bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWwcn-008v16-7a; Sat, 10 Sep 2022 09:18:05 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWwck-008und-89
	for linux-riscv@lists.infradead.org; Sat, 10 Sep 2022 09:18:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BEFC5B80A1F
	for <linux-riscv@lists.infradead.org>; Sat, 10 Sep 2022 09:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D76EEC43143
	for <linux-riscv@lists.infradead.org>; Sat, 10 Sep 2022 09:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662801477;
	bh=HGThmz2kdpZLbH5ZdT+4zlH5sl6WAOA/3pwhDNqZIbA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ozWZb6GQiY1vLoJe1eKpBWgTd/AgT6zvE6fI8OGF2yvsYW+NjYymXm/tjmaIJblQ/
	 jkvksJLG0GhPd1mFGoxS30+LIPVhLV6cFr7DcWK8m8EZe4bW/Nqdw9oHUctE0FGGtd
	 InuGNbtXlbng6w4bhZ6k+jCmjNJAL+zEANRg7y+qjJSWfg2qy1igPF8u/qtUuq7moL
	 Xl0wzlYiIh0ASvUO/xeVWrFU+YTFJPbtefSdBxIwxhxeCrK36c1wexrHy4mC5zusWx
	 sJrY6cqOd6GvZM4CtupBUhlPY+pGmxhJ5ojxynMumnmvD6zWeYsACHmyRMnhi3ZGD9
	 lK3BAlOvtcE7A==
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1274ec87ad5so10240518fac.0
        for <linux-riscv@lists.infradead.org>; Sat, 10 Sep 2022 02:17:57 -0700 (PDT)
X-Gm-Message-State: ACgBeo2LiChKvdfnlbTKnJyYfC0pmRpq01locqL0LvCTOLz1ojsl96rr
	2aZ6E2o44f+rLppBDsYDTO2+4/w9Qpp+0fHQ/iY=
X-Google-Smtp-Source: AA6agR5ljS5jux9vYvs3d5lajECfg2pY1US7JHgjNigOsBR2XljS39jtvb510F8+GsznBLG/AVBR45wNgnWOxIuJZeU=
X-Received: by 2002:a05:6870:a78e:b0:12b:542b:e5b2 with SMTP id
 x14-20020a056870a78e00b0012b542be5b2mr135196oao.112.1662801476887; Sat, 10
 Sep 2022 02:17:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220908022506.1275799-1-guoren@kernel.org> <20220908022506.1275799-5-guoren@kernel.org>
 <Yxmaz7wJPEBQ7Vki@hirez.programming.kicks-ass.net>
In-Reply-To: <Yxmaz7wJPEBQ7Vki@hirez.programming.kicks-ass.net>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 10 Sep 2022 17:17:44 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSs4Ycu52DH6NUzdMXQGMT51XU6x-fgQ-_OpRne+vkTqQ@mail.gmail.com>
Message-ID: <CAJF2gTSs4Ycu52DH6NUzdMXQGMT51XU6x-fgQ-_OpRne+vkTqQ@mail.gmail.com>
Subject: Re: [PATCH V4 4/8] riscv: traps: Add noinstr to prevent
 instrumentation inserted
To: Peter Zijlstra <peterz@infradead.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, luto@kernel.org, 
	conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org, 
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org, 
	apatel@ventanamicro.com, atishp@atishpatra.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, bigeasy@linutronix.de, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220910_021802_619228_8E3EADAF 
X-CRM114-Status: GOOD (  19.78  )
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

On Thu, Sep 8, 2022 at 3:34 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, Sep 07, 2022 at 10:25:02PM -0400, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Without noinstr the compiler is free to insert instrumentation (think
> > all the k*SAN, KCov, GCov, ftrace etc..) which can call code we're not
> > yet ready to run this early in the entry path, for instance it could
> > rely on RCU which isn't on yet, or expect lockdep state. (by peterz)
> >
> > Link: https://lore.kernel.org/linux-riscv/YxcQ6NoPf3AH0EXe@hirez.programming.kicks-ass.net/raw
> > Suggested-by: Peter Zijlstra <peterz@infradead.org>
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > ---
> >  arch/riscv/kernel/traps.c | 8 ++++----
> >  arch/riscv/mm/fault.c     | 2 +-
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> > index 635e6ec26938..3ed3dbec250d 100644
> > --- a/arch/riscv/kernel/traps.c
> > +++ b/arch/riscv/kernel/traps.c
> > @@ -97,7 +97,7 @@ static void do_trap_error(struct pt_regs *regs, int signo, int code,
> >  #define __trap_section
> >  #endif
> >  #define DO_ERROR_INFO(name, signo, code, str)                                \
> > -asmlinkage __visible __trap_section void name(struct pt_regs *regs)  \
> > +asmlinkage __visible __trap_section void noinstr name(struct pt_regs *regs)  \
>
> But now you have __trap_section and noinstr both adding a section
> attribute.

Oops, thx for correcting. Here is my solution.

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 635e6ec26938..eba744caa711 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -92,9 +92,11 @@ static void do_trap_error(struct pt_regs *regs, int
signo, int code,
 }

 #if defined(CONFIG_XIP_KERNEL) && defined(CONFIG_RISCV_ALTERNATIVE)
-#define __trap_section         __section(".xip.traps")
+#define __trap_section                                                 \
+       noinline notrace __attribute((__section__(".xip.traps")))       \
+       __no_kcsan __no_sanitize_address __no_profile __no_sanitize_coverage
 #else
-#define __trap_section
+#define __trap_section noinstr
 #endif


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
