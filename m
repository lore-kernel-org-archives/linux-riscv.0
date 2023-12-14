Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC23EC4167D
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 17:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=5KaSrC1NQ8BQMvFPC2xsYM0Tcj8Nccp2RzFZUdwhDnI=; b=tDg5WAS9JpMh3ycPlF/C3XUlpD
	3B7G4/s2g1FvpPioGKf39JTLf9mAK/4gTmvSldFrH6XNrnG1J70GL90GyO2NbfhfKqyId8Jq3fZ1x
	tg5FeFq5RfXyZmoI3h+X96s/BSlBfxCOVCvvixvCUePXiOsvFZDsuvqNisYHa+xWZ1lBAVSMlr4jz
	OQbETejqzlyYIx7uWFKNp3ubD40Q5GiNsKiODWy2al3S4rFy4s1Zv1hAMeU4ncLr6l8zdwb5jPAP1
	gKYO9ggT8I68yT/WJsp5j+HrDCtcGPx89MAs9/lZz5W7Nf2LoG41e1K9xT5wNOl2rqXukgzcwFhQo
	isEABvXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDpO9-000uRh-2x;
	Thu, 14 Dec 2023 17:20:45 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDpO7-000uQs-0a
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 17:20:45 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6d9f7b3de20so4520132a34.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 09:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1702574439; x=1703179239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+F8ciQVGIw9fMsFLXzGlUHF6cxC03FKdUbAqZam9Wc=;
        b=vJyJOyFduYzhwPIw4KTfdEC19XQuy/Q9nlRb7q7dRFlEEp4C6A4oPT15kIt5PIb0qe
         9zWZ0gFsF1pX830ERpBp45BW2eTLgKtrofrSPswK3p5OfhTtWSB8gkeas7GfoNQlemk/
         sD2tgk8MPuw6mu00kknKw1u547t3eKGaUqOA67vGWfk6pJ0YCFBk4Z4528/9WiS19XnL
         0YdHc5kwYjyKGg/jmhRAy1jQoLPPt6NB7UUjFu5auPr5jqa6wZbmQt36njLbQmjUCJ5G
         ZYwpD7FRg4cPegnp5k3m+0qpHWyapjNAW9T2urffPA9CcjJynlPXWxEdx1OdzhNN+RMc
         MoeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702574439; x=1703179239;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+F8ciQVGIw9fMsFLXzGlUHF6cxC03FKdUbAqZam9Wc=;
        b=k0A+NXTy8Vw92XTGlAP/SoYpSSLkp7zeAH6cXODv0MXQs9YSdccw/WF1oFBOuNDevR
         /H4y8N4Fe/1SGuJ8UUT10msNuqzRcnUdPrh0mwEnEd1fm4zup5TiA73LYNMKndStrpnC
         p4+nFLyxOmPLzm7NBN7Y38/fuI4pVCTGGgo2KJmZCqBJ+tM+3zlaY4sdCU4jTSKs+d/I
         ZxhLtWUGMKbsfr1d3E4X+lTJna2GUAkex50+ps4ohT0BZAFsZ8r5t6RbIOpmwyKTVrPR
         5xDTZeG4lgXWg4LbHsXgr5nG4EbWwOG/T3UD0QA3T30t8nKxND13dHbJI2LFswLPI3jY
         jzmA==
X-Gm-Message-State: AOJu0YxyL+SYP6Q4lZevNoa6aHeUMRShoUbj9/rLMiv+Ei8cIr8ELnGq
	99jGGssBgSaG/i3g/cfJP9F6RQ==
X-Google-Smtp-Source: AGHT+IEKhuB3T4yD3hog/sAFKp2qkeePkdBjrzMh1z490YIfe+DWY3rpJfHh5sAcOgRVy3mI1Umkhg==
X-Received: by 2002:a9d:7402:0:b0:6da:3068:e4ff with SMTP id n2-20020a9d7402000000b006da3068e4ffmr3616737otk.3.1702574439636;
        Thu, 14 Dec 2023 09:20:39 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id h16-20020a9d7990000000b006d9d8abcdeesm3321329otm.40.2023.12.14.09.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 09:20:38 -0800 (PST)
Date: Thu, 14 Dec 2023 09:20:38 -0800 (PST)
X-Google-Original-Date: Thu, 14 Dec 2023 09:20:35 PST (-0800)
Subject: Re: [PATCH v3 2/6] dt-bindings: riscv: Add StarFive JH8100 SoC
In-Reply-To: <20231214-platonic-unhearing-27e2ec3d8f75@spud>
CC: jeeheng.sia@starfivetech.com, kernel@esmil.dk, robh+dt@kernel.org,
  krzysztof.kozlowski+dt@linaro.org, krzk@kernel.org, conor+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, daniel.lezcano@linaro.org, tglx@linutronix.de, anup@brainfault.org,
  Greg KH <gregkh@linuxfoundation.org>, jirislaby@kernel.org, michal.simek@amd.com, michael.zhu@starfivetech.com,
  drew@beagleboard.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, leyfoon.tan@starfivetech.com, Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-fb85106d-c0bf-4f6f-8351-10d4a4da6eb6@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_092043_403605_81CCDF37 
X-CRM114-Status: GOOD (  48.68  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 14 Dec 2023 08:22:29 PST (-0800), Conor Dooley wrote:
> On Thu, Dec 14, 2023 at 12:36:57AM +0000, JeeHeng Sia wrote:
>> 
>> 
>> > -----Original Message-----
>> > From: Conor Dooley <conor@kernel.org>
>> > Sent: Wednesday, December 13, 2023 8:43 PM
>> > To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
>> > Cc: kernel@esmil.dk; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org; krzk@kernel.org; conor+dt@kernel.org;
>> > paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; daniel.lezcano@linaro.org; tglx@linutronix.de;
>> > anup@brainfault.org; gregkh@linuxfoundation.org; jirislaby@kernel.org; michal.simek@amd.com; Michael Zhu
>> > <michael.zhu@starfivetech.com>; drew@beagleboard.org; devicetree@vger.kernel.org; linux-riscv@lists.infradead.org; linux-
>> > kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>; Conor Dooley <conor.dooley@microchip.com>
>> > Subject: Re: [PATCH v3 2/6] dt-bindings: riscv: Add StarFive JH8100 SoC
>> > 
>> > On Fri, Dec 01, 2023 at 08:14:06PM +0800, Sia Jee Heng wrote:
>> > > Add device tree bindings for the StarFive JH8100 RISC-V SoC.
>> > >
>> > > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
>> > > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
>> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> > > ---
>> > >  Documentation/devicetree/bindings/riscv/starfive.yaml | 4 ++++
>> > >  1 file changed, 4 insertions(+)
>> > >
>> > > diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
>> > > index cc4d92f0a1bf..12d7844232b8 100644
>> > > --- a/Documentation/devicetree/bindings/riscv/starfive.yaml
>> > > +++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
>> > > @@ -30,6 +30,10 @@ properties:
>> > >                - starfive,visionfive-2-v1.3b
>> > >            - const: starfive,jh7110
>> > >
>> > > +      - items:
>> > > +          - enum:
>> > > +              - starfive,jh8100-evb
>> > 
>> > Hmm, reading some of the other threads it appears that the evaluation
>> > platform that you guys have is actually just an FPGA? Could you please
>> > provide more information as to what this "evb" actually is?
>> > 
>> > If it is just an FPGA-based evaluation platform I don't think that we
>> > want to merge patches for the platform. I'm fine with patches adding
>> > peripheral support, but the soc/board dts files and things like pinctrl
>> > or clock drivers I am not keen on.
>> > Perhaps Emil also has an opinion on this.
>> Eco the same reply here. I am not sure what you mean. We verified on FPGA & Emulator,
>> and the logic is pretty much close to the real silicon.
>
> "Pretty much close" That doesn't give me confidence. The compatible
> should uniquely identify an SoC, but if it is used for both the actual
> SoC and for something "pretty much close" to the actual SoC then that
> does not hold.

Ya, trying to have some pre-silicon FPGA-based platform alias with the 
real chip is a repice for disaster.

>> I did mention that in the cover letter as well.
>
> Ah apologies for missing that. I try to read cover letters but the
> volume of mail gets to me at times.
>
>> I am new to Linux, so I am wondering if there is a Linux upstream guideline mentioning
>> that pre-silicon software is not allowed to upstream?
>
> I wouldn't say that this is the case, but things like clock and pinctrl
> drivers are the sort of things that are likely to vary in your "pretty
> much close" as that is the kind of thing that change for your final
> integration, versus a more "standalone" peripheral.

Yep, and since integration issues in the ASIC blocks can end up 
manifesting as SW-visible behavior in nearby blocks it's hard to just 
pull out the peripherals -- we sort of try by getting the DT topology to 
match the SOC, but there's always some mismatches.

> For dts stuff, in RISC-V at least, we've been operating so far on the
> basis that systems implemented entirely on an FPGA are not suitable for
> inclusion in mainline. I would say that this can probably be relaxed to
> allow systems where there are publicly available, versioned, designs or
> bitstreams that are widely used that these devicetrees correspond to.
> This would suit something like if AMD published a bitstream using one
> of their new MicroblazeV cpu cores as a sort of "reference design".

FPGAs are definately in a grey area, but that's been my mindset as well.  
For me it's less about FPGA vs ASIC (or any other manufacturing 
technology in between) and more about whether something is being used 
publicly.  Specifically: is the FPGA used for internal pre-silicon work 
or is it some publicly availiable system?

The versioning stuff is also important, but we need that for ASICs as 
well since they can be re-spun.

>> Hope there is an updated Linux
>> upstream guideline that benefit other vendors.
>
> I have no idea if there is one or not. I think it generally varies on
> individual maintainers etc, and for something like a dts it comes down
> to the platform maintainer (Emil) I suppose. Sending stuff out before
> your SoC has been produced is really great though, so it is a fine line
> to avoid discouraging something we really like to see.

IIRC we've got some stuff written for arch/riscv somewhere in 
Documentation, but the hardest part here is that each subsystem is going 
to have different policies so it's kind of hard to try and come up with 
a general rule.

> Cheers,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
