Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5CFC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 02:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vUagh9brtCbdj+b4rIYAr3NzRlrFdAGZMM90UJu4XJI=; b=kvpyit/g7EfUJf
	2R4ajNUU1i4TeFhcpgruRrzghWJ6QvXrHBS9OJ/ljVtEzrcvvb4IlER0+RnlRBn3LF0XbbhaGg5WF
	51rYjLt+R2aKYUNPCnnKUA/2sI+qajQqeJJc+aGil3Ra7gOfNJbAqCebEIJXOzSEeBUIm0skj7C/e
	06NBl90un147nVvye7ik0RzvStp+3neGt5d0LqTS769yowHFEmPIo8HI62Cs0VfMPHr8OHQ3zyya+
	rEe9sHD8Bk46RlyCg3FWngWV/HcSh+27yl2Mjzs92f26jPWwwB5IWbnw0V9GWx4dZbUzMMmttWwah
	jkkesjzq1TDDEXuty3SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okzEu-00E2ef-Ib; Wed, 19 Oct 2022 02:55:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okzEr-00E2am-UE
	for linux-riscv@lists.infradead.org; Wed, 19 Oct 2022 02:55:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 78100B821EF
	for <linux-riscv@lists.infradead.org>; Wed, 19 Oct 2022 02:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1E2C4347C
	for <linux-riscv@lists.infradead.org>; Wed, 19 Oct 2022 02:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666148123;
	bh=5kYqembv+YpjeHp7+ryb4q5hAFpoO+zim4SanD/yA2c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lg5nneR05pA7Uyp/6yDHLQ0lv/FvSCJgKB9zgsPhYW97lwtHHW0sCoNOxth3WHcqn
	 LIffbmGZD9n3wYxVIkeFA9JGT376Q0vySQRT+iUihgiq4Sd/Rv4D6uIriY41E3TjAi
	 gNjbHLPrz7jwQLM8hVo6pF3wWrOCQKj+/foh3wo/Qu9OKdeoKMgPr5lhUNZL93Z5b3
	 8TnR1QQZ2PfHpt7GF8jKRqR7bIZdouX2tq6HjcxC+Ag0fNhkEsSACG+yebLs79DZbC
	 /ECaOjoyOL8Ej3mbchEVWDoI7hMajnEn85fSQgnnaechD2ZiopfRde+NBkdD5fcGZA
	 vXEwdW2bcH8Rg==
Received: by mail-ot1-f50.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso8747375otb.6
        for <linux-riscv@lists.infradead.org>; Tue, 18 Oct 2022 19:55:23 -0700 (PDT)
X-Gm-Message-State: ACrzQf2XxsZL1ZhcMUaNvtaxRa83PxfIlIsnOqDWp0lNiD8v2XU99WDm
	Fj+w7/lLIXhERCPYcYbok6ljzxAjxQ8OtJ6APyQ=
X-Google-Smtp-Source: AMsMyM5C2i3Ly90Zfv1TFQiVbzhvl/qqipUlQgQ5lvq37RcRpl/8aSWNrQoateRH2fQeJuj+TJ+GtxnpltGYrkmr3Ko=
X-Received: by 2002:a9d:60dd:0:b0:661:b6ae:aa7a with SMTP id
 b29-20020a9d60dd000000b00661b6aeaa7amr2779172otk.140.1666148122239; Tue, 18
 Oct 2022 19:55:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220928162007.3791-1-jszhang@kernel.org> <20220928162007.3791-5-jszhang@kernel.org>
 <CAJF2gTTADq-JpUtitSr0nw1aDPZrsB6f1jA-04WmOVcrxYeakw@mail.gmail.com> <YzXBZnGXQdEGR1LW@xhacker>
In-Reply-To: <YzXBZnGXQdEGR1LW@xhacker>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 19 Oct 2022 10:55:09 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTonVbTAJGw3qHdfK5vKkHRX64hJB757zsiNgWq4y0Xmw@mail.gmail.com>
Message-ID: <CAJF2gTTonVbTAJGw3qHdfK5vKkHRX64hJB757zsiNgWq4y0Xmw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] riscv: entry: consolidate general regs saving into save_gp
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_195526_284690_6C3D7CFE 
X-CRM114-Status: GOOD (  20.04  )
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

On Fri, Sep 30, 2022 at 12:11 AM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> On Thu, Sep 29, 2022 at 11:59:00AM +0800, Guo Ren wrote:
> > On Thu, Sep 29, 2022 at 12:29 AM Jisheng Zhang <jszhang@kernel.org> wrote:
> > >
> > > Consolidate the saving/restoring GPs(except ra, sp and tp) into
> > > save_gp/restore_gp macro.
> > >
> > > No functional change intended.
> > >
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > ---
> > >  arch/riscv/include/asm/asm.h   | 65 +++++++++++++++++++++++++
> > >  arch/riscv/kernel/entry.S      | 87 ++--------------------------------
> > >  arch/riscv/kernel/mcount-dyn.S | 58 +----------------------
> > >  3 files changed, 70 insertions(+), 140 deletions(-)
> > >
> > > diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
> > > index 1b471ff73178..2f3b49536e9d 100644
> > > --- a/arch/riscv/include/asm/asm.h
> > > +++ b/arch/riscv/include/asm/asm.h
> > > @@ -68,6 +68,7 @@
> > >  #endif
> > >
> > >  #ifdef __ASSEMBLY__
> > > +#include <asm/asm-offsets.h>
> > >
> > >  /* Common assembly source macros */
> > >
> > > @@ -80,6 +81,70 @@
> > >         .endr
> > >  .endm
> > >
> > > +       /* save all GPs except ra, sp and tp */
> > > +       .macro save_gp
> > How about leave x3(gp) out of the macro, and define:
> > .marco save_from_x5_to_x31
> > .marco restore_from_x5_to_x31
>
> Good idea, will do in next version.

Where is the next version?

I want to involve the patch in my generic entry series, it would help
in the coding convention of the entry code.

>
> Thanks



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
