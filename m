Return-Path: <SRS0=ifY+=4G=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF05C34026
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2020 19:26:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD77321D56
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2020 19:26:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z6/0s4vb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=carlosedp-com.20150623.gappssmtp.com header.i=@carlosedp-com.20150623.gappssmtp.com header.b="zHCslptE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD77321D56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=carlosedp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e+RwtOn33+l1tg6YPHwCwMq1/HOYComRgiseBCM7Vhs=; b=Z6/0s4vb5W0aBHIHM3Z6wJP9o
	zou4tYeL+TuXmfQnFYt7a8x05TmZGCU63LlwoCEo7MUEnPYTUtT7D20SyPJbvlqgsGjNhN+J3lWRe
	ApjxsDQcmfc6tM535gDbGM9DpSG2OY0cPIB1DmVaff6/R0RErWhWKhGHaOT1lL+ZpYWWdmRjGxrua
	+JZx4bIPVNvT7zngjXDSqoUFkiN4YkMYSOMlcdfuLZgkH0fXEGl/BMeOGV7kXhCPt+sjNc6Tce05Z
	gwbFnXAyNyMmeB++QEI/1GwQUqo9v+E1DCUpEYNgTvp8Ux05K6SdeJHq1NpuyM4vQd2ahIFnPtiSa
	v0ngiMizg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j48Vw-0004CM-Ku; Tue, 18 Feb 2020 19:26:36 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j48Vr-00046S-Ju
 for linux-riscv@lists.infradead.org; Tue, 18 Feb 2020 19:26:34 +0000
Received: by mail-ot1-x342.google.com with SMTP id i6so20672424otr.7
 for <linux-riscv@lists.infradead.org>; Tue, 18 Feb 2020 11:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=carlosedp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e+RwtOn33+l1tg6YPHwCwMq1/HOYComRgiseBCM7Vhs=;
 b=zHCslptEDm3HY/EaoK6dq8Lhi3+2YstsYn3gWwqrB2Mnxwl61HLEXkapvIfSL4XOro
 Nasy0fZzrxGqCcVNH0MVz5U8IH0g4lzFsMyk9sJyuv+YRIRKC/qu4o/CotNdV97dW2mJ
 qlYOOb5qNlPCxmZ2FyfOxXBqm866YWd1p/8S2PQIMQ+cLNe2YO41mWty3F9Mffsm0Mzz
 nVBb8u5N6diPhDovNTT99voptCzVWwdgQbFmJz/ZyCwoFiADt01+0lFJc80jMiirt+ZQ
 dSkXlTg7YilfrDPwLnxn0AhB8bPWMVFDt7BSpL1+Hn7HnIie2tfr276jhqodvtziKeiJ
 TJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e+RwtOn33+l1tg6YPHwCwMq1/HOYComRgiseBCM7Vhs=;
 b=m2GcZMghigZz2BedIK/3tBhpxEbY5RNEHRiLrO41E9Wv3qEh+jq30L+0IduG4O52Fw
 Thck3v1pPiIexWxxxXbvpnVFrPpIT3B4ln/8DNZmdbTlefuTOBemfchzICicxXh7gJYT
 IBNT63aju0oeZJWL8KgWxzNIbvuAwi8kaVca+YESqHS9ydPSV1WyjLojfX56P11aBC02
 NJFtX+8J0SOQGP0vTl93lOjlPndxAap9ffIBtWV1J0sUjqTquHHrt3iFDDgJ7Os4GS6H
 As7VIQ5T/ZzwGIwSZ8DP4HwnFxR37vZNzUvBTr5AIvguEkEZeJqLExCxmy2p3mz5YBnE
 hapw==
X-Gm-Message-State: APjAAAWmOLRfUQ8puB76CMCDNdM15/+wbNweFRlV+ApAy5Wbpqu+LKpc
 u8eGLgHYc9n15iNYUauDd43KoF8b6Hnnpw==
X-Google-Smtp-Source: APXvYqyOvAOdMMrPmgFY+P2drSXgNpoj02Q+NPqGgsDjOpQnCM3txCeVozfhMQh+8AR4BkG1P+e4fQ==
X-Received: by 2002:a9d:7083:: with SMTP id l3mr16086464otj.193.1582053990105; 
 Tue, 18 Feb 2020 11:26:30 -0800 (PST)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com.
 [209.85.167.178])
 by smtp.gmail.com with ESMTPSA id f3sm1650888oto.57.2020.02.18.11.26.29
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2020 11:26:29 -0800 (PST)
Received: by mail-oi1-f178.google.com with SMTP id a142so21268922oii.7
 for <linux-riscv@lists.infradead.org>; Tue, 18 Feb 2020 11:26:29 -0800 (PST)
X-Received: by 2002:a05:6808:b39:: with SMTP id
 t25mr2275504oij.71.1582053988808; 
 Tue, 18 Feb 2020 11:26:28 -0800 (PST)
MIME-Version: 1.0
References: <20200212103432.660256-1-damien.lemoal@wdc.com>
 <20200212103432.660256-9-damien.lemoal@wdc.com>
 <48e10b3d-12f3-a65c-8017-99c780c63040@gmail.com>
 <BYAPR04MB581671F46D3FE67FD3C8B2B7E7140@BYAPR04MB5816.namprd04.prod.outlook.com>
 <bd74c841-2447-2f11-f924-a501230b3927@gmail.com>
 <BYAPR04MB5816ED294439828E562EB085E7140@BYAPR04MB5816.namprd04.prod.outlook.com>
 <CADnnUqe3AbTStJg9LS4qupH-OnBDGjuEFbnX8EXW8MUr4kwoGQ@mail.gmail.com>
 <19e78a77-4b7f-a057-eb6e-7384f3fc67c1@gmail.com>
 <CADnnUqfSq5sNXMQLktU0R_XLvYrf00nqMG5UPkTwaeL-Cy1m_A@mail.gmail.com>
 <8108cb8e-a909-24b0-f1c4-24a5bebf4e65@gmail.com>
In-Reply-To: <8108cb8e-a909-24b0-f1c4-24a5bebf4e65@gmail.com>
From: Carlos Eduardo de Paula <me@carlosedp.com>
Date: Tue, 18 Feb 2020 16:26:17 -0300
X-Gmail-Original-Message-ID: <CADnnUqenadntSrngNGjnu40inxZWK1Nm3T64BnyY114hEwC_Og@mail.gmail.com>
Message-ID: <CADnnUqenadntSrngNGjnu40inxZWK1Nm3T64BnyY114hEwC_Og@mail.gmail.com>
Subject: Re: [PATCH 08/10] riscv: Add Kendryte K210 device tree
To: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_112633_341339_22282295 
X-CRM114-Status: GOOD (  17.69  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "Wladimir J. van der Laan" <laanwj@gmail.com>, Anup Patel <Anup.Patel@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 18, 2020 at 2:48 PM Sean Anderson <seanga2@gmail.com> wrote:
>
> So the LCD connector is supposed to be for a ST7789V controller, but
> there doesn't appear to be a driver in Linux for it. I don't have an
> appropriate LCD screen, so I will not be able to write a driver.
>

Actually there is a driver and config DRM_PANEL_SITRONIX_ST7789V, in
gpu/drm/panel/panel-sitronix-st7789v.c and also FB_TFT_ST7789V and
CONFIG_FB_TFT_ST7789V with the driver a in
staging/fbtft/fb_st7789v.c. Might be easier :)

Weird that the Kendryte SDK refers to the LCD as NT35310
(https://github.com/kendryte/kendryte-standalone-demo/tree/develop/lcd).

> >>>
> >>> Might help out adding support to it.
> >>
> >> Hmm, maybe. I've been wrangling a bit trying to get the SD card slot to
> >> work.
> >>
> >> --Sean
> >
> > Yes, I started looking at the SD card but had no clue on what needs to
> > be done regarding GPIO - FPIO - SPI pre-reqs for it.
>
> There is no need for GPIOs. The datasheet shows SPI0 as hooked up to the
> SD card, but the default pinconf doesn't have it hooked up. In addition,
> the dedicated SPI0 data lines are already connected to the LCD. For
> these reasons, I decided to hook up SPI1 to the card slot. I have some
> preliminary patches to add FPIOA support to u-boot. If you are
> interested in my current progress, it is availible from [1]. This is not
> a "stable" branch though, and I frequently rebase/force-push to it.
>
> [1] https://github.com/Forty-Bot/u-boot/tree/maix_v6
>

Nice, gonna take a look at it.

> > Wladimir (don't know his email) started playing with UART1 interface
> > to the 8285 module to allow WiFi communication. We thought about
> > having a TUN/TAP interface over it to bring the TCP/IP stack up.
> > https://twitter.com/orionwl/status/1229442145628585990
>
> Nice. I don't think too many raw register pokes should be needed,
> because you are just using a uart to communicate...
>
> --Sean
>


-- 
________________________________________
Carlos Eduardo de Paula
me@carlosedp.com
http://carlosedp.com
http://twitter.com/carlosedp
Linkedin
________________________________________

