Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B37C7EE22
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 16:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9gc1juwU9pRCLY30EpS8qfSZs1vwNLApZ0cf4l42HSU=; b=lm4c8Jm95O/epq
	O5JTlHMoy2/V5/j3e/OGWC2Up83Z2KXiDL7QPhfNDRuQTx7ZVVVPXCYvoJwt1AcDmmFJFk8zeRDeB
	o48Jg8pkWVtCzo6Sq1AsuV/GbAd5IGkRQ4LvcnY05BS8FiQRxnMq3xunjDzZBr9BXUMkNFsmS5QDu
	RJp8nrig4z+q0pFpc0ay9npUZ8vyOkX1+6xdaA2cd+IQ8LQIF22j7YBV4fbni5+Zji6F6MYY/Mb2B
	TyxUMqPQGVlrWDBugOBMVEDVJuPZC26/h7n1n/IAo9SNNsOHKNAC6pr64HdryneTOgjSmIdatxBXi
	ozVlqH17HYa9GdeC3A0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw3rX-000ytW-2H;
	Mon, 08 May 2023 16:37:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw3rV-000ysW-1M
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 16:37:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7E83C60C6C;
	Mon,  8 May 2023 16:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E103DC433D2;
	Mon,  8 May 2023 16:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683563837;
	bh=No13imuIZB8iPKIc3FPlMAlNo8ULEWUh1zQtfnpcBGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vqg3FmxfO7ymJGx6725FjOdi/YUqPtYikEADOIUaV079c/OiMpIyyR6aD8BtlZqCg
	 o6e6DzFt5rM2lkMfUDV1BXWCdvoRkEgQQ8jMKLx84Z1rXi3d/29Wfq6bCUPi2ZAzJC
	 4yL/21PiGI2CYB9Jsfx6wyEC8NepKH5eo4DpSGoh63H1swHW6L9AGRqRmlz08k1ogG
	 EkRYBnHjz62y9TatjG/ewsJWPve+LATc/6bZiB8ME629g+lRN/N+g5TDu7k7HmiNMa
	 jv+eEjro8AVLXSXbkH6a8wc0oyGA6OzxbSgIOowN8v8vW9MeFCR3Qk/zVOliXRulSq
	 gfZ94qHPT8IPQ==
Date: Tue, 9 May 2023 00:26:10 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>, heiko@sntech.de
Subject: Re: [PATCH 3/5] riscv: dts: add initial T-HEAD light SoC device tree
Message-ID: <ZFkiotPacIMUghDP@xhacker>
References: <20230507182304.2934-1-jszhang@kernel.org>
 <20230507182304.2934-4-jszhang@kernel.org>
 <20230507-calamari-gentleman-bbe62af06f92@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230507-calamari-gentleman-bbe62af06f92@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_093721_545888_9E4160F7 
X-CRM114-Status: GOOD (  18.14  )
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

On Sun, May 07, 2023 at 10:35:12PM +0100, Conor Dooley wrote:
> Hey Jisheng,
> 
> On Mon, May 08, 2023 at 02:23:02AM +0800, Jisheng Zhang wrote:
> 
> > +		c910_0: cpu@0 {
> > +			compatible = "thead,c910", "riscv";
> > +			device_type = "cpu";
> > +			riscv,isa = "rv64imafdc";
> 
> Does this support more than "rv64imafdc"?
> I assume there's some _xtheadfoo extensions that it does support,
> although I am not sure how we are proceeding with those - Heiko might
> have a more nuanced take.
> 
> > +		reset: reset-sample {
> > +			compatible = "thead,reset-sample";
> 
> What is a "reset-sample"?

This node is only for opensbi. The compatible string is already in
opensbi. Do we also need to add dt-binding for it in linux?

> 
> > +			entry-reg = <0xff 0xff019050>;
> > +			entry-cnt = <4>;
> > +			control-reg = <0xff 0xff015004>;
> > +			control-val = <0x1c>;
> > +			csr-copy = <0x7f3 0x7c0 0x7c1 0x7c2 0x7c3 0x7c5 0x7cc>;
> > +		};
> > +
> > +		plic: interrupt-controller@ffd8000000 {
> > +			compatible = "thead,c910-plic";
> > +			reg = <0xff 0xd8000000 0x0 0x01000000>;
> > +			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>,
> > +					      <&cpu1_intc 11>, <&cpu1_intc 9>,
> > +					      <&cpu2_intc 11>, <&cpu2_intc 9>,
> > +					      <&cpu3_intc 11>, <&cpu3_intc 9>;
> > +			interrupt-controller;
> > +			#interrupt-cells = <1>;
> > +			riscv,ndev = <240>;
> > +		};
> > +
> > +		clint: timer@ffdc000000 {
> > +			compatible = "thead,c900-clint";
> 
> "c900"? That a typo or intentional. Hard to tell since this compatible
> is undocumented ;)

Per my understanding, this node is only for opensbi too. Add will add
dt-binding in v2.

> 
> > +			reg = <0xff 0xdc000000 0x0 0x00010000>;
> > +			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
> > +					      <&cpu1_intc 3>, <&cpu1_intc 7>,
> > +					      <&cpu2_intc 3>, <&cpu2_intc 7>,
> > +					      <&cpu3_intc 3>, <&cpu3_intc 7>;
> > +		};
> > +
> > +		uart0: serial@ffe7014000 {
> > +			compatible = "snps,dw-apb-uart";
> > +			reg = <0xff 0xe7014000 0x0 0x4000>;
> > +			interrupts = <36>;
> > +			clocks = <&uart_sclk>;
> > +			clock-names = "baudclk";
> 
> dtbs_check complains about this clock name.
> > +
> > +		dmac0: dmac@ffefc00000 {
> 
> dma-controller@
> 
> As I mentioned in the other patch, please clean up the dtbs_check
> complaints for v2.
> 

Thanks for the reminding.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
