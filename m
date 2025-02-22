Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CF9C021B2
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Feb 2025 09:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FwZQqf9iQDw5qPi2iSrIx/+TL3eSHoZyGEk40VMMlDw=; b=xGnxM+d1CL0d1g
	LOeRGkHov8wEJW1QpoY/3oidLLgF7J4coVVpxLMPsja1cBx9F7Kpdhlfo3kq5SS8cGRp07j62EkKk
	V8rQqt3NKK/61lqvFav1Of3QrEyLrssLhoCAzUMSw5MU1sEarUWM2MHNsVfb1ZH62PkHQHBtmCvwD
	gWo3PpMDOgwVMQIvvhrIzPaDx5GC0cdguQqYVZnxuSfP6Vtd+jLAuy60FjTjlxhzr+c/Nd170svfJ
	MoZuSzR2xysQiR0Q7hLyrXfOfjP1bxiGUtk2O/7WwiLAWtwbA/NHklT07Z4GaMZpiG9jWApMgK+C+
	WPyUXrGQR/OiNA2VuozQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlm0g-00000007kjh-0PzG;
	Sat, 22 Feb 2025 09:41:22 +0000
Received: from bayard.4d2.org ([5.78.89.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlm0c-00000007kjK-31QM
	for linux-riscv@lists.infradead.org;
	Sat, 22 Feb 2025 09:41:20 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id BCC8D122FE22;
	Sat, 22 Feb 2025 01:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1740217272; bh=DJC8m9RjcUzmFrWWZuFi8uTLafSc+0ybR8NGmMT4ltU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MTmNgGFKrF0rvg4QXmmV19OqkJVyWfyWDRyZWlpxDA6uFgBDQRsh5EQBzVy3cBc/r
	 LFszsOKShCd6gP4NLii3bpQT0rtipIuw0HvQ1pEA/dVshKV2KARxM7ARIxg6/7YUft
	 0UWP7172G67OqFIf7UGGXJY1EfOQRbRsdHTRlM0hV90WJXhBPp3e4VskBMegQTGJaK
	 8ik2qQYHWXMbmNBpiDgMuvKQs9+w0cDz2RFsPi7N6H8jr4pkL/oENH/w5O8grpRhaN
	 UBxrNKeCcHyTa9NVKdkLjjBWD6WM4kXQqeZZxWhrnORIiW6P+JAs9NQwOJiz5YYOcC
	 EMXwp4zu67WtQ==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LY7T0GXny8v4; Sat, 22 Feb 2025 01:40:59 -0800 (PST)
Received: from ketchup (unknown [183.217.80.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 5985B122FE21;
	Sat, 22 Feb 2025 01:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1740217259; bh=DJC8m9RjcUzmFrWWZuFi8uTLafSc+0ybR8NGmMT4ltU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fsrD8CFhRg9q1QR3OxrQIQHy3dE0MqTVoVYAvG3TGvs3NnmAxV9kTeBrX41ZVaBtk
	 muxP1MVHiyiU0yciKzLJYVBEOE5Gj7qlSt85kYEf+dLglu0jow5R2YIU2jBMli0Idn
	 7NVEOebBcciUrFG8/dgpB4bXshEJ+w1dd/xFlTrp1CxNsm72OEp7lW7h3ffMD/HRpB
	 lv0EK5fRodtDs+leawlaqoCzkzXgx/o9sZlQngL5GUbTUPqenE5xFLBptADrbt8vRp
	 +5Ek0voMUxAaNt0XZCptEvIcwtT2GEEBWcB4u14Ced7NxYvWHrnq9SvIa5p20iY4S7
	 k4vGgMWkv0VSQ==
Date: Sat, 22 Feb 2025 09:40:47 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Alex Elder <elder@riscstar.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Guodong Xu <guodong@riscstar.com>
Subject: Re: [PATCH v4 3/4] clk: spacemit: Add clock support for Spacemit K1
 SoC
Message-ID: <Z7mbn_de-KV-yqQP@ketchup>
References: <20250103215636.19967-2-heylenay@4d2.org>
 <20250103215636.19967-5-heylenay@4d2.org>
 <f8b30551-25e7-4626-8c03-6d8807041d8a@riscstar.com>
 <Z7HNLq3DgJj7WKGI@ketchup>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z7HNLq3DgJj7WKGI@ketchup>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_014119_109209_18B067DB 
X-CRM114-Status: GOOD (  37.29  )
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

Before answering the reply, I'd like to share some information on these
unconfirmed questions.

On Sun, Feb 16, 2025 at 11:34:06AM +0000, Haylen Chu wrote:
> On Thu, Feb 13, 2025 at 10:04:10PM -0600, Alex Elder wrote:
> > On 1/3/25 3:56 PM, Haylen Chu wrote:
> > > diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> > > new file mode 100644
> > > index 000000000000..6fb0a12ec261
> > > --- /dev/null
> > > +++ b/drivers/clk/spacemit/ccu-k1.c

...

> The next clock is weird, and it's the only one of its kind.  It is not
> > represented in the clock tree diagram. It is a "factor 1" clock (so it
> > just passes the parent's rate through), and has no gate.  Do you know
> > why it's defined?  It is used only as one of the MPMU parent clocks.
> > Why isn't just the pll1_d7 clock used in its place?
> 
> It is represented in the diagram. The photo version of the diagram seems
> hard to search so I will ask the vendor to publish a PDF version if
> possible.
> 
> As the definition involves no hardware bits, I guess it's actually an
> alias listed to keep the tree structure in similar form. Will confirm
> this with the vendor.

Yes, it's confirmed as a placeholder.

> 
> > > +static CCU_FACTOR_DEFINE(pll1_d7_351p08, "pll1_d7_351p08", CCU_PARENT_HW(pll1_d7),
> > > +			 1, 1);
> > > +
> > > +static CCU_GATE_DEFINE(pll1_d6_409p6, "pll1_d6_409p6", CCU_PARENT_HW(pll1_d6),
> > > +		       MPMU_ACGR,
> > > +		       BIT(0), BIT(0), 0, 0);
> > > +static CCU_GATE_FACTOR_DEFINE(pll1_d12_204p8, "pll1_d12_204p8", CCU_PARENT_HW(pll1_d6),
> > > +			      MPMU_ACGR,
> > > +			      BIT(5), BIT(5), 0, 2, 1, 0);
> > > +
> > > +static CCU_GATE_DEFINE(pll1_d5_491p52, "pll1_d5_491p52", CCU_PARENT_HW(pll1_d5),
> > > +		       MPMU_ACGR,
> > > +		       BIT(21), BIT(21), 0, 0);
> > > +static CCU_GATE_FACTOR_DEFINE(pll1_d10_245p76, "pll1_d10_245p76", CCU_PARENT_HW(pll1_d5),
> > > +			      MPMU_ACGR,
> > > +			      BIT(18), BIT(18), 0, 2, 1, 0);
> > > +
> > > +static CCU_GATE_DEFINE(pll1_d4_614p4, "pll1_d4_614p4", CCU_PARENT_HW(pll1_d4),
> > > +		       MPMU_ACGR,
> > > +		       BIT(15), BIT(15), 0, 0);
> > > +static CCU_GATE_FACTOR_DEFINE(pll1_d52_47p26, "pll1_d52_47p26", CCU_PARENT_HW(pll1_d4),
> > > +			      MPMU_ACGR,
> > > +			      BIT(10), BIT(10), 0, 13, 1, 0);
> > > +static CCU_GATE_FACTOR_DEFINE(pll1_d78_31p5, "pll1_d78_31p5", CCU_PARENT_HW(pll1_d4),
> > > +			      MPMU_ACGR,
> > > +			      BIT(6), BIT(6), 0, 39, 2, 0);
> > > +
> > > +static CCU_GATE_DEFINE(pll1_d3_819p2, "pll1_d3_819p2", CCU_PARENT_HW(pll1_d3),
> > > +		       MPMU_ACGR,
> > > +		       BIT(14), BIT(14), 0, 0);
> > > +
> > > +static CCU_GATE_DEFINE(pll1_d2_1228p8, "pll1_d2_1228p8", CCU_PARENT_HW(pll1_d2),
> > > +		       MPMU_ACGR,
> > > +		       BIT(16), BIT(16), 0, 0);

...

> > I couldn't find the "ripc_clk" on the clock tree diagram.  It is
> > never used elsewhere, so I think this definition can go away.
> 
> I'm not sure whether the ripc_clk doesn't exist or it's just missing in
> both datasheet and clock tree diagram. Will confirm with the vendor.

It's just missing in the datasheet and clock tree diagram and now they
have been completed[1].

> > > +static CCU_GATE_DEFINE(ripc_clk, "ripc_clk", CCU_PARENT_NAME(vctcxo_24m),
> > > +		       MPMU_RIPCCR,
> > > +		       0x3, 0x3, 0x0,
> > > +		       0);
> > > +

....

> > > +static const struct clk_parent_data dpubit_parents[] = {
> > > +	CCU_PARENT_HW(pll1_d3_819p2),
> > > +	CCU_PARENT_HW(pll2_d2),
> > > +	CCU_PARENT_HW(pll2_d3),
> > > +	CCU_PARENT_HW(pll1_d2_1228p8),
> > > +	CCU_PARENT_HW(pll2_d4),
> > > +	CCU_PARENT_HW(pll2_d5),
> > 
> > The next two parent clocks are duplicates.  It looks this way on the
> > clock tree diagram as well.  Is this correct? Can you find out from
> > SpacemiT whether one of them is actually a different clock (like
> > pll2_d6 or something)?  It makes no sense to have two multiplexed
> > parent clocks with the same source.
> 
> Yes, will confirm it later. The register description[2] suggests it's
> wrong (there aren't two configuration for MIPI_BIT_CLK_SEL resulting in
> the same frequency).

The clock tree diagram (and the vendor driver) were wrong. The 7th.
parent should be pll2_d7 (427MHz * 7 is roughly 3GHz, which is PLL2's
frequency). The diagram has been corrected.

> > > +	CCU_PARENT_HW(pll2_d8),
> > > +	CCU_PARENT_HW(pll2_d8),
> > > +};
> > > +static CCU_DIV_FC_MUX_GATE_DEFINE(dpu_bit_clk, "dpu_bit_clk", dpubit_parents,
> > > +				  APMU_LCD_CLK_RES_CTRL1,
> > > +				  17, 3, BIT(31),
> > > +				  20, 3, BIT(16), BIT(16), 0x0,
> > > +				  0);
> > > +

...

> > > diff --git a/drivers/clk/spacemit/ccu_ddn.c b/drivers/clk/spacemit/ccu_ddn.c
> > > new file mode 100644
> > > index 000000000000..1df555888ecb
> > > --- /dev/null
> > > +++ b/drivers/clk/spacemit/ccu_ddn.c
> > > @@ -0,0 +1,140 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Spacemit clock type ddn
> > > + *
> > > + * Copyright (c) 2024 SpacemiT Technology Co. Ltd
> > > + * Copyright (c) 2024 Haylen Chu <heylenay@4d2.org>
> > > + */
> > > +
> > > +#include <linux/clk-provider.h>
> > > +
> > > +#include "ccu_ddn.h"
> > 
> > What does "DDN" stand for?
> 
> I'm not sure, the name is kept from the vendor driver. I could change it
> to a more descriptive name, like "fraction-factor".

It's abbreviated from "Divider Denominator Numerator", confirmed by the
vendor. Quite weird a name. I'll make the abbreviation and corresponding
explanation more clear in the next revision.

Thanks,
Haylen Chu

[1]: https://developer.spacemit.com/documentation?token=LCrKwWDasiJuROkVNusc2pWTnEb#part208

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
