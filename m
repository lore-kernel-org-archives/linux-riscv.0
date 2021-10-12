Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E26E0C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 17:09:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F23360F38
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 17:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F23360F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HEp/P/CD2ONaFxnFjgkvdwDoX9HmU27p7sXvEDRNvA8=; b=VwuBrAouM+mERZ
	cjqsvuV+Yn03KI45Ae8D9oGID20AXTC5m/yyxwx4t+Y0OWN6lqr6Csh4/La420GEGdFJNvphudgzP
	vZTF1UYmlokbFITc6Xdm3O+k0NN609J52nUm3DqftBKms6jrwthAoP20eJijIp3OHGwfohpLpAnNS
	Q43nGQ4NtyAi3bKdBzXaOUIAAW+CAKmSYwb7MByu9ZJe49hYatm6U+I+JkOWfVYLyFi0HKTADqrhS
	4HzOnswKRv9qaN7334f7m9nT1isHCFqs58sseuBsXu7yxGfbbI40YSzwRucx+p3MEZanIAgdzelAw
	vywzOZ7jjZsMDM8jFqlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maLH4-00DaBD-Bg; Tue, 12 Oct 2021 17:09:10 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maLH2-00DaAZ-94
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 17:09:09 +0000
Received: by mail-ed1-x536.google.com with SMTP id ec8so2170220edb.6
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 10:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ETBlO0R7ftFoQf331hVqlj1UmmT4m6MaJEZrp8aaMUI=;
 b=H4bbH1wue/tDYUXhbNmTeFVFOJ5I+RECXE8zhADA7HY8NzNeFa0rDHOGK5cchjHHfq
 V/ZNyvecT/VlCowZNtV50RrwYjmRf81vKCp1PxzuPdiuc0rovzuBZvXHl/DzLUaCwuS+
 95gEAH9q7qRIr0YYtRUhC564Lg1eytaIiQMMABos1Rt40ZHzUkgEQfUTydXKKo5txFHn
 9z93Hc/KZw7qzNo9AXlkvsrWePJQ9kvwfoPWDOuQ78iam9vHx2q3ccRpJvSNebFTHWGA
 xnrI52v+jWUSzlaxMMwHJxb6Sp3tDWrK907OcVbBJ4bukvkCiX+vl3QqnzktT+3XwT0b
 9oAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ETBlO0R7ftFoQf331hVqlj1UmmT4m6MaJEZrp8aaMUI=;
 b=TdR8+40cc2Unx3RI5wVpVZkL+0rEegtcsp/fQ4GM8iPCIpQdGoHYnH+5D88E8QYia5
 qbzoPs/rt+2++s8ZJExbSgTSVACCJ5FVege2PBpxFVWASSbnHCK2W9i2ATa4BI021iz7
 yRDeovAOO0Knq8+l6ArWQpD1iIrQihKtu34s1M9gNo53BFX9Mph6gyRZH//zKG4LlYes
 e5I0Q6ORMxQ49jSqCeCEEKBn5pzcnn6e7TIdZe7+0wBtHqXSIK9p9Wsamc1tEw+7Zjqc
 wqd70MwTJW4n1Z7JrGTxXhzbR9AYuxr0WFb2tCP/7mkdGN6/orGvJxxksK57O+N3+6qo
 nOFw==
X-Gm-Message-State: AOAM5326H3YrlEhn2vMlr9noh9wsHCOJDJOrmdr1U8o1UQggqq5nqc/j
 deeif55QzUgXYcvAo8i3BvfWp6o7CrhXn2hiP9E=
X-Google-Smtp-Source: ABdhPJxvT7gKhdGGRY0SC1Yseo5/vsnz0N9pv27Y7/5CAWbNCOg+5Po82HIaAqdBMiFuLXb1gHVqtXFBYtIE9pPXE5c=
X-Received: by 2002:a17:906:a158:: with SMTP id
 bu24mr5301651ejb.356.1634058546919; 
 Tue, 12 Oct 2021 10:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk>
 <20211012134027.684712-15-kernel@esmil.dk>
In-Reply-To: <20211012134027.684712-15-kernel@esmil.dk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 Oct 2021 23:08:19 +0300
Message-ID: <CAHp75Vfw+G5TC+gcS1aBEd9dTjzbQG6rYdXPFg0ua3dMtWP4Uw@mail.gmail.com>
Subject: Re: [PATCH v1 14/16] serial: 8250_dw: Add skip_clk_set_rate quirk
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
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
 Drew Fustini <drew@beagleboard.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_100908_352860_A5F0E285 
X-CRM114-Status: GOOD (  12.82  )
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

On Tue, Oct 12, 2021 at 4:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> On the StarFive JH7100 SoC the uart core clocks can't be set to exactly
> 16 * 115200Hz and many other common bitrates. Trying this will only
> result in a higher input clock, but low enough that the uart's internal
> divisor can't come close enough to the baud rate target. So rather than
> try to set the input clock it's better to rely solely on the uart's
> internal divisor.

s/uart/UART/g

...

>         unsigned int            skip_autocfg:1;
>         unsigned int            uart_16550_compatible:1;
> +       unsigned int            skip_clk_set_rate:1;

Keep skip_* bitfields grouped.

...

> +       if (!d->skip_clk_set_rate) {

I believe you have to rebase this patch on top of tty/tty-next.
Besides that, please, avoid indentation changes, i.e. refactor your
patch accordgingly.

>         }

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
