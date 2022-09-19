Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD97C54EE9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Sep 2022 08:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2cJbCEpavDf+hN1Ni/Hod0wpdVh5jbVku+kw65nM27Q=; b=N3DcWYtsTscnDr
	G1M0FVCO04RZFlQ2gtCGKyh+QLQEAOo8QWDVtlbNKvFQEA4kMyxyzXPMsAHFIvyUiwd2UAkCfb2CZ
	eGU1/eMgegQa6RS7vNAGYjFzbHzuIgO4twJvx03/GYD3QZG1WSehJCwXBJmr3Og6SJjCI1OSA+D3o
	FvYeg/ppvze4cBQpJGDbTsxal8F0XGB931uo9sagkF9Nx9+JR8WiFB013YA4cDBSOUy0A85aNpYLD
	aioNXqaBYo9PYbAKzRgW0JK46lKSmDSGr7Mv3KmPjrNsbXYWIoQqSBGkJlvmlRlN8Y3tJ1PHL9IO1
	eWVL7Tn0GAla3zc7GAIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaCIH-00ACFr-47; Mon, 19 Sep 2022 08:38:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaCIE-00ACDY-EI
	for linux-riscv@lists.infradead.org; Mon, 19 Sep 2022 08:38:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0F0646182C
	for <linux-riscv@lists.infradead.org>; Mon, 19 Sep 2022 08:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8C9C43149
	for <linux-riscv@lists.infradead.org>; Mon, 19 Sep 2022 08:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663576695;
	bh=heo7YO9Z/Mn7auLgacdl566kMb7P9+5y2s1cnvWWhNs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uTRUGIbB/a+yr6sQn5wS+gyN3Xv7qSHcczusIx9S/VcHwA5TeOBrrF+FMvoksUBR3
	 Meu+wDm+BNyFMTCU0sJjW+FF6K/137aKqFQzjILAgO1SKBofcOQK7rigqkcBYbSmzS
	 AjA3QmvYiO+ivlH1Fzjcqq8IgyXMaX+zMwxuFKsUrmFpiWGit83q41mSrjZzZc73g0
	 d2jtyoNBgZXoHOH7M3qSD263CD4BfK4y1I/oRek25g1Ern3INBBBr+qyZFnrm/9awY
	 Ix3dRl55JGnY6Zd7RpsPK7Lhk17DY1GNoc+G+PovFICRqooNDJVq+sDjzQblFcAgYs
	 cDQnrzv3JgQog==
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-127dca21a7dso60834816fac.12
        for <linux-riscv@lists.infradead.org>; Mon, 19 Sep 2022 01:38:15 -0700 (PDT)
X-Gm-Message-State: ACrzQf1USmsaSWE2AyW1S7LQ30J/KoQAc+JvSHQmSdi3LfYIr9VLjKcL
	31T8X9tooTnniv/W0OCbJLD0XUlZIPLpxXIpCJY=
X-Google-Smtp-Source: AMsMyM7ABtP0qSS4TeNjY3/uJch3CvccZb+T2Wqml4QNq4ZCaawYjQENTRVHMje/Mc+dM1SGFVjGsCi0SpAccjiDCdc=
X-Received: by 2002:a05:6870:5803:b0:12c:c3e0:99dc with SMTP id
 r3-20020a056870580300b0012cc3e099dcmr4442166oap.19.1663576694922; Mon, 19 Sep
 2022 01:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220908022506.1275799-1-guoren@kernel.org> <20220908022506.1275799-9-guoren@kernel.org>
 <4babce64-e96d-454c-aa35-243b3f2dc315@www.fastmail.com> <CAJF2gTQAMCjNyqrSOvqDAKR5Z-PZiTVxmoK9cvNAVQs+k2fZBg@mail.gmail.com>
 <8817af55-de0d-4e8f-a41b-25d01d5fa968@www.fastmail.com> <CAJF2gTRnY+vc2nKbqubTZvv+FWVgO3yCK4LcwpeNgx51JuETzw@mail.gmail.com>
 <7409c92a-68df-4406-bd86-835d9a959ef5@www.fastmail.com> <CAJF2gTRxt_b2TswE6YJgmFZeRyVzV7fQdMX+7Ptrfa_k=auSjg@mail.gmail.com>
 <2b06f28d-a13d-4c86-af04-39e383aaf07b@www.fastmail.com>
In-Reply-To: <2b06f28d-a13d-4c86-af04-39e383aaf07b@www.fastmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 19 Sep 2022 16:38:02 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRzC9ES1EK3X4tHchTZMfbGJk2QLbD8VG=5x5bWD7Er0w@mail.gmail.com>
Message-ID: <CAJF2gTRzC9ES1EK3X4tHchTZMfbGJk2QLbD8VG=5x5bWD7Er0w@mail.gmail.com>
Subject: Re: [PATCH V4 8/8] riscv: Add config of thread stack size
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
	"Conor.Dooley" <conor.dooley@microchip.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Jisheng Zhang <jszhang@kernel.org>, lazyparser@gmail.com, falcon@tinylab.org, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Linux-Arch <linux-arch@vger.kernel.org>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>, Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_013818_669177_DAEEB882 
X-CRM114-Status: GOOD (  35.16  )
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

On Mon, Sep 12, 2022 at 4:25 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Sep 12, 2022, at 6:14 AM, Guo Ren wrote:
> > On Mon, Sep 12, 2022 at 2:40 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >> On Sun, Sep 11, 2022, at 1:35 AM, Guo Ren wrote:
> >> > On Sun, Sep 11, 2022 at 12:07 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >> >>
> >> >> That sounds like a really bad idea, why would you want to risk
> >> >> using such a small stack without CONFIG_VMAP_STACK?
> >> >>
> >> >> Are you worried about increased memory usage or something else?
> >> > The requirement is from [1], and I think disabling CONFIG_VMAP_STACK
> >> > would be the last step after serious testing.
> >>
> >> I still don't see why you need to turn off VMAP_STACK at all
> >> if it works. The only downside I can see with using VMAP_STACK
> >> on a 64-bit system is that it may expose bugs with device
> >> drivers that do DMA to stack data. Once you have tested the
> >> system successfully, you can also assume that you have no such
> >> drivers.
> > 1st, VMAP_STACK could be enabled&disabled in arch/Kconfig. If we don't
> > force users to enable VMAP_STACK, why couldn't user adjust
> > THREAD_SIZE?
>
> Turning off VMAP_STACK is harmless and may help debug issues
> with VMAP_STACK itself. It's also required on architectures
> that don't have KASAN_VMALLOC or something else that conflicts
> with it.
>
> Changing THREAD_SIZE is also fine, as long as VMAP_STACK catches
> the inevitable overflows. I would not object to having an
> option that allows setting the stack size larger than the
> default without VMAP_STACK, as long as setting it lower requires
> using VMAP_STACK. That would however add a lot more complexity
> and probably doesn't do what you want either.
Thx for the detailed clarification, I agree with the point. I've put
an EXPERT on config.

>
> > 2nd, VMAP_STACK is not free, we still need 1KB shadow_stack.
> > The EXPERT is enough for your concern.
>
> It's actually more than the 1KB: you need both 1KB of shadow
> stack and 4KB per CPU for the actual overflow_stack. If you
> are micro-optimizing at this level, then a possible option
> may be to change the handle_kernel_stack_overflow() function
> to not preserve the task stack and just panic() without
> showing the backtrace. That way you don't see which code
> caused the issue, but at least you avoid corrupting random
> data.
Thx for the detailed explanation, the handle_kernel_stack_overflow()
is a novel idea, which I will consider later.

>
>      Arnd



--
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
