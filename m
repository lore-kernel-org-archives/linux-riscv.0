Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2DAC38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 20:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ybXiEwqcK0mbo55rLMPfOSJoFGg8iCYodRnK9jwx5hM=; b=xrFFLgBLmFzgz3
	v83ishv0gH0VakECsHcceRrH8An2At8nUgSOsgSJx9ZCN4DYMl88i13fNoHaZ/trTzgG85zdAcEXl
	yhxLoQnk5lzUIM9aO9xJg9ZBrVOWt7Qz+kyu200u9yWUHGw2TB7ItMdJYDp3S4YZ+POW8/fVlsVHp
	vBdOUwhltbU2WisJR6co4SiDBYYKqQmOzMuywOqcv2rqHshsst4aJc5Gj6VrzZpX9DjeRwYYhkeSB
	m9+eBcE2CfpKcA62vT0yNxPCmAryRjsvgouDIxi54YgpQnUerZHZyTCU58sSifzpafZxml+IjNNQg
	2bCHuRmvG4kEsUyVyGKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWOax-008l2c-5l; Thu, 08 Sep 2022 20:57:55 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWOau-008l1o-Io
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 20:57:54 +0000
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-127f5411b9cso16355054fac.4
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 13:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=AkYb42H6PAnMFryGXinv8S02AN5zWvsr2AuuaVfXjQs=;
        b=0amFc8KKL7Jyv6HEa6r45+99eBW2h9qUpNCh2Fa9kN7e+ZR5C8b9hzPHQ+T2P2wEWW
         7l0eF+LeX8W9ImY7WQPyb1l+RUzkFyaPmzzoLdd/IPjKLcI/wzHKJkEHS+iKyWMVyzNW
         ZAbtsrWO04aJLAukNecPmCdUutKC9ZOGHed60GNuDnsSEiw54/6mMy2AEWldTqvWayz7
         a8CD2rd57aplrjI9DtML3LGfARaabF2XRNIlj5gBGvzooIemPRgZ7d85BE5s3szlU7dF
         p753Qza1jEk6SJNjaVfo0QgLok99HlAKlvu7+j6E0tV+UDkJtqwSCJ/pXxtAo1AEZ/9x
         2hbQ==
X-Gm-Message-State: ACgBeo3mWMld0zPiCoyYZT55eXLuB1cLFtsqZeF56SDcI0CPGBV5quv1
	OJGdXtpzYRRXAGg7G8x6Dw==
X-Google-Smtp-Source: AA6agR4yS3IFwNYkq3dWRIdhs/oC9/Z9BNOXONwiLcb2gK5t2VzNYKd0HFd+svNy5YDQYIAS3f0tZg==
X-Received: by 2002:a05:6870:5b84:b0:10c:d1fa:2f52 with SMTP id em4-20020a0568705b8400b0010cd1fa2f52mr3064402oab.92.1662670670169;
        Thu, 08 Sep 2022 13:57:50 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id fo7-20020a0568709a0700b001274845032dsm116555oab.13.2022.09.08.13.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 13:57:49 -0700 (PDT)
Received: (nullmailer pid 3326711 invoked by uid 1000);
	Thu, 08 Sep 2022 20:57:48 -0000
Date: Thu, 8 Sep 2022 15:57:48 -0500
From: Rob Herring <robh@kernel.org>
To: Daire.McNamara@microchip.com
Cc: Cyril.Jean@microchip.com, linux-riscv@lists.infradead.org, kw@linux.com, Conor.Dooley@microchip.com, david.abdurachmanov@gmail.com, devicetree@vger.kernel.org, lpieralisi@kernel.org, aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com, linux-pci@vger.kernel.org, Padmarao.Begari@microchip.com, krzysztof.kozlowski+dt@linaro.org, bhelgaas@google.com, heinrich.schuchardt@canonical.com
Subject: Re: [PATCH v1 1/4] dt-bindings: PCI: microchip: add fabric address
 translation properties
Message-ID: <20220908205748.GA3240357-robh@kernel.org>
References: <20220902142202.2437658-1-daire.mcnamara@microchip.com>
 <20220902142202.2437658-2-daire.mcnamara@microchip.com>
 <CAL_Jsq+5pKyOL8eu5YhQy9pLATd_gG_D71sR8bUp1GA6kif=nA@mail.gmail.com>
 <173950d1b76e13c1476f196afc0e804e93d6e602.camel@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <173950d1b76e13c1476f196afc0e804e93d6e602.camel@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_135752_641676_A96E5C3E 
X-CRM114-Status: GOOD (  37.84  )
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

On Mon, Sep 05, 2022 at 02:54:07PM +0000, Daire.McNamara@microchip.com wrote:
> On Fri, 2022-09-02 at 11:28 -0500, Rob Herring wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Fri, Sep 2, 2022 at 9:22 AM <daire.mcnamara@microchip.com> wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > > 
> > > On PolarFire SoC both in- & out-bound address translations occur in two
> > > stages. The specific translations are tightly coupled to the FPGA
> > > designs and supplement the {dma-,}ranges properties. The first stage of
> > > the translation is done by the FPGA fabric & the second by the root
> > > port.
> > > Add two properties so that the translation tables in the root port's
> > > bridge layer can be configured to account for the translation done by
> > > the FPGA fabric.
> > 
> > I'm skeptical that ranges/dma-ranges can't handle what you need.
> > Anything in this area is going to need justification 'ranges doesn't
> > work because x, y, z...'.
> > 
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> > > ---
> > >  .../bindings/pci/microchip,pcie-host.yaml     | 107 ++++++++++++++++++
> > >  1 file changed, 107 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> > > index 23d95c65acff..29bb1fe99a2e 100644
> > > --- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> > > +++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> > > @@ -71,6 +71,113 @@ properties:
> > >      minItems: 1
> > >      maxItems: 6
> > > 
> > > +  microchip,outbound-fabric-translation-ranges:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > > +    minItems: 1
> > > +    maxItems: 32
> > > +    description: |
> > > +      The CPU-to-PCIe (outbound) address translation takes place in two stages.
> > > +      Depending on the FPGA bitstream, the outbound address translation tables
> > > +      in the PCIe root port's bridge layer will need to be configured to account
> > > +      for only its part of the overall outbound address translation.
> > > +
> > > +      The first stage of outbound address translation occurs between the CPU address
> > > +      and an intermediate "FPGA address". The second stage of outbound address
> > > +      translation occurs between this FPGA address and the PCIe address. Use this
> > > +      property, in conjunction with the ranges property, to divide the overall
> > > +      address translation into these two stages so that the PCIe address
> > > +      translation tables can be correctly configured.
> > 
> > Sounds like you need 2 levels of ranges/dma-ranges.
> > 
> > / {
> >     fpga-bus {
> >         ranges = ...
> >         dma-ranges = ...
> >         pcie@... {
> >             ranges = ...
> >             dma-ranges = ...
> >         };
> >     };
> > };
> Thanks a million for looking at this! Very much appreciated.
> 
> So, this is what I tried.  I've cut down the dts I used to what I think is the minimum
> fragment to discuss the issue I'm facing.
> 
> So, I replaced this stanza:
> 
> pcie: pcie@3000000000 {
>     ...
>     reg = <0x30 0x0 0x0 0x8000000>, <0x0 0x43000000 0x0 0x10000>;
>     reg-names = "cfg", "apb";
>     ranges = <0x0000000 0x0 0x0000000 0x30 0x0000000 0x0 0x8000000>,
>              <0x3000000 0x0 0x8000000 0x30 0x8000000 0x0 0x80000000>;
>     ...
> };
> 
> with this two-level stanza:
> 
> fpga_bus: fpga-bus {
>     #address-cells = <2>;
>     #size-cells = <2>;
>     ranges = <0 0 0x30 0 0x40 0>;
>     compatible = "simple-bus";
>     ...
> 
>     pcie: pcie@0 {
>         reg = <0x0 0x0 0x0 0x8000000>, <0x0 0x43000000 0x0 0x10000>;
>         reg-names = "cfg", "apb";
>         ranges = <0x0000000 0x0 0x0000000 0 0x0000000 0x0 0x8000000>,
>                  <0x3000000 0x0 0x8000000 0 0x8000000 0x0 0x80000000>;
>         ...
>     };
> };
> 
> and I ran into two problems:
> 1) the ranges presented to the driver via  resource_list_for_each_entry(entry, &bridge->windows) 
>    were unchanged. The start and end of both resources were still in 0x30'0000'0000 space, 
>    not 0x0000'0000 as I'd hoped. The two levels of range had been amalgamated before 
>    presentation to the rootport driver, so my initial problem was unchanged ...

Yes, that's expected as the translation will walk up parents to root 
node. You will have to get the untranslated values out of 
ranges yourself. If you use the range parsing functions on the parent 
node ranges, you'll get the 0 from of_range.bus_addr.

> 
> 2) a new issue cropped up. While the 'cfg' register property is in 0x30'0000'0000 space, 
>    the 'abp' interface is actually delivered over a separate FIC and is in a 0x4000'0000 
>    memory space. In the two-level stanza, it was now being provided to the rootport 
>    driver at a base of 0x30'4000'0000 which is incorrect. This is very typical for 
>    designers to route abp over a different FIC to axi. 

If the fpga-bus ranges has a 1:1 entry for 0x43000000 child bus then it 
should get translated correctly. Worst case, you may need to define a 
child bus address outside of 0x30_00000000 range that translates back to 
0x43000000.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
