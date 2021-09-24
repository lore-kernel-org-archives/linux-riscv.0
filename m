Return-Path: <SRS0=er6D=OO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC8AC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Sep 2021 11:51:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0F2C610F7
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Sep 2021 11:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E0F2C610F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uA8B2K4Ls3eDxtNg+Gca+x8D7AmFqWk//zP7YC9stwc=; b=Y8SJtQSbZuTwzm
	+IdRxNNb9VFnN2xN0vjfu7pSGa0ptMWhi54jFcsyr0BUgXqDU6VTf1RzmPKVF+T0G80mzSKQFE2JV
	zPu0CKOsx4DqHczGQXWYvdil2XVDCzPw982M3UbryCptQEa99UMG8mHHlqHA5bxXT1pmzsujdHHaI
	pvN9qfT4JmMq0h/q/bw+wJT84YGd9hKx06fU+Uen7m+WtHblbfawMJfcArUqRvCjZhsEzchh7BX99
	ziQEKcVnioJp6hsm85KbKs/lHiCHnLKzT6wUl7wiTLYGkJUy5qch0dCIZ1QhS7ugcPaJ3Dm8/6tYs
	A/Z0Pp5r2znUjbtBZgdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTjjA-00EEoO-Fl; Fri, 24 Sep 2021 11:50:52 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTjit-00EEjj-RM
 for linux-riscv@lists.infradead.org; Fri, 24 Sep 2021 11:50:37 +0000
Received: by mail-lf1-x135.google.com with SMTP id i4so39289462lfv.4
 for <linux-riscv@lists.infradead.org>; Fri, 24 Sep 2021 04:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kEt2247V9zfkMmq1F9RlST40QLwr3RwE9wMC0mnatTk=;
 b=uWdMrY7koAR2hpcHNFqqG1zCoSd5p/Jjf5CeHKm4H8l1Hoam97B8JMcNypK9PrXOhA
 hNxHVQ/YTznhHJQME/HliSyIBBgkodP6GzSZg//VXVhavJdmPeBFgf9HdUTmbHQ9BJth
 qcbdPTeGL51PkKvu5yPfEV1Otx187LgYJ6s55ErkWzgKRNJT26cth4umeN4HCyjmBIOu
 fW1AxvMgrbc8JUze20zR4QlXYWBys49aRQw8fQ81+CYXLNVeLqqbUhvXVdRG9osRugRF
 oL4VAp/pniJDex748IlaewwcsX8L4K4vKHW/YV8rfk6hWwTCs2IvQnmo1zNAxf1CbHiw
 o1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kEt2247V9zfkMmq1F9RlST40QLwr3RwE9wMC0mnatTk=;
 b=LhmRsPyU5KlhJ9cyhoEMdMNHyekbQLwUBmlmVOBBkD0bSbYXKdzk3jeYjZkvhwFKUO
 NrX9o22q6+lWVjPYSEN7owFk+WhSeLxOCzsy490wPhmcUp7QekWSGUtSAwrkpReIZTI9
 +1FD9Ol4VR8Zh8lgGGh8wvsPJP2cdosZgHEmDd1NYKGjR6M0tCGWAbPBS1MaKJnbrUJO
 3/ygytF5APDm7Oou+oCHJDIKMCcvvuOIwDSD0KrL5pIain6WFNEC69wtM2bmOK6IkmsF
 JAQ7BgQxjNhPHFYzoUmB7Dk0mo9fYXmEAvTqXj+HlKiaEkIbfpLBIkG8bEuDi0nU7zHr
 fQTg==
X-Gm-Message-State: AOAM532NIy8vUpmB/4mK9lTo2f+k+X0hPt0Zq2LGJ0DgPz5mErj1Ub15
 9UlPlLXT3BuG3WDpNIwswAfGxEWSiC8LSoFWVwFHBw==
X-Google-Smtp-Source: ABdhPJzT8CwjX6XkyqPrbzpNsUJn1D9zAENUSGXKVEkEMrS8jHcKlaUoEVK6FxOCzgq/WxRmjBV5Scn9f5DRr3Vp/tM=
X-Received: by 2002:a05:6512:2397:: with SMTP id
 c23mr8894593lfv.358.1632484232104; 
 Fri, 24 Sep 2021 04:50:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210904000543.2019010-1-saravanak@google.com>
 <20210904000543.2019010-2-saravanak@google.com>
 <CAPDyKFqkvN=ZrfAnj4CqfjBu_Pj0YH9txnkP-1d=FhaEhbPrPA@mail.gmail.com>
In-Reply-To: <CAPDyKFqkvN=ZrfAnj4CqfjBu_Pj0YH9txnkP-1d=FhaEhbPrPA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 24 Sep 2021 13:49:55 +0200
Message-ID: <CAPDyKFqRR-GD=xZo27a9MgwzKT9mar4m0Bdki1VBxnsZaQy1_g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drivers: bus: simple-pm-bus: Add support for
 probing simple bus only devices
To: Saravana Kannan <saravanak@google.com>, Rob Herring <robh+dt@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
 Android Kernel Team <kernel-team@android.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-oxnas@groups.io,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-omap <linux-omap@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_045035_917434_40355E00 
X-CRM114-Status: GOOD (  17.89  )
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

On Thu, 9 Sept 2021 at 13:01, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Sat, 4 Sept 2021 at 02:05, Saravana Kannan <saravanak@google.com> wrote:
> >
> > fw_devlink could end up creating device links for bus only devices.
> > However, bus only devices don't get probed and can block probe() or
> > sync_state() [1] call backs of other devices. To avoid this, probe these
> > devices using the simple-pm-bus driver.
> >
> > However, there are instances of devices that are not simple buses (they
> > get probed by their specific drivers) that also list the "simple-bus"
> > (or other bus only compatible strings) in their compatible property to
> > automatically populate their child devices. We still want these devices
> > to get probed by their specific drivers. So, we make sure this driver
> > only probes devices that are only buses.
> >
> > [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > Tested-by: Saravana Kannan <saravanak@google.com>
>
> Tested-by: Ulf Hansson <ulf.hansson@linaro.org>

Saravana, Rob,

I have been following your latest discussion in this thread - and it
looks like you guys are moving towards a consensus.

Although, if there is anything I can do to help to complete this, just
tell me and I will jump in immediately.

[...]

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
