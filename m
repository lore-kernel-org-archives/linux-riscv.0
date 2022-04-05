Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4181BC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 22:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5EV9NbmjI4UCboxzPzVuWox1YqmzHB5UQ9IxOh0ov/4=; b=cLBIVtJsW8mHPC
	CB0o7MEteii0WXqX7K+ndLmluYuKKZj3/NANOJQN4kZEHpyF7d+ZSCeJ0YwVMdoD7rg8OrqUxDxyB
	/zU4H570iTRg6Wpiqs8TrY+q9ZWoCveXEJv77STxIRqyAnEvaPv9+Wj7VzQI7Xr1dMdkTxMJRccLw
	A0qb+4T8GudSm3oemwssDqrrJXlDBkiDYnmeBzddXaO6uAFxBv/1AsRLO/THUiPescxRFWT0sOJZ0
	dxXZ1ahjW7tpFA5iGxN8WtfvFN4RM2oxb5ycq/Amvr9oEIEuXuRfXph699Ip0urJfcymNaKUcyDFZ
	oiZ+RS+1Dz6j3uhOj5Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbrEt-002pWZ-AF; Tue, 05 Apr 2022 22:01:27 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbrEq-002pVc-AT
 for linux-riscv@lists.infradead.org; Tue, 05 Apr 2022 22:01:26 +0000
Received: from mail-wm1-f50.google.com ([209.85.128.50]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MUGuZ-1nTv9u3K0h-00RGcm for <linux-riscv@lists.infradead.org>; Wed, 06 Apr
 2022 00:01:21 +0200
Received: by mail-wm1-f50.google.com with SMTP id r7so310230wmq.2
 for <linux-riscv@lists.infradead.org>; Tue, 05 Apr 2022 15:01:21 -0700 (PDT)
X-Gm-Message-State: AOAM533kpDjOpEC2JuyNvoalAzhLyq/8+cU1eRmgll1ysZbAh9PzTKQR
 fcVY42Qkc0j4/CteH6cBPxignNWUAMsulqBqO9A=
X-Google-Smtp-Source: ABdhPJwpFnYfoC7W3fhpROG/ZwOFBskHRE+B4cQmOeYyUSah/jNs/fMR9Xj0LBcXz7SwKs3p7LpOSW2RcQmAA/Xxjtc=
X-Received: by 2002:a05:600c:1e0b:b0:38c:9ac5:b486 with SMTP id
 ay11-20020a05600c1e0b00b0038c9ac5b486mr4749875wmb.71.1649196081307; Tue, 05
 Apr 2022 15:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <Yib9F5SqKda/nH9c@infradead.org>
 <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org>
 <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <20220405212653.GA2482665@roeck-us.net>
In-Reply-To: <20220405212653.GA2482665@roeck-us.net>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 6 Apr 2022 00:01:05 +0200
X-Gmail-Original-Message-ID: <CAK8P3a396EkfQtmkwo80eB9i7F37S=mvrHtCLXhGDhHBczYK3g@mail.gmail.com>
Message-ID: <CAK8P3a396EkfQtmkwo80eB9i7F37S=mvrHtCLXhGDhHBczYK3g@mail.gmail.com>
Subject: Re: [RFC PULL] remove arch/h8300
To: Guenter Roeck <linux@roeck-us.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@infradead.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Max Filippov <jcmvbkbc@gmail.com>, 
 Linux-sh list <linux-sh@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 Greg Ungerer <gerg@linux-m68k.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-Provags-ID: V03:K1:JwUfoKBlHCa0cuTlWOEsACWKdDUSohMCrVdozF4B/lvYubgmlBi
 cDeP5MQmDcA6JwYsi+x9ZGsGa/4uXI0UZILrT0JjIw3uYcNpSQy0yid53EO4dG79IsRNI0S
 /95Nig+/JlW8b3nN7oexHxI3Jtpe8ONtLty7cY3SVqVOKh6eKGQAL0NjGXNub2hXnH8gXzw
 JzlL9+mT7R31AtMsnZ3KA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:guODVwKnaKU=:JeQEUxnflkXDgJw3BQNaPp
 NSd/96sC9tw2ewhH/9U6VsA+rPJq/cCJ6w73HpfB0Bu5q9b12+lPmvSbT6Eie6+fLt3VzOxM6
 O6IzwukTge+xH+2SAbR/QhoXTvSQgnXxN6uCjnbIZBLPtjdLM8cFLMNQDXSyHkkKvlSSZYeOc
 Aw9tegFvmZMbFTZfA1HAbFlpIrAVTKkampm/bYA6boEfuIuWKb5m1wdxiGdfzB/4oFLAG+2uN
 maSha0FUtTZHw/3AEj173CHe/qNyiQXuXcHQOv5OHKvCBUYNNL1zj0sveKzOn/FdvKiPFhrt4
 HY8DwOjkp0Fr5dv4nd5PsWkqb0k98tt9zKm1uBXgke5qzQutAE8vm2gW1oNiyPU4+SnHIRwoS
 kIZRQ/Cbv5/4OD9Yf0ln/NMkKRcfjfXHOd/nNKtbZhLTgXm0s/R+JqxJN9uiVoXyOOtashBOR
 DNcsqfPsfyCq6iJ++w4dlUEvfylPr9MmmUA99eNM2ZH6JgOEAWT5mxFoEy97fzbiJHdc8NdgA
 QcGOFfT7iT95fUFFvg6fiBXbiioyXfCLqgI4osUmJ19aRPBG9sUJw+WTOkyQ0wXHZbS09sskV
 wGsN9dcHBLieOAiGIEEqdIGjA7uUp8FalgyL51+ONpkrTP8vFO2cc8/K67IzeMQsHvq0CUgQn
 VaCZpHpE5WX37YiEVrrJO9xwNkCEFm+P0slCXcr53HtqsUAIlCjLbRH4CYqUG0QoXpww=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_150124_694183_AFA0900B 
X-CRM114-Status: GOOD (  26.79  )
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

On Tue, Apr 5, 2022 at 11:26 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On Mon, Apr 04, 2022 at 03:07:06PM +0200, Arnd Bergmann wrote:
> >
> > Should we garbage-collect some of the other nommu platforms where
> > we're here? Some of them are just as stale:
> >
> > 1. xtensa nommu has does not compile in mainline and as far as I can
> > tell never did
> >    (there was https://github.com/jcmvbkbc/linux-xtensa/tree/xtensa-5.6-esp32,
> > which
> >    worked at some point, but I don't think there was enough interest
> > to get in merged)
>
> Hmm, I build and test nommu_kc705_defconfig in my test system.

What toolchain do you use for this? Max already pointed out my mistake
regarding xtensa, which I thought does not build at all, but just needs
a toolchain specific to the cpu.

> > 2. arch/sh Hitachi/Renesas sh2 (non-j2) support appears to be in a similar state
> >     to h8300, I don't think anyone would miss it
> >
> > 8<----- This may we where we want to draw the line ----
> >
> > 3. arch/sh j2 support was added in 2016 and doesn't see a lot of
> > changes, but I think
> >     Rich still cares about it and wants to add J32 support (with MMU)
> > in the future
> >
> > 4. m68k Dragonball, Coldfire v2 and Coldfire v3 are just as obsolete as SH2 as
> >    hardware is concerned, but Greg Ungerer keeps maintaining it, along with the
> >    newer Coldfire v4 (with MMU)
> >
> > 5. K210 was added in 2020. I assume you still want to keep it.
> >
> > 7. Arm32 has several Cortex-M based platforms that are mainly kept for
> >     legacy users (in particular stm32) or educational value.
> >
> I do build and test mps2_defconfig with qemu's mps2-an385 emulation.
>
> I am not saying that those are actively used, and I don't mind dropping
> them, but they do still work.

To clarify, the list was sorted based on what I expected to be the least to
most actively maintained ones, with the stm32 clearly being in use,
and above it in the the list somewhat less.

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
