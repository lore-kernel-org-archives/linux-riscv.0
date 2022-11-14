Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D60C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 12:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RCHv1JIY+uNVWDWVapNTbYI3Ml75s2WPX5bQkb3Gu00=; b=ZP1gn2refx3TJ0
	OpFX/DkgGtv3JwMiFoBHZLXAQqJjQJ5eTXsNZTu8MJ8MlGL38ZHJn2XEf19zZ6Uo9Vcq2gAQtQD19
	9eCfROJSr59v9CIKNU00W9bl51VZv5oLcjg9LBqbXDBfHnz2YtFSJtcct4jMQc8pn8gZSnP4iiwHh
	YT7jGHmLe4TYFNcxtrnZrwQnRiJXTiHFj56BJCO8fcUXMA68fRk3QpjeiqS4U31ahr4ryHQ91u1QA
	wNN453B/cgArUES5M18zPV52rjAvP7rBgECZBOA4uuCokJtza6SQXIcV5dIXZG/JGYOv5LSAsBuSf
	Iu8FBy9FFdsBh8azbv8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouYMS-000joM-23; Mon, 14 Nov 2022 12:14:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouYMO-000jlt-GU
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 12:14:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668428085; x=1699964085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5x8kfOIpOogLr2BemNcIjIgxcyOCSCKqrEm0zBjiMTQ=;
  b=yjva59bUZfk7HY1qzOyCC0Bb7bsOtPQIc+MD4LwOuX3O7Q2w3Iuwe6RD
   dzkgeyTJTZlnAW3AE5XJi57lCEqWDGwTDRvCrvhVABk81rVGsEFqkWOe+
   G7MMYrObol+8XyJWhHpOUgOyg3lXkRvtWd1CTvZo8BMZWgvMMkLR/HR8e
   Jauy/Ul1JWuSG2/yuiF9vdjnyIabBIMzoqgGJGePBfCccaRMbq8aZzfPB
   lDJ1xHYYuBKqFa0WZ1bnSAVj4I4zVVALydZtbzP/IRsihCNwLOCfyQhe2
   fJ28JeEHbdvHponGxMdlbIZbtwL72kRJ1/lTVfhuhdJBT18V2qhXjcHd1
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="188868366"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Nov 2022 05:14:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 14 Nov 2022 05:14:38 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 14 Nov 2022 05:14:36 -0700
Date: Mon, 14 Nov 2022 12:14:19 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Anup Patel <apatel@ventanamicro.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas
 Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel
	<anup@brainfault.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 4/9] dt-bindings: Add RISC-V incoming MSI controller
 bindings
Message-ID: <Y3IxG4d7ELlcmp0c@wendy>
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
 <20221111044207.1478350-5-apatel@ventanamicro.com>
 <9be58cb4-4ee8-a6e0-7a0a-f2f581e394d3@linaro.org>
 <CAK9=C2X55CG6tjjiTPrecnnZZiwTOS1BSH3UTPa-fLBm38WdLA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2X55CG6tjjiTPrecnnZZiwTOS1BSH3UTPa-fLBm38WdLA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_041444_594977_04E4626F 
X-CRM114-Status: GOOD (  28.53  )
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
> 
> Refer, https://www.spinics.net/lists/devicetree/msg442720.html

AFAIU, <vendor> and <chip> are wildcards and do not have the same
meaning as vendor & chip. That's going off of the dt submitting patches
doc though and I don't know if the tooling supports this.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
