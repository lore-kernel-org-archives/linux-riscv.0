Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B7C1C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 20:08:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 383A360720
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 20:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 383A360720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DaTi/C4A6V4xEHADbVoaTXNV7KlI9XasfF7Ki89Mpb0=; b=1gMbf8gv+iC/Zw
	LMFIoN1h96dsWzmc3nDGlX/EVxG1cZEOemLjXY9WQc+4FF0eKONmBDhHORsD9JxrFTrkJu3C2ZMpX
	zU6NI9JcgRYS1VcSVYc67C6UyqXJfCXCiAtyiJWUBw/DG0uA62imqYrFOkMlsTVLozIPHsr+T0bjW
	MMNxaEBaas4LgjxLnelrh66L+9NNELfpXv4D48nk0RrbR8Hw2C5nTr5lj1ThKGaXOsJRfpU4oVorc
	n951XC/T0M1JW9YFMNKPXt0A5pQKNRHBiUmiNVKAfn5Uxfuh8L9JtHu6wGHooDhOs46UvMWibndp9
	3DOmNMD4+JsYHwLhdu8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi04y-002t5Z-VT; Tue, 02 Nov 2021 20:08:21 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi04w-002t3y-3g
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 20:08:19 +0000
Received: by mail-ed1-x529.google.com with SMTP id g10so1661443edj.1
 for <linux-riscv@lists.infradead.org>; Tue, 02 Nov 2021 13:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ob+aAAsnJvY/so9O4S728AW2SLVYJnzjDGvzTWGx1F8=;
 b=YfWubnYBo8tPkcp/NoWphnxsoI0SM7757XkLqDiWoOWFvtEUHtUA/3iGSZFtVSAXJK
 U7wQyuSpXEi8YPYvVjbsNMyxpxsibH5bl7gP4un4Ma7OsdG9VyuFTgWsR2EMMx3/84Pt
 f264w4Ams8/Aq3+Zlfztc31hgrQ0TlFcvkAjY6uYC+kzXniThvBS1YwlCVW6mmuP1IG9
 EF+vw4WFOzA9PZ1xACySTdnm90aURqtvG9oSEzajKQKjk0r0qiyEX2qZ5W/zGJXPwJQQ
 w+B4pmUYJCGkkNcbYDMOuU8TN3I7J42xjyGvJGJPOXw+9W//0WbIc4cNbupYZyda9+TI
 XEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ob+aAAsnJvY/so9O4S728AW2SLVYJnzjDGvzTWGx1F8=;
 b=5+lAS1Ua3zaBQU+YSggiD7lBg4UnONmLpB6NZ4Cd+GHqH6WzaoWrjm75T3W92GE/7E
 eHneva2vU5XbtBzazwPnKxAGU3nUTkLVXThyiHQidRFUgIL08/iGSJ+9qCkxYlklhJaG
 /VAKSVPJ3gt234vcobmFl7m+V2fsheVH+lzSwJC8EnNawEdHJQnUfKux/eS8bEZ85z6e
 3KkuzZdj6dHhK9FQC+3G9rNyhIt0tXVp3zP/a9LFW3q7iMuaJ5F5TqvFFVIHqaM5RWLb
 ECB/8fU18pY22kKMrwvV80sZzxmWDF4T60UCaXmuQjWzVAG13oZByJ0j4b+IBkv3jFis
 61ww==
X-Gm-Message-State: AOAM531nkW4UOc9lFWQVz3MPhr/Rkvlob9NX7Y/B4Q2sxGAjkeTdA8LQ
 jSvXXA6ZX/du1XdQ80ta44fndCIidJBShnnYvtc=
X-Google-Smtp-Source: ABdhPJw5iTrK423ECEm/XcyMbYGdWGhn+ReKSJ1f4ncBZTxkWvudYTd3g2Ba8tgP+Bouv9tQnfgHqJdUB8NEHv4b0xE=
X-Received: by 2002:a17:906:9f21:: with SMTP id
 fy33mr47921381ejc.567.1635883696196; 
 Tue, 02 Nov 2021 13:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-13-kernel@esmil.dk>
 <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
In-Reply-To: <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Nov 2021 22:07:26 +0200
Message-ID: <CAHp75VcuGdaq_TjjRS0S8R5y-nryLABZSp7ehrXz-fUS2W3vfA@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Huan Feng <huan.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_130818_198561_CE8C02D8 
X-CRM114-Status: GOOD (  22.36  )
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

On Tue, Nov 2, 2021 at 10:02 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Nov 2, 2021 at 6:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > +static int starfive_pinconf_group_set(struct pinctrl_dev *pctldev,
> > +                                     unsigned int gsel,
> > +                                     unsigned long *configs,
> > +                                     unsigned int num_configs)
> > +{
> > +       struct starfive_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
> > +       const struct group_desc *group;
> > +       u16 mask, value;
> > +       int i;
> > +
> > +       group = pinctrl_generic_get_group(pctldev, gsel);
> > +       if (!group)
> > +               return -EINVAL;
> > +
> > +       mask = 0;
> > +       value = 0;
> > +       for (i = 0; i < num_configs; i++) {
> > +               int param = pinconf_to_config_param(configs[i]);
> > +               u32 arg = pinconf_to_config_argument(configs[i]);
> > +
> > +               switch (param) {
> > +               case PIN_CONFIG_BIAS_DISABLE:
> > +                       mask |= PAD_BIAS_MASK;
> > +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_DISABLE;
> > +                       break;
> > +               case PIN_CONFIG_BIAS_PULL_DOWN:
> > +                       if (arg == 0)
> > +                               return -ENOTSUPP;
> > +                       mask |= PAD_BIAS_MASK;
> > +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_PULL_DOWN;
> > +                       break;
> > +               case PIN_CONFIG_BIAS_PULL_UP:
> > +                       if (arg == 0)
> > +                               return -ENOTSUPP;
> > +                       mask |= PAD_BIAS_MASK;
> > +                       value = value & ~PAD_BIAS_MASK;
> > +                       break;
> > +               case PIN_CONFIG_DRIVE_STRENGTH:
> > +                       mask |= PAD_DRIVE_STRENGTH_MASK;
> > +                       value = (value & ~PAD_DRIVE_STRENGTH_MASK) |
> > +                               starfive_drive_strength_from_max_mA(arg);
> > +                       break;
> > +               case PIN_CONFIG_INPUT_ENABLE:
> > +                       mask |= PAD_INPUT_ENABLE;
> > +                       if (arg)
> > +                               value |= PAD_INPUT_ENABLE;
> > +                       else
> > +                               value &= ~PAD_INPUT_ENABLE;
> > +                       break;
> > +               case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> > +                       mask |= PAD_INPUT_SCHMITT_ENABLE;
> > +                       if (arg)
> > +                               value |= PAD_INPUT_SCHMITT_ENABLE;
> > +                       else
> > +                               value &= ~PAD_INPUT_SCHMITT_ENABLE;
> > +                       break;
> > +               case PIN_CONFIG_SLEW_RATE:
> > +                       mask |= PAD_SLEW_RATE_MASK;
> > +                       value = (value & ~PAD_SLEW_RATE_MASK) |
> > +                               ((arg << PAD_SLEW_RATE_POS) & PAD_SLEW_RATE_MASK);
> > +                       break;
> > +               case PIN_CONFIG_STARFIVE_STRONG_PULL_UP:
> > +                       if (arg) {
> > +                               mask |= PAD_BIAS_MASK;
> > +                               value = (value & ~PAD_BIAS_MASK) |
> > +                                       PAD_BIAS_STRONG_PULL_UP;
> > +                       } else {
> > +                               mask |= PAD_BIAS_STRONG_PULL_UP;
> > +                               value = value & ~PAD_BIAS_STRONG_PULL_UP;
> > +                       }
> > +                       break;
> > +               default:
> > +                       return -ENOTSUPP;
> > +               }
> > +       }
> > +
> > +       for (i = 0; i < group->num_pins; i++)
> > +               starfive_padctl_rmw(sfp, group->pins[i], mask, value);
> > +
> > +       return 0;
> > +}

Linus any comments on this code (sorry if I missed your reply)? The
idea behind above is to skip all settings from the same category and
apply only the last one, e.g. if we have "bias set to X", ..., "bias
disable", ..., "bias set to Y", the hardware will see only the last
operation, i.e. "bias set to Y". I think it may not be the best
approach (theoretically?) since the hardware definitely may behave
differently on the other side in case of such series of the
configurations (yes, I have seen some interesting implementations of
the touchpad / touchscreen GPIOs that may be affected).

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
