Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D88C38A2D
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Oct 2022 06:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EUXpHzdfgYbftuzMTuRXNOvOLNDzBVcEOnieUbi/4pk=; b=eGNWmGX6SjVR4c
	Hq48st4T00Iz8VLAg3AL1H+GvT4vaRGNXgwtrgH5qeOrkiQCb8KXL0YT0s9fXxnla/e2+zHmQ0JJJ
	sZluxkuSjcJu4czQHpWTwrUwDN9IYb95M1YccGjjNb6YnyVI0iyhPGUlYyGVXALHZmPoiL+iJ91fh
	BWeZ81Jnw+6G3KuN1wD5mu1848R5B3/UD/0LA0Zt9fuFRja65IDeP/GKQBkuk+RXgWGRMH3/HMBMY
	vc536oUTcRSTGylCt0CGCDawdQ0KDepIi+W2uFx8BySRO0/WYFrqAP+AKwc0r1atdLWeLkR45fMka
	xZeTTS6XaGLoikbfMiiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onZyk-008Frk-8w; Wed, 26 Oct 2022 06:33:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onZyf-008Fr6-44
	for linux-riscv@lists.infradead.org; Wed, 26 Oct 2022 06:33:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1666766004; x=1698302004;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YSQ0taVVnmjRJNC9c/piCsW0RLRL2qeZ0FLqsRlzPpU=;
  b=AOhuD/lHvvEa65cDZpfI20Jhb6OmEGn5Tu9aMgvCU+k5vw5Q28fZzhRh
   CSVZOtZogQZEGXVUhfa3nlhfm6j2XSpTyLm2j73hjZvw2FQf6ZpBOD6ak
   rfjzFX5Jtmi8GGxzG+OwkGufTytzCOAwPp2aPd0md27hlCwGEJQICZQ2M
   nFsvDW67wY3EebjHL0gfPb/JYToB0WAXeVQvc3PFCqXvCcUmU3cNpKXu2
   xBWLLTp1h+xNPdgimXtEsfD/ek+AsnTHkav8Os91Vho48+7IYusLDGsMF
   VBUGC1c912xAVUs6oX5P3N/4ZEaLnX4Fw2CerPthc73kBuxyjO9HP6ipj
   A==;
X-IronPort-AV: E=Sophos;i="5.95,213,1661842800"; 
   d="scan'208";a="120386793"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Oct 2022 23:33:19 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 25 Oct 2022 23:33:18 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 25 Oct 2022 23:33:16 -0700
Date: Wed, 26 Oct 2022 07:33:02 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: <Padmarao.Begari@microchip.com>
CC: <conor@kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<linux-kernel@vger.kernel.org>, <Daire.McNamara@microchip.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [RFC] riscv: dts: microchip: add OPPs to mpfs
Message-ID: <Y1jUnrzH9sCW/kIi@wendy>
References: <20221024193647.1089769-1-conor@kernel.org>
 <bf68f00675b5cbc6ba8099496ddb68ed20e84f05.camel@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bf68f00675b5cbc6ba8099496ddb68ed20e84f05.camel@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_233325_268949_9002FB68 
X-CRM114-Status: GOOD (  21.79  )
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

On Wed, Oct 26, 2022 at 05:54:16AM +0000, Padmarao.Begari@microchip.com wrote:
> Hi Conor,
> > On Mon, 2022-10-24 at 20:36 +0100, Conor Dooley wrote:
> > 
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > The U-Boot dts for mpfs defines three OPPs which are missing from the
> > Linux dts. For ease of synchronisation of the two, add the missing
> > OPPs
> > to the Linux dt too.
> > 
> > CC: Padmarao Begari <padmarao.begari@microchip.com>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > 
> > Hey Padmarao,
> > I've been trying to pick off the bits that're different between the
> > Linux
> > & U-Boot dts. Do you remember why we added OPPs to the U-Boot dts but
> > didn't propagate them elsewhere?
> > 
> 
> Initially We added OPPs to the Linux dts for the CPU Frequency and
> Voltage scaling while bringing up the Linux on an Emulation Platform
> and the Icicle Kit for PolarFire SoC and same dts used for the U-Boot
> but the U-Boot dts upstreamed first.

Right. So do we know if they're even correct values for an actual
PolarFire SoC?

> >  arch/riscv/boot/dts/microchip/mpfs.dtsi | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi
> > b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> > index 0a9bb84af438..9d9ff7174341 100644
> > --- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
> > +++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> > @@ -23,6 +23,7 @@ cpu0: cpu@0 {
> >                         reg = <0>;
> >                         riscv,isa = "rv64imac";
> >                         clocks = <&clkcfg CLK_CPU>;
> > +                       operating-points-v2 = <&cluster0_opps>;
> >                         status = "disabled";
> > 
> >                         cpu0_intc: interrupt-controller {
> > @@ -51,6 +52,7 @@ cpu1: cpu@1 {
> >                         clocks = <&clkcfg CLK_CPU>;
> >                         tlb-split;
> >                         next-level-cache = <&cctrllr>;
> > +                       operating-points-v2 = <&cluster0_opps>;
> >                         status = "okay";
> > 
> >                         cpu1_intc: interrupt-controller {
> > @@ -79,6 +81,7 @@ cpu2: cpu@2 {
> >                         clocks = <&clkcfg CLK_CPU>;
> >                         tlb-split;
> >                         next-level-cache = <&cctrllr>;
> > +                       operating-points-v2 = <&cluster0_opps>;
> >                         status = "okay";
> > 
> >                         cpu2_intc: interrupt-controller {
> > @@ -107,6 +110,7 @@ cpu3: cpu@3 {
> >                         clocks = <&clkcfg CLK_CPU>;
> >                         tlb-split;
> >                         next-level-cache = <&cctrllr>;
> > +                       operating-points-v2 = <&cluster0_opps>;
> >                         status = "okay";
> > 
> >                         cpu3_intc: interrupt-controller {
> > @@ -136,6 +140,7 @@ cpu4: cpu@4 {
> >                         tlb-split;
> >                         next-level-cache = <&cctrllr>;
> >                         status = "okay";
> > +                       operating-points-v2 = <&cluster0_opps>;
> >                         cpu4_intc: interrupt-controller {
> >                                 #interrupt-cells = <1>;
> >                                 compatible = "riscv,cpu-intc";
> > @@ -166,6 +171,24 @@ core4 {
> >                                 };
> >                         };
> >                 };
> > +
> > +               cluster0_opps: opp-table {
> > +                       compatible = "operating-points-v2";
> > +                       opp-shared;
> > +
> > +                       opp-600000000 {
> > +                           opp-hz = /bits/ 64 <600000000>;
> > +                           opp-microvolt = <1100000>;
> > +                       };
> > +                       opp-300000000 {
> > +                           opp-hz = /bits/ 64 <300000000>;
> > +                           opp-microvolt = <950000>;
> > +                       };
> > +                       opp-150000000 {
> > +                           opp-hz = /bits/ 64 <150000000>;
> > +                           opp-microvolt = <750000>;
> > +                       };
> > +               };
> >         };
> > 
> >         refclk: mssrefclk {
> > --
> > 2.38.0
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
