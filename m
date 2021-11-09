Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 494F3C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 01:12:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2DE4619BB
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 01:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2DE4619BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/0SYBAdvkf3Fs1lTIZvmN34DWBuqU+qS8rmBnBTCNDw=; b=OJurR8A67ypkgW
	8lgssXPBYtOW7pHsGtFQoVNPgTL6S2tocTF6Gvs3u1Us6u2wk4fJTuBYctFXt5RqHvDIotJBJIXyU
	TD0//YB5QtofeKmz9gQYGV1pOsWVScGHqN/rHkDSfctv30SAvEeV58mHm5pg3dbBnaK7SlehKkkRi
	Md5pTfOVaDHqXwOFrnAn35YmRFoa4nCHD1LmKOSPbsXLvX/GDTZH685hcN66RXCGr/oRV1vG7SRME
	PDxRImCuVMWPfTRfY1WSPhS7Jy3iUbZaBGJDRC0jXNyQ6tc0Ns6QbEVAVavPIyAvmrt6FC506W5lz
	wwNSN7h2xLOArtfp4fdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkFfz-000F31-LN; Tue, 09 Nov 2021 01:11:51 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkFWI-000BC3-IP
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 01:01:52 +0000
Received: by mail-ot1-x32e.google.com with SMTP id
 g91-20020a9d12e4000000b0055ae68cfc3dso25648589otg.9
 for <linux-riscv@lists.infradead.org>; Mon, 08 Nov 2021 17:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t9jW1J5eNwWEbybNdKesq0t74E7W/ck/52E2VJGXkkg=;
 b=tUpaENN0tjUWzOeNT0UHfb4T1ir5hzA5JvtVSI8sTnzbpAxGN6zqp0AepxIOWpkLrE
 i9rj1FhfA7LO8kbEZq4e8dfjCkeg4oHqJFDvqkt9f8H5fa1/DFLjivlehpz1he3+ybIc
 Q+f3LW/VS4P3K/r2DWCugKqeOlb0rhBiRs8/EMU7rwa5+c5sVd59Jq2asZa60hffRYKg
 5P/aLsIczyg9eYdk9qOGdhojaJLOiZd4vB22879Vx+SQxhM1rhihHRXP3fDeUkTSQq6F
 B3d9kt0X3OjsfHCCJzKw8UCujLi+edpBxbSvIWJAX9RllF/Mox8o+jiYh7qyGpVK2zBU
 eWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t9jW1J5eNwWEbybNdKesq0t74E7W/ck/52E2VJGXkkg=;
 b=A2IUKq59ys3Sxy/amRlcroH0Egxw0doJmo0fVrldAlrI7jq/zgeSVgvGIMjdz4JNTs
 KK1urrrrb9hSmGKKV+7AeSXP+au/4TfgS2mjo2ZJaxlIi/bZ1JgOTiYWPm7eZ1ML5wpu
 5CYlIP3CopBZq85BbBobddqWZLmgmWfUKK5Acs7kUjMiNrX3jCLJhnjvDsUpylQOrMsS
 cSXSfpbDN0WkyZXjhyeftQV7ioLsvtMAqB7FfjwcyfyjcLzjFYXmQYNDmtRJDUAPFsTu
 JGoBCdlWPDJaxTUK57UvVzY9oXHXEeXGVzYKSkNm0S4vq8QchIK1ap8luCXGDx2tuebj
 mn7w==
X-Gm-Message-State: AOAM5303OZl4gLnafakQescKM22cpLdH7WL0UD/Qr29NUA2uZLQ0RD90
 Lp63S6v059PiBqcHeQFlH/mFAPzOaVO3PmHaPAmXkw==
X-Google-Smtp-Source: ABdhPJw7atefZ+9vTHHn1jZX0FdtT+yhNCn8qx2PNquKXMzwrqP0p2MI7f3sIpXgVuSNJNdGFjLmQJbrTBCj6pV6XZ4=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr2644104otj.35.1636419709380;
 Mon, 08 Nov 2021 17:01:49 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-13-kernel@esmil.dk>
 <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
 <CAHp75VcuGdaq_TjjRS0S8R5y-nryLABZSp7ehrXz-fUS2W3vfA@mail.gmail.com>
In-Reply-To: <CAHp75VcuGdaq_TjjRS0S8R5y-nryLABZSp7ehrXz-fUS2W3vfA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 9 Nov 2021 02:01:37 +0100
Message-ID: <CACRpkdYe-tW2K2eOQa+FYb-ZXzrA95+pPc6kkLB8ZJLAT8G_eA@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
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
X-CRM114-CacheID: sfid-20211108_170150_661436_EC4BF17F 
X-CRM114-Status: GOOD (  24.31  )
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

On Tue, Nov 2, 2021 at 9:08 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
(...)
> > On Tue, Nov 2, 2021 at 6:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> ...
>
> > > +static int starfive_pinconf_group_set(struct pinctrl_dev *pctldev,
> > > +                                     unsigned int gsel,
> > > +                                     unsigned long *configs,
> > > +                                     unsigned int num_configs)
> > > +{
> > > +       struct starfive_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
> > > +       const struct group_desc *group;
> > > +       u16 mask, value;
> > > +       int i;
> > > +
> > > +       group = pinctrl_generic_get_group(pctldev, gsel);
> > > +       if (!group)
> > > +               return -EINVAL;
> > > +
> > > +       mask = 0;
> > > +       value = 0;
> > > +       for (i = 0; i < num_configs; i++) {
> > > +               int param = pinconf_to_config_param(configs[i]);
> > > +               u32 arg = pinconf_to_config_argument(configs[i]);
> > > +
> > > +               switch (param) {
> > > +               case PIN_CONFIG_BIAS_DISABLE:
> > > +                       mask |= PAD_BIAS_MASK;
> > > +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_DISABLE;
> > > +                       break;
> > > +               case PIN_CONFIG_BIAS_PULL_DOWN:
> > > +                       if (arg == 0)
> > > +                               return -ENOTSUPP;
> > > +                       mask |= PAD_BIAS_MASK;
> > > +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_PULL_DOWN;
> > > +                       break;
> > > +               case PIN_CONFIG_BIAS_PULL_UP:
> > > +                       if (arg == 0)
> > > +                               return -ENOTSUPP;
> > > +                       mask |= PAD_BIAS_MASK;
> > > +                       value = value & ~PAD_BIAS_MASK;
> > > +                       break;
> > > +               case PIN_CONFIG_DRIVE_STRENGTH:
> > > +                       mask |= PAD_DRIVE_STRENGTH_MASK;
> > > +                       value = (value & ~PAD_DRIVE_STRENGTH_MASK) |
> > > +                               starfive_drive_strength_from_max_mA(arg);
> > > +                       break;
> > > +               case PIN_CONFIG_INPUT_ENABLE:
> > > +                       mask |= PAD_INPUT_ENABLE;
> > > +                       if (arg)
> > > +                               value |= PAD_INPUT_ENABLE;
> > > +                       else
> > > +                               value &= ~PAD_INPUT_ENABLE;
> > > +                       break;
> > > +               case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> > > +                       mask |= PAD_INPUT_SCHMITT_ENABLE;
> > > +                       if (arg)
> > > +                               value |= PAD_INPUT_SCHMITT_ENABLE;
> > > +                       else
> > > +                               value &= ~PAD_INPUT_SCHMITT_ENABLE;
> > > +                       break;
> > > +               case PIN_CONFIG_SLEW_RATE:
> > > +                       mask |= PAD_SLEW_RATE_MASK;
> > > +                       value = (value & ~PAD_SLEW_RATE_MASK) |
> > > +                               ((arg << PAD_SLEW_RATE_POS) & PAD_SLEW_RATE_MASK);
> > > +                       break;
> > > +               case PIN_CONFIG_STARFIVE_STRONG_PULL_UP:
> > > +                       if (arg) {
> > > +                               mask |= PAD_BIAS_MASK;
> > > +                               value = (value & ~PAD_BIAS_MASK) |
> > > +                                       PAD_BIAS_STRONG_PULL_UP;
> > > +                       } else {
> > > +                               mask |= PAD_BIAS_STRONG_PULL_UP;
> > > +                               value = value & ~PAD_BIAS_STRONG_PULL_UP;
> > > +                       }
> > > +                       break;
> > > +               default:
> > > +                       return -ENOTSUPP;
> > > +               }
> > > +       }
> > > +
> > > +       for (i = 0; i < group->num_pins; i++)
> > > +               starfive_padctl_rmw(sfp, group->pins[i], mask, value);
> > > +
> > > +       return 0;
> > > +}
>
> Linus any comments on this code (sorry if I missed your reply)? The
> idea behind above is to skip all settings from the same category and
> apply only the last one, e.g. if we have "bias set to X", ..., "bias
> disable", ..., "bias set to Y", the hardware will see only the last
> operation, i.e. "bias set to Y". I think it may not be the best
> approach (theoretically?) since the hardware definitely may behave
> differently on the other side in case of such series of the
> configurations (yes, I have seen some interesting implementations of
> the touchpad / touchscreen GPIOs that may be affected).

That sounds weird. I think we need to look at how other drivers
deal with this.

To me it seems more natural that
starfive_padctl_rmw(sfp, group->pins[i], mask, value);
would get called at the end of each iteration of the
for (i = 0; i < num_configs; i++) loop.

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
