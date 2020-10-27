Return-Path: <SRS0=hxxf=EC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A77B1C4363A
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 18:39:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5217720780
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 18:39:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IEFgwy3N";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="lsGwBrEq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5217720780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yxIjNpvP/1QAkzogoK1AevwztlIsmNZs4L2hcLstBf0=; b=IEFgwy3Nqimzbt3L3/jkFM9hK
	xoh6xO4q+voD/59rZcYdoipjs3i04/lXjUbXtRKGsxxATFHfXA/x5wUcSNH3+ZbmzVAycxlWykhdh
	bY+DuD1kkY3kjsuE35DUXFa3gF67svndfMAJwxtf3A/+6GiQLVhfXGOHOXdUCKX0VJSmD79ANTuw8
	371bukvTFV6eUM4E3RNYpIIV6pTQRchGeYC7rNq/exBIRXzsoqSOH5GKByj6+U7MGM75ALD7qVHZy
	AG4ebRM7QYQ+hPYHyw3XlAsEjUrE0toGesMAzELCPssa6okNSc2OLktxo7MPoKAyxZmXmqC5J90QT
	T6y7Y8hgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXTs0-0005ly-9Y; Tue, 27 Oct 2020 18:38:56 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXTrt-0005ik-5g
 for linux-riscv@lists.infradead.org; Tue, 27 Oct 2020 18:38:53 +0000
Received: by mail-il1-x142.google.com with SMTP id v18so2458789ilg.1
 for <linux-riscv@lists.infradead.org>; Tue, 27 Oct 2020 11:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aiO536AD0kVAcMS1nvBFWPaDHL/6Ip6VypBDRiSKR20=;
 b=lsGwBrEqSVcHL0bMljNjO4ezVKGqSsp9nWInL3C63xb2PfozbnUf06FRu0AMl9ni6X
 Bi9suCGK1f45eXLCN2ax8a76eSQYpZ+3gat8/oUDfrXl7oO5VehKVW/4R62swqsE2nC7
 6wLpJB1VbC61FOGxIN9T9QaT7uFKaaNdhinIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aiO536AD0kVAcMS1nvBFWPaDHL/6Ip6VypBDRiSKR20=;
 b=SWhhDslo2LsDYecT5RKcC4WCAx3SAqEBgBoODhtqvUPJlU7+xrRg2FCr92Q32A0l7T
 xsT/hjqg+gBXziS7lMmX/SurWbVa9WCZW1DY4aDIGxY7Utb2Cm5jx6yrdJ/qGzPXU8yT
 ufG4hze03QE8Yh2h5pLvAwecqpSeXNZmmrT7CF+sBZNDdcYPiMG7HtYGzp0ZYFgGHsJZ
 Sh8fvAliGnpUKbtLvv0SxJP0eFJN+BacV7Xr+3dA0jRq9jrKxSHorhgdhBcHFQXhsT5V
 hOn1yymmXgn9g3zc4oI3nf5Su3JqfWsEzclZDIc2E/KIQzP8jOjubhpYBiaKRsfgpzPY
 95AQ==
X-Gm-Message-State: AOAM5308qvVxnqMs6pea8RTZQ9f8n/L5x16/eIxPIeuK3+5o3WtmyvXe
 Ye5K43fEP55Z6rAEF4mhwceZoWIvEftGfpnA3wn8
X-Google-Smtp-Source: ABdhPJxm1R6B3j7qwb/SJHdaVnNFjfNds3NG15mUS4t24rGu4bAN9GXYSEVvdt0aR8PyxfyMpNMgdP2eEtXsuzXHfQ0=
X-Received: by 2002:a92:6410:: with SMTP id y16mr3002898ilb.126.1603823927105; 
 Tue, 27 Oct 2020 11:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20201026230254.911912-1-atish.patra@wdc.com>
 <20201026230254.911912-3-atish.patra@wdc.com>
 <20201027100427.GL1154158@kernel.org>
In-Reply-To: <20201027100427.GL1154158@kernel.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 27 Oct 2020 11:38:35 -0700
Message-ID: <CAOnJCUJF8DTNpiGxL0Tz8CUk43CvfJS2w5fw=Y51afKgW22cTQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] RISC-V: Initialize SBI early
To: Mike Rapoport <rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_143849_269492_D1672522 
X-CRM114-Status: GOOD (  17.94  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Anup Patel <anup@brainfault.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Borislav Petkov <bp@suse.de>,
 Michel Lespinasse <walken@google.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 27, 2020 at 3:04 AM Mike Rapoport <rppt@kernel.org> wrote:
>
> On Mon, Oct 26, 2020 at 04:02:50PM -0700, Atish Patra wrote:
> > Currently, SBI is initialized towards the end of arch setup. This prevents
> > the set memory operations to be invoked earlier as it requires a full tlb
> > flush.
> >
> > Initialize SBI as early as possible.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  arch/riscv/kernel/setup.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > index c424cc6dd833..7d6a04ae3929 100644
> > --- a/arch/riscv/kernel/setup.c
> > +++ b/arch/riscv/kernel/setup.c
> > @@ -89,6 +89,9 @@ void __init setup_arch(char **cmdline_p)
> >               pr_err("No DTB found in kernel mappings\n");
> >  #endif
> >
> > +#if IS_ENABLED(CONFIG_RISCV_SBI)
>
> Maybe
>         if (IS_ENABLED(CONFIG_RISCV_SBI))
>                 sbi_init()
>

ok. Will update.

> > +     sbi_init();
> > +#endif
> >  #ifdef CONFIG_SWIOTLB
> >       swiotlb_init(1);
> >  #endif
> > @@ -97,10 +100,6 @@ void __init setup_arch(char **cmdline_p)
> >       kasan_init();
> >  #endif
> >
> > -#if IS_ENABLED(CONFIG_RISCV_SBI)
> > -     sbi_init();
> > -#endif
> > -
> >  #ifdef CONFIG_SMP
> >       setup_smp();
> >  #endif
> > --
> > 2.25.1
> >
>
> --
> Sincerely yours,
> Mike.
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
