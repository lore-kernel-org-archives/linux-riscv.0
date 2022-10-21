Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E06AC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Oct 2022 00:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b+7UacduaIBqJAMntxrvlQ/pupqgJRXjHxjUNeKlJDA=; b=VyDDqkN0v8K/KU
	04h5SNfv3Y9TVu67/7Bm5nVKGw3MaQaLAMkiZzPSPTYHuosvvwrPbk1O8M9W4gVZwtOB9zdY85oZ0
	trRjr2oflAadJyohxEPRxXm17JujXCoUl8yFCRatd9000U0/ASb/ukqQER6VmsUYq0vCqBQmDJeoy
	IefY8i9K55owsqv1cxNo8q9TSNMp7mdHGUEryPz+PyYzN04ahaDy0VMhiI9+RYqDVLh8kE53SG/Lq
	dN6Uew4eTfA2EKuL8x5nL7a604ycxCge8mPJkeygN2b6A2pXc+zE0UstJ1NhpS+RqO1Fgzai6vsdR
	ipaDXoRaUqiv7KbjsuHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olg0z-003533-1a; Fri, 21 Oct 2022 00:35:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olg0v-00352F-Qr
	for linux-riscv@lists.infradead.org; Fri, 21 Oct 2022 00:35:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1085F61C1A
	for <linux-riscv@lists.infradead.org>; Fri, 21 Oct 2022 00:35:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72DC1C433D7
	for <linux-riscv@lists.infradead.org>; Fri, 21 Oct 2022 00:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666312552;
	bh=ebitv/o5a3t2vCAKwhBaDXqxzD0jZBqetTbv566wUVk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YcRHuMRftYy8Glj3XCW+I+nrnBuBC63V8zTtPY69YECK5cMpDmSz8PpaSbppNGAnH
	 d6r3fVonDsL9zIZ533WW7iPsjeUq+gjgmXikx97XMT19fBzrpanTZFqxoID7MOLVK/
	 PTvH448HQVycptTwP0OkM8nE9oIQfDVZdPZS5LBe7xkf5Dc9u9V3pOPCvacEvsZ2LU
	 jCYy2b/yN9Hw2plUQKUFHYduzEydNnO/AvBaeskou5xXeV1eE2kjpHIADgGig34ysc
	 GL8iboDA4oPapAc8xQMCamcEMMhYQY+1gnBAL/eady9s54Al4iLZWpBQ02YpZxD2D8
	 cd/evoR5SVMFg==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1321a1e94b3so1694029fac.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Oct 2022 17:35:52 -0700 (PDT)
X-Gm-Message-State: ACrzQf0veR00Z1ZA4Ega6oglFJRTIXe3bXiNGLA5wtTticPNZ5GXseGO
	5LWjE2IMDQriwjOvqMH8C+PtIKBNALXsXutcX34=
X-Google-Smtp-Source: AMsMyM483SkhaxijeF6r4LxLvwyIKbEq8gBp3QOrTCWYxzdlRCXzMtRRLH1LvqBfhZHASUiwUujSnBYnGQq9tiW7nTc=
X-Received: by 2002:a05:6871:b0d:b0:13b:b91:dc94 with SMTP id
 fq13-20020a0568710b0d00b0013b0b91dc94mr2542683oab.112.1666312551610; Thu, 20
 Oct 2022 17:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221019154727.2395-1-jszhang@kernel.org> <CAJF2gTSHH69B+KAOJdpLvQdGuhS1nJ+GnW2hVCb+e+8nrnaJ7Q@mail.gmail.com>
 <Y1FdW8P9pw466hjV@xhacker>
In-Reply-To: <Y1FdW8P9pw466hjV@xhacker>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 21 Oct 2022 08:35:39 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTBYR-6xGo_SrORrjJw9rYQXLukHwBFCNq_kwNLrd_1VA@mail.gmail.com>
Message-ID: <CAJF2gTTBYR-6xGo_SrORrjJw9rYQXLukHwBFCNq_kwNLrd_1VA@mail.gmail.com>
Subject: Re: [PATCH] riscv: fix race when vmap stack overflow
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_173553_989906_D5BA3CC9 
X-CRM114-Status: GOOD (  25.20  )
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

On Thu, Oct 20, 2022 at 10:47 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> On Thu, Oct 20, 2022 at 10:16:47AM +0800, Guo Ren wrote:
> > On Wed, Oct 19, 2022 at 11:57 PM Jisheng Zhang <jszhang@kernel.org> wrote:
> > >
> > > Currently, when detecting vmap stack overflow, riscv firstly switches
> > > to the so called shadow stack, then use this shadow stack to call the
> > > get_overflow_stack() to get the overflow stack. However, there's
> > > a race here if two or more harts use the same shadow stack at the same
> > > time.
> > >
> > > To solve this race, we introduce spin_shadow_stack atomic var, which
> > > will make the shadow stack usage serialized.
> > >
> > > Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > Suggested-by: Guo Ren <guoren@kernel.org>
> > > ---
> > >  arch/riscv/kernel/entry.S | 4 ++++
> > >  arch/riscv/kernel/traps.c | 4 ++++
> > >  2 files changed, 8 insertions(+)
> > >
> > > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > > index b9eda3fcbd6d..7b924b16792b 100644
> > > --- a/arch/riscv/kernel/entry.S
> > > +++ b/arch/riscv/kernel/entry.S
> > > @@ -404,6 +404,10 @@ handle_syscall_trace_exit:
> > >
> > >  #ifdef CONFIG_VMAP_STACK
> > >  handle_kernel_stack_overflow:
> > > +1:     la sp, spin_shadow_stack
> > > +       amoswap.w sp, sp, (sp)
> > If CONFIG_64BIT=y, it would be broken. Because we only hold 32bit of
> > the sp, and the next loop would get the wrong sp value of
> > &spin_shadow_stack.
>
> Hi Guo,
>
> Don't worry about it. the spin_shadow_stack is just a flag used for
> "spin", if hart is allowed to used the shadow_stack, we load its
> address in next instruction by "la sp, shadow_stack".
Haha, yes, my brain is at fault :)

> But I agree with use unsigned int instead of atomic_t, and use
> smp_store_release directly. V2 has been sent out, could you please
> review it?
Okay

>
> Thanks



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
