Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0391CC43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 01:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XR1OezFog7jJTCdjKNR4QoTkpwnXAMr3RDIIGvpH3ww=; b=tru5KeXenfCreF
	skrBK1VlCCojF/SqyNvGHHC8YPzlgT9uKe38+LnaP7iz27tSXzHyVCJnh1gy+aFvIfAqiqCEgA2gp
	ybangaMtyQIlJeUQaBxixRo4XJccvU3+813VYQNVx/JBSR5Grp6mzOvqgGPtWPe00qegc76Xdt+hu
	vFEo0dtgOOPqBPCu/qC7ZU3yOc7QA/xat40vU1tP74ljIgTygx2vdMII27Yv+cCkObbtMJIto3qN1
	kJPbA3eHOx4iE17ZxphKOSgay0dnqCqHxS7PidkXldz/wKltzF1eqxfgxvAsia9jzIYK4/co+peUw
	envTqVUM4GZa+kVJeEeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfT49-00000005qPR-3igj;
	Fri, 03 Jul 2026 01:51:41 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfT47-00000005qOf-3LHW
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 01:51:41 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8423f236418so31693b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jul 2026 18:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783043499; x=1783648299; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uucYeY9/tilSu22+Lvc2ys3l48BWNkemNgiDbDRjkc8=;
        b=qXkuBMyWjPbiqcAn19nzzCwNHoFQg2mH/WZ4MK5PEFmO/skaBgaswX83vU69BQY4/S
         AyKEKOoVC4FlSQqJXKiUt+e49VyXbAXq3zLeT6qSminixq2g+Eo7L0I3uP+Xuu2OpBac
         ycHVRCnpqERy/R40Qb5Kr2LFeW4TFhwoQfCGjbRIr4LBJYylizxMmfcDOQE9xcAu5JD6
         gZ0asy7AgNxBbEibiG1OET5np243xknuvvl3FJWzLDl7kkvn9myMob5yr7VFC3lwrIsK
         xH6SvKCH5MhI6XBzIqa1n8tVvP335kXTu1pnExqjYLqaOHaIjHxfDiRRdYUBz3Pm6r6s
         lEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783043499; x=1783648299;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uucYeY9/tilSu22+Lvc2ys3l48BWNkemNgiDbDRjkc8=;
        b=nYS8YoBvMJMy6Xv0+/R3Or+f0Eu+J/VhxHm1bCF492MfuK+8wRas/jjn0WXAo9VIge
         h9yeRKM6Ncfl7O39TKa8cv0FZcrn3eLVazGcTzSvLmZk3A0CRMzjP0xH/q9scWDb5vG1
         AZi6x1Rblyv98902wVyk6nMU21wEphyuTTG4z1pLs/8h1gi4ULGVyjTeHRmtxXEdD+OQ
         vyRK/eNH6wcxN8g2zJn+gAH9Qv1ODuKFk3apjqfCY2gdutIH5c01jTQW+Co/g/PKfB4L
         jBWmjj+M+PnRXcSRUyZa0Jex8FoMSlj1er+c76Nnyk5ZalbjNBIn6PbNYaBpd4IohBeg
         EptA==
X-Forwarded-Encrypted: i=1; AFNElJ/+fHYdG4F0xLUJqC2ASGyxysfPEv7Cb3Yy5VNabmy8h0uRnjwveufoApQY/3nhwH8YS/i9+CRKNhRERQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3oa/sUtutaNXiD4kkJNQ/vfsZ80+tqNluODNideWbfhUUpQ7a
	3M3XgNaABqPC5TUd/ZgiMa0Al9CV1jnJ7t/IRu/xw50dqXGbCzwyMMMBomgHsg==
X-Gm-Gg: AfdE7ckjD1qxVmG1K6sRz9VB6GPAbH7VwQvXnAmgNh3UJtXrcKSARo1BKrHOYzzyWGq
	dviVIz6kS3jrjRXNhnGZWxH3IxycOcjxBf8x3fzHGOBnLYBUiprSVOUKpxEQDHoimXLrTSpOiLC
	IkqI3rjcZ54ta3nvjNAIYNEhzIQOfkMMiBQqJPIwXCCEo53JUfk2GRMVpQScK5LM0CD8stNBo7i
	VgNyXVXmouQ+AfBF2xzgJlI357t0Qi/AwAmOVKi81wGd5VC+m8OXgi1KZ8yaK2hSHdRPrukmVfF
	5I3rp9c0WE1ni5X8iewpd7YWkFudQlaoSnpDHOu3Mzm3fwrIErlXTAjmpqv200N7TgZWXZo5diU
	Vxo1q6ISNdtn6Q/isms25qGj9jKI4e94asHfz6L+xRabRzqM5GlN+SgeDPrAkCdXTlGQuMSbh52
	w=
X-Received: by 2002:a05:6a00:4388:b0:847:1013:f8e0 with SMTP id d2e1a72fcca58-847c4ffbc14mr7392325b3a.7.1783043498765;
        Thu, 02 Jul 2026 18:51:38 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb9d80c0sm2123471b3a.54.2026.07.02.18.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 18:51:38 -0700 (PDT)
Date: Fri, 3 Jul 2026 09:51:08 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alex Elder <elder@riscstar.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Christian Bruel <christian.bruel@foss.st.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Senchuan Zhang <zhangsenchuan@eswincomputing.com>, 
	Nam Cao <namcao@linutronix.de>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Randolph Lin <randolph@andestech.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Vidya Sagar <vidyas@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 4/5] dt-bindings: PCI: spacemit: Introduce Spacemit K3
 PCIe host controller
Message-ID: <akcVSzsJmLs-YNRG@inochi.infowork>
References: <20260517014841.254085-1-inochiama@gmail.com>
 <20260517014841.254085-5-inochiama@gmail.com>
 <kwan2ci7umcckod2623tt2ebwaz6v7ypczz3bqmhfxc6awrkfc@jrjf73wzehcc>
 <8010bb91-77e1-42b4-9f19-d9e70e385d00@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8010bb91-77e1-42b4-9f19-d9e70e385d00@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_185139_846463_56C87F48 
X-CRM114-Status: GOOD (  33.51  )
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

On Tue, Jun 09, 2026 at 11:11:20AM -0500, Alex Elder wrote:
> On 6/9/26 9:03 AM, Manivannan Sadhasivam wrote:
> > On Sun, May 17, 2026 at 09:48:39AM +0800, Inochi Amaoto wrote:
> > > Add binding support for the PCIe controller on the SpacemiT K3 SoC.
> > > This controller is almost a standard Synopsys DesignWare PCIe IP,
> > > with some extra link and reset state control.
> > > 
> > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > 
> > Why can't you reuse the existing spacemit,k1-pcie-host.yaml binding? I see very
> > few differences which could be added using conditionals. Also, this binding
> > defines the PHY property in the controller node, which is a way backwards as we
> > now prefer to define these in Root Port node as spacemit,k1-pcie-host.yaml does.
> 
> I agree.  I have another couple of comments below, including several
> things that just point out what's the same and what's different.
> 
> 					-Alex
> 

A good caught, I have confirmed, they share the same topology so it can
be reused.

Regards,
Inochi

> > 
> > - Mani
> > 
> > > ---
> > >   .../bindings/pci/spacemit,k3-pcie-host.yaml   | 135 ++++++++++++++++++
> > >   1 file changed, 135 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
> > > new file mode 100644
> > > index 000000000000..46147a37a9ce
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
> > > @@ -0,0 +1,135 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/pci/spacemit,k3-pcie-host.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: SpacemiT K3 PCI Express Host Controller
> > > +
> > > +maintainers:
> > > +  - Inochi Amaoto <inochiama@gmail.com>
> 
> If you would like to maintain the (common) SpacemiT K1 host
> controller binding I'd be OK with that.
> 
> > > +
> > > +description:
> > > +  The SpacemiT K3 SoC PCIe host controller is based on the Synopsys
> > > +  DesignWare PCIe IP. The controller uses the external MSI interrupt
> > > +  controller.
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> > > +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: spacemit,k3-pcie
> > > +
> > > +  reg:
> > > +    items:
> > > +      - description: DesignWare PCIe registers
> > > +      - description: Data Bus Interface (DBI) shadow registers
> 
> The above is new (different from K1), as is "dbi2" as its name.
> 
> > > +      - description: ATU address space
> > > +      - description: PCIe configuration space
> > > +      - description: Link control registers
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: dbi
> > > +      - const: dbi2
> > > +      - const: atu
> > > +      - const: config
> > > +      - const: link
> > > +
> > > +  clocks:
> 
> Clocks and resets are the same as K1.
> 
> > > +    items:
> > > +      - description: DWC PCIe Data Bus Interface (DBI) clock
> > > +      - description: DWC PCIe application AXI-bus master interface clock
> > > +      - description: DWC PCIe application AXI-bus slave interface clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: dbi
> > > +      - const: mstr
> > > +      - const: slv
> > > +
> > > +  resets:
> > > +    items:
> > > +      - description: DWC PCIe Data Bus Interface (DBI) reset
> > > +      - description: DWC PCIe application AXI-bus master interface reset
> > > +      - description: DWC PCIe application AXI-bus slave interface reset
> > > +
> > > +  reset-names:
> > > +    items:
> > > +      - const: dbi
> > > +      - const: mstr
> > > +      - const: slv
> > > +
> > > +  msi-parent: true
> 
> msi-parent and phys are not present in the K1 binding.
> 
> > > +
> > > +  phys:
> > > +    description:
> > > +      PHY phandle from the Combo PHY, the lane number does not depends
> > > +      on this, since the number of lanes provided by Combo PHY can be
> > > +      1 or 2.
> > > +    minItems: 1
> > > +    maxItems: 6
> > > +
> > > +  phy-names:
> > > +    minItems: 1
> > > +    maxItems: 6
> > > +
> 
> The following property is the same as K1.
> 
> > > +  spacemit,apmu:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > > +    description:
> > > +      A phandle that refers to the APMU system controller, whose regmap is
> > > +      used in managing resets and link state, along with and offset of its
> > > +      reset control register.
> > > +    items:
> > > +      - items:
> > > +          - description: phandle to APMU system controller
> > > +          - description: register offset
> > > +
> > > +required:
> > > +  - clocks
> > > +  - clock-names
> > > +  - resets
> > > +  - reset-names
> > > +  - msi-parent
> > > +  - spacemit,apmu
> > > +
> > > +unevaluatedProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +
> > > +    soc {
> > > +      #address-cells = <2>;
> > > +      #size-cells = <2>;
> > > +
> > > +      pcie@80000000 {
> > > +        compatible = "spacemit,k3-pcie";
> > > +        reg = <0x0  0x80000000 0x0 0x00001000>,
> > > +              <0x0  0x80100000 0x0 0x00001000>,
> > > +              <0x0  0x80300000 0x0 0x00003f20>,
> > > +              <0x11 0x00000000 0x0 0x00010000>,
> > > +              <0x0  0x82900000 0x0 0x00001000>;
> > > +        reg-names = "dbi", "dbi2", "atu", "config", "link";
> > > +        device_type = "pci";
> > > +        #address-cells = <3>;
> > > +        #size-cells = <2>;
> > > +        clocks = <&syscon_apmu 89>,
> > > +                 <&syscon_apmu 56>,
> > > +                 <&syscon_apmu 57>;
> > > +        clock-names = "dbi", "mstr", "slv";
> > > +        msi-parent = <&simsic>;
> > > +        ranges = <0x01000000 0x00 0x00010000 0x11 0x00010000 0x0 0x00100000>,
> > > +                 <0x02000000 0x0  0x00110000 0x11 0x00110000 0x0 0x7fef0000>,
> > > +                 <0x43000000 0x18 0x00000000 0x18 0x00000000 0x1 0x00000000>;
> > > +        resets = <&syscon_apmu 76>,
> > > +                 <&syscon_apmu 78>,
> > > +                 <&syscon_apmu 77>;
> > > +        reset-names = "dbi", "mstr", "slv";
> > > +        linux,pci-domain = <0>;
> > > +        spacemit,apmu = <&syscon_apmu 0x1f0>;
> > > +      };
> > > +    };
> > > +
> > > -- 
> > > 2.54.0
> > > 
> > 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
