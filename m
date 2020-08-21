Return-Path: <SRS0=uNJT=B7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD0FC433E1
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2020 04:07:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DE16206FA
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2020 04:07:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ipRp2SqG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/UAiR9k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DE16206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hiC1JtKY+18P7nwULRZazp4y1/0K48E4kQfvbx+t8gI=; b=ipRp2SqGo9+g9C5ekhnIfEYJH
	3RFjH/vUXzlBrZnUkg6lG8s2XTo9s3BuRNX5LPwNxLk8hFBw64DC3C9UaUi8/10NrnLLIDW38OdK3
	8GONqVxiDsQBaT1reJ+2M88nCEQGpU4xcBwFhrTp7m4DdE6FoAY5DZagJUrUBl5wToMLd6tQotwsn
	b/A4SEYmM/7zMOqB14B0eEZNyIwCIHN2cy/bP2ZrMbx1CEQ7FSflL6X/SlWqvDYuKayX1pyJJK9y1
	aADnTlaKy9goxNKVtI5+yb9c2fS/Rilhzay+nxmxFLc6J4Vt9ILwZUAl8PaQnFG0P06auL5GI5aAk
	E+tbSv3iw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8yKS-000212-EH; Fri, 21 Aug 2020 04:07:00 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yKN-0001wT-AU
 for linux-riscv@lists.infradead.org; Fri, 21 Aug 2020 04:06:58 +0000
Received: by mail-ot1-x343.google.com with SMTP id e11so622479otk.4
 for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2020 21:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xR/1/6/EVS1IRWAIqogz0XeJGQJpb3f9U0wb9rY3bRQ=;
 b=N/UAiR9k05UxuXMT84d8XgZwOSLSl+GWO6G1Q09/FSIe1cuDy383w0gmUfLeNBJouS
 bMwzJpNEzOD3+/EuV0BaOaJG3KJUlEC9VC4PXmx9hc5TpxsQpdgkm3zUTswjspq2l36i
 PKR5zfuC44e6h16V+B9OoN3+bC/jtAszZ3zFzjYE3nRBEUtcf7dLqGb5x7191Rr4a31B
 6s4jraARwL4+XejsX30sOmVWNUtvym+CjNS+mOSJa3TMFIJvI6l8xIeaeEEewzN9lTyn
 5KzAZXmQLpH+pUMvmJdbmKY8lImXX6qpShG2holB8QiSLUSr8h6kUas3SVz0Bzz9JiTE
 3fVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xR/1/6/EVS1IRWAIqogz0XeJGQJpb3f9U0wb9rY3bRQ=;
 b=s91nhYEUHLFcQgGbVKAXuubjDdLKKmTSnxSDVWYipSIkftqG51wrn8xKMS5JPx06if
 8vRH81EsYq5pQVNWSrt6uP2OD44hjMNvhw/gtKHZvrgkXq9XxsVZMsILcUGbJWI0cfJ/
 A0DQHS6EJ0BxGmhb3sDcD9vhhCwVXGvDQZf0Zd1Bhk/oY1j2DmAnOyJQTYi7pc0FIGPF
 TIC9ww0DaWWh+lojwIOTT4D5yeQ4lOtHaZe0JjrkKpNueiki/ueyuMrHoxvWimf4pJSM
 EwsXnyXN4Q1cWdqh7bS18KTJIiGVks4z2NyHd8FozHlw5pIKEp9/7MUuZrQ3KLTU8KpN
 w6VA==
X-Gm-Message-State: AOAM533DzHHov7cN0NjPsH+iKM8Iy9snmMIvKbXriLLT0BMTSN1y7XGz
 eOXX+rvrGRRGQ3eOsw1jA30OtmHBjoiHm8UWJrbQ5lzcW3I=
X-Google-Smtp-Source: ABdhPJz4Y71aLlPf2AMVz6JvEUOM0I7/5s1z0OLIgLM/OCm7XlcblFMeg+y3Ka9Rs2pGqLsyL2mAdM/VN0R6/4WHT1w=
X-Received: by 2002:a9d:20c4:: with SMTP id x62mr653633ota.99.1597982812208;
 Thu, 20 Aug 2020 21:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200819141011.1904770-1-penberg@gmail.com>
 <mhng-22936729-fb29-44c8-bb2d-7aeb31c4e686@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-22936729-fb29-44c8-bb2d-7aeb31c4e686@palmerdabbelt-glaptop1>
From: Pekka Enberg <penberg@gmail.com>
Date: Fri, 21 Aug 2020 07:06:34 +0300
Message-ID: <CAOJsxLHNFh76470xWASaC9QSH=vV9aL16Zy6yDwvj9KD132kqA@mail.gmail.com>
Subject: Re: [PATCH] riscv/mm: Simplify retry logic in do_page_fault()
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_000655_803508_22EC45C6 
X-CRM114-Status: GOOD (  18.12  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Aug 21, 2020 at 6:32 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 19 Aug 2020 07:10:11 PDT (-0700), penberg@gmail.com wrote:
> > From: Pekka Enberg <penberg@kernel.org>
> >
> > Let's combine the two retry logic if statements in do_page_fault() to
> > simplify the code.
> > ---
> >  arch/riscv/mm/fault.c | 20 +++++++++-----------
> >  1 file changed, 9 insertions(+), 11 deletions(-)
> >
> > diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> > index 716d64e36f83..f5c2e4a249eb 100644
> > --- a/arch/riscv/mm/fault.c
> > +++ b/arch/riscv/mm/fault.c
> > @@ -127,17 +127,15 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
> >               BUG();
> >       }
> >
> > -     if (flags & FAULT_FLAG_ALLOW_RETRY) {
> > -             if (fault & VM_FAULT_RETRY) {
> > -                     flags |= FAULT_FLAG_TRIED;
> > -
> > -                     /*
> > -                      * No need to mmap_read_unlock(mm) as we would
> > -                      * have already released it in __lock_page_or_retry
> > -                      * in mm/filemap.c.
> > -                      */
> > -                     goto retry;
> > -             }
> > +     if (unlikely((fault & VM_FAULT_RETRY) && (flags & FAULT_FLAG_ALLOW_RETRY))) {
> > +             flags |= FAULT_FLAG_TRIED;
> > +
> > +             /*
> > +              * No need to mmap_read_unlock(mm) as we would
> > +              * have already released it in __lock_page_or_retry
> > +              * in mm/filemap.c.
> > +              */
> > +             goto retry;
> >       }
> >
> >       mmap_read_unlock(mm);
>
> This is missing your Signed-off-by, and while it's a bit pedantic I can't add
> it myself.  Otherwise
>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
>
> Thanks!

Oh, sorry about that. Here you go:

Signed-off-by: Pekka Enberg <penberg@kernel.org>

I can also resend the patch with a SOB if you so prefer.

- Pekka

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
