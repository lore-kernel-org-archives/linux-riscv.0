Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867C2C636CD
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Feb 2023 14:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RdIj8nWlTQvI76c81v7I9N3HQalpLGIORD9ClSjCH/Q=; b=MhjNYL1MuRaUVg
	6aMy+C61ef9mvKsxTUanUjO718n2bXLDiXuG9YX4LEqp9UmbbSZlXMIv+EMLPKKWxS0tDQ/0n4jGl
	Ad75qg11GyrlNK9a61RnJXk+kDrHvG2A1sP30wr7pQANvr48ubSYO0P9n4i5tQshUgfyxFiExV/jr
	I7mJTzKd7TokYkJxyD/HLMSlqDPXiKYT2yI+3Eg0YITkS0RQBW8kep0RctbDfujMIFfaDl2ymG8L1
	qI9zS7k/ADrB8zBi7kZaJTp+7j9+ucPZRM/lDaftkkkj1i7GzCBpHaztrgZD38QJtg65aMbWdOnbk
	iUBKgTjT3nSgUA2TrZLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQURB-00639j-QE; Fri, 10 Feb 2023 14:31:41 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQUR8-00637p-3K
	for linux-riscv@lists.infradead.org; Fri, 10 Feb 2023 14:31:39 +0000
Received: by mail-pj1-x1036.google.com with SMTP id gj9-20020a17090b108900b0023114156d36so9530555pjb.4
        for <linux-riscv@lists.infradead.org>; Fri, 10 Feb 2023 06:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1676039492;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l+Fl/ea9k4MWezTUZ0x9WnUvEIS2Kl3SMNRJmE8axVU=;
        b=PAdZ9YqKptzI8J2c/ZeiNQnUObZz0ALIlrYoAcMCDQBUNrPjvyE8gx+PowaunyE+1h
         IhN97L6BEDaJSNNucpgO/d/wawN9iCl9qbmgq2bZsCAyL8xbf6F0wC4MxAcsDgcJdOlb
         pgA1pHEjHqiHHcTEOGAm/PDpeXZCykdfzIczmfxQbClyhkxX/cRDCmsPUtHGSv0d/tGp
         yz4+bKOIwb+UqxUbu+VJHBQkxyzRCXUEiz96+56zuDr35CqFkp/8t+XMB05Z3tTy33ri
         ZF3orLqWH09NwujoYVDJDa301ZWHzDwhjAE1PimwHEKmODPOrZz3St8xG5lNv3pCVkbi
         Ddgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676039492;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+Fl/ea9k4MWezTUZ0x9WnUvEIS2Kl3SMNRJmE8axVU=;
        b=IjP0uhkWhsrj216ZKSX35MiyQM5DkPLgAZRntwTOksx6Rb2NGB4Q/muEjYB91hvoH5
         Ien37RyY8/2BEea1Z/iIQSJSR2XIoZH6exBa60UEi6T+Pw9taH7Azj9/ldb/ybm6sT2M
         1z5D//T/j0x8L4iN10JapZ8iUsUZg7SkZuQMqoneYp9HJGtW2bt4HVCkUGT04cN3/jic
         FCUfnYPX9mqdWYWRRtLF7CsNd9QhoZcXzZpy8L7poVHFmZ1ub2hVjHpZL1xE2qjXvgGP
         95cuAhjURmHHrP/3I4nn38dh9VnnbzNsC876IR6fXZ7SVhqzeXh6aYLxbeDsJ/IwS08m
         aE7Q==
X-Gm-Message-State: AO0yUKWkspBrfZWEnr3fHyYseNSn4Y86qs3SmIOQOqBEcrQ6WR5MQGzX
	VdgZJstJtgnUdQwR6zMZV7vWTUhFRuLrwPgm447gSw==
X-Google-Smtp-Source: AK7set9xWHNc5kH6eusn88GsCvBUTVNlmU8X2oBVvokr6b8aMES545MC5WwCpRyUQES38Cx/tATSpTnjI3OYuKITVy4=
X-Received: by 2002:a17:902:ea0e:b0:196:64bf:ed7a with SMTP id
 s14-20020a170902ea0e00b0019664bfed7amr3669726plg.29.1676039492491; Fri, 10
 Feb 2023 06:31:32 -0800 (PST)
MIME-Version: 1.0
References: <20230210135136.1115213-1-rkanwal@rivosinc.com> <CAK9=C2VzZZLqOd_4gok5QMwmwz9NKYyVmDCzmCA7spohbq_zXg@mail.gmail.com>
In-Reply-To: <CAK9=C2VzZZLqOd_4gok5QMwmwz9NKYyVmDCzmCA7spohbq_zXg@mail.gmail.com>
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Fri, 10 Feb 2023 14:31:21 +0000
Message-ID: <CAECbVCts9EH2jBi0Mj2d+yucSSZ+ipB6ozbPkr-M2svNpRcCHA@mail.gmail.com>
Subject: Re: [PATCH 1/1] riscv/kvm: Fix VM hang in case of timer delta being zero.
To: Anup Patel <apatel@ventanamicro.com>
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_063138_185869_129A5D0E 
X-CRM114-Status: GOOD (  21.84  )
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

On Fri, Feb 10, 2023 at 2:07 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> On Fri, Feb 10, 2023 at 7:21 PM Rajnesh Kanwal <rkanwal@rivosinc.com> wrote:
> >
> > In case when VCPU is blocked due to WFI, we schedule the timer
> > from `kvm_riscv_vcpu_timer_blocking()` to keep timer interrupt
> > ticking.
> >
> > But in case when delta_ns comes to be zero, we never schedule
> > the timer and VCPU keeps sleeping indefinitely until any activity
> > is done with VM console.
> >
> > This is easily reproduce-able using kvmtool.
> > ./lkvm-static run -c1 --console virtio -p "earlycon root=/dev/vda" \
> >          -k ./Image -d rootfs.ext4
> >
> > Also, just add a print in kvm_riscv_vcpu_vstimer_expired() to
> > check the interrupt delivery and run `top` or similar auto-upating
> > cmd from guest. Within sometime one can notice that print from
> > timer expiry routine stops and the `top` cmd output will stop
> > updating.
> >
> > This change fixes this by making sure we schedule the timer even
> > with delta_ns being zero to bring the VCPU out of sleep immediately.
> >
>
> Please add the Fixes tag here.

Fixed in v2.
https://lore.kernel.org/all/20230210142711.1177212-1-rkanwal@rivosinc.com/T/#t

Thanks
Rajnesh
>
> > Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
> > ---
> >  arch/riscv/kvm/vcpu_timer.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
> > index ad34519c8a13..3ac2ff6a65da 100644
> > --- a/arch/riscv/kvm/vcpu_timer.c
> > +++ b/arch/riscv/kvm/vcpu_timer.c
> > @@ -147,10 +147,8 @@ static void kvm_riscv_vcpu_timer_blocking(struct kvm_vcpu *vcpu)
> >                 return;
> >
> >         delta_ns = kvm_riscv_delta_cycles2ns(t->next_cycles, gt, t);
> > -       if (delta_ns) {
> > -               hrtimer_start(&t->hrt, ktime_set(0, delta_ns), HRTIMER_MODE_REL);
> > -               t->next_set = true;
> > -       }
> > +       hrtimer_start(&t->hrt, ktime_set(0, delta_ns), HRTIMER_MODE_REL);
> > +       t->next_set = true;
> >  }
> >
> >  static void kvm_riscv_vcpu_timer_unblocking(struct kvm_vcpu *vcpu)
> > --
> > 2.25.1
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
