Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA48CA5FB1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 08:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ktLFE4BStodXRrIEuhvv3jFvfDE/aNOZhT27FbQ/1NI=; b=DzN5a3LVfibU5I
	+YHrVQNqfAzarh5SnQVoZHTU+f4Pie2R6cLn7ilB4+CQbQFID6KrOUS6rYOhrkWbG+/D5+6CmxnLD
	8tcPATijbsuxadDFrU2KFROVtbWdxb9wid/MHk9uWz42/ITDXv8PO5NPTVAD4P8UDIhxeNQwDLqA9
	wigUJuQLWWrQNRy/kaJ99d6yelD1DIVqHixEtUEgm2f/WTpyqMc5dzmn/AfueSg1IOtp979H1m0+H
	E3jlZ2RG5Xc/94Rlw+1JODpxqYNC4osZqs9mPEV9DpOavlHnDlDRqSYq4FvJnMNlqRZmvAPHgB5fu
	c8PlD4UfsXCLquW6LUZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpLU-00000005Nuz-1qLc;
	Wed, 30 Sep 2026 08:07:20 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpLQ-00000005Nu4-2Gf6
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 08:07:18 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-4a003bd18e5so16688885e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 01:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790755634; x=1791360434; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R9Z12L+fXWCFDTbxFKxbwYJjVd8WMY/ksKqgATnsUOk=;
        b=Z2Ky7qHPNWhZyQdCWOYrs8UeS6mee0B3FJ85c9al5kSIjm90jiIj6g4z45xaQasitJ
         QhyiMnxbKT4L03nVvO8+f5rqP0gbLznDTlEUWlxrotUWMEk03r4M4aL41hUg/67WfRj2
         H9HRzYfhEas550GVnWuUzrVlg2P/yPyrSPnQ/wqnMyCocfNnPfanTzX1PVWnLR6iF5OR
         uhaH9g6ovQGGml7tIOZqitYPHrUSu2+BMyY7nZYEXIlZy9Iq/qIWQpL2aqZVw8AdajMd
         tEUq3IB9dkek1gLMaX7+FmXDksRo0Vkg7UZI87xTKhYz7vjEyDT9ioeZmnjsbmKkGQz9
         DhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790755634; x=1791360434;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R9Z12L+fXWCFDTbxFKxbwYJjVd8WMY/ksKqgATnsUOk=;
        b=TJKK4WyXY52Pca1MwyBIlfSheH3oeyB2PGBnLrPMLBltfnO5N6xDJRt+uyn8mr1Mlo
         jg9EV9XZThZzForZuGzwThgV2Lg/qZMFbeU0FkHnRdqk9eFZFuN/eRWoQZorkvuXpRBu
         t8kfJM0ns9Z++H9OUtFyh7hzYM0wrdWOQKhS612nr0820ZJui/cU20mk5mlBSQMOt073
         Ykr7nuwiQebpH409uEUt2WkP4pWRHnicpPAO+ptssn/zECDdoaNvWq9x/OP2uiSJObe+
         mYC2nDqaW+FCUmz0fBHI2JHwyS9HNvh/GXqt1ORpGdq/jT+SgT9VHj277yimr2iV6ZNW
         jvAA==
X-Forwarded-Encrypted: i=1; AKwUvBzFFALO9zKSeq0HG28kYVbG+ZuUb5Vhuw37vtBocDNPjEqoP+/3a/JajFfDr1rdEDwzRCYuFiMAJZuSgg==@lists.infradead.org
X-Gm-Message-State: AFuF++lvSM7l6Hmt6K7iIJ6guSSN0NafyX0sUEXHcVhbNX3envr3Y2ps
	vPH3Gl8sy5rjVjonA0Jnvz5dupW+uyVzP/2RbKNQzX1sWsmJ4fPIT55mefHM6yWgP6E=
X-Gm-Gg: AYBFou3NGUM5hLOG38tDtrXl2DHDuh222kPBEF88kYl/XHbYYEu9pvQN6IKYbW+M48r
	Y3FowpKnsHu3IMQC5yeyHmC/PM2S8w0cKgjnmAPaUHfY2e/xwnsjUNE1ijueWkqetNlhXQsUPtQ
	5cen4uflM+SsTkV9GwJgb/IZsTufmXr+mhAU9Htq+s5jjcP60+9XcvKNRrP7wfZIeWJgECkGNHe
	mkDfC1Fiy2ueFyQZtoAYEw1z2Lt24NxS6ScNIM8HpAjGZdmI/Ant4WyAEb7rGRyRHoWZ1FRrSeV
	cqkGqnciteZhTPKfN7w6yAsRkS50juLa4h2oLc31/jkhiuB32kEfJ7RqaYJ4eEKQOt2Lv8RYora
	GpltuJ8X+jLdFxMpoB0qNGa1BUMtjt5JCARaMo1IsOKKVOssHcHyU/tdwge17oQAGCxDXAj7pYu
	zwVhm4qOUa3JPhKqoSM1gLnRnoH3fKPFaTy9Db5ZShTy7nfw7EzBLxOyidt+t9b4sgxFh3eG6jk
	Tv/XKlqizglhLMHDGlMsnn6ynkU
X-Received: by 2002:a05:600c:3486:b0:49e:7c7e:274c with SMTP id 5b1f17b1804b1-4a01afec552mr8494615e9.14.1790755634409;
        Wed, 30 Sep 2026 01:07:14 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01751613dsm33464255e9.3.2026.09.30.01.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:07:13 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Michael Turquette
 <mturquette@baylibre.com>, Brian Masney <bmasney@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel
 <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Kees
 Cook <kees@kernel.org>, "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Richard
 Cochran <richardcochran@gmail.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Hal Feng
 <hal.feng@starfivetech.com>
Subject: Re: [PATCH v4 03/22] clk: starfive: Rename file name "jh71x0" to
 "common"
In-Reply-To: <ZQ4PR01MB12022FD5940DAA1AC1279B8FF28D2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260920120044.194901-1-changhuang.liang@starfivetech.com>
 <20260920120044.194901-4-changhuang.liang@starfivetech.com>
 <1jqzih73ob.fsf@starbuckisacylon.baylibre.com>
 <ZQ4PR01MB12022FD5940DAA1AC1279B8FF28D2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Date: Wed, 30 Sep 2026 10:07:11 +0200
Message-ID: <1jtsn72mds.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_010716_626415_8D32A69C 
X-CRM114-Status: GOOD (  27.70  )
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

On lun. 28 sept. 2026 at 11:10, Changhuang Liang <changhuang.liang@starfivetech.com> wrote:

> Hi, Jerome
>
> Thanks for the review.
>
>> On dim. 20 sept. 2026 at 05:00, Changhuang Liang
>> <changhuang.liang@starfivetech.com> wrote:
>> 
>> > From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
>> >
>> > StarFive JHB100 shares a similar clock and reset design with JH7110.
>> > To facilitate the reuse of the file and its functionalities, files
>> > containing the "jh71x0" naming convention are renamed to use the
>> > "common" wording.
>> 
>> Is this really necessary ? Rename are generally not recommended.
>> Do we really care if your new soc use something named after the older one ?
>> 
>> You are naming it common now but how long is it going to stay "common" ?
>> If your next SoC does not use this anymore it won't be common for long ...
>> 
>
> Okay, I will drop the current PATCH 1/2/3/4 and directly reuse the current JH71x0-related interfaces.
>

Please make sure your series applies on clk-next next time around.
This one failed to apply when it was sent.

>> >
>> > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
>> > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
>> > Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>> > ---
>> >  drivers/clk/starfive/Kconfig                              | 8
>> ++++----
>> >  drivers/clk/starfive/Makefile                             | 2 +-
>> >  .../{clk-starfive-jh71x0.c => clk-starfive-common.c}      | 4 ++--
>> >  .../{clk-starfive-jh71x0.h => clk-starfive-common.h}      | 4 ++--
>> >  drivers/clk/starfive/clk-starfive-jh7100-audio.c          | 2 +-
>> >  drivers/clk/starfive/clk-starfive-jh7100.c                | 2 +-
>> >  drivers/clk/starfive/clk-starfive-jh7110.h                | 2 +-
>> >  7 files changed, 12 insertions(+), 12 deletions(-)  rename
>> > drivers/clk/starfive/{clk-starfive-jh71x0.c => clk-starfive-common.c}
>> > (99%)  rename drivers/clk/starfive/{clk-starfive-jh71x0.h =>
>> > clk-starfive-common.h} (98%)
>> >
>> > diff --git a/drivers/clk/starfive/Kconfig
>> > b/drivers/clk/starfive/Kconfig index bd29358ffeec..ff8eace36e64 100644
>> > --- a/drivers/clk/starfive/Kconfig
>> > +++ b/drivers/clk/starfive/Kconfig
>> > @@ -1,12 +1,12 @@
>> >  # SPDX-License-Identifier: GPL-2.0
>> >
>> > -config CLK_STARFIVE_JH71X0
>> > +config CLK_STARFIVE_COMMON
>> >  	bool
>> >
>> >  config CLK_STARFIVE_JH7100
>> >  	bool "StarFive JH7100 clock support"
>> >  	depends on ARCH_STARFIVE || COMPILE_TEST
>> > -	select CLK_STARFIVE_JH71X0
>> > +	select CLK_STARFIVE_COMMON
>> >  	default ARCH_STARFIVE
>> >  	help
>> >  	  Say yes here to support the clock controller on the StarFive
>> > JH7100 @@ -15,7 +15,7 @@ config CLK_STARFIVE_JH7100  config
>> > CLK_STARFIVE_JH7100_AUDIO
>> >  	tristate "StarFive JH7100 audio clock support"
>> >  	depends on CLK_STARFIVE_JH7100
>> > -	select CLK_STARFIVE_JH71X0
>> > +	select CLK_STARFIVE_COMMON
>> >  	default m if ARCH_STARFIVE
>> >  	help
>> >  	  Say Y or M here to support the audio clocks on the StarFive JH7100
>> > @@ -33,7 +33,7 @@ config CLK_STARFIVE_JH7110_SYS
>> >  	bool "StarFive JH7110 system clock support"
>> >  	depends on ARCH_STARFIVE || COMPILE_TEST
>> >  	select AUXILIARY_BUS
>> > -	select CLK_STARFIVE_JH71X0
>> > +	select CLK_STARFIVE_COMMON
>> >  	select RESET_STARFIVE_JH7110 if RESET_CONTROLLER
>> >  	select CLK_STARFIVE_JH7110_PLL
>> >  	default ARCH_STARFIVE
>> > diff --git a/drivers/clk/starfive/Makefile
>> > b/drivers/clk/starfive/Makefile index 199ac0f37a2f..012f7ee83f8e
>> > 100644
>> > --- a/drivers/clk/starfive/Makefile
>> > +++ b/drivers/clk/starfive/Makefile
>> > @@ -1,5 +1,5 @@
>> >  # SPDX-License-Identifier: GPL-2.0
>> > -obj-$(CONFIG_CLK_STARFIVE_JH71X0)	+= clk-starfive-jh71x0.o
>> > +obj-$(CONFIG_CLK_STARFIVE_COMMON)	+= clk-starfive-common.o
>> >
>> >  obj-$(CONFIG_CLK_STARFIVE_JH7100)	+= clk-starfive-jh7100.o
>> >  obj-$(CONFIG_CLK_STARFIVE_JH7100_AUDIO)	+=
>> clk-starfive-jh7100-audio.o
>> > diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c
>> > b/drivers/clk/starfive/clk-starfive-common.c
>> > similarity index 99%
>> > rename from drivers/clk/starfive/clk-starfive-jh71x0.c
>> > rename to drivers/clk/starfive/clk-starfive-common.c
>> > index 80e9157347eb..4aecb65e9fd7 100644
>> > --- a/drivers/clk/starfive/clk-starfive-jh71x0.c
>> > +++ b/drivers/clk/starfive/clk-starfive-common.c
>> > @@ -1,6 +1,6 @@
>> >  // SPDX-License-Identifier: GPL-2.0
>> >  /*
>> > - * StarFive JH71X0 Clock Generator Driver
>> > + * StarFive Clock Generator Driver
>> >   *
>> >   * Copyright (C) 2021-2022 Emil Renner Berthing <kernel@esmil.dk>
>> >   */
>> > @@ -10,7 +10,7 @@
>> >  #include <linux/device.h>
>> >  #include <linux/io.h>
>> >
>> > -#include "clk-starfive-jh71x0.h"
>> > +#include "clk-starfive-common.h"
>> >
>> >  static struct jh71x0_clk *jh71x0_clk_from(struct clk_hw *hw)  { diff
>> > --git a/drivers/clk/starfive/clk-starfive-jh71x0.h
>> > b/drivers/clk/starfive/clk-starfive-common.h
>> > similarity index 98%
>> > rename from drivers/clk/starfive/clk-starfive-jh71x0.h
>> > rename to drivers/clk/starfive/clk-starfive-common.h
>> > index 9d5dec1d5cd1..f634c62c196a 100644
>> > --- a/drivers/clk/starfive/clk-starfive-jh71x0.h
>> > +++ b/drivers/clk/starfive/clk-starfive-common.h
>> > @@ -1,6 +1,6 @@
>> >  /* SPDX-License-Identifier: GPL-2.0 */ -#ifndef
>> > __CLK_STARFIVE_JH71X0_H -#define __CLK_STARFIVE_JH71X0_H
>> > +#ifndef __CLK_STARFIVE_COMMON_H
>> > +#define __CLK_STARFIVE_COMMON_H
>> >
>> >  #include <linux/bits.h>
>> >  #include <linux/clk-provider.h>
>> > diff --git a/drivers/clk/starfive/clk-starfive-jh7100-audio.c
>> > b/drivers/clk/starfive/clk-starfive-jh7100-audio.c
>> > index de1cf717e391..0e363b971e9d 100644
>> > --- a/drivers/clk/starfive/clk-starfive-jh7100-audio.c
>> > +++ b/drivers/clk/starfive/clk-starfive-jh7100-audio.c
>> > @@ -14,7 +14,7 @@
>> >
>> >  #include <dt-bindings/clock/starfive-jh7100-audio.h>
>> >
>> > -#include "clk-starfive-jh71x0.h"
>> > +#include "clk-starfive-common.h"
>> >
>> >  /* external clocks */
>> >  #define JH7100_AUDCLK_AUDIO_SRC			(JH7100_AUDCLK_END
>> + 0)
>> > diff --git a/drivers/clk/starfive/clk-starfive-jh7100.c
>> > b/drivers/clk/starfive/clk-starfive-jh7100.c
>> > index 761e46ed0ffd..ca81ccb5af94 100644
>> > --- a/drivers/clk/starfive/clk-starfive-jh7100.c
>> > +++ b/drivers/clk/starfive/clk-starfive-jh7100.c
>> > @@ -14,7 +14,7 @@
>> >
>> >  #include <dt-bindings/clock/starfive-jh7100.h>
>> >
>> > -#include "clk-starfive-jh71x0.h"
>> > +#include "clk-starfive-common.h"
>> >
>> >  /* external clocks */
>> >  #define JH7100_CLK_OSC_SYS		(JH7100_CLK_END + 0)
>> > diff --git a/drivers/clk/starfive/clk-starfive-jh7110.h
>> > b/drivers/clk/starfive/clk-starfive-jh7110.h
>> > index 0659adae4d76..6b1bdf860f00 100644
>> > --- a/drivers/clk/starfive/clk-starfive-jh7110.h
>> > +++ b/drivers/clk/starfive/clk-starfive-jh7110.h
>> > @@ -2,7 +2,7 @@
>> >  #ifndef __CLK_STARFIVE_JH7110_H
>> >  #define __CLK_STARFIVE_JH7110_H
>> >
>> > -#include "clk-starfive-jh71x0.h"
>> > +#include "clk-starfive-common.h"
>> >
>> >  /* top clocks of ISP/VOUT domain from JH7110 SYSCRG */  struct
>> > jh7110_top_sysclk {
>> > --
>> > 2.25.1
>> >
>> >
>> > _______________________________________________
>> > linux-riscv mailing list
>> > linux-riscv@lists.infradead.org
>> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>> 
>> --
>
> Best Regards
> Changhuang
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
Jerome

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
