Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5825BC28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 10:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w96dGFtms5MEd9zQJOAhNoY9IcjU6JTXHue02oWzVf0=; b=neXqbnPd3NjN71
	SkbjaMxKsZTQTryzRMH9GCnAxAjiqVpV164R80fXwTm9RtpLvk0XBbe7X0pk4Xa8+Am7AftIkQV+L
	L856jHYYPw7uW1F6CLLGM80zBLgnXrJk2r9udY+ENuhKpgUC4BmONYTENG6RZSbq0RTPm6Qlt5xFG
	1HBqcHR18Iwa1OAo6YVXTZ1MgyIqZIk2KB74+eKl1pxdczCyIfgwVAiKTdjt6ssu6PYc2P52vwRaU
	gfHAZX3duxhzut6h7UDo3CdifV55Lk2iuoBbRrCDXTnSrcpXuYrIR9MTQkUy6LiPz6kEiNpG1/kiZ
	LnGJHXdjE/s+WtQmfrKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ50d-007ioF-4w; Mon, 22 Aug 2022 10:50:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ50Z-007iiP-1P
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 10:50:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B0E111FB;
	Mon, 22 Aug 2022 03:50:11 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AC603F718;
	Mon, 22 Aug 2022 03:50:06 -0700 (PDT)
Date: Mon, 22 Aug 2022 11:50:02 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base
 devicetree
Message-ID: <20220822115002.74003b1c@donnerap.cambridge.arm.com>
In-Reply-To: <932aaefd-e2ca-ef26-bf30-e315fb271ec5@sholland.org>
References: <20220815050815.22340-1-samuel@sholland.org>
	<20220815050815.22340-7-samuel@sholland.org>
	<20220815141159.10edeba5@donnerap.cambridge.arm.com>
	<3cd9ed5b-8348-38ac-feb1-9a7da858cebc@microchip.com>
	<932aaefd-e2ca-ef26-bf30-e315fb271ec5@sholland.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_035015_211341_129D07E9 
X-CRM114-Status: GOOD (  26.43  )
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, wens@csie.org, jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org, Conor.Dooley@microchip.com, robh+dt@kernel.org, palmer@dabbelt.com, krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com, Geert Uytterhoeven <geert@linux-m68k.org>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 20 Aug 2022 12:24:55 -0500
Samuel Holland <samuel@sholland.org> wrote:

Hi,

> On 8/15/22 12:01 PM, Conor.Dooley@microchip.com wrote:
> > On 15/08/2022 14:11, Andre Przywara wrote:  
> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>
> >> On Mon, 15 Aug 2022 00:08:09 -0500
> >> Samuel Holland <samuel@sholland.org> wrote:
> >>
> >> Hi,
> >>
> >> thanks for all the efforts in getting those SoC peripherals supported!
> >>  
> >>> D1 is a SoC containing a single-core T-HEAD Xuantie C906 CPU, as well as
> >>> one HiFi 4 DSP. The SoC is based on a design that additionally contained
> >>> a pair of Cortex A7's. For that reason, some peripherals are duplicated.  
> >>
> >> So because of this, the Allwinner R528 and T113 SoCs would share almost
> >> everything in this file. Would it be useful to already split this DT up?
> >> To have a base .dtsi, basically this file without /cpus and /soc/plic,
> >> then have a RISC-V specific file with just those, including the base?
> >> There is precedence for this across-arch(-directories) sharing with the
> >> Raspberry Pi and Allwinner H3/H5 SoCs.  
> > 
> > For those playing along at home, one example is the arm64 bananapi m2
> > dts which looks like:  
> >> /dts-v1/;
> >> #include "sun50i-h5.dtsi"
> >> #include "sun50i-h5-cpu-opp.dtsi"
> >> #include <arm/sunxi-bananapi-m2-plus-v1.2.dtsi>
> >>
> >> / {
> >> 	model = "Banana Pi BPI-M2-Plus v1.2 H5";
> >> 	compatible = "bananapi,bpi-m2-plus-v1.2", "allwinner,sun50i-h5";
> >> };  
> > 
> > I think this is a pretty good idea, and putting in the modularity up
> > front seems logical to me, so when the arm one does eventually get
> > added it can be done by only touching a single arch.  
> 
> This is not feasible, due to the different #interrupt-cells. See
> https://lore.kernel.org/linux-riscv/CAMuHMdXHSMcrVOH+vcrdRRF+i2TkMcFisGxHMBPUEa8nTMFpzw@mail.gmail.com/
> 
> Even if we share some file across architectures, you still have to update files
> in both places to get the interrupts properties correct.

There are interrupt-maps for that:
sun8i-r528.dtsi:
	soc {
		#interrupt-cells = <1>;
		interrupt-map = <0  18 &gic GIC_SPI  2 IRQ_TYPE_LEVEL_HIGH>,
				<0  19 &gic GIC_SPI  3 IRQ_TYPE_LEVEL_HIGH>,
				....

sun20i-d1.dtsi:
	soc {
		#interrupt-cells = <1>;
		interrupt-map = <0  18 &plic  18 IRQ_TYPE_LEVEL_HIGH>,
				<0  19 &plic  19 IRQ_TYPE_LEVEL_HIGH>,

then, in the shared .dtsi:
		uart0: serial@2500000 {
			compatible = "snps,dw-apb-uart";
			...
			interrupts = <18>;

This is completely untested, but I have all the files spelt out there, and
dtc seems happy for both architectures (outside of the kernel tree for now).

> I get the desire to deduplicate things, but we already deal with updating the
> same/similar nodes across several SoCs, so that is nothing new. I think it would
> be more confusing/complicated to have all of the interrupts properties
> overridden in a separate file.

So is this the only thing that prevents sharing? The above paragraph
sounds a bit you are not very fond of the idea to begin with?

Cheers,
Andre

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
