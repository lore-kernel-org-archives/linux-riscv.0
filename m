Return-Path: <SRS0=QNeR=FD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF93C3E8C5
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Nov 2020 21:34:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42F822078D
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Nov 2020 21:34:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WDp04scd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LzYwWyNh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42F822078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=07xBFAjnr9KrESXp5MBm9q0cIwhTWrwLCtz/tOeC338=; b=WDp04scd4cd7RiRKVbsYXQJdv
	uKpvEr8eSPyp2Gi9Hxc2SvubhbNmsOV0QkYzwtRKxepNZ1DjbB/gKwviJPjbc2LnNCrdhrBJLmzu3
	nJX6VnpfpDNoYPNeJ8GjCtzd+I6PpqiG+KpwAydYcC4bJczpovd9ML7ZvYajXtTHQbIvUKeWjPT5i
	PANKJ2vVhEE9f1VGv1+yrVf0p6KMdW2VD0FdutjIYdeWPr+84bLuINBKaDTeFEqNTj/YW8caXiIC/
	Ib+ODQnaaCvqi2H2RxkZUlzqlXy+C5eyc9WesvZ80LZpvCBx3oYocJQAUmqI0K/fRTtA1Sie/8wz6
	PYNVBUEIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjUKR-0007mJ-Ar; Sun, 29 Nov 2020 21:33:55 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjUKN-0007m0-Jx
 for linux-riscv@lists.infradead.org; Sun, 29 Nov 2020 21:33:52 +0000
Received: by mail-lj1-x243.google.com with SMTP id y16so14044242ljk.1
 for <linux-riscv@lists.infradead.org>; Sun, 29 Nov 2020 13:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DRks1S+Ljz02h+7aEMkPQyYH0KJUMNRRjQT6vkjrJ6U=;
 b=LzYwWyNh2aq60HnaalbW2E/tfDV3QS5ABPetwv/LjVocBlaMX7p8EW6wSpLS5A+xb6
 3RYtKYPxh3tlC4eQbu6yQKmPtsDYTe+XHrG3aefbkfkGpkyuGSceFP20lxofOmU62OuZ
 jCDZzZvOeeb9rr+liyzgPtp15kW0t5oMmCWPVHMtFmJUzKwYJoSvUw+IOgwl+OIitkEt
 0GYNtHEFzYR21Fqyfr9LrWkLBvuAdd7WcEJWkhAd5/ypnjcyODBcG34cskFi3J5BnKCE
 bwGyj3H502ljkfysjViKkFi0CqGDKaKGdxv8ZMvvVu2cqiGIfoSS8QAhEPPPNcA5KDjB
 cyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DRks1S+Ljz02h+7aEMkPQyYH0KJUMNRRjQT6vkjrJ6U=;
 b=Jrr0trcdhoH1QnDz3FoljcD1+0e+jzP+1zviZWN4dKMSDBLbrUzMPF3ZUbL9hs/Elb
 SVWiSw9tD55Axoh+h0XdlHqglZ42qpTNClM2t3NUXiV3R/YRFlVuVmdHNaBSsb7qYjl7
 XdiZ7v459hfR94FY5Aw+PKZppJ62U9ZO1uwfPQnZp+a/N7/DtlflVqbBn4XiiGS4GlEY
 ro3e2ciALs358NuPM0v0fPe6CuVf6uKLTP2aNNouFic7MJLOANNhg5uNgHJA6izemYds
 dYGDMHIo2hHpNRN0qLyrLsr27Ex8jyye/k2snN+SosDBiyxdz370JkN+qOUeXLBvQ3ns
 aO/w==
X-Gm-Message-State: AOAM5333oNQK9kP7w4yeRfrHtykL0wav1vxRRB3hLIh5IybaWqBxpAgm
 +/b1p55+Zx92ePMhciCXUrOMfRnhPn2URrF9wzaagw==
X-Google-Smtp-Source: ABdhPJytWDlyUMuTJm2jW8TQXYrQA7Ue6rxAsqM+YqSfqeqX2hNWQDHsQOsrBzNYb3DWeZ5mYjjq9y/2I8HLd94BvcY=
X-Received: by 2002:a2e:321a:: with SMTP id y26mr7756884ljy.293.1606685627784; 
 Sun, 29 Nov 2020 13:33:47 -0800 (PST)
MIME-Version: 1.0
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-21-damien.lemoal@wdc.com>
 <CACRpkdZhOxz5NhrkFxZ5G4aOrmBoAcQodOvqzNROQtXpHVQGDQ@mail.gmail.com>
 <CH2PR04MB65228DE061918A4D2A08A0CFE7FB0@CH2PR04MB6522.namprd04.prod.outlook.com>
In-Reply-To: <CH2PR04MB65228DE061918A4D2A08A0CFE7FB0@CH2PR04MB6522.namprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 29 Nov 2020 22:33:36 +0100
Message-ID: <CACRpkdbA_JMiyraKC_3WT26mMUxfuLD=Q_HREmbEB=yNPpuHjw@mail.gmail.com>
Subject: Re: [PATCH 20/32] riscv: Add Kendryte K210 FPIOA pinctrl driver
To: Damien Le Moal <Damien.LeMoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201129_163351_947918_C44F4BE8 
X-CRM114-Status: GOOD (  16.98  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Mark Brown <broonie@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 linux-spi <linux-spi@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Sean Anderson <seanga2@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 9:53 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> On 2020/11/24 17:43, Linus Walleij wrote:

> > Would also be nice if the maintainer could add some comments?
>
> What do you mean ? I do not understand. scripts/get_maintainer.pl indicates that
> you are the maintainer of the pinctrl drivers subsystem.

Sorry I thought we had a RISCV driver already, and we don't
so this is cool.

> Do you mean adding an
> entry to the MAINTAINER file for this driver ? I can do that and put my self as
> maintainer. Or do you mean you would like a comment from Palmer (riscv arch
> maintainer) ?

That would be nice. Whoever will enthusiastically review patches to
this driver and make sure it works and get modernized should ideally
be listed as maintainer. I suggest you list yourself.

The only input I want from the RISCV arch maintainer would
be on this code:

+/*
+ * Most devices on the K210 SoC depend on pin mapping changes to initialize
+ * correctly. So initialize this driver early as part of the post core
+ * initialization.
+ */
+static int __init k210_fpioa_init(void)
+{
+       return platform_driver_register(&k210_fpioa_driver);
+}
+postcore_initcall(k210_fpioa_init);

This is a bit nasty and we do not recommend it. But I will accept it
if the arch maintainer claims it is necessary. What happens if you
just make it initialize at driver level?

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
