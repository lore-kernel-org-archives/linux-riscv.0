Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D07C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 13:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cBvpuzlLsSruz3pIgKjymrUWdjo8zf42p6QjiXsYkOs=; b=PxRbI11E22a8x/
	Tv9Q2DkJeM65ZeUJxzFAnDJ0d7Z28mTUd0xw4XnLRTUZFNLg2likvDIm9tIN7DnuZCoi3altGOmSc
	wM7iLjPENfvK0DpUTtqBeZI3LvmVSpsAAkcpz6u1gbGOi8AsJ+bhwWc/4BWpSpl6ykauGbCFuQJ6F
	5V3+mGJ5BBnWM8xW+IT6HYvIKJtRSES+DkY+GZQf2ncsmZ3jN14fk77UU0xD0FL8+zBbHa8065AMd
	ZveR3v0oaJGjLSh/vPOz7U5nPLVJvUXxaret4TevX2EdkZJZP7JaU5O+a+esh3l3HyUWT2hYFTc1M
	a0Wewk37M1/Pux6sAZvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Wsa-00E2v0-0p;
	Mon, 13 Nov 2023 13:21:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2WsX-00E2to-0w
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 13:21:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 19BCFB80DB8;
	Mon, 13 Nov 2023 13:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB0CC433C9;
	Mon, 13 Nov 2023 13:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699881682;
	bh=KCjtPGRJNG1e0l55yc9Fl85FksaID/z/6qmz2c02TJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ru41IK3OjWDOaCHPpcYqHm3fHFO5FRHCFL0FJbo2Y83ZKmHP5bOm4QNc0vImoxxh5
	 W8pK8ec66mMOEZBcl8QQcycHoQnP856N2TWp7LHx/gHrqCaRceS6nMqi1jMaOwGVvm
	 rOtTxdv3Njs+wM3stEj2CqnL8iTNdldYRY8NVzI8X+KTlq8c6eUbv6nqwkjGXVcGlb
	 REiwdE5bkoAOYhBkj6CMue73qy43GrBvQwiGq46F9CDBJDUyr0PFVOz5gPJTbbH7B0
	 wP2KaM6MUkDyVjrmQdkTCNG5teii+HJdqM2PsT2Xlskh3Cnw8DrqLu+VJzUvndBeZB
	 ne0EleduG7Q0Q==
Date: Mon, 13 Nov 2023 21:09:01 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH 4/4] riscv: dts: sophgo: add reset phandle to all uart
 nodes
Message-ID: <ZVIf7cw1ak+nxnuW@xhacker>
References: <20231113005503.2423-1-jszhang@kernel.org>
 <20231113005503.2423-5-jszhang@kernel.org>
 <95c20c6c-66cd-4f87-920b-5da766317e19@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <95c20c6c-66cd-4f87-920b-5da766317e19@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_052126_139634_5EB493A9 
X-CRM114-Status: GOOD (  20.51  )
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

On Sun, Nov 12, 2023 at 09:04:55PM -0500, Samuel Holland wrote:
> Hi Jisheng,
> 
> On 2023-11-12 6:55 PM, Jisheng Zhang wrote:
> > Although, the resets are deasserted by default. Add them for
> > completeness.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > index 4032419486be..e04df04a91c0 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > @@ -4,6 +4,7 @@
> >   */
> >  
> >  #include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/reset/sophgo,cv1800b-reset.h>
> >  
> >  / {
> >  	compatible = "sophgo,cv1800b";
> > @@ -65,6 +66,7 @@ uart0: serial@4140000 {
> >  			reg = <0x04140000 0x100>;
> >  			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
> >  			clocks = <&osc>;
> > +			resets = <&rst RST_UART0>;
> 
> Since it's not obvious: this breaks devicetree forward compatibility. An
> existing kernel will fail the devm_reset_control_get_optional_exclusive() in
> 8250_dw.c because it has no driver for the reset controller.
> 
> This may not be a concern yet, since the devicetree is still "in development".
> But it is something to keep in mind for the future. To avoid this sort of
> problem, it's best to fully model the clocks/resets/other dependencies as early
> as possible, and not rely on the firmware setting anything up.

Thank you. This may be discussed before, "DT backward compatibility is a
must while forward compatibility is optional"? maybe I'm wrong.

And Indeed, it's better if we can have forward compatibility, will take
care this in future.

> 
> Regards,
> Samuel
> 
> >  			reg-shift = <2>;
> >  			reg-io-width = <4>;
> >  			status = "disabled";
> > @@ -75,6 +77,7 @@ uart1: serial@4150000 {
> >  			reg = <0x04150000 0x100>;
> >  			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
> >  			clocks = <&osc>;
> > +			resets = <&rst RST_UART1>;
> >  			reg-shift = <2>;
> >  			reg-io-width = <4>;
> >  			status = "disabled";
> > @@ -85,6 +88,7 @@ uart2: serial@4160000 {
> >  			reg = <0x04160000 0x100>;
> >  			interrupts = <46 IRQ_TYPE_LEVEL_HIGH>;
> >  			clocks = <&osc>;
> > +			resets = <&rst RST_UART2>;
> >  			reg-shift = <2>;
> >  			reg-io-width = <4>;
> >  			status = "disabled";
> > @@ -95,6 +99,7 @@ uart3: serial@4170000 {
> >  			reg = <0x04170000 0x100>;
> >  			interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
> >  			clocks = <&osc>;
> > +			resets = <&rst RST_UART3>;
> >  			reg-shift = <2>;
> >  			reg-io-width = <4>;
> >  			status = "disabled";
> > @@ -105,6 +110,7 @@ uart4: serial@41c0000 {
> >  			reg = <0x041c0000 0x100>;
> >  			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
> >  			clocks = <&osc>;
> > +			resets = <&rst RST_UART4>;
> >  			reg-shift = <2>;
> >  			reg-io-width = <4>;
> >  			status = "disabled";
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
