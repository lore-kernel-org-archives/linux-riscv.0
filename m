Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BD3C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 00:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7NJbywV5BezaVT2Z36kFXdFas4MyBgsIKUF8/Tkc5t8=; b=2hFpJ2qy8YTHdg
	s8xswA3hceSRzWZts0+hQjdZh/dliDLWcsYUmWmJnpOBPw06YJiurFzAr0xkWb8buRq4U0WN/rAr6
	djj+BzC3qyRZ9E3Mm7xLM/WYJwRIdYj7hsWVZhIXyghTUEQbj+I8UqEz1Oq1zIrMH5WoeCriuAgK5
	N/oN0JV6tGNMJJ1VD2yfkxMAi9HJcGJsL4WxPeu1ewMeCKYvpotO7KQT9+SlD/VQvXEOLJLIRXRVr
	FLJPmZyuGPano8S9h5qu+/Unkdw3Lbi+R+3fqGn+q/w3PGu2lXQBYhaTKDXeXvNFcepPJEwhAhY8U
	s7A5ONnTjT754S9Z5CPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxH38-001VnA-3g; Tue, 22 Nov 2022 00:22:06 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxH34-001VlP-MN
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 00:22:04 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id r76-20020a4a374f000000b004988a70de2eso2038141oor.2
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 16:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8ioT5HWkxXrDzWROXcjL6RfDxD0eZFMTpXcJlr218K8=;
        b=iYjmeDp35xqIzxQZueXI5DTZPLBzYLZ5PAM/AQvCGEF1SjrTAhxQ6zziaTWWvV5ylD
         gm9NdiH5PB24JSy6RsceIWUrOZkmtw1Yn8f+tLuh5EqgCZvzvNDQb4LcyMdSMx85yr42
         aPkH2xlJPnvcO8lJA6xc3okcK5790tK9JWuOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ioT5HWkxXrDzWROXcjL6RfDxD0eZFMTpXcJlr218K8=;
        b=cWGqpTpSPCO0GKwZmYoMn6hWwey6BWu6+qeU3/ClN0MW3ujPdOJTIWI21W1xnNiF6T
         wv3QIvy/WMMJr/HrMLXhpaXQdRSHh9qxzq8ZgyDQfRRiXdJi81HzDzvE2UNl4qE0kfqc
         FOamj6CKMGrpYkm9lueP/pCIYm+3bFZnp68lR2wIUiE+v8MrYUL6xfRiM6Wvv+09gTZ5
         sn2UyU1chIidCLG8khsbYoOFd5VDiJKvGePVhAGrXvlZUYRr2mO8yn8GWSkIbvN6hghK
         1kO56T8AOpAWPuStKPdT1hjFWaLG4UXzbLjhuz7nqatla7BifqXUFTA/kWbr1MuLNUym
         zbmw==
X-Gm-Message-State: ANoB5pm8GONiZiMIhN+DWhjELIaxvvwlSawCtKJNhrjCO5mC4L9fMktI
	P240t2x5vFgsyxUuFZ8/vQJFv9kHIG9M8zpznSef
X-Google-Smtp-Source: AA0mqf69iXsrfeMApN6Ed6GVXofzCFLsgz2m/ukM8nkoRc34SK82vu0kCeRUJLZFgn6GaFZOJI/wj/Sa/2LuzKCMrVI=
X-Received: by 2002:a4a:c58a:0:b0:49f:4297:5612 with SMTP id
 x10-20020a4ac58a000000b0049f42975612mr1713954oop.13.1669076520677; Mon, 21
 Nov 2022 16:22:00 -0800 (PST)
MIME-Version: 1.0
References: <20220718170205.2972215-1-atishp@rivosinc.com> <20220718170205.2972215-5-atishp@rivosinc.com>
 <Y2uuQ4wH4dU98K2b@curiosity>
In-Reply-To: <Y2uuQ4wH4dU98K2b@curiosity>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 21 Nov 2022 16:21:49 -0800
Message-ID: <CAOnJCUJogprsp+D2ZH7yEEPr-LOp801LrYTwjg0EEoKaYfPV-Q@mail.gmail.com>
Subject: Re: [RFC 4/9] RISC-V: KVM: Improve privilege mode filtering for perf
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_162202_748991_E7B3FFE6 
X-CRM114-Status: GOOD (  16.33  )
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

On Wed, Nov 9, 2022 at 5:42 AM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> Hi Atish,
>
> > Currently, the host driver doesn't have any method to identify if the
> > requested perf event is from kvm or bare metal. As KVM runs in HS
> > mode, there are no separate hypervisor privilege mode to distinguish
> > between the attributes for guest/host.
> >
> > Improve the privilege mode filtering by using the event specific
> > config1 field.
>
> ... [snip]
>
> > +static unsigned long pmu_sbi_get_filter_flags(struct perf_event *event)
> > +{
> > +     unsigned long cflags = 0;
> > +     bool guest_events = false;
> > +
> > +     if (event->attr.config1 & RISCV_KVM_PMU_CONFIG1_GUEST_EVENTS)
> > +             guest_events = true;
> > +     if (event->attr.exclude_kernel)
> > +             cflags |= guest_events ? SBI_PMU_CFG_FLAG_SET_VSINH : SBI_PMU_CFG_FLAG_SET_SINH;
>
> IIUC we should inhibit host counting if we want guest events:
>                 cflags |= guest_events ? SBI_PMU_CFG_FLAG_SET_SINH : SBI_PMU_CFG_FLAG_SET_VSINH;
>

guest_events indicate that the user in the guest VM is configured to
exclude the kernel i.e. the guest kernel which
is running in VS mode.
That's why, we have to set  SBI_PMU_CFG_FLAG_SET_VSINH

To inhibit host counting, the user needs to specify exclude_host
and/or exclude_hv which happens below as well.

> > +     if (event->attr.exclude_user)
> > +             cflags |= guest_events ? SBI_PMU_CFG_FLAG_SET_VUINH : SBI_PMU_CFG_FLAG_SET_UINH;
>
> Same here.
>

Same explanation as above.

> > +     if (guest_events && event->attr.exclude_hv)
> > +             cflags |= SBI_PMU_CFG_FLAG_SET_SINH;
> > +     if (event->attr.exclude_host)
> > +             cflags |= SBI_PMU_CFG_FLAG_SET_UINH | SBI_PMU_CFG_FLAG_SET_SINH;
> > +     if (event->attr.exclude_guest)
> > +             cflags |= SBI_PMU_CFG_FLAG_SET_VSINH | SBI_PMU_CFG_FLAG_SET_VUINH;
> > +
> > +     return cflags;
> > +}
>
> Regards,
> Sergey



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
