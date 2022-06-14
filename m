Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3169C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jun 2022 17:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UononCYbk6FNT+4U8DBHMm4dcZ6GYiCpXKm8hpv3xv0=; b=EVsvhrd4sJVcJy
	u3wUkRNO45S4rQGmWEI4uRjupJignB/FhiuXfEVR9y+AJYDWaatEMJTIuwEepP58AxKQopZwBDPXE
	4HhUDrv8srsDJ2Q2WebjTclhu4PzpUpNRB5d3P4C+8gm2wWas0pt0sZJNTlpDPrD+d7KRSuyXTspn
	eUaNZ1MnSVazeDjoxEp9Bglyf2jRkj7Y+yinQH3knnqSfn/mKkX4S4S/S3HAYcjgt5niYCSNRhHuP
	YHChAtTHDnxG27M0lX2u6GABrd0jl/r/klv4mgEvmH4x9DhGg+EVm5c5aRLY1Lg2HANuJZ0vup6Uf
	BFcSBWnWWEnH+mM1tmaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1AfE-00Ackz-JT; Tue, 14 Jun 2022 17:49:16 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1AfB-00Acjj-Si
	for linux-riscv@lists.infradead.org; Tue, 14 Jun 2022 17:49:15 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-31336535373so37841607b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jun 2022 10:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b6GogiLvLlJyAw9fEai9KHL7CPWrIDSYkmrligLXeM0=;
        b=B+GgFxGSs58Fp+QAQlXmzpKdMTZABypU787d0qHLoDzxlJqoJ1k4nsrK+GLVFQ+4yb
         VOslI8mnRQ0TpcM6WUwdqCuagPSOtMOkoZw+N9XdOxR5RdGpaoCySoJRza5pOrlznLf8
         Qf8S94NeqjsFaIMJTAYxJ8xwx83GP+BwppPgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b6GogiLvLlJyAw9fEai9KHL7CPWrIDSYkmrligLXeM0=;
        b=TY8U5D3+4650gC4WR6Ly6nD9dtbauu7crcpj4/8po1cf996mxsf61DAj4IJY5PHhYm
         vUvs1ut0V3o5xfeo6OwXENCDcIBN+rNBVKqFRbJ55Xu1CoBA+qRg+SsY1E2g7mkVnlEn
         CPSMIMQ5iZWTqZZ2lDtqKZxwCQV+sRotj+fDsIJayKU1WxkrCkyK7iMQ5CQva1oBEWTz
         ymbwG9I5IK291IzAW738oi9XbgQEYHbgfNllje6AKvvIrQP3qosMEa23O26lNwnfRuQ6
         TsUd+mWZVhp1l0V3rEetNH9bREKlHOHEPiNpSum+EJdu8hSXDHrtQRYduKPnq50AxXtJ
         1MQg==
X-Gm-Message-State: AJIora8jMgrYXby7z5cBJHqdM18+vRWQSDZqFSlGDsmI/YiLNYVrPjzC
	TX329Zk3Yusc3EPyIabbQvVDGvB8y51y0JsgfMd5
X-Google-Smtp-Source: AGRyM1sDcCfjFf4ocWAHLB7HhdEhMNAAc6F+Hg5b93YIV7qtybRZKmiB4D49bQzzzntxupZcf8hBdRtdbAb6gItu9r0=
X-Received: by 2002:a81:1c08:0:b0:30c:cb78:8ae2 with SMTP id
 c8-20020a811c08000000b0030ccb788ae2mr7150978ywc.194.1655228951516; Tue, 14
 Jun 2022 10:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220527042937.1124009-1-atishp@rivosinc.com> <20220527042937.1124009-4-atishp@rivosinc.com>
 <CAAhSdy3DXobZK-QSJ9tvG+hLEOD_dz4eqD7yO=Pna1ghhMghKQ@mail.gmail.com>
In-Reply-To: <CAAhSdy3DXobZK-QSJ9tvG+hLEOD_dz4eqD7yO=Pna1ghhMghKQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 14 Jun 2022 10:49:00 -0700
Message-ID: <CAOnJCUJgV8zBca+m8q2CrCLdkp3ycwVSn6bOUYyCodh1MUKVGA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] RISC-V: Prefer sstc extension if available
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atishp@rivosinc.com>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_104914_183480_FCD1E3AC 
X-CRM114-Status: GOOD (  24.71  )
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

On Thu, Jun 9, 2022 at 9:41 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, May 27, 2022 at 9:59 AM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > RISC-V ISA has sstc extension which allows updating the next clock event
> > via a CSR (stimecmp) instead of an SBI call. This should happen dynamically
> > if sstc extension is available. Otherwise, it will fallback to SBI call
> > to maintain backward compatibility.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  drivers/clocksource/timer-riscv.c | 24 +++++++++++++++++++++++-
> >  1 file changed, 23 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> > index 1767f8bf2013..881d9335c92d 100644
> > --- a/drivers/clocksource/timer-riscv.c
> > +++ b/drivers/clocksource/timer-riscv.c
> > @@ -7,6 +7,9 @@
> >   * either be read from the "time" and "timeh" CSRs, and can use the SBI to
> >   * setup events, or directly accessed using MMIO registers.
> >   */
> > +
> > +#define pr_fmt(fmt) "timer: " fmt
>
> The "timer: " prefix is too generic. I suggest to use "riscv-timer: "
> as a prefix.
>

Sured. Fixed in the next version.

> > +
> >  #include <linux/clocksource.h>
> >  #include <linux/clockchips.h>
> >  #include <linux/cpu.h>
> > @@ -23,11 +26,24 @@
> >  #include <asm/sbi.h>
> >  #include <asm/timex.h>
> >
> > +static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
> > +
> >  static int riscv_clock_next_event(unsigned long delta,
> >                 struct clock_event_device *ce)
> >  {
> > +       u64 next_tval = get_cycles64() + delta;
> > +
> >         csr_set(CSR_IE, IE_TIE);
> > -       sbi_set_timer(get_cycles64() + delta);
> > +       if (static_branch_likely(&riscv_sstc_available)) {
> > +#if defined(CONFIG_32BIT)
> > +               csr_write(CSR_STIMECMP, next_tval & 0xFFFFFFFF);
> > +               csr_write(CSR_STIMECMPH, next_tval >> 32);
> > +#else
> > +               csr_write(CSR_STIMECMP, next_tval);
> > +#endif
> > +       } else
> > +               sbi_set_timer(next_tval);
> > +
> >         return 0;
> >  }
> >
> > @@ -165,6 +181,12 @@ static int __init riscv_timer_init_dt(struct device_node *n)
> >         if (error)
> >                 pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
> >                        error);
> > +
> > +       if (riscv_isa_extension_available(NULL, SSTC)) {
> > +               pr_info("Timer interrupt in S-mode is available via sstc extension\n");
> > +               static_branch_enable(&riscv_sstc_available);
> > +       }
> > +
> >         return error;
> >  }
> >
> > --
> > 2.25.1
> >
>
> Apart from the minor comment above, this looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>
>
> Regards,
> Anup



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
