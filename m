Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F170CC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 13:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mE07hgmiuxkvtmOC+O2Odd/TR1VgvM+AG3s+XhIj6T0=; b=AnpFt56QYeODax
	TkE7YGwOi5etuPqwDlej0FLnmt+JggFfN7DKKHd/KXwSbphSEADCByBVEzwoCjG/j92XcFSGhvW/q
	i/wBXG7WMfwrzFwr88Snxdeoz7kX+v5V6/KOUgMzY2YuqXl3g59HaP6zaepddS0skI1SUPPrdOHVw
	M+MUbvFBhOK//hRl7NwY6ozZ/ZAX+wI3XdAaZBLDcpoz6QbN1TS+++5DaEfppo29bebzs003ZYuiM
	ardNDJkWCztf0HNxpmjGaPRVt7ZP48ZQooLwQp78LOuAZ1ocNxkT6a4WiBFXBvc19E7VX/zQjPJ6R
	voIOesxKjI0FnrTC+k2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okmza-007A4M-3f; Tue, 18 Oct 2022 13:50:50 +0000
Received: from mail-qk1-f180.google.com ([209.85.222.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okmzX-007A2v-4Y
	for linux-riscv@lists.infradead.org; Tue, 18 Oct 2022 13:50:48 +0000
Received: by mail-qk1-f180.google.com with SMTP id x13so8612914qkg.11
        for <linux-riscv@lists.infradead.org>; Tue, 18 Oct 2022 06:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LKYnNweZgxwgNxf4yalBU36d5h/7Dl8cIFGnGJ7yPZM=;
        b=a8r5UrVz+k6z4jZSd/Qh/eQfgQX43bFFFshs6fsM2eNVh9qiE6aa7ilwbyVJB4QLQr
         fotk7/uo8Eyv8QVe8WSQzldG/tQZGtmlaGpHTLfT6+UYN06te7bYNTU9M9hCQVp/kqZT
         AUC/DCPKr3fUBy3yigT6tTITuH5RqN046vdockOM3UvbzOI5/7pilBlbwkxdfgUHLgvL
         nDTLObvJ7mGaAq+gElyrx6C9J/0zXcNiFIdCAZ8rZmQCFax7ylr8Nhdjkq6fO98gtOKr
         53GwpeVbrThBSrg93ey80zN72d8HN/qAp67MlrxlUhmhBQmTQ6EJh43XvEXwLQkS8BUk
         MzUw==
X-Gm-Message-State: ACrzQf2nATSjWHWQWCSytRex95pU/7R+WTa4Gw+7LKqTrU8dEX3z3Ypo
	bpTlvXXI1lsliZkz9YHLP3STTiqVRRcNiuhI
X-Google-Smtp-Source: AMsMyM7NmFEqnVvIXzN0WHOhHgghKiELIg2P/E5zqXexJSOdxfEJe+1skfBjuE7VOtU0Xd9mV2g+HQ==
X-Received: by 2002:a05:620a:444e:b0:6ee:cf2d:6211 with SMTP id w14-20020a05620a444e00b006eecf2d6211mr1857780qkp.399.1666101044453;
        Tue, 18 Oct 2022 06:50:44 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id k2-20020a05620a414200b006bba46e5eeasm2596431qko.37.2022.10.18.06.50.43
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 06:50:43 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id b145so17084187yba.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Oct 2022 06:50:43 -0700 (PDT)
X-Received: by 2002:a5b:104:0:b0:6b0:429:3fe9 with SMTP id 4-20020a5b0104000000b006b004293fe9mr2419104ybx.543.1666101042984;
 Tue, 18 Oct 2022 06:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220905230820.3295223-1-yury.norov@gmail.com>
 <20220905230820.3295223-6-yury.norov@gmail.com> <CAMuHMdUL0WxYjfRDxLWZG7Xu=2xTQkueathvpwWfLpqhG6NkFQ@mail.gmail.com>
 <CAMuHMdW2H4egcmv238Q_5LBeu9BE=H1fm=n4vZGCGYzhg2VN1A@mail.gmail.com> <mvmlepdb66h.fsf@suse.de>
In-Reply-To: <mvmlepdb66h.fsf@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Oct 2022 15:50:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVeHPR_JH0dJ+WSddjd8_hax70JRzd4pqHLNvgbh+-znw@mail.gmail.com>
Message-ID: <CAMuHMdVeHPR_JH0dJ+WSddjd8_hax70JRzd4pqHLNvgbh+-znw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] lib/cpumask: add FORCE_NR_CPUS config option
To: Andreas Schwab <schwab@suse.de>
Cc: Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Andrew Morton <akpm@linux-foundation.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Dmitry Vyukov <dvyukov@google.com>, 
	Valentin Schneider <vschneid@redhat.com>, Sander Vanheule <sander@svanheule.net>, 
	Alexey Klimov <klimov.linux@gmail.com>, Eric Biggers <ebiggers@google.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_065047_203210_74E3E35C 
X-CRM114-Status: GOOD (  20.99  )
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

Hi Andreas,

On Tue, Oct 18, 2022 at 3:41 PM Andreas Schwab <schwab@suse.de> wrote:
> On Okt 18 2022, Geert Uytterhoeven wrote:
> > Moreover, this cannot be used on all systems.  E.g. on Icicle Kit with
> > Microchip PolarFire SoC, CONFIG_NR_CPUS needs to be larger than 4,
> > as the system has actually 5 CPU cores (1xE51 and 4xU54), but Linux
> > runs only on 4 of them.  So you cannot use FORCE_NR_CPUS=y.
>
> But does Linux acually see the E51 core?  On the Hifive boards it is
> disabled in the device tree, and the cpu probing just skips it,
> effectively resulting in only four cpus.

The E51 is indeed disabled in DT.
The CPU parts of arch/riscv/boot/dts/sifive/fu540-c000.dtsi and
arch/riscv/boot/dts/microchip/mpfs.dtsi arre very similar.
Do you get 4 CPUs on Hifive with CONFIG_NR_CPUS=4?

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
