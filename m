Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A1C1C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 19:43:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C89F460F36
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 19:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C89F460F36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=scglASXVxgytr1ijU0b0kNzNXHkm0LAhiNFDSP7UV1A=; b=2GBxKMfmkd3qcx
	akE1Q2N4X3fBnmElQg2dJR5t3OLBie3p1EDPV1MThyc7IQ+L4RQHHKur5cnNvcnei9+dWO0WmrrxJ
	5uDzTzZpsGwKnR1mhBz30fkdkjuV8VHbZhFO5xX0ajvifr1hUPahzHZVWKEpRnwvlF10bblstX6US
	4IKSKoxP+RBgf03TRq7NN+z1afvnadm/mmFB2Xnxi1WH2I1kDtOK7sShxhhjuJuWa54EURa8j6xtS
	t9PIESzsqsQ6hRb+Ok+N0r+TJR5zlmjIlGxAIRy3rgveUSgz75KXEpdDFzXtJT1ZSonYdLjCqeaYL
	7CLVYD/PPrvYk3hYIETg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhzgq-002p0k-GM; Tue, 02 Nov 2021 19:43:24 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhzgn-002p09-8j
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 19:43:22 +0000
Received: by mail-ed1-x52b.google.com with SMTP id w15so1307548edc.9
 for <linux-riscv@lists.infradead.org>; Tue, 02 Nov 2021 12:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ceu22Dc39UeKUUHkFo8E6TEFnBT5pBoF+8MRYhui+3g=;
 b=iL9ZdMGpiEq08FDiyAvoxoALZriK6r3TSAAvJPOItnzqnE834kvOqkBw4kyHzjlRgw
 hwojMrQb148XuOqrV7AjcG+H0RoTRQS8uAZ3Azmzz8vXs99IaiQzln+ZbxHTV20Za7K/
 sdLjOXP0y9PbUG2/IBzv6PLoiX418Q9ppI6hPCaBRrf1p7j6y3LeO0m46ulrsleuDhB6
 7KlijIokOrLyjaRYKaBLH7ugQMl+wkWnrqB4M3tEkcGGjyLIoFCa6XYuy2BgVG8X8H+t
 N9/xnLKZUGsHgw/zra7e0WQsxiHTNdryMfLdqcKCoFZDTMijIuI7DL3lreiERhI1VO69
 SqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ceu22Dc39UeKUUHkFo8E6TEFnBT5pBoF+8MRYhui+3g=;
 b=c+chhtBO8YFbYG6YvB9I823T4j0ti3SK7jdnFaZppXfppiMfeeH9F9Ouv+zPgD6irc
 vdpuXHmSAFOevJO+8niOHGrzFS7HXDvYMcccq39zx0o3OdjAfXKC3yEgNGxCc1GPDC/X
 BeeFZyW3yz2U+3m/+rRCV55DapGHj1v3XkslCQhtPbxnS3gZ1EhWtNpvzSD6iPHX3zy4
 SYxptTgy+NS4SjqZrxDvpj5SulLoAxHu/e6ppkF5PDKSpH9F0fggIH97bTS82Gagsb9v
 ATn7yamMwuqdTZ0bT4DxRXeNPKteI/3xnYfETWE9cZ6Lt+fo6B5ruDP4xXAQ5EPZcdox
 Uu7g==
X-Gm-Message-State: AOAM532WrSdtgtg3AmhUguFpapjAe8WivHKYiq03+HNaRNLOzN2SALe1
 G9/sJvokXyfnsL+W9QD9cNAaCEj4lq/1Im5GpEA=
X-Google-Smtp-Source: ABdhPJx9QGKRGz3j6D7SSykvvgSu5AJJRydl2DbJOG2BUnaKZeBT7ctk5NcVsU1upIedOx7rpLMKjvjWoEYUwxGTUhY=
X-Received: by 2002:a17:906:a158:: with SMTP id
 bu24mr44829165ejb.356.1635882199443; 
 Tue, 02 Nov 2021 12:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-10-kernel@esmil.dk>
In-Reply-To: <20211102161125.1144023-10-kernel@esmil.dk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Nov 2021 21:42:30 +0200
Message-ID: <CAHp75Ve-P8DR00mtRP_NkrXgB4nsZ+qBkgBen94iTcPqxQYUOg@mail.gmail.com>
Subject: Re: [PATCH v3 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
To: Emil Renner Berthing <kernel@esmil.dk>, Yury Norov <yury.norov@gmail.com>
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
X-CRM114-CacheID: sfid-20211102_124321_346847_F2A9F6C6 
X-CRM114-Status: GOOD (  18.69  )
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

+Cc: Yury (bitmap expert)

On Tue, Nov 2, 2021 at 6:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> Add a driver for the StarFive JH7100 reset controller.

...

> +#define BIT_MASK32(x) BIT((x) % 32)

Possible namespace collision.

...

> +/*
> + * the registers work like a 32bit bitmap, so writing a 1 to the m'th bit of
> + * the n'th ASSERT register asserts line 32n + m, and writing a 0 deasserts the
> + * same line.
> + * most reset lines have their status inverted so a 0 in the STATUS register
> + * means the line is asserted and a 1 means it's deasserted. a few lines don't
> + * though, so store the expected value of the status registers when all lines
> + * are asserted.
> + */

Besides missing capitalization, if it sounds like bitmap, use bitmap.
I have checked DT definitions and it seems you don't even need the
BIT_MASK() macro,

> +static const u32 jh7100_reset_asserted[4] = {
> +       /* STATUS0 register */
> +       BIT_MASK32(JH7100_RST_U74) |
> +       BIT_MASK32(JH7100_RST_VP6_DRESET) |
> +       BIT_MASK32(JH7100_RST_VP6_BRESET),
> +       /* STATUS1 register */
> +       BIT_MASK32(JH7100_RST_HIFI4_DRESET) |
> +       BIT_MASK32(JH7100_RST_HIFI4_BRESET),
> +       /* STATUS2 register */
> +       BIT_MASK32(JH7100_RST_E24),
> +       /* STATUS3 register */
> +       0,
> +};

Yury, do we have any clever (clean) way to initialize a bitmap with
particular bits so that it will be a constant from the beginning? If
no, any suggestion what we can provide to such users?

...

> +       dev_dbg(rcdev->dev, "reset(%lu)\n", id);

These debug messages are useless since one should use ftrace facility instead,

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
