Return-Path: <SRS0=Z6yX=OZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C32C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 15:07:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F37660F48
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 15:07:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F37660F48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qpSicArA8+jDskApID8KdGXxZl1hoi9bbUpGHN/Xymk=; b=eU40TZse/jB8DU
	4cPdDFr8A6H5QtaNy+zTcZWLxN9o+HdIBBCNRJVYdrxznR0qRkQyHUBmQnezurlpG6RtOErCtUX6w
	3JcxJJP02v7jFT3/9YECI4Xo0VIZGQNo5XoFiiKVMC34Fn09s+xjKNl9c0bT3rp5t7qln/NkXzsSd
	lMFYJnMWZ/3yY4943/uC9n8KyDoFL0hnVXNcErhe9jv+DLn5pTQOjOElCCnDklp8VdnJ4RmVrLUYw
	dpbeu7T6K3GDrDnes+iWgtnebQuk/+tCp/aW0yA258uaMCh9yI3NTY2XiTo+4TKslekbg/L/P+aDe
	HqyeaFUI7OOu1x4XDrLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXm2R-00AyoN-0k; Tue, 05 Oct 2021 15:07:27 +0000
Received: from mail-ua1-f48.google.com ([209.85.222.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXm2D-00Aylu-S5; Tue, 05 Oct 2021 15:07:15 +0000
Received: by mail-ua1-f48.google.com with SMTP id 64so15094538uab.12;
 Tue, 05 Oct 2021 08:07:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bk0G/z1T/uosdH3nhuVAPRarw22NSmvJmajc0ie3v6A=;
 b=0Gm5TFSOWC7bu7ynoNZGAzGT9nO6YubbOzEgXGYnOPNge8BgAWJmCyUi2xB+m0T+bg
 CIl+buf82OIqoFw9MQS7uOhOK44qOoVDQWB1PoOVCN0A/eewjGhRlymlGMt42aU4+1yx
 lyokFchVIYyc4/1C7OZe0oxHBUO2EhJsYRhMGg2g83FHp57C9bZT1fUcjfpSWS9WMuZZ
 u3JDQ1l58xIntcqGW0U9OQ67iuWXCt6Y1GxFne7a5rfc7iwYnbGPkbKjIlQYbMPm+8rd
 SDrH/5eIIqkK8i4+563e0isCQEnipk1nM3x/iOI8veV4b46VRIuVHcXR5fzD7gCteh5p
 Z74w==
X-Gm-Message-State: AOAM531YhaULHyWnqOk6TToNrvgXN/UPAV1WbJVpKi2mNy6GZnMijMaB
 WUPIikT/d3Rw6AHhbuedsOgI86ylQFd27BBwOmA=
X-Google-Smtp-Source: ABdhPJzxRXB84hERP6o6WD8zVyYzPaZTAX750wbPz4I9CTy02fziulaptkej0GIkEyJDLO2QdDkhEc1GsBZ/isZxSXk=
X-Received: by 2002:ab0:538a:: with SMTP id k10mr13022243uaa.14.1633446432404; 
 Tue, 05 Oct 2021 08:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210929000735.585237-1-saravanak@google.com>
 <20210929000735.585237-2-saravanak@google.com>
In-Reply-To: <20210929000735.585237-2-saravanak@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Oct 2021 17:07:01 +0200
Message-ID: <CAMuHMdXG1MLQiwoaa6W5R8fJUBEUePUPnmqQ3baoVzLzp=JMLQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] drivers: bus: simple-pm-bus: Add support for
 probing simple bus only devices
To: Saravana Kannan <saravanak@google.com>
Cc: Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Magnus Damm <magnus.damm@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Damien Le Moal <damien.lemoal@wdc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Android Kernel Team <kernel-team@android.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-oxnas@groups.io,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 "open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_080713_927015_D751EBD4 
X-CRM114-Status: GOOD (  22.01  )
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

On Wed, Sep 29, 2021 at 2:07 AM Saravana Kannan <saravanak@google.com> wrote:
> fw_devlink could end up creating device links for bus only devices.
> However, bus only devices don't get probed and can block probe() or
> sync_state() [1] call backs of other devices. To avoid this, probe these
> devices using the simple-pm-bus driver.
>
> However, there are instances of devices that are not simple buses (they get
> probed by their specific drivers) that also list the "simple-bus" (or other
> bus only compatible strings) in their compatible property to automatically
> populate their child devices. We still want these devices to get probed by
> their specific drivers. So, we make sure this driver only probes devices
> that are only buses.
>
> [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> Fixes: c442a0d18744 ("driver core: Set fw_devlink to "permissive" behavior by default")
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Tested-by: Saravana Kannan <saravanak@google.com>
> Tested-by: Ulf Hansson <ulf.hansson@linaro.org>

Works fine on R-Car Gen/Gen3 (simple-bus), and SH-Mobile AG5
and R-Mobile APE6 (simple-pm-bus).
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
