Return-Path: <SRS0=pf/r=FU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2558C4361B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 06:06:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A12F2333E
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 06:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A12F2333E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+Z/nWTyyq/jPjF7oN7GbfmL/J6jAc2F+MvaO9bfit1k=; b=pYzmqQVY8q5YMDKJYvs2ybY1I
	aTpgpgptSR6x+unh+b3dd0zpP8HzoBCp1DzTOYopsytBpO2ueM/xxAwaSspkLxRVrOauajxnyY3x1
	VVrlEO0ZuH2nJna2iq3ZqAQQ0A2SkPkoNWYv5oi9PqwLHTMg5P5cE3I/2thL2ug+Ua69SuUQVUG6I
	JX0f97VzZoMda6SIq/KUaXCqTg9HPGlls1lqi1BapnO9IJDpf8Dg4Q5BOtuOueJlEYRDG3ezWDSK6
	yeVxaSzqGLzRTLdjiwBMUbzc3k2TPnQXeM6LObaydHP0zykcPcTX6EPhvf1Inj/amOwDLs8UXcg/C
	+ebwsviug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpPxD-00029t-2F; Wed, 16 Dec 2020 06:06:27 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpPxA-00029B-1O
 for linux-riscv@lists.infradead.org; Wed, 16 Dec 2020 06:06:24 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id w135so21293311ybg.13
 for <linux-riscv@lists.infradead.org>; Tue, 15 Dec 2020 22:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bQSBU3DldQmZhqs8BiiflDFptJcD7jZrmoWAbiLUJhU=;
 b=bLF8Zg/bSTck1Rd+5n691xW28veCVszy71v2IOmm9GH5VNg1dfDTm9OCbBpZFVHA4W
 69Yqq12T3JRZbfDz6OpYxXIwYkC4NmkDtSvqAN7Hjkv64SOp8L46V2/pir+zj82iLPZT
 qAcwwtT33M9OFI0pZzSA2mVoLf0TaxeXvtXrZUYKRvtL9l6PUAdm29bR8DpWocBY0dGQ
 YgSPzYkqZA75IkfE+uxo82DKz+ULOGI6vWifIJjknmxH7tQJS2WbWJLWXOfdP68BL4Rd
 jTvROBL5CiepbUY8CFor8xkEOfX8Z5FONKNHnOxw0FEWx6VTDFTVfLXc94mpt5cJViQX
 62Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bQSBU3DldQmZhqs8BiiflDFptJcD7jZrmoWAbiLUJhU=;
 b=Xw+cEOko+UuvCUP/iW/U95BYsVMCPVEBghbLXD73b+n4GQCsrO7c3+ShUeTDG65cKp
 j7mABnyk2ndPPmgHG2uIUxCqo6pERIIhP7wUAzA4rsSNwNmRPztR6K08lI/lU2I3HV4t
 AvwFH4yvSzWqqyKf/T2rs60YDpUP25iqBmmn8UuwgqDHB0kp76EsWpSWKGR+zf/mvOoF
 igBDheWlw2c61zBKn4HFpUW34zcvNP3KoIyJoQlt7aaKBsj9n3W3YxwXlzLW2Jx5JNtU
 KmR5qZB0zp1CROw5WneDyD51LJ1Qw7SyCMU3jx+y8QdqDGB4oFNPO8XnCUC8wVF9kyMH
 XqjQ==
X-Gm-Message-State: AOAM53276zN9Ech1Ug+9NDLF/NmrkU+gJj1AgPUdgqE4pHEVb/gqXK9m
 GT7m1Bj+kF6uUK5fvninYAF2HsZb8vyLMXD4k6U=
X-Google-Smtp-Source: ABdhPJwP+8IZQgQaJ80ndOw3XeyHnKwU0qnA27GXZdW4AXYA2almMdZEH9ilfdSzFgKArCUYPf2VEQkSv3iuCI6MrtI=
X-Received: by 2002:a25:be87:: with SMTP id i7mr46897305ybk.332.1608098778261; 
 Tue, 15 Dec 2020 22:06:18 -0800 (PST)
MIME-Version: 1.0
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
 <1607403341-57214-8-git-send-email-yash.shah@sifive.com>
 <CAEUhbmURfwMYo6FTuL7TP7daSuhBOOpcZX-mfCxCTVS+QiaHqA@mail.gmail.com>
 <BY5PR13MB44539E6CDB009EFA6AB7CAFA82C50@BY5PR13MB4453.namprd13.prod.outlook.com>
In-Reply-To: <BY5PR13MB44539E6CDB009EFA6AB7CAFA82C50@BY5PR13MB4453.namprd13.prod.outlook.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 16 Dec 2020 14:06:07 +0800
Message-ID: <CAEUhbmWrCpKraUpijggkiNXa40OAnN9YJF1iFWnrnrhJZN1joA@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] riscv: dts: add initial support for the SiFive
 FU740-C000 SoC
To: Yash Shah <yash.shah@openfive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_010624_101515_F413641F 
X-CRM114-Status: GOOD (  24.92  )
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
Cc: "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 Peter Korsgaard <peter@korsgaard.com>, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree <devicetree@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "Paul Walmsley \( Sifive\)" <paul.walmsley@sifive.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "andrew@lunn.ch" <andrew@lunn.ch>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Yash,

On Wed, Dec 16, 2020 at 1:24 PM Yash Shah <yash.shah@openfive.com> wrote:
>
> > -----Original Message-----
> > From: Bin Meng <bmeng.cn@gmail.com>
> > Sent: 10 December 2020 19:05
> > To: Yash Shah <yash.shah@openfive.com>
> > Cc: linux-spi@vger.kernel.org; linux-serial@vger.kernel.org; linux-
> > pwm@vger.kernel.org; linux-i2c@vger.kernel.org; linux-kernel <linux-
> > kernel@vger.kernel.org>; linux-riscv <linux-riscv@lists.infradead.org>;
> > devicetree <devicetree@vger.kernel.org>; open list:GPIO SUBSYSTEM <linux-
> > gpio@vger.kernel.org>; broonie@kernel.org; Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org>; Albert Ou <aou@eecs.berkeley.edu>;
> > lee.jones@linaro.org; u.kleine-koenig@pengutronix.de; Thierry Reding
> > <thierry.reding@gmail.com>; andrew@lunn.ch; Peter Korsgaard
> > <peter@korsgaard.com>; Paul Walmsley ( Sifive)
> > <paul.walmsley@sifive.com>; Palmer Dabbelt <palmer@dabbelt.com>; Rob
> > Herring <robh+dt@kernel.org>; Bartosz Golaszewski
> > <bgolaszewski@baylibre.com>; Linus Walleij <linus.walleij@linaro.org>
> > Subject: Re: [PATCH v2 7/9] riscv: dts: add initial support for the SiFive FU740-
> > C000 SoC
> >
> > [External Email] Do not click links or attachments unless you recognize the
> > sender and know the content is safe
> >
> > On Tue, Dec 8, 2020 at 3:06 PM Yash Shah <yash.shah@sifive.com> wrote:
> > >
> > > Add initial support for the SiFive FU540-C000 SoC. FU740-C000 is built
> >
> > FU740-C000 Soc
> >
> > > around the SiFIve U7 Core Complex and a TileLink interconnect.
> > >
> > > This file is expected to grow as more device drivers are added to the
> > > kernel.
> > >
> > > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> > > ---
> > >  arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 293
> > > +++++++++++++++++++++++++++++
> > >  1 file changed, 293 insertions(+)
> > >  create mode 100644 arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> > >
> > > diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> > > b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> > > new file mode 100644
> > > index 0000000..eeb4f8c3
> > > --- /dev/null
> > > +++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> > > @@ -0,0 +1,293 @@
>
> ...
>
> > > +               plic0: interrupt-controller@c000000 {
> > > +                       #interrupt-cells = <1>;
> > > +                       #address-cells = <0>;
> > > +                       compatible = "sifive,fu540-c000-plic",
> > > + "sifive,plic-1.0.0";
> >
> > I don't see bindings updated for FU740 PLIC, like "sifive,fu740-c000-plic"?
>
> That's because it is not required. There won't be any difference in driver code for FU740 plic.

Are there any driver changes for the drivers that have an updated
fu640-c000-* bindings? I don't see them in the linux-riscv list.

>
> ...
>
> > > +               eth0: ethernet@10090000 {
> > > +                       compatible = "sifive,fu540-c000-gem";
> >
> > "sifive,fu740-c000-gem"?
> >
>
> Same reason as above.
>
> Thanks for your review.

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
