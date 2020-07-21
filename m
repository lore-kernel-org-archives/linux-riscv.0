Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B15A6C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 08:58:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 822E220720
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 08:58:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y+4j9cG8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="S7HPxSbl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 822E220720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RjbLvQPXTfq+al7GctzSNOkMtb0vf01ivesWmjMQS5U=; b=Y+4j9cG8wv1tYWRglDaP9XZ34
	y529fBN9pUjRYN0pxh30HbWelEcl/TRs1nK2qw7eJUfLUiNMSBeD+c7dpKZS1MIjMj32YQlJC3t6W
	3NNsmsAwPPMAk9zfVRzpyokBOGHpxY2vGTJks4SJgx5cF9/S6OKJzu9U3rH4Y3R5vuo5Ymp4UDMro
	SGfqx5UB49det5Gk53I5boCw3EsYkdIbMDjD/k7nVk9Kd5WbYFO0qRTe4GTzjz/fAltfSjQ6Fck1C
	ZzKZOtpS++y8UkjuZvfHihoyfLuXqJMZS/nvF2J3hGZ7f886EfSLSYa0VZjIyRqrPGdA/YtYwdj6O
	QqWi+nHYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxo6j-00036v-5x; Tue, 21 Jul 2020 08:58:41 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxo6e-000340-Fz
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 08:58:38 +0000
Received: by mail-pf1-x443.google.com with SMTP id a24so10416698pfc.10
 for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2020 01:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/DZG4wy29nasrzKpFqmh4MB/G9RCrQ4cbNulFyU1lAk=;
 b=S7HPxSblnonZjj2Qm7U0SW0imWNpc09DUulGrBprYAJ7SlNmWZZdZdllLkc/CaJauj
 R6Ruc5ebhQeAgyzVDWcDeEyplkMOGI7eEIV2PPgKjCANaOttLCDWo8saUWusGV+PM2XT
 05J/oO42j6SYFcqX0GmVFGhlz3gI/H7ICUUgOoQz/y2Rrm7MJnoiRdlLFSyHKU25BRB9
 iYW/1yzOQXyzZ5eK27d+SgzXXr2sBCKug1FSCiH3TJqbQLIi9TUV7flQ+6+v4ha94G7b
 OPIij6ZaBbXh5MhZddtK07kAm2cnztGmGHcNIoVYRXBIRdkcgX9/f9Src/D1m+2t0FXe
 83Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/DZG4wy29nasrzKpFqmh4MB/G9RCrQ4cbNulFyU1lAk=;
 b=Cy9/NIiuySENDpwp1coaYnFpNBy4yNqlIUGgtvmunptt5kyvHuc59fvUZ6Jcbblsyr
 6Y+knfjMEWM+E0XA4lo0Bz5e/xGNXGX8NOnAtKscBVZdCLSIDweR8t1OyNwG77mTKAMQ
 SxtHxHI9hn/oJQZN1YGQV5lCN43r5/51axfeJ9TmGNVeZ8AcBVMroz7q+zV0BxUoY+rm
 F0sray8MhoKNIxxBiaZfoYE7rrgvJtXhon8hHVOSnx7c+doBJWc2FCy/ffe9JS7vUP0V
 qnXyh28QnAFSJalWY0GQ4Uxw4EZeheuZGzV8myGgpPHKDBV3EDJLDORvUme4WzLMaVsE
 QTmg==
X-Gm-Message-State: AOAM532kRsbJTb6bX8PK0sHWI25ydj3JFFpf52HVF2bQxbJwa0pZ5gIc
 o6N7lW94LVW7nFLFHIspUdzmPzgT5PPavpDuial0K6wM+lA=
X-Google-Smtp-Source: ABdhPJwABzahnZjtDewJU1wkBQt2HCcsOmMFnPQ5CpSSY+SrMpuwc/9v9/GT2cpIa3VEr90GKDvQHoiPF7ButnQ30WE=
X-Received: by 2002:a63:fe0a:: with SMTP id p10mr21346660pgh.255.1595321912678; 
 Tue, 21 Jul 2020 01:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <1594348854-25588-1-git-send-email-vincent.chen@sifive.com>
 <mhng-36ca5f6d-4cba-4a0a-83a5-e758edaa295c@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-36ca5f6d-4cba-4a0a-83a5-e758edaa295c@palmerdabbelt-glaptop1>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Tue, 21 Jul 2020 16:58:21 +0800
Message-ID: <CABvJ_xius8UAVHK9BzoiuYzp-vY1qf3sPSH7cpX3goJZS8EfcA@mail.gmail.com>
Subject: Re: [PATCH] riscv: kasan: use local_tlb_flush_all() to avoid
 uninitialized __sbi_rfence
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_045837_240099_06DC6659 
X-CRM114-Status: GOOD (  21.55  )
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
Cc: nickhu@andestech.com, Alexander Potapenko <glider@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, aryabinin@virtuozzo.com,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 21, 2020 at 12:18 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Thu, 09 Jul 2020 19:40:54 PDT (-0700), vincent.chen@sifive.com wrote:
> > It fails to boot the v5.8-rc4 kernel with CONFIG_KASAN because kasan_init
> > and kasan_early_init use uninitialized __sbi_rfence as executing the
> > tlb_flush_all(). Actually, at this moment, only the CPU which is
> > responsible for the system initialization enables the MMU. Other CPUs are
> > parking at the .Lsecondary_start. Hence the tlb_flush_all() is able to be
> > replaced by local_tlb_flush_all() to avoid using uninitialized
> > __sbi_rfence.
> >
> > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > ---
> >  arch/riscv/mm/kasan_init.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> > index 4a8b61806633..87b4ab3d3c77 100644
> > --- a/arch/riscv/mm/kasan_init.c
> > +++ b/arch/riscv/mm/kasan_init.c
> > @@ -44,7 +44,7 @@ asmlinkage void __init kasan_early_init(void)
> >                               (__pa(((uintptr_t) kasan_early_shadow_pmd))),
> >                               __pgprot(_PAGE_TABLE)));
> >
> > -     flush_tlb_all();
> > +     local_flush_tlb_all();
> >  }
> >
> >  static void __init populate(void *start, void *end)
> > @@ -79,7 +79,7 @@ static void __init populate(void *start, void *end)
> >                       pfn_pgd(PFN_DOWN(__pa(&pmd[offset])),
> >                               __pgprot(_PAGE_TABLE)));
> >
> > -     flush_tlb_all();
> > +     local_flush_tlb_all();
> >       memset(start, 0, end - start);
> >  }
>
> Can we just move the sbi_init() call before the kasan_init() call?  I feel like
> the SBI should be initialized directly after paging, as probing really doesn't
> have any dependencies.

The kasan_early_init() which is called before page_init() also uses
__sbi_rfence. Hence we need to move sbi_init() before the
kasan_early_init() not just before the kasan_init. I have tried to use
this solution to resolve this bug, and it could work on QEMU actually.
However, I think the solution replacing flush_tlb_all() with
local_flush_tlb_all() not only can resolve this problem but also can
lightly improve performance by reducing one SBI call. Therefore, the
patch uses local_flush_tlb_all() to solve this bug.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
