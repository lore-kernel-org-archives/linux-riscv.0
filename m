Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F956C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 19:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jwZyjh2NG/TDUhwNgjCzWiYIrgsIIvnWc609rSc8Je4=; b=bvp5e8tqBEYwZJ
	Fv5qUom55U/bvBYQzX9DxSSXd3g4XbSC/R2OYlcRNFQnBtUbGzOO2gk1V5akP1CE7gSmzcVjA8YR9
	Vk7QA3B9CS97TwrHJu9ajp3RTMvO2Eb9ryV4EmsjEnf0ygkhPWap9ayi3zdLACH+0bbYzXES6x4RA
	FRJMI7CkIAKcm5BYHyGbEtcuFW4jCHmpVWHkc7b9NclVnWpt/jpwRm7jiCqOzs2L/02aVVMRgq1mw
	4xDlCTbBHd6ETEK//iHpjXkCQ3k/OSRKj8rbyD21wS6zUdzHou1UJj4E4UsifaGFdCZjwM+sCjqp+
	owE2FvE0r1K1uLiOChVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovNrq-007KUi-RE; Wed, 16 Nov 2022 19:14:38 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovNro-007KUO-7T
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 19:14:37 +0000
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-12c8312131fso21231285fac.4
        for <linux-riscv@lists.infradead.org>; Wed, 16 Nov 2022 11:14:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbNwY8VQfyVGQAfwpv9JwDuw9SzkucH6WBiJQC8HG/0=;
        b=3K8TWkupOv6BVw6epSgnPQeNp6/whralO4/zybQviUvyqt3z+z9CQQgZyY2T25mg/G
         JETYF1KttRrhjv8jwH8gEDaeecdTVKz7uaU/+Ac1ti1bSogncRq0Eogdq67vm2g5Zysy
         QYQ/WgsAT0ryqn4dtQ8/8AO7I4OBaS5JJQA8Bmj5H7aKiityzynr29U3tNfslw//BIlJ
         wjtM6FTd+O2AIqZgmew54Cm8XY+cuyK8SfV94Sy8eROgqHdg09hty9+1YGakTRocMM3N
         2u6T4hhZLkd4tsx9Nng1lUXKiplD4DGpixnssNW2R+01z++zzXjoXgelzKaDY4Ytm7Ng
         QU+w==
X-Gm-Message-State: ANoB5pn+P+IwQzqfhfNPC7Gr7udlxs+wb7ptJ7a1xQD95tpWtzgnboaf
	aYYcnNUW9P7WRU9O6XAGiw==
X-Google-Smtp-Source: AA0mqf6W/GBmEupGrcmRWBiGyu1SngWULZHScW7/4hei+ZTTdpIo3o2J+2Cu2gu2NAHj41OG+sJznA==
X-Received: by 2002:a05:6870:4b4c:b0:13c:c5bd:c311 with SMTP id ls12-20020a0568704b4c00b0013cc5bdc311mr2710756oab.108.1668626074869;
        Wed, 16 Nov 2022 11:14:34 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d5-20020a4aaa85000000b0049faebecee2sm338173oon.35.2022.11.16.11.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 11:14:34 -0800 (PST)
Received: (nullmailer pid 743580 invoked by uid 1000);
	Wed, 16 Nov 2022 19:14:36 -0000
Date: Wed, 16 Nov 2022 13:14:36 -0600
From: Rob Herring <robh@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Atish Patra <atishp@atishpatra.org>, Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/9] dt-bindings: Add RISC-V incoming MSI controller
 bindings
Message-ID: <20221116191436.GA576695-robh@kernel.org>
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
 <20221111044207.1478350-5-apatel@ventanamicro.com>
 <9be58cb4-4ee8-a6e0-7a0a-f2f581e394d3@linaro.org>
 <CAK9=C2X55CG6tjjiTPrecnnZZiwTOS1BSH3UTPa-fLBm38WdLA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2X55CG6tjjiTPrecnnZZiwTOS1BSH3UTPa-fLBm38WdLA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_111436_294063_10A65F7A 
X-CRM114-Status: GOOD (  31.86  )
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

On Mon, Nov 14, 2022 at 05:36:06PM +0530, Anup Patel wrote:
> On Mon, Nov 14, 2022 at 3:19 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 11/11/2022 05:42, Anup Patel wrote:
> > > We add DT bindings document for RISC-V incoming MSI controller (IMSIC)
> > > defined by the RISC-V advanced interrupt architecture (AIA) specification.
> > >
> > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > ---
> > >  .../interrupt-controller/riscv,imsic.yaml     | 174 ++++++++++++++++++
> > >  1 file changed, 174 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,imsic.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsic.yaml
> > > new file mode 100644
> > > index 000000000000..05106eb1955e
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsic.yaml
> > > @@ -0,0 +1,174 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/interrupt-controller/riscv,imsic.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: RISC-V Incoming MSI Controller (IMSIC)
> > > +
> > > +maintainers:
> > > +  - Anup Patel <anup@brainfault.org>
> > > +
> > > +description:
> > > +  The RISC-V advanced interrupt architecture (AIA) defines a per-CPU incoming
> > > +  MSI controller (IMSIC) for handling MSIs in a RISC-V platform. The RISC-V
> > > +  AIA specification can be found at https://github.com/riscv/riscv-aia.
> > > +
> > > +  The IMSIC is a per-CPU (or per-HART) device with separate interrupt file
> > > +  for each privilege level (machine or supervisor). The configuration of
> > > +  a IMSIC interrupt file is done using AIA CSRs and it also has a 4KB MMIO
> > > +  space to receive MSIs from devices. Each IMSIC interrupt file supports a
> > > +  fixed number of interrupt identities (to distinguish MSIs from devices)
> > > +  which is same for given privilege level across CPUs (or HARTs).
> > > +
> > > +  The arrangement of IMSIC interrupt files in MMIO space of a RISC-V platform
> > > +  follows a particular scheme defined by the RISC-V AIA specification. A IMSIC
> > > +  group is a set of IMSIC interrupt files co-located in MMIO space and we can
> > > +  have multiple IMSIC groups (i.e. clusters, sockets, chiplets, etc) in a
> > > +  RISC-V platform. The MSI target address of a IMSIC interrupt file at given
> > > +  privilege level (machine or supervisor) encodes group index, HART index,
> > > +  and guest index (shown below).
> > > +
> > > +  XLEN-1           >=24                                 12    0
> > > +  |                  |                                  |     |
> > > +  -------------------------------------------------------------
> > > +  |xxxxxx|Group Index|xxxxxxxxxxx|HART Index|Guest Index|  0  |
> > > +  -------------------------------------------------------------
> > > +
> > > +  The device tree of a RISC-V platform will have one IMSIC device tree node
> > > +  for each privilege level (machine or supervisor) which collectively describe
> > > +  IMSIC interrupt files at that privilege level across CPUs (or HARTs).
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/interrupt-controller.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - vendor,chip-imsics
> >
> > There is no such vendor... As Conor pointed out, this does not look
> > correct. Compatibles must be real and specific.
> 
> Previously, Rob had suggest to:
> 1) Mandate two compatible strings: one for implementation and
>     and second for specification
> 2) Since this is new specification with QEMU being the only
>     implementation, we add "vendor,chip-imsics" as dummy
>     implementation specific string for DT schema checkers
>     to pass the examples. Once we have an actual implementation,
>    we will replace this dummy string.

What will QEMU's DT use? That's an implementation we can and do run 
validation on. Your choices are define a QEMU specific compatible string 
or allow the fallback alone. I'm fine either way. With the latter, 
someone has to review that the fallback is not used alone in .dts files 
while doing the former allows the tools to check for you. It also 
encourages making every new difference a property rather than implied by 
compatible, but those should be caught in review.

If you go with the fallback only, just make it clear that it's for QEMU 
or s/w models only.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
