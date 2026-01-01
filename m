Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAFDEED603
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jan 2026 14:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tbQfM5DTLlzPpmXeHdeErJs30VMmKyFoW2PVrFMZXDk=; b=u55Lrp4HQyxUPq
	Mx43bchqSoGv7+/RlbGmOv3eDKkqwgsdfxoDqDfDj7X+qS679bEadAbVHzNPqiRC4OIe5UPMt6LqF
	9EAVBUNFJEjHGjOHBII1G9G903Ebz6OwXDPmXH8l6drkBFoXbnhoRGPy2xAgpgFYhzZgnQdC5AjcS
	y4mL/zgVeMO3ByvUiTPPdDRzyJOCZzvpcZGiR0hli1o07ytt+LG+RhVgRQRwGa5ZA9MknZv9SwFYB
	KoXQrG4ssqBBuI2giUKFIsKa9d5tKoRMjkxjDD93jELNkUA+5EFBQhWjplJyv8yO7ncKljLEjGMut
	+YBxvEwNHbJgilcoMUSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbJor-00000007HOq-3QBh;
	Thu, 01 Jan 2026 14:38:29 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbJoo-00000007HOQ-2Jdf
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jan 2026 14:38:27 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 4F0583415D6;
	Thu, 01 Jan 2026 14:38:21 +0000 (UTC)
Date: Thu, 1 Jan 2026 22:38:10 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 1/3] clk: spacemit: prepare common ccu header
Message-ID: <20260101143810-GYC2019108@gentoo.org>
References: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
 <20251226-06-k1-clk-common-v2-1-28b59418b4df@gentoo.org>
 <17c27455-897d-4249-8206-88364230af7d@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <17c27455-897d-4249-8206-88364230af7d@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_063826_626705_EF1BA4D7 
X-CRM114-Status: GOOD (  38.39  )
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

Hi Alex,

On 18:50 Mon 29 Dec     , Alex Elder wrote:
> On 12/26/25 12:55 AM, Yixun Lan wrote:
> > In order to prepare adding clock driver for new SoC, extract common
> > ccu header file, so it can be shared by all drivers.
> 
> You are moving the definition of the SpacemiT CCU auxiliary
> device structure, plus the to_spacemit_ccu_adev() function,
> into a new header file.  
yes, and this is explaining the code which I consider not necessary,
it's more obvious to read the code..

> The reason you're doing this is
> because these two things are generic, but they're defined
> in the K1 SoC-specific header file "k1-syscon.h".  So you
> are creating a new header file for this purpose.
> 
right
> These are things you should explain here, to help orient
> reviewers and will inform anyone in the future looking at
> commit history.
I thought I've explained the goal/motivation already with above
commit message, maybe I can improve it, so how about:

In order to prepare adding clock driver for new K3 SoC, extract generic
code to a separate common ccu header file, so they are not defined
in K1 SoC-specific file, and then can be shared by all drivers.

> 
> > Also introduce a reset name macro, so it can be both used in clock
> > and reset subsystem, explicitly to make them match each other.
> 
> This should go in a separate patch, and should change the
> code to use the macro so it builds and continues to function
> with the new change place.
>
yes, I could do this in a separate patch

> However I don't understand why you think it's necessary to
> introduce the reset name macro.  Is it because you want to
> incorporate an SoC identifier in the name?
> 
I've explained here:
https://lore.kernel.org/r/20251231020951-GYA2019108@gentoo.org

It's necessary to incorporate the SoC identifier which will help
to differentiate K1 and K3 reset driver, otherwise there will be
driver name collision, lead to reset driver probe failure while
adding K3 SoC ..

> Even if this is your reason, I still don't think you need
> the macro.  I'll try to explain what I mean in the
> next patch.
> 
If you still have concerns, and we can't reach certain agreement,
then I could drop this macro in next version, leave this optimization
to future patches, I don't want main clock driver delayed by it.

I personally tend to keep the macro, but probably the naming need some
improvement..

> One more comment, below.
> 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >   include/soc/spacemit/ccu.h       | 21 +++++++++++++++++++++
> >   include/soc/spacemit/k1-syscon.h | 13 +++----------
> >   2 files changed, 24 insertions(+), 10 deletions(-)
> > 
> > diff --git a/include/soc/spacemit/ccu.h b/include/soc/spacemit/ccu.h
> > new file mode 100644
> > index 000000000000..84dcdecccc05
> > --- /dev/null
> > +++ b/include/soc/spacemit/ccu.h
> > @@ -0,0 +1,21 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +#ifndef __SOC_SPACEMIT_CCU_H__
> > +#define __SOC_SPACEMIT_CCU_H__
> > +
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/regmap.h>
> > +
> > +/* Auxiliary device used to represent a CCU reset controller */
> > +struct spacemit_ccu_adev {
> > +	struct auxiliary_device adev;
> > +	struct regmap *regmap;
> > +};
> > +
> > +static inline struct spacemit_ccu_adev *
> > +to_spacemit_ccu_adev(struct auxiliary_device *adev)
> > +{
> > +	return container_of(adev, struct spacemit_ccu_adev, adev);
> > +}
> > +
> > +#endif /* __SOC_SPACEMIT_CCU_H__ */
> > diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
> > index 354751562c55..13efa7a30853 100644
> > --- a/include/soc/spacemit/k1-syscon.h
> > +++ b/include/soc/spacemit/k1-syscon.h
> > @@ -5,17 +5,10 @@
> >   #ifndef __SOC_K1_SYSCON_H__
> >   #define __SOC_K1_SYSCON_H__
> >   
> > -/* Auxiliary device used to represent a CCU reset controller */
> > -struct spacemit_ccu_adev {
> > -	struct auxiliary_device adev;
> > -	struct regmap *regmap;
> > -};
> > +#include "ccu.h"
> >   
> > -static inline struct spacemit_ccu_adev *
> > -to_spacemit_ccu_adev(struct auxiliary_device *adev)
> > -{
> > -	return container_of(adev, struct spacemit_ccu_adev, adev);
> > -}
> > +/* Reset name macro, should match in clock and reset */
> > +#define _K_RST(_unit)			"k1-" #_unit "-reset"
> 
> The generic-sounding _K_RST() encodes "k1" in the name,
> and it shouldn't.  Also, why do you use the underscore
> prefix?
> 
want to make it slightly generic/short but still keep it local for K1 driver,
and also avoid potential collision with other drivers in kernel code..

or do you have any sugestion for better naming?
> Anyway, I'll keep reading.
> 
> 					-Alex
> 
> >   
> >   /* APBS register offset */
> >   #define APBS_PLL1_SWCR1			0x100
> > 
> 
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
