Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F66EC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 17:50:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2605161040
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 17:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2605161040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KlUlfhMpH60+Dx9mkBUQL4/43/gG3s89mhPfN8kSI1w=; b=bNgOINJlr3SRhQ
	C5RK2wuyg+7A0/HeyV5cwFUPwFvSpvKl5nGz18LNlbIc3Cl63y3HBe0qvqf2XOAF6inoGZe8Oiwmm
	zbXrgOLtgCvtT/C/c7RXMjjYdIq7V6GqPc/aRBnkfb63FZLDsolBfDb94zDdiN+2/VqcaISnL9NUp
	IBBKqYrteVTtjFcwFogkgDDNXKrVtQMnoCAYS16N2T1vox2nS/uMg2S3sLclXeX2YCKTRBlgMEmD3
	6R/BBGwNkUtWQCihf8CrC8/yCgeqa4RMRAeUvcXqK0fjjByhIB/HKLuWrtZ6R7skkaEsbG3Pb/x+z
	+6aPIrgiZfEso7iwrcUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfQax-002fHo-AY; Tue, 26 Oct 2021 17:50:43 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfQaj-002fF6-9c
 for linux-riscv@lists.infradead.org; Tue, 26 Oct 2021 17:50:31 +0000
Received: by mail-io1-xd32.google.com with SMTP id i14so292379ioa.13
 for <linux-riscv@lists.infradead.org>; Tue, 26 Oct 2021 10:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=55Wiuk+vhFEgZhWSKqhr8aUkCrc+H/l8H2FxgeE5N1M=;
 b=K9pKZk0C5IuwGpuBt3P8vlDuOIoL2vOXpa4HXaUHePCmealB43zHzS9+Abd804Gou5
 AX1Ko0Hgr+IqrHTHlDpPvZyWwd+IHOwkRNGe7sWr+tlqO+qnhGQBXnoi35g7DhUboVdw
 jEE8031QquN7g17K4I7/vnj+ZHRtelq3SlCn8oZ8/UTlKNOLYWgM7tClJsAooXWCwOM5
 eg0erGB9Km5hSC0T2+FhmppSX3AukPqDcEUOWatA7MzYZRw4zabKa6ZaMH14zL7y8iWt
 j4xtTAC5UcS3J3DTseib3xOYME0gcib9b1rtSRmqx+LGWtwfSA/ROovpzcOUYVLUKnxt
 d5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=55Wiuk+vhFEgZhWSKqhr8aUkCrc+H/l8H2FxgeE5N1M=;
 b=Nka8RMmk2YQ0Yi4KeHxkkEgFRyJWJ9L14Xww1tONejB76D8a3jrx3jctHxFf9EbCbN
 CgxFFjuOIIRDBNH970r6bROO2f50/1rW4WHVuAIL8Smy9vBnYEh4HEyczrit6B7REo8x
 CdkiS23R00YH+HqinJ5YKJ+BPSiThcTf0zB7f9awQG442ndy9RzKXjsoi9CrQgjvS41P
 9JEEZMP6Y6A1ji4dBgjGy7SFS8F0pxHtejqsT+HGDXdHav9XseZnN3bGffjQMaieqwWj
 svmpotfrZFncEZe4kdLpW7crCxMdFcZzGSYxxrK4OtElk4m9x40eULbI+Nqof2/ZwUUn
 qhNw==
X-Gm-Message-State: AOAM530ai+M+Ox9z2UbOIQKohtvWUTDCrGo2TVelp2rMZD2d6wHYdvBT
 KCbEJKRAEfsClLZ2cJs1AHSmXfKO+F5HHb7LRxOOCQ==
X-Google-Smtp-Source: ABdhPJxveY0oywA1uEFOsixzZAWNxGoGo9GT3NayQjT+kzpJD6taj+8m/BPE1pbuTZZr1AsC5LrElvmVs4XKlZpQs/8=
X-Received: by 2002:a05:6638:d84:: with SMTP id
 l4mr16445923jaj.30.1635270627599; 
 Tue, 26 Oct 2021 10:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210929000735.585237-1-saravanak@google.com>
 <20210929000735.585237-3-saravanak@google.com>
 <CAMi1Hd0HvPOT277mx8hNTU9NQH2ti7h5qc5+rxOkRWwbfrhyQQ@mail.gmail.com>
 <CAGETcx_YZOd05Gg53ZR8mfVhFUzwQWo4MrrWF8JHF_DCwEtunw@mail.gmail.com>
 <CAMi1Hd3M--+V6jPTV=psYGpOqi3UeQBs_FHqOg=oUf1hH-EU4w@mail.gmail.com>
 <CAGETcx9U130Oq-umrvXME4JhEpO0Wadoki3kNxx=0-YvTR6PtQ@mail.gmail.com>
In-Reply-To: <CAGETcx9U130Oq-umrvXME4JhEpO0Wadoki3kNxx=0-YvTR6PtQ@mail.gmail.com>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Tue, 26 Oct 2021 23:19:50 +0530
Message-ID: <CAMi1Hd1gR0nRqQ9CKopc=veQXjtaS-CUxz-j48KEs8pHC6Ni=w@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drivers: bus: Delete CONFIG_SIMPLE_PM_BUS
To: Saravana Kannan <saravanak@google.com>
Cc: Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Android Kernel Team <kernel-team@android.com>,
 linux-arm-kernel@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>, 
 linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 John Stultz <john.stultz@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_105029_371245_BE35F242 
X-CRM114-Status: GOOD (  41.69  )
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

On Tue, 26 Oct 2021 at 06:00, Saravana Kannan <saravanak@google.com> wrote:
>
> On Fri, Oct 22, 2021 at 10:00 AM Amit Pundir <amit.pundir@linaro.org> wrote:
> >
> > On Fri, 22 Oct 2021 at 05:13, Saravana Kannan <saravanak@google.com> wrote:
> > >
> > > On Thu, Oct 21, 2021 at 4:21 AM Amit Pundir <amit.pundir@linaro.org> wrote:
> > > >
> > > > Hi Saravana,
> > > >
> > > > This patch broke v5.15-rc6 on RB5 (sm8250 | qcom/qrb5165-rb5.dts).
> > > > I can't boot past this point https://www.irccloud.com/pastebin/raw/Nv6ZwHmW.
> > >
> > > Amit top posting? How did that happen? :)
> > >
> > > The fact you are seeing this issue is super strange though. The driver
> > > literally does nothing other than allowing some sync_state() callbacks
> > > to happen. I also grepped for the occurence of "simple-bus" in
> > > arch/arm64/boot/dts/qcom/ and the only instance for 8250 is for the
> > > soc node.
> > >
> > > The only thing I can think of is that without my patch some
> > > sync_state() callbacks weren't getting called and maybe it was masking
> > > some other issue.
> > >
> > > Can you try to boot with this log (see log patch below) and see if the
> > > device hangs right after a sync_state() callback? Also, looking at the
> > > different sync_state() implementations in upstream, I'm guessing one
> > > of the devices isn't voting for interconnect bandwidth when it should
> > > have.
> > >
> > > Another thing you could do is boot without the simple-bus changes and
> > > then look for all instances of "state_synced" in /sys/devices and then
> > > see if any of them has the value "0" after boot up is complete.
> >
> > Turned out RB5 is not even reaching up to
> > device_links_flush_sync_list() and seem to be stuck somewhere in
> > device_links_driver_bound(). So I added more print logs to narrow down
> > to any specific lock state but those additional prints seem to have
> > added enough delay to unblock that particular driver (Serial:
> > 8250/16550 driver if I understood the logs correctly) and I eventually
> > booted to UI.
>
> Ugh... I think I know what's going on. It popped into my head over the weekend.
>
> Couple of ways to confirm my theory:
> 1. After it finishes booting in both cases, can you compare the output
> of the command below? I'm expecting to see a significant drop in the
> number of device links.
> ls -l /sys/class/devlink | wc -l
>

On a successful boot with debug prints:
rb5:/ $ ls -l /sys/class/devlink | wc -l
245

Booting with this SIMPLE_PM_BUS patch reverted:
rb5:/ $ ls -l /sys/class/devlink | wc -l
248

> 2. Can you try out this terrible hack patch (not final fix, no code
> reviews please) on top of Tot to see if it fixes your issue without
> having to add hacky logs?
>

No luck booting with the following hack patch either.

Regards,
Amit Pundir


> Thanks,
> Saravana
>
> --- a/drivers/bus/simple-pm-bus.c
> +++ b/drivers/bus/simple-pm-bus.c
> @@ -38,10 +38,12 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
>          * a device that has a more specific driver.
>          */
>         if (match && match->data) {
> -               if (of_property_match_string(np, "compatible",
> match->compatible) == 0)
> +               if (of_property_match_string(np, "compatible",
> match->compatible) == 0) {
> +                       of_platform_populate(np, NULL, lookup, &pdev->dev);
>                         return 0;
> -               else
> +               } else {
>                         return -ENODEV;
> +               }
>         }

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
