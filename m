Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C11105F79E
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Mar 2026 08:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0a9m55dxni9eb9Zvv3wnbbpACbnSOPhKrQOkgkWIL8s=; b=N/gh+JQRpXlSbG
	yVfb23Oj0zSAOq9onhvzetW9wtsQar2Mx5FlQZUqgdrOl4RxtQyhYS+MInvL+3Dsj99O0pr7MVztH
	7NXlgIA9wcuf1lCBnV/ANb5yIwz/fx+aD/Vdh+DuN0SbVVK/2aVwXUSRzjBC6sMWsaiz5oOlAX5nR
	LHrOOcOsTbhNoGpg5TpZR3IemE/wt6+bUBCAcRWHkNG/CnRNF7unERIf3F0RBAec9Y/0EngJtsjEa
	skc6mb1qUu2A6qlQOmKbdAZOrc8xECwgBHpa02oygR5+7myNo0+lyGFtmJy4tz33mwGmZq4izToXj
	wmCiEZkGlavvYi5RS6lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Kjz-00000001eLe-1tL1;
	Sat, 14 Mar 2026 08:52:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Kjy-00000001eLY-0SPr
	for linux-riscv@lists.infradead.org;
	Sat, 14 Mar 2026 08:52:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 37B4860008;
	Sat, 14 Mar 2026 08:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 183CDC116C6;
	Sat, 14 Mar 2026 08:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773478376;
	bh=isyAYh5ojmORloCgPaNY2dTczDe0Vz4+tpOhyTGu6gE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FG0XXk9sqlykF+WTrPP6Ra92mHopuoMNuMu4U/kRaB5eTRWeCH2Es+O4bivRJvt0h
	 xkwdx1VosZCrxboHeTVeo/Z/305oScEfFYnphPE3lqJLcK6v59hY7C6ssj8ZIF3LjT
	 FRwyNLZbwVEnzLeoieLUEu+YPDF3npLUlKnHZlhqljprrKRWaJRjxtjTA6gQJGEaT2
	 EfsDh9jw7zC3MDTqKoJcKbz0Fh7+6DFfCfDg3bJpn1GokSvQUM2whoYaa7ZLcoZWev
	 EmwvnDWTDtcsNwHG6uIERTr7twHHes1pWZNrHdwLtp0o5y+8jOcn8GIytEqmki32ne
	 XnIoOG1lCbFWQ==
Date: Sat, 14 Mar 2026 16:52:52 +0800
From: Yixun Lan <dlan@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH 1/4] riscv: dts: spacemit: k3: add clock tree
Message-ID: <20260314085252-GKB415778@kernel.org>
References: <20260304-01-dts-uart-full-v1-0-50a0aa53a245@kernel.org>
 <20260304-01-dts-uart-full-v1-1-50a0aa53a245@kernel.org>
 <fecadd41-ee3e-4452-bf25-4a70eaeb5f3f@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fecadd41-ee3e-4452-bf25-4a70eaeb5f3f@sifive.com>
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

Hi Samuel,

On 20:44 Fri 13 Mar     , Samuel Holland wrote:
> Hi Yixun,
> 
> On 2026-03-04 1:36 AM, Yixun Lan wrote:
> > Add clock support to SpacemiT K3 SoC, the clock tree consist of several
> > blocks which are APBC, APMU, DCIU, MPUM.
> > 
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > ---
> >  arch/riscv/boot/dts/spacemit/k3.dtsi | 75 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 75 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > index b69cf81b5d55..e3d7f3102fd5 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > @@ -4,6 +4,7 @@
> >   * Copyright (c) 2026 Guodong Xu <guodong@riscstar.com>
> >   */
> >  
> > +#include <dt-bindings/clock/spacemit,k3-clocks.h>
> >  #include <dt-bindings/interrupt-controller/irq.h>
> >  
> >  /dts-v1/;
> > @@ -398,6 +399,36 @@ core3 {
> >  		};
> >  	};
> >  
> > +	clocks {
> > +		vctcxo_1m: clock-1m {
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <1000000>;
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
> 
> Are these clocks provided by SoC or by the board? Usually there's a crystal
> external to the SoC that provides the root of the clock tree. If these clocks
> are provided by the board, they (or at least the clock-frequency property)
> should be in the board DT, not the SoC dtsi.
> 
It's true, as a quick check, osc_32k provided by P1 PMU, while vctcxo_24m is
a crystal, vctcxo_1m and vctcxo_3m are also marked as external in the clock
tree, but I would confirm them later..

I agree to move them out of SoC dtsi file - k3.dtsi, while due to all boards share
the same clock topology, what if I creating a k3-clock.dtsi and making it shared 
between all board dts file? to avoid massive DTS duplication

> Also, the /clocks node is out of order.
> 
I will move osc_32k before vtccxo_1m, assuming it's the problem you
refered to?

> Regards,
> Samuel

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
