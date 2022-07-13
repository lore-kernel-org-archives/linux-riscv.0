Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD71EC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 00:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lY8U8XBlczpoatXMrD9MfKdVXza5EIue+nIKcfOckfw=; b=okmW1IPA/ob8oW
	BrbzAsOp2Q71jvDgfoTRNETYsBwJjSwxUEjwCUj9rrlAlAcN6TrajyxUr8RwPrEF3UhFy/+C5n+HE
	kHevUAQE7a57kU9didZmg5K4ZbiuBGTcvFzdIxfeugpmYOdiXH00ioo6khWZrfSOGkxHerS8vrY+/
	Ru3dXBqSYZUWhxUKY50P0oXEQEbrPnzqQqeYOYr4dFrKx/V6iAwqQuSJrrFCSRbKpmO8BNUVsJxr9
	DGjZGLTsp6Ai7shIQSYDd2HIfiLcfJnVDCxFs8wmXQzSrZB2Wmj+fwlGfya/1Ml+MIzMuJUsGaTpA
	YSmMLhlEn7MtJ1JwazYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBQj7-00GEdL-0n; Wed, 13 Jul 2022 00:59:41 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBQj4-00GEcM-Pb
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 00:59:40 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-31cf1adbf92so98385027b3.4
        for <linux-riscv@lists.infradead.org>; Tue, 12 Jul 2022 17:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WqN1QHBzvti+0lVyyWV1S23p89qD8aBbro8MStNOt78=;
        b=kbpMYiA+iStsAIbT0nJKIuTEYxt/RBhcxYW8JmbvIGs3vZ40ppvr4mU4pVidRkbjVV
         a3/woskn+7+b3CVAclFOh92YbnuUepLn0IPqn4yACRL70ehZYOoa9Sk63lbq5OmUM7qu
         HsTYkr9kIq5Twitt/cPsdXqY4v4RrF2znvgJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WqN1QHBzvti+0lVyyWV1S23p89qD8aBbro8MStNOt78=;
        b=Xoi62tWcr54mVep8KGJ5GNQM5/f9n12kHdJjLvHyIpzccfZM5Jg8QYVNz+NOpaMuVp
         I71GVM2oVsK7XSSKyukfSYEgKPH0r9dvoamvJSjyxVEs9Mj7sy2qCFxMte8/DNg2V1qV
         32hlFxRmjyrXjpipt5CTJ5VMKXRB2mumcRSDBRmcGycit69Cu0vLlbkBJJGotWmmjqUl
         v+O43ErxboYBfGoYi1mfwDcFG2X4SqSbLkcvbHOykAdRWSH3zP1jumJIsNWjf8QLY5cp
         2qJlz351Tt19qsiEW65sisB1+HjtnNCSYzr9XcU2KMBkBlbuNc0noO+RHO/9UEBZr0Gy
         ut0A==
X-Gm-Message-State: AJIora/0ETC9qN0/0iBG9dKneyEsesEIQ/L7hAVWLQ4n1BAb/qBG/3RU
	B2/gwoXImo8GXICK1QexxrtfGVt9zrkWR6qzBIqr
X-Google-Smtp-Source: AGRyM1tt2J4Rz+9oIsBC4s4Tj6wg7vJS7LMWJaUkK/CkI/Z4pP6eZRLAOiwNr1AzlAeyVgsBljFFKBbd7/lUs6uU2Pg=
X-Received: by 2002:a81:9acd:0:b0:31d:2fd7:3331 with SMTP id
 r196-20020a819acd000000b0031d2fd73331mr1321961ywg.145.1657673975643; Tue, 12
 Jul 2022 17:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220711174632.4186047-1-atishp@rivosinc.com> <20220711174632.4186047-3-atishp@rivosinc.com>
 <CAJF2gTT=0S-_nCM-+SHUNkG0i-h1zBca_KwgRgsZ8BBE-DPG_w@mail.gmail.com>
In-Reply-To: <CAJF2gTT=0S-_nCM-+SHUNkG0i-h1zBca_KwgRgsZ8BBE-DPG_w@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 12 Jul 2022 17:59:25 -0700
Message-ID: <CAOnJCUKj5SU=wu6x1G4ZU-P1tK6uJUz79ZUcSV9jZZdbvwH3pA@mail.gmail.com>
Subject: Re: [v3 2/5] RISC-V: Update user page mapping only once during start
To: Guo Ren <guoren@kernel.org>
Cc: Atish Patra <atishp@rivosinc.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Anup Patel <anup@brainfault.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_175939_034279_7BB62BFA 
X-CRM114-Status: GOOD (  20.85  )
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

On Mon, Jul 11, 2022 at 6:54 PM Guo Ren <guoren@kernel.org> wrote:
>
> Good catch, Is there any bug report?
>

Not that I know of.

> Anyway:
> Reviewed-by: Guo Ren <guoren@kernel.org>
>
>
> On Tue, Jul 12, 2022 at 1:46 AM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > Currently, riscv_pmu_event_set_period updates the userpage mapping.
> > However, the caller of riscv_pmu_event_set_period should update
> > the userpage mapping because the counter can not be updated/started
> > from set_period function in counter overflow path.
> >
> > Invoke the perf_event_update_userpage at the caller so that it
> > doesn't get invoked twice during counter start path.
> >
> > Fixes: f5bfa23f576f ("RISC-V: Add a perf core library for pmu drivers")
> >
> > Reviewed-by: Anup Patel <anup@brainfault.org>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  drivers/perf/riscv_pmu.c     | 1 -
> >  drivers/perf/riscv_pmu_sbi.c | 1 +
> >  2 files changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
> > index b2b8d2074ed0..130b9f1a40e0 100644
> > --- a/drivers/perf/riscv_pmu.c
> > +++ b/drivers/perf/riscv_pmu.c
> > @@ -170,7 +170,6 @@ int riscv_pmu_event_set_period(struct perf_event *event)
> >                 left = (max_period >> 1);
> >
> >         local64_set(&hwc->prev_count, (u64)-left);
> > -       perf_event_update_userpage(event);
> >
> >         return overflow;
> >  }
> > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> > index 0cb694b794ae..3735337a4cfb 100644
> > --- a/drivers/perf/riscv_pmu_sbi.c
> > +++ b/drivers/perf/riscv_pmu_sbi.c
> > @@ -532,6 +532,7 @@ static inline void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
> >                         sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx, 1,
> >                                   flag, init_val, 0, 0);
> >  #endif
> > +                       perf_event_update_userpage(event);
> >                 }
> >                 ctr_ovf_mask = ctr_ovf_mask >> 1;
> >                 idx++;
> > --
> > 2.25.1
> >
>
>
> --
> Best Regards
>  Guo Ren



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
