Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F12EFA3743
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Oct 2022 19:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iGMjcmwLAINe6RTyhSzqpH5yuZljz5b1Bu/wJpJXlk8=; b=h7AvorOAh4A2CD
	rN528bJ3trAh7S7xWQTCSldDTFfFZzF7hsLbdCG+baYRIASb8AeVBabhw6bXYgbFY8OTvR1a4Lea4
	I9FvVl8XWPUh1RfNzHOCyGsZxt/6yrDj35Qa4HCmETCeUxXqO3H23hqfP3T/NwutfvUkEGYLjUg4r
	oGhLCJaYuzTUvmwnW9ik/4Ng2i+s0bbaSJz6ljX+fQeyxH1khaBydecLYF9hCX8zEUss7zB20ZqaZ
	ytHICNxzMegnD/tJqAfLvkdZyL4asGvi9Y1gWSLCxCAxJfCT8q7Hmj33QDGJjZ8bjnceQDPAdksGS
	rcv0ENtVAfTY+K/ZGqxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opaQP-00ECya-Ql; Mon, 31 Oct 2022 19:26:21 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opaQM-00ECx3-Mi
	for linux-riscv@lists.infradead.org; Mon, 31 Oct 2022 19:26:20 +0000
Received: by mail-oi1-x233.google.com with SMTP id n83so13766021oif.11
        for <linux-riscv@lists.infradead.org>; Mon, 31 Oct 2022 12:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UJ0lOh2WHzkMHSyGntGrBnZIld+O9sk/z0tqYs4/9ac=;
        b=jPGFD+shh3P6Bxl6dtn/Bc8qE+MpQYMg9gVIT6JbAAfQ1LHymLueBqrnzH6fi5InEN
         N+higcRkSVCEyJqh0lBvXm7qN5SOF3x+Mez8epG5Ov/Xs5B4lU2nIgKoZRuJSk0s79n4
         LQKyHmuYzj7dsuc8Aq/hG7w+vv/5a4uDvjm54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJ0lOh2WHzkMHSyGntGrBnZIld+O9sk/z0tqYs4/9ac=;
        b=JWR0SXZ8+c4SyETT+0ITucjU0gC9UP25w4NEsbOBSmhibOs0kepA1S9PI4c7ZGLFda
         oSCUGG5mCny7df8agPkX7c3bFtrNzwVJn/VASn+VuTLaYDWGCZXnrGkCG2nMGQlaq1lo
         Wycllv9P0JUKS2aPpM7ovqr1iK13jkTFrx0SA8donn+5SaWB4rXNfV7LXe3q7XvqiItu
         lr9tBfQheOhPQB2thxOtEWEFAgHudbzyaHo8UGSPtgRKKfFOWvLcCieOH2ERPwFoBo0h
         UpD2LDJyieba9/RWWwR3RHpi874D4ZuCoQtSDTFtC1lfTLn+m2kP86QzRIHfWvV0+Dum
         VAnw==
X-Gm-Message-State: ACrzQf3BjT4RpGeuOQlpFd50o9yxHvtvMMnngVc/Yfg1u4v2LxZo33K1
	XNSVr1evfB5GfejcscoC0UWq1HjqQ3MSbjeXBPZy
X-Google-Smtp-Source: AMsMyM5DK76DhxyTBJTOuwvjAKSAxZG+Xnk3XxPTuByccSTUMcdXR9NkvikUoLLs31SCFH7vadIOJuzabCuELGnqUMM=
X-Received: by 2002:aca:6007:0:b0:35a:1bda:d213 with SMTP id
 u7-20020aca6007000000b0035a1bdad213mr1491663oib.181.1667244376293; Mon, 31
 Oct 2022 12:26:16 -0700 (PDT)
MIME-Version: 1.0
References: <20221028231929.347918-1-atishp@rivosinc.com> <Y2Ad/FaLE5qM01gR@spud>
In-Reply-To: <Y2Ad/FaLE5qM01gR@spud>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 31 Oct 2022 12:26:05 -0700
Message-ID: <CAOnJCUK5Z6i39f5MJaRFhorGjcmBR=p_MapY_TDcR1e274wtpA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Do not issue remote fences until smp is available
To: Conor Dooley <conor@kernel.org>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org, 
	Jisheng Zhang <jszhang@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, linux-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_122618_936471_4DAEC71F 
X-CRM114-Status: GOOD (  23.78  )
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

On Mon, Oct 31, 2022 at 12:12 PM Conor Dooley <conor@kernel.org> wrote:
>
> On Fri, Oct 28, 2022 at 04:19:29PM -0700, Atish Patra wrote:
> > It is useless to issue remote fences if there is a single core
> > available. It becomes a bottleneck for sbi based rfences where
> > we will be making those ECALLs for no reason. Early code patching
> > because of static calls end up in this path.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
>
> Hey Atish,
> This doesn't apply for me to either fixes or for-next. What branch does
> it apply to?
> Thanks,
> Conor.
>
> > ---
> >  arch/riscv/mm/cacheflush.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> > index f10cb47eac3a..7fafc8c26505 100644
> > --- a/arch/riscv/mm/cacheflush.c
> > +++ b/arch/riscv/mm/cacheflush.c
> > @@ -19,6 +19,10 @@ void flush_icache_all(void)
> >  {
> >       local_flush_icache_all();
> >
> > +     /* No need to issue remote fence if only 1 cpu is online */
> > +     if (num_online_cpus() == 1)
> > +             return;
> > +
> >       if (IS_ENABLED(CONFIG_RISCV_SBI) && !riscv_use_ipi_for_rfence())
> >               sbi_remote_fence_i(NULL);
> >       else
> > --
> > 2.34.1
> >

Sorry I forgot to specify the dependencies for this patch. This patch
is based on Anup's IPI series [1] as
I assumed the IPI series would go first. I can rebase on top of the
master if required.
However, the issue will manifest only after Jisheng's patch[2] which
moved the sbi_init to earlier and introduced the
static key in the paging_init path.

[1] https://patchwork.kernel.org/project/linux-riscv/patch/20220820065446.389788-8-apatel@ventanamicro.com/
[2] https://lore.kernel.org/lkml/20220716115059.3509-1-jszhang@kernel.org/


--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
