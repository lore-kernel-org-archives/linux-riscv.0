Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320EDC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 13:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VEoYd9/+Xm5+6w1I3P8aZ9QM/U4Z47HhzGB0XQTgnG4=; b=bRgw34gRiDtWXX
	jMLwSILxu4uipScCnp7UbLnTwpECpBj8i+sx38LYvRwzv+a/9rcPcQUYVurQm6v4GIlUu0UBYxcvL
	fGcborjR3H0GwK7IWGDIiq85mQjVjUH7d9vteIVSSsuskkCTn/vnGbcmh+Fsxcw3PFduLk0jlJQTH
	JqJ0JikPivBrxWy1KZq0utFxT8f+T+TwLn87lwW5o+eczxlLbMQr8W51+eYT6ZreMinQdjmHQGGeP
	sgMHLwWJIiYxhCOSKRhA6r0bui4UZj9sQLg8XYS+uFrjvY/XQaCsQCgE8/2NkdyiUkVrKWNlhxK4l
	4oVoUZw9uHpZwB3ZFoZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okmXD-0071p1-8e; Tue, 18 Oct 2022 13:21:31 +0000
Received: from mail-oa1-f53.google.com ([209.85.160.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okmX9-0071lR-SC
	for linux-riscv@lists.infradead.org; Tue, 18 Oct 2022 13:21:29 +0000
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-132b8f6f1b2so16720223fac.11
        for <linux-riscv@lists.infradead.org>; Tue, 18 Oct 2022 06:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PX4pHfoVlPrXyEFQ1vXdFbAyOB+LHOVxTyBiqphn7oI=;
        b=enFAZkL/Sfxze9FnQFE2zELo8EcRWC5vcMR1rbwPO5+mSZoTsiOMHVtdnMxX5qe+1G
         JRwqw1GqhSsNEGpMYAHLlUolt2pq94c5z8txJxW50ii/V2YaUxFW445I7Xw1C1mtBF93
         hr1ByqOulUlZ7yJRNotagfgNscpYI8vFTEfVVF4UD5uGNDnJpMAV0Ws7LmEAE/NiHBAl
         +COtuW8MSpvPlauGsH/IK9dJGkScNJFs9IENWH/jlGch3DT2HiSAB6eX3+hSVa3KVXsc
         cqPtfWviBQtvIgj2VyWzOrD5AaDFMXAPRjN1FiHphxpG3X4ijcj3UyaHM2Ravl/hfm5U
         7S9w==
X-Gm-Message-State: ACrzQf1IlOQiYWsTXkX3M9yx1RQnXIULn2lIbVS/92iG4wA+PCE86mSE
	tbRUGbM6e2uqf1cJrIN93FtyOZEAwlROIMO6
X-Google-Smtp-Source: AMsMyM7VtJJSlZthCXPLAWsHsWNxF9pw0fjtyq3WFIntJHF7aDL8PwHXQDm2zzF3lyBHWzBqQyvqwA==
X-Received: by 2002:a05:6870:4413:b0:136:66cc:6af8 with SMTP id u19-20020a056870441300b0013666cc6af8mr18607043oah.112.1666099284315;
        Tue, 18 Oct 2022 06:21:24 -0700 (PDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com. [209.85.210.54])
        by smtp.gmail.com with ESMTPSA id z25-20020a9d65d9000000b00661e1653005sm4896060oth.11.2022.10.18.06.21.24
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 06:21:24 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id p24-20020a9d6958000000b00661c528849eso7582867oto.9
        for <linux-riscv@lists.infradead.org>; Tue, 18 Oct 2022 06:21:24 -0700 (PDT)
X-Received: by 2002:a25:4fc2:0:b0:6be:afb4:d392 with SMTP id
 d185-20020a254fc2000000b006beafb4d392mr2207331ybb.604.1666098944657; Tue, 18
 Oct 2022 06:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220905230820.3295223-1-yury.norov@gmail.com>
 <20220905230820.3295223-6-yury.norov@gmail.com> <CAMuHMdUL0WxYjfRDxLWZG7Xu=2xTQkueathvpwWfLpqhG6NkFQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUL0WxYjfRDxLWZG7Xu=2xTQkueathvpwWfLpqhG6NkFQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Oct 2022 15:15:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW2H4egcmv238Q_5LBeu9BE=H1fm=n4vZGCGYzhg2VN1A@mail.gmail.com>
Message-ID: <CAMuHMdW2H4egcmv238Q_5LBeu9BE=H1fm=n4vZGCGYzhg2VN1A@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] lib/cpumask: add FORCE_NR_CPUS config option
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Andrew Morton <akpm@linux-foundation.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Dmitry Vyukov <dvyukov@google.com>, 
	Valentin Schneider <vschneid@redhat.com>, Sander Vanheule <sander@svanheule.net>, 
	Alexey Klimov <klimov.linux@gmail.com>, Eric Biggers <ebiggers@google.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_062127_924284_CCD00A2B 
X-CRM114-Status: GOOD (  36.36  )
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

On Tue, Oct 18, 2022 at 10:21 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Tue, Sep 6, 2022 at 1:10 AM Yury Norov <yury.norov@gmail.com> wrote:
> > The size of cpumasks is hard-limited by compile-time parameter NR_CPUS,
> > but defined at boot-time when kernel parses ACPI/DT tables, and stored in
> > nr_cpu_ids. In many practical cases, number of CPUs for a target is known
> > at compile time, and can be provided with NR_CPUS.
> >
> > In that case, compiler may be instructed to rely on NR_CPUS as on actual
> > number of CPUs, not an upper limit. It allows to optimize many cpumask
> > routines and significantly shrink size of the kernel image.
> >
> > This patch adds FORCE_NR_CPUS option to teach the compiler to rely on
> > NR_CPUS and enable corresponding optimizations.
> >
> > If FORCE_NR_CPUS=y, kernel will not set nr_cpu_ids at boot, but only check
> > that the actual number of possible CPUs is equal to NR_CPUS, and WARN if
> > that doesn't hold.
> >
> > The new option is especially useful in embedded applications because
> > kernel configurations are unique for each SoC, the number of CPUs is
> > constant and known well, and memory limitations are typically harder.
> >
> > For my 4-CPU ARM64 build with NR_CPUS=4, FORCE_NR_CPUS=y saves 46KB:
> >   add/remove: 3/4 grow/shrink: 46/729 up/down: 652/-46952 (-46300)
> >
> > Signed-off-by: Yury Norov <yury.norov@gmail.com>
>
> Thanks for your patch, which is now commit 6f9c07be9d020489
> ("lib/cpumask: add FORCE_NR_CPUS config option") in v6.1-rc1.
>
> FORCE_NR_CPUS is enabled for e.g. an allmodconfig kernel, which I
> believe now makes it unsafe to boot such a kernel on any system that
> does not have exactly CONFIG_NR_CPUS CPU cores?
>
> If my assumption is true, this really needs some protection to prevent
> enabling this option inadvertently, as it is quite common to boot
> allmodconfig kernels for testing.

Moreover, this cannot be used on all systems.  E.g. on Icicle Kit with
Microchip PolarFire SoC, CONFIG_NR_CPUS needs to be larger than 4,
as the system has actually 5 CPU cores (1xE51 and 4xU54), but Linux
runs only on 4 of them.  So you cannot use FORCE_NR_CPUS=y.

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
