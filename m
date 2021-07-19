Return-Path: <SRS0=/Tun=ML=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB52C07E95
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 17:13:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DEA6610D0
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 17:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DEA6610D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DlJoBuUHXAiUGC5P5bFLKQqB9CpXpkGsfSkgXkarURM=; b=UH0D0hUgEAMqT7
	+DB5pg+FNLK0hVeuLL81kLCpDDmTAFt6HC0n9vRVGQKIaDwWLsiFbMwTXndd+mup0Y8eCjNnNiSBL
	CQ8LhErWopxOK33Wbz4Aw6F4KsEaLHDx+F+BdFJXJV5+HY2ouXJHbyzeZ+dK5sJtZA7KfkCqKi7Tf
	9gFHtfxqts9C383bgTFFdBIZqwmGRzjEvR/A6pbq0+ZTZCqXvYluMuKYwq3cBV2Hu5gQYXtWNSZG8
	gjoMNrVRJH/tn3feNscfFRtidjyu4/9r4MDZsEQkifH1O/w1icg4o68WTCnv5zw8+JyU34FVj2JW1
	ilkA5ZuVowdDgNfwIjcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5WpS-00AjNE-0X; Mon, 19 Jul 2021 17:13:18 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5WpP-00AjMO-7x
 for linux-riscv@lists.infradead.org; Mon, 19 Jul 2021 17:13:16 +0000
Received: by mail-lf1-x134.google.com with SMTP id i5so31473598lfe.2
 for <linux-riscv@lists.infradead.org>; Mon, 19 Jul 2021 10:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8dlreiD3y0FAWWt5AwOtsV8l36/rdSofslQ0of0y/lQ=;
 b=XRbyBWGsdZCS2L6gOZl9l+VDDZ9yWUpInAe9LM08ApS9nbNSGT5QR/fPF6+wTQEuGH
 y/LiUCk4t3wgjsBolsvgQ21MZ9TfDHumwa32TgCZgDIIhpqjXFnM8V3j1c+Q/NzrGUH6
 +eYRhrqQg4FTU24EDoyiRcmZyMaWD9mR/Mp3Hwo8u5cTv/t8JN4xD7rWDk2dGq7eZZel
 P3euVjlZjRdO/NF3qQes8zrIU33LXM+3X9+1ic8q/ZaxFD8Iefy7m6g+0H93kbPnlgeG
 nb2BmiPsO8+3XwHWNgsj4o3tr1Yddx6girWNA78kCrms0A7f6sOK615SDf8uYILH7J7k
 uSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8dlreiD3y0FAWWt5AwOtsV8l36/rdSofslQ0of0y/lQ=;
 b=jHT6hEZgVCdOayOxYRkK1oKAx4SkZy4hqRaKiGZ61zW0nTu3xKA5xHcEgU2Hdiyi2N
 txORkaeI3V8alR4SgNuvmShawA2j2yjVmYIx9NNqWZPpBgsWj48txB/cEm/ea1b+9t77
 w4YSvj49S9j0BAwy+wN6zBMnqNHclb4fEooePv0wAuvP5LVvS6pWrQdExrmM8jVj0Skw
 QHvULyh6v/w9nA1wOV0Wg76hh3a5ZwtX13wvMx4MVE06JCR5YluRiE+HgRbJtDyiIMpL
 MvQKxsQPb7zKjzjF+oDtXcLKHZk3U1MZQt1iYQjP/6xFYQzLonmZU7Rb2EGO8x7QT1XI
 cHrg==
X-Gm-Message-State: AOAM532xcHPe6GjPFQxDMX/EbB/MqVYIE7sDAb/Ck/XqxJW7Mw0UKJGD
 6OXlcNjk3Vauu7xad0ZEk8JVuJ3jMAisEBRum1w=
X-Google-Smtp-Source: ABdhPJzpgx9uN5/6xXR2djonVwm0YGIUSndku6RB0m4t7rOTmele/+5bGntahfqx4YeJb3+/ly6SRQ+MLmeNW7FFiMM=
X-Received: by 2002:a05:6512:3e0c:: with SMTP id
 i12mr18458374lfv.122.1626714793061; 
 Mon, 19 Jul 2021 10:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
 <1607403341-57214-8-git-send-email-yash.shah@sifive.com>
 <CAMuHMdW74DsiqyLCYyWSosZmwVEqPiAWNV2i6m4LWzz0868fbg@mail.gmail.com>
In-Reply-To: <CAMuHMdW74DsiqyLCYyWSosZmwVEqPiAWNV2i6m4LWzz0868fbg@mail.gmail.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Mon, 19 Jul 2021 20:12:37 +0300
Message-ID: <CAEn-LTqq8+B4HRV_1aHSrrRRwd9Xvpd3mBg0fUixtHb_4-4u6w@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] riscv: dts: add initial support for the SiFive
 FU740-C000 SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yash Shah <yash.shah@sifive.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_101315_332234_8C0C8AB9 
X-CRM114-Status: GOOD (  32.85  )
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

On Fri, Jul 16, 2021 at 3:51 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Yash,
>
> On Tue, Dec 8, 2020 at 5:57 AM Yash Shah <yash.shah@sifive.com> wrote:
> > Add initial support for the SiFive FU540-C000 SoC. FU740-C000 is built
> > around the SiFIve U7 Core Complex and a TileLink interconnect.
> >
> > This file is expected to grow as more device drivers are added to the
> > kernel.
> >
> > Signed-off-by: Yash Shah <yash.shah@sifive.com>
>
> Thanks for your patch, which became commit 57985788158a5a6b ("riscv:
> dts: add initial support for the SiFive FU740-C000 SoC").
>
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> > @@ -0,0 +1,293 @@
>
> > +       cpus {
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +               cpu0: cpu@0 {
> > +                       compatible = "sifive,bullet0", "riscv";
>
> I'm wondering why you're using
>
>     compatible = "sifive,bullet0", "riscv";
>
> According to your own commit 75e6d7248efccc2b ("dt-bindings: riscv:
> Update DT binding docs to support SiFive FU740 SoC"), it should be
>
>     compatible = "sifive,u74-mc", "riscv";
>
> instead.

I plan to send out new DT for the Rev3A and Rev3B (the final board
customers can buy) boards.
This is already fixed in meta-sifive.

In general bullet here is micro architecture, but it's less
descriptive in /proc/cpuinfo.

>
> Likewise, the older arch/riscv/boot/dts/sifive/fu540-c000.dtsi is using
>
>     compatible = "sifive,e51", "sifive,rocket0", "riscv";
>
> and
>
>     compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
>
> but according to the DT bindings the rocket part should not be present.
>
> Is there any specific reason for that?
> Should the DT bindings and/or the DTS files be fixed?
>
> Thanks!
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
