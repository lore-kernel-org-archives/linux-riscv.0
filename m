Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E815C00140
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 07:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YlWGxsxV2KpL0N5aFDK4kkHwlTALj2v+mAh2eZyrhPQ=; b=mabXB4hSmvh1ms
	s8SQK4ihYvGPtLcczkD3J8dbjAA3+doTGzoAepadfN44r3RwRpuFHlelQ0oJiSaVmHXjCFS+Ke6lx
	Pt9A0vU5EOUfjkPCLOCPn0x4vVgG3bQqinI+jbHGltv9Gt+d4KUKM5zOUGzBL0bc798q83rwbBEJu
	EUTk4r62M7apsTuDy5+qKqvtC+QJIKQDEGcAo8dClW8zClugVDgK9CngkwUcgHwgpbnSaQ+WbCEXy
	DYbFWJMCD0ztqjY9+ayp3IhXY57tOy2psA2OKHTKGBA1VaNEc6ft8C3+ZPkNmfhQSm+wCKjfirT7f
	uN7bm2KaK6LQDknlaKhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQlCQ-00BIUt-9u; Wed, 24 Aug 2022 07:53:18 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQlCE-00BIRL-Fs
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 07:53:08 +0000
Received: by mail-io1-xd30.google.com with SMTP id 62so12768101iov.5
        for <linux-riscv@lists.infradead.org>; Wed, 24 Aug 2022 00:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=9r/o+kbVQuRgd3he3vY5TSCEIo6rMCGZbm88wIqFP8Q=;
        b=eMXIxPRGdnHxWWurrEzfpDzZsVgdUEI1TRoy42m0Dzr7/LEOSVr0qgBLVn2S4cdjNg
         8NNplilxBrpW4w2v/+0aYUstSMgr6x114Xh5WblS6A781kvgUwgoepfN2jxcjHdvN/zf
         ieSXvQh3KEV7EdsSt/U71vN6Bxvan0bGM0hOq/3BV71XvylDtFvnoj6V6uFVeyP+ZEtF
         7fGtUUOQa7bk3lWTEh2JROmiGw0qRkcPwjRqUO/49Lb35nrCUhS2zXshjXZoHAUdbJkW
         nZSI5huxEmCPfjOG/GV0m8XuNP0eIZs4Kp5dOxVfAA7IYIJYUt7Lf4fZx7N1fTmGCBhc
         UTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=9r/o+kbVQuRgd3he3vY5TSCEIo6rMCGZbm88wIqFP8Q=;
        b=dfMJZ8xdctIeo/yiw4/W3WrwG//O9FqN0S43nNo1FoG4mqzDC4VfTKirK/ht+H086f
         52y35lsRC20NZMjdqvOJnCwQVlNXwjaieINGQ/kXuFGHhWXFRrzNRIu9L9TF0Kmopxf0
         jkfkBbgk4nazQe/MECkNyE5Sc25CRXs9gAr47CwOMyoIO1lMMFCgwJJzTV2ljZbtnWJn
         SgFgh5iJidOZw3YiBn1die+mH4v2yaInwI37Hoy+unEIM0qtGoa68uq9lgAfVP8nn0cm
         izM6ARUJ+g/eFgMErXLXCOP0MIXJMqtpLOHLcAPYZM7KOm1OZTJ4Y9+4KRLmytiumvlq
         0PZA==
X-Gm-Message-State: ACgBeo3pizSjvvdKbs/ZruVq2/jcMIaO6wtNnggIFqkD2FT9Zz2EERvB
	B8wY1RQvlqpIVp365JJ0XLgcxoyyCLPvj4DtA4UuMA==
X-Google-Smtp-Source: AA6agR4mfF2ro5+qjUp49hz4FOBZZAOyRo1US7nx2yAd8Tst61WFeQtDsY3aU2BgycMHgnUiI9L+G/cYdPQyHt3NXsQ=
X-Received: by 2002:a02:3f63:0:b0:349:cef9:d8c2 with SMTP id
 c35-20020a023f63000000b00349cef9d8c2mr7667351jaf.231.1661327583663; Wed, 24
 Aug 2022 00:53:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220527102900.144894-1-iivanov@suse.de> <20220823230842.AB8BAC433C1@smtp.kernel.org>
 <20220824074443.nvrnqhpvqrtn72p4@suse>
In-Reply-To: <20220824074443.nvrnqhpvqrtn72p4@suse>
From: Phil Elwell <phil@raspberrypi.com>
Date: Wed, 24 Aug 2022 08:52:53 +0100
Message-ID: <CAMEGJJ3mh1UFTQhyDLnr1ztZccH8LKmz83_jcTYrSF11TWgbfw@mail.gmail.com>
Subject: Re: [PATCH v3] clk: bcm2835: Round UART input clock up
To: "Ivan T. Ivanov" <iivanov@suse.de>
Cc: Stephen Boyd <sboyd@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Stefan Wahren <stefan.wahren@i2se.com>, 
	Phil Elwell <phil@raspberrypi.org>, kernel test robot <lkp@intel.com>, linux-clk@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_005306_533887_DA91D6B2 
X-CRM114-Status: GOOD (  25.32  )
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

Hi Ivan.

On Wed, 24 Aug 2022 at 08:44, Ivan T. Ivanov <iivanov@suse.de> wrote:
>
> On 08-23 16:08, Stephen Boyd wrote:
> > Date: Tue, 23 Aug 2022 16:08:40 -0700
> > From: Stephen Boyd <sboyd@kernel.org>
> > To: Albert Ou <aou@eecs.berkeley.edu>, Broadcom internal kernel review list
> >  <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli
> >  <f.fainelli@gmail.com>, "Ivan T. Ivanov" <iivanov@suse.de>, Michael
> >  Turquette <mturquette@baylibre.com>, Nicolas Saenz Julienne
> >  <nsaenz@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
> >  <paul.walmsley@sifive.com>, Ray Jui <rjui@broadcom.com>, Scott Branden
> >  <sbranden@broadcom.com>, Stefan Wahren <stefan.wahren@i2se.com>
> > Cc: "Ivan T. Ivanov" <iivanov@suse.de>, Phil Elwell <phil@raspberrypi.org>,
> >  kernel test robot <lkp@intel.com>, linux-clk@vger.kernel.org,
> >  linux-rpi-kernel@lists.infradead.org,
> >  linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
> >  linux-riscv@lists.infradead.org
> > Subject: Re: [PATCH v3] clk: bcm2835: Round UART input clock up
> > Message-Id: <20220823230842.AB8BAC433C1@smtp.kernel.org>
> >
> > Quoting Ivan T. Ivanov (2022-05-27 03:29:00)
> > > It was reported that RPi3[1] and RPi Zero 2W boards have issues with
> > > the Bluetooth. It turns out that when switching from initial to
> > > operation speed host and device no longer can talk each other because
> > > host uses incorrect UART baud rate.
> > >
> > > The UART driver used in this case is amba-pl011. Original fix, see
> > > below Github link[2], was inside pl011 module, but somehow it didn't
> > > look as the right place to fix. Beside that this original rounding
> > > function is not exactly perfect for all possible clock values. So I
> > > deiced to move the hack to the platform which actually need it.
> > >
> > > The UART clock is initialised to be as close to the requested
> > > frequency as possible without exceeding it. Now that there is a
> > > clock manager that returns the actual frequencies, an expected
> > > 48MHz clock is reported as 47999625. If the requested baud rate
> > > == requested clock/16, there is no headroom and the slight
> > > reduction in actual clock rate results in failure.
> > >
> > > If increasing a clock by less than 0.1% changes it from ..999..
> > > to ..000.., round it up.
> > >
> > > [1] https://bugzilla.suse.com/show_bug.cgi?id=1188238
> > > [2] https://github.com/raspberrypi/linux/commit/ab3f1b39537f6d3825b8873006fbe2fc5ff057b7
> > >
> > > Cc: Phil Elwell <phil@raspberrypi.org>
> > > Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> > > ---
> >
> > This is waiting for someone like Stefan to review. It's customary to
> > include previous reviewers on new versions of patches.
>
> Thanks for fixing me mistake.

If I am going to be mentioned in the commit (and I'm not bothered
either way), I would prefer it to be as phil@raspberrypi.com - the
.org address will expire at some point.

Thanks,

Phil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
