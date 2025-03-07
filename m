Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AA2C19F32
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 06:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aZwLzGEHezsvQlNiS+/lPxMgLXrR/8mY1scgb/suTf8=; b=HQDTHNCY5tc9Zw
	5RH4BZV1R0NxNjdm/AjX/pw1ZtBs9OisOuUBRogxc7aogkyiSJKcQ8v1DKRu8zgECFwz3OmJuCrqI
	iU/xUK1PThGT+jBVtEkOAHnTopY52e4AeZ3r8oeV3mj0fmQ2mD9Bn7MYMzzJVzDH72zMCrI8tuSTj
	a4PJG7VYbHb0i3OM+wKzGoGwPh0b82hG/O/C5K8i7ZCOdgboEgrJtpnbrSPcNy18QnlskwbaF/gpu
	/EfLT0RcshIAEomXsd8E2Iu2jCDUdA3eGO9P5GoQ4MO6mzRkdxF1eYTXnNtNYUiuk37jQzy9znB+P
	cmksVkGNWZTpV+6hmQjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqRCM-0000000DJA6-0MSz;
	Fri, 07 Mar 2025 06:28:42 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqRCJ-0000000DJ9h-3iaq
	for linux-riscv@lists.infradead.org;
	Fri, 07 Mar 2025 06:28:41 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 90BE9EC59F6;
	Thu, 06 Mar 2025 22:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1741328916; bh=esOGewcBEitTNMbwJLWV/4Q8Pac0CJGCYz1jkogecso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vg/hqRnEncDV/KzUibAzBjeZk9XwghJN+jrJW/lb7CJPSjhh6VJQlN/hI4vCT2oi0
	 V4ptSKUL6WH8wIA3MNoLyvYKcXkA0c3t565KNPiyCPEhnBH3AZvZemFUiuP/7TE5db
	 bBSMSkC9zbIi8O46gzXVcYbQbdtlrishQFUz4NJ+GazX0NhTjTqk5qtOLsq5dP0S1a
	 t5T2qmwe2D1LryUCWqPkg3uvSFIyKB08XpbfseACNwmwhV86Co3vmiYNG5sS+vT+GL
	 H23ovsFu58lF7xFMqqfKDhvoawoyHp+iKVlnQD5wsqYDqUeU5wkSRkx29NcLMZVur5
	 SJBQS8V2kvdhw==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bj5LQsPHFXeA; Thu,  6 Mar 2025 22:28:29 -0800 (PST)
Received: from ketchup (unknown [183.217.80.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 6BCCDEC59F2;
	Thu, 06 Mar 2025 22:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1741328909; bh=esOGewcBEitTNMbwJLWV/4Q8Pac0CJGCYz1jkogecso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2EdwgRk755DuMsaIsaUEccn21RzYdgA5s9XF9N19XVppPNhCeQ4MW/3gIGnNlHOWF
	 Lo935i4Yfh7ac2Li6szSZ/SQdtJ2XDJ3fOpUDoMqQQ2Qwxe5CW9bt/89NFtNf8dmWY
	 F+Ybl6IiQwUM0hDEBb2EeAqPFmOsJXu7dDoLgEgrzHFOPZ6d42+QFahTT4TD/h6Pac
	 JYYEWzEsbiGq0ADwiLXMObuzYQTXS2t5tpCghyqLfvIIeEmKx+BzW6bHUlhQDodofg
	 XKaqL/9mrrf9v0VamcuDlyUnsBi/ERqAkzY+Z8vpQyShQTw+BWjb9rR1o7TKM0JSrq
	 evABESf6fyBAg==
Date: Fri, 7 Mar 2025 06:28:16 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Inochi Amaoto <inochiama@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v5 5/5] riscv: dts: spacemit: Add clock tree for Spacemit
 K1
Message-ID: <Z8qSAKXQEfnyVef6@ketchup>
References: <20250306175750.22480-2-heylenay@4d2.org>
 <20250306175750.22480-7-heylenay@4d2.org>
 <2isaev6ys2fn2u6lnyudvnjam34fggr5tqh7afajwdjbdp5rvr@ajokoevhqq4p>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2isaev6ys2fn2u6lnyudvnjam34fggr5tqh7afajwdjbdp5rvr@ajokoevhqq4p>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_222840_255153_176F1991 
X-CRM114-Status: GOOD (  21.15  )
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

On Fri, Mar 07, 2025 at 09:55:15AM +0800, Inochi Amaoto wrote:
> On Thu, Mar 06, 2025 at 05:57:51PM +0000, Haylen Chu wrote:
> > Describe the PLL and system controllers that're capable of generating
> > clock signals in the devicetree.
> > 
> > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > ---
> >  arch/riscv/boot/dts/spacemit/k1.dtsi | 79 ++++++++++++++++++++++++++++
> >  1 file changed, 79 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > index c670ebf8fa12..09a9100986b1 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > @@ -3,6 +3,8 @@
> >   * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
> >   */
> >  
> > +#include <dt-bindings/clock/spacemit,k1-ccu.h>
> > +
> >  /dts-v1/;
> >  / {
> >  	#address-cells = <2>;
> > @@ -306,6 +308,40 @@ cluster1_l2_cache: l2-cache1 {
> >  		};
> >  	};
> >  
> > +	clocks {
> 
> > +		#address-cells = <0x2>;
> > +		#size-cells = <0x2>;
> > +		ranges;
> 
> why setting this?

I just noticed these unnecessary properties after sending the series,
will drop them, thanks.

> > +
> > +		vctcxo_1m: clock-1m {
> > +			compatible = "fixed-clock";
> 
> > +			clock-frequency = <1000000>;
> 
> Should the frequency this move to the board file?
> I do not think these clock are in the soc.
> This applys to all clock below.

This should be the special case described in the dts-coding-style
documentation,

> A partial exception is a common external reference SoC input clock,
> which could be coded as a fixed-clock in the SoC DTSI with its
> frequency provided by each board DTS.[1]

These four external clocks are essential for K1 SoC to operate as shown
in the clock tree diagram[2]. I think they fit the exception.

Furthermore, the SoC expects these four clocks in fixed rates, thus I
don't see a reason not to include the clock-frequency property here.
Please correct me if I get something wrong.

> > +			clock-output-names = "vctcxo_1m";
> > +			#clock-cells = <0>;
> > +		};
> > +
> > +		vctcxo_24m: clock-24m {
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <24000000>;
> > +			clock-output-names = "vctcxo_24m";
> > +			#clock-cells = <0>;
> > +		};
> > +
> > +		vctcxo_3m: clock-3m {
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <3000000>;
> > +			clock-output-names = "vctcxo_3m";
> > +			#clock-cells = <0>;
> > +		};
> > +
> > +		osc_32k: clock-32k {
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <32000>;
> > +			clock-output-names = "osc_32k";
> > +			#clock-cells = <0>;
> > +		};
> > +	};
> > +
> >  	soc {
> >  		compatible = "simple-bus";
> >  		interrupt-parent = <&plic>;

Thanks,
Haylen Chu

[1]: https://elixir.bootlin.com/linux/v6.11-rc1/source/Documentation/devicetree/bindings/dts-coding-style.rst#L196
[2]: https://developer.spacemit.com/resource/file/images?fileName=E9VPb63n8o1heox2KXHcgWiVnWh.png

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
