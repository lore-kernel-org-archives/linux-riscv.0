Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26E6C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 15:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=diEvThrGAk6/AYHv+TCAbqiwc9obt3bESPLLivjP2Pg=; b=dQJCFd2grfYIg8
	PGHAvKtbbasoGMg7lqJer9qIQWpRz9k+4ep30D8jW4nZk/VpvKK5jvlCsa7+flzEu6dyW+BBtvyQq
	intmh8uIkQrxRj3RyZLjQJjd5p5ISnRd5APaKJ2mx0QcC6rQzPzXnK9pfJAo2bOpU6S53TMJxUsLC
	9MESjSemhqQsOq2dxpnM5KCbbxlO5VnIXlCwhqxIEdcecQ8RgcTA+fHjwhRc3TPowc0hX1zMT6X4H
	7rSCbwz2OxnOaQym8ZKoeHZ/oPEEsqEnhqhLxBdyRgbWTMHooc61ey5E/TZO0l0VJJsp0iYjYFbCp
	P804xVPF1mGZtKdwDVxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okoQy-007ZZR-O8; Tue, 18 Oct 2022 15:23:13 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okoQl-007ZP6-6a
	for linux-riscv@lists.infradead.org; Tue, 18 Oct 2022 15:23:02 +0000
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1324e7a1284so17183914fac.10
        for <linux-riscv@lists.infradead.org>; Tue, 18 Oct 2022 08:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/y9qyGY5iRRsI0juheW5gC+VHaPihspfGREH3Qe0x8o=;
        b=cT0q5PTfmiI+BhoExTwPoZYgykDSu3ve347G093yUi00NRcw0f6+TFjvkNUSaybF1P
         Rey1UbyhUVfXY2LUyihPyyrEF+q+z3GUjek5wuSXyGIwZg7o3YNPshOzpx2kYTJ3UoYt
         SEE5a3MlqMAxEwDBOsHlOG/T2AOSGm/9WY3G1eTStt2dtGqbP+Sm83voCeEBn2y2dOeh
         USL4v9XOuOUj4XwZRJARnZvWh2cHFTCo+7iA4jKzWxQ0rWbHIE8nRypVIxV2BMTLW8ht
         M0SbNXvy3zphUuYvca2ifq5FWP475LgJ3o9SnsqSFdOcuN3ukIzG/dmSW4YfWGMK1dRg
         /8bQ==
X-Gm-Message-State: ACrzQf22OqwJImWOuYZ6uPiny3RtB+ZqS3mdtfVBNSYYy3DEKWusRoze
	FamGBGkRm8ockgXz8WYnsOXfQrtMZ9lYA6Sy
X-Google-Smtp-Source: AMsMyM4qupcNI42pUSdAGTvep+rYq0HZ3TeDFvLMbubtNgzHKQC/vSMOMqK4twlnet2ABlEDJpc9dQ==
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id y11-20020a056870b00b00b001272d3d3c16mr17875154oae.262.1666106576279;
        Tue, 18 Oct 2022 08:22:56 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com. [209.85.210.53])
        by smtp.gmail.com with ESMTPSA id u3-20020a056870d58300b0011f00b027bdsm6359739oao.45.2022.10.18.08.22.56
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 08:22:56 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id t4-20020a9d7f84000000b00661c3d864f9so7805476otp.10
        for <linux-riscv@lists.infradead.org>; Tue, 18 Oct 2022 08:22:56 -0700 (PDT)
X-Received: by 2002:a25:687:0:b0:6c2:2b0c:26e with SMTP id 129-20020a250687000000b006c22b0c026emr2856337ybg.202.1666106154019;
 Tue, 18 Oct 2022 08:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220905230820.3295223-1-yury.norov@gmail.com>
 <20220905230820.3295223-6-yury.norov@gmail.com> <CAMuHMdUL0WxYjfRDxLWZG7Xu=2xTQkueathvpwWfLpqhG6NkFQ@mail.gmail.com>
 <CAMuHMdW2H4egcmv238Q_5LBeu9BE=H1fm=n4vZGCGYzhg2VN1A@mail.gmail.com>
 <mvmlepdb66h.fsf@suse.de> <CAMuHMdVeHPR_JH0dJ+WSddjd8_hax70JRzd4pqHLNvgbh+-znw@mail.gmail.com>
 <Y065nbfVQwZhwt51@yury-laptop> <Y067uYGTaA93Hn3z@smile.fi.intel.com> <Y06/SipcWdh4uIqd@yury-laptop>
In-Reply-To: <Y06/SipcWdh4uIqd@yury-laptop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Oct 2022 17:15:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVjViT8-VMPuKZz2O1sudy5ogHpzVYM_P+isjRRUNgirw@mail.gmail.com>
Message-ID: <CAMuHMdVjViT8-VMPuKZz2O1sudy5ogHpzVYM_P+isjRRUNgirw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20221018_082259_270863_32316798 
X-CRM114-Status: GOOD (  32.85  )
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

Hi Yuri,

On Tue, Oct 18, 2022 at 5:01 PM Yury Norov <yury.norov@gmail.com> wrote:
> On Tue, Oct 18, 2022 at 05:44:09PM +0300, Andy Shevchenko wrote:
> > On Tue, Oct 18, 2022 at 07:35:09AM -0700, Yury Norov wrote:
> > > On Tue, Oct 18, 2022 at 03:50:31PM +0200, Geert Uytterhoeven wrote:
> >
> > ...
> >
> > > For those who choose FORCE_NR_CPUS, it's required to set NR_CPUS
> > > to a value that matches to what's parsed from DT.
> > >
> > > Can you please look at the draft below that disables FORCE_NR_CPUS
> > > in allmodconfig? If it's OK with you, I'll send a patch. If you think
> > > that there are architectures where it's not possible to set correct
> > > NR_CPUS at compile time for some reason, I'll add ARCH_UNFORCE_NR_CPUS
> > > option.
> >
> > Instead you may simply add
> >
> >       depends on CONFIG_$ARCH/$MACHINE=n
> >
> > and so on to the FORCE_NR_CPUS, no?
>
> Yes, if there's just one machine like that. If there's many of them, the
> 'depends' list would be too long.
>
> I hope there's no such a weird machines, and we don't need that at
> all. Let's see what Geert will say.

I haven't tried the patch from your other email yet, but I did try
CONFIG_NR_CPUS=4 and CONFIG_FORCE_NR_CPUS=y on
Icicle earlier today.

There was no warning, as the number of CPUs did match, but the
fourth CPU (cpu@4, i.e. the fifth core in DT) failed to come online:

    CPU3: failed to come online
    smp: Brought up 1 node, 3 CPUs

BTW, it behaves the same with CONFIG_FORCE_NR_CPUS=n.
Increasing CONFIG_NR_CPUS (before I used 8) makes the fourth
CPU core come online again.

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
