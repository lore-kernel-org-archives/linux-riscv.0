Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6519DC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Dec 2021 23:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4N4umEZXXmXMVqFveDwLjiuzyGQXICti0F3C3UjWRzA=; b=nuEhhhIwsowzsL
	2OQ8cRzhX6Ju4jfby2QD+ClniN1fde4uOUVA5jzZjcc/wbGxho45qVB86prFzC8s+E9CDLmYJ7Nwv
	G6uqZun2xrBnaAY445Ki/UBuft/np+TwwVML/Zughgs66LnoSMQPetPAMAZJ6f/2EUSek36wDk/qs
	jgM1PkqbZfb3dMc4ciNCXuOoioLCpdJ2L8IlyBlamFHZkMwBmSEQV52oUFCeN0GV1h/fRsvKMbGrM
	0fEAezevrFbgh63CUJ5cYN6PeEPHsvOWgfeI/p70bp7j18/dr2H477+bjXVwEOucaK52N947rUMSd
	2t/AQVBPQh2+TntFk3LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msvtE-00DltZ-1W; Thu, 02 Dec 2021 23:53:24 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msvtB-00Dlro-72
 for linux-riscv@lists.infradead.org; Thu, 02 Dec 2021 23:53:22 +0000
Received: by mail-yb1-xb34.google.com with SMTP id v138so4124561ybb.8
 for <linux-riscv@lists.infradead.org>; Thu, 02 Dec 2021 15:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GjnhpoOnL0nkUK8e5tH0LkfP8VbI2oHbCLG5idnU41o=;
 b=R9wYIUGoiyqMk8vE5PZPKlctyumb/X9DjtLfnAeJish6hTZtgeAleRmwUfy/GoqYCc
 VmHGLofVfG8x1QjRAV3pq/7MwjfGlGfRomZ8Y9pgekAwhFa5nLAropltKTefhqPiYmFo
 lVe9u5VIh64uMq7ZrWR4tmlEhC77opQARLvok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GjnhpoOnL0nkUK8e5tH0LkfP8VbI2oHbCLG5idnU41o=;
 b=1CW5J04AfmhHoJC2bJPCia58EorKM2BemEuDrR0fTZqTQ1V5Jb+fkdxFDPHN51VM7g
 outBdO8PNhTygZjFb0+/FKL9Uy0bbmBSnfM1usaBSYnafL2OCrEMwzfPdd6GpLNQZwUg
 /qR1RImQw7RWn3NIcDmzrqOzmVTYwnZ8SbmagfxEe5lTkuVJroQSYUwHX3na5hg1kZdI
 Klc52DRk08cKIaD5LDBu/rW6LcFo1iEUcUhejJx65AfOCJHA2xrR5L5cXc67BrKu5l4A
 gsIcy9KrMW7r2x5zioVjIzkeN5edqwlUJGsvFzar3KBndf8nvFaWMQcgy6v8+Om3FsPd
 KhUQ==
X-Gm-Message-State: AOAM531cj6BXA7gMlwBKcc1pncn/aGlTVNLYJWcPvXgBMjLGimfzNIaa
 wV943NaYLtD014je0GGIhbLo36IgsgVi0JaoKsRs
X-Google-Smtp-Source: ABdhPJxGOTvuNsg6p3sZclfRacsRfmO5tG8iNLa4qQJz2JVMpMi1C+9HpXvOg5o0qHggToRlwtgmNxUkEQUdBKhDLTg=
X-Received: by 2002:a25:bbc4:: with SMTP id c4mr17772662ybk.309.1638489199611; 
 Thu, 02 Dec 2021 15:53:19 -0800 (PST)
MIME-Version: 1.0
References: <20211126193111.559874-1-atishp@atishpatra.org>
 <CAAhSdy0bKWCBT+b1w1Z5YO+Vq8xYgyYQoR8yvPK2SuK=VXwWXw@mail.gmail.com>
In-Reply-To: <CAAhSdy0bKWCBT+b1w1Z5YO+Vq8xYgyYQoR8yvPK2SuK=VXwWXw@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 2 Dec 2021 15:53:08 -0800
Message-ID: <CAOnJCU+K=nWQu=6NFAJzjPFE=UYCsr=KWzXZxBXYYji3vSSPVA@mail.gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: Update Atish's email address
To: Anup Patel <anup@brainfault.org>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Anup Patel <anup.patel@wdc.com>, 
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_155321_335423_8296FBFC 
X-CRM114-Status: GOOD (  17.83  )
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

On Thu, Dec 2, 2021 at 12:50 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Sat, Nov 27, 2021 at 1:01 AM Atish Patra <atishp@atishpatra.org> wrote:
> >
> > I am no longer employed by western digital. Update my email address to
> > personal one and add entries to .mailmap as well.
> >
> > Signed-off-by: Atish Patra <atishp@atishpatra.org>
> > ---
> >  .mailmap    | 3 +++
> >  MAINTAINERS | 2 +-
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/.mailmap b/.mailmap
> > index 14314e3c5d5e..5878de9783e4 100644
> > --- a/.mailmap
> > +++ b/.mailmap
> > @@ -50,6 +50,9 @@ Archit Taneja <archit@ti.com>
> >  Ard Biesheuvel <ardb@kernel.org> <ard.biesheuvel@linaro.org>
> >  Arnaud Patard <arnaud.patard@rtp-net.org>
> >  Arnd Bergmann <arnd@arndb.de>
> > +Atish Patra <atish.patra@wdc.com>
> > +Atish Patra <atishp@atishpatra.org>
> > +Atish Patra <atishp@rivosinc.com>
>
> I think you just need one-line entry to map WDC email (OLD) to
> Personal/Rivos email (NEW)
>
> Something like:
> Atish Patra <atishp@atishpatra.org> <atish.patra@wdc.com>
>

Well, I saw both kinds of entries (multiline & single line) entries
throughout the .mailmap.
Thus, I assumed both would work fine.

I will send v3 with a single line entry right away.

> Regards,
> Anup
>
> >  Axel Dyks <xl@xlsigned.net>
> >  Axel Lin <axel.lin@gmail.com>
> >  Bart Van Assche <bvanassche@acm.org> <bart.vanassche@sandisk.com>
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 7a2345ce8521..b22af4edcd08 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -10434,7 +10434,7 @@ F:      arch/powerpc/kvm/
> >
> >  KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)
> >  M:     Anup Patel <anup.patel@wdc.com>
> > -R:     Atish Patra <atish.patra@wdc.com>
> > +R:     Atish Patra <atishp@atishpatra.org>
> >  L:     kvm@vger.kernel.org
> >  L:     kvm-riscv@lists.infradead.org
> >  L:     linux-riscv@lists.infradead.org
> > --
> > 2.33.1
> >
> >
> > --
> > kvm-riscv mailing list
> > kvm-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kvm-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
