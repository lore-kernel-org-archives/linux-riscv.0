Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F5EC021A4
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 23:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qXWZpT7tzMz3IsIg7otGb+i8mfRpmNpUpv78wjPdQ5g=; b=sy5tf1T5EZIGtg
	nUZIpJX444n74Gv3cLzukeclDxqRB9nw0fpJKuUmvbVVAGvam6nxB9YD2wTKH8lwPBTuh9AzBahlq
	OoGPPpNssCAM1aAd09umrLRBFrWaxGGrLDfQpjIXgGHtwsIeybVVunYmUusja1SWZkswbdoxxhZpT
	fn2zCCC+2rKNJ4ts+TgKEHC58lZK8F5qPEQ+R1urVwkvCXKJyDKBUGBE/59j2Cm3fAkzNXde01tEv
	uUZb7S4s83RscrF6HS2XFrIMIx0/JQYYUL64o6UH51V2DVY930t4WGI9+keZB663sxMm9t2dJja4V
	Fz+PEEt8EOctDu1ZtaYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmiCQ-0000000FXMY-1nrz;
	Mon, 24 Feb 2025 23:49:22 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmiCN-0000000FXLd-0iEH
	for linux-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 23:49:20 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7c0818add57so517913885a.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Feb 2025 15:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740440958; x=1741045758; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EpFPdCKOOzYGkmZbz8KYm8xS5nu6X4mus1CxiMy3hoo=;
        b=CTbZ7zEfu7FYdYCgFFj/T9cX1d7DCifzYIXbLC/RiwZjn2FW05+J/xB2u6/1Gi6rnh
         Jlo39kxUhVgOHSzMUtPaTdh9CggOcMhgyfXSecBqPlO0cylfumDkQd+/tvKeHZQqOtUf
         6VVaPqtlZTdm/kfNUOVrXZzdHxMlu9XSZ0irjBxUbhlVBFxbM/hpnXUywpP0TLStKuuh
         hWaJPWlWWXtiu/l/QwqqT0XXyAfzYpP8xdJPIRJNs491oU6xL1/LM0Zx47h1HFC5hOOW
         ewfzf2coEl0u7lQ7Nc+aVp2pO/qpXjWaanPp+w5PMDXQssoNwU3D0/UtjPexBvSFnsk6
         Bhog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740440958; x=1741045758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpFPdCKOOzYGkmZbz8KYm8xS5nu6X4mus1CxiMy3hoo=;
        b=e4KjXDhCMX1HjIg31/CfhhkTiZr7qe8lhl2ZE2U1q7FytEyQDvhloOJT5cyGQleG2+
         Hq2viSTiF7oGt/GITfJU3Gk34DEl/GcklkuC+9Qk1pBESVAMfRiYb2WA+sqLcGlGTy14
         XVNa4LglDLdzrIRLy6cclwVjjpyDq+I8V1OgoBWNaokzrNxf15SVtdPGdw2qw5GIVlQi
         MFJa7xIjZZRLPslb1PRIZgPQO+UnsJ9j3ApPI7PyiB9TnT2bAmwv0mif3e86WPUjeFhV
         JOqiaSS1I3vhTNa+VVtTVdjq4RYAFvNDLRGFFlevZ0b/Mj/XvyPlVprU4LbHBkvFOE8X
         qJAg==
X-Forwarded-Encrypted: i=1; AJvYcCXMEyBKJPWIPFYAc+VMBv/FzYNeovqkHQK8nWYVcpNaS+MED8zHJpElqXrWyChe2s1SF0CVcP5Pkaukfg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxA1zNEg1I3u5L5Q26L6KnHBXvrfKf5NMlo3phdTXHx4KpecwhL
	RJgP884NV7osQuSHsZJsKZt2u7lyjeYDKYDJ8bfwsPFQUAvMIgXa
X-Gm-Gg: ASbGncsIs3VQvidfnVswQDwb9+Yz6sAdiuOk71JRePBdBOdZ2GjBhmXywP9McbJHY75
	qktWtZOWm5n9S39TxOmJh6Aw2riQKszD1Q8LeVD5WCNn5cSMNQKlVb1IoORp2Pf4aA+gATI54bH
	ZFyWMUcvqBCoGkSx173BN/0yiJA3p10IX4e/GbD+RvH3oTrS0tl2xLktBxhe3CMknNo+KxSzNYc
	nFtGV5YBq/+sBRN4MtRagqsPezbfTMS8zuOqvGeLKzHUgf9iha3axl3ue8pIJ1GV6R2VI13D+d8
	xw==
X-Google-Smtp-Source: AGHT+IEb4O7bqSxdD9PsVnrPdjDODk+0ZRgqEenGZhUD0ccL6Bcsf2l6qeul83BCvsR9I1s84A5TWw==
X-Received: by 2002:a05:620a:1a1c:b0:7c0:c024:af with SMTP id af79cd13be357-7c0cf8e622cmr1919031285a.26.1740440957990;
        Mon, 24 Feb 2025 15:49:17 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c23c2c514asm36530985a.64.2025.02.24.15.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 15:49:17 -0800 (PST)
Date: Tue, 25 Feb 2025 07:48:59 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Niklas Cassel <cassel@kernel.org>, 
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pci: Add Sophgo SG2044 PCIe host
Message-ID: <7ht3djv7zgrbkcvmdg6tp62nmxytlxzhaprsuvyeshyojhochn@ignvymxb3vfa>
References: <20250221013758.370936-1-inochiama@gmail.com>
 <20250221013758.370936-2-inochiama@gmail.com>
 <20250221-cavalier-cramp-6235d4348013@spud>
 <2egxw3r63cbsygpwqaltp4jjlkuwoh4rkwpgv4haj4sgz5sked@vkotadyk4g6y>
 <20250224-enable-progress-e3a47fdb625c@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250224-enable-progress-e3a47fdb625c@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_154919_209647_DB8ECCE9 
X-CRM114-Status: GOOD (  26.48  )
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

On Mon, Feb 24, 2025 at 06:54:51PM +0000, Conor Dooley wrote:
> On Sat, Feb 22, 2025 at 08:34:10AM +0800, Inochi Amaoto wrote:
> > On Fri, Feb 21, 2025 at 05:01:41PM +0000, Conor Dooley wrote:
> > > On Fri, Feb 21, 2025 at 09:37:55AM +0800, Inochi Amaoto wrote:
> > > > The pcie controller on the SG2044 is designware based with
> > > > custom app registers.
> > > > 
> > > > Add binding document for SG2044 PCIe host controller.
> > > > 
> > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > ---
> > > >  .../bindings/pci/sophgo,sg2044-pcie.yaml      | 125 ++++++++++++++++++
> > > >  1 file changed, 125 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > new file mode 100644
> > > > index 000000000000..040dabe905e0
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > @@ -0,0 +1,125 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/pci/sophgo,sg2044-pcie.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: DesignWare based PCIe Root Complex controller on Sophgo SoCs
> > > > +
> > > > +maintainers:
> > > > +  - Inochi Amaoto <inochiama@gmail.com>
> > > > +
> > > > +description: |+
> > > > +  SG2044 SoC PCIe Root Complex controller is based on the Synopsys DesignWare
> > > > +  PCIe IP and thus inherits all the common properties defined in
> > > > +  snps,dw-pcie.yaml.
> > > > +
> > > > +allOf:
> > > > +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> > > > +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: sophgo,sg2044-pcie
> > > > +
> > > > +  reg:
> > > > +    items:
> > > > +      - description: Data Bus Interface (DBI) registers
> > > > +      - description: iATU registers
> > > > +      - description: Config registers
> > > > +      - description: Sophgo designed configuration registers
> > > > +
> > > > +  reg-names:
> > > > +    items:
> > > > +      - const: dbi
> > > > +      - const: atu
> > > > +      - const: config
> > > > +      - const: app
> > > > +
> > > > +  clocks:
> > > > +    items:
> > > > +      - description: core clk
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: core
> > > > +
> > > > +  dma-coherent: true
> > > 
> > > Why's this here? RISC-V is dma-coherent by default, with dma-noncoherent
> > > used to indicate systems/devices that are not.
> > 
> > The PCIe is dma coherent, but the SoC itself is marked as
> > dma-noncoherent.
> 
> By "the SoC itself", do you mean that the bus that this device is on is
> marked as dma-noncoherent? 

Yeah, I was told only PCIe device on SG2044 is dma coherent.
The others are not.

> IMO, that should not be done if there are devices on it that are coherent.
> 

It is OK for me. But I wonder how to handle the non coherent device
in DT? Just Mark the bus coherent and mark all devices except the
PCIe device non coherent?

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
