Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA08AC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 13:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/vdDJ9zNfA0naOXrDvaF9pDi0ff+yqC4CSTvulBnnM=; b=pSvqzRjRIhLV6E
	Ah7ppCWuxu1WDVPgR/Ili2VqVFID/QgX7L4Cg64KesIljMpNO5l1ZgeZ1VsLiEL2W7+4PWt29TCQ4
	rPUJEA9mda7mgw7DIohWxatDz/anZIDUtluWJkROXZz7FW/BzIEXW+/lltv09zRi4T2kcb7e5UP60
	blpgttEycR+kkflB0eQxeftapbBX/IlRCm0JbefM5Y/7R08f39RD4uD/pgSLASeVDNXyYnCaoLhcy
	ABhrT7qoQklakg6Mr3AApyfz6YkdHRc7EhTo6VchaS3h0b+tYkZO7CZeBK6YafdKmPG4N/MQIH8WD
	SNjhaFW3KzvOV6Ppxt6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okmKI-006uWa-Mf; Tue, 18 Oct 2022 13:08:10 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okmK5-006uPi-HG; Tue, 18 Oct 2022 13:07:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666098477; x=1697634477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sEQGqXRBwnqb8HWOCi92bXpDgq1DcIK6JeLU6KGQmhU=;
  b=eNaOPnpNJOiaXh9l5qv+K1iPnMP9fPi191LQwIkaYFMQxx3DalYUYZxZ
   xaDgnqrG55fcVK1cZl3/g8tUs+Lzwwxp5IDUAJU1mDXz3reI5ROYu2Kes
   nF8Ker3T2cFDjaafBJLzocdTPbonqUEzjZhAAzM8DaiwNZZeSrSUsydm8
   f4T3ct+bmZNPaPja1hOUyfZP8rAbWxr50pzSSlP/MtjGF7bRBYzqxGTD9
   5V4Px0wsBF59XYDqqT7MCSki+es2LpiKbXyjq8jI8R8h7cwpDkWQRHB+Z
   8wpMIew9Eijfd2psXVFrGcuRShgBC6MP6uxzIhv2L9hPxGOlVVIKNFgsJ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="307760139"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; 
   d="scan'208";a="307760139"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2022 06:07:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="659781896"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; 
   d="scan'208";a="659781896"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 18 Oct 2022 06:07:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1okmJu-009NCP-2i;
	Tue, 18 Oct 2022 16:07:46 +0300
Date: Tue, 18 Oct 2022 16:07:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org, linux-actions@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-rpi-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 36/36] pinctrl: Clean up headers
Message-ID: <Y06lIq+2+MPRL45W@smile.fi.intel.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-37-andriy.shevchenko@linux.intel.com>
 <d63088d7-202b-a550-01e5-345a22de5f7d@amd.com>
 <CAMuHMdUfdQnisexfs4yLjeKs-LUPY1HjChrgeNjNL1qSErir9Q@mail.gmail.com>
 <Y0UyOWALxSFai2w6@smile.fi.intel.com>
 <CAMuHMdVU-cTBMzgBrbzA9+ZYybVS8kdYaA9spU9oDfqrLMvCuA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVU-cTBMzgBrbzA9+ZYybVS8kdYaA9spU9oDfqrLMvCuA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_060757_666440_E2EA9DFF 
X-CRM114-Status: GOOD (  13.03  )
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

On Tue, Oct 18, 2022 at 03:04:44PM +0200, Geert Uytterhoeven wrote:
> On Tue, Oct 11, 2022 at 11:07 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Oct 11, 2022 at 10:46:30AM +0200, Geert Uytterhoeven wrote:
> > > On Tue, Oct 11, 2022 at 9:31 AM Basavaraj Natikar <bnatikar@amd.com> wrote:

...

> > > I can confirm adding
> > >
> > >     #include <linux/pinctrl/pinconf.h>
> > >
> > > to drivers/pinctrl/renesas/pinctrl-rzn1.c and drivers/pinctrl/pinctrl-single.c
> > > fixes the issues I was seeing with shmobile_defconfig and (out-of-tree)
> > > renesas_defconfig.
> >
> > I will add this, thank you for reporting.
> 
> Same for drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c.

Thanks!

Not only. I have updated all of them (but missed zynq (it is in today's Linux
Next).

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
