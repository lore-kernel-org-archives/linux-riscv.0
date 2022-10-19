Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE77C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 06:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q0YpU5fxxgkIAV53YgGXv/hHwM3Uh38YAvXM8gdr5IE=; b=qSafvAlSRh+1JY
	vf6pSXb92vvYaN9PGOR91Gl1hkCQ/ceQOhWgE3AhwbzeRuZYQwD0kDLRQJwLFM/YJy2FPb/NPpdDy
	6FSGLkuMHMhq9jAFraIes38XKauJa8gWLd3aBXaSV7CynW6UcLmVBMJSv/+TG7fq71gMCciG/ut4E
	bJkJVjZ6dxD+RqjgcoNHPeWcyQHAaTNtk88Zhb6XMV4RcHGWpfFIc8s5wSNZk+p9wQ8CdU6lVxA3W
	8BFqC4uvXc+Vq1E5ZdiOZiuD9oknXG2X+k2JJukwXo9fBZVq9P74W3oykk3rdHNi6t6EfzAglWh4x
	mifWg3BA8yjyZC+RpZaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol32m-00FvII-GT; Wed, 19 Oct 2022 06:59:12 +0000
Received: from mail-qk1-f173.google.com ([209.85.222.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol32j-00FvDw-GG
	for linux-riscv@lists.infradead.org; Wed, 19 Oct 2022 06:59:11 +0000
Received: by mail-qk1-f173.google.com with SMTP id o2so10140884qkk.10
        for <linux-riscv@lists.infradead.org>; Tue, 18 Oct 2022 23:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4b+dxGPxsF1U/h9C74jKmspxOijVQ4vRVIdXZB4T2rw=;
        b=Zfuo9QH9OYABRqQZxo60wiv62RSvHSzHp6spGSk9lIGvwzhzt1f3qX59g2hOLek6az
         DACe6KzsHcxUfwc3b2ua65gltov5H8qRIszUALLmQFhZmOmenortY4pr61qdcxDVnvl3
         iznD1r4F//wQbU6hr2ir3lnw4qiG+858GW6S7v77DrYxgfGVlY5AFbpDtIvZ2EFmzDF2
         SLsS3e6CctXbXWd2w/pmOEoPEI3WKAZlwlzEL59j+jBH7Cui7YMG78Inx/+MsBk4aE+d
         zuaYUlmYdCX2EzaqxSs1Pa1gZuX9Ihyck3kLprAhowrkl/6WFAhOp5hAcuBe7tg8gqTN
         wtpw==
X-Gm-Message-State: ACrzQf13O8M8x0eTODy5rcKvssHoCmTVv1+iGXtNuY9d3PKC0jmykSOF
	eolYebdtfz4qZpmSL67NTmZO0bnNHpquwHBz
X-Google-Smtp-Source: AMsMyM7sq24QRyfFH3TMiIKufntIY8xa7ltMMsvzmMjXiEBaeGkKR/a4MEMoLGmwaviIavvNZGGTqw==
X-Received: by 2002:a05:620a:4608:b0:6ee:e59b:4cf5 with SMTP id br8-20020a05620a460800b006eee59b4cf5mr4572171qkb.736.1666162747347;
        Tue, 18 Oct 2022 23:59:07 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id r2-20020ae9d602000000b006ceb933a9fesm4134120qkk.81.2022.10.18.23.59.05
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 23:59:06 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id f205so8570140yba.2
        for <linux-riscv@lists.infradead.org>; Tue, 18 Oct 2022 23:59:05 -0700 (PDT)
X-Received: by 2002:a25:4fc2:0:b0:6be:afb4:d392 with SMTP id
 d185-20020a254fc2000000b006beafb4d392mr5230561ybb.604.1666162745385; Tue, 18
 Oct 2022 23:59:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220905230820.3295223-1-yury.norov@gmail.com>
 <20220905230820.3295223-6-yury.norov@gmail.com> <CAMuHMdUL0WxYjfRDxLWZG7Xu=2xTQkueathvpwWfLpqhG6NkFQ@mail.gmail.com>
 <CAMuHMdW2H4egcmv238Q_5LBeu9BE=H1fm=n4vZGCGYzhg2VN1A@mail.gmail.com>
 <mvmlepdb66h.fsf@suse.de> <CAMuHMdVeHPR_JH0dJ+WSddjd8_hax70JRzd4pqHLNvgbh+-znw@mail.gmail.com>
 <Y065nbfVQwZhwt51@yury-laptop> <Y067uYGTaA93Hn3z@smile.fi.intel.com>
 <Y06/SipcWdh4uIqd@yury-laptop> <CAMuHMdVjViT8-VMPuKZz2O1sudy5ogHpzVYM_P+isjRRUNgirw@mail.gmail.com>
 <Y07RcE3fgoGLpNZz@yury-laptop>
In-Reply-To: <Y07RcE3fgoGLpNZz@yury-laptop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Oct 2022 08:58:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX3S2GS_YW4KP63TSWN2MEyusrvC6fh1ep7KMjU2OYHcg@mail.gmail.com>
Message-ID: <CAMuHMdX3S2GS_YW4KP63TSWN2MEyusrvC6fh1ep7KMjU2OYHcg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] lib/cpumask: add FORCE_NR_CPUS config option
To: Yury Norov <yury.norov@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andreas Schwab <schwab@suse.de>, 
	linux-kernel@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Dmitry Vyukov <dvyukov@google.com>, 
	Valentin Schneider <vschneid@redhat.com>, Sander Vanheule <sander@svanheule.net>, 
	Alexey Klimov <klimov.linux@gmail.com>, Eric Biggers <ebiggers@google.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_235909_565674_088643A3 
X-CRM114-Status: GOOD (  33.94  )
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

Hi Yury,

On Tue, Oct 18, 2022 at 6:19 PM Yury Norov <yury.norov@gmail.com> wrote:
> On Tue, Oct 18, 2022 at 05:15:41PM +0200, Geert Uytterhoeven wrote:
> > On Tue, Oct 18, 2022 at 5:01 PM Yury Norov <yury.norov@gmail.com> wrote:
> > > On Tue, Oct 18, 2022 at 05:44:09PM +0300, Andy Shevchenko wrote:
> > > > On Tue, Oct 18, 2022 at 07:35:09AM -0700, Yury Norov wrote:
> > > > > On Tue, Oct 18, 2022 at 03:50:31PM +0200, Geert Uytterhoeven wrote:
> > > >
> > > > ...
> > > >
> > > > > For those who choose FORCE_NR_CPUS, it's required to set NR_CPUS
> > > > > to a value that matches to what's parsed from DT.
>
> ...
>
> > I haven't tried the patch from your other email yet, but I did try
> > CONFIG_NR_CPUS=4 and CONFIG_FORCE_NR_CPUS=y on
> > Icicle earlier today.
> >
> > There was no warning, as the number of CPUs did match, but the
> > fourth CPU (cpu@4, i.e. the fifth core in DT) failed to come online:
> >
> >     CPU3: failed to come online
> >     smp: Brought up 1 node, 3 CPUs
> >
> > BTW, it behaves the same with CONFIG_FORCE_NR_CPUS=n.
> > Increasing CONFIG_NR_CPUS (before I used 8) makes the fourth
> > CPU core come online again.
>
> The problem is seemingly unrelated to CONFIG_FORCE_NR_CPUS...
> If so, we don't need ARCH_UNFORCE_NR_CPUS. Is that right?
>
> This all looks weird. RISCV hasn't an arch code to setup nr_cpu_ids,
> and therefore should use generic setup_nr_cpu_ids(), which is:
>
>   void __init setup_nr_cpu_ids(void)
>   {
>           set_nr_cpu_ids(find_last_bit(cpumask_bits(cpu_possible_mask), NR_CPUS) + 1);
>   }
>
> Where:
>
>   static inline void set_nr_cpu_ids(unsigned int nr)
>   {
>   #if (NR_CPUS == 1) || defined(CONFIG_FORCE_NR_CPUS)
>           WARN_ON(nr != nr_cpu_ids);
>   #else
>           nr_cpu_ids = nr;
>   #endif
>   }
>
>
> As you can see, at this point cpu_possible_mask is initialized based
> on DT, and even if arch has non-dense cpu_possible_mask, the logic
> should still be correct.

Quite possible this is just an issue with the RISC-V CPU sparse hart ID
handling code.  E.g. arm64 works fine with cpu@{0,1,2,3,100,101,102,103}
and CONFIG_NR_CPUS=8.  NR_CPUS in arch/riscv/Kconfig has always
defaulted to at least 8, while all upstream DTS files describe only
4 Linux-capable CPU cores (+ 1 management core).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
