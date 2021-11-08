Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F8F2C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 09:17:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DE60610E9
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 09:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2DE60610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zN/yQ+KiyIht7EzN+eXCr7v7AW8HED6/RMxSdS8Rfp4=; b=ZNyxWTzfT15f2W
	05EQcdUck6wkwDasYmAPlGGNy8Dvk79vyWWx/8HW8pgu8MGT/AM/Mo1z6Q/wYXjibVo7J8v5TDW3A
	+/DiuuteHkg2TwAycqRXXOYAQEBd1fh9QAtnU37Cu7Pigb7e/q4vb4rcRbmNVCYXTVrT72dgtOYBC
	VxdY2qxjaJQPjcaepS3BJSQzt5fnz7/BnQ/o9DTcYlD5HENi9cS2Jml+nTrhafgRM8NHykiModk08
	/e5Z1o4DNrwgaAyBLlWJ6nlmgPM+ZZMg+uJ/8uxoW+URBwYXCVwpHrLsneYOv88jWEJTES1y42bAd
	d2ksJzVlxYF6Jlmt4zcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk0mX-00Fqd3-Qj; Mon, 08 Nov 2021 09:17:37 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk0mV-00FqcJ-9I
 for linux-riscv@lists.infradead.org; Mon, 08 Nov 2021 09:17:36 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10161"; a="232440929"
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="232440929"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 01:17:28 -0800
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="544398855"
Received: from smile.fi.intel.com ([10.237.72.184])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 01:17:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andy.shevchenko@gmail.com>) id 1mk0m3-004cLP-Ea;
 Mon, 08 Nov 2021 11:17:07 +0200
Date: Mon, 8 Nov 2021 11:17:07 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: Yury Norov <yury.norov@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
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
 Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
Message-ID: <YYjrE/+1wxgGEAKJ@smile.fi.intel.com>
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-10-kernel@esmil.dk>
 <CAHp75Ve-P8DR00mtRP_NkrXgB4nsZ+qBkgBen94iTcPqxQYUOg@mail.gmail.com>
 <CANBLGcyb=TAP0h2WuxBAjRvpN9n7Dt1Hvh5yE8NMOwm3ixZWuA@mail.gmail.com>
 <CAHp75Vcg3En=xH+kz0GgAMGUoo5FABo2HwGoHd=7QgGVrYkYXg@mail.gmail.com>
 <CANBLGczrGwexRGvGxa9C+yzaSHZF_d5+AaebeLUX5BXFxipr=A@mail.gmail.com>
 <CANBLGcztx0DL=U06QPJ5XT4ra=kx2QAZxxP=0bjfgQ0skhv3Bg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANBLGcztx0DL=U06QPJ5XT4ra=kx2QAZxxP=0bjfgQ0skhv3Bg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_011735_366945_1B7EF99D 
X-CRM114-Status: GOOD (  14.38  )
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

On Thu, Nov 04, 2021 at 01:15:46PM +0100, Emil Renner Berthing wrote:
> On Tue, 2 Nov 2021 at 22:17, Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> I'd really like to understand your reasoning here. As far as I can
> tell reading 2 adjacent 32bit registers with a 64bit read as you're
> proposing is exactly what would cause endian issues. Eg. on little
> endian you'd get reg0 | reg1 << 32 whereas on big-endian you'd get
> reg0 << 32 | reg1.

Nope, it won't. The endianess is a property of both CPU and device.

The I/O accessors, such as readl()/writel() and iowrtieXX()/ioreadXX()
are _always_ LE.

So, writeq() will properly put bits to their places in case device is LE.
And most devices are LE (or should be). Of course there are cases, but then
you have to specify them explicitly.

My motive here is simple as that the device is definitely a set of a few
128-bit bitmaps (in registers) and using bitmap _is_ representing hardware
in the kernel. Using something else will deviate from that (maybe not too
far, but still...).

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
