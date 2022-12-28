Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BB8C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Dec 2022 23:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VE8yE+/mKsnTKS96zSS2ToaBQGxLMtKUvJO3jgjV+U0=; b=2c0nWrbqaOmnRx
	jqngFHdukOSg5m5c/iINp6tMX8p1SKntsygWNhpQHyijg9vXD6Kr1ugryOZP5oc+WOTLT/bodPyAk
	CHzXDqKXn9GAhKcalycregl9mT16bqP0NJ12UnkotZVF0NpNHV/bGjd256D2qnMLDHUeu8nTI8f1n
	TFyPMk8srg7AjEd+Hw5ANiSCBLDsPHA8TfCxc+Qn4KfwaxaqaHj7WsZmKvETUtcZcZGoGQLwnLuSO
	SUklN1Mee7d2r7V6pI11gzNahbEBN050RGiU+getTcu2UR4M/Bk7AIzGMk7DxpadcNMrzHv04J0Sc
	Q8EBv3/5plRL8YSNoBow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAg6H-009Psp-Ne; Wed, 28 Dec 2022 23:44:45 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAg69-009Pop-UC
	for linux-riscv@lists.infradead.org; Wed, 28 Dec 2022 23:44:39 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-482363a1232so86218107b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 28 Dec 2022 15:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NbGhLufIgqXDdb1BN5HzkBQRvTU9efkD5B+p/KhTdLo=;
        b=S93e4U7AJgIp/1cRRpi8jqaGy6dMUpEYkKtGlP2nl964lAgj68R54yOQxMweYq+e5b
         AoZh5EUHn99Hln3b7DxkLhig5piBVh7mVacLc0IwQTwUo+mWg8TA54mjjz4iPRzDG1BP
         llZ6xofNgj5fczbyZsbpDionw/fZf3c2FnTs9CLYR1wUpulRn2eMZkJeBAGCyKOELbxr
         8lHUbonYbpdSX0LhiLVoI8Nv5qGjBnU2r7ZxfQTyYI3ZvtmZc8tMgvenEhnXEgjTkWPW
         lUWsySNYtc9/L1+9y9TNs71n/FM9GJdQ7xnSewOJd97hOMlSpZTISDAZzVCucnp6A9SK
         089A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NbGhLufIgqXDdb1BN5HzkBQRvTU9efkD5B+p/KhTdLo=;
        b=occhjjKntX3Th35eR+NJHWtlA3soKNEJ7SzY7SzNA1xEACvsykW7pJJRw9boDzjW7q
         Bd1BtTs4e8aJAP7gD5dWCOCaHOA28VlMlTjLq5xja9o8wCikuh5qFPPB4HEFz4wx3cXq
         dz5DS1RVvkrm8LUSAqu+hllZMh6a3zc4efYyS0WSpUuqVItrsh+rbJ6mvLykPW8OlQZf
         jAF88WV6BlyVnrNhgaCg569pHF/Hozb40Uo7FVu9CTI6oVf28Le2SAl/O/UM0yU7OlK2
         KGDSIjWoP9nt3iEPfUNY3NaTAKUWFwjL5VstvLaiBLL+uKFW2tAtCVbgUQFqdu97N8zH
         UhJA==
X-Gm-Message-State: AFqh2koszPOnnb/fh/QmuyU2768pOMaI4DCpNRM4hW3Zd+3aTru3+ueK
	g4ZxiUaOm5tJDyCB/s04xbLCgZZvvu/LRK09tPA=
X-Google-Smtp-Source: AMrXdXurW45CCPloviW/gcdr6IUKvd7hSti4zW1PmI1pK0x+q6NVPKN9/xSVaH46yCH2O/LewYQF32/cvLWvnx6YMjY=
X-Received: by 2002:a81:9e41:0:b0:3b7:1b8a:6024 with SMTP id
 n1-20020a819e41000000b003b71b8a6024mr2944186ywj.421.1672271074846; Wed, 28
 Dec 2022 15:44:34 -0800 (PST)
MIME-Version: 1.0
References: <20221211215843.24024-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <a92eda53-90ed-718d-6925-0d9afbb029c5@sholland.org>
In-Reply-To: <a92eda53-90ed-718d-6925-0d9afbb029c5@sholland.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 28 Dec 2022 23:44:08 +0000
Message-ID: <CA+V-a8vLtmo7VjQfZAnvLvjBADF_Zk3TNM62VJQnyxSBwjVDnQ@mail.gmail.com>
Subject: Re: [RFC PATCH] clocksource/drivers/riscv: Get rid of
 clocksource_arch_init() callback
To: Samuel Holland <samuel@sholland.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>, 
	linux-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_154438_138164_800C5FFD 
X-CRM114-Status: GOOD (  28.69  )
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

Hi Samuel,

Thank you for the review.

On Tue, Dec 27, 2022 at 11:17 PM Samuel Holland <samuel@sholland.org> wrote:
>
> On 12/11/22 15:58, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Having a clocksource_arch_init() callback always sets vdso_clock_mode to
> > VDSO_CLOCKMODE_ARCHTIMER if GENERIC_GETTIMEOFDAY is enabled, this is
> > required for the riscv-timer.
> >
> > This works for platforms where just riscv-timer clocksource is present.
> > On platforms where other clock sources are available we want them to
> > register with vdso_clock_mode set to VDSO_CLOCKMODE_NONE.
> >
> > On the Renesas RZ/Five SoC OSTM block can be used as clocksource [0], to
> > avoid multiple clock sources being registered as VDSO_CLOCKMODE_ARCHTIMER
> > move setting of vdso_clock_mode in the riscv-timer driver instead of doing
> > this in clocksource_arch_init() callback as done similarly for ARM/64
> > architecture.
>
> This is definitely a good change to make, but shouldn't we still prefer
> the architectural CSR-based clocksource over an MMIO-based clocksource?
> It has double the number of bits, and reading it should have less
> overhead. So I think we also want to increase the rating of
> riscv_clocksource.
>
For which now you have already have a patch posted.

> D1 is in the same situation, as timer-sun4i.c registers a clocksource
> with a higher rating than riscv_clocksource. Without this patch,
> tools/testing/selftests/vDSO/vdso_test_correctness fails. With this
> patch, it passes, so:
>
> Tested-by: Samuel Holland <samuel@sholland.org>
>
> > [0] drivers/clocksource/renesas-ostm.c
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  arch/riscv/Kconfig                | 1 -
> >  arch/riscv/kernel/time.c          | 9 ---------
> >  drivers/clocksource/timer-riscv.c | 7 +++++++
> >  3 files changed, 7 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 7ea12de636bd..b269e062c1b1 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -12,7 +12,6 @@ config 32BIT
> >
> >  config RISCV
> >       def_bool y
> > -     select ARCH_CLOCKSOURCE_INIT
> >       select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
> >       select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
> >       select ARCH_HAS_BINFMT_FLAT
> > diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
> > index 8217b0f67c6c..42bee305e997 100644
> > --- a/arch/riscv/kernel/time.c
> > +++ b/arch/riscv/kernel/time.c
> > @@ -30,12 +30,3 @@ void __init time_init(void)
> >       of_clk_init(NULL);
> >       timer_probe();
> >  }
> > -
> > -void clocksource_arch_init(struct clocksource *cs)
> > -{
> > -#ifdef CONFIG_GENERIC_GETTIMEOFDAY
> > -     cs->vdso_clock_mode = VDSO_CLOCKMODE_ARCHTIMER;
> > -#else
> > -     cs->vdso_clock_mode = VDSO_CLOCKMODE_NONE;
> > -#endif
> > -}
> > diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> > index 969a552da8d2..7ec9668cd36d 100644
> > --- a/drivers/clocksource/timer-riscv.c
> > +++ b/drivers/clocksource/timer-riscv.c
> > @@ -29,6 +29,12 @@
> >
> >  static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
> >
> > +#ifdef CONFIG_GENERIC_GETTIMEOFDAY
> > +static enum vdso_clock_mode vdso_default = VDSO_CLOCKMODE_ARCHTIMER;
> > +#else
> > +static enum vdso_clock_mode vdso_default = VDSO_CLOCKMODE_NONE;
> > +#endif /* CONFIG_GENERIC_GETTIMEOFDAY */
>
> We don't have any workarounds like arm_arch_timer, so we do not need
> this indirection through vdso_default. You can set .vdso_clock_mode
> directly in the declaration of riscv_clocksource.
>
Agreed, I'll do that in v2.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
