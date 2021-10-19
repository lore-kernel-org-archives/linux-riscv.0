Return-Path: <SRS0=MdyL=PH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0192BC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 09:52:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC55F611BF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 09:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC55F611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aXbysbgVhEqOz4pxlqst/BcQJNj4mpIUYBEv4kqOmOo=; b=RHeD5300VKHzt5
	dUW55XWqCK79qO7bTm3Blw4nVvvMRr718vTxbMH4AazTqIg7YyUlJCvcwG2DWbA7cRfZomgkQpQAv
	buk+VZ3IuhlC2y4LfM6rUsvURhbkt9aEkBbJevKfYoBE0Hyfq6Ic11aEAG0gjNgkn9EB4wl/LUKTf
	d2eJudSg9CICGRJ401zVAlY1gbV2oS46x04dyhRhBeeFzuLLmZp64zprA7FXrSY44CKMRflSaVpQB
	YzwGC3dhqsjWWeQAPdwOqsTblKKK+Dp3DAbKo5InM7YTCihLXoSkjn8+6obG/PxqzAmnvJ7Bfy2Md
	Er0cshwaZZ206RJ+aeHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mclnO-000jUx-Gq; Tue, 19 Oct 2021 09:52:34 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mclnL-000jUG-9i
 for linux-riscv@lists.infradead.org; Tue, 19 Oct 2021 09:52:33 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="251939889"
X-IronPort-AV: E=Sophos;i="5.85,384,1624345200"; d="scan'208";a="251939889"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 02:52:27 -0700
X-IronPort-AV: E=Sophos;i="5.85,384,1624345200"; d="scan'208";a="531371974"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.159])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 02:52:21 -0700
Received: from andy by smile with local (Exim 4.95)
 (envelope-from <andy.shevchenko@gmail.com>) id 1mclms-000SXr-2L;
 Tue, 19 Oct 2021 12:52:02 +0300
Date: Tue, 19 Oct 2021 12:52:02 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Matteo Croce <mcroce@microsoft.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Huan Feng <huan.feng@starfivetech.com>
Subject: Re: [PATCH v1 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
Message-ID: <YW6VQutGMFOZPNlC@smile.fi.intel.com>
References: <20211012134027.684712-1-kernel@esmil.dk>
 <20211012134027.684712-13-kernel@esmil.dk>
 <CAHp75Vep+i+iyJi0LAOKuer-cUZoUoB_ZrWKcmT=EB_4hOgFGw@mail.gmail.com>
 <CANBLGcxHD2vy0+tXYo5Pkqri9mV7aD9jikvs3ygBJRxF4ApLMA@mail.gmail.com>
 <CAHp75Vc65deoHbks-aPmnjEJzm3GdqFMfBCUqw4vVLVr=71Ncg@mail.gmail.com>
 <CANBLGcxriKLZ+CKUsj5sviW8FdHnWTF2koROwmAb=G2tbmE6vQ@mail.gmail.com>
 <CAHp75VccSDLVbs1sF_-1zghWyLKtKKV1qtxOxZZ-cS0e6S-sBA@mail.gmail.com>
 <CAHp75VcgFRGpca-pSU9T5Oo1fT4aWQJd5EQfyZscGYx0mDMJ_Q@mail.gmail.com>
 <CANBLGcxHLQZygX9CHsXK4aYS9m4VE5OnLNROOmvP1ps5UP-xAw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANBLGcxHLQZygX9CHsXK4aYS9m4VE5OnLNROOmvP1ps5UP-xAw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_025231_372516_46BA254C 
X-CRM114-Status: GOOD (  14.10  )
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

On Mon, Oct 18, 2021 at 07:02:43PM +0200, Emil Renner Berthing wrote:
> On Mon, 18 Oct 2021 at 18:29, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Mon, Oct 18, 2021 at 7:23 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:

...

> > Having a second look I found even problematic error paths because of
> > mixing devm_*() with non-devm_*() calls, which only assures me that
> > your ->probe() error path is broken and should be revisited.
> 
> So do you want to expand on that now or should I send v2 first?

Here is not enough context anymore to point out. I expect one to have done
their homework anyway.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
