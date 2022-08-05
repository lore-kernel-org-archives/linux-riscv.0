Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F67BC00140
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Aug 2022 16:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5SE0RspCCkzVfCqC2x93o7OeYwptjDZNhFr6n//V9kQ=; b=UmWJbr54udKJIi
	HTrosQFF6u51C85JiA7AqL9T64/rz0QOpM2tKk5jNdVM8BHyGJqn6WithubtjumkkdJnD+x1/GVVx
	x+JZzuXH/nyoNnzRjD5yeomTyKJQFaC9CbYEv2M1Z31vWM0HIxX2pIngrFjefk9tAhZXLTlUfM0gQ
	RkKP/P/xLsrPVjM15g2fz+fP79AZJuWZdWby5pS5O4dKwppsWreVGanhW86ty4NS7ajigH/7OWfkh
	XM2MwI9tDo/Oq1aIWOtRKVpyrz4ovWNleLhtffhBH0U7o+99K2iaAL9qlfF88/+l1mxWqJAGSOfEM
	ZLzy55lYsdbRkTN4NuBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK01I-00Gfls-2X; Fri, 05 Aug 2022 16:17:52 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK01E-00Gfi9-Ul
	for linux-riscv@lists.infradead.org; Fri, 05 Aug 2022 16:17:50 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-31f443e276fso29080897b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Aug 2022 09:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=eU9F5KTyLXS6Ehm35W4ZJ4KkazoKzToP1yWNY4wU9Kg=;
        b=OTIMcxvVmtHvZYnx9w+o/IIVHMVnFTjtZpg0iBHBJF/Skq2sQZgscB+aLiUJLN0sfj
         ysp6VTKukTmrHLmujjUvOzPbY2bFxqoHBmuaRFR/pAJBoyv7X1Nu520OafIyx6Qr6bOV
         +R3D5siCAJFSmOozQy6OIy6w4KtvhRp01pfrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=eU9F5KTyLXS6Ehm35W4ZJ4KkazoKzToP1yWNY4wU9Kg=;
        b=VkufBRvxHItwF/vh/pUpSuKSiHwf1s+lU7VgX1SPSyL6Kc+ExNXKwiBWXqUkeu7QqW
         FLVk7gZLGwrcXxWTQVapHuFOBVl/RQjRyR2n/cYleEtEprL0wLdl38RkzCgJcEzAABIi
         lsv9jQcO6oBniTbMx2XVHvQJSfWxWZlAYknA6kfVGgESg0t2EOMWFqO/ODo65zH0Ix0I
         UOpVgc9tLrdOQrGzdDcMWtqj1+OoPOallK4tTVMuoCQ8kOjTd+cnh6KINU6UByZ/rgvA
         m+vFd5C/kkmKwljIA+xawBy0uqPM7gVPRi4DZY0H3OwSpySTwrH7SRIfvas+H38f+GpT
         fVkw==
X-Gm-Message-State: ACgBeo1FcWvSYbfY4nJ5nWDNYhDlWS9ZOfVixXAKykMHhmvz7Kv/g8s9
	tkPeR65YedLtlM+4J6/jVK4lJVg+tab13qlfaYYv
X-Google-Smtp-Source: AA6agR62cKws3SRTlgdcM1pts0cZpN6r3mdMoI/TrJcr4NwaVIxxT+6rUb3vilx/LYfVks/NtNXlI1usDhozpgqRr64=
X-Received: by 2002:a81:5251:0:b0:31f:56c6:b69 with SMTP id
 g78-20020a815251000000b0031f56c60b69mr6801352ywb.75.1659716265625; Fri, 05
 Aug 2022 09:17:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220722165047.519994-1-atishp@rivosinc.com> <20220722165047.519994-4-atishp@rivosinc.com>
 <CAOnJCUK1JppQkZ+bv7mNpCm95i3gGZ5wHaRc2wiBGyp3zj2Dhw@mail.gmail.com>
In-Reply-To: <CAOnJCUK1JppQkZ+bv7mNpCm95i3gGZ5wHaRc2wiBGyp3zj2Dhw@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 5 Aug 2022 09:17:35 -0700
Message-ID: <CAOnJCUJrwVim1c8BpLYrHUAhHc-jO8w_wV5EuBc_3DhSb8DjLQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] RISC-V: Prefer sstc extension if available
To: Stephen Boyd <sboyd@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, Atish Patra <atishp@rivosinc.com>, 
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Tsukasa OI <research_trasio@irq.a4lg.com>, 
	Wei Fu <wefu@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_091749_002983_E0B70E8D 
X-CRM114-Status: GOOD (  24.76  )
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

On Mon, Jul 25, 2022 at 10:49 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Fri, Jul 22, 2022 at 9:50 AM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > RISC-V ISA has sstc extension which allows updating the next clock event
> > via a CSR (stimecmp) instead of an SBI call. This should happen dynamically
> > if sstc extension is available. Otherwise, it will fallback to SBI call
> > to maintain backward compatibility.
> >
> > Reviewed-by: Anup Patel <anup@brainfault.org>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  drivers/clocksource/timer-riscv.c | 25 ++++++++++++++++++++++++-
> >  1 file changed, 24 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> > index 593d5a957b69..05f6cf067289 100644
> > --- a/drivers/clocksource/timer-riscv.c
> > +++ b/drivers/clocksource/timer-riscv.c
> > @@ -7,6 +7,9 @@
> >   * either be read from the "time" and "timeh" CSRs, and can use the SBI to
> >   * setup events, or directly accessed using MMIO registers.
> >   */
> > +
> > +#define pr_fmt(fmt) "riscv-timer: " fmt
> > +
> >  #include <linux/clocksource.h>
> >  #include <linux/clockchips.h>
> >  #include <linux/cpu.h>
> > @@ -20,14 +23,28 @@
> >  #include <linux/of_irq.h>
> >  #include <clocksource/timer-riscv.h>
> >  #include <asm/smp.h>
> > +#include <asm/hwcap.h>
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
> > @@ -165,6 +182,12 @@ static int __init riscv_timer_init_dt(struct device_node *n)
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
> Hi Stephen,
> Can you please review this whenever you get a chance ? We probably
> need an ACK at least :)
>

Ping ?

> --
> Regards,
> Atish



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
