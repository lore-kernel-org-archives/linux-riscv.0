Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93D1ECAAD2
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 08:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8XE305Ul4i4AHkt3LIHlikn70gMT24PDHgmlxA0fPCY=; b=1vtxgAr4tfNf4m
	fgzYtxN5xAG+aBMyfzxJoitl9xx5fvT+fdl0dQVfmj2KUjR/5npboAq/VqGau1xXmWXskVCN4WvQ0
	he3UfNw7ibbi1OsDellXDdN5cqzyG/tuH7icqvxC4IjQgBjejQWW4NmjMnnqZSyn7yrkgS7Z3vIDz
	6mkr9q0W6jtFsERFX007zQ5xzd+CWIRjJPP6ECJgg4VGXdFfJNVYjUwfy0KYYKYI0Ri0L6gvgvBce
	mWCMtLAH8stht2nq1qWt341Z+/NpJYBslUWEO+/M757YlHpk9xLWsVU+8Eh0xONHg15qdMQQCYrGJ
	O+AdzGNXxWSKXtIlYJ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSaMr-006KwY-8h; Mon, 29 Aug 2022 08:43:37 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSaKB-006JAQ-8W
	for linux-riscv@lists.infradead.org; Mon, 29 Aug 2022 08:40:55 +0000
Received: by mail-lf1-x134.google.com with SMTP id bq23so10163131lfb.7
        for <linux-riscv@lists.infradead.org>; Mon, 29 Aug 2022 01:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=urj00kIYa+B8ezfb71MD/Cc6TzQ7WWNtN3ZjlvZ1ObM=;
        b=KOP4VcjFaefTv2+kUQRPBBtpJXA+bI6F3Ko4FfkH9viTYTk7tFxEq/3C2WZGHxBG26
         RSi2bWS1cX7+2Q/v2sAGeDN33gOga7FzMKF1MeJxZvtdxr6chaEeGRoHHN09ECAeyj8A
         StEJbmAWiehuWuzGQZ1WIGj2wnD/pbNuXvVKabmpRpiyj7GAHuX/cawb9uH89/zCgF99
         lyznl9ejiG7JS27tcQqBhW+8x7NANMGfF3l1Y1/TksGrBs/cislSWio5RZQRAGMJZHQi
         QU3LA8dEpXYHplXHw+5UZBpm0xsN2xc3UViB4MkPEm4lt8rdNrI6p7n11FKx8N0V5M6U
         0HaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=urj00kIYa+B8ezfb71MD/Cc6TzQ7WWNtN3ZjlvZ1ObM=;
        b=v19tmX2gdigc6913svs2XIc2yhD+hlXpA1Of+07UXIx/jVjw79MzMyJjcmRDK8kWKJ
         ptRSqhq4lXweaECs4R02pBcNF39Z7Q1hX7hLjk01CVVgXQ0qOJbYy3Ozfhu9mWtWIJdi
         wIEosBIKGf//8g7bgxiH6KnaOXXrA5oAvBJ8lEzNNQjHi5uaYsn4wHZMq9UhJGDHWlGV
         Eg817ARoPcP/iXtP01SemxxIW2SBIawf7aDTtoazuYZGbi5NvdvXCRMw++ExOQyiyrp8
         6vt/WlHIdTuD1yZIEksQYS1VjcrVi/tTHcYkOgU4OBnmRFIyQZzLf+8/2uQstStuP+dW
         nV8w==
X-Gm-Message-State: ACgBeo3Pi8M4HjWB3h2gVdAM6LGd0zasBELaGnNIZ7EaZwzEo809tA/E
	gwV6/834sjvqhAcbUT1Ibkjb54o4lT/QVHyirClOVA==
X-Google-Smtp-Source: AA6agR7aArtXQO3Q+wX6yM7SOu1Q9GzgrzY5iw1Au0UhM/iP5JOv1rFez/qG9UhIFoBMPBWlMuVYSHQVgfUujtzLigM=
X-Received: by 2002:ac2:4c4f:0:b0:48b:1358:67e3 with SMTP id
 o15-20020ac24c4f000000b0048b135867e3mr5703843lfk.441.1661762449195; Mon, 29
 Aug 2022 01:40:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220829062202.3287-1-zong.li@sifive.com> <20220829062202.3287-3-zong.li@sifive.com>
 <1a0da77e-8b26-a6aa-4af2-bf852470230a@microchip.com>
In-Reply-To: <1a0da77e-8b26-a6aa-4af2-bf852470230a@microchip.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 29 Aug 2022 16:40:36 +0800
Message-ID: <CANXhq0rHnsRP=Djin53Nc5n3aYY-=ALu7=F-1Y+-U3_L_ehG6g@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: sifive: l2 cache: Rename SiFive L2 cache to
 composible cache.
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Greentime Hu <greentime.hu@sifive.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_014051_571007_5BAB59B0 
X-CRM114-Status: GOOD (  33.28  )
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

On Mon, Aug 29, 2022 at 3:05 PM <Conor.Dooley@microchip.com> wrote:
>
> Hey Zong,
>
> On 29/08/2022 07:22, Zong Li wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > From: Greentime Hu <greentime.hu@sifive.com>
> >
> > Since composible cache may be L3 cache if pL2 cache exists, we should use
> > its original name composible cache to prevent confusion.
> >
> > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
> >   drivers/soc/sifive/Kconfig           |   7 +-
> >   drivers/soc/sifive/Makefile          |   2 +-
> >   drivers/soc/sifive/sifive_ccache.c   | 221 +++++++++++++++++++++++++
> >   drivers/soc/sifive/sifive_l2_cache.c | 237 ---------------------------
>
> Where did the 16 lines go? Could you please split renames off from any
> other changes so that it is easier to see what has changed?

As your suggestion, we should separate the difference from this patch

>
> >   include/soc/sifive/sifive_ccache.h   |  16 ++
> >   include/soc/sifive/sifive_l2_cache.h |  16 --
> >   6 files changed, 242 insertions(+), 257 deletions(-)
> >   create mode 100644 drivers/soc/sifive/sifive_ccache.c
> >   delete mode 100644 drivers/soc/sifive/sifive_l2_cache.c
> >   create mode 100644 include/soc/sifive/sifive_ccache.h
> >   delete mode 100644 include/soc/sifive/sifive_l2_cache.h
> >
> > diff --git a/drivers/soc/sifive/Kconfig b/drivers/soc/sifive/Kconfig
> > index 58cf8c40d08d..3d65d2771f9a 100644
> > --- a/drivers/soc/sifive/Kconfig
> > +++ b/drivers/soc/sifive/Kconfig
> > @@ -2,9 +2,10 @@
> >
> >   if SOC_SIFIVE
> >
> > -config SIFIVE_L2
> > -       bool "Sifive L2 Cache controller"
> > +config SIFIVE_CCACHE
> > +       bool "Sifive composable Cache controller"
> > +       default y
>
> Changing this to default on is not a rename of the file..
> This should be in a different patch.

Okay, let me separate it to another patch, but I guess we could remove
it, and enable it by user. What is your perspective on it?

>
> >          help
> > -         Support for the L2 cache controller on SiFive platforms.
> > +         Support for the composable cache controller on SiFive platforms.
> >
> >   endif
> > diff --git a/drivers/soc/sifive/Makefile b/drivers/soc/sifive/Makefile
> > index b5caff77938f..1f5dc339bf82 100644
> > --- a/drivers/soc/sifive/Makefile
> > +++ b/drivers/soc/sifive/Makefile
> > @@ -1,3 +1,3 @@
> >   # SPDX-License-Identifier: GPL-2.0
> >
> > -obj-$(CONFIG_SIFIVE_L2)        += sifive_l2_cache.o
> > +obj-$(CONFIG_SIFIVE_CCACHE)    += sifive_ccache.o
> > diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
> > new file mode 100644
> > index 000000000000..46ce33db7d30
> > --- /dev/null
> > +++ b/drivers/soc/sifive/sifive_ccache.c
> > @@ -0,0 +1,221 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * SiFive composable cache controller Driver
> > + *
> > + * Copyright (C) 2018-2019 SiFive, Inc.
> > + *
> > + */
> > +#include <linux/debugfs.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/of_address.h>
> > +#include <linux/device.h>
> > +#include <asm/cacheinfo.h>
> > +#include <soc/sifive/sifive_ccache.h>
> > +
> > +#define SIFIVE_CCACHE_DIRECCFIX_LOW 0x100
> > +#define SIFIVE_CCACHE_DIRECCFIX_HIGH 0x104
> > +#define SIFIVE_CCACHE_DIRECCFIX_COUNT 0x108
> > +
> > +#define SIFIVE_CCACHE_DATECCFIX_LOW 0x140
> > +#define SIFIVE_CCACHE_DATECCFIX_HIGH 0x144
> > +#define SIFIVE_CCACHE_DATECCFIX_COUNT 0x148
> > +
> > +#define SIFIVE_CCACHE_DATECCFAIL_LOW 0x160
> > +#define SIFIVE_CCACHE_DATECCFAIL_HIGH 0x164
> > +#define SIFIVE_CCACHE_DATECCFAIL_COUNT 0x168
> > +
> > +#define SIFIVE_CCACHE_CONFIG 0x00
> > +#define SIFIVE_CCACHE_WAYENABLE 0x08
> > +#define SIFIVE_CCACHE_ECCINJECTERR 0x40
>
>  From what I can see, you've also changed these around too?
> Please generate the patch's diff so that the rename is detected & the
> diff shows only what changed in the file. The -M option is what you
> are looking for.
>
> I have a couple other comments to make about what's changed here other,
> thatn the rename but I will do so against a v2 where the diff is usable.
>

Let me sent the v2 patch, and separate the rename and diff part

> Thanks,
> Conor.
>
> > +
> > +#define SIFIVE_CCACHE_MAX_ECCINTR 3

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
