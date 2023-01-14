Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D56AC3DA78
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Jan 2023 18:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7JvxSfj/Rzh1f3O60CgR4dKF/FrmzluVvMinwt/peJg=; b=Uws2NY9I+sKeK9
	AR1pp+vHUKCXe99mrHnt+0LfqU8aF5u+X4Ve2S8kC6u8C9JKswFD+c8LnhyJL3rqpq6HkpYe8uzGO
	90XbWFLoQdZMWysqn+RMY9MDvWFT+xDvPrioYXZf0YSi4YN7wUiA3CaKZLiQzn7VIkMzj+InesjMo
	OMiwrqqQKXkdbJdQx4VjpC/DJ+V9aQ9osIjXCBXB+AE6fZpQykI9B0VZXn6APuQ38opQS5H1xMMaL
	qGIvegMhxq8EjKtaEpz+Bu/r1y6xE/H7uXlNXyj73QOYTjYakNLuR99ik+ERi2YuEGmQVC8lIZ5S8
	FhxCKvYB5MRWryZcMJzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGlkT-006MLL-22; Sat, 14 Jan 2023 18:59:25 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGlkO-006MKn-Sk
	for linux-riscv@lists.infradead.org; Sat, 14 Jan 2023 18:59:22 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-4d4303c9de6so178117187b3.2
        for <linux-riscv@lists.infradead.org>; Sat, 14 Jan 2023 10:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rvSA+Lx4428ZeCqIe+MLNPk8FnuAPH7irnwCNjVyepg=;
        b=E/Z7vgZuk7gjVRqsylXqM2hjmpmB+3D6Z+7L/t7h1F575IWk064ySp7dFiRB765EpZ
         GNK5NAC0kDvAVx1CKmD8SpgrBnhHoeWTVJW0ZD149chpcmHhQ5y4lIv8eD0QHSFQNoNX
         oCA7jwWvBRh2EMqgsFS6SR70T2xvpunuS54kAw/ZuxdkoXHZ7P/JNMn2VuI96YAbS8HY
         Ayx8Yem9zjfCn7txUB9DK9MECtvMiXYtdRY4uKJ9JIeJooLdUk+kEjVnIYGPF/oBfBML
         YeR25uyJhpLoadDfVdykzooeh4HrkJU+A+/6MNUNd3/Z9W+lWdF5bIR7jMqtklIPmyJ6
         +ihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rvSA+Lx4428ZeCqIe+MLNPk8FnuAPH7irnwCNjVyepg=;
        b=lfi2Llc7vTsfnSMrgsGUA1Nc2JtWFu6qESRKoTlgMGp8FiA4eEsvvLtesBOeMWgAlL
         bXR5MHFVGXx4fIIpyj9Rkjhi/65F05NDEjL7p/Ct/HPlq7pm1SYWxl8sgR7UUAKujLWT
         LjoNMRLlmbCB0TG3OGp1e22VWeDeJiomChZgj9OtG9NLiUROUHvL3ozOS7jyDTVeswHs
         9GDxJKWe/VxaYyG4e9PmcGaccLoV1LpU6CJMcHB3yF/5axXdXp+RhaanXerjKeYHt8VI
         1/d5lfmW7tQLAdr1+eS31m869y6GdG2o3NnbM26FH2lvXJrWY1JPL7TBmt3d3ZW+IydI
         qljA==
X-Gm-Message-State: AFqh2koFNANXBfIvVRr1JcpKi4ovp6B5tf9udNQwH66Dj1ycyjEWkXb7
	W6QGaFfKycPJFdUMYntjdSHWiH4jrfwDTyqTeBg=
X-Google-Smtp-Source: AMrXdXv+37ZTyFOBsHwWwFuVHUiogjw4yQ6vwuYJv3R41Nb8EHC+LjAe/xhxW2jrxj4BgjxRIgUKiXI8cvts3nEGPrw=
X-Received: by 2002:a81:a112:0:b0:4cf:84af:7e95 with SMTP id
 y18-20020a81a112000000b004cf84af7e95mr1817829ywg.309.1673722758140; Sat, 14
 Jan 2023 10:59:18 -0800 (PST)
MIME-Version: 1.0
References: <20221229224601.103851-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221229224601.103851-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 14 Jan 2023 18:58:52 +0000
Message-ID: <CA+V-a8t38vHuBd+GJs5_643Jp5L6u6ci7NWVjRn53iwA445ODA@mail.gmail.com>
Subject: Re: [PATCH v2] clocksource/drivers/riscv: Get rid of
 clocksource_arch_init() callback
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Samuel Holland <samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230114_105921_004804_099FBA16 
X-CRM114-Status: GOOD (  19.92  )
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

On Thu, Dec 29, 2022 at 10:50 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Having a clocksource_arch_init() callback always sets vdso_clock_mode to
> VDSO_CLOCKMODE_ARCHTIMER if GENERIC_GETTIMEOFDAY is enabled, this is
> required for the riscv-timer.
>
> This works for platforms where just riscv-timer clocksource is present.
> On platforms where other clock sources are available we want them to
> register with vdso_clock_mode set to VDSO_CLOCKMODE_NONE.
>
> On the Renesas RZ/Five SoC OSTM block can be used as clocksource [0], to
> avoid multiple clock sources being registered as VDSO_CLOCKMODE_ARCHTIMER
> move setting of vdso_clock_mode in the riscv-timer driver instead of doing
> this in clocksource_arch_init() callback as done similarly for ARM/64
> architecture.
>
> [0] drivers/clocksource/renesas-ostm.c
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Tested-by: Samuel Holland <samuel@sholland.org>
> ---
> RFC -> v2
> * Dropped vdso_default static global variable
> * Used IS_ENABLED() macro
> * Included Tested-by from Samuel
>
> RFC:
> https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221211215843.24024-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> ---
>  arch/riscv/Kconfig                | 1 -
>  arch/riscv/kernel/time.c          | 9 ---------
>  drivers/clocksource/timer-riscv.c | 5 +++++
>  3 files changed, 5 insertions(+), 10 deletions(-)
>
Gentle ping.

Cheers,
Prabhakar

> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e2b656043abf..9c687da7756d 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -12,7 +12,6 @@ config 32BIT
>
>  config RISCV
>         def_bool y
> -       select ARCH_CLOCKSOURCE_INIT
>         select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
>         select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
>         select ARCH_HAS_BINFMT_FLAT
> diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
> index 8217b0f67c6c..42bee305e997 100644
> --- a/arch/riscv/kernel/time.c
> +++ b/arch/riscv/kernel/time.c
> @@ -30,12 +30,3 @@ void __init time_init(void)
>         of_clk_init(NULL);
>         timer_probe();
>  }
> -
> -void clocksource_arch_init(struct clocksource *cs)
> -{
> -#ifdef CONFIG_GENERIC_GETTIMEOFDAY
> -       cs->vdso_clock_mode = VDSO_CLOCKMODE_ARCHTIMER;
> -#else
> -       cs->vdso_clock_mode = VDSO_CLOCKMODE_NONE;
> -#endif
> -}
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index 55dad7965f43..c416e5e934bf 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -77,6 +77,11 @@ static struct clocksource riscv_clocksource = {
>         .mask           = CLOCKSOURCE_MASK(64),
>         .flags          = CLOCK_SOURCE_IS_CONTINUOUS,
>         .read           = riscv_clocksource_rdtime,
> +#if IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY)
> +       .vdso_clock_mode = VDSO_CLOCKMODE_ARCHTIMER,
> +#else
> +       .vdso_clock_mode = VDSO_CLOCKMODE_NONE,
> +#endif
>  };
>
>  static int riscv_timer_starting_cpu(unsigned int cpu)
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
