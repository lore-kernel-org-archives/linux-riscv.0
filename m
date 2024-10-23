Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA59D2CE17
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2024 00:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qq0pXHruUb/Olc7Ddq+Tynnpy/lPjrfyUZjY2PDYS80=; b=MaH9GUQAz5PRz4
	AzLEAeRmrTs11U+FHwF38pLe1zOP1loqYstly9WHph9sQ3gweDajZyhbdGOtz+0Q2trLYZ3quAG9n
	lyrwOS6K5E+nWjVJt/EeblDMZplDo+pfezOpXYMVsvw6zn3aKIxuHIgqERLW+Qvqsqnb1Dy9bpa6r
	RfG4KqqYPtGWLiPPw9zCRkbH2PV/DnhVagJnLEKagp3NJpCyMNadC8suU2KLwVEms6B1m5NqM0anV
	oMOOn5cfXA+PMU9G2Vk9WsjS8Av9yIu7a2kx5l2fvGwDbZqlKu+qcSJYlKXLwGiyTVac+VArv2zRU
	3dT8tf6x30omkSASvS8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3PJS-0000000CWrX-45Xi;
	Wed, 23 Oct 2024 00:33:22 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3PHv-0000000CWeD-0kvQ;
	Wed, 23 Oct 2024 00:31:49 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-71e953f4e7cso4236447b3a.3;
        Tue, 22 Oct 2024 17:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729643506; x=1730248306; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TqoKRoP0trGpynhgqzBKYCwSQUSG9Om+dv3i8c0Nq6Q=;
        b=QniiCCHnN9FWC18R5Yb68WS+x0Fj6kAxWTbJkFyk37hMDyg5+6zCZC/dJVDJpwYxL/
         fDHI6iy1GVnaba9llAhSHi5Nv8/fuvRK7Mo06c8btkG7sJTaiHI5E7ybn6cdw16YwCvY
         a9YPOR4CNF92Cp4c2yUA8nwiMvuI/bzvHaXzVRls/IolU5E281T1cEkIkwKdfsGP3hht
         qWsGEdktPRBjlXFxPCoW93OFjFYSKIeFNrF/WGci/eYuP57Ed/rY6Kl03R+BQjl7Sm5a
         NCEZl3hZvqNlimseA9dn1x6xiU1PiIiXbTHnnUnXCd0JJ0yLlvl9q3nnhiLRWzDa/E8z
         XbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729643506; x=1730248306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqoKRoP0trGpynhgqzBKYCwSQUSG9Om+dv3i8c0Nq6Q=;
        b=kc/ZwUoNSoyCZhsCoPP9AhZqH4Umfgj89hZBXBJslgKPyOk1MGJoMjd0iPPyt4wA1x
         e8PtR4/IhH+co4GQcV/9KSZ2Rrtts5ZrsR2As7bo30zF1eCnng4vmG+D5+0ej06ypSUD
         ArooNa0W1aQyLabyEv/W6TiaLNGHu0eA9WX5Anll2CR35d7jWA18+0CQ1mI3Lh2zOhhx
         vtfpovitmcUCbsqrnycIMJcxatDWGowgZcZ9PdTku+Lu6Owv2qkE8jhsE5OYBSE7mBPg
         r2XIDPivHXPEUqZJBU/tu9IZwVUkJfaCT2tw271PGjg8aHM3z9Bhud6Kjrp+3q1jAUOX
         5kTw==
X-Forwarded-Encrypted: i=1; AJvYcCXDfx5NBY9XXuoK4fYI1vY7Qh5yFtOgbB54B5lHRe91C6ED8fEGZLr+BkW/qVMXY3xKaNUgITnBRR6q4lQMcyO6@lists.infradead.org, AJvYcCXLtMLuMDcH3aqPomhlnACqJHuZbOoPp8wNLC4o3BKrPTkbWgwHxVIQU/4kC4nRzITiw5XasHWqSCDKS4g=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyqd9CkYGbD2O6ALqEEtozQjOq89gWB2U0F7HwSLKWUd5wuA0C8
	TWlwpj2ekGqZWkciVnp7wqbRSHDzHPzvwVsDpIhWu42IB3mveaDK
X-Google-Smtp-Source: AGHT+IE/EmIUFDrkEnasULUT9TnLW0DMraLwPlJfZhNd8+1qE1ieaafFg/FIQckU5WrODA3aincEjg==
X-Received: by 2002:a05:6a00:9297:b0:71e:98a:b6b4 with SMTP id d2e1a72fcca58-72030babd9fmr1189730b3a.11.1729643504597;
        Tue, 22 Oct 2024 17:31:44 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeabda3b2sm5606574a12.83.2024.10.22.17.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 17:31:44 -0700 (PDT)
Date: Wed, 23 Oct 2024 08:31:24 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: net: Add support for Sophgo SG2044 dwmac
Message-ID: <yt2idyivivcxctosec3lwkjbmr4tmctbs4viefxsuqlsvihdeh@alya6g27625l>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-3-inochiama@gmail.com>
 <20241022-crisply-brute-45f98632ef78@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241022-crisply-brute-45f98632ef78@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_173147_265592_8495C5F1 
X-CRM114-Status: GOOD (  27.44  )
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

On Tue, Oct 22, 2024 at 06:28:06PM +0100, Conor Dooley wrote:
> On Mon, Oct 21, 2024 at 06:36:15PM +0800, Inochi Amaoto wrote:
> > The GMAC IP on SG2044 is almost a standard Synopsys DesignWare MAC
> > with some extra clock.
> > 
> > Add necessary compatible string for this device.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
> >  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 145 ++++++++++++++++++
> >  2 files changed, 146 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > index 3c4007cb65f8..69f6bb36970b 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -99,6 +99,7 @@ properties:
> >          - snps,dwmac-5.30a
> >          - snps,dwxgmac
> >          - snps,dwxgmac-2.10
> > +        - sophgo,sg2044-dwmac
> >          - starfive,jh7100-dwmac
> >          - starfive,jh7110-dwmac
> >  
> > diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > new file mode 100644
> > index 000000000000..93c41550b0b6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > @@ -0,0 +1,145 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/sophgo,sg2044-dwmac.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: StarFive JH7110 DWMAC glue layer
> > +
> > +maintainers:
> > +  - Inochi Amaoto <inochiama@gmail.com>
> > +
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - sophgo,sg2044-dwmac
> > +  required:
> > +    - compatible
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: sophgo,sg2044-dwmac
> > +      - const: snps,dwmac-5.30a
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: GMAC main clock
> > +      - description: PTP clock
> > +      - description: TX clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: stmmaceth
> > +      - const: ptp_ref
> > +      - const: tx
> > +
> > +  sophgo,syscon:
> 
> How many dwmac instances does the sg2044 have?
> 

Only one, there is another 100G dwxgmac instance, but it does not
use this syscon.

> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      - items:
> > +          - description: phandle to syscon that configures phy
> > +          - description: offset of phy mode register
> > +          - description: length of the phy mode register
> > +    description:
> > +      A phandle to syscon with two arguments that configure phy mode.
> > +      The argument one is the offset of phy mode register, the
> > +      argument two is the length of phy mode register.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - interrupt-names
> > +  - resets
> > +  - reset-names
> > +
> > +allOf:
> > +  - $ref: snps,dwmac.yaml#
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: sophgo,sg2044-dwmac
> 
> Why does this have to be applied conditionally? There's only one
> compatible in the binding, can't you apply these unconditionally?
> 
> 
> Cheers,
> Conor.
> 

I think it can apply it unconditionally. I will fix it.

Regards,
Inochi

> > +    then:
> > +      properties:
> > +        interrupts:
> > +          minItems: 1
> > +          maxItems: 1
> > +
> > +        interrupt-names:
> > +          minItems: 1
> > +          maxItems: 1
> > +
> > +        resets:
> > +          maxItems: 1
> > +
> > +        reset-names:
> > +          const: stmmaceth
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    ethernet@30006000 {
> > +      compatible = "sophgo,sg2044-dwmac", "snps,dwmac-5.30a";
> > +      reg = <0x30006000 0x4000>;
> > +      clocks = <&clk 151>, <&clk 152>, <&clk 154>;
> > +      clock-names = "stmmaceth", "ptp_ref", "tx";
> > +      interrupt-parent = <&intc>;
> > +      interrupts = <296 IRQ_TYPE_LEVEL_HIGH>;
> > +      interrupt-names = "macirq";
> > +      resets = <&rst 30>;
> > +      reset-names = "stmmaceth";
> > +      snps,multicast-filter-bins = <0>;
> > +      snps,perfect-filter-entries = <1>;
> > +      snps,aal;
> > +      snps,tso;
> > +      snps,txpbl = <32>;
> > +      snps,rxpbl = <32>;
> > +      snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
> > +      snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
> > +      snps,axi-config = <&gmac0_stmmac_axi_setup>;
> > +      status = "disabled";
> > +
> > +      gmac0_mtl_rx_setup: rx-queues-config {
> > +        snps,rx-queues-to-use = <8>;
> > +        snps,rx-sched-wsp;
> > +        queue0 {};
> > +        queue1 {};
> > +        queue2 {};
> > +        queue3 {};
> > +        queue4 {};
> > +        queue5 {};
> > +        queue6 {};
> > +        queue7 {};
> > +      };
> > +
> > +      gmac0_mtl_tx_setup: tx-queues-config {
> > +        snps,tx-queues-to-use = <8>;
> > +        queue0 {};
> > +        queue1 {};
> > +        queue2 {};
> > +        queue3 {};
> > +        queue4 {};
> > +        queue5 {};
> > +        queue6 {};
> > +        queue7 {};
> > +      };
> > +
> > +      gmac0_stmmac_axi_setup: stmmac-axi-config {
> > +        snps,blen = <16 8 4 0 0 0 0>;
> > +        snps,wr_osr_lmt = <1>;
> > +        snps,rd_osr_lmt = <2>;
> > +      };
> > +    };
> > -- 
> > 2.47.0
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
