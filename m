Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39605C54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Sep 2022 07:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cfJ2qdkft472yy8aKqJVkqBWTNEA3RdfsO8SEce+Y14=; b=MYJ6gebRlHzRjz
	3oK2dSGj+2TaW8quLSq+ISg57XP7pVn9Ebo/CXWikOWUmK+YiA8J+0W8qeJIB520Xx6JsGbSfJ0iT
	k9hKTaaN7fp1Sb2ajWvg/Lba4s981B4jPDQTEQSVGXuMiBp/zQ4YG3DnbfhiWtWTGMc7hQMkSB0oW
	fDCuUCmhQAiQxulcuo/v0B4Ljl5G9dbMIex8xEMuLhOu2QUW9AZYJAgXh+A9l3J7ep/9m8JYYopjM
	+T2COyf3KC/YRTr5FmUVLN7+BMfXftWNfRaxIJ9bIesImwTzP5jwUHeMRv6M8onUaCuh+l1XOlr4E
	rBeBZyhTeydBSzsCLhMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od4dM-008hAH-9T; Tue, 27 Sep 2022 07:04:00 +0000
Received: from mail-qv1-f50.google.com ([209.85.219.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od4dJ-008h8x-3N
	for linux-riscv@lists.infradead.org; Tue, 27 Sep 2022 07:03:58 +0000
Received: by mail-qv1-f50.google.com with SMTP id i15so5726522qvp.5
        for <linux-riscv@lists.infradead.org>; Tue, 27 Sep 2022 00:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=WjCMrUOZclp06oZKHxKRyH1SW7fxD0IHiCg3879xeRI=;
        b=OmSeg594OINma6g3wDzaPQbw+/ZS055kWAw6WcP4sWmdpMlZQjCojpjDPz184Zgst/
         JHVGpBkSV49j35AdvAuWkyRpnbNtKsxbUVOdzbZTkfcnBSYuuZSyXX4fDrw5viHBlX+5
         TqEYfHlwC+nxQt2xPS960yV9pZqlIfyHZuwQJB26DOhAr7/pBTdDm7aqcpI845zDxBSk
         pSsR4LwdZ6x+TGQKkFyQI4PRCLdjJjkzt23rZccrZ6l10dthCUy2qP6kcAcjUkBaL9jy
         OXdQ+gseKjXJKlpOervgOD3ossRVFln+3rGO9Z8eFSWyp+Cuz+rTdy0o1cwdpF/iBqWY
         QY3g==
X-Gm-Message-State: ACrzQf0G2FWQp8bXl0f1NAtmNx4N+BCm6lNxIFVl8Sp8DyVokqW0dtx0
	I5wmXSV68jCUbTHOlXUuM6+CSQYxHmz/Zg==
X-Google-Smtp-Source: AMsMyM5ddiNp1gP3VwCm+2DHcJV+i39M/5PuEsNeeLteJ80FHqcRemTipSvzv8SCU8IfcU5d/RNCWw==
X-Received: by 2002:a05:6214:1c85:b0:4af:7393:3d91 with SMTP id ib5-20020a0562141c8500b004af73933d91mr6105260qvb.74.1664262235075;
        Tue, 27 Sep 2022 00:03:55 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id o15-20020ac8554f000000b0034355a352d1sm343752qtr.92.2022.09.27.00.03.54
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 00:03:54 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-3321c2a8d4cso91517387b3.5
        for <linux-riscv@lists.infradead.org>; Tue, 27 Sep 2022 00:03:54 -0700 (PDT)
X-Received: by 2002:a81:9c49:0:b0:34a:de:97b8 with SMTP id n9-20020a819c49000000b0034a00de97b8mr23958389ywa.384.1664262234085;
 Tue, 27 Sep 2022 00:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220923185605.1900083-1-conor@kernel.org> <CAMuHMdVxx7_im2wtb_Hszf2P6EuxEDjA95sJtkM9Jf9KV3xO4Q@mail.gmail.com>
 <YzKZYoaAbwtLcsSY@wendy> <689a9a66-9086-4944-ba08-d0a63d6602fd@www.fastmail.com>
 <YzKe7y7/Th4Ze1F8@wendy>
In-Reply-To: <YzKe7y7/Th4Ze1F8@wendy>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Sep 2022 09:03:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWzj_DLwyTzLbYnfaqajs-fu20ahq5VqxC_-13V9KyONA@mail.gmail.com>
Message-ID: <CAMuHMdWzj_DLwyTzLbYnfaqajs-fu20ahq5VqxC_-13V9KyONA@mail.gmail.com>
Subject: Re: [RFC 00/27] RISC-V: Convert SOC_FOO symbols to ARCH_FOO
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, kernel@esmil.dk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_000357_160337_D8206D7F 
X-CRM114-Status: GOOD (  28.40  )
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

Hi Conor,

On Tue, Sep 27, 2022 at 8:58 AM Conor Dooley <conor.dooley@microchip.com> wrote:
> On Tue, Sep 27, 2022 at 08:48:00AM +0200, Arnd Bergmann wrote:
> > On Tue, Sep 27, 2022, at 8:34 AM, Conor Dooley wrote:
> > > On Mon, Sep 26, 2022 at 11:04:58AM +0200, Geert Uytterhoeven wrote:
> > >
> > >> and (b) you take this through the RISC-V tree, you will miss all newly
> > >> introduced users in other subsystem trees.
> > >
> > > Aye, your suggested timing makes sense, but there are quite a few
> > > subsystems involved here, so maybe doing it at the very end of the
> > > window rather than asking everyone to stall until rc2 may be more
> > > feasible?
> >
> > Since there is no rush here, maybe stage this out over two releases?
> > At first, just introduce the new symbols as aliases like
> >
> > config ARCH_FOO
> >       def_bool SOC_FOO
> >
> > then change all the drivers in the following cycle after the syumbol
> > exists, and finally rename the user-visible symbols and remove the
> > old version.
> >
>
> I think I suggested that at LPC but was told not to bother, which is why
> I did a direct conversion. I'd prefer to do it your suggested way
> though & I think I will do it that way for a v1.

This way has the added advantage that "make oldconfig" keeps on working
(assumed no one skips one release ;-)

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
