Return-Path: <SRS0=kDER=NE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE510C4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Aug 2021 17:10:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A019661154
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Aug 2021 17:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A019661154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3J7gAyP6E9tuAdgfgivLaTBLCX+0SBRbkSqqe/UVVcs=; b=0wuOH//TD9Z8xM
	9FRYjct5krdgosIz6oXl1tVpd5gPgOAigGGdoW3mtykPYJXCohSgTV08ZziY7Bd3XAls65xGE+wkH
	zgNU6SbsxvJQPjGghnI4wy9sEk9K6op3S7g+2A8e6tYvB/ywm9uhkFKx6nniNw27gxvStVxGmhvaZ
	6L8bJfWDVW+QHHkcSd+F7LOEWu9+S6zdYpZhkO8O3z4CXvHDfeI2cimamZXrWjDalcT/FK3kBwf93
	IBAgsYP7V5ivVtdxo/DGglvZni3skb4Tpzkt0E037x/OkW0wcWEsaNEX9dUA7n+L//hoycuWtivG1
	1aQExbCmyRE+kD8+UdJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEahK-00DDea-ER; Fri, 13 Aug 2021 17:10:22 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEahF-00DDdg-8Q
 for linux-riscv@lists.infradead.org; Fri, 13 Aug 2021 17:10:21 +0000
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id E2C3940658
 for <linux-riscv@lists.infradead.org>; Fri, 13 Aug 2021 17:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1628874606;
 bh=8FqkbZBTRWV0AxSlmaQKOjvfV2RVpFuLWDlormJNSBQ=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=BgKD8NH1AoEZMPBlgrvqysMCxSKAFPvxFGTn4nM2ujCU9Sum6BFKFXr40MTqPOInj
 dip2OY5ONixcJr9ZIbOR739EDOaT+fs7p/OTO9R5f9JbZpQTe7QjnbLBoEiX7PN1MC
 NpOM6CWUT5BlKyuGzP9LrFNlryScq4roGIordmkXh9A6aFjs1MGCCWA3hImBsIO2Ic
 EFNA32XHuacAbJKKQFWvppZ0H2QMVboA0F/L4vb6WApbRYSbBA/xpug4jH1Ku5L0O0
 4Gvm5SY2VcYpc4ibjycH0JgyK0AQUkiRCGZ+Ts1wGEuhj7OWm6aEAuRuuZUWjmId1g
 jLCrohpB7tksQ==
Received: by mail-il1-f199.google.com with SMTP id
 r6-20020a92c506000000b002246015b2a4so384697ilg.21
 for <linux-riscv@lists.infradead.org>; Fri, 13 Aug 2021 10:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8FqkbZBTRWV0AxSlmaQKOjvfV2RVpFuLWDlormJNSBQ=;
 b=Ev5Bu6TmScuyecw8ZpgMXlTAzthvS0GoX8OtMdfds+7nxyFrilnkB9yVUOjedDUExF
 CNGVsnnh9dnRFbjZ1BsH/AdLRsWp3QEeXna+fHhHxKpa1XnU9CbV58qmEevmjdeVVRV8
 YNcbtYZW7YJfx6OepGdacI0HHsZqUg1uH200zHXvhAl0xtT36RRRj6LAq0gDcWbm3T9b
 arLLJLECgjJA4MULSXNWUlXKQtAbyKRXK2Y6u1Kw8BsOfopvzPc5rbTDx6mMZAK9lX1h
 bxjnqSgqXOeRaIQkb9XnAm2WqgLozfb4fNKyZmwdvuounczEdro30NwUP0NaXSmTwFua
 a8JQ==
X-Gm-Message-State: AOAM532TZBHrvZutDRGyGsCBwxUJRN1IvTHcDbC255xJ9mXpNssWRkzz
 YGMxhBkbetvP7FvBXAQRGOyneQ/kqI6r9sP6aPUURXLD9JU10VyN6XBxEHWw6RHZgUyD9FagF7b
 D7aEd+I7KIjHBZ6r3Kcrq0FI1I11wBBBQSPoMJsedkcqyCrGAWGjl/MmE0n4KCA==
X-Received: by 2002:a6b:8f08:: with SMTP id r8mr2777991iod.42.1628874605878;
 Fri, 13 Aug 2021 10:10:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVux983Ruh0XqE6sNH39w7EPP8QIhYytDywc1JCFiM2xWArPpRtEv2c5H6lqf0CelaOEXDsCbHjlOsELavFUA=
X-Received: by 2002:a6b:8f08:: with SMTP id r8mr2777975iod.42.1628874605615;
 Fri, 13 Aug 2021 10:10:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210812123433.27871-1-dimitri.ledkov@canonical.com>
 <CAOnJCULTxFmRbpw4wp7SYN8EJxFhSN5J04QDE=cfxLAB01ZOFA@mail.gmail.com>
In-Reply-To: <CAOnJCULTxFmRbpw4wp7SYN8EJxFhSN5J04QDE=cfxLAB01ZOFA@mail.gmail.com>
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Date: Fri, 13 Aug 2021 18:09:29 +0100
Message-ID: <CADWks+bVr8OcrfeMzMCPJ15G-y9cGpbb-2+1_AGU4Y2QOQjjBg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: prevent sbi_send_cpumask_ipi race with ftrace
To: Atish Patra <atishp@atishpatra.org>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 Pierce Andjelkovic <pierceandjelkovic@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_101017_549986_A6D3F8D8 
X-CRM114-Status: GOOD (  27.50  )
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

Hi,

On Thu, Aug 12, 2021 at 4:53 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Thu, Aug 12, 2021 at 5:36 AM Dimitri John Ledkov
> <dimitri.ledkov@canonical.com> wrote:
> >
> > From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
> >
> > ftrace will patch instructions in sbi_send_cpumask_ipi, which is going to
> > be used by flush_icache_range, leading to potential races and crashes like
> > this:
> >
> > [    0.000000] ftrace: allocating 38893 entries in 152 pages
> > [    0.000000] Oops - illegal instruction [#1]
> > [    0.000000] Modules linked in:
> > [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.11.0-1014-generic #14-Ubuntu
> > [    0.000000] epc: ffffffe00000920e ra : ffffffe000009384 sp : ffffffe001803d30
> > [    0.000000]  gp : ffffffe001a14240 tp : ffffffe00180f440 t0 : ffffffe07fe38000
> > [    0.000000]  t1 : ffffffe0019cd338 t2 : 0000000000000000 s0 : ffffffe001803d70
> > [    0.000000]  s1 : 0000000000000000 a0 : ffffffe0000095aa a1 : 0000000000000001
> > [    0.000000]  a2 : 0000000000000002 a3 : 0000000000000000 a4 : 0000000000000000
> > [    0.000000]  a5 : 0000000000000000 a6 : 0000000000000004 a7 : 0000000052464e43
> > [    0.000000]  s2 : 0000000000000002 s3 : 0000000000000001 s4 : 0000000000000000
> > [    0.000000]  s5 : 0000000000000000 s6 : 0000000000000000 s7 : 0000000000000000
> > [    0.000000]  s8 : ffffffe001a170c0 s9 : 0000000000000001 s10: 0000000000000001
> > [    0.000000]  s11: 00000000fffcc5d0 t3 : 0000000000000068 t4 : 000000000000000b
> > [    0.000000]  t5 : ffffffe0019cd3e0 t6 : ffffffe001803cd8
> > [    0.000000] status: 0000000200000100 badaddr: 000000000513f187 cause: 0000000000000002
> > [    0.000000] ---[ end trace f67eb9af4d8d492b ]---
> > [    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
> > [    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---
> >
> > Where ffffffe00000920e lies in the middle of sbi_send_cpumask_ipi.
> >
> > Reproduced on Unmatched board using Ubuntu kernels. See
> > https://people.canonical.com/~xnox/lp1934548/ for sample images,
> > kernels, debug symbols.
> >
> > BugLink: https://bugs.launchpad.net/bugs/1934548
> > Reported-by: Pierce Andjelkovic <pierceandjelkovic@gmail.com>
> > Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
> > Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
> > cc: Paul Walmsley <paul.walmsley@sifive.com>
> > cc: linux-riscv@lists.infradead.org
> > cc: stable@vger.kernel.org
> > ---
> >  arch/riscv/kernel/sbi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> > index 7402a417f38e..158199865c68 100644
> > --- a/arch/riscv/kernel/sbi.c
> > +++ b/arch/riscv/kernel/sbi.c
> > @@ -562,7 +562,7 @@ long sbi_get_mimpid(void)
> >         return __sbi_base_ecall(SBI_EXT_BASE_GET_MIMPID);
> >  }
> >
> > -static void sbi_send_cpumask_ipi(const struct cpumask *target)
> > +static void notrace sbi_send_cpumask_ipi(const struct cpumask *target)
> >  {
> >         struct cpumask hartid_mask;
> >
>
> flush_icache_range doesn't invoke sbi_send_cpumask_ipi.
> flush_icache_range->flush_icache_all->sbi_remote_fence_i->__sbi_rfence->sbi_ecall
>
> Moreover, sbi.c should be removed from ftrace path as it is compiled
> with notrace flag after the patch [1]
>
> CFLAGS_REMOVE_sbi.o   = $(CC_FLAGS_FTRACE)
>
> This solution was proposed as a result of earlier discussion [2] last year.
>
> [1] https://patchwork.kernel.org/project/linux-riscv/patch/1608220905-1962-5-git-send-email-guoren@kernel.org/
> [2] https://lkml.org/lkml/2020/11/3/735
>
> The proposed fix probably hiding the root cause somehow.
>
> Do you have the patch[1] in your kernel ?
>

We do not. I have applied and tested it, and indeed it resolves the
boot issue too. And it does make a lot more sense. I see that it and
its prereq patch did not have CC: stable on them. I will submit them
to stable, as they are required to have bootable kernels. Thanks a lot
for the pointers.

So this patch that I sent is NACKed now.
-- 
Regards,

Dimitri.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
