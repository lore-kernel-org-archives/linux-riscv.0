Return-Path: <SRS0=Z6yX=OZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6720C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 15:11:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A25D6109F
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 15:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A25D6109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8bmnU1cnv7f3gimgNqWkRwkvB8Ic96svnwztY8u6odQ=; b=dszvnwGI5LeWM8
	oYVqfVYp8fUiTSMTHiSc31xbS2rk6CTEGjsYkQfKc0t0cFfgcOqa5DPvNts8w39Df33HdSUMOZI0t
	Lgew8fjO8skKUgVM/1eSI6eskdhcfFwKo4tyYzUldJ9nqPMT0bMw2g5xYv3WBpoMQeq7SGmLBt8wu
	FIg2wOnn9VAQDsM95OUIs7mXQx/USyR3HZbkJQoDAaaHGAKYs/WnOAavo8PnfbNF9wJVpYPyE5fha
	QjvqKZPWI/18kPS935W9MS41Vi38QJbYzrCecVQU2aNemawFjXxr3oqRThMyqn3DUAj/mFoCTmROj
	e9PGLNc4sb6Cnz+gXemw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXm6S-00AzYN-P4; Tue, 05 Oct 2021 15:11:36 +0000
Received: from mail-vs1-f51.google.com ([209.85.217.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXm6G-00AzVM-LR; Tue, 05 Oct 2021 15:11:25 +0000
Received: by mail-vs1-f51.google.com with SMTP id f2so23186065vsj.4;
 Tue, 05 Oct 2021 08:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AO/n39DEQE+kNBhOJcG8/vIMrumgJRNvPPJVHpBpJic=;
 b=RharxzBKtjQMOtgUIDbEtwFxvwTSeSFQlJvinvZjZUNmX/9uoRYO/hB1BFgf5saZB9
 y4iGj8/pdBK3iCF/Kb9qR+/NnIftdfzZVaAf1sIyK+9wbhEVn05tzYzLGeSJuulSPGI7
 3gJRl1LcDMw93syHK7568oFUZUMn+5AqZv0iGyXy7QnpqdbDD1lADruaYwCCWFVcghxA
 ib4SeCRZfEnPXR7G4uxEGcUlh5LrGtSw6Q2LwfaYinmhTL8852gBS1XHlbRu65nwiaGz
 hIYx+fRcPlFQIV8oYBpUpDK/hq8aAK4uWoKgNjxdk18mbBPZqyYejea0lFHPSos0FDfU
 DHkw==
X-Gm-Message-State: AOAM5337qkQafgjZdzdgEs2GV5GwXZaLk4jqMpAMDlJHUUuYaKW2Hdce
 ev8wgArsVaRZAb6FOZX71agFxP4YsNYSoC7VH3A=
X-Google-Smtp-Source: ABdhPJwbutRLYFa/x4DgBk6axsrpzqnuQQS9yABJI7P4SqTGGeBmOBsHASLte9b+qo/+S14Axl7WqhSZ8l5JCixtpCM=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr19359924vsl.9.1633446682848; 
 Tue, 05 Oct 2021 08:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210929000735.585237-1-saravanak@google.com>
 <20210929000735.585237-3-saravanak@google.com>
In-Reply-To: <20210929000735.585237-3-saravanak@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Oct 2021 17:11:11 +0200
Message-ID: <CAMuHMdWLgpom978bGt1vdNQNxPVb34QJRs5gdRKnRkOs6DJOLA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drivers: bus: Delete CONFIG_SIMPLE_PM_BUS
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
X-CRM114-CacheID: sfid-20211005_081124_722979_91701E0C 
X-CRM114-Status: GOOD (  18.37  )
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
> The simple-pm-bus driver is mandatory for CONFIG_OF based platforms to work
> with fw_devlink. So, always compile it in for CONFIG_OF and delete the
> config since it's no longer necessary.
>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Tested-by: Ulf Hansson <ulf.hansson@linaro.org>

Works fine on R-Car Gen/Gen3 (simple-bus), and SH-Mobile AG5,
R-Mobile APE6, and K210 (simple-pm-bus).
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
