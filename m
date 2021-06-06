Return-Path: <SRS0=9QI1=LA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6AEC47096
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 15:39:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 955E361426
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 15:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 955E361426
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gsix255FERQMbVIa44loKJemL24NrgQh4dDhXI8GMcw=; b=UUquhGnFxdPRuM
	/rxKoBuDUebuk0EYAR8nXa4mTszLFzl+YXaAsOIBojSrkbYuGhw7Cn+5Mp3XkZjzQV65CKAyNRmOF
	1alLX2WGUlLo8bZsTXSYmmx8CYAfKM7KSc151gva2+qw2LJ9FHnd4JswgYina53wK2wru5pwlsq5r
	mULuqjpo6bq+SyoNqjXPeqnE4Ykh28sP+0JrWS7gvXRevVuDKZuMQLBuVxKBZMgR8fOVhE2RI9uKT
	XOYqLzGggtDfJ0njjw/TfgUPpJLtRanSkaLJFti45vIapQTXz1/VkUmPB7RUk36PuUd5ynRmoxzWV
	+w5DCih3/wrdA+3qHNDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpurv-000Uaj-F7; Sun, 06 Jun 2021 15:39:19 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpurt-000UaE-5L
 for linux-riscv@lists.infradead.org; Sun, 06 Jun 2021 15:39:18 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso8484893wmj.2
 for <linux-riscv@lists.infradead.org>; Sun, 06 Jun 2021 08:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tXVK6dmsPKFlxVGsnju6Gmzr7jy3YZ4iKuNuKJOxdWw=;
 b=JOvuaADx3aNM3K94Mgv7uoshwLFoOBBxt+pdTzvdBBN2//CSdNpWIIsYmwg2dvQ/Ex
 DGIHYa91NfPNIMRutxQawEBgMJJ/Uiuwzvw3uywKGw6woRT6pn/3Ahn3P+Z6T2TeyFQO
 Ppyjx7DAmMPpsHvwz3sLNMoK2NaCu6+ORaml+9s1IDyjT4rT3TgAfZSFwYqAdqMSbYYN
 2+9Vsh/5639do0hlzWgfzGD/uoRDjLSKqZVFXUJZ3DA0qRRoPknbtrvawyODg9NF6xku
 RUcE7lVj4u1RpcIkFNZKfxGfkHcXvEi0608OrAGbYUH6zONN/xtob1pE65sPVDCkuZn7
 t3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tXVK6dmsPKFlxVGsnju6Gmzr7jy3YZ4iKuNuKJOxdWw=;
 b=cxA2iIs6g/YrV6YvEGGQx/R/twKcsdKsIhXwPTMPt4QjSlOveUNDVlzabYREnPRl1w
 PZP9qmtRcsN3Nj3PkmwZPQb28O13r22UN4iZcgsGT22+YNUlCZNKXjnBAeE9qPHp4wtY
 AH+24Z3U7ZZrconHJ63dKUQ3ylkohpFrwQ3vV2doQRt9pmxqtg1gaDv9LGbDvdVlEmTw
 BjqNTzo+GE2LfIvvA7mkuCMlbZVGeQMTu11yvF+sTolkkXKDbAUgCE+yRyI6EM+921oZ
 dNVghhD6/aSpPHOBDABzwWQjO8s/L40iwIdSyj0FtcF43ZBBn5aLSSqdyTq21yOCixZn
 6e+A==
X-Gm-Message-State: AOAM530nr1nBQB1nZUFMpfulA5tlRxGoN+yd53sOr+ikHhngf0hPgp06
 tdeQqEokOlF98tzbve/gF2Q=
X-Google-Smtp-Source: ABdhPJzk5jC8DWCQBqX+x/UEE4Ml4TK5R3j6VYfcijR+eC1lozRFL3EB2lxSBndsOMBtKoSQPka6UA==
X-Received: by 2002:a7b:c750:: with SMTP id w16mr11781738wmk.69.1622993953117; 
 Sun, 06 Jun 2021 08:39:13 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-17-133.cable.triera.net.
 [86.58.17.133])
 by smtp.gmail.com with ESMTPSA id 3sm14203074wmi.7.2021.06.06.08.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jun 2021 08:39:12 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>, Guo Ren <guoren@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Arnd Bergmann <arnd@arndb.de>, wens@csie.org, maxime@cerno.tech,
 Drew Fustini <drew@beagleboard.org>, liush@allwinnertech.com,
 Wei Wu =?utf-8?B?KOWQtOS8nyk=?= <lazyparser@gmail.com>, wefu@redhat.com,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, linux-sunxi@lists.linux.dev,
 Maxime Ripard <mripard@kernel.org>, Corentin Labbe <clabbe@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Icenowy Zheng <icenowy@aosc.io>,
 LABBE Corentin <clabbe.montjoie@gmail.com>, Michael Walle <michael@walle.cc>,
 Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [RFC PATCH v2 11/11] riscv: soc: Allwinner D1 GMAC driver only
 for temp use
Date: Sun, 06 Jun 2021 17:39:09 +0200
Message-ID: <49182865.cm8dGOVcTj@jernej-laptop>
In-Reply-To: <CAJF2gTQgaJFW9knuVmW8J8zMAt_Gtq3KJ9gsGKg6=xLBuq0=uA@mail.gmail.com>
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
 <20210606115027.5c715e64@slackpad.fritz.box>
 <CAJF2gTQgaJFW9knuVmW8J8zMAt_Gtq3KJ9gsGKg6=xLBuq0=uA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_083917_244165_7B8D8C24 
X-CRM114-Status: GOOD (  26.72  )
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

Hi!

Dne nedelja, 06. junij 2021 ob 17:32:22 CEST je Guo Ren napisal(a):
>  ,
> 
> On Sun, Jun 6, 2021 at 6:50 PM Andre Przywara <andre.przywara@arm.com> 
wrote:
> > On Sun,  6 Jun 2021 09:04:09 +0000
> > guoren@kernel.org wrote:
> > 
> > Hi,
> > 
> > > From: liush <liush@allwinnertech.com>
> > > 
> > > This is a temporary driver, only guaranteed to work on allwinner
> > > D1. In order to ensure the developer's demand for network usage.
> > 
> > That looks like some Allwinner BSP driver, please don't endorse code
> > of this quality (just look at all that commented code and the attempt
> > for compile-time configuration).
> > 
> > > It only could work at 1Gps mode.
> > > 
> > > The correct gmac driver should follow (I guess)
> > > drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> > > 
> > > If anyone is familiar with it and can help porting, I would be
> > > very grateful.
> > 
> > Have you tried compiling and using that driver? Ideally it should just
> > work, Linux drivers are meant to be portable, by design. And the driver
> > is already enabled by COMPILE_TEST.
> 
> It still needs some work with dwmac-sun8i.c glue layer, eg:
> tx/rx-delay setting, clk & pinmux drivers.
> 
> The patch is just to help people using D1 with GMAC temporarily with
> network function.

It should be marked "DO NOT MERGE" or similar then.

Best regards,
Jernej

> 
> > But I guess you need some extra care to make the non-coherent DMA work?
> > I haven't looked in detail, but are those new CMOs hooked into the
> > generic DMA framework?
> 
> Yes, we have the simliar principle with arm & csky for non-coherent:
>  - Using PTE attributes setting Using PTE attributes to support
> _PAGE_IOREMAP & _PAGE_WRITECOMBINE
>  - Using CMO instructions deal SYNC_DMA_FOR_CPU/DEVICE.
> 
> > Cheers,
> > Andre
> > 
> > > Signed-off-by: Liu Shaohua <liush@allwinnertech.com>
> > > Tested-by: Guo Ren <guoren@kernel.org>
> > > Signed-off-by: Guo Ren <guoren@kernel.org>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Corentin Labbe <clabbe@baylibre.com>
> > > Cc: Samuel Holland <samuel@sholland.org>
> > > Cc: Icenowy Zheng <icenowy@aosc.io>
> > > Cc: LABBE Corentin <clabbe.montjoie@gmail.com>
> > > Cc: Michael Walle <michael@walle.cc>
> > > Cc: Chen-Yu Tsai <wens@csie.org>
> > > Cc: Maxime Ripard <maxime@cerno.tech>
> > > Cc: Wei Fu <wefu@redhat.com>
> > > Cc: Wei Wu <lazyparser@gmail.com>
> > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
