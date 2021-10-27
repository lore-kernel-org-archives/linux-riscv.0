Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D410C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 09:31:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3A8E61052
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 09:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D3A8E61052
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yUxljYXfA3AzunEAYthRes1XSM+dNNmHVtB3GN84RJ0=; b=Tqsstc9p2rNuXw
	sThwmF+EMqc2Gn+KgMT+0Hf2hLp5Y4TVth3Id4Ma3NiUndbQXMdn0SgWfbqIm+R2pe0Epb9iPFIsk
	JGyWCTcJ3SWqCzKej+PIBfDLgR+MSERv477LA3XT8LKotrTsKtKb7WOyB2IMbdMRSRIUXGOi6s4TU
	NZAjsJ4+H33gggqgm7qoNwVWZpqrMBbAlRh4Tu/iuk4zBEzI05FT8eenav8NEVnCLoa5sTwEEoZhN
	mXSxUIjuNyEf4GdAHwwx7d5zMMgYFmY2UYnfDgCghsAddVDeBxa1n9s7CUJg9ejwjPy6zJGzy3Vib
	oZH9/2S6EDoccW3XSDJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mffGy-004Qaw-9t; Wed, 27 Oct 2021 09:31:04 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mffGw-004QaV-Dg
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 09:31:03 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="210203098"
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="210203098"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 02:31:00 -0700
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="635661120"
Received: from smile.fi.intel.com ([10.237.72.184])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 02:30:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mffGT-001QWu-IZ; Wed, 27 Oct 2021 12:30:33 +0300
Date: Wed, 27 Oct 2021 12:30:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, devicetree@vger.kernel.org,
 linux-clk <linux-clk@vger.kernel.org>, linux-gpio@vger.kernel.org,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-serial@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 06/16] clk: starfive: Add JH7100 clock generator driver
Message-ID: <YXkcOZnoGd96wjOU@smile.fi.intel.com>
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-7-kernel@esmil.dk>
 <163527959276.15791.14765586510805526101@swboyd.mtv.corp.google.com>
 <CANBLGcyYb3yNit=GCy4w2zf2=CRtCJP7aCisR8=9n1f7okfCSg@mail.gmail.com>
 <163529604399.15791.378104318036812951@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <163529604399.15791.378104318036812951@swboyd.mtv.corp.google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_023102_582088_2719E54C 
X-CRM114-Status: GOOD (  16.91  )
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

On Tue, Oct 26, 2021 at 05:54:03PM -0700, Stephen Boyd wrote:
> Quoting Emil Renner Berthing (2021-10-26 15:35:36)
> > On Tue, 26 Oct 2021 at 22:20, Stephen Boyd <sboyd@kernel.org> wrote:
> > > Quoting Emil Renner Berthing (2021-10-21 10:42:13)

...

> > > > +static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
> > >
> > > Drop __init as this can be called after kernel init is over.
> > 
> > Oh interesting, I'd like to know when that can happen. The comment for
> > the builtin_platform_driver macro says it's just a wrapper for
> 
> I thought this was using module_platform_driver() macro?
> 
> > device_initcall.
> > 
> > Won't we then need to remove all the __initconst tags too since the
> > probe function walks through jh7100_clk_data which eventually
> > references all __initconst data?
> 
> Yes. If it's builtin_platform_driver() it can't be a module/tristate
> Kconfig, in which case all the init markings can stay.

What about bind/unbind attribute?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
