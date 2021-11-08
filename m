Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD01CC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 09:39:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78838610CB
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 09:39:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 78838610CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sz+DcH/RLFol8RF0byaNLb/zJBdSsrTimQWb2s2eTd0=; b=A3APhkdJfqNtD7
	YgoEyJNMWytc9sPfRAiuic9FP4quk8jWS8YARG4e0QnGMHQD0QMIbs0AU+KfgGa4/onOAteCeSxYl
	nBahJab74FO/9I9+Eq4gYgJN9oz8qqyKNIoqhQ/1sK0JogE1mTlSl/cRU3v0ccdljTKM4FZpZSF0d
	Se5dCVDL5OKMa1/up3LQUrcvQgCVIC8m0L3IS/qlFRMFIs1uN1NRGrtyPs2M2mIc3ncBj9eICJKdW
	+iLqgoZ595J4Ot3aUGSBSf3ksdjbqlloh2gNNk1ESQCfIz3Uy2YCm0gO24pYsocA1dUa2AE6sbr8+
	WUvayS6Zk4azfYdvA86w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk17N-00FuYN-JR; Mon, 08 Nov 2021 09:39:09 +0000
Received: from mail-qt1-f176.google.com ([209.85.160.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk17K-00FuXA-6c
 for linux-riscv@lists.infradead.org; Mon, 08 Nov 2021 09:39:07 +0000
Received: by mail-qt1-f176.google.com with SMTP id m25so3690902qtq.13
 for <linux-riscv@lists.infradead.org>; Mon, 08 Nov 2021 01:39:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=natkUAgTheIcsUsHIOKrKwm02jUscvarcAWkR9vE/gg=;
 b=pXsojieNoTSszk752F6ZRPnBaOq+sNQO/hEcXT9uknLCi8zzvdBFaY+pXzW3dNSVYl
 xk8UqrHfave5nbzo7ZplW9FtskwLm12ubUNaqHSRS1dRFOyOEO9QtXbbzSAJQNqXykEV
 I9zGNVNiVOIn+DXOm4dkkh1CDpn5OF3iM/IZSAp3m7QMUeyriVeT4d66uU2afgmlKesQ
 jN2P59jV+BT89rH/45wTMtE8yi0FUAyRUlKLpTZqgJRCG6JywuCySiNU8biGFS89h4U2
 ETrWOX+xxHBo91cxYL3JGwipqsSpz1C3sDD4uV7YQzRdAVmmLb6yh52zuk4H2nPb1V3y
 trIg==
X-Gm-Message-State: AOAM533e0/ljRHYBECZNQMgxIthlKglXGWNq9ZIPZSbwTV5nplxM7U3B
 rRmaUp+KZeLlU+FyrDSMTxUnTc6fV/jPqg==
X-Google-Smtp-Source: ABdhPJwd6nnPn1EuHz8OC37VMKB22y0Q9t3XdK/Kh//UQ0CPC7aDCPOxvktSgj6QaLXQsVEg1xLyVw==
X-Received: by 2002:ac8:7d09:: with SMTP id g9mr32747650qtb.344.1636364343212; 
 Mon, 08 Nov 2021 01:39:03 -0800 (PST)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com.
 [209.85.219.43])
 by smtp.gmail.com with ESMTPSA id e12sm10024707qtj.13.2021.11.08.01.39.03
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 01:39:03 -0800 (PST)
Received: by mail-qv1-f43.google.com with SMTP id d6so11541005qvb.3
 for <linux-riscv@lists.infradead.org>; Mon, 08 Nov 2021 01:39:03 -0800 (PST)
X-Received: by 2002:a05:6122:1350:: with SMTP id
 f16mr18817472vkp.26.1636363954170; 
 Mon, 08 Nov 2021 01:32:34 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-15-kernel@esmil.dk>
In-Reply-To: <20211102161125.1144023-15-kernel@esmil.dk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Nov 2021 10:32:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVz1R_K7Zayj9LJBM1GpMVi2s8k9jFa8DZPhNWM6B2prA@mail.gmail.com>
Message-ID: <CAMuHMdVz1R_K7Zayj9LJBM1GpMVi2s8k9jFa8DZPhNWM6B2prA@mail.gmail.com>
Subject: Re: [PATCH v3 14/16] serial: 8250_dw: Add StarFive JH7100 quirk
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
X-CRM114-CacheID: sfid-20211108_013906_293924_5907F543 
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

Hi Esmil,

On Tue, Nov 2, 2021 at 5:12 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On the StarFive JH7100 RISC-V SoC the UART core clocks can't be set to
> exactly 16 * 115200Hz and many other common bitrates. Trying this will
> only result in a higher input clock, but low enough that the UART's
> internal divisor can't come close enough to the baud rate target.
> So rather than try to set the input clock it's better to skip the
> clk_set_rate call and rely solely on the UART's internal divisor.
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -414,6 +414,8 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
>
>                 if (of_device_is_compatible(np, "marvell,armada-38x-uart"))
>                         p->serial_out = dw8250_serial_out38x;
> +               if (of_device_is_compatible(np, "starfive,jh7100-uart"))
> +                       p->set_termios = dw8250_do_set_termios;

BTW, it would be great for a follow-up patch to get rid of
all these of_device_is_compatible() checks, and start using
dw8250_of_match[...].data instead.

>
>         } else if (acpi_dev_present("APMC0D08", NULL, -1)) {
>                 p->iotype = UPIO_MEM32;
> @@ -696,6 +698,7 @@ static const struct of_device_id dw8250_of_match[] = {
>         { .compatible = "cavium,octeon-3860-uart" },
>         { .compatible = "marvell,armada-38x-uart" },
>         { .compatible = "renesas,rzn1-uart" },
> +       { .compatible = "starfive,jh7100-uart" },
>         { /* Sentinel */ }
>  };

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
