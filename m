Return-Path: <SRS0=QLKY=SA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6193C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 17:52:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD299218A3
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 17:52:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cnW9OJAN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/bvpK8P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD299218A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jWb/iGN4Cpo7FyCbd0NqLoM11gUTK4fZgXEuqi8FTJA=; b=cnW9OJANmC6wHg
	HqWiiTECWDQQJHkTD6hdjzCcCx87uT5o0yRQ+fV/+iO7AyMLUN4vRWlA25qxpg8WtEam3I6bSF8gf
	pPezMXKpVou49Eubm/4YB6frXtp3ukwyJ6remqNpxxVjJhIhUinBVr+7mW3snSIiMy1RObTN0eZbA
	ebyHGS9OWeVTJ/ATqq2+mQTF9kf0Knz5L8rdt2Z52LFIfewule7CpyYR7+LQlUrpW/GJRxtLHyy1k
	3fbuMEwIlOY9MAQGc97QPtvRKu1AWT3G0+WFCoO6VBe43NZ7hoLEKtQIziu4D0y2km2v0zlf/jYeg
	oQzxgCWx54y8U/HZAsyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9vgA-0005Pu-P9; Fri, 29 Mar 2019 17:52:34 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9vg7-0005PV-JB
 for linux-riscv@lists.infradead.org; Fri, 29 Mar 2019 17:52:33 +0000
Received: by mail-io1-xd41.google.com with SMTP id f6so2467390iop.3
 for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2019 10:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y1v+uCgxFSWrPHlA8nDgBEvt4sMWQvF4EIO/pVD58yw=;
 b=c/bvpK8P6hBeKfZVURQ2OhxnVe/RQZH6TP4rxNPzie9GwDFKU7MeGPOnIf6M+5AHtR
 JXSpiFr3gL4PH7bHsoFl7jpMXWJgFotW/zwfIHIaVhUftRoTK9HbUDNVNwyW/XgvQJ9R
 4DrYAx6yNQMPMV7pugW/2BKTmNP1s7epgjY04u6uXTcJKS8pWwFU+0qpcXl1AYxH/4aZ
 +c5z3Or3YSNz0uGL/gVyNXBDJ6fmxzdSY5XefsRq+Dr/sqAJtIGLlqQnCD2Cq36HN8sK
 kZCfQn7GG1vSq3gRBIhcZZeWU8aZ8F3QYynjVYhisK3AB6gt5JX7e0/miCvx1kwc/Tob
 NOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y1v+uCgxFSWrPHlA8nDgBEvt4sMWQvF4EIO/pVD58yw=;
 b=Rv02+VjAuGNGIF9lE8U6I0kt8o0+o23FET3zin4xQa09cNWBkIkqbqyigGcwwGecYN
 e4XEpGrtjURCik5NeLPEsgrG2WKxALu5Ggn2QfIFDWaI0sbg7Mh6+Gbx9h7igY4zek0X
 lpHWAQhxst6MuctmA6zx8EEl2zQBHqYSC9FFd4QJtJoLGG/9+Edi5bOOGY4WurNbKCDl
 DIrRVEh2SrDx6JR+0aD29PQ2nPmkVaBn38hemBkI61nanHeCmFbtYGR/ojnbwempUHCl
 fDI07DJhOGtNBrhO5vOspZIjiVLjgTNro9peQLo+4yJfVL32zLtV9gDdo+qyfhQc9dBN
 nwKQ==
X-Gm-Message-State: APjAAAU7FtXdb1hGQxETB6iKKFi3Gr/SSs7AhN4SeaDjFCjKtrXoV9Zi
 GhWEd/bRLfJjkf0arQz65quDSJTmkwmsICUqJJQ=
X-Google-Smtp-Source: APXvYqxA40FZCF59ajzplwJ7CPQ+psoYYD9KHYi/j+ZPyhjzruwp2MTV7PMNhWY78wnM9XDBaeM6K+ER77VW6r56unM=
X-Received: by 2002:a6b:f813:: with SMTP id o19mr15147750ioh.70.1553881949929; 
 Fri, 29 Mar 2019 10:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190329171221.GA32456@altlinux.org>
 <20190329131514.3e4ec93e@gandalf.local.home>
In-Reply-To: <20190329131514.3e4ec93e@gandalf.local.home>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Fri, 29 Mar 2019 18:52:18 +0100
Message-ID: <CAEn-LTpY6Tto1N9irXJeOb4iB=qSYhb=jM0E=Z9ppumbPX6GSw@mail.gmail.com>
Subject: Re: [PATCH] riscv: fix syscall_get_arguments() and
 syscall_set_arguments()
To: Steven Rostedt <rostedt@goodmis.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_105231_664108_B70EE1A5 
X-CRM114-Status: GOOD (  17.24  )
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
Cc: Will Drewry <wad@chromium.org>, Kees Cook <keescook@chromium.org>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Andy Lutomirski <luto@amacapital.net>, Ingo Molnar <mingo@redhat.com>,
 linux-riscv@lists.infradead.org, "Dmitry V. Levin" <ldv@altlinux.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 29, 2019 at 6:15 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Fri, 29 Mar 2019 20:12:21 +0300
> "Dmitry V. Levin" <ldv@altlinux.org> wrote:
>
> > RISC-V syscall arguments are located in orig_a0,a1..a5 fields
> > of struct pt_regs.
> >
> > Due to an off-by-one bug and a bug in pointer arithmetic
> > syscall_get_arguments() was reading s3..s7 fields instead of a1..a5.
> > Likewise, syscall_set_arguments() was writing s3..s7 fields
> > instead of a1..a5.
>
> Should I add this to my series? And then rebase on top of it?

I have alternative version posted in December part of SECCOMP
patchset which is based on arm64 implementation.

http://lists.infradead.org/pipermail/linux-riscv/2018-December/002450.html

I noticed that SECCOMP wasn't working properly if filters were
checking syscall arguments, because populated arguments were wrong.

Btw, I plan to send v2 of SECCOMP patchset soonish.

david

>
> -- Steve
>
> >
> > Fixes: e2c0cdfba7f69 ("RISC-V: User-facing API")
> > Cc: Steven Rostedt <rostedt@goodmis.org>
> > Cc: Ingo Molnar <mingo@redhat.com>
> > Cc: Kees Cook <keescook@chromium.org>
> > Cc: Andy Lutomirski <luto@amacapital.net>
> > Cc: Will Drewry <wad@chromium.org>
> > Cc: linux-riscv@lists.infradead.org
> > Cc: stable@vger.kernel.org # v4.15+
> > Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
> > ---
> >  arch/riscv/include/asm/syscall.h | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> > index bba3da6ef157..6ea9e1804233 100644
> > --- a/arch/riscv/include/asm/syscall.h
> > +++ b/arch/riscv/include/asm/syscall.h
> > @@ -79,10 +79,11 @@ static inline void syscall_get_arguments(struct task_struct *task,
> >       if (i == 0) {
> >               args[0] = regs->orig_a0;
> >               args++;
> > -             i++;
> >               n--;
> > +     } else {
> > +             i--;
> >       }
> > -     memcpy(args, &regs->a1 + i * sizeof(regs->a1), n * sizeof(args[0]));
> > +     memcpy(args, &regs->a1 + i, n * sizeof(args[0]));
> >  }
> >
> >  static inline void syscall_set_arguments(struct task_struct *task,
> > @@ -94,10 +95,11 @@ static inline void syscall_set_arguments(struct task_struct *task,
> >          if (i == 0) {
> >                  regs->orig_a0 = args[0];
> >                  args++;
> > -                i++;
> >                  n--;
> > -        }
> > -     memcpy(&regs->a1 + i * sizeof(regs->a1), args, n * sizeof(regs->a0));
> > +     } else {
> > +             i--;
> > +     }
> > +     memcpy(&regs->a1 + i, args, n * sizeof(regs->a1));
> >  }
> >
> >  static inline int syscall_get_arch(void)
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
