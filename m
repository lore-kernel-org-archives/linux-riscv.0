Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489E1ECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Sep 2022 04:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BNFttFgyVODnH24nt2/q6Rjug6gg43fBI1NsZhW0aMY=; b=ZegtVq5zq7Gtwj
	WnRJY0LXFYMku0lnCvXVpHl0KvnisvC2Lo9Wg+Vh8a5xwzo3I7WXaT1v+1qjg40FpLwwz2ReNQ6Df
	CuUeTFMZ4Jo23f4cA13e9H6vh6/PPr25upKob8gnuJf7hbbPimE3582vLa7pe+Dut6f9My4JFMjVO
	5JcZY2jg+McDhfcTmlvkDAFq+UsUDs7v5haNd9rtxrfIvymd0VRH/N28ZOM1v/rtlyAflCAPwxhIv
	P2hrx/3kqRUPwzkZMjh/5oPLXtNPjF0wqYeaYAAqA+5H6rU3qcqUZW7JMYqN6s7v4xM8C2OSHOOjm
	+hrA8Z1HSXz3/+FfUibg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXaqQ-006nIw-4N; Mon, 12 Sep 2022 04:14:50 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXaqN-006nHr-9Q
	for linux-riscv@lists.infradead.org; Mon, 12 Sep 2022 04:14:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 588C1B80B52
	for <linux-riscv@lists.infradead.org>; Mon, 12 Sep 2022 04:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D83C9C433D7
	for <linux-riscv@lists.infradead.org>; Mon, 12 Sep 2022 04:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662956083;
	bh=sZp87uk/tgN5rqc5QTzYD9Bq4Rq7LlVl4d9+OQDuWd0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UgoRQxD0s6lK7qtaFUSqXDNuE0arJ53kQ2ul9tpM07RE6H1tjrgNLFUULlEXrD80G
	 +DJPbA8bz/tKv/niKn48unroySBPwGrhyYohZeCCmFgy9Oy9HoenUi6oe8lysPkRQb
	 +Q62rtjrB2JB1iR16BIlPg1c2v6qUzMfGQoFPT92vt+ncWRQAktrj6nItLzsKv+crS
	 rapCYE6A+NFgmLiLW24GpCO8zqdopIJzEpg6u1g23rNP5Hq6WSHn8pQPsm0P/dToyn
	 iwOFj4pGnzO66h6zvqMmDzcSPzPRDRD3cyx8knhGQyg+ixXHanKwogd6EQRF5HSO4w
	 T625AHkWgdpLA==
Received: by mail-oo1-f52.google.com with SMTP id d74-20020a4a524d000000b004755f8aae16so530458oob.11
        for <linux-riscv@lists.infradead.org>; Sun, 11 Sep 2022 21:14:43 -0700 (PDT)
X-Gm-Message-State: ACgBeo33vZL+1cmQ6k6WzEKtwhW0DFtMyDXKUda22gyQ0W1frOZFM32L
	obxPGonEizoNpR2vkRqto+3uOAeTz5MNrXwof0s=
X-Google-Smtp-Source: AA6agR7uDujU33x2bd2IE9CjZsZh6lUsGTAK6HB7wAtIzyneeQRmIZl02YvTJ1zW3uuOI+4PPRCPIWutLY0xxHp6Bb4=
X-Received: by 2002:a4a:d8cc:0:b0:475:5c7e:eb3e with SMTP id
 c12-20020a4ad8cc000000b004755c7eeb3emr2387976oov.48.1662956082996; Sun, 11
 Sep 2022 21:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220908022506.1275799-1-guoren@kernel.org> <20220908022506.1275799-9-guoren@kernel.org>
 <4babce64-e96d-454c-aa35-243b3f2dc315@www.fastmail.com> <CAJF2gTQAMCjNyqrSOvqDAKR5Z-PZiTVxmoK9cvNAVQs+k2fZBg@mail.gmail.com>
 <8817af55-de0d-4e8f-a41b-25d01d5fa968@www.fastmail.com> <CAJF2gTRnY+vc2nKbqubTZvv+FWVgO3yCK4LcwpeNgx51JuETzw@mail.gmail.com>
 <7409c92a-68df-4406-bd86-835d9a959ef5@www.fastmail.com>
In-Reply-To: <7409c92a-68df-4406-bd86-835d9a959ef5@www.fastmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 12 Sep 2022 12:14:29 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRxt_b2TswE6YJgmFZeRyVzV7fQdMX+7Ptrfa_k=auSjg@mail.gmail.com>
Message-ID: <CAJF2gTRxt_b2TswE6YJgmFZeRyVzV7fQdMX+7Ptrfa_k=auSjg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220911_211447_672082_3EE232E6 
X-CRM114-Status: GOOD (  27.69  )
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

On Mon, Sep 12, 2022 at 2:40 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
>
>
> On Sun, Sep 11, 2022, at 1:35 AM, Guo Ren wrote:
> > On Sun, Sep 11, 2022 at 12:07 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >>
> >> On Sat, Sep 10, 2022, at 2:52 PM, Guo Ren wrote:
> >> > On Thu, Sep 8, 2022 at 3:37 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >> >> On Thu, Sep 8, 2022, at 4:25 AM, guoren@kernel.org wrote:
> >> >> > From: Guo Ren <guoren@linux.alibaba.com>
> >> >> - When VMAP_STACK is set, make it possible to select non-power-of-two
> >> >>   stack sizes. Most importantly, 12KB should be a really interesting
> >> >>   choice as 8KB is probably still not enough for many 64-bit workloads,
> >> >>   but 16KB is often more than what you need. You probably don't
> >> >>   want to allow 64BIT/8KB without VMAP_STACK anyway since that just
> >> >>   makes it really hard to debug, so hiding the option when VMAP_STACK
> >> >>   is disabled may also be a good idea.
> >> > I don't want this config to depend on VMAP_STACK. Some D1 chips would
> >> > run with an 8K stack size and !VMAP_STACK.
> >>
> >> That sounds like a really bad idea, why would you want to risk
> >> using such a small stack without CONFIG_VMAP_STACK?
> >>
> >> Are you worried about increased memory usage or something else?
> > The requirement is from [1], and I think disabling CONFIG_VMAP_STACK
> > would be the last step after serious testing.
>
> I still don't see why you need to turn off VMAP_STACK at all
> if it works. The only downside I can see with using VMAP_STACK
> on a 64-bit system is that it may expose bugs with device
> drivers that do DMA to stack data. Once you have tested the
> system successfully, you can also assume that you have no such
> drivers.
1st, VMAP_STACK could be enabled&disabled in arch/Kconfig. If we don't
force users to enable VMAP_STACK, why couldn't user adjust
THREAD_SIZE?
2nd, VMAP_STACK is not free, we still need 1KB shadow_stack.
The EXPERT is enough for your concern.


>
>      Arnd



--
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
