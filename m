Return-Path: <SRS0=TYB+=PG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B2FDC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 16:29:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14C5461027
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 16:29:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14C5461027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mDQvhRF37wN5fpaqkscRAaPnpVCvEJrNQO9B47sxyd0=; b=DTh0HoJgzsxBSH
	/R3jwHMeXXeEWpT/1ZKZOqPeTVakcWybXuC6cTBapSQ0LN0MNdU2pCSIv5/Qtlut93rxUplhUZZns
	ptUZEwnVFrvAZC6O5iEV/hvxWi9uCIR96Jk1LZTxWAF8pZ/c9G4a0puLvbs57+aCGOABK3mVnkDiR
	ZrYPvktFROzvFqeyW5sHunGiNK+6Mizd23pdYeMRGn6qTFSJoFnQUYCdpcPezdNEm1ZmLoocEnwwp
	wVBe9WJZzwFDhGeo93qT3PNsVLpgkLh9NcXgET0Hdx/PlRmmhh7vIUxTp9t6KEJbOZHgz5FCVHY45
	JX9Tx/seAHnCxHJG6DLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcVVc-00GVVO-LK; Mon, 18 Oct 2021 16:29:08 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcVVa-00GVUM-DE
 for linux-riscv@lists.infradead.org; Mon, 18 Oct 2021 16:29:07 +0000
Received: by mail-ed1-x52a.google.com with SMTP id g10so1325098edj.1
 for <linux-riscv@lists.infradead.org>; Mon, 18 Oct 2021 09:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=go6M/Tog8flAQW1HzW4YFa0p20USW+mf9kFuZcNf8mk=;
 b=jP9HBXYHxZgqk2J+tn5xTCYbPlQepVBxngJycCCgXQg72Arv/y9UFSLe1xxm+E6B4U
 F1xlsuJWqNimxACKALKzC5XS0OvzHdHMBosaEO9sY8yqBw8/8wg0O56yZEHQbJnWf28z
 Sw8ykgl/x/YTy0yNUpV9dCvapB7QZCDTM84AmVV6ikeBq+V2FVmILX2pbJG5MQMYC/Rz
 H5gT3WlA9Q7CwI2fHAX4+34pH84X9TtiSpFivCuga5ajPwahYOp4FvHCNU9VvzygFdCf
 euaRRIrTIkFqGzy2YSToRSBRfA/sheH11LE3kdriHEZgpCLDBOJidiB8t8EEoTtocnUt
 6J2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=go6M/Tog8flAQW1HzW4YFa0p20USW+mf9kFuZcNf8mk=;
 b=yettOK9+w89/AeD9Fpl707uqw5c8r2REVyhthZkPMBGQMDKH1jm3MDMJ4dTaSVp7qu
 V4nssL/01v2CMNoeDFtj2qtv7AKNibGVjczkZqWTTqaZGFiR4ezss14rUal6RfHB7j9F
 EviWJar0Nkc2EmBoToZXIH+5YqTlFKqgTW3GNO70ZdKxQG2ayQEwzc3evMW8TD/R9Scm
 qDVuGrgw5QVrm/WcsrXTo5RLLAP9FaxSBuQv+KM3a2eXBUIkzTHksT4dRBzQH9rRv8Yf
 TSiIAAOsXIpKbWnZqRTl/4w8beCihIMa7RjfEC/dyi3MJfMNT560Xkh+DC7vYT3D7F5W
 j/UA==
X-Gm-Message-State: AOAM532rIY7tTRi45HgnzQ7FSKM2RMjK9B9KrQ5a9f+Sc/sZ3BzQ5mWU
 ftV3gN5FJ2ejmW2uXN7ullQ0oX3iuWvW7NYyczI=
X-Google-Smtp-Source: ABdhPJySQchKlX2Z3vZgM94HVf782asdDHy8KZRlrHXfWgmW5M7pcwBYarJ5l7phz588zZG7XLo36Ras9FTSn01agns=
X-Received: by 2002:a17:906:2887:: with SMTP id
 o7mr30097276ejd.425.1634574543124; 
 Mon, 18 Oct 2021 09:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk>
 <20211012134027.684712-13-kernel@esmil.dk>
 <CAHp75Vep+i+iyJi0LAOKuer-cUZoUoB_ZrWKcmT=EB_4hOgFGw@mail.gmail.com>
 <CANBLGcxHD2vy0+tXYo5Pkqri9mV7aD9jikvs3ygBJRxF4ApLMA@mail.gmail.com>
 <CAHp75Vc65deoHbks-aPmnjEJzm3GdqFMfBCUqw4vVLVr=71Ncg@mail.gmail.com>
 <CANBLGcxriKLZ+CKUsj5sviW8FdHnWTF2koROwmAb=G2tbmE6vQ@mail.gmail.com>
 <CAHp75VccSDLVbs1sF_-1zghWyLKtKKV1qtxOxZZ-cS0e6S-sBA@mail.gmail.com>
In-Reply-To: <CAHp75VccSDLVbs1sF_-1zghWyLKtKKV1qtxOxZZ-cS0e6S-sBA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 18 Oct 2021 19:28:10 +0300
Message-ID: <CAHp75VcgFRGpca-pSU9T5Oo1fT4aWQJd5EQfyZscGYx0mDMJ_Q@mail.gmail.com>
Subject: Re: [PATCH v1 12/16] pinctrl: starfive: Add pinctrl driver for
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
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Huan Feng <huan.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_092906_492254_1FF940B1 
X-CRM114-Status: GOOD (  24.54  )
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

On Mon, Oct 18, 2021 at 7:23 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Oct 18, 2021 at 6:56 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Mon, 18 Oct 2021 at 17:48, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Mon, Oct 18, 2021 at 6:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > > On Tue, 12 Oct 2021 at 19:03, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > > On Tue, Oct 12, 2021 at 4:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > > > > > +       ret = clk_prepare_enable(clk);
> > > > > > +       if (ret) {
> > > > >
> > > > > > +               reset_control_deassert(rst);
> > > > >
> > > > > Use devm_add_action_or_reset().
> > > >
> > > > I don't see how that is better.
> > >
> > > Pity. The rule of thumb is to either try to use devm_*() everywhere in
> > > the probe, or don't use it at all. Above is the more-or-less standard
> > > pattern where devn_add_action_or_reset() is being used in the entire
> > > kernel.
> > >
> > > > Then I'd first need to call that and
> > > > check for errors, but just on the line below enabling the clock the
> > > > reset line is deasserted anyway, so then the action isn't needed any
> > > > longer. So that 3 lines of code for devm_add_action_or_reset +
> > > > lingering unneeded action or code to remove it again vs. just the line
> > > > above.
> > >
> > > Then don't use devm_*() at all. What's the point?
> >
> > I'm confused. So you wan't an unneeded action to linger because the
> > probe function temporarily asserts reset for 3 lines of code?
>
> I;m talking about clk_prepare_enable().

Having a second look I found even problematic error paths because of
mixing devm_*() with non-devm_*() calls, which only assures me that
your ->probe() error path is broken and should be revisited.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
