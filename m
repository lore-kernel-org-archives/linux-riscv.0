Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABE9C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 20:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0oE020jrRc64jgldJtGvxv+c7A7CjmBBC/lfoM5HGSk=; b=ZaZ1Yjg46SwRWC
	0KbNaX20ffZgvDy37eOFytEhpZWF8iZDlEw4mamZPk2sFHCztIQ7r9m1HlpbrPQERvOefouR1YRzw
	dq9xo1vp98hnO9ZTCfQJazmmx8X+XKueD72AkfwKXRkXK4rzylUvr13QD80MPlGzdUIsb9gA12aGe
	X52/h0gRiCsJ/ZBaddSNdci7x04MJnast/RLU9Re1mrT0DoicH5a2Cm+jZceX3uLl6Sft0gM+4NhE
	kPZLEJ57saxkQL6eGq/B/NE/a/3LxV+pR8NctqmPf7ecEYR/hq3vPToL/4I+7E+93F0mZAncfxjJm
	HYe0psh+7ftWVICK3FCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJhkz-00GorZ-Tp; Mon, 14 Feb 2022 20:15:33 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJhkx-00GorB-E6
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 20:15:32 +0000
Received: by mail-yb1-xb30.google.com with SMTP id j2so49814975ybu.0
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 12:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fc6F8UmVPobantRNaLLTN28a7rasUnDLwQKG9SVLzq0=;
 b=aH+paiSV3sgIYtrkaCwxKQbsjv6znZtteAiqoHHOb6AC3qgvXrFUWQj0XcZoTZMINW
 XGUKwFueUMXH5XAOnIH7ou9f4U9hG/LV426XR5UXme06/t0rUorIkOZtPQyonJWN4BwT
 5Ifzqabl/THZ4Om0V+h+tNsYSgSPCC7lN2+5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fc6F8UmVPobantRNaLLTN28a7rasUnDLwQKG9SVLzq0=;
 b=Ew8w1LX85ak6Vg6eCF9oTmrVKy0xOeQdy8hFEPWxpMY7CIxYXXd+Ovw/iMy/yLZDEq
 7zsFbHS8IX8fo2qd6r8jPm1ZbUXsLiq0JL/m/ln/2aw9tVJsxNW3Hs5jZjtaq1pU0r3n
 YTBo6iggRc37bEmWZmIi8DlcyrrEdpViCw8h67zK/RscTAQjU9HlDmZnSUt8Pwt+nssV
 sHZe+nOUsUu/RbLwDSYMnLphn9yDp2MqVKdaSGoimTfQw5V6doJjYPboAso8EuNo6agP
 WZc4nSm0rdy5BVEVWZjKvVwVtBEZvTAgHDNE9Xb4Q2QvHcz0CHMjkLYI/Dyx49lszKrZ
 c3OQ==
X-Gm-Message-State: AOAM533mIZZNIpOaLVl9e3mae6hM1T6lDb5Lp7ul+Is1724Zl5ID+KDb
 RN0crO1rkGfiCQYeB1RyDXx1P9x5nDxuLv7JBPio
X-Google-Smtp-Source: ABdhPJyfD2IesL3G/kU5m4HDGWuI/SKkArsW+wmg8ZWWtd9oGt7ZFjsXIxQ2DmTeIpsuWYk9K0Ng0fGqp9UWtHIi2NA=
X-Received: by 2002:a25:73d5:: with SMTP id o204mr818084ybc.472.1644869729891; 
 Mon, 14 Feb 2022 12:15:29 -0800 (PST)
MIME-Version: 1.0
References: <20220210214018.55739-1-atishp@rivosinc.com>
 <20220210214018.55739-6-atishp@rivosinc.com>
 <877da2xu32.fsf@igel.home>
 <CAMuHMdX4P82B96ZbANyF6cWo9CnrW9hg5up6pCb0PZ99=sPZ_A@mail.gmail.com>
In-Reply-To: <CAMuHMdX4P82B96ZbANyF6cWo9CnrW9hg5up6pCb0PZ99=sPZ_A@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 14 Feb 2022 12:15:19 -0800
Message-ID: <CAOnJCUKvE7Q2C+DOLdeQH_Qh44aUvdMydW9DUTrFQRxYWHGYgA@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] RISC-V: Do no continue isa string parsing without
 correct XLEN
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Atish Patra <atishp@rivosinc.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_121531_498516_76CA85CC 
X-CRM114-Status: GOOD (  21.84  )
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

On Fri, Feb 11, 2022 at 4:52 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Andreas,
>
> On Thu, Feb 10, 2022 at 11:00 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
> > On Feb 10 2022, Atish Patra wrote:
> > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > > index 469b9739faf7..cca579bae8a0 100644
> > > --- a/arch/riscv/kernel/cpufeature.c
> > > +++ b/arch/riscv/kernel/cpufeature.c
> > > @@ -84,6 +84,7 @@ void __init riscv_fill_hwcap(void)
> > >       for_each_of_cpu_node(node) {
> > >               unsigned long this_hwcap = 0;
> > >               uint64_t this_isa = 0;
> > > +             char *temp;
> > >
> > >               if (riscv_of_processor_hartid(node) < 0)
> > >                       continue;
> > > @@ -93,6 +94,7 @@ void __init riscv_fill_hwcap(void)
> > >                       continue;
> > >               }
> > >
> > > +             temp = (char *)isa;
> >
> > There should be no need for this cast.
>
> Indeed, but only if "temp" is changed to "const char *".
>

Yes. Fixed it in v3. Thanks.

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
