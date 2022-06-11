Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08542C43334
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jun 2022 05:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hGJeMUKyEmaETDb2z21hpIhmkR8TFM/A5eslNW7C3eI=; b=UA3AOVz43tQRVE
	vxzJy4FU+lCcdgdIf4c4FMqyCABZb5h2v4dbLR28kn2XaHZZZdcCtd41iRKBj32nEAwsokBE2Z3l7
	vDw3PwYF36Us8iLvts41I/aRWogNuDaiPFs5tJt2CNoAiup4zEKJ9L9BRdO8+MWzlgWWf1zt23x68
	/8l0VPX83x4G4PR1DlW0zbQ2+K5RYH7phMEPhJFN07LEJkNOgHfjaHBDcUYfaZcxnNqW415wulLAO
	vTtkhmik1a8JhTagym/Vh8YmBnz7fiB7rcrWMvYPYhTH0ntWepugqXaP1dC5PXJ5WmeKR/8fg6p3I
	EHqeN702j5A9XX/9mFHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nztSU-00BV8F-5P; Sat, 11 Jun 2022 05:14:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nztSQ-00BV7I-Ti
	for linux-riscv@lists.infradead.org; Sat, 11 Jun 2022 05:14:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 862FE60BC5
	for <linux-riscv@lists.infradead.org>; Sat, 11 Jun 2022 05:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69C20C3411E
	for <linux-riscv@lists.infradead.org>; Sat, 11 Jun 2022 05:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654924485;
	bh=bw0gYDa9Sw2ivc5NmLT4AkVPW9upi7VoxFhegFNh9ww=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=InL/7IhaYoo/li7cDVqaFqOdirAlXxfsUpQwpmT/+uvfGX3flLTIVzXOcZLGd6Tdl
	 PZnlSa5KKK58GToYsRFPi5PEHVDbYXO8vj/CCEJhLgsO+ualwT6AaOYyGXmJjxYeZQ
	 ZrTm7xMfwNT7D7utNEUnimEUJ19cjIJ8pjHXexFQl4NDWhFNyK4MvGhnORfc9zus+3
	 h/jsFP1YbIERF+znCVpP4gLZW44Cekznhgv5H9o35IfHPmaS6g4rAQfjLUqcWee1Jt
	 qspHmZzwpP4aju/eXVlWPQ5w6SpU//qCAWbUAyFKFnD2Zl8gyAhfKe40mRwfRBjYBP
	 9yXh/Hwerp2CQ==
Received: by mail-vs1-f54.google.com with SMTP id x9so1074890vsg.13
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jun 2022 22:14:45 -0700 (PDT)
X-Gm-Message-State: AOAM530Nve0FWydjEYrZ+nPEw4wovUHdiYgpBBOThU6qVu8V89kc+HUd
	hzxuXSTncoSO9XQT20T+3vm4yrz8hxzlSmTOBAE=
X-Google-Smtp-Source: ABdhPJyBVffwDuetHif13oQqAeRfqGgHObBwodUJOy7zrElBDaNS4h0Zpw0s2eEzP4nb0K/PX2pkCoWe4R5gjZXlp9w=
X-Received: by 2002:a05:6102:5493:b0:34b:b583:f557 with SMTP id
 bk19-20020a056102549300b0034bb583f557mr14541985vsb.2.1654924484330; Fri, 10
 Jun 2022 22:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220611023122.211621-1-falcon@tinylab.org>
In-Reply-To: <20220611023122.211621-1-falcon@tinylab.org>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 11 Jun 2022 13:14:33 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTJApuPatenUVgEWWsGOkiwGNQ72nMjFmDQj5PRdpNtwQ@mail.gmail.com>
Message-ID: <CAJF2gTTJApuPatenUVgEWWsGOkiwGNQ72nMjFmDQj5PRdpNtwQ@mail.gmail.com>
Subject: Re: [RFC] riscv: restore the irq save/restore logic for nosync code patching
To: Wu Zhangjin <falcon@tinylab.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Peter Zijlstra <peterz@infradead.org>, Zong Li <zong.li@sifive.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andy Chiu <andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_221447_061888_9E86988C 
X-CRM114-Status: GOOD (  27.33  )
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

Sorry, I misunderstood your patch, here is the new review feedback.

On Sat, Jun 11, 2022 at 10:31 AM Wu Zhangjin <falcon@tinylab.org> wrote:
>
> The commit '0ff7c3b331276f584bde3ae9a16bacd8fa3d01e6' removed the
> old patch_lock together with the irq save/restore logic.
>
> But the patching interface: patch_text_nosync() has new users like
> Jump Label, which doesn't use stop_machine(), here restores the irq
> save/restore logic for such users, just as the other architectures do.
Let's give protection out of patch_text_nosync.

        mutex_lock(&text_mutex);
        patch_text_nosync(addr, &insn, sizeof(insn));
        mutex_unlock(&text_mutex);

Why mutex isn't enough for patch_text?

>
> Move lockdep assert to the required path too, the current stop_machine()
> based ftrace implementation should use the new added patch_text_noirq()
> without this lockdep assert, it has its own mutex, but not named as
> text_mutex.
Do you mean we should use irq_save&restore instead of text_mutex?


>
> As the latest maillist shows, a new ftrace support without
> stop_machine() is in review, which requires the nosync version with this
> irq save/restore logic or the new added noirq version (as we can see it
> also calls patch_insn_write) with explicit text_mutex and irq
> save/restore logic.
>
> Signed-off-by: Wu Zhangjin <falcon@tinylab.org>
> ---
>  arch/riscv/kernel/patch.c | 32 +++++++++++++++++++++++---------
>  1 file changed, 23 insertions(+), 9 deletions(-)
>
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index 765004b60513..03f03832e077 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -55,13 +55,6 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
>         bool across_pages = (((uintptr_t) addr & ~PAGE_MASK) + len) > PAGE_SIZE;
>         int ret;
>
> -       /*
> -        * Before reaching here, it was expected to lock the text_mutex
> -        * already, so we don't need to give another lock here and could
> -        * ensure that it was safe between each cores.
> -        */
> -       lockdep_assert_held(&text_mutex);
> -
>         if (across_pages)
>                 patch_map(addr + len, FIX_TEXT_POKE1);
>
> @@ -85,7 +78,8 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
>  NOKPROBE_SYMBOL(patch_insn_write);
>  #endif /* CONFIG_MMU */
>
> -int patch_text_nosync(void *addr, const void *insns, size_t len)
> +/* For stop_machine() or the other cases which have already disabled irq and have locked among cpu cores */
> +int patch_text_noirq(void *addr, const void *insns, size_t len)
>  {
>         u32 *tp = addr;
>         int ret;
> @@ -97,6 +91,26 @@ int patch_text_nosync(void *addr, const void *insns, size_t len)
>
>         return ret;
>  }
> +NOKPROBE_SYMBOL(patch_text_noirq);
> +
> +int patch_text_nosync(void *addr, const void *insns, size_t len)
> +{
> +       int ret;
> +       unsigned long flags;
> +
> +       /*
> +        * Before reaching here, it was expected to lock the text_mutex
> +        * already, so we don't need to give another lock here and could
> +        * ensure that it was safe between each cores.
> +        */
> +       lockdep_assert_held(&text_mutex);
> +
> +       local_irq_save(flags);
> +       ret = patch_text_noirq(addr, insns, len);
> +       local_irq_restore(flags);
> +
> +       return ret;
> +}
>  NOKPROBE_SYMBOL(patch_text_nosync);
>
>  static int patch_text_cb(void *data)
> @@ -106,7 +120,7 @@ static int patch_text_cb(void *data)
>
>         if (atomic_inc_return(&patch->cpu_count) == num_online_cpus()) {
>                 ret =
> -                   patch_text_nosync(patch->addr, &patch->insn,
> +                   patch_text_noirq(patch->addr, &patch->insn,
>                                             GET_INSN_LENGTH(patch->insn));
>                 atomic_inc(&patch->cpu_count);
>         } else {
> --
> 2.35.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
