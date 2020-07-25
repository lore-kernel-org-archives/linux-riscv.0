Return-Path: <SRS0=Z8g5=BE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682BFC433E0
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2020 05:26:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 395CD206C1
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2020 05:26:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1pQ+hW39";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="Q1vZe+rK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 395CD206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aIz7mO86dWDRF1fOZhizVO5fQvhYSPaCOPHK0oIyHIw=; b=1pQ+hW39nsdFXqE/TX7UddLgc
	RT9vLKAluuT8d36YssTNILisxbh00rtakgowyphwMgZl2HbHqm/DklZBcm/oSgDf1tRn5CAsOXtrJ
	ZAH5+2PY0iCOUd5OyNhSMkNyqoaD4qoJhlsb/76IUXwJ6fUcF1wjmj5BU0hD8lnU/zQCru1QWNV4I
	d4Np10pyCbW7csZm+2o/TVo+MaIMtZ2TWgprsKQ+xr4YkUJQeJeJ32bFZyGECBMzkdqNN9C9yo/wZ
	jqXQTOlijP5buYhN0GfLPhIhfbiUZEmMEf2M8rdkltBK8L153UoyuAU2PPmH/j+ThrtV5UTAZcFdj
	p9EznHCDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzChW-0005io-Gl; Sat, 25 Jul 2020 05:26:26 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzChT-0005iS-FV
 for linux-riscv@lists.infradead.org; Sat, 25 Jul 2020 05:26:24 +0000
Received: by mail-wr1-x443.google.com with SMTP id a15so10005520wrh.10
 for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2020 22:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a6p0lVxEnhHsvjplpbb7vWgmumCrMN6gGnNK6UWZILU=;
 b=Q1vZe+rKwyyYjIW6XXvjhhERm0kakS74BuxhRPpXajZcKpBSQrLf4lCSu0NiYL2LFy
 n5RFcUmb062jxXoc9P482sXmu4tvBwwyPReseQpg5qGh/X58CzCvXB/NzsCvuF4EVd8x
 /zgGwj9uZmSfxsS3AdLH+E+vyTeIZLdZ6uLJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a6p0lVxEnhHsvjplpbb7vWgmumCrMN6gGnNK6UWZILU=;
 b=SVe5xH6GU8Z8fU1MjY0STYFB6vKuvs8z198oiZv+3qhATyZw2mubK9eenMfWUKlRHO
 WtnsavOyqhm8a++VB4Yu3NESqSK5Nu3dRtyRBPEw1GV2/ly+SE5HG4RcZTiu5CWgzp9g
 QCiThtz/hCT2t28XU/CZHOOKPppj27X6kz6Y3P5Nz7WgaMI3v19t3GcMnV8T9nUzUBkn
 fQmsHLOgGPfDI/iPcOWL0KU0L1NKXZk3hVWBR+gZxEdfclhNhvXhPjWmJT3eJPf6crSl
 AaOQ29pRud0cop4ToC6A9Kp5bZGmUXizlNBZhb/sZugRYUhCIUFsMl3UddcRYM+8R2rI
 OWbg==
X-Gm-Message-State: AOAM531lCzQtQWA+aqnJkz5gyR5dU6nZMjjoS5LW81Awx7gROe98UWrC
 RNsUOTvkyaXd9VzbYhDEFddNc8VL5K4owlP2SfcI
X-Google-Smtp-Source: ABdhPJwrMR+ET7MBSwIPEVUPSgwSWal0eiCukHggZx1kTuBtHy9ADY6OHBBQ+R7mDwHTpoe4ACM51xX1mQ4QXV1TL1k=
X-Received: by 2002:adf:d84f:: with SMTP id k15mr10836892wrl.176.1595654782356; 
 Fri, 24 Jul 2020 22:26:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200715233009.27183-2-atish.patra@wdc.com>
 <mhng-8ce8d920-4b65-432c-8b51-8d81f55936c0@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-8ce8d920-4b65-432c-8b51-8d81f55936c0@palmerdabbelt-glaptop1>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 24 Jul 2020 22:26:10 -0700
Message-ID: <CAOnJCUL7=i3XXMDJ5vgnNo==3zOANxGEe3ufznAhn7LE7vVAZQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] RISC-V: Setup exception vector early
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200725_012623_560567_16603371 
X-CRM114-Status: GOOD (  24.32  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Vincent Chen <vincent.chen@sifive.com>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <Atish.Patra@wdc.com>,
 Zong Li <zong.li@sifive.com>, sudeep.holla@arm.com,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 24, 2020 at 10:12 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 15 Jul 2020 16:30:06 PDT (-0700), Atish Patra wrote:
> > The trap vector is set only in trap_init which may be too late in some
> > cases. Early ioremap/efi spits many warning messages which may be useful.
> >
> > Setup the trap vector early so that any warning/bug can be handled before
> > generic code invokes trap_init.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  arch/riscv/kernel/head.S    | 10 ++++++++--
> >  arch/riscv/kernel/smpboot.c |  1 -
> >  arch/riscv/kernel/traps.c   |  8 +-------
> >  3 files changed, 9 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> > index 7ed1b22950fd..d0c5c316e9bb 100644
> > --- a/arch/riscv/kernel/head.S
> > +++ b/arch/riscv/kernel/head.S
> > @@ -77,10 +77,16 @@ relocate:
> >       csrw CSR_SATP, a0
> >  .align 2
> >  1:
> > -     /* Set trap vector to spin forever to help debug */
> > -     la a0, .Lsecondary_park
> > +     /* Set trap vector to exception handler */
> > +     la a0, handle_exception
> >       csrw CSR_TVEC, a0
> >
> > +     /*
> > +      * Set sup0 scratch register to 0, indicating to exception vector that
> > +      * we are presently executing in kernel.
> > +      */
> > +     csrw CSR_SCRATCH, zero
> > +
> >       /* Reload the global pointer */
> >  .option push
> >  .option norelax
> > diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> > index 4e9922790f6e..5a9c127a380e 100644
> > --- a/arch/riscv/kernel/smpboot.c
> > +++ b/arch/riscv/kernel/smpboot.c
> > @@ -154,7 +154,6 @@ asmlinkage __visible void smp_callin(void)
> >       mmgrab(mm);
> >       current->active_mm = mm;
> >
> > -     trap_init();
> >       notify_cpu_starting(smp_processor_id());
> >       update_siblings_masks(smp_processor_id());
> >       set_cpu_online(smp_processor_id(), 1);
> > diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> > index 7d95cce5e47c..ad14f4466d92 100644
> > --- a/arch/riscv/kernel/traps.c
> > +++ b/arch/riscv/kernel/traps.c
> > @@ -174,13 +174,7 @@ int is_valid_bugaddr(unsigned long pc)
> >  }
> >  #endif /* CONFIG_GENERIC_BUG */
> >
> > +/* stvec & scratch is already set from head.S */
> >  void trap_init(void)
> >  {
> > -     /*
> > -      * Set sup0 scratch register to 0, indicating to exception vector
> > -      * that we are presently executing in the kernel
> > -      */
> > -     csr_write(CSR_SCRATCH, 0);
> > -     /* Set the exception vector address */
> > -     csr_write(CSR_TVEC, &handle_exception);
> >  }
>
> While I think these are all actual fixes, it's pretty late in the cycle here so
> I'm going to a bit on the careful side and only take the patches that actually
> manifest as bugs in the current port.  Assuming this doesn't manifest until
> early_ioremap is enabled (and we don't do that yet), I've put it on for-next.
>

Yeah. early_ioremap is part of the UEFI series. So this can go into for-next.
Thanks.

> LMK if I'm wrong about this, or the following ones.
>
> Thanks!
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
