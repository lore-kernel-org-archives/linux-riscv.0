Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57351E81DE9
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 12:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EHAld+NT75Wji00nr5HM0F8BntSFjnWrSFoflM3hPc4=; b=a9TDOaS+ggFRdT
	AAORYRqaaQmn6a2Y4q+edTfRxc6qCP7y5BZo4WsKmNWPeJaCj59dUSCPK7JjAqpnAgc5MXO903aQA
	7ht8UlJjXLDoygXq0mv0E16rNrh+CTvNlWkeolEsyarxq+est+R7BeophnivN5jfrcYNZGSt/RPCL
	Yds+eDyjF/NCZO8/Jgvcvw8Xk1usCGGhWoCTBdup4KbfzLb7OTz/8MHCOxxPjP0BxOsytT7Iiqkpl
	86B9WuOEilbgOcxJ9xHHnzP8ejCJb2L1v8pzuuYz/ZG7y0DhYryaAb09K/xykVFMv77Nqwhq8ZheL
	mWGB+aBJT8uS9G+BseRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qok1F-005nC7-0q;
	Fri, 06 Oct 2023 12:33:25 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qok1C-005nBY-0x
	for linux-riscv@lists.infradead.org;
	Fri, 06 Oct 2023 12:33:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 62C56CE27D2;
	Fri,  6 Oct 2023 12:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7923DC433C7;
	Fri,  6 Oct 2023 12:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696595599;
	bh=kaiiRDqph/9/dNfSPDM1f2ksRyqa+Xp41z4ukvjjt7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FgybpyT9S78ECB5xM7ySYBUNt1IURI8e61hnxc3sraXfwIGf5mAyJiQkxEpV88wBT
	 tRmt3Kc/yxWN8U7TyN7jhn5GImY+Ww6xRl5cV+kf+mzhLuSv6QC9rMnOgL3L4nHV74
	 Gt6cwPlWo1BjJ/rzWZCqv3a0r2p7tMW4OoEuj8Cx+fVnI+uJYjFvdcbSGmG5jHunxU
	 f/LpdwMIuMdIUKVsC8fZVBgzHL6zC8IkntP4kdgbTOsuFsw5U1Q2RJFCPrkLORondq
	 C2rXbvhRjAriCd/OlD6MLROitNlWV2kOidzGhgazz2byw7eXw6cKwZchftqk0UZ3n6
	 VzylQjTR1Ylcw==
Date: Fri, 6 Oct 2023 20:21:09 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Inochi Amaoto <inochiama@outlook.com>, chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com
Subject: Re: [PATCH 4/5] riscv: dts: sophgo: add initial CV1800B SoC device
 tree
Message-ID: <ZR/7te8fdBQWIZXH@xhacker>
References: <20230930123937.1551-1-jszhang@kernel.org>
 <20230930123937.1551-5-jszhang@kernel.org>
 <20231002-pessimism-sycamore-a854a098cf43@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231002-pessimism-sycamore-a854a098cf43@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_053322_685252_13D37CD6 
X-CRM114-Status: GOOD (  19.60  )
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

On Mon, Oct 02, 2023 at 01:09:38PM +0100, Conor Dooley wrote:
> On Sat, Sep 30, 2023 at 08:39:36PM +0800, Jisheng Zhang wrote:
> > Add initial device tree for the CV1800B RISC-V SoC by SOPHGO.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 117 ++++++++++++++++++++++++
> >  1 file changed, 117 insertions(+)
> >  create mode 100644 arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > new file mode 100644
> > index 000000000000..8829bebaa017
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > @@ -0,0 +1,117 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > + */
> > +
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +/ {
> > +	compatible = "sophgo,cv1800b";
> > +	#address-cells = <1>;
> > +	#size-cells = <1>;
> > +
> > +	cpus: cpus {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		timebase-frequency = <25000000>;
> > +
> > +		cpu0: cpu@0 {
> > +			compatible = "thead,c906", "riscv";
> > +			device_type = "cpu";
> > +			reg = <0>;
> > +			d-cache-block-size = <64>;
> > +			d-cache-sets = <512>;
> > +			d-cache-size = <65536>;
> > +			i-cache-block-size = <64>;
> > +			i-cache-sets = <128>;
> > +			i-cache-size = <32768>;
> > +			mmu-type = "riscv,sv39";
> > +			riscv,isa = "rv64imafdc";
> > +			riscv,isa-base = "rv64i";
> > +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> > +					       "zifencei", "zihpm";
> > +
> > +			cpu0_intc: interrupt-controller {
> > +				compatible = "riscv,cpu-intc";
> > +				interrupt-controller;
> > +				#address-cells = <0>;
> > +				#interrupt-cells = <1>;
> > +			};
> > +		};
> > +	};
> > +
> > +	osc: oscillator {
> > +		compatible = "fixed-clock";
> > +		clock-output-names = "osc_25m";
> > +		#clock-cells = <0>;
> > +	};
> 
> Is this a stub that will later be replaced by a real clock controller
> node, or is this actually a fixed oscillator? If it is the former, could

Hi Conor,

This is a real 25MHZ oscillator. 

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
