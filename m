Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DF4C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Mar 2022 01:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eeby61Ggf95PLwvqji32h8gPVmnCxrcIEMt7kDkV/C4=; b=kFPzACKqlIBjPW
	2fpOj6jRmynrADE0qZ2GiDC9hbYcO/J0Xe/j41JCghaH8HYpNwXVNeVI3pohLnMYPhljCL1/NFWaK
	vYQ94XWM5MbBeYJ7HP2yGwUm/Aog35jWhuzLJTeb/SmtBD1UoPiJ1hzzfRRvyqKymu8K2PjXqnQyh
	AM3/pdguh66t7Jkp/bLwsg4O17Z+Y8qT1WtC5dtsd6bv4Q4+fjHSRv9ErChh7xcZfOfjtyPjHMwkg
	bqAlyVWgUrauBFEPrIWSdajr4NJ8hciK5jp9PoNd0KwAkuxWkRqYLMXOPrTCJMdQoUXX/DihfOfjI
	nIVMWJMG+UIALMVmaGdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTClH-0025LV-T1; Sun, 13 Mar 2022 01:11:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTCl5-0025Jj-Tg; Sun, 13 Mar 2022 01:10:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 37A3E60B93;
 Sun, 13 Mar 2022 01:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E363C340EC;
 Sun, 13 Mar 2022 01:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647133854;
 bh=WDhHtMMzDFG5VodBhA9/54gjgFe39ayzZKWGkP/LDK8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EFca1hvnGz3TxyEY897vI/6ZNFT6rs20DC1fNngBrgeE9lUgBNlvvn4OzAllO62Dy
 AnoIQfGYtdHGjdZLZOiiS/+2KjusgXbkzKRbGW2/U9IIWsQW8UneYi3oVSlj6c/mCM
 weMaLrcVrEW03gGp+ILrQpWOZZAugfeJLhfy4fGs2lXdKhbZufgRLrRTwMmv3FyTti
 nctgTdqhBMeRYPIZHW9RHlAupLYncbE9S+wQgQATScA8yjFGUm3K+nHP+ToofV2ZXL
 8l3v4vBtdcjq8QV6zjQTHPHU8s5EPGuVlnCULUKWKRNQ64nD6KlN2FP6Z3f/c0AXuu
 Akl3zOOApbbXA==
Received: by mail-ua1-f44.google.com with SMTP id w23so1957869uap.1;
 Sat, 12 Mar 2022 17:10:54 -0800 (PST)
X-Gm-Message-State: AOAM5324wHRMdClk/aNIxqMtruDkbb/2fo3aAa0HtTQRs3D1EA1RxxDL
 5u1fA6TFLy/CH71T4n2Mw+tRRH3Sxgf00dppA8U=
X-Google-Smtp-Source: ABdhPJys7kYGC3JWwTiegWtxjWDYschAlzeMkP/1Qn2R1I/FiDN2MiyTMnZMxrgL9A71vc/Di9nW7mjcrZHA6J0wskU=
X-Received: by 2002:ab0:26d9:0:b0:34c:609d:c23 with SMTP id
 b25-20020ab026d9000000b0034c609d0c23mr3534202uap.84.1647133853508; Sat, 12
 Mar 2022 17:10:53 -0800 (PST)
MIME-Version: 1.0
References: <20220312155603.1752193-1-guoren@kernel.org>
 <CAMo8Bf+p1-DqeqHV45GcZEsp+BEd+iMfeHP+i0P+KO7nv8W7Ow@mail.gmail.com>
In-Reply-To: <CAMo8Bf+p1-DqeqHV45GcZEsp+BEd+iMfeHP+i0P+KO7nv8W7Ow@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 13 Mar 2022 09:10:42 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRrDMhL0YyZ=BYJ17sRp0oU610N+Wn+WtAgBASC_TPrOg@mail.gmail.com>
Message-ID: <CAJF2gTRrDMhL0YyZ=BYJ17sRp0oU610N+Wn+WtAgBASC_TPrOg@mail.gmail.com>
Subject: Re: [RFC PATCH] arch: patch_text: Fixup last cpu should be master
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 LKML <linux-kernel@vger.kernel.org>, linux-csky@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Chris Zankel <chris@zankel.net>, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220312_171056_057228_828ED0F2 
X-CRM114-Status: GOOD (  23.57  )
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

On Sun, Mar 13, 2022 at 7:50 AM Max Filippov <jcmvbkbc@gmail.com> wrote:
>
> Hi Guo Ren,
>
> On Sat, Mar 12, 2022 at 7:56 AM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > These patch_text implementations are using stop_machine_cpuslocked
> > infrastructure with atomic cpu_count. The origin idea is that when
>
> The original
>
> > the master CPU patch_text, others should wait for it. But current
> > implementation is using the first CPU as master, which couldn't
> > guarantee continue CPUs are waiting. This patch changes the last
>
> guarantee that remaining CPUs are waiting.
>
> > CPU as the master to solve the potaintial risk.
>
> potential
>
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: Peter Zijlstra <peterz@infradead.org
> > Cc: Masami Hiramatsu <mhiramat@kernel.org>
> > Cc: Chris Zankel <chris@zankel.net>
> > Cc: Max Filippov <jcmvbkbc@gmail.com>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  arch/arm64/kernel/patching.c      | 4 ++--
> >  arch/csky/kernel/probes/kprobes.c | 2 +-
> >  arch/riscv/kernel/patch.c         | 2 +-
> >  arch/xtensa/kernel/jump_label.c   | 2 +-
> >  4 files changed, 5 insertions(+), 5 deletions(-)
>
> Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
>
> I'm curious, is there a specific issue that prompted this patch?
No, theoretical risk.

>
> --
> Thanks.
> -- Max



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
