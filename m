Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89266C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 00:31:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD5C660F70
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 00:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD5C660F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cvoC+Kj7OdnXES/iMo1sEHtUBeKrbnc+eTdyxjyCLbs=; b=zRbhQlbVZEvLM8
	gGEozvqrvoPLf5YoF81u8j/mhEJs18AtazFsUtaKqjUSGXEaGqb742/fXNHoi+mn3xsNLbEP6VbMp
	UNKBZlnu03kCLUeostRCR266tLqGJyM+NTDWh9lTBI5GIF++uQcp5PlsiJT6HeC2pY2hm8paoBMeg
	GyktTdomZozVZA2dABAjv1DTt2QpDpLWHgSXo0jvT/s5rsbfHUJ7GDVy/35p//tCLlsIoaF5VY8hF
	W0YHBy2DK3z2RYyCACrnDt8xbOpArev5XEt/U//vBNO6P77P989sU4gb2ksQUCtLgPF+eLRODzNXK
	VNIcw6pIRcUVjHftwqKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfAMY-000MMh-Bz; Tue, 26 Oct 2021 00:30:46 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfAMV-000MLA-Ub
 for linux-riscv@lists.infradead.org; Tue, 26 Oct 2021 00:30:45 +0000
Received: by mail-yb1-xb32.google.com with SMTP id i9so30337908ybi.8
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 17:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GKpt6gbUiUnxRUWu5oj6hwoD4Hy59PUSCVuLvc1dxEQ=;
 b=RXv66RKwy6UqpmJo42NU6ImPtA0hhG8/Hy8v1NimoQYcVrEDXumRbWrcFjH1xV+Ock
 bXfHSE1/Aa52wxOkNcAfIoezAMn3Lpd9TvcFaLmUkm9YSD1ViBQO3RTcfNLjsQAEVwPO
 Sr04OJMjHKpOMiakJvt4bqsOkwBFejrv5vw1+yiMxdDWuSGB3dwrLvEHrZHaBDAxQ3uA
 mA+d2EtJEqyxDpUIrllz7ZzNwH/TJ1a18W6GZtWTatTAtJkG5uU+3x0kjP5oP99JIRpK
 8UWvswhWCiyJQ6Wipr1qNVQ4eL1Iq7g7upvvOrcQcLjJqw8VVQGfniWrGznluMgNzjyV
 XYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GKpt6gbUiUnxRUWu5oj6hwoD4Hy59PUSCVuLvc1dxEQ=;
 b=bdeoHISghY0luGAao2e5ndQxJ9T9QlVN5bM5IHbmM7GOa5MtzFS1L5dZu02tbUP0R7
 pZbGntjvvRzgJS5QXA0MCX320lUOtextJzI182Be+Y2d2qw0zzEySHqizAvV4HAYN01R
 vVVUpr8bRYMnQ+Q6EpbfCFiB9IU5L6Pq0mq9fqgNaXrap4rpfOvHfZ4urZduhCoE2jd1
 BMfR5nB7AHcgt8OvOc64MVPpL0hcDF5k+SdbulpO6xoXCdQaigHAZQ79vw8tEt04LKDb
 c6xw16j0MHJbOvspAcxY87VguInhj2u2hcwq05xU9pYgtwmvTWe7LFCpnU8EDSjiEiZw
 EePw==
X-Gm-Message-State: AOAM533r2FxrGxPawBSTBcXz6c8uYH1ZYaJ2pVs6hEdhZogUsZao3f7d
 +O50Hk2INq8FhpMZeLH6MpUAQJ/av07h9SqzckLcdw==
X-Google-Smtp-Source: ABdhPJwkdfRIKjhmBppLm+T21H0QPHoD4LXXiPIYhqq5jQAumISBbcpXVG/c3VSAYycVKUykbWB0N2n0Rav/D4MlbEo=
X-Received: by 2002:a5b:cce:: with SMTP id e14mr20273877ybr.486.1635208238648; 
 Mon, 25 Oct 2021 17:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210929000735.585237-1-saravanak@google.com>
 <20210929000735.585237-3-saravanak@google.com>
 <CAMi1Hd0HvPOT277mx8hNTU9NQH2ti7h5qc5+rxOkRWwbfrhyQQ@mail.gmail.com>
 <CAGETcx_YZOd05Gg53ZR8mfVhFUzwQWo4MrrWF8JHF_DCwEtunw@mail.gmail.com>
 <CAMi1Hd3M--+V6jPTV=psYGpOqi3UeQBs_FHqOg=oUf1hH-EU4w@mail.gmail.com>
In-Reply-To: <CAMi1Hd3M--+V6jPTV=psYGpOqi3UeQBs_FHqOg=oUf1hH-EU4w@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Mon, 25 Oct 2021 17:30:02 -0700
Message-ID: <CAGETcx9U130Oq-umrvXME4JhEpO0Wadoki3kNxx=0-YvTR6PtQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drivers: bus: Delete CONFIG_SIMPLE_PM_BUS
To: Amit Pundir <amit.pundir@linaro.org>
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
X-CRM114-CacheID: sfid-20211025_173044_017161_6C792A21 
X-CRM114-Status: GOOD (  34.76  )
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

On Fri, Oct 22, 2021 at 10:00 AM Amit Pundir <amit.pundir@linaro.org> wrote:
>
> On Fri, 22 Oct 2021 at 05:13, Saravana Kannan <saravanak@google.com> wrote:
> >
> > On Thu, Oct 21, 2021 at 4:21 AM Amit Pundir <amit.pundir@linaro.org> wrote:
> > >
> > > Hi Saravana,
> > >
> > > This patch broke v5.15-rc6 on RB5 (sm8250 | qcom/qrb5165-rb5.dts).
> > > I can't boot past this point https://www.irccloud.com/pastebin/raw/Nv6ZwHmW.
> >
> > Amit top posting? How did that happen? :)
> >
> > The fact you are seeing this issue is super strange though. The driver
> > literally does nothing other than allowing some sync_state() callbacks
> > to happen. I also grepped for the occurence of "simple-bus" in
> > arch/arm64/boot/dts/qcom/ and the only instance for 8250 is for the
> > soc node.
> >
> > The only thing I can think of is that without my patch some
> > sync_state() callbacks weren't getting called and maybe it was masking
> > some other issue.
> >
> > Can you try to boot with this log (see log patch below) and see if the
> > device hangs right after a sync_state() callback? Also, looking at the
> > different sync_state() implementations in upstream, I'm guessing one
> > of the devices isn't voting for interconnect bandwidth when it should
> > have.
> >
> > Another thing you could do is boot without the simple-bus changes and
> > then look for all instances of "state_synced" in /sys/devices and then
> > see if any of them has the value "0" after boot up is complete.
>
> Turned out RB5 is not even reaching up to
> device_links_flush_sync_list() and seem to be stuck somewhere in
> device_links_driver_bound(). So I added more print logs to narrow down
> to any specific lock state but those additional prints seem to have
> added enough delay to unblock that particular driver (Serial:
> 8250/16550 driver if I understood the logs correctly) and I eventually
> booted to UI.

Ugh... I think I know what's going on. It popped into my head over the weekend.

Couple of ways to confirm my theory:
1. After it finishes booting in both cases, can you compare the output
of the command below? I'm expecting to see a significant drop in the
number of device links.
ls -l /sys/class/devlink | wc -l

2. Can you try out this terrible hack patch (not final fix, no code
reviews please) on top of Tot to see if it fixes your issue without
having to add hacky logs?

Thanks,
Saravana

--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -38,10 +38,12 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
         * a device that has a more specific driver.
         */
        if (match && match->data) {
-               if (of_property_match_string(np, "compatible",
match->compatible) == 0)
+               if (of_property_match_string(np, "compatible",
match->compatible) == 0) {
+                       of_platform_populate(np, NULL, lookup, &pdev->dev);
                        return 0;
-               else
+               } else {
                        return -ENODEV;
+               }
        }

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
