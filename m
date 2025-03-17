Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A583FC282EC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 08:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q0V/tgKX4GCCRx71N36x8UCXHhQw1YUC2qvWoN6T6s8=; b=Q9GmJ7MQEVqOvv
	tRV3iZUTpdhhCm9B/pNtYrtFjPdD8T6pqE8sj0J488ZW3OY3zcWXnK+5br8RtK6VlL311xiGB5LQF
	bLUIqGaCkBifQaPiWioBZ879UJtO3iY/2MIAuGcR+un82e9WCnQPoS7Whdv08h061GZUNoGLL+3J5
	5096o7F87fgMcg6++s92ZcDbtN+cen4hTeiRP0USM3vm+f34gXeGYGPJ1lAGs9QHDZTHVxyPZxdbp
	0yGJV5tWsH63D3qQuo6a7DiRiq8h6nLrkOsNzYdWJtS+XoAnKVOXaPENa/E1esgCA4ijpxhEWeZb2
	Qzb3bB66tYDjxD5raCgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu5gF-00000001hhI-02pF;
	Mon, 17 Mar 2025 08:18:39 +0000
Received: from mail-ua1-f42.google.com ([209.85.222.42])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu5gB-00000001hg9-2u6U
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 08:18:37 +0000
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-868ddc4c6b6so1804493241.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 01:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742199512; x=1742804312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHo+opHkohWj4HkGFv6lxx1lupJr0F8BlUKSDFasPds=;
        b=jGHd4eR7l/xbf0+H/eo3MTpp0oj8gNuQB+Xq7DNZQFcTCZhgOeX8DDgLj/HBK6QdCQ
         TVyoIKB5YX++wYFlIK32CwRmuau12f4PMqFvGCP0RYe1X1j+3RbPDCEWO8K7HG5um8ZZ
         JU0X8nhXe6HoM7Wnh7zRNVPpzIR+/LtKDwwY5hCa/Dx7eNsK/kWhD94zkZBWMQfvch4+
         sXg3TP4omWWM5rsr0+unwLx98usm6DElRfi12E/vgIVSfs0M5V2vRSSNGaNEKcMMNRCp
         lE6kYXKwMRqTaIu35nTMzVqxKHJvT/dJygnPIcBSGCnI+9ByJmoBZbrpk+YpgFfcgU5q
         62fg==
X-Forwarded-Encrypted: i=1; AJvYcCUjYDPK6ILcTC8Ng/SeZjxYPh2VY3+ze/5/ZQASoPBYhOEqdSqSjhV2KIsSpv/nsSUMEc4IzIHwrIc52A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxyd5qx9FGVFJuGJtMLT4QnZNiNFy84F12TQb628IAmdnrtbyHc
	WGEMUsMpMtKvNYFC/TVY1Jl33nPY8bTYqwCQ22lkoW9iSMRKnWXaxO35G74y
X-Gm-Gg: ASbGncsUkn7eeU29BYtsGLQboBPzl1l95ix7WqLS61DSbYIfuyPetjMyw4/v2oWJFvJ
	Le+l/xjdXY3XAqtE01hrd1pwEmQCwql/7iFFRlt6i2wXK9DjXBvYTCH7qHxajMLDIa3CZYQ3UW9
	vCR0qh5f9yw+MH0xYwtG9O1z5FH+W/vRd63pzoGNXlTiQUuHhegEOUI+p/AoOrvzYDGQXbRwdBA
	08rkxPd8/XqIWI98247o1BXCtia+L/9KhhPT15ZVc2h4pvWPvh2f9KAqk0YVnrMWILvWWts0NEN
	oTSfbupLp0gEFHthkBFBrqBFL/N+/RwryeEQ2fvi3+HnFI/FCJlQ7TFHA/gNAD/KRZqhpixHg1w
	66k5I4409EPs=
X-Google-Smtp-Source: AGHT+IGc95Lni7ImITaJOuGOsOyz7BZwmJMEKAcn51oJpipf/N0NljUqjxstq46a/jEI4wee7C+0lg==
X-Received: by 2002:a05:6102:442c:b0:4c2:2beb:b726 with SMTP id ada2fe7eead31-4c383139884mr6397631137.10.1742199512304;
        Mon, 17 Mar 2025 01:18:32 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c3759dd36bsm1446246137.18.2025.03.17.01.18.31
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 01:18:31 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5242f137a1eso1557254e0c.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 01:18:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOIX6lvLLLx6j390dWNWsq/209hXqOewBry3XxxM1f29kCDSUHkIEpFyB/GESkoZCr0RC0t1iTd7Mctw==@lists.infradead.org
X-Received: by 2002:a05:6102:148c:b0:4c1:76a4:aee4 with SMTP id
 ada2fe7eead31-4c3831f6b73mr7790718137.19.1742199511494; Mon, 17 Mar 2025
 01:18:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org>
In-Reply-To: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Mar 2025 09:18:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV4xWLEuCvCC54GBfCdELE=QSHqaOyUPD-ezE0QLYRnVA@mail.gmail.com>
X-Gm-Features: AQ5f1JrIBpkwjNryxJfQFaslTevdePU3lGPPs76Z4xJvDEvLswRAjXO6120Ar_8
Message-ID: <CAMuHMdV4xWLEuCvCC54GBfCdELE=QSHqaOyUPD-ezE0QLYRnVA@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: spacemit: enable config option
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alex Elder <elder@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>, 
	Alex Elder <elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_011835_731793_270A6E64 
X-CRM114-Status: GOOD (  22.53  )
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

Thanks for your patch, which is now commit 7ff4faba63571c51
("pinctrl: spacemit: enable config option") in v6.14-rc7.

On Tue, 18 Feb 2025 at 01:32, Yixun Lan <dlan@gentoo.org> wrote:
> Pinctrl is an essential driver for SpacemiT's SoC,
> The uart driver requires it, same as sd card driver,
> so let's enable it by default for this SoC.
>
> The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
> 'make defconfig' to select kernel configuration options.
> This result in a broken uart driver where fail at probe()
> stage due to no pins found.

Perhaps this is an issue with the uart driver?
I just disabled CONFIG_PINCTRL_RZA2 on RZA2MEVB (which is one of the
few Renesas platforms where the pin control driver is not enabled by
default, for saving memory), and the system booted fine into a Debian
nfsroot.  Probe order of some devices did change, and "Trying to
probe devices needed for running init" was printed.

> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
> Reported-by: Alex Elder <elder@kernel.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Tested-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

> --- a/drivers/pinctrl/spacemit/Kconfig
> +++ b/drivers/pinctrl/spacemit/Kconfig
> @@ -4,9 +4,10 @@
>  #
>
>  config PINCTRL_SPACEMIT_K1
> -       tristate "SpacemiT K1 SoC Pinctrl driver"
> +       bool "SpacemiT K1 SoC Pinctrl driver"
>         depends on ARCH_SPACEMIT || COMPILE_TEST
>         depends on OF
> +       default y

Ouch, fix sent...
"[PATCH] pinctrl: spacemit: PINCTRL_SPACEMIT_K1 should not default to
y unconditionally"
https://lore.kernel.org/6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be

>         select GENERIC_PINCTRL_GROUPS
>         select GENERIC_PINMUX_FUNCTIONS
>         select GENERIC_PINCONF

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
