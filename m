Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912E6C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:22:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5040761104
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5040761104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QgAifdoSZACgkYymmFPZiI1JFhhWvGRSC+Hd+o8NKxc=; b=NC7TGVByCzWR52
	cuDzDjOAwJ0z7nwgQifPMV/1ulPJ1/JJLN6PoWBGIbSnVROtLE+WPKv+MU9J4wQLPhuHXnW7kGPc3
	9vvppeh9AL39/G9WqJAzD3+VZWoZiG+sYHQntOsXhjtvRJq3fgxc6teRA3cYqqKBkl32MRDYln+Nd
	5iJZDyNcJCEY7TG1+FFNvYEU7gFb9e1JWNSuutnsaDwB4eLnJ1a9eakU08Aat6kZD0V6KZizaGuGC
	HeJnKmYZ+EiHeqnjzaXIoRbTenuI524anLwdtxZ2C3UAMlniBlqyyV0kXG2QWZhlf4BNOs579O2//
	X44pv26LDGJvCg50EuUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkNKy-001CsX-7e; Tue, 09 Nov 2021 09:22:40 +0000
Received: from mail-pl1-f177.google.com ([209.85.214.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkNJv-001CPR-1N
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 09:21:37 +0000
Received: by mail-pl1-f177.google.com with SMTP id b13so19854176plg.2
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 01:21:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vCxzbvDJEmmS0S1dn6IErGyixaEwc//p9ymy/wdvxtw=;
 b=m0fWHeyvSJ96K12quzE2ZMCterc3MI1GM+46LIlKrL2w2gRV6zMTxYtIGLd8mxbEu4
 WSA8Kax6A7QLJ98w56SdOSzYEdTiHMC0csxJsy3haVk6KQAE5HSJ1RU1iEdRVNU9Gv0g
 9BrZo0v+YySLGL2fr3+4vnm+zs6Mtpz2ndY8Ev1pGk2k23sJffWfce0Py6W29pHr3fEI
 wLVu4cPqT+UU40nJW/leFmd/UDw5nI65/o17TXTPUJFZCSz935LuqeZ0szTo9QqR3a3V
 +NcI/p3nskuVU31u5cil6KAtPUuApEa/A5J3OecwEiF/5S16BpjaxUmCL1zN7qeiy46L
 n+0Q==
X-Gm-Message-State: AOAM533fzdYtcbLNnorOLshppL1Qp1s8/EfY9UI3d56VnGTT6kror7Gx
 ABb1ll3iIuQFHGwICNgY+Hi0AqRNIzqeA0K9MtY=
X-Google-Smtp-Source: ABdhPJxeU3ygXo8r/E5kP4Zn/e69OhIOKZcjPawrK0dUmlnrErW2Q4cDHdP743SYHawatA0U/RlEabrMniGDI/paKZs=
X-Received: by 2002:a17:903:11c5:b0:13f:ef40:e319 with SMTP id
 q5-20020a17090311c500b0013fef40e319mr5828558plh.33.1636449693539; Tue, 09 Nov
 2021 01:21:33 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-13-kernel@esmil.dk>
 <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
 <CAHp75VcuGdaq_TjjRS0S8R5y-nryLABZSp7ehrXz-fUS2W3vfA@mail.gmail.com>
 <CACRpkdYe-tW2K2eOQa+FYb-ZXzrA95+pPc6kkLB8ZJLAT8G_eA@mail.gmail.com>
In-Reply-To: <CACRpkdYe-tW2K2eOQa+FYb-ZXzrA95+pPc6kkLB8ZJLAT8G_eA@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Tue, 9 Nov 2021 10:21:22 +0100
Message-ID: <CANBLGcyo3YjygkjDmdjt4C_H=MZdHQwqumsxnatuObeP2LADAg@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, 
 linux-clk <linux-clk@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
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
X-CRM114-CacheID: sfid-20211109_012135_124959_5E652905 
X-CRM114-Status: GOOD (  31.63  )
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

On Tue, 9 Nov 2021 at 02:01, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Nov 2, 2021 at 9:08 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> (...)
> > > On Tue, Nov 2, 2021 at 6:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> >
> > ...
> >
> > > > +static int starfive_pinconf_group_set(struct pinctrl_dev *pctldev,
> > > > +                                     unsigned int gsel,
> > > > +                                     unsigned long *configs,
> > > > +                                     unsigned int num_configs)
> > > > +{
> > > > +       struct starfive_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
> > > > +       const struct group_desc *group;
> > > > +       u16 mask, value;
> > > > +       int i;
> > > > +
> > > > +       group = pinctrl_generic_get_group(pctldev, gsel);
> > > > +       if (!group)
> > > > +               return -EINVAL;
> > > > +
> > > > +       mask = 0;
> > > > +       value = 0;
> > > > +       for (i = 0; i < num_configs; i++) {
> > > > +               int param = pinconf_to_config_param(configs[i]);
> > > > +               u32 arg = pinconf_to_config_argument(configs[i]);
> > > > +
> > > > +               switch (param) {
> > > > +               case PIN_CONFIG_BIAS_DISABLE:
> > > > +                       mask |= PAD_BIAS_MASK;
> > > > +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_DISABLE;
> > > > +                       break;
> > > > +               case PIN_CONFIG_BIAS_PULL_DOWN:
> > > > +                       if (arg == 0)
> > > > +                               return -ENOTSUPP;
> > > > +                       mask |= PAD_BIAS_MASK;
> > > > +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_PULL_DOWN;
> > > > +                       break;
> > > > +               case PIN_CONFIG_BIAS_PULL_UP:
> > > > +                       if (arg == 0)
> > > > +                               return -ENOTSUPP;
> > > > +                       mask |= PAD_BIAS_MASK;
> > > > +                       value = value & ~PAD_BIAS_MASK;
> > > > +                       break;
> > > > +               case PIN_CONFIG_DRIVE_STRENGTH:
> > > > +                       mask |= PAD_DRIVE_STRENGTH_MASK;
> > > > +                       value = (value & ~PAD_DRIVE_STRENGTH_MASK) |
> > > > +                               starfive_drive_strength_from_max_mA(arg);
> > > > +                       break;
> > > > +               case PIN_CONFIG_INPUT_ENABLE:
> > > > +                       mask |= PAD_INPUT_ENABLE;
> > > > +                       if (arg)
> > > > +                               value |= PAD_INPUT_ENABLE;
> > > > +                       else
> > > > +                               value &= ~PAD_INPUT_ENABLE;
> > > > +                       break;
> > > > +               case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> > > > +                       mask |= PAD_INPUT_SCHMITT_ENABLE;
> > > > +                       if (arg)
> > > > +                               value |= PAD_INPUT_SCHMITT_ENABLE;
> > > > +                       else
> > > > +                               value &= ~PAD_INPUT_SCHMITT_ENABLE;
> > > > +                       break;
> > > > +               case PIN_CONFIG_SLEW_RATE:
> > > > +                       mask |= PAD_SLEW_RATE_MASK;
> > > > +                       value = (value & ~PAD_SLEW_RATE_MASK) |
> > > > +                               ((arg << PAD_SLEW_RATE_POS) & PAD_SLEW_RATE_MASK);
> > > > +                       break;
> > > > +               case PIN_CONFIG_STARFIVE_STRONG_PULL_UP:
> > > > +                       if (arg) {
> > > > +                               mask |= PAD_BIAS_MASK;
> > > > +                               value = (value & ~PAD_BIAS_MASK) |
> > > > +                                       PAD_BIAS_STRONG_PULL_UP;
> > > > +                       } else {
> > > > +                               mask |= PAD_BIAS_STRONG_PULL_UP;
> > > > +                               value = value & ~PAD_BIAS_STRONG_PULL_UP;
> > > > +                       }
> > > > +                       break;
> > > > +               default:
> > > > +                       return -ENOTSUPP;
> > > > +               }
> > > > +       }
> > > > +
> > > > +       for (i = 0; i < group->num_pins; i++)
> > > > +               starfive_padctl_rmw(sfp, group->pins[i], mask, value);
> > > > +
> > > > +       return 0;
> > > > +}
> >
> > Linus any comments on this code (sorry if I missed your reply)? The
> > idea behind above is to skip all settings from the same category and
> > apply only the last one, e.g. if we have "bias set to X", ..., "bias
> > disable", ..., "bias set to Y", the hardware will see only the last
> > operation, i.e. "bias set to Y". I think it may not be the best
> > approach (theoretically?) since the hardware definitely may behave
> > differently on the other side in case of such series of the
> > configurations (yes, I have seen some interesting implementations of
> > the touchpad / touchscreen GPIOs that may be affected).
>
> That sounds weird. I think we need to look at how other drivers
> deal with this.
>
> To me it seems more natural that
> starfive_padctl_rmw(sfp, group->pins[i], mask, value);
> would get called at the end of each iteration of the
> for (i = 0; i < num_configs; i++) loop.

That would work, but when the loop is done the end result would be
exactly the same. The only difference is that the above would rapidly
"blink" the different states during the loop until it arrives at the
result. This would certainly be different, but it can never be the
intended behaviour and only a side-effect on how the pinctrl framework
works. The order the different states are blinked depends entirely on
how the pinctrl framework parses the device tree. I still think it
would be more natural to cleanly go to the end result without this
blinking.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
