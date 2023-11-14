Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E298C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 15:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FjLa+bMG5cYO8k0/tFGWxp5W5N5V7O79xKdiuBQQeRA=; b=iXQqNi5uVlpJ4Q
	ftgWeT26wRw8DTus3wxgq0ZEj4wBOTqziiccNTMSp4MxIXS6waduvIvETadWHJ1SXqpXqSGxtnnBh
	blh3Cz9mPh/QjaRGPERjI5ULHMXtpLXDOUoDWwa2aI1DdIbq6ry4SQtQQJ0csHe/e0jhv77pWiXdV
	fTIm2qmAaOER56n0rjAprEE0ABYGNS9Nx/mKe1WcrEAA6xI6WQqOWJZoh+Lz+F4Eap/1BfCi2+/4v
	t3WmxbM+qrpqYIcyQJt+DBaiKLG0Am8jVckY/GWlTPkd+mdUGaJwUZ2ceDdnYafmcBkzfmd2yI+Y1
	05m5PbedYYND7u0r00ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2v0p-00GGgY-0R;
	Tue, 14 Nov 2023 15:07:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2v0l-00GGg1-2j
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 15:07:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 17388612EE;
	Tue, 14 Nov 2023 15:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0AF6C433C8;
	Tue, 14 Nov 2023 15:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699974450;
	bh=BVqDcYpXntfuz/Ud2ECCfNPZwTZVgYgcP1GTHwqqbDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p42iCVOSIm4hBmO/hrs12ZZ5jZ5z0+3Rqok51445Q4YhW96mgui/5DgZwCZFualbd
	 rti0OiAgRp2wj+61eCSAK8nG3Ol/RGAABzQVA2H09/+J4DlBgfhWCW+7Fvc+r9rD7T
	 zY30yzlq+0PsKgnTATmj6IEehbD4CZ6qjBY1HcwZOQHDFkTU8LWvPUEAKscYwQsv4w
	 smRfYNtg4ej7CGoJ13DEChuY2OECLt1ZCO8C4W9lVf3F6qLfEapgXqHu+mN9FKOeW6
	 pzxL0grwu+p35eAAkzI4P9DcK0JRO/H/VODrLUtLm08LMwa8fyvfHn+r3YKjz2sNuQ
	 ENex3QTkoXGDg==
Date: Tue, 14 Nov 2023 22:55:06 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Yixun Lan <dlan@gentoo.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 3/4] riscv: dts: sophgo: add reset dt node for cv1800b
Message-ID: <ZVOKStmcyXtH4oZS@xhacker>
References: <20231113005503.2423-1-jszhang@kernel.org>
 <20231113005503.2423-4-jszhang@kernel.org>
 <20231113143224.GA130254@ofsar>
 <ZVI9bzAhPnHhVg8A@xhacker>
 <7cccf188-c47f-4865-95ce-dcfedc1429dc@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7cccf188-c47f-4865-95ce-dcfedc1429dc@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_070731_971446_92316C7C 
X-CRM114-Status: GOOD (  31.27  )
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

On Mon, Nov 13, 2023 at 10:37:35AM -0500, Samuel Holland wrote:
> Hi Jisheng,

Hi Samuel,

> 
> On 2023-11-13 9:14 AM, Jisheng Zhang wrote:
> > On Mon, Nov 13, 2023 at 02:32:24PM +0000, Yixun Lan wrote:
> >> On 08:55 Mon 13 Nov     , Jisheng Zhang wrote:
> >>> Add the reset device tree node to cv1800b SoC.
> >>>
> >>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> >>> ---
> >>>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 6 ++++++
> >>>  1 file changed, 6 insertions(+)
> >>>
> >>> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> >>> index df40e87ee063..4032419486be 100644
> >>> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> >>> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> >>> @@ -54,6 +54,12 @@ soc {
> >>>  		dma-noncoherent;
> >>>  		ranges;
> >>>  
> >>> +		rst: reset-controller@3003000 {
> >>> +			compatible = "sophgo,cv1800b-reset";
> >>> +			reg = <0x03003000 0x1000>;
> >>                                           ~~~~~~~
> >> 			        it should be 0x28
> > 
> > The reg space is 4KB, but only 0x28 are used. I think 0x1000 or 0x28 are fine
> > since the ioremap granule is 4kB.
> >>
> >> while please also note the 0x24 == SOFT_CPUAC_RSTN, does not compatible
> >> with the reset-simple driver, but as it's not implemented nor used in this driver,
> > 
> > But the functionality of this "autoclear" reg isn't used at all since we also
> > have "sticky" reset to acchieve the same feature, I.E reset cpusys. And in the
> > usage case of reseting cpusys, I believe "sticky" reset is preferred.
> > 
> > And except the cpusys reset which has both autoclear and sticky, other
> > resets are sticky only. I'm not sure whether it's worth to write a new
> > driver for almost useless feature.
> 
> As long as the device has its own binding/compatible string, it is always
> possible to replace RESET_SIMPLE with a custom driver later if needed. (Or use a
> more complicated driver in some other context, e.g. firmware).

Good idea, indeed if needed we can implement a customized driver, and I think
this can acchieve both backward and forward DT compatbility ;)

As for firmware, I guess you mean the little c906 core os firmware. Here
is my draft plan:

a sophgo custom remoteproc driver which will do something like:

load the firmware;
reset_assert(rst);
prepara cpu entry address and so on;
reset_deassert(rst);

so sticky reset still works perfectly. While I believe autoclear reset
may not work if the reset clears something we have set.

> 
> Regards,
> Samuel
> 
> >> so we should be fine with this?
> >>
> >>> +			#reset-cells = <1>;
> >>> +		};
> >>> +
> >>>  		uart0: serial@4140000 {
> >>>  			compatible = "snps,dw-apb-uart";
> >>>  			reg = <0x04140000 0x100>;
> >>> -- 
> >>> 2.42.0
> >>>
> >>
> >> -- 
> >> Yixun Lan (dlan)
> >> Gentoo Linux Developer
> >> GPG Key ID AABEFD55
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
