Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47DCC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 15:05:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A9CC6052B
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 15:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A9CC6052B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3/u/0dBmtrsP/J4+GDn/xsxw3ekZ2cF6i9R8Xzjh+eI=; b=hA799ajdMdI9ua
	7QVavGtBcTODtYObmfwUIKkWX8cZer4xYBNSsjbTHqwpQLrK5x0ctGEPUn9fud7wvUNIxWXalH9Fd
	6AhAiiVcJw6xAzyMaI4EEF6Yb73nfzgZbT49OwBCX6jzMBRxvUhrkAg93e/Zr8Sc0A2Cvbj8yC/JB
	xpGdRlnkB8tdL/vBz37ZsMrrwM979szrvRdHZXbG/p3JJxT41zNHeVvn4m000krWFLl1MNdZe9HLc
	9V0IjyVIFQ+pYPyrO+f6JP0UahpK9Qeg0iCPUEC3H+BOE2MTlTifYy4AY/mMi5Gq6e6DFah7z5JAt
	YQ9aGMOUhGVQpTN7KMGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maJKz-00DHvp-NZ; Tue, 12 Oct 2021 15:05:05 +0000
Received: from mail-pg1-f179.google.com ([209.85.215.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maJKw-00DHuR-Bv
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 15:05:04 +0000
Received: by mail-pg1-f179.google.com with SMTP id q5so6090405pgr.7
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 08:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hdJDtZAfGIdmZ/ukdHpeB6ObCJRx81CajNUOCsrybQI=;
 b=OOMbrh3PimGKf5HVjiAuz6RSOZRbLB/NlhNz4eXU/bsud24HLAqWZAxzueJRvnzSMb
 gfzvqt8I4e2OaNAjEaj7IIsCOJRld6K1Nsf2M3BF+bgFjwf43SsvLYLEPOiRgmH96Esc
 tSY2XQuRuaahza0Onz9YwO/7JI56I4pLuOuy3sht2XcN5tcytY2rb2AEisvkBcjw7Qk0
 fHAH8rNdvHKKc6ykAbHrqJiJzsvDaBCRlUUEnKbEAeDdQ/9kyazni+ccY+Uu0feDe+Oe
 5Yr1Qha2ibKJ1o5acEYocvf89ibToyKp1wPhyxo9S3gaS8fBKJ4ZvIbGysximYcl4oQ+
 M96A==
X-Gm-Message-State: AOAM533aGUxp8zYFByrRbWfBuY5AKBO474QVzwCZfNR39u2DHqIow4UR
 mlN5HqCrwLmZx67G76RD/hOeaK+xH+tELV991hk=
X-Google-Smtp-Source: ABdhPJwjzF1OeRyJAl+WVfOcbYpjaH0YTTRuWHlM9SeqDs+4nR3B9BF7FubISuSdaFjCzlSGaxlHolurGeiz3wPpntQ=
X-Received: by 2002:a63:b11:: with SMTP id 17mr23103923pgl.51.1634051101136;
 Tue, 12 Oct 2021 08:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk>
 <20211012134027.684712-10-kernel@esmil.dk>
 <99ddc44924bcb89110a74d3182b1d3eea623dce1.camel@pengutronix.de>
In-Reply-To: <99ddc44924bcb89110a74d3182b1d3eea623dce1.camel@pengutronix.de>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Tue, 12 Oct 2021 17:04:49 +0200
Message-ID: <CANBLGcyA3LzRNhR1pFpZmnHPXHSMcxyF93_p2nvVfscZCAO06w@mail.gmail.com>
Subject: Re: [PATCH v1 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-clk@vger.kernel.org, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-serial@vger.kernel.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
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
X-CRM114-CacheID: sfid-20211012_080502_435513_082E08F0 
X-CRM114-Status: GOOD (  22.33  )
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

On Tue, 12 Oct 2021 at 16:31, Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> On Tue, 2021-10-12 at 15:40 +0200, Emil Renner Berthing wrote:
> > Add a driver for the StarFive JH7100 reset controller.
> >
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > ---
> >  MAINTAINERS                           |   7 ++
> >  drivers/reset/Kconfig                 |   8 ++
> >  drivers/reset/Makefile                |   1 +
> >  drivers/reset/reset-starfive-jh7100.c | 164 ++++++++++++++++++++++++++
> >  4 files changed, 180 insertions(+)
> >  create mode 100644 drivers/reset/reset-starfive-jh7100.c
> >
> [...]
> > diff --git a/drivers/reset/reset-starfive-jh7100.c b/drivers/reset/reset-starfive-jh7100.c
> > new file mode 100644
> > index 000000000000..26bc5b59c1f3
> > --- /dev/null
> > +++ b/drivers/reset/reset-starfive-jh7100.c
> > @@ -0,0 +1,164 @@
> [...]
> > +static int jh7100_reset_update(struct reset_controller_dev *rcdev,
> > +                            unsigned long id, bool assert)
> > +{
> > +     struct jh7100_reset *data = jh7100_reset_from(rcdev);
> > +     unsigned long offset = id / 32;
> > +     void __iomem *reg_assert = data->base + JH7100_RESET_ASSERT0 + 4 * offset;
> > +     void __iomem *reg_status = data->base + JH7100_RESET_STATUS0 + 4 * offset;
> > +     u32 mask = BIT(id % 32);
> > +     u32 done = jh7100_reset_asserted[offset] & mask;
> > +     unsigned long flags;
> > +     u32 value;
> > +
> > +     if (!assert)
> > +             done ^= mask;
> > +
> > +     spin_lock_irqsave(&data->lock, flags);
> > +
> > +     value = readl(reg_assert);
> > +     if (assert)
> > +             value |= mask;
> > +     else
> > +             value &= ~mask;
> > +     writel(value, reg_assert);
> > +
> > +     do {
> > +             value = readl(reg_status) & mask;
> > +     } while (value != done);
>
> Looking at the barebox driver, this could loop indefinitely if the
> caller forgets to enable the corresponding peripheral clock. Maybe
> use readl_poll_timeout() as a safety net.

You're right. Asserting without the clock enabled is fine, but
deasserting will hang forever. At least for the temperature sensor
clock/resets I tried it with. I'll add the timeout, thanks!

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
