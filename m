Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD433C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 13:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rROwQy9+omquUeKiX+t2YFqww3Cn7F7IM63VmBmjkwM=; b=O+wmtnWtBnZ11i
	5yfRhFaY2Nv0yBYEEC29JmXoBz3pfedfoUxSul9ihLupq/jhbdkGu8ymf+SFqMinfcPdCNoczFOXp
	fcRSSFQO38rlJ4P7Tv1UHgK0FoO2oTi07WkwkSSYoFB0qEy5V/gJou+WsajOh1wEfG7KnSZx59/9G
	2c9zc73PErfIVJfWGGdTtNbpF+BaXB3p4/VncKep+2Rj6uI9/5bnVCBSsFtUEX28Y5Zys955fb0dE
	Mce83IO9zAksri+q1Qdl9teNV3suG1RVsTQXKtRsO8G1ZVnkn7z5MHThfCLoW0ZOp5FBR/jhyJNLL
	E0ZiKhXVltAAdFBYBYzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Wmv-00E1uZ-0W;
	Mon, 13 Nov 2023 13:15:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Wmr-00E1tn-1t
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 13:15:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9788960EDD;
	Mon, 13 Nov 2023 13:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC16CC433C8;
	Mon, 13 Nov 2023 13:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699881332;
	bh=IUou9g1eC7eRyhYqxTZ2wecJaQRhh+vOQhsR2yztLhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Za5Hz+lfHckCYadClxj9S0HmEayg0pbrmOvWPNveXQM/WkSLZXIDPV+PF8DOId7ba
	 53CZUqxcsNJl3kGjiSzF5hUxbt0ONRMxi7QL6efvnR09VEVUA5159sq2m6I/FRL1j3
	 j+sFscRcacyHwWiDba9D0GeFD+H3GgjmSoKPq0IFoBOGG24+piLxfuQVC5EypMSJcp
	 2sA8cry5c8+XiHGZy/J3S3TML4us/VSr+lWvXxfiTA/Yf0O+mAX/plKxTr62YFSPMw
	 hnL59cvZmWjmMtJMufOcp04JY8MuzNNquCr7RmvuUz38PSFwTmhuwMugmGv65z4dKI
	 sD5XqKbud0cTQ==
Date: Mon, 13 Nov 2023 21:03:11 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>,
	Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH 1/2] riscv: dts: cv1800b: add pinctrl node for cv1800b
Message-ID: <ZVIejw2O6on8QMYy@xhacker>
References: <20231113005702.2467-1-jszhang@kernel.org>
 <20231113005702.2467-2-jszhang@kernel.org>
 <58a99001-8260-4970-9fc7-25fe81e557a5@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <58a99001-8260-4970-9fc7-25fe81e557a5@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_051533_708690_67C5ACD9 
X-CRM114-Status: GOOD (  26.38  )
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

On Sun, Nov 12, 2023 at 08:51:20PM -0500, Samuel Holland wrote:
> On 2023-11-12 6:57 PM, Jisheng Zhang wrote:
> > Add the reset device tree node to cv1800b SoC reusing the
>           ^^^^^
>           I assume you mean pinctrl here?

oops copy and paste the commit msg ;) thanks
> 
> > pinctrl-single driver.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  arch/riscv/boot/dts/sophgo/cv-pinctrl.h | 19 +++++++++++++++++++
> >  arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 10 ++++++++++
> >  2 files changed, 29 insertions(+)
> >  create mode 100644 arch/riscv/boot/dts/sophgo/cv-pinctrl.h
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/cv-pinctrl.h b/arch/riscv/boot/dts/sophgo/cv-pinctrl.h
> > new file mode 100644
> > index 000000000000..ed78b6fb3142
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sophgo/cv-pinctrl.h
> 
> A couple of questions: Should this go in include/dt-bindings? And is it worth

When I cooked this series two weeks ago, I did put it in dt-binding, but
then I found commit fe49f2d776f799 ("arm64: dts: ti: Use local header for
pinctrl register values"), "These definitions were previously put in the
bindings header to avoid code duplication and to provide some context
meaning (name), but they do not fit the purpose of bindings." which is
suggested and acked by Krzysztof, so I just want to follow the style
here.


> including macros for the actual function mappings, like in the vendor source[1]?

Do you want something as the following?

#define UART0_TX	0
#define CAM_MCLK1	1
...

#define REG_UART0_TX	0x24
...

pinctrl-single,pins = <REG_UART0_TX UART0_TX>;

Other pinctl-single users just uses the register value directly, I have
no preference. But I'd like to get suggestions from DT and pinctl-single
maintainers. Hi Rob, Krzysztof, Conor, Tony, what's your opinion?

> 
> [1]:
> https://github.com/milkv-duo/duo-buildroot-sdk/blob/develop/linux_5.10/drivers/pinctrl/cvitek/cv180x_pinlist_swconfig.h
> 
> > @@ -0,0 +1,19 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * This header provides constants for pinctrl bindings for Sophgo CV* SoC.
> > + *
> > + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > + */
> > +#ifndef _DTS_RISCV_SOPHGO_CV_PINCTRL_H
> > +#define _DTS_RISCV_SOPHGO_CV_PINCTRL_H
> > +
> > +#define MUX_M0		0
> > +#define MUX_M1		1
> > +#define MUX_M2		2
> > +#define MUX_M3		3
> > +#define MUX_M4		4
> > +#define MUX_M5		5
> > +#define MUX_M6		6
> > +#define MUX_M7		7
> > +
> > +#endif
> > diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > index e04df04a91c0..7a44d8e8672b 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > @@ -6,6 +6,8 @@
> >  #include <dt-bindings/interrupt-controller/irq.h>
> >  #include <dt-bindings/reset/sophgo,cv1800b-reset.h>
> >  
> > +#include "cv-pinctrl.h"
> > +
> >  / {
> >  	compatible = "sophgo,cv1800b";
> >  	#address-cells = <1>;
> > @@ -55,6 +57,14 @@ soc {
> >  		dma-noncoherent;
> >  		ranges;
> >  
> > +		pinctrl0: pinctrl@3001000 {
> > +			compatible = "pinctrl-single";
> > +			reg = <0x3001000 0x130>;
> > +			#pinctrl-cells = <1>;
> > +			pinctrl-single,register-width = <32>;
> > +			pinctrl-single,function-mask = <0x00000007>;
> > +		};
> 
> From the vendor driver[2], it looks like this peripheral block only handles
> pinmuxing, so indeed this looks like a good use of pinctrl-single.

This is deffinitely pinctrl-single style pinmux controller ;)

> 
> [2]:
> https://github.com/milkv-duo/duo-buildroot-sdk/blob/develop/linux_5.10/drivers/pinctrl/cvitek/pinctrl-cv180x.h
> 
> > +
> >  		rst: reset-controller@3003000 {
> >  			compatible = "sophgo,cv1800b-reset";
> >  			reg = <0x03003000 0x1000>;
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
