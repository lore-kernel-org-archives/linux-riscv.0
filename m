Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2051C433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 09:25:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 601B261265
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 09:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 601B261265
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=juYaJOq42MoMlTmiX8TfC98SRLb1JXOqySKoaAIWeHU=; b=GmvHER+olnEKGv
	Ok9VTwX0zXHgR0Nj6JnLxGdjbTlS2HGM6GJkBJS1c4ElvG9+Yr4AKZlXHVt297t/tXqtuZkLP+37o
	tPVdi+I5h68xuxBq8bMn3ZXTQmOGURj76TNCn0bYBz1wHYoKp46kP0OAH3U4ii0MeQL8l9SVGZZMJ
	uD8b3vfE7I+HAKtDO6PuZfssEqB3sFlB9o0Plxv+DYFoW+bpTJtFl1tiTM+5XegWAO7k6NDP8rTw5
	4dSKSzRhbIaocobPBxcVCmpFpOZodTCja0j03gR+LrITkchEzdDbRSu7YcH5ir5HloXXDLpebUlrn
	n671hqGppl8jbn0APldg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk0td-00Fr7O-L2; Mon, 08 Nov 2021 09:24:57 +0000
Received: from mail-ua1-f42.google.com ([209.85.222.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk0tb-00Fr6G-0B
 for linux-riscv@lists.infradead.org; Mon, 08 Nov 2021 09:24:56 +0000
Received: by mail-ua1-f42.google.com with SMTP id v3so30088548uam.10
 for <linux-riscv@lists.infradead.org>; Mon, 08 Nov 2021 01:24:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8AsDmIULodpRjro1Z9iu2vYvGZdr5FGncs23xMPcSjY=;
 b=eAVSmtrG1Y1B5BuWq3LD+GorAvYdJMmiZLM62NckIULzrBncKNoKcfUhbmc+ETSFnx
 f8syNuZjNVIX41OvARhlCrTcBDHJhknamLONIfpb/f42Dkj6bOrV84luq0AreasM8xJW
 Penp5fiHaGdG+ug1/LEM0UrENdFAKjlpj2mjLSkeSbe/mr8fKm82mOtKuOH5Ku1Q0it1
 PLcOoqf1W1/gLSr0RD5Vye6vGVJ8DbKd+XX2q+qm6NaMjUzHCThORZ+lp6/XiP3SDGAh
 RyBS9bMK9nVu50C99IHtjAzCRoQqSYRWhjonu5f93CSDMLXp2I+aoeua6u3ZEc8RncjL
 vhrg==
X-Gm-Message-State: AOAM5300D5NI4vO2gIWZP8BGSITgW28KiudlhaVYZ3j4C/kIau8WDgjX
 f0KNLv4gMzewgtqK0ap23PhhqnsrZlGUgg==
X-Google-Smtp-Source: ABdhPJyPmHImMlF/Qeb73MpqlN7b/ZOZVj2y8ZnKVTGi0ZcNY+HzngrwHzvmYFaGmkAxJqKdIz1PXw==
X-Received: by 2002:a67:e90d:: with SMTP id c13mr30969113vso.12.1636363493517; 
 Mon, 08 Nov 2021 01:24:53 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com.
 [209.85.222.44])
 by smtp.gmail.com with ESMTPSA id bk3sm339907vkb.33.2021.11.08.01.24.52
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 01:24:53 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id e2so30119509uax.7
 for <linux-riscv@lists.infradead.org>; Mon, 08 Nov 2021 01:24:52 -0800 (PST)
X-Received: by 2002:a9f:2584:: with SMTP id 4mr90719408uaf.114.1636363492461; 
 Mon, 08 Nov 2021 01:24:52 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-2-kernel@esmil.dk>
In-Reply-To: <20211102161125.1144023-2-kernel@esmil.dk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Nov 2021 10:24:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUG2qGcAvr2sQPBtgQhZhYPhtveoW+mhkTeaowdKisFYQ@mail.gmail.com>
Message-ID: <CAMuHMdUG2qGcAvr2sQPBtgQhZhYPhtveoW+mhkTeaowdKisFYQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/16] RISC-V: Add StarFive SoC Kconfig option
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Drew Fustini <drew@beagleboard.org>, Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_012455_065411_7A7B1625 
X-CRM114-Status: GOOD (  17.79  )
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

On Tue, Nov 2, 2021 at 5:11 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> Add StarFive Kconfig option to select SoC specific and common drivers
> required for these SoCs. Select subsystems required to boot so the
> required drivers gets enabled by default.
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
