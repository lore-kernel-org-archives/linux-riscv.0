Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E795C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 20:15:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D9E561053
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 20:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D9E561053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lvAPiZyv9UEvxrOihfbbdU2qDqXXJSTDDQKFpFNvT2s=; b=pEp1qH+7OZ6sx1
	vw3tq0t14Lt4u6MJk5EMiAoMhs++uov6dSlRZnbJvIf91BWQ3twTkxU8g+8MD0Mmx9pXPv9OVeXog
	DRqZ0SnmP0RAXSSF25CYz1yuca/SYh1qUMIO7XySQ2k/TSavxQQ8PgYmDFn2137wMeiiJ/2/sXYv5
	+nsgfNN2l9XOmB4C5rrs9zzr3Umals6/GXL02SzmQ5u03g4YgYIVXNE5kbX462cmmRaKyWdEfweLJ
	Gvg6tGJHPibOSwJCNDBRqBj1rzmNVKGe0YzvQqJnX+BjB2h94zMb9smYN4vojAww91xCwRGbAajdN
	6fq2rJH7uonSX324ezdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi0Bh-002u4S-Fi; Tue, 02 Nov 2021 20:15:17 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi0Be-002u3f-9n
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 20:15:15 +0000
Received: by mail-ed1-x534.google.com with SMTP id 5so1601387edw.7
 for <linux-riscv@lists.infradead.org>; Tue, 02 Nov 2021 13:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PqKC2t1Z5DmsnmpUEFoy3liKWP90tFs8sH60erHgihQ=;
 b=fEzLluxtpVt49nA4nW9VmHwOB8olNv+cr8vCPFXRg0BkU9xXcs+9xohjH/dbJb/JZm
 Jn3Q3DM8vHyiyVHH9L88UrLBov1G/x2g9AS8+xnhPdqgsW3BSmt0mE0+OlmkbrDrd0jp
 9LhOL8TleGNjvJ8eV+5+vmURHblBY/BVRfriYPyvzd8G/vkEED7FSUuW1YE22Qfbf+qg
 jaNSsvv5/ym05HE998urmd/1qGbYVG5FTeSoz5dM7zj779osugHcFdEe8INh9MBGEafG
 RUGhXbDGYgkziz96URb0Gr84f6OovpS6941kwHY0lsVhfWJNPA2rtK8XlwpQjnxrR9PT
 kDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PqKC2t1Z5DmsnmpUEFoy3liKWP90tFs8sH60erHgihQ=;
 b=Fe7U+SjGIDYRmvE5IvrqDXC8y0i+5/J1EwMhXn3ZuzDJqnCn2FVdUWWv2fuGIN0f+q
 MTPaEFPWuJs8vHeJHSvc/RG6lobqhqnUmfVEptthO6cEsS1l23kJ07b08926uu2vRK1h
 KEpeh7961B9XKgPfPxh8lT3IRMnwPDl5hTGJ65aurbyHCae5CHVEe6hGtRT4/AMH1fMF
 SKCBWqp1B3Z4sjZP8vQGCbhS357jjPe58nc7uudgk/eFQMAlmUX1mjTeqgJ97jKg3XCH
 e9k9i8KB0YsfXKXdsyy92qTMWNEvJIBm3+BQGZttu6SMnVI9IlJIAdlaPVXLeSd946C1
 8I0Q==
X-Gm-Message-State: AOAM531gVAFOXvgGgtwq6WpMS+awf0uEV5zDV109MfIi/e5bnEeM4YU/
 sBEmof0t/60ULSwygeFWZzv78ybh0dnHHRizegw=
X-Google-Smtp-Source: ABdhPJxCzvbiL8SrPnqlEyRkEgG13MVi98u1HbMKyGOzzMrOjh5GeBgylI4pX9nKhd44bj3Ih6Nc/FPn8GJISHkbprU=
X-Received: by 2002:a17:906:1707:: with SMTP id
 c7mr47407307eje.377.1635884112761; 
 Tue, 02 Nov 2021 13:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-15-kernel@esmil.dk>
In-Reply-To: <20211102161125.1144023-15-kernel@esmil.dk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Nov 2021 22:14:23 +0200
Message-ID: <CAHp75VeyC9nW0zSD9Hz23ypN8jQqU+JXOAG=oJfhebq4ptmm1w@mail.gmail.com>
Subject: Re: [PATCH v3 14/16] serial: 8250_dw: Add StarFive JH7100 quirk
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
 Michael Zhu <michael.zhu@starfivetech.com>, Fu Wei <tekkamanninja@gmail.com>, 
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_131514_368109_EA4702DF 
X-CRM114-Status: GOOD (  21.18  )
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

On Tue, Nov 2, 2021 at 6:44 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> On the StarFive JH7100 RISC-V SoC the UART core clocks can't be set to
> exactly 16 * 115200Hz and many other common bitrates. Trying this will
> only result in a higher input clock, but low enough that the UART's
> internal divisor can't come close enough to the baud rate target.
> So rather than try to set the input clock it's better to skip the
> clk_set_rate call and rely solely on the UART's internal divisor.

Bingo!
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>  drivers/tty/serial/8250/8250_dw.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
> index 53f57c3b9f42..1769808031c5 100644
> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -414,6 +414,8 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
>
>                 if (of_device_is_compatible(np, "marvell,armada-38x-uart"))
>                         p->serial_out = dw8250_serial_out38x;
> +               if (of_device_is_compatible(np, "starfive,jh7100-uart"))
> +                       p->set_termios = dw8250_do_set_termios;
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
>  MODULE_DEVICE_TABLE(of, dw8250_of_match);
> --
> 2.33.1
>


-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
