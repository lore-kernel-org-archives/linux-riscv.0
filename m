Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A031AC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 01:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IAC4Kg4A17x4wS7XhWYda+J14JRXka06RZajsXV9nP0=; b=fQL6BW1K0FjrHj
	lNkTX6qv8qIAMZIt+qwa502x+Mfehkgv65dzo9l2oDnGb5jVNIgCQiQkxpekmZgc6oW0GE2BBERd4
	axuF5ZnTRJsjci5hcif1W2nZCWHl2j79Mo3R0Cutud3/o1wNT2+dsG67K1gTbNuYcMtB49qpkvNNK
	wVl7YqnNwyfqj7yxdgop+4UbsuKOg0tD1Ys6QbWyygH80dYw/Ovqu/MU4H10m2ssG/pNwQGZ0lePR
	Z1MmTt51VY9s4+lZUjhXA6KPAfaAE2UCG6hTd6OcnKu5Da9xD+3g77fwqXSu8rS5VFBl2H/GCegO/
	K3/+vge4CIyyN0DGFs8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDxL1-001juQ-0o;
	Fri, 15 Dec 2023 01:50:03 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDxKw-001jpB-2F
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 01:50:01 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 3D96224E24B;
	Fri, 15 Dec 2023 09:49:03 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 15 Dec
 2023 09:49:02 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Fri, 15 Dec 2023 09:49:02 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>
CC: "kernel@esmil.dk" <kernel@esmil.dk>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "krzk@kernel.org" <krzk@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "anup@brainfault.org" <anup@brainfault.org>, Greg KH
	<gregkh@linuxfoundation.org>, "jirislaby@kernel.org" <jirislaby@kernel.org>,
	"michal.simek@amd.com" <michal.simek@amd.com>, Michael Zhu
	<michael.zhu@starfivetech.com>, "drew@beagleboard.org"
	<drew@beagleboard.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: RE: [PATCH v3 2/6] dt-bindings: riscv: Add StarFive JH8100 SoC
Thread-Topic: [PATCH v3 2/6] dt-bindings: riscv: Add StarFive JH8100 SoC
Thread-Index: AQHaJE/+BLI69uGa3k+hymTbPrUHV7CmtRSAgAFNEpCAAIKUgIAAED8AgAEQtNA=
Date: Fri, 15 Dec 2023 01:49:02 +0000
Message-ID: <ab8bb47cbcca40649ff1e115ed34d3c1@EXMBX066.cuchost.com>
References: <20231214-platonic-unhearing-27e2ec3d8f75@spud>
 <mhng-fb85106d-c0bf-4f6f-8351-10d4a4da6eb6@palmer-ri-x1c9>
In-Reply-To: <mhng-fb85106d-c0bf-4f6f-8351-10d4a4da6eb6@palmer-ri-x1c9>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [175.136.135.142]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_174959_029063_C0C5E8DC 
X-CRM114-Status: GOOD (  57.72  )
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



> -----Original Message-----
> From: Palmer Dabbelt <palmer@dabbelt.com>
> Sent: Friday, December 15, 2023 1:21 AM
> To: Conor Dooley <conor@kernel.org>
> Cc: JeeHeng Sia <jeeheng.sia@starfivetech.com>; kernel@esmil.dk; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> krzk@kernel.org; conor+dt@kernel.org; Paul Walmsley <paul.walmsley@sifive.com>; aou@eecs.berkeley.edu;
> daniel.lezcano@linaro.org; tglx@linutronix.de; anup@brainfault.org; Greg KH <gregkh@linuxfoundation.org>; jirislaby@kernel.org;
> michal.simek@amd.com; Michael Zhu <michael.zhu@starfivetech.com>; drew@beagleboard.org; devicetree@vger.kernel.org; linux-
> riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>; Conor Dooley
> <conor.dooley@microchip.com>
> Subject: Re: [PATCH v3 2/6] dt-bindings: riscv: Add StarFive JH8100 SoC
> 
> On Thu, 14 Dec 2023 08:22:29 PST (-0800), Conor Dooley wrote:
> > On Thu, Dec 14, 2023 at 12:36:57AM +0000, JeeHeng Sia wrote:
> >>
> >>
> >> > -----Original Message-----
> >> > From: Conor Dooley <conor@kernel.org>
> >> > Sent: Wednesday, December 13, 2023 8:43 PM
> >> > To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> >> > Cc: kernel@esmil.dk; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org; krzk@kernel.org; conor+dt@kernel.org;
> >> > paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; daniel.lezcano@linaro.org; tglx@linutronix.de;
> >> > anup@brainfault.org; gregkh@linuxfoundation.org; jirislaby@kernel.org; michal.simek@amd.com; Michael Zhu
> >> > <michael.zhu@starfivetech.com>; drew@beagleboard.org; devicetree@vger.kernel.org; linux-riscv@lists.infradead.org; linux-
> >> > kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>; Conor Dooley <conor.dooley@microchip.com>
> >> > Subject: Re: [PATCH v3 2/6] dt-bindings: riscv: Add StarFive JH8100 SoC
> >> >
> >> > On Fri, Dec 01, 2023 at 08:14:06PM +0800, Sia Jee Heng wrote:
> >> > > Add device tree bindings for the StarFive JH8100 RISC-V SoC.
> >> > >
> >> > > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> >> > > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> >> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >> > > ---
> >> > >  Documentation/devicetree/bindings/riscv/starfive.yaml | 4 ++++
> >> > >  1 file changed, 4 insertions(+)
> >> > >
> >> > > diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
> >> > > index cc4d92f0a1bf..12d7844232b8 100644
> >> > > --- a/Documentation/devicetree/bindings/riscv/starfive.yaml
> >> > > +++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
> >> > > @@ -30,6 +30,10 @@ properties:
> >> > >                - starfive,visionfive-2-v1.3b
> >> > >            - const: starfive,jh7110
> >> > >
> >> > > +      - items:
> >> > > +          - enum:
> >> > > +              - starfive,jh8100-evb
> >> >
> >> > Hmm, reading some of the other threads it appears that the evaluation
> >> > platform that you guys have is actually just an FPGA? Could you please
> >> > provide more information as to what this "evb" actually is?
> >> >
> >> > If it is just an FPGA-based evaluation platform I don't think that we
> >> > want to merge patches for the platform. I'm fine with patches adding
> >> > peripheral support, but the soc/board dts files and things like pinctrl
> >> > or clock drivers I am not keen on.
> >> > Perhaps Emil also has an opinion on this.
> >> Eco the same reply here. I am not sure what you mean. We verified on FPGA & Emulator,
> >> and the logic is pretty much close to the real silicon.
> >
> > "Pretty much close" That doesn't give me confidence. The compatible
> > should uniquely identify an SoC, but if it is used for both the actual
> > SoC and for something "pretty much close" to the actual SoC then that
> > does not hold.
> 
> Ya, trying to have some pre-silicon FPGA-based platform alias with the
> real chip is a repice for disaster.
> 
> >> I did mention that in the cover letter as well.
> >
> > Ah apologies for missing that. I try to read cover letters but the
> > volume of mail gets to me at times.
> >
> >> I am new to Linux, so I am wondering if there is a Linux upstream guideline mentioning
> >> that pre-silicon software is not allowed to upstream?
> >
> > I wouldn't say that this is the case, but things like clock and pinctrl
> > drivers are the sort of things that are likely to vary in your "pretty
> > much close" as that is the kind of thing that change for your final
> > integration, versus a more "standalone" peripheral.
> 
> Yep, and since integration issues in the ASIC blocks can end up
> manifesting as SW-visible behavior in nearby blocks it's hard to just
> pull out the peripherals -- we sort of try by getting the DT topology to
> match the SOC, but there's always some mismatches.
Thank you everyone. I think I get your point. Is it possible to send "RFC"
patches for things like DT, clk&reset, and pinctrl? Please note that
these have been tested on FPGA/Emulator.
> 
> > For dts stuff, in RISC-V at least, we've been operating so far on the
> > basis that systems implemented entirely on an FPGA are not suitable for
> > inclusion in mainline. I would say that this can probably be relaxed to
> > allow systems where there are publicly available, versioned, designs or
> > bitstreams that are widely used that these devicetrees correspond to.
> > This would suit something like if AMD published a bitstream using one
> > of their new MicroblazeV cpu cores as a sort of "reference design".
> 
> FPGAs are definately in a grey area, but that's been my mindset as well.
> For me it's less about FPGA vs ASIC (or any other manufacturing
> technology in between) and more about whether something is being used
> publicly.  Specifically: is the FPGA used for internal pre-silicon work
> or is it some publicly availiable system?
It is internal.
> 
> The versioning stuff is also important, but we need that for ASICs as
> well since they can be re-spun.
> 
> >> Hope there is an updated Linux
> >> upstream guideline that benefit other vendors.
> >
> > I have no idea if there is one or not. I think it generally varies on
> > individual maintainers etc, and for something like a dts it comes down
> > to the platform maintainer (Emil) I suppose. Sending stuff out before
> > your SoC has been produced is really great though, so it is a fine line
> > to avoid discouraging something we really like to see.
> 
> IIRC we've got some stuff written for arch/riscv somewhere in
> Documentation, but the hardest part here is that each subsystem is going
> to have different policies so it's kind of hard to try and come up with
> a general rule.
> 
> > Cheers,
> > Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
