Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F56BCA0EEB
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 07:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SDE+Oloc5IZWolMp9xWAHRzoCtoYukuINmJAJaQKMu8=; b=RTacv4chMjk9V1
	YB4ioOCOfNKDDNrC6wEGQ28/mzltcRnBSN925xovnvAGdquoVlLbQ+SNZ6rh+1yVP6vfHmpBkCHka
	0SXBMH7hD58tDttSFksVXQKXqJXkxv8SAmB8nJKOEJUG5NJ+aIEsWsGj24bd1SCFCut7glf/bkjp4
	np0gauppfxO9DQcaMIM4kcy2JHvnSchGhnOK7apeCCHJ+bEUyDWrxPcpHXpwZoPxI5Hiwt/aT3L+S
	VJKq5RmhyR2EAkbqxSdjosp966iGbzo5jwqBM5788ODwNRmNIdQeOJxbacvsPXqVCZcaurOUxUJj0
	3+VFx2JGPTfgoGVtUtgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwVy-00000005DRW-0tcJ;
	Fri, 30 Aug 2024 07:57:50 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwUo-00000005D7X-2yRA
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 07:56:40 +0000
Date: Fri, 30 Aug 2024 07:56:26 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Inochi Amaoto <inochiama@outlook.com>
Subject: Re: [PATCH v3 3/4] riscv: dts: spacemit: add pinctrl support for K1
 SoC
Message-ID: <20240830075626-GYA41291@gentoo>
References: <20240828-02-k1-pinctrl-v3-0-1fed6a22be98@gentoo.org>
 <20240828-02-k1-pinctrl-v3-3-1fed6a22be98@gentoo.org>
 <IA1PR20MB495369231BB1E1677228D95DBB972@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB495369231BB1E1677228D95DBB972@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_005638_797592_FB133E93 
X-CRM114-Status: GOOD (  24.28  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, linux-gpio@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <jesse@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Meng Zhang <kevin.z.m@hotmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi

On 09:36 Fri 30 Aug     , Inochi Amaoto wrote:
> On Wed, Aug 28, 2024 at 11:30:25AM GMT, Yixun Lan wrote:
> > Add pinctrl device tree data to SpacemiT's K1 SoC.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> > Note, only minimal device tree data added in this series,
> > which just try to demonstrate this pinctrl driver, but
> > more dt data can be added later, in separate patches.
> > ---
> >  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi |  19 ++++
> >  arch/riscv/boot/dts/spacemit/k1-pinctrl.h    | 161 +++++++++++++++++++++++++++
> >  arch/riscv/boot/dts/spacemit/k1.dtsi         |   5 +
> >  3 files changed, 185 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > new file mode 100644
> > index 0000000000000..1082f92753176
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > @@ -0,0 +1,19 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +/*
> > + * Copyright (c) 2024 Yixun Lan <dlan@gentoo.org>
> > + */
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include "k1-pinctrl.h"
> > +
> 
> > +&pinctrl {
> > +	uart0_2_cfg: uart0-2-cfg {
> > +		uart0-2-pins {
> > +			pinmux = <K1_PADCONF(GPIO_68, 2)>,
> > +				 <K1_PADCONF(GPIO_69, 2)>;
> > +
> > +			bias-pull-up = <0>;
> > +			drive-strength = <32>;
> > +		};
> > +	};
> > +};
> 
> "uart0_2"? Is not enough to use "uart0"?
> 
not sure if I understand your point correctly here, are you saying that
we should describe all configurations of the "uart0", as there are indeed
another two options - uart0_0, uart0_1 which using different pins, I can
add them in next version

for uart0_2 itself , I would consider it's a complete configuration

> Although I do not reject to add a new common file, it is better
> for you to squash this part into the next uart dts patch. I think
> this is more related.
> 
I can squash them into one patch but still with separated pinctrl common file,
does this sound good to you?

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
