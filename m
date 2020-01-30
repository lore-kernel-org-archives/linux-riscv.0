Return-Path: <SRS0=BSbV=3T=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA213C33C9E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 30 Jan 2020 06:24:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4D1620707
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 30 Jan 2020 06:24:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RB4W42xu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhT0NN42"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4D1620707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8XSmM59COl7txK2QOvhCU1JROSeFvf6jMIPpsoztfxQ=; b=RB4W42xu2me23WlGybqdernsL
	a5kqo4cd8cHlXdbZdcstaj5DSeUBEOhf08npR28qtwZ5iB3dKAHItHNB+XUvYb7M6FragvlDCwaJT
	DrlP9dP7Yc/O5s0FTxH94k2/KZb+eKmtUELaZwyNHtkKrE66pG7JGHbyK5gr9BGISumciHEFxiu8o
	rT1Ro6LlcBPq2geQvcsNgK1HxDTbAc8QFanzOehbLh/YYZ9cTvRwzV5LvuqK3y55FABr1ihYfrlZ2
	wXNbrbfMhawEgj3qZEJ5ufkwsiGMk0P0sjALJNOzOQsYa2sr9vS1czm/LbFQL/lCHNEFVfpM4fr77
	3q1aQ6Nug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ix3F9-0003rP-Vo; Thu, 30 Jan 2020 06:23:59 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ix3F8-0003qt-2z
 for linux-riscv@lists.infradead.org; Thu, 30 Jan 2020 06:23:59 +0000
Received: by mail-pg1-x541.google.com with SMTP id k3so1111769pgc.3
 for <linux-riscv@lists.infradead.org>; Wed, 29 Jan 2020 22:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8XSmM59COl7txK2QOvhCU1JROSeFvf6jMIPpsoztfxQ=;
 b=EhT0NN42A+S0CP81IB8cdOlCK8Cy8ucfF2LjQjUSHdYthrEp7VonHi4NBepGt1PbOc
 Zkrlf9sa6nBW6o7Qpy0rJhIihO2XMscmgVgAuIMmoJm04stU7rxZX97MDlv93B1LRL6i
 ivg22saYT5UuCLK1oENqoucuS1qg10YOsFPe828Ueui7M+BKd1JWBO+gN6dee+dST8PX
 aDyWCyGXBZOPTLua5GopZRcpVcOXw4bYlyn6EiNkl/m/r1DSSV8p45e5TYnph9/Kg5zp
 0IxiNOqeNvOSQjfkUQSw0J+trX7y7k/tblKsrx/AZGvC/Zta22m76rpTiVuIk4xbKnSZ
 0w/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8XSmM59COl7txK2QOvhCU1JROSeFvf6jMIPpsoztfxQ=;
 b=nmoNhMkPZkS7fDnpNDKavA0yvOKnXmGONUwyOGm4noi+0yVtkcwIuUWShVfm3h9mG6
 O2Ert4jfIll6Iuxg4EpvWvDlVvG7xmQj7POtau6BgFgF5sgNj9lDLhw/nnQR//kz9geM
 qBQSsahFgHYoHB6tQslma+NfHeQ+s/aGAv7M+3fCh7mYdmoRJleNSbBfTh1A1YA+O5DW
 /e0mLxN+y50Gi2rVnBRiwnb9UywjPshhnD/PBggXrVG7U3otWLKxecxxOWLm18qJcwx9
 c9jJiia8Cyy1cpFemj4lFIesW1aW8oylUslzSoCI8970LHduNNOgTESM0uUWVI7qMQ40
 cXjg==
X-Gm-Message-State: APjAAAXKshmFK1OkEHfHRzDYMjTG/Yitr9oUmHd5+cj+X0fmWUfpsr4/
 NTqzAG2eSosTYyDO5UL/ITAaKHB1FplEKaCVmqo=
X-Google-Smtp-Source: APXvYqxaHY1tadbcMlZi96tkShF/+XeSsOzRHlB0alwG40nlcdPRmjf72uj1cFdwa4m7YZI3cJWOS+PYeezHwWm+WFM=
X-Received: by 2002:aa7:8bcd:: with SMTP id s13mr3533157pfd.234.1580365436889; 
 Wed, 29 Jan 2020 22:23:56 -0800 (PST)
MIME-Version: 1.0
References: <CAHOvCC5aEc=p_6Yxkyr8n9BXZug_-NA_CJswu8vtkM8aOBhWvg@mail.gmail.com>
 <alpine.DEB.2.21.9999.2001291930040.1008396@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.2001291930040.1008396@viisi.sifive.com>
From: JaeJoon Jung <rgbi3307@gmail.com>
Date: Thu, 30 Jan 2020 15:23:45 +0900
Message-ID: <CAHOvCC6MwS27mOkAptnFTs1MrSZ_bZOTE-sLdd4riE3A=Y5QLA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add gpio and pwmleds to
 DTS(/arch/riscv/boot/dts/sifive/)
To: Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200129_222358_138443_C8818003 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

I agree with you because LEDs are user defined using method.

And, I am sorry about that I confirmed lately below posted by Yash.

https://lore.kernel.org/linux-riscv/mhng-cb360722-bdb6-4cf7-9fa7-1d92f6b6bbfa@palmerdabbelt-glaptop1/T/#madb19f55bac11a9a675b1ca73ca3f0c2d88c57cf

It is helpful for me and I am testing it.
If I find a bug, I am going to share about it.

Thanks a lot, Have a nice day.

Yours,
JaeJoon Jung

On Thu, 30 Jan 2020 at 12:35, Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> On Tue, 21 Jan 2020, JaeJoon Jung wrote:
>
> > I added below DTS to act gpio and pwmleds for SiFive FU540 Unleashed board.
> >
> > diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> > b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> > index a2e3d54e830c..b03bf570020c 100644
> > --- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> > +++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> >
> > +                gpio0: gpio@10060000 {
> > +                        compatible = "sifive,fu540-c000-gpio", "sifive,gpio0";
> > +                        reg = <0x0 0x10060000 0x0 0x1000>;
> > +                        reg-names = "control";
> > +                        gpio-controller;
> > +                        #gpio-cells = <2>;
> > +                        ngpios = <16>;
> > +                        interrupt-controller;
> > +                        #interrupt-cells = <2>;
> > +                        interrupt-parent = <&plic0>;
> > +                        interrupts = <15 16 17 18 19 20 21 22 23 24
> > 25 26 27 28 29 30>;
> > +                        status = "disabled";
> > +                };
>
> Yash posted this a while ago:
>
> https://lore.kernel.org/linux-riscv/mhng-cb360722-bdb6-4cf7-9fa7-1d92f6b6bbfa@palmerdabbelt-glaptop1/T/#madb19f55bac11a9a675b1ca73ca3f0c2d88c57cf
>
>
> >
> > diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> > b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> > index 88cfcb96bf23..f3f55dbbf737 100644
> > --- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> > +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> >
> >         cpus {
> > @@ -41,6 +41,39 @@
> >                 clock-frequency = <RTCCLK_FREQ>;
> >                 clock-output-names = "rtcclk";
> >         };
> > +
> > +
> > +        pwmleds {
> > +                compatible = "pwm-leds";
> > +                heartbeat {
> > +                        label = "led1";
> > +                        max-brightness = <255>;
> > +                        active-low = <1>;
> > +                        pwms = <&pwm0 0 7812500 0>;
> > +                        linux,default-trigger = "heartbeat";
> > +                };
> > +                mtd {
> > +                        label = "led2";
> > +                        max-brightness = <255>;
> > +                        active-low = <1>;
> > +                        pwms = <&pwm0 1 7812500 0>;
> > +                        linux,default-trigger = "mtd";
> > +                };
> > +                netdev {
> > +                        label = "led3";
> > +                        max-brightness = <255>;
> > +                        active-low = <1>;
> > +                        pwms = <&pwm0 2 7812500 0>;
> > +                        linux,default-trigger = "netdev";
> > +                };
> > +                panic {
> > +                        label = "led4";
> > +                        max-brightness = <255>;
> > +                        active-low = <1>;
> > +                        pwms = <&pwm0 3 7812500 0>;
> > +                        linux,default-trigger = "panic";
> > +                };
> > +        };
> >  };
>
> I don't think it's good to add these pwmleds to the default board DTS
> file.  I realize that many upstream ARM development boards have added this
> type of configuration, but it gets in the way of reusing this DT file when
> integrators wish to have the LEDs used for different purposes.  If the
> Unleashed silkscreen had text on it describing the LEDs as having these
> specific functions, or if Unleashed was sold in a case with similar
> markings on the outside, it'd be a different story, and then a change like
> the above could make sense.
>
>
> - Paul

