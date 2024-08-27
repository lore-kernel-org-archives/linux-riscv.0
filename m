Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC2EC5472D
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 03:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kFSI0UzNdxNnLf8VFBsXBoTXeG7u3vqkqx8/u6j9YMs=; b=AmrPu786ThC1OE
	sLLQLJVoflVxpkkSQZjbpdm0cxiEvylA6hxe0E5dFqXzWQaKkwF9oLwZp3A4MNCOXmlqRC9OzAQvV
	OsnaTV7czRQK/OupHdHP2pscOUdlrSM0M+zhN4iAH81Cf1vfTDgdFn/HHjXLOjLumuWI5RXRjLl+K
	oWhENp1qlLIUeNrvYwGD6BwZIzLpr6BNKOIpb6Ca+wnpUJrbT0qOuqoTng6a1l3VOCr2pH/8hQvI3
	g20M5RIsLVjGFVwnJRMHuGhsdPyUa/E3XiA2rOi7DBqyFQflVo0jhtoHx3GmLQ2NDkU1EKaTGG7Ur
	i9HGMKKCzrX6aF+uJX+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1simUR-00000009Xam-2ypd;
	Tue, 27 Aug 2024 03:03:27 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1simUO-00000009XZm-1dMW
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 03:03:25 +0000
Date: Tue, 27 Aug 2024 03:03:20 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Inochi Amaoto <inochiama@outlook.com>
Subject: Re: [PATCH v2 3/4] riscv: dts: spacemit: add pinctrl support for K1
 SoC
Message-ID: <20240827030320.GYA208832.dlan.gentoo>
References: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
 <20240825-02-k1-pinctrl-v2-3-ddd38a345d12@gentoo.org>
 <IA1PR20MB495318D9825567E58D4FF5D4BB8B2@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB495318D9825567E58D4FF5D4BB8B2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_200324_479774_330197D5 
X-CRM114-Status: GOOD (  22.79  )
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

Hi Inochi:

On 15:55 Mon 26 Aug     , Inochi Amaoto wrote:
> On Sun, Aug 25, 2024 at 01:10:04PM GMT, Yixun Lan wrote:
> > Add pinctrl device tree data to SpacemiT's K1 SoC.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> > Note, only minimal device tree data added in this series,
> > which just try to demonstrate this pinctrl driver, but
> > more dt data can be added later, in separate patches.
> > ---
> >  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 19 +++++++++++++++++++
> >  arch/riscv/boot/dts/spacemit/k1.dtsi         |  5 +++++
> >  2 files changed, 24 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > new file mode 100644
> > index 0000000000000..38ccaad1209f5
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > @@ -0,0 +1,19 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +/*
> > + * Copyright (c) 2024 Yixun Lan <dlan@gentoo.org>
> > + */
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/pinctrl/spacemit,k1-pinctrl.h>
> > +
> 
> 
> > +&pinctrl {
> > +	uart0_2_cfg: uart0-2-cfg {
> > +		uart0-2-pins {
> > +			pinmux = <K1_PADCONF(GPIO_68, 2)>,
> > +				 <K1_PADCONF(GPIO_69, 2)>;
> > +
> > +			bias-pull-up;
> > +			drive-strength-microamp = <32>;
> > +		};
> > +	};
> > +};
> 
> No common file is needed at least for now. You can put it
> in the board dts. Also, squash this into the next patch as
> it is more related to the uart.
> 
given that there are many K1 SoC boards on the market, having
a separated pinctrl dts file makes more sense, this will maximize
data sharing.

the problem here that I haven't populated too many pinctrl
cfgs in this file, so it looks quite slim.. but the plan was to
put all pinctrl meta data here even if not used by particular board.

so, I would like to keep current struture unless I'm wrong here.

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
