Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B507DC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 12:41:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81B1F6109E
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 12:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81B1F6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AZgPqCiEnRQhI2QA7sj8G6rw2OwhnFVCPCbDNIZec6M=; b=0E8RMpPXYUSuaO
	VxGApsbe2KPyv5y71rBaby7QoS/nNAImGmRcK6rlGKjG1sVQC3KU8Nep5WdDl5Q08d/brk+cUWQpJ
	leqa6LjbfBOCI/FJMvJppfav+4HNk2Zkx0IuV2jNrXz1Qcdog8lom+juE6rO7oVP8deiUj1h6DDDH
	ySY/Vr90z4bTSElaO/8njcTGoA9ujcuypXNKBE3muqQS0CL6XByfFzH/o56LIeNWW/wkTMkiMVScT
	/7cdMwmSScX1tlcc76mi5XJ4G2EcW0kOhRMqaLXyXdL8IRNrFoRImQ2xYBtSOmEfQuXAj9SOdmY4l
	yYtCjntfzvNwRnIVSGNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdtrR-00Aus9-Dy; Fri, 22 Oct 2021 12:41:25 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdtrO-00AuqF-1c
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 12:41:23 +0000
Received: by mail-ed1-x534.google.com with SMTP id e19so2587694edy.0
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 05:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tHQR2Z1qPtXtLpD0ldcO3jwebCIJGWS4TZ77ng4RLWk=;
 b=REF5yOX879PB3VexQN+8YNPVZ8RLatORYZww04QHrDlIRQM7I4x6kER2e5a6EhqPX5
 xkmWjyoVWZn+LPnptkCjqJ1fgLohJn3/jJ2tu+oTZKvBHoECP1XK1g30HssJ2oewzFRK
 r2ffSYJBdijXbAOvef5h34X0+ZvvlEihjm2tBaehkcOlOVpyM7cWJ4Ly4z3m2naCmpHY
 xjULUeXBNPPdi8pPRJqk/Cws5on4ye04LWF5yxlWBbxQgS7oaINKqymuwYmr2QSuuv1O
 cDPAf+BPabV0KHeH5oXH6alCa+AIiTFU28gVJNnuAV/Z9fqyzYvKZfIsEBmGONkYzdVQ
 7Q1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tHQR2Z1qPtXtLpD0ldcO3jwebCIJGWS4TZ77ng4RLWk=;
 b=Cjtaa5DKAdarC4BcXXYg81aXl/FeVQUaPWrWuujas6O5qUxF+xn0mG088efAUDDI48
 PiDkpcQLfyazUgjnjANJjAKV1MxMvWUHmV5TpimhmixubUsEzRAWvq+QHljvEKKo1VA0
 XW1jjQmBi38jjBayfHfqRAfIlCKLFIKZ1X3BbiELE3ffqK1/QJqkp7UzMotfWIziBNGw
 zBYzWN/piCd4WS0jO9NOGlbpyabFmCyFeDw480m5uHyL5av8rxnXsAmV8EmR95dltF1A
 0vmmB+kmcJE/nffUw5u2xcOzIjrfg2mMKRceyRCRt9SH8IAUWsXQ0kTHEuAI4Y9wOM5C
 POtQ==
X-Gm-Message-State: AOAM5312loFQbXc4eYWALXVUnZRTS+tQ9h+jNK+1u4Rxain42rWmDzF+
 P2Pe1PI4jetLokTQ+tPTssIb197OGHprXph0XVHak51cRNdXlxAQ
X-Google-Smtp-Source: ABdhPJwiFLRfZxQa56LwZ/jlFLeGcQX5OKJGaYAlbeJ1xllTBp0a3m0uOfcMCb4u/khczTjeZS6N2tacQalYzsvXwkU=
X-Received: by 2002:aa7:c0d2:: with SMTP id j18mr17090901edp.107.1634906480674; 
 Fri, 22 Oct 2021 05:41:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-2-kernel@esmil.dk>
 <CAHp75VfD73Nsrp-3hMzFtuEAfka+rRc=2m0ZZYddhWBAzg=QAw@mail.gmail.com>
 <CANBLGcxJGgi9nuT6LpjGgPj1bg0aW-ELRCAO0Csv3xi82gTCnQ@mail.gmail.com>
In-Reply-To: <CANBLGcxJGgi9nuT6LpjGgPj1bg0aW-ELRCAO0Csv3xi82gTCnQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 22 Oct 2021 15:40:24 +0300
Message-ID: <CAHp75Ve400r6GCeROhX3XF7KSjA=HKpDoR9ip+efYtPS9FRahg@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] RISC-V: Add StarFive SoC Kconfig option
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
X-CRM114-CacheID: sfid-20211022_054122_142176_D222A200 
X-CRM114-Status: GOOD (  25.34  )
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

On Fri, Oct 22, 2021 at 12:40 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Fri, 22 Oct 2021 at 10:51, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Thu, Oct 21, 2021 at 8:42 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > > +config SOC_STARFIVE
> > > +       bool "StarFive SoCs"
> > > +       select PINCTRL
> > > +       select RESET_CONTROLLER
> >
> > > +       select SIFIVE_PLIC
> >
> > If this is well understood and platform related the above two are too
> > generic. Why have you selected them?
>
> From your last comments the criterion seemed to be to only add it here
> if it would otherwise fail to boot. Well it does fail to boot without
> the reset and pinctrl drivers. The clock driver too, but RISCV already
> selects COMMON_CLK. Once PINCTRL and RESET_CONTROLLER is selected the
> specific drivers defaults to SOC_STARFIVE.
>
> Alternatively we'd select the drivers too, but I can't promise that
> future StarFive chips will need the same JH7100 clock and reset
> drivers. Doing it this way means that selecting SOC_STARFIVE by
> default gives you a kernel that will boot on all StarFive SoCs, but
> you can still customise it further to your particular chip. It seems
> like SOC_SIFIVE is doing the same.

Okay, please add this justification to the commit message in the next version.

...

> > > +       help
> > > +         This enables support for StarFive SoC platform hardware.
> >
> > Not too much to read here. What is the point of this help?
> > I would elaborate what kind of platform it may support, what kind of
> > drivers it selects due to necessity of the accomplishing the boot
> > process, etc.
>
> This is exactly as the other descriptions in this file. I don't know
> why SOC_STARFIVE should be special.

OK.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
