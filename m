Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC42C282EC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 14:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uzymgmX3H+njtv5MrvOpSCqWkXgBqkbzfxKjXeW8Bbg=; b=K90RGWBymfAlu4
	jdWBhekEP4wrrKI/KdLGYJiB/5sQgStW6fdDhOvqnstOaPufLWJoTiE66mBjiIYPI9WGaAEnj8h2J
	c+aVWLxrAsr7IAhpfZJmcrVQ6YW+fo2JnQeShK0qyed+0t7lbyiHVrt9YLNymGt6giZq0yeg7o/rg
	ENfsREESqNSguS8x+r+MsNmbJ9KoxG6YomGST/IlOOK+Jcu7wdLwoWdX5yd47f31/FMfmq1EFflK1
	1j+4yk/xBjqtzfSPE59zgwmKST7PFPLrHMxlghndF1CYo2tojh9ofV5OzPKnwwn+DRr2eYKLrYW2I
	9rV2UKGoh9CgfZlkPL3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBLe-00000002uN2-2A0a;
	Mon, 17 Mar 2025 14:21:46 +0000
Received: from mail-qk1-f176.google.com ([209.85.222.176])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBJ0-00000002tl7-1OnN
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 14:19:03 +0000
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c58974ed57so166391485a.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 07:19:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742221139; x=1742825939;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FQzfQJUTkwGhun6W4CYWdgvhWW8H+wpChsA4H5Uf+0w=;
        b=qd5aiQgKB6jsHH7bKv9xHuHDcFjSIghpwx4IhICtKbBimwCOthCkg948mgJuaR85sk
         VV/qIfVd3nQZ12UoyytPUChXZMXAhs96iUTJEaAvsl0oE1MIULlmUIp33P36bmYstgsg
         ysfzDi1sfbc5gPOcyzP7PCVyhbH7agxAYuIvZGM9qtTmJ2BbUKH4G4yqq6aElsFfP5jT
         hnj7FWMnmsF9xh/mrqN1dVOaz9mbPfIX82IcOpUL4+ujTmLONcvo3QMMBANTR0BuONAt
         2AyxO4awy+3s+/tGUSSgNYqL8i83Okg1dgHZwRCvm3oigBMxKop+VVe0TAjKnfySvVK4
         f75A==
X-Forwarded-Encrypted: i=1; AJvYcCVlOPSbWOUzwCT3kvjVVDNL/cZkG6Q74TSFidF+NJoVj9qVYAciYoUIF8Gtf9OoR/SGviasVCbtvtHuGA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYLbZLvptnquftEVZkZ9+RP4fMzdNQYrS7uLimZcK19jIuE5Cy
	wprJsasptmaeN/YpxLeMvpzQkTuZzj1cOAE6BSKDeWrV1qc+QHzXaQnfseDe
X-Gm-Gg: ASbGncu8klPFW8hKzgbCfTwJ0fSuDzpqjP/GssxjQtnADiTAww4tswLn0ijtfoV7uOj
	gE3HU7LmFPfi52xs4TF8J70414t9+O2EFmjqWaqN5UoiC6J+SVh3a5W6LReSrHgkzWNMj+UBuND
	99/unNVaMjaJVNXaCblam7bwQb0cdYqMxRlHVhefMOjuY2KSDFtQhe9/KdPX6e7MFWDutV/2YPe
	cOgwjI2iPqReW3bLNf/iNHaS2gvXBPm94in5AlxiW/vf1LNaZbPMgss22aVAFHb7/8Gz5HyNKet
	lRb9tAhCs4/UqoEQbB/Wm624NMz8HKyNiu1yvhFvv9CtBn1J3ga863Yx5Xf1YR5PCA+5sZjkCgZ
	BWyCe9js=
X-Google-Smtp-Source: AGHT+IHPuWXL1QTpsYFGQCNZQaWq0wibohlY+KaB2Bk8BmTDD8jGHUaHjI7iGXdS/6KGLmITeYRF3w==
X-Received: by 2002:a05:620a:3905:b0:7c5:538f:ae4a with SMTP id af79cd13be357-7c57c80efd7mr1929415585a.26.1742221138714;
        Mon, 17 Mar 2025 07:18:58 -0700 (PDT)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com. [209.85.219.51])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573d6fc94sm593097485a.74.2025.03.17.07.18.57
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 07:18:58 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e8efefec89so39864416d6.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 07:18:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGZJp/r1WIlpKXgIi2qG4lYck2LOpURf/1ltd/zMookwPyEp3eAJjEsOknQ2Dmdga9KmUC2iEimCHoyA==@lists.infradead.org
X-Received: by 2002:a0c:eb82:0:b0:6e8:feae:929c with SMTP id
 6a1803df08f44-6eaeaa63b4bmr161375046d6.21.1742221137414; Mon, 17 Mar 2025
 07:18:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org>
 <CAMuHMdV4xWLEuCvCC54GBfCdELE=QSHqaOyUPD-ezE0QLYRnVA@mail.gmail.com>
 <20250317124120-GYA1983@gentoo> <CAMuHMdWM5ymPVRe36+Atr0cDAdRGyw39jFJvE+9PWTUUiiMfCg@mail.gmail.com>
 <20250317132955-GYC1983@gentoo>
In-Reply-To: <20250317132955-GYC1983@gentoo>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Mar 2025 15:18:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUWUd-xAzhRvazurD-1t3pFb2OUMXqEpeDyTVVbAUG19g@mail.gmail.com>
X-Gm-Features: AQ5f1JrurBlRutNcrH6Q6idcmvXYK5KPYEnvrshCL60keuYt9BH4Ng3SnCR2u0Y
Message-ID: <CAMuHMdUWUd-xAzhRvazurD-1t3pFb2OUMXqEpeDyTVVbAUG19g@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: spacemit: enable config option
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alex Elder <elder@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>, 
	Alex Elder <elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_071902_374342_F1BA70F1 
X-CRM114-Status: GOOD (  34.16  )
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

On Mon, 17 Mar 2025 at 14:30, Yixun Lan <dlan@gentoo.org> wrote:
> On 13:59 Mon 17 Mar     , Geert Uytterhoeven wrote:
> > On Mon, 17 Mar 2025 at 13:41, Yixun Lan <dlan@gentoo.org> wrote:
> > > On 09:18 Mon 17 Mar     , Geert Uytterhoeven wrote:
> > > > Thanks for your patch, which is now commit 7ff4faba63571c51
> > > > ("pinctrl: spacemit: enable config option") in v6.14-rc7.
> > > >
> > > > On Tue, 18 Feb 2025 at 01:32, Yixun Lan <dlan@gentoo.org> wrote:
> > > > > Pinctrl is an essential driver for SpacemiT's SoC,
> > > > > The uart driver requires it, same as sd card driver,
> > > > > so let's enable it by default for this SoC.
> > > > >
> > > > > The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
> > > > > 'make defconfig' to select kernel configuration options.
> > > > > This result in a broken uart driver where fail at probe()
> > > > > stage due to no pins found.
> > > >
> > > > Perhaps this is an issue with the uart driver?
> > > > I just disabled CONFIG_PINCTRL_RZA2 on RZA2MEVB (which is one of the
> > > > few Renesas platforms where the pin control driver is not enabled by
> > > > default, for saving memory), and the system booted fine into a Debian
> > > > nfsroot.  Probe order of some devices did change, and "Trying to
> > > > probe devices needed for running init" was printed.
> > > >
> > > my problem was CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled, result as
> > > # CONFIG_PINCTRL_SPACEMIT_K1 is not set
> > >
> > > for your case, is CONFIG_PINCTRL_RZA2 built as module?
> > > it should work for uart driver with deferred probe mechanism..
> >
> > No, CONFIG_PINCTRL_RZA2 was disabled in my testing.
> >
> emm, this is interesting, there might be problem that uart driver
> fail to have correct pin settings without pre initialization..
>
> which uart driver is used in RZA2MEVB platform? any pinctrl dts property?
> different hardware may vary..

It indeed depends on both hardware and firmware.
RZA2MEVB uses the sh-sci driver, and its serial console is set up
by the boot loader.

Does your serial console work with "earlycon"?

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
