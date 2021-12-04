Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C50FC433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Dec 2021 22:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z9hHGdoPKihupbGY7yuXfIEGwQqdwOO4FcqvwdpiVos=; b=obuTyQVCQtO2nB
	xLi6CZSI/tc5DigE48AxZ5m9PBKEA1IHsRCgSeot7demL7LWsaf+BLFnClokmeSumX6hHAIFjDrVV
	D4ym+uUvoQNkxOfQc+GWuWCPQujWaF4QWtVbFnme+EnJU2MHs+UFOG3lun6sQOp4LxkqjLqpVh9rW
	6+5pcZBp2xEb8fzVcrfuwjEqXbj5eXdn5kMmorq/xbLcRCfGaHE/EqYTePE1vxDuNkeu52jd0W2w/
	lmx7F+dIqwUQ8zpiy/A97A91nOJzv33OOuirve0K77t5M2HD8Y5WGYKGukywN2AtLmH3DySBhmzH4
	M8mGoBt63SZXOLl+t47A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtdTr-000wW3-1f; Sat, 04 Dec 2021 22:26:07 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtdTl-000wV6-BB
 for linux-riscv@lists.infradead.org; Sat, 04 Dec 2021 22:26:05 +0000
Received: by mail-yb1-xb35.google.com with SMTP id d10so20179300ybe.3
 for <linux-riscv@lists.infradead.org>; Sat, 04 Dec 2021 14:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qcg0aEVPOQ3a95B0ETH9mS6ByVpwHi67XqdndVxxFvQ=;
 b=MIZKLa9Cx6Tf6Bwvb0+Z/17NPkeAlVEgERWE04/qWUXKpJ87fisyXocTBmfjKpOG81
 wvYHxqhY1+FeTsjc27qF8df8RBlVqLtziIjV+DIhO7X4xquPEIl3WJw8zHyMnnj/uVe3
 fxOnRAu44x1xpx4aYqZGVTKaN2Bw4/PxRasS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qcg0aEVPOQ3a95B0ETH9mS6ByVpwHi67XqdndVxxFvQ=;
 b=mZa7XMiJYqE+dTrWezYBFPNJ9WtIIShkzJZ163quE/UL4xy8NwBwA+zfWMN/K8JtMO
 V7XK07u2Ov/WcrCR9WfZsA0Gc66jrLKFffw+1P1WD0yB8O0GifRC/bkpCc2rtcoSyrO0
 4AiIRYTlfnbP9FlMtGgH0zD65shND7Z9L6u/78jMI8tMtGTjTF+HrjK26kPd2ZnpfLNo
 PTwlvfqCX5hL8ckAT4VcVLk6r0kgNpl6tWGaZDrGKcZDiDeH0pCs9ON7mVQXoPW6HABo
 tEgMOxzSZ0uV2ZDbo8K4L5Xyp3YYSBlrsjTe/VnGRSvt4sZiJItG1heVh91xHtJsSvl6
 9trA==
X-Gm-Message-State: AOAM530QHoB7hECiIAurrwowv5maOTogV9/9rUmKBFsC9NEI9wgYWFh7
 v69E1nMlctUgX3YKpr6q5JlMiTY21oHo/XII3wcK
X-Google-Smtp-Source: ABdhPJzVvqa7FoBwJ6nErsYp08ao5SKye++77MfXJmWLigHPRM/FFHyZemC5cgwIIH02w0nZQqrIF0L+JOTATQ4+19c=
X-Received: by 2002:a25:bbc4:: with SMTP id c4mr30734398ybk.309.1638656760120; 
 Sat, 04 Dec 2021 14:26:00 -0800 (PST)
MIME-Version: 1.0
References: <20211202235823.1926970-1-atishp@atishpatra.org>
 <f63e9f1b-4b8e-6c3e-8e21-f9a5f97ca17d@arm.com>
 <CAAhSdy2xRwUmdi7Kc7ZokgB5W1LWKZ7YU-doHZ5dfaVKvzRdUg@mail.gmail.com>
In-Reply-To: <CAAhSdy2xRwUmdi7Kc7ZokgB5W1LWKZ7YU-doHZ5dfaVKvzRdUg@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Sat, 4 Dec 2021 14:25:49 -0800
Message-ID: <CAOnJCULO06SFXuJBXUGsYursBgoJk3bS9c=T9wyu3B-KhQHm3Q@mail.gmail.com>
Subject: Re: [PATCH v3] MAINTAINERS: Update Atish's email address
To: Anup Patel <anup@brainfault.org>
Cc: Steven Price <steven.price@arm.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Anup Patel <anup.patel@wdc.com>, 
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211204_142601_458027_439A2941 
X-CRM114-Status: GOOD (  23.65  )
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

On Fri, Dec 3, 2021 at 8:09 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, Dec 3, 2021 at 9:40 PM Steven Price <steven.price@arm.com> wrote:
> >
> > On 02/12/2021 23:58, Atish Patra wrote:
> > > I am no longer employed by western digital. Update my email address to
> > > personal one and add entries to .mailmap as well.
> > >
> > > Signed-off-by: Atish Patra <atishp@atishpatra.org>
> > > ---
> > >  .mailmap    | 1 +
> > >  MAINTAINERS | 2 +-
> > >  2 files changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/.mailmap b/.mailmap
> > > index 6277bb27b4bf..23f6b0a60adf 100644
> > > --- a/.mailmap
> > > +++ b/.mailmap
> > > @@ -50,6 +50,7 @@ Archit Taneja <archit@ti.com>
> > >  Ard Biesheuvel <ardb@kernel.org> <ard.biesheuvel@linaro.org>
> > >  Arnaud Patard <arnaud.patard@rtp-net.org>
> > >  Arnd Bergmann <arnd@arndb.de>
> > > +Atish Patra <atishp@atishpatra.org> <atish.patra@wdc.com> <atishp@rivosinc.com>
> >
> > I don't think this does what you expect. You can't list more than one
> > email address to replace on the same line. You can use the command "git
> > check-mailmap" to test what happens, e.g. with this change applied:
> >
> >   $ git check-mailmap "<atishp@rivosinc.com>"
> >   <atishp@rivosinc.com>
> >   $ git check-mailmap "<atish.patra@wdc.com>"
> >   Atish Patra <atishp@atishpatra.org>
> >   $ git check-mailmap "<atishp@atishpatra.org>"
> >   <atishp@atishpatra.org>
> >
> > So only your @wdc.com address is translated. If you want to translate
> > the @rivosinc.com address as well you need a second line. As the file says:
>
> Thanks Steve for noticing this. Even, I realized this while queuing the patch.
>
> I have removed @rivosinc.com email address from the patch in my queue. I
> believe Atish currently uses both personal and @rivosinc.com email addresses
> on LKML.
>

Thanks!

> Refer,
> https://github.com/kvm-riscv/linux/commit/2255b100410179bb8151e99e8396debddea0ef1d
> https://github.com/kvm-riscv/linux/commits/riscv_kvm_queue
>
> Regards,
> Anup
>
> >
> > # For format details, see "MAPPING AUTHORS" in "man git-shortlog".
> >
> > Steve
> >
> > >  Axel Dyks <xl@xlsigned.net>
> > >  Axel Lin <axel.lin@gmail.com>
> > >  Bart Van Assche <bvanassche@acm.org> <bart.vanassche@sandisk.com>
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 5250298d2817..6c2a34da0314 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -10434,7 +10434,7 @@ F:    arch/powerpc/kvm/
> > >
> > >  KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)
> > >  M:   Anup Patel <anup.patel@wdc.com>
> > > -R:   Atish Patra <atish.patra@wdc.com>
> > > +R:   Atish Patra <atishp@atishpatra.org>
> > >  L:   kvm@vger.kernel.org
> > >  L:   kvm-riscv@lists.infradead.org
> > >  L:   linux-riscv@lists.infradead.org
> > >
> >



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
