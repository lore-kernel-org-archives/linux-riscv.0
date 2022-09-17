Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE10C54EE9
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Sep 2022 10:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0EKSbR14x2SnHP45EszrvHn58PQ34+0U4TgjCdiGMNA=; b=KSTvkqNUPGe2IQ
	huVJuLgZ99BhYdHEn2ttZZURuC3zqrMondpWTC+RRtAAK2qDhv4Yq1x0LTL+AIMD5Ug99wRwqxe3h
	5KWw7+taeGLFs0wyuIk/ID1byI/qBwcpZLPqJQHg2dJGeKvJxCW/a6b3kTzmin6VuVEjuuTYTBIhC
	7j2STo+cW0PmRJ9JZrtvtmzuJQrUhMpJ+SpnL1lzOoYKWXHHJYqw895jJXsrPacLmgzdf3vBIR0uZ
	fVLf2Y85Rgwm417OzByXmtNZO141JqZ+d20sVTdBV39ozDMYGSLDv7EuOUo6YnIUti7t/8QvvVXHY
	jEoKlYJkE5NXlTwwO7zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZVUo-005JOp-Bg; Sat, 17 Sep 2022 10:56:26 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZVUk-005JMK-Vm
	for linux-riscv@lists.infradead.org; Sat, 17 Sep 2022 10:56:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 08BC1CE0B21
	for <linux-riscv@lists.infradead.org>; Sat, 17 Sep 2022 10:56:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BCBDC433D6
	for <linux-riscv@lists.infradead.org>; Sat, 17 Sep 2022 10:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663412175;
	bh=imPkTwUr/BJknZB2Of6dkP+YETKo59vkUK5b7mZx40Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GPnajZa3X911IWCzcYDWL54oXUK9TAIaaA6YWhzvsfXLtgP9/xklrxl+/XARqEKOp
	 tbHOnvSH6UlqocOlIrGikdqvy4alaHZnSu6K+r9s/OOeMu3LBtix2Ld29n1WFu0B/g
	 jJILG8VBJt6nNn9k5yyfLNHIXlMPLjWEnIU6PwSe4Yixd2X36mvk6kUQye+WkgmOTc
	 Jw67DvbeIbZPbK/TYsJRiLt/USTsgvU1s1XLRbtQ6PvAWDlE4W9qq8Cnu1bDsZcdbO
	 0hKErahlGmUN/DkiAKcwEfIeezfO4DLvYcdGJBQFd/u6s8UQUJo+pGD+fRxDJctTYL
	 e0uD03MFa7tGA==
Received: by mail-ot1-f51.google.com with SMTP id r22-20020a9d7516000000b00659ef017e34so1032006otk.13
        for <linux-riscv@lists.infradead.org>; Sat, 17 Sep 2022 03:56:15 -0700 (PDT)
X-Gm-Message-State: ACrzQf0clbokbutrCXDY/kvmVikds57hHzHe5nWbThO+6rzvW/1zqzCb
	RqCIxkFI4YOCsPYuOJuqHkfJmu/epI1D7JU8R5c=
X-Google-Smtp-Source: AMsMyM4ilhxVbaH4N8EuXOD33ZASVM4Nzjqzm/UuQPAAtY80oY5L0rg7eGn4lYZ+Cde8P3sejGm59av/ODO2Ev9LJX0=
X-Received: by 2002:a05:6830:348f:b0:659:e2e4:54f8 with SMTP id
 c15-20020a056830348f00b00659e2e454f8mr2411156otu.140.1663412174504; Sat, 17
 Sep 2022 03:56:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220913094252.3555240-1-andy.chiu@sifive.com>
 <20220913094252.3555240-4-andy.chiu@sifive.com> <CAJF2gTSn3_cDYsF9D8dt-br2Wf_M8y02A09xgRq8kXi91sN3Aw@mail.gmail.com>
 <CABgGipWBOZx+c0i5B9xArTRxa6-4yAbeByWXr7v8MSf7AATfxg@mail.gmail.com>
In-Reply-To: <CABgGipWBOZx+c0i5B9xArTRxa6-4yAbeByWXr7v8MSf7AATfxg@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 17 Sep 2022 18:56:02 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTBcUma_umYg_3HxoQsZgPuPVZP0L1mpdkm9-x3LuhNoQ@mail.gmail.com>
Message-ID: <CAJF2gTTBcUma_umYg_3HxoQsZgPuPVZP0L1mpdkm9-x3LuhNoQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 riscv/for-next 3/5] riscv: ftrace: use indirect
 jump to work with kernel preemption
To: Andy Chiu <andy.chiu@sifive.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	rostedt@goodmis.org, mingo@redhat.com, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, ardb@kernel.org, 
	greentime.hu@sifive.com, zong.li@sifive.com, kernel@esmil.dk, 
	linux-riscv@lists.infradead.org, Jim Shu <jim.shu@sifive.com>, 
	Ruinland Tsai <ruinland.tsai@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220917_035623_899600_54295841 
X-CRM114-Status: GOOD (  23.38  )
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

On Sat, Sep 17, 2022 at 9:04 AM Andy Chiu <andy.chiu@sifive.com> wrote:
>
> Hi Guo,
>
> On Wed, Sep 14, 2022 at 2:45 PM Guo Ren <guoren@kernel.org> wrote:
> >
> > I really appreciate you finding the bug, great job.
>
> Thanks, :)
>
> >
> > On Tue, Sep 13, 2022 at 5:44 PM Andy Chiu <andy.chiu@sifive.com> wrote:
>
> Consider this case happens on a preemptive kernel, with stop_machine.
> And all of stop_machine's sub-functions were marked as no trace.
>
> > > p: patched area performed by dynamic ftrace
> > > ftrace_prologue:
> > > p|      REG_S   ra, -SZREG(sp)
> > > p|      auipc   ra, 0x? ------------> preempted
> > >                                         ...
> > >                                 change ftrace function
> > >                                         ...
> > > p|      jalr    -?(ra) <------------- switched back
> >
> > When auipc + jalr -> nop, is safe, right? Because when switched back,
> > jalr -> nop.
> > When nop -> auipc + jalr, is buggy, right? Because when switched back,
> > nop -> jalr, the ra's value is not expected.
> >
> > Some machines with instruction fusion won't be affected, because they
> > would merge auipc + jalr into one macro-op.
>
> This might not be safe as well, if auipc and jalr happened to sit on a
> different cache line. And if there were a cache hit for the line
> having the auipc and miss for the jalr after switching back. I do not
> really sure if this is possible in practice.
That's mico-arch bug, hardware should guarantee it. IFU always emits
the macro-op after getting "auipc + <next insn>" or emits separately.

>
> > Qemu shouldn't be broken, because auipc + jalr is always in the same
> > tcg block, so no chance for interruption between them.
>
> In fact, qemu is broken. I had not thought of that before I got your
> reply. But I believe that there is a size limit for each tcg block,
> and the auipc and jalr just locate in a separate tcg block.
Yes, you are right. They could be located in different TCG blocks.

>
> Regards,
> Andy



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
