Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25175CEACF3
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 19:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QfsNlslsEAzu8lB3gHglak6oxGPpzQJ5+l6oipWMmlQ=; b=kwMtKsoczFldMl
	YptQNbCKaANqW4c9NNgs2n6tRYbpQkQs0ZsaJlS/mzs6t5bJNYhv3vdFUReBt8fejkuPfi9II2QEF
	Ta9jqVfVrSCiK17FtR0suz+nkVcMopQjmjbuAR87ARxzuw2PnJVqHQsgoPjckjw+HxHGNcWA2wlCF
	hP7Gm3Hd2Z7WP7jlWrhiuKPsQe4P3hjCmiuIoC3/RhSIjM90ARKcOX2MlFe7d9FZvSX1AiYqwTsTa
	bLASubVxQOhkJ4vS3wDB4RytHxLWFhfa5+VO7i3++/HoTdXkungAaY/xY7MzaAuYOhT8278onUlHQ
	b7WrGQhnYP2nqgq4IWXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw4hl-00000007HCF-2JmY;
	Wed, 02 Oct 2024 19:08:09 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw4hi-00000007HBV-2Hb7
	for linux-riscv@lists.infradead.org;
	Wed, 02 Oct 2024 19:08:08 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-71b0d9535c0so160784b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Oct 2024 12:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727896085; x=1728500885; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tbzyW+sDRRpK6lllKWMpnmvz5XjrJna/bWot+7sx8DY=;
        b=OGfuM/UA8PyiAlammRlG5eYTxLpfTQN85hbCYngPNwMRgOqzN3Lx71maCJs45+2Vrk
         DC+MueOqz/aVUrsJE80hd0ZtzxYsIsr0zq1yRd7UX2Ont6/V42c6lhvosjHbpw78Zvu4
         DghPgcGW1aeiQmpXIF7yD2vALU5VkQzfiYQidSw/GfAyIYe/P3tnXuTSpiAZWK23dy1O
         cC3f1S2SwGQT/mvjrBW+fe4/2BJ91owotX7hPMrONgbWpuO4YeXthYmABNQ8ZVKLL5q6
         iiHzFfodq/Fv7Ea38OFK4gUizfcO2kHsmJTX60ksNRseRBZ28HjhrFj9991wOgJD3QKe
         z0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727896085; x=1728500885;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbzyW+sDRRpK6lllKWMpnmvz5XjrJna/bWot+7sx8DY=;
        b=eJd/Ji2jPBVGXAfxWNhek5klN+kx7atGMsI9G4vwFn80Agk/QrTnbq3DvdZtDfMPb3
         DqGs5GdzhVxyO+CIZnh8qzDBwfd1KhO9MRa9hkkI+3lZ0xBAwU93bam2rLyCLpLaeCKx
         PG8CMaKb+sg6CyXiy75WS9ifKK0XUlgPwSLfBPZ9ueSew6VANF+FzKRX5ZZY8THbKTPm
         lYDgvMTRRXA/IZ81v6BZzVWgKzJvmkRGRQkYInbResjb1Mqgb/lt6l2zbjhUOTckZlJx
         49NMR83aFMRTfJo+BwwLJgnlBtpKGdGLLQpUUCfbKNUBV/C7ZHBRpUUF7/K5NR3kIqXP
         Yq3A==
X-Forwarded-Encrypted: i=1; AJvYcCXlGY+SX8H1fGnBByrwmwfEAngdlDGx0VehKaaGUzUDD38/FPdrNXwk8tgrjY/68tDiTLXeJT+uw/tyhw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZEOqe451h8unyaXfUZ7CV2uZ21wCCNZFvlIH8h7gbgn4iPTvc
	fdHi/DYKjmqhxQ8ndRBBam17nxwLGsbK/0Z7+t3KpTIxzE8B5ynsaBzO007bOpY=
X-Google-Smtp-Source: AGHT+IH49FhVG/FdEKe1agvTPQLbvm7ADyJ5gNkLx0OIeHvevotL/dXZ9AxuAJmFkwusxbmdI1wPKg==
X-Received: by 2002:a05:6a00:c84:b0:718:e162:7374 with SMTP id d2e1a72fcca58-71dc5c4dc5emr6364786b3a.5.1727896085209;
        Wed, 02 Oct 2024 12:08:05 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b265388besm10120808b3a.209.2024.10.02.12.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 12:08:04 -0700 (PDT)
Date: Wed, 2 Oct 2024 12:08:03 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: net: Add T-HEAD dwmac support
Message-ID: <Zv2aE7jmE2awLwcl@x1>
References: <20240930-th1520-dwmac-v3-0-ae3e03c225ab@tenstorrent.com>
 <20240930-th1520-dwmac-v3-1-ae3e03c225ab@tenstorrent.com>
 <wtknsih2yrbylqzanp6k753kklk4myf6iezjz6swnp4nsqr2hl@7mmm6lxhqemu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <wtknsih2yrbylqzanp6k753kklk4myf6iezjz6swnp4nsqr2hl@7mmm6lxhqemu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_120806_614889_208680E1 
X-CRM114-Status: GOOD (  27.80  )
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

On Tue, Oct 01, 2024 at 08:58:34AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Sep 30, 2024 at 11:23:24PM -0700, Drew Fustini wrote:
> > From: Jisheng Zhang <jszhang@kernel.org>
> > 
> > Add documentation to describe the DesginWare-based GMAC controllers in
> > the T-HEAD TH1520 SoC.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > [drew: rename compatible, add apb registers as second reg of gmac node]
> > Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml        |  1 +
> >  .../devicetree/bindings/net/thead,th1520-gmac.yaml | 97 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  1 +
> >  3 files changed, 99 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > index 4e2ba1bf788c..474ade185033 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -99,6 +99,7 @@ properties:
> >          - snps,dwxgmac-2.10
> >          - starfive,jh7100-dwmac
> >          - starfive,jh7110-dwmac
> > +        - thead,th1520-gmac
> >  
> >    reg:
> >      minItems: 1
> > diff --git a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
> > new file mode 100644
> > index 000000000000..fef1810b10c4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
> > @@ -0,0 +1,97 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/thead,th1520-gmac.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: T-HEAD TH1520 GMAC Ethernet controller
> > +
> > +maintainers:
> > +  - Drew Fustini <dfustini@tenstorrent.com>
> > +
> > +description: |
> > +  The TH1520 GMAC is described in the TH1520 Peripheral Interface User Manual
> > +  https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
> > +
> > +  Features include
> > +    - Compliant with IEEE802.3 Specification
> > +    - IEEE 1588-2008 standard for precision networked clock synchronization
> > +    - Supports 10/100/1000Mbps data transfer rate
> > +    - Supports RGMII/MII interface
> > +    - Preamble and start of frame data (SFD) insertion in Transmit path
> > +    - Preamble and SFD deletion in the Receive path
> > +    - Automatic CRC and pad generation options for receive frames
> > +    - MDIO master interface for PHY device configuration and management
> > +
> > +  The GMAC Registers consists of two parts
> > +    - APB registers are used to configure clock frequency/clock enable/clock
> > +      direction/PHY interface type.
> > +    - AHB registers are use to configure GMAC core (DesignWare Core part).
> > +      GMAC core register consists of DMA registers and GMAC registers.
> > +
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - thead,th1520-gmac
> > +  required:
> > +    - compatible
> > +
> > +allOf:
> > +  - $ref: snps,dwmac.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - thead,th1520-gmac
> > +      - const: snps,dwmac-3.70a
> > +
> > +  reg:
> > +    items:
> > +      - description: DesignWare GMAC IP core registers
> > +      - description: GMAC APB registers
> > +
> > +  reg-names:
> > +    items:
> > +      - const: dwmac
> > +      - const: apb
> 
> I don't get why none of snps,dwmac properties are restricted. How many
> interrupts do you have here? How many clocks? resets?

Thanks for pointing this out. Yes, I forgot to document the clocks,
interrupts and resets.

There needs to be 2 clocks (stmmaceth and pclk). There also needs to be
2 resets: each GMAC has a reset plus a seperate reset for the GMAC AXI
interface. There is 1 interrupt (macirq) but it is optional. The BeagleV
Ahead uses it but the LicheePi 4A does not use the interrupt.

However, I'm uncertain about how to restrict the snps,dwmac properties.

I see that starfive,jh7110-dwmac.yaml has the following logic. Should I
be adding something like this to restrict the snps,dwmac properties?

---------------------------------------------------------------------
allOf:
  - $ref: snps,dwmac.yaml#

  - if:
      properties:
        compatible:
          contains:
            const: starfive,jh7100-dwmac
    then:
      properties:
        interrupts:
          minItems: 2
          maxItems: 2

        interrupt-names:
          minItems: 2
          maxItems: 2

        resets:
          maxItems: 1

        reset-names:
          const: ahb
<snip>
---------------------------------------------------------------------
> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> 
> Drop

Will do.

> 
> > +  - interrupt-names
> 
> Drop

Will do.

> 
> > +  - phy-mode
> > +
> > +unevaluatedProperties: false
> 
> Best regards,
> Krzysztof

Thanks for your review,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
