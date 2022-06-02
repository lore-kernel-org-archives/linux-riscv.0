Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F49C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 16:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jke66PhzPd8udIztzazsgGRrZm0c1hwqLVR9Mo8h4Lw=; b=3uCZ1cU8lZKoID
	GTW7iDqyqhzMNhb1h/xzcWgJhgHlu4ci/CdkgTiQrxsGizYsKvtSBdrpnPg5kZeTCuHGSxe04qI//
	lj/ckI5wXGfq02YoP1smhMeyweaVIhvIb54wRFexdAuUw5zYKUQstGj4T0NdBZaDW4jBUsIwl0Ycy
	lEUWChm/kt5tiVH4efIm3g9bRzxSi6XtOA5LJPnLAA6bTa6IRd/oGcHNDI9eAUBVceUKVdaDk1chC
	8ygdP/3Jkia5NOjYtxAZtv1/nkKMKJm44wqR2LFpbF8JPnBs+fAJdwpZoDVpav4ToIB9unvvwCbdR
	WIZNHalEgEJl/CWHDUOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwnkE-003mjt-Mz; Thu, 02 Jun 2022 16:32:22 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwnkC-003miI-77
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 16:32:21 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-30c143c41e5so57052347b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jun 2022 09:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rS5gS+fn8mZ9FxTmxazll5DMWWGBqtfoZzI/ultI6rI=;
        b=Xt8YQow8U2MnL3XlWTSeeLF/7QQQ8PzHRBuXmrtlX/go27tiz+R+uWa9AeAmTU+lAZ
         w42l25Z5rhPozysff08XV5UkWieSgPTwwOZevPXQCWZsWNpBb2nc7hA3NBEaRXHwpr8O
         TZ2qmhuN/IsMUnidz1swvsvNzknbdzRAnUKmF8NzQ8jG8MG6Sgpwt5feIWR3L3s7yfZH
         9YGg2VT2FB55vCYzpQLHlEwOkNdxfZK/nmmd8pmDv3ZI68+UK/oJastE5Ev760eUfk4+
         NSXdVzMcOBfvVvzXArQsyjMGFgngRTp+kA2GYCBYIZeTGKQJRAv8UJg330sYtrKF4oYd
         32tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rS5gS+fn8mZ9FxTmxazll5DMWWGBqtfoZzI/ultI6rI=;
        b=d9AR6Qkqbj5GdTiRkh9cwSQCQ2HDoMbKfbgA8XkvWe3fjG6KkgfUMqbi6BZuL+ay6n
         5U0B4kQw3TUqc3Ud+xmhdBNdRozF6e4BeojIui748qoBoozvGh9y/pJSqTpIvvmXfmeA
         VSxzz6vvUSoRG6G6rb6/RkRhIHgyEZFksTaJ5ai2+r3OXHKZ7JGQVkfMlwMv+tj8zlNl
         LVUdzdsET4dgK/Mqfu6qPRqcEaRKCopnLVv/9FVEw2UJFxQ0tusB8hsabqngJIfvE20H
         gWCr+R4w23yQlWhZ1SZM74mm5R8Y4gYZtmT1wRTJ7KBFk8XAmxgYx5obS5T9FjtcAVDG
         vEOA==
X-Gm-Message-State: AOAM532ekwWzdeDzaYWenV5Nj05kV7zmFh4BUCJN4vy91ecvP3/cn/0L
	n/cB/1XVrMbZuIds1KIv3jyaXa4L1P1J6R1OgZq0yQ==
X-Google-Smtp-Source: ABdhPJz5r0n7rO8qC8FvUdDsf+kN20ePFUa060Hsv6JqvH//cpu+cYddcJdJw8uEDLDdrcs/9X0O3s+REUKffh4FMGk=
X-Received: by 2002:a81:920e:0:b0:30c:201e:b3d1 with SMTP id
 j14-20020a81920e000000b0030c201eb3d1mr6623178ywg.374.1654187538043; Thu, 02
 Jun 2022 09:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220602141032.169907-1-christoph.muellner@vrull.io> <cc1a2594-3596-a8e6-077d-183e69e3f4e7@infradead.org>
In-Reply-To: <cc1a2594-3596-a8e6-077d-183e69e3f4e7@infradead.org>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Thu, 2 Jun 2022 18:32:06 +0200
Message-ID: <CAEg0e7jER4EssW53Rm_dnxj3uHxQvmu2c9ntPWT9ObbdSFOWzg@mail.gmail.com>
Subject: Re: [RFC PATCH] riscv: Add Zawrs support for spinlocks
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christoph Muellner <christoph.muellner@vrull.io>, 
	Heiko Stuebner <heiko@sntech.de>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	Aaron Durbin <adurbin@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_093220_286886_5A7A6C01 
X-CRM114-Status: GOOD (  34.46  )
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

On Thu, Jun 2, 2022 at 6:24 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi--
>
> On 6/2/22 07:10, Christoph Muellner wrote:
> > The current RISC-V code uses the generic ticket lock implementation,
> > that calls the macros smp_cond_load_relaxed() and smp_cond_load_acquire().
> > Currently, RISC-V uses the generic implementation of these macros.
> > This patch introduces a RISC-V specific implementation, of these
> > macros, that peels off the first loop iteration and modifies the waiting
> > loop such, that it is possible to use the WRS instruction of the Zawrs
> > ISA extension to stall the CPU.
> >
> > The resulting implementation of smp_cond_load_*() will only work for
> > 32-bit or 64-bit types for RV64 and 32-bit types for RV32.
> > This is caused by the restrictions of the LR instruction (RISC-V only
> > has LR.W and LR.D). Compiler assertions guard this new restriction.
> >
> > This patch uses the existing RISC-V ISA extension framework
> > to detect the presents of Zawrs at run-time.
> > If available a NOP instruction will be replaced by WRS.
> > A similar patch could add support for the PAUSE instruction of
> > the Zihintpause ISA extension.
> >
> > The whole mechanism is gated by Kconfig setting, which defaults to Y.
> >
> > The Zawrs specification can be found here:
> > https://github.com/riscv/riscv-zawrs/blob/main/zawrs.adoc
> >
> > Note, that the Zawrs extension is not frozen or ratified yet.
> > Therefore this patch is an RFC and not intended to get merged.
> >
> > Signed-off-by: Christoph Muellner <christoph.muellner@vrull.io>
> > ---
> >  arch/riscv/Kconfig                   | 10 +++
> >  arch/riscv/include/asm/barrier.h     | 97 ++++++++++++++++++++++++++++
> >  arch/riscv/include/asm/errata_list.h | 12 +++-
> >  arch/riscv/include/asm/hwcap.h       |  3 +-
> >  arch/riscv/kernel/cpu.c              |  1 +
> >  arch/riscv/kernel/cpufeature.c       | 13 ++++
> >  6 files changed, 133 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 905e550e0fd3..054872317d4a 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -358,6 +358,16 @@ config RISCV_ISA_C
> >
> >          If you don't know what to do here, say Y.
> >
> > +config RISCV_ISA_ZAWRS
> > +     bool "Zawrs extension support"
> > +     select RISCV_ALTERNATIVE
> > +     default y
> > +     help
> > +        Adds support to dynamically detect the presence of the Zawrs extension
> > +        (wait for reservation set) and enable its usage.
> > +
> > +        If you don't know what to do here, say Y.
> > +
>
> With this patch, it is possible to enable XIP_KERNEL and
> RISCV_ISA_ZAWRS at the same time.  That causes a kconfig warning:
>
> WARNING: unmet direct dependencies detected for RISCV_ALTERNATIVE
>   Depends on [n]: !XIP_KERNEL [=y]
>   Selected by [y]:
>   - RISCV_ISA_ZAWRS [=y]
>   - RISCV_ISA_SVPBMT [=y] && 64BIT [=y] && MMU [=y]
>
> because RISCV_ALTERNATIVE depends on !XIP_KERNEL:
>
> config RISCV_ALTERNATIVE
>         bool
>         depends on !XIP_KERNEL

I will add a "depends on !XIP_KERNEL" to RISCV_ISA_ZAWRS.

Thanks!

>
>
> >  config RISCV_ISA_SVPBMT
> >       bool "SVPBMT extension support"
> >       depends on 64BIT && MMU
>
>
> --
> ~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
