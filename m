Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A254AC369AB
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 12:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qQfS9Jo8Q6Q1qfG9AAJkMtIWZrX/BjA3Ft9ggOqSxlY=; b=SKeC4exPzUBJAV
	kxfrUxKg0q+84039iSqz7I8Zt48r+iMAcjUV32Jy5Jo0Mlm+4DD+Qyapoji9f3AbxOpWlSDY3YlLn
	NOAAp5BpUTC2cX+9FrgYmrm9sv1sfkekkwKzaESekPgyREFxkxPkLT+4GfTKMBWwJ8WxfJd5hzdtY
	iWg44daWaf8acGVMXngGv7PQf3/AeZ+q2AC/Uqkbb9n8Z9o2PjbVPADQC08rg9HqwrzXs6d0akRUX
	WNbWslQ8wgCdqwy5DiR54u009oShXsNFEwt9qJwe4ZZKJPrSitvy+pdce+WFVvDUj6brgpNigQwxa
	/p3+ibDCG/c9IMcXaFOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6q8o-00000004G0m-194s;
	Mon, 21 Apr 2025 12:20:50 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6q8Z-00000004Fzo-1nOl
	for linux-riscv@lists.infradead.org;
	Mon, 21 Apr 2025 12:20:37 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 53LCJT2d045671
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Mon, 21 Apr 2025 20:19:29 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from atctrx.andestech.com (10.0.15.11) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Apr
 2025 20:19:29 +0800
Date: Mon, 21 Apr 2025 20:19:29 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: Rob Herring <robh@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <paul.walmsley@sifive.com>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <tim609@andestech.com>
Subject: Re: [PATCH 4/9] dt-bindings: interrupt-controller: add Andes
 machine-level software interrupt controller
Message-ID: <aAY30QwzG6/7RWhE@atctrx.andestech.com>
References: <20250407104937.315783-1-ben717@andestech.com>
 <20250407104937.315783-5-ben717@andestech.com>
 <20250407141708.GA2250717-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407141708.GA2250717-robh@kernel.org>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-Originating-IP: [10.0.15.11]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 53LCJT2d045671
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_052035_781624_4702DD58 
X-CRM114-Status: GOOD (  22.45  )
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

On Mon, Apr 07, 2025 at 09:17:08AM -0500, Rob Herring wrote:
> [EXTERNAL MAIL]
> 
> On Mon, Apr 07, 2025 at 06:49:32PM +0800, Ben Zong-You Xie wrote:
> > Add the DT binding documentation for Andes machine-level software
> > interrupt controller.
> >
> > In the Andes platform such as QiLai SoC, the PLIC module is instantiated a
> > second time with all interrupt sources tied to zero as the software
> > interrupt controller (PLICSW). PLICSW can generate machine-level software
> > interrupts through programming its registers.
> >
> > Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> > ---
> >  .../andestech,plicsw.yaml                     | 48 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  2 files changed, 49 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml b/Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
> > new file mode 100644
> > index 000000000000..5432fcfd95ed
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
> > @@ -0,0 +1,48 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/andestech,plicsw.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Andes machine-level software interrupt controller
> > +
> > +description:
> > +  In the Andes platform such as QiLai SoC, the PLIC module is instantiated a
> > +  second time with all interrupt sources tied to zero as the software interrupt
> > +  controller (PLIC_SW). PLIC_SW can generate machine-level software interrupts
> > +  through programming its registers.
> > +
> > +maintainers:
> > +  - Ben Zong-You Xie <ben717@andestech.com>
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - andestech,qilai-plicsw
> > +      - const: andestech,plicsw
> 
> Drop the fallback. If you have another implementation that's compatible,
> then andestech,qilai-plicsw will be the fallback.
>

Hi Rob,

Maybe this is a stupid question, but I don't understand the reason for
dropping the fallback. I follow the same logic in commit 1267d9831171
(dt-bindings: interrupt-controller: sifive,plic: Document Renesas RZ/Five
SoC). Thus, I think if there is a new SoC also equipped with Andes
PLIC-SW (NCEPLIC100-SW), the SoC vendor can simply add a new compatible
string under the enum.

Also, I will rename andestech,plisw to andestech,nceplic100-sw if the
fallback string is not dropped.

Thanks,
Ben

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts-extended:
> > +    minItems: 1
> > +    maxItems: 15872
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts-extended
> > +
> > +examples:
> > +  - |
> > +    interrupt-controller@400000 {
> > +      compatible = "andestech,qilai-plicsw", "andestech,plicsw";
> > +      reg = <0x400000 0x400000>;
> > +      interrupts-extended = <&cpu0intc 3>,
> > +                            <&cpu1intc 3>,
> > +                            <&cpu2intc 3>,
> > +                            <&cpu3intc 3>;
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index a0ccac1cca29..645d7137cb07 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -20728,6 +20728,7 @@ F:    include/linux/irqchip/riscv-imsic.h
> >  RISC-V ANDES SoC Support
> >  M:   Ben Zong-You Xie <ben717@andestech.com>
> >  S:   Maintained
> > +F:   Documentation/devicetree/bindings/interrupt-controller/andestech,plicsw.yaml
> >  F:   Documentation/devicetree/bindings/riscv/andes.yaml
> >
> >  RISC-V ARCHITECTURE
> > --
> > 2.34.1
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
