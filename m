Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F95C282EC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 13:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F0tZc6zckx8jLJxJdFuHdZxFcKQbaDvLhodRO0YqK3A=; b=C1ymiSZ0f/u80+
	sqIfcEiQDlZMfakQVHziekj+xqfp7RdN81/KMzblMGhfZOz9ZKix5WJV351oJpQW2yEHCDzsLGenR
	FXa0Qh3GQcz+Qh6qVRG4LUoQ9WKWdN0gf5IH/1rwbyqL2z06mCfSxOABEJcEOY3T0KGkCpZHaOWc4
	HqaQ1cLE+Zap4Bcw3ubnuzCpbRcnW54At2ZZ4GiI35jkJqJGBIkFB0w+sw5yiIV6wFdLY0/a/Hwcq
	O6JS49qMLqcuO/u8T94/yhHPUm7WYrOWRDVkwHor4YIGiRkmj79PK1tJ7z7d1vuUu48cvSeZEZ1+Q
	1+GrlOYaDEVy6qTWjgJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuA6J-00000002exq-20kp;
	Mon, 17 Mar 2025 13:01:51 +0000
Received: from mail-vk1-f175.google.com ([209.85.221.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuA4W-00000002eZG-2e8B
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 13:00:02 +0000
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-524038ba657so4298333e0c.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 06:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742216397; x=1742821197;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKVz0H8Y7Bgxhan9DFR3lBg40nko18FBpH/VH8EUG10=;
        b=a570JsC6NuMODGntW0vX1Jl+kleEs1EJ3LrGhoiaE4/heOkDJu2TnKexvjNpzNMrYv
         wH6l4uuUHu76WIOuYG3W1caxEfSo96wWEdoR0ukwlPBjC9TJ6mJxkb+D3SPqyh8bzbHo
         E/QdCpr9NCbf3EWz0CdPGm70uCcQ+TCTKUplYkFoQhtYuZMPz/GbWdCGmcfExG1X0sJU
         iNw+/3xeedID9d5HS3Sqbkd6rLoFx90LQrI43LJRWCt6q3RFKrA6JNrn/O+OtX4p+N4O
         xgTnh+T+9/SvXwtUWEjx8LX9wW+LnQMddnn5KbnL/nWNSdRMExw+CiUUAvEQqcoRyE46
         3sog==
X-Forwarded-Encrypted: i=1; AJvYcCX/G82UQgVJIsD1feK7WFzFxuQG5RmZz/plm8LKcJSDa1H4MYrHBsfMaC/LRV5OjPe0VFYz+qI/BocHuA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzdj6PTh+6OdsA07mSd7+lor0+pySgj2jOxbPqXhH6fZV6DcYhR
	pfIKqJ7eb7Q/6bO9pyRe2otvzqu+0W1LAhHeHaUGdclx94VQgqharrQg2eK1
X-Gm-Gg: ASbGncutt3eS/fctbqgoJMbKUIXqz6K1B9/PyjsjmFU2eUjZ9LrW8YsZaBKaH42KL2B
	3FVv7RK9tFR9VsWnsXTNP+bKSFMCWvRcqaHe9Bz/sCglZUq3QSMzWfMbx05Ce2KebANJSyzh5Ok
	8mVNdP920OolCbU7Am4iUvEoO8rD4E9FcFKNZ3JV8jt9O39CA2ztDKwpLpq4ee/ZAe7CjdnXrQR
	Khe3hEdZUmQb/ece2j59TnikvFCAN1pb0qHZsBOgCYRUYXEKyp8YMcMB8RTD7gLWGGxq0vpzmhc
	CS2X9fjzzIaY6CkauVrg0zbk0YhVbEPo125D4ztsuh+VZFLy2hQAxYR6Yb0d7W38lDUfFIU0cJx
	g5d99cb4=
X-Google-Smtp-Source: AGHT+IGTMa5PXTpQGVZOFSfxTPknmaFpwjHW/pFxnisCAPKdvlQzOrd1RNt/HuFIY4TrNfcuRugvCw==
X-Received: by 2002:a05:6122:91e:b0:51e:ffd1:67f3 with SMTP id 71dfb90a1353d-5244af1dacemr5737630e0c.7.1742216395680;
        Mon, 17 Mar 2025 05:59:55 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5243a5817b4sm1575188e0c.8.2025.03.17.05.59.55
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 05:59:55 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86d587dbc15so3865870241.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 05:59:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUkXJp+l8lWgF5NTDJSn0X3OTzi1yRwYWhRWk7RywhOL2vB3ekIWi29aFQnQXx54gOLFVavFfXUcE+69g==@lists.infradead.org
X-Received: by 2002:a67:f057:0:b0:4c3:9af:9134 with SMTP id
 ada2fe7eead31-4c371bc669bmr9558320137.4.1742216395284; Mon, 17 Mar 2025
 05:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org>
 <CAMuHMdV4xWLEuCvCC54GBfCdELE=QSHqaOyUPD-ezE0QLYRnVA@mail.gmail.com> <20250317124120-GYA1983@gentoo>
In-Reply-To: <20250317124120-GYA1983@gentoo>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Mar 2025 13:59:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWM5ymPVRe36+Atr0cDAdRGyw39jFJvE+9PWTUUiiMfCg@mail.gmail.com>
X-Gm-Features: AQ5f1JroT5lBrXCjHhRfNdJVSpXUexSZ0r_yj1ykAz2lnhY9dJFD1lX9QxdNGDY
Message-ID: <CAMuHMdWM5ymPVRe36+Atr0cDAdRGyw39jFJvE+9PWTUUiiMfCg@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: spacemit: enable config option
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alex Elder <elder@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>, 
	Alex Elder <elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_060000_672335_1092F5B0 
X-CRM114-Status: GOOD (  35.23  )
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

Hi Yixun,

On Mon, 17 Mar 2025 at 13:41, Yixun Lan <dlan@gentoo.org> wrote:
> On 09:18 Mon 17 Mar     , Geert Uytterhoeven wrote:
> > Thanks for your patch, which is now commit 7ff4faba63571c51
> > ("pinctrl: spacemit: enable config option") in v6.14-rc7.
> >
> > On Tue, 18 Feb 2025 at 01:32, Yixun Lan <dlan@gentoo.org> wrote:
> > > Pinctrl is an essential driver for SpacemiT's SoC,
> > > The uart driver requires it, same as sd card driver,
> > > so let's enable it by default for this SoC.
> > >
> > > The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
> > > 'make defconfig' to select kernel configuration options.
> > > This result in a broken uart driver where fail at probe()
> > > stage due to no pins found.
> >
> > Perhaps this is an issue with the uart driver?
> > I just disabled CONFIG_PINCTRL_RZA2 on RZA2MEVB (which is one of the
> > few Renesas platforms where the pin control driver is not enabled by
> > default, for saving memory), and the system booted fine into a Debian
> > nfsroot.  Probe order of some devices did change, and "Trying to
> > probe devices needed for running init" was printed.
> >
> my problem was CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled, result as
> # CONFIG_PINCTRL_SPACEMIT_K1 is not set
>
> for your case, is CONFIG_PINCTRL_RZA2 built as module?
> it should work for uart driver with deferred probe mechanism..

No, CONFIG_PINCTRL_RZA2 was disabled in my testing.

> > > --- a/drivers/pinctrl/spacemit/Kconfig
> > > +++ b/drivers/pinctrl/spacemit/Kconfig
> > > @@ -4,9 +4,10 @@
> > >  #
> > >
> > >  config PINCTRL_SPACEMIT_K1
> > > -       tristate "SpacemiT K1 SoC Pinctrl driver"
> > > +       bool "SpacemiT K1 SoC Pinctrl driver"
> > >         depends on ARCH_SPACEMIT || COMPILE_TEST
> > >         depends on OF
> > > +       default y
> >
> > Ouch, fix sent...
> > "[PATCH] pinctrl: spacemit: PINCTRL_SPACEMIT_K1 should not default to
> > y unconditionally"
> > https://lore.kernel.org/6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be
> >
> I got suggestion in v1
> https://lore.kernel.org/all/20250211-nature-kilt-9882e53e5a3f@spud/

Yeah, I read that, but only after I noticed the issue in v6.14-rc7.

> so for COMPILE_TEST case, ARCH_SPACEMIT config won't be enabled? then neither PINCTRL_SPACEMIT_K1
> anyway, I'm fine with either way, thanks
>
> > >         select GENERIC_PINCTRL_GROUPS
> > >         select GENERIC_PINMUX_FUNCTIONS
> > >         select GENERIC_PINCONF

It depends. ARCH_SPACEMIT can be enabled only when building for
RISC-V, while COMPILE_TEST can be enabled everywhere.

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
