Return-Path: <SRS0=vQx5=OP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 742A0C04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 17:14:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41DF820878
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 17:14:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xq4uxf9M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XK6acA+c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41DF820878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jetNdN1fNwEMsQCLpNV2KkWE4dMw0NN7qYkQ58g2m3s=; b=Xq4uxf9MK2K4Qb
	IpXeveanVfKiDki+C0i5EokBqv6bw5ofcKStXFFZ20zjTWzs7usH2jaUrW2/joE/BczFwQTrfZSjs
	3Tx4c95Myjsd5WogKlJsc208cqEwzQpvP4iK6qXW6qfkc7SorM86TVswrRjK6qNWD2UgrkhtUc8q0
	yR/SJ11ZcJdtnRj2+h/xFjmZZYVlf9AQrKEqC6OnJPF3Nf6jhdJxS4PK6eQ7ITnNe3IXWUqusSq6v
	rpZmaqeFqnrRzOt7zdvo2rBYEE0B0AKGpMS6dkclpOdn9BGAVvFYIgbqUPUoOapTZcGYhbhikuAsX
	7ZCA1BpAM0lyfQfbuUIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUxE9-0007ps-Il; Thu, 06 Dec 2018 17:14:17 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUxE6-0007pJ-VF
 for linux-riscv@lists.infradead.org; Thu, 06 Dec 2018 17:14:16 +0000
Received: by mail-ot1-x342.google.com with SMTP id k98so1112919otk.3
 for <linux-riscv@lists.infradead.org>; Thu, 06 Dec 2018 09:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=edg5vVlFXGfLGKF6ea0U9cQt+wxSKOvI8w0tmoAHM1g=;
 b=XK6acA+c97r6t2PkvrDoiP6rlFEF+Inn3e1uwpmWSKrEPJkLi3VJLJst+oJdwnKp7V
 YfsPWhfn8g6E5cGiXPi7YSEVJLr+ADjPrpGX0FHNpz1PeGj4B97KUWfQF/tskzI9TZJX
 +gcnTu+iIBmhVzKlGbuf9GFvIuTMndiCZD9XJnsZwSgNNqc3HUCiGL544hkoGdjI4Z6w
 RdBEX76mYiAsoAqqaqzX47UgaWZP+xo5AbGT+ADrK977KnP2fOIP0MD+Nik0umjU6NKf
 +c5bAc+B7qFmM+4IJeBJFIhrD8KlzprjMVUx1JZeDgs7dB1JgDnhJiI2kVfWovz6Ay5a
 VB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=edg5vVlFXGfLGKF6ea0U9cQt+wxSKOvI8w0tmoAHM1g=;
 b=umJ82IC3wiKntFFHDJUKSrG/YRrp7qV+EtMHxIqdUGK7MISf4uKj4sp66asGshNnpq
 GYicB1mq4Qt35EsH5Zhd74uERJSwGJtG6NMwJZEZMKmB4rBb5h0C2zRsSPQ32GTmSdVW
 TG5U1HEWOFZ/CuBnRZCMHLQpYHNJZMKWRyRj5vedthTTQrdZg2ldk4pz1vmIst6SUtuZ
 03rDq3ezFnwf47z1qIHQ8YnUDLfFZTSmO5XrJlw7euIPzplSb7K61DpceilQ9pTFiqgm
 EjXKgLYIuYndlKvVPX9slRpVrHJLWmNLox0em3tLMJeQNgtIOiDW0Ry2aTI7irY1XG0o
 xlPA==
X-Gm-Message-State: AA+aEWYXEbP9F1jnnzWn1oFyh4ixPn6sMghweL3ojCajBlvVaXYrU6i2
 1nJ603haQgRAZHgbJEJt1v8gkqRpyedBhtGVazQ=
X-Google-Smtp-Source: AFSGD/VGUYmVQLkXlFeZqsAwdBNVLQqh5v+cf1iRm0axt823IUKHD+7FP9De8x1GjUCcTsi1L52BHmhgh9DfHSfgYec=
X-Received: by 2002:a9d:8e4:: with SMTP id 91mr17941339otf.169.1544116444375; 
 Thu, 06 Dec 2018 09:14:04 -0800 (PST)
MIME-Version: 1.0
References: <20181206150156.28210-1-david.abdurachmanov@gmail.com>
 <20181206150156.28210-3-david.abdurachmanov@gmail.com>
 <CAGXu5jJT4wY9wgCF8gB+tjgH+YQps4eUDVwZoGY=GVmLMpLPxw@mail.gmail.com>
In-Reply-To: <CAGXu5jJT4wY9wgCF8gB+tjgH+YQps4eUDVwZoGY=GVmLMpLPxw@mail.gmail.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Thu, 6 Dec 2018 18:13:52 +0100
Message-ID: <CAEn-LTqOvegggVV8tWO5WUBQ5=8s0Li5xFBwokENQBf6_RLuAA@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: fix syscall_{get,set}_arguments
To: Kees Cook <keescook@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_091415_012884_BA52702D 
X-CRM114-Status: GOOD (  18.81  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, Will Drewry <wad@chromium.org>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 luto@amacapital.net, Green Hu <green.hu@gmail.com>,
 linux-riscv@lists.infradead.org, deanbo422@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 6, 2018 at 5:49 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Dec 6, 2018 at 7:02 AM David Abdurachmanov
> <david.abdurachmanov@gmail.com> wrote:
> >
> > Testing with libseccomp master branch revealed that testcases with
> > filters on syscall arguments were failing due to wrong values. Seccomp
> > uses syscall_get_argumentsi() to copy syscall arguments, and there is a
> > bug in pointer arithmetics in memcpy() call.
> >
> > Two alternative implementation were tested: the one in this patch and
> > another one based on while-break loop. Both delivered the same results.
> >
> > This implementation is also used in arm, arm64 and nds32 arches.
>
> Minor nit: can you make this the first patch? That way seccomp works
> correctly from the point of introduction. :)

Ok. I will do it.

david

>
> -Kees
>
> >
> > Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> > ---
> >  arch/riscv/include/asm/syscall.h | 42 ++++++++++++++++++++++++--------
> >  1 file changed, 32 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> > index bba3da6ef157..26ceb434a433 100644
> > --- a/arch/riscv/include/asm/syscall.h
> > +++ b/arch/riscv/include/asm/syscall.h
> > @@ -70,19 +70,32 @@ static inline void syscall_set_return_value(struct task_struct *task,
> >         regs->a0 = (long) error ?: val;
> >  }
> >
> > +#define SYSCALL_MAX_ARGS 6
> > +
> >  static inline void syscall_get_arguments(struct task_struct *task,
> >                                          struct pt_regs *regs,
> >                                          unsigned int i, unsigned int n,
> >                                          unsigned long *args)
> >  {
> > -       BUG_ON(i + n > 6);
> > +       if (n == 0)
> > +               return;
> > +
> > +       if (i + n > SYSCALL_MAX_ARGS) {
> > +               unsigned long *args_bad = args + SYSCALL_MAX_ARGS - i;
> > +               unsigned int n_bad = n + i - SYSCALL_MAX_ARGS;
> > +               pr_warning("%s called with max args %d, handling only %d\n",
> > +                       __func__, i + n, SYSCALL_MAX_ARGS);
> > +               memset(args_bad, 0, n_bad * sizeof(args[0]));
> > +       }
> > +
> >         if (i == 0) {
> >                 args[0] = regs->orig_a0;
> >                 args++;
> >                 i++;
> >                 n--;
> >         }
> > -       memcpy(args, &regs->a1 + i * sizeof(regs->a1), n * sizeof(args[0]));
> > +
> > +       memcpy(args, &regs->a0 + i, n * sizeof(args[0]));
> >  }
> >
> >  static inline void syscall_set_arguments(struct task_struct *task,
> > @@ -90,14 +103,23 @@ static inline void syscall_set_arguments(struct task_struct *task,
> >                                          unsigned int i, unsigned int n,
> >                                          const unsigned long *args)
> >  {
> > -       BUG_ON(i + n > 6);
> > -        if (i == 0) {
> > -                regs->orig_a0 = args[0];
> > -                args++;
> > -                i++;
> > -                n--;
> > -        }
> > -       memcpy(&regs->a1 + i * sizeof(regs->a1), args, n * sizeof(regs->a0));
> > +       if (n == 0)
> > +               return;
> > +
> > +       if (i + n > SYSCALL_MAX_ARGS) {
> > +               pr_warning("%s called with max args %d, handling only %d\n",
> > +                       __func__, i + n, SYSCALL_MAX_ARGS);
> > +               n = SYSCALL_MAX_ARGS - i;
> > +       }
> > +
> > +       if (i == 0) {
> > +               regs->orig_a0 = args[0];
> > +               args++;
> > +               i++;
> > +               n--;
> > +       }
> > +
> > +       memcpy(&regs->a0 + i, args, n * sizeof(args[0]));
> >  }
> >
> >  static inline int syscall_get_arch(void)
> > --
> > 2.19.2
> >
>
>
> --
> Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
