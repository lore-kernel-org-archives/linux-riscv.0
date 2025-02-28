Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561DBC19776
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 09:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0LtqHZnEs0WCNbqoFfHIDWaB/pkjf4eiG8pcUqZrqiQ=; b=OrdZYxFNh4NLCk
	/RswoIQwDq64F3fYtRyp7G6tfPEikIruKA8FyzWxg3oF025i9OpTveWKR4rMx71Yt0VOpDhP9G0fc
	0dvBUhcXZlRt9OzVEGDdNHBxCJ6JejNgc8LDQj+COH1/ev4fJQ/bLtXyC9UFKE0Y7yzpH9eAxpbLw
	trMBaCBpzq1KKVqY/MBMzK1+sdkM6FFHbXn5BwUA20y812U25vVBzyYQng/UvLq0Fy7kykDSfB9ef
	Eka/WQj3Cp8Dg142Kx5r2P1xEXK38Kh+OyWj6CvgZO4fGawqbqNbJPd/irzYLe8L6grcDYPmXCv3L
	bKmqyxV/l+bzefjtHVMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnwYC-0000000AL6d-08gm;
	Fri, 28 Feb 2025 09:20:56 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnwY8-0000000AL5Y-2dvv
	for linux-riscv@lists.infradead.org;
	Fri, 28 Feb 2025 09:20:53 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7c0ba89dda9so195471985a.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Feb 2025 01:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740734451; x=1741339251; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dSPWzRvDH6bTdwnRoGnWYj88h3YoRDAMeqRglP+0iQ8=;
        b=N++HDCezeLcS9XDsmEUfrQNixNwG6d6LOVroshiHDa4kv2J3KG4c6v7mBrhX0dWdaP
         Fe95gjMwmwt2ZapLwlf02gLoOMQV9JY529IT3mU1/BPQzHi3YCTRtXC86ZLzCXlrtphu
         XJ2z3JsEYj1Y/H6euxjJR8cbSz/WPnfAASyyR0fuFNC0fBo8ZuUPOAafGYOT6pxnkGZg
         0c8ZgoBCKsgSmQNBzloRKnuE3lgEee5xTxOaz5bJCG9IgSH5CzekPNFF/VUBTh/wo5G1
         /1mVX949w8izcyORhswHbaRVhvxQ+/YlA9d32gsT0+bLHeg3GZ4yQ6Cp7uYcFa2fGxtv
         o89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740734451; x=1741339251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dSPWzRvDH6bTdwnRoGnWYj88h3YoRDAMeqRglP+0iQ8=;
        b=GxdCISEqLJTHmCjqgszsGLpH7s29JqoPhXSK3gEa6KTBcIhKY2jVNMJ5LYLE7eGYJu
         C2NIjU1aay2mE16Hzx2UO/HLulGlx2xzr7CAcDNfB6e4EXNlJeA1OeRdEg4LehiQc4NJ
         XjbPZzHrGsDXJjUUEHmbGhUb00LWcSPqNEqQjWUcebcvsJvO0jLfFDSMkc8sgVbyiOZC
         hC9zSWYKBM4tpEkW2qpAhenVyjC9CaTQT/gU8Zu6puwUmTJboHjxDFJEguQ6813MP5Rp
         ukO/Unpi1oZ/N3ORBFBVOOMvaI5uGaleq1imgvxfxJ75k4cem/rSmumvSC/EGcxAlX8J
         uOfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNmNU2wOsNOG/yHDGF7OSGsAAxyr2B/fa0Ql8Vd5ouCHv9GA6IhEb98dpyUGSL5omKg8Plv1FGAAB26Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YziTTePP+knFlSd5S21VynIWFLExfi/eHBRIa5M/CX0w5+/5i9e
	+j4c/FieTwRRAmc0f0+A08TBBkjvAEdFNJ1S6Of3I/Mxl/q5VCX4
X-Gm-Gg: ASbGncuzNCtUFoze4mqLHvtuFdLlkm9kPERDDebkEipXE64YlH5K+XnqtdtVS6ofnfh
	pksY3XTpAc2WisVT2bSDAsmrRfhDpuK8xOAWx3l0iPDAySY5GspBUyT02+OU365Q50donVnFFve
	wAN6/2DAueSIn6hii7F1FYYkakN4e98GATuZVyGP6MyvIOGKjs39tmgXgJuI2NAXHwJ/PLspsxZ
	hEKReei4URIb+z1wN/V+5UC641moyhyUNELOVQ5Zpk4SKurBXdLyIZuZOModJsai+i4AExvPZND
	3w==
X-Google-Smtp-Source: AGHT+IGaqnCcJ7W3QzbD5/MOWmJeyOSJ3VUovHm5pxJ14O5OpxxE+BEJWbEG0JBMkkwTfQFOvIVyFQ==
X-Received: by 2002:a05:620a:44cd:b0:7c0:b714:7ec6 with SMTP id af79cd13be357-7c39c4cd13fmr388005285a.24.1740734451206;
        Fri, 28 Feb 2025 01:20:51 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c378d9fec4sm222609485a.67.2025.02.28.01.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 01:20:50 -0800 (PST)
Date: Fri, 28 Feb 2025 17:20:28 +0800
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
Message-ID: <je4falvfemkemlvdfzdmgc7jx2gz6grpbmo6hwtpedjm7xi2gk@jr4frv3tn3l5>
References: <20250221013758.370936-1-inochiama@gmail.com>
 <20250221013758.370936-2-inochiama@gmail.com>
 <20250221-cavalier-cramp-6235d4348013@spud>
 <2egxw3r63cbsygpwqaltp4jjlkuwoh4rkwpgv4haj4sgz5sked@vkotadyk4g6y>
 <20250224-enable-progress-e3a47fdb625c@spud>
 <7ht3djv7zgrbkcvmdg6tp62nmxytlxzhaprsuvyeshyojhochn@ignvymxb3vfa>
 <20250225-lapel-unhappy-9e7978e270e4@spud>
 <ynefy5x672dlhctjzyhkitxoihuucxxki3xqvpimwpcedpfl2u@lmklah5egof4>
 <pbj22qvat76t74nppabekvyncc4ptt6wede4q6wfygbrzcj3ag@ruvt26eqiybu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <pbj22qvat76t74nppabekvyncc4ptt6wede4q6wfygbrzcj3ag@ruvt26eqiybu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_012052_668572_A289CDD8 
X-CRM114-Status: GOOD (  34.41  )
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

On Fri, Feb 28, 2025 at 04:46:22PM +0800, Inochi Amaoto wrote:
> On Fri, Feb 28, 2025 at 02:34:00PM +0800, Inochi Amaoto wrote:
> > On Tue, Feb 25, 2025 at 11:35:23PM +0000, Conor Dooley wrote:
> > > On Tue, Feb 25, 2025 at 07:48:59AM +0800, Inochi Amaoto wrote:
> > > > On Mon, Feb 24, 2025 at 06:54:51PM +0000, Conor Dooley wrote:
> > > > > On Sat, Feb 22, 2025 at 08:34:10AM +0800, Inochi Amaoto wrote:
> > > > > > On Fri, Feb 21, 2025 at 05:01:41PM +0000, Conor Dooley wrote:
> > > > > > > On Fri, Feb 21, 2025 at 09:37:55AM +0800, Inochi Amaoto wrote:
> > > > > > > > The pcie controller on the SG2044 is designware based with
> > > > > > > > custom app registers.
> > > > > > > > 
> > > > > > > > Add binding document for SG2044 PCIe host controller.
> > > > > > > > 
> > > > > > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > > > > > ---
> > > > > > > >  .../bindings/pci/sophgo,sg2044-pcie.yaml      | 125 ++++++++++++++++++
> > > > > > > >  1 file changed, 125 insertions(+)
> > > > > > > >  create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > > > > > 
> > > > > > > > diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > > > > > new file mode 100644
> > > > > > > > index 000000000000..040dabe905e0
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > > > > > @@ -0,0 +1,125 @@
> > > > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > > > +%YAML 1.2
> > > > > > > > +---
> > > > > > > > +$id: http://devicetree.org/schemas/pci/sophgo,sg2044-pcie.yaml#
> > > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > > +
> > > > > > > > +title: DesignWare based PCIe Root Complex controller on Sophgo SoCs
> > > > > > > > +
> > > > > > > > +maintainers:
> > > > > > > > +  - Inochi Amaoto <inochiama@gmail.com>
> > > > > > > > +
> > > > > > > > +description: |+
> > > > > > > > +  SG2044 SoC PCIe Root Complex controller is based on the Synopsys DesignWare
> > > > > > > > +  PCIe IP and thus inherits all the common properties defined in
> > > > > > > > +  snps,dw-pcie.yaml.
> > > > > > > > +
> > > > > > > > +allOf:
> > > > > > > > +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> > > > > > > > +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> > > > > > > > +
> > > > > > > > +properties:
> > > > > > > > +  compatible:
> > > > > > > > +    const: sophgo,sg2044-pcie
> > > > > > > > +
> > > > > > > > +  reg:
> > > > > > > > +    items:
> > > > > > > > +      - description: Data Bus Interface (DBI) registers
> > > > > > > > +      - description: iATU registers
> > > > > > > > +      - description: Config registers
> > > > > > > > +      - description: Sophgo designed configuration registers
> > > > > > > > +
> > > > > > > > +  reg-names:
> > > > > > > > +    items:
> > > > > > > > +      - const: dbi
> > > > > > > > +      - const: atu
> > > > > > > > +      - const: config
> > > > > > > > +      - const: app
> > > > > > > > +
> > > > > > > > +  clocks:
> > > > > > > > +    items:
> > > > > > > > +      - description: core clk
> > > > > > > > +
> > > > > > > > +  clock-names:
> > > > > > > > +    items:
> > > > > > > > +      - const: core
> > > > > > > > +
> > > > > > > > +  dma-coherent: true
> > > > > > > 
> > > > > > > Why's this here? RISC-V is dma-coherent by default, with dma-noncoherent
> > > > > > > used to indicate systems/devices that are not.
> > > > > > 
> > > > > > The PCIe is dma coherent, but the SoC itself is marked as
> > > > > > dma-noncoherent.
> > > > > 
> > > > > By "the SoC itself", do you mean that the bus that this device is on is
> > > > > marked as dma-noncoherent? 
> > > > 
> > > > Yeah, I was told only PCIe device on SG2044 is dma coherent.
> > > > The others are not.
> > > > 
> > > > > IMO, that should not be done if there are devices on it that are coherent.
> > > > > 
> > > > 
> > > > It is OK for me. But I wonder how to handle the non coherent device
> > > > in DT? Just Mark the bus coherent and mark all devices except the
> > > > PCIe device non coherent?
> > > 
> > > Don't mark the bus anything (default is coherent) and mark the devices.
> > 
> > I think this is OK for me.
> > 
> 
> In technical, I wonder a better way to "handle dma-noncoherent".
> In the binding check, all devices with this property complains 
> 
> "Unevaluated properties are not allowed ('dma-noncoherent' was unexpected)"
> 

> It is a pain as at least 10 devices' binding need to be modified.
> So I wonder whether there is a way to simplify this.
> 

Ignore this, I misunderstood the dma device. it seems like 
only dmac and eth needs it.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
