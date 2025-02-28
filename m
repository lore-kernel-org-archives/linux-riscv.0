Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E82C19776
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 06:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v7Hdkfg77wCs5s+tRD/yJK9P3OZqhy2DZDRk9pHxGgY=; b=sdZjGkxmrMQYzq
	xb360Kv68+yww77WPU2k6jAWX5Lc1Kz3nWkBmlEsAxf72uwPkHdupil/K6oZ6K8y7O4B+VbgAaN9P
	5eBqLr+kRVODE9972xiUxtzMo1slvNxcJyFWHf14aN16ZPSSq/6o95zhlW/lgK106wUCjFBCGydBt
	Y/7DiTcprgal53t7m+0DRDlbYaWOROJZxZoeWKt7UcPS5O3j5e8sIVIlKTaWsoVFrAT1lfvXlKGzB
	LPlB25eE1KP+IOQmQ8WAPkhveHy4IX2WI0lbJ3e03tDTIjYp1yhiVp0qNl4s0AA9DU8oGWLdW15iJ
	fwdU/9+2yttBF2cpXUQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tntx5-00000009sdO-0bHh;
	Fri, 28 Feb 2025 06:34:27 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tntx2-00000009sd2-1NEP
	for linux-riscv@lists.infradead.org;
	Fri, 28 Feb 2025 06:34:25 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6e86b92d3b0so13493616d6.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Feb 2025 22:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740724463; x=1741329263; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IyxvtTDvP2i08pzEmArBnEwNU9XeUSRwTgWHm1HVVpw=;
        b=OL4jlYoxzDRpNDD6R+K+FTFBebu2iEV2ZXhDajXjdeka6VOaQGxUyHjmcOPddENdzt
         DiknH/99gmFROPwHsYKW2A8eKICqZ48maJ4PCbl1f58AjOCmuSVn1H0D/VnrJyk3Hzfk
         S3dEoVS7v/EehKSTpXkU0JzeEP9k+OAatbGqUA2D1L1wiCqehiTujR7Ug2XJqEy98nXZ
         nDHTWhqHNWwQgku6mkjgfHMtQpRq1PEYBea0NEc5zbASe5L/21aEdnoZFN9nhcTAqD7j
         Pgropj7ECepz03AuEvMJemtifIYdOqtmDgFAKjQZpSXcTNhjWFHo4ryAck5SHggVgBMK
         c8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740724463; x=1741329263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IyxvtTDvP2i08pzEmArBnEwNU9XeUSRwTgWHm1HVVpw=;
        b=I68xaY1/afhcltXkWEjG2AhD59VxI4GyEjclRwyFfeHw93ZehLI/kKKSlNkYQrfPjb
         3NzLQzkQu0ihzmi9VQc491kqsNrfzV2NvSIfZpUdfYAQL83lbNcqXZ7yS/YXFSQ5A+I0
         OLtrce9WjdpoZm1KV/Biry0ngc/U0EHRYfuT/DtZGMT1o0RxpFO1xwj3yeVZ2bqAGDf9
         v85YcMkIzbcMc0hx0uRzzkRfSuRotV2Z4KRuRgyPQd5B5mUg9QmI12XcvaaZHy71i88b
         fmzuD3CpUEbFj1SwJ+L76K3QfIBZuEYi9Ta06dKcEj97qACBisktDryzW6eZoR5l9IRb
         6ybw==
X-Forwarded-Encrypted: i=1; AJvYcCUv2c85tCcrCXegD6iLJh9mwVPY0VMl+sr0HNKJiAeUrEJHW8xxHkYmSmew36TbgZad+CpUZUI9vRcCLA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUAwSsElAfTmJR74MWIQJ1BINw0W/HJ+hG5DKbd0hCsrc9fl5U
	ShGA2KX3mOriu9IPcWpeJJW1aLUJE6K17xEZopNE6qbjrPjRaPCI
X-Gm-Gg: ASbGncugbj1SMWulHtbSHDyU4uSuokzLQoqRQwlLzkWOwHw5i2PgluxoHo1uPcOlVav
	Dc6xT6Br94q6ACCg1c1lkK7MZZvW3liHw9fKlzurMelrBL3XvdNgctoUOwbsXEZFg+2Dsfc2+9k
	soTK6PDydaEGmIkwANd2+5+9zpWKi1hYnQr3PWeYHx95PclMN8vh2f++AWVDDp+a+RCnQqiGYE9
	L7OVH1CRsF1AR2Z9y3sf+R0zlNUkWhS9RxSjtqb+4bSOA6dTBUUn61z+bbjWSb8vGprxCp60XQX
	Dg==
X-Google-Smtp-Source: AGHT+IGISZX5hCGeBtad2Mh3HcBYPIE/9ril4UARwLS+NFYZNru7HfBxGLbthbXqB8fmJUSStrU7og==
X-Received: by 2002:a05:6214:2687:b0:6d8:b115:76a6 with SMTP id 6a1803df08f44-6e8a0ad8ff5mr42554456d6.0.1740724462935;
        Thu, 27 Feb 2025 22:34:22 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47472409ac2sm21028501cf.58.2025.02.27.22.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 22:34:22 -0800 (PST)
Date: Fri, 28 Feb 2025 14:34:00 +0800
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
Message-ID: <ynefy5x672dlhctjzyhkitxoihuucxxki3xqvpimwpcedpfl2u@lmklah5egof4>
References: <20250221013758.370936-1-inochiama@gmail.com>
 <20250221013758.370936-2-inochiama@gmail.com>
 <20250221-cavalier-cramp-6235d4348013@spud>
 <2egxw3r63cbsygpwqaltp4jjlkuwoh4rkwpgv4haj4sgz5sked@vkotadyk4g6y>
 <20250224-enable-progress-e3a47fdb625c@spud>
 <7ht3djv7zgrbkcvmdg6tp62nmxytlxzhaprsuvyeshyojhochn@ignvymxb3vfa>
 <20250225-lapel-unhappy-9e7978e270e4@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250225-lapel-unhappy-9e7978e270e4@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_223424_369024_03A022E4 
X-CRM114-Status: GOOD (  31.05  )
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

On Tue, Feb 25, 2025 at 11:35:23PM +0000, Conor Dooley wrote:
> On Tue, Feb 25, 2025 at 07:48:59AM +0800, Inochi Amaoto wrote:
> > On Mon, Feb 24, 2025 at 06:54:51PM +0000, Conor Dooley wrote:
> > > On Sat, Feb 22, 2025 at 08:34:10AM +0800, Inochi Amaoto wrote:
> > > > On Fri, Feb 21, 2025 at 05:01:41PM +0000, Conor Dooley wrote:
> > > > > On Fri, Feb 21, 2025 at 09:37:55AM +0800, Inochi Amaoto wrote:
> > > > > > The pcie controller on the SG2044 is designware based with
> > > > > > custom app registers.
> > > > > > 
> > > > > > Add binding document for SG2044 PCIe host controller.
> > > > > > 
> > > > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > > > ---
> > > > > >  .../bindings/pci/sophgo,sg2044-pcie.yaml      | 125 ++++++++++++++++++
> > > > > >  1 file changed, 125 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > > > 
> > > > > > diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > > > new file mode 100644
> > > > > > index 000000000000..040dabe905e0
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > > > @@ -0,0 +1,125 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/pci/sophgo,sg2044-pcie.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: DesignWare based PCIe Root Complex controller on Sophgo SoCs
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Inochi Amaoto <inochiama@gmail.com>
> > > > > > +
> > > > > > +description: |+
> > > > > > +  SG2044 SoC PCIe Root Complex controller is based on the Synopsys DesignWare
> > > > > > +  PCIe IP and thus inherits all the common properties defined in
> > > > > > +  snps,dw-pcie.yaml.
> > > > > > +
> > > > > > +allOf:
> > > > > > +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> > > > > > +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    const: sophgo,sg2044-pcie
> > > > > > +
> > > > > > +  reg:
> > > > > > +    items:
> > > > > > +      - description: Data Bus Interface (DBI) registers
> > > > > > +      - description: iATU registers
> > > > > > +      - description: Config registers
> > > > > > +      - description: Sophgo designed configuration registers
> > > > > > +
> > > > > > +  reg-names:
> > > > > > +    items:
> > > > > > +      - const: dbi
> > > > > > +      - const: atu
> > > > > > +      - const: config
> > > > > > +      - const: app
> > > > > > +
> > > > > > +  clocks:
> > > > > > +    items:
> > > > > > +      - description: core clk
> > > > > > +
> > > > > > +  clock-names:
> > > > > > +    items:
> > > > > > +      - const: core
> > > > > > +
> > > > > > +  dma-coherent: true
> > > > > 
> > > > > Why's this here? RISC-V is dma-coherent by default, with dma-noncoherent
> > > > > used to indicate systems/devices that are not.
> > > > 
> > > > The PCIe is dma coherent, but the SoC itself is marked as
> > > > dma-noncoherent.
> > > 
> > > By "the SoC itself", do you mean that the bus that this device is on is
> > > marked as dma-noncoherent? 
> > 
> > Yeah, I was told only PCIe device on SG2044 is dma coherent.
> > The others are not.
> > 
> > > IMO, that should not be done if there are devices on it that are coherent.
> > > 
> > 
> > It is OK for me. But I wonder how to handle the non coherent device
> > in DT? Just Mark the bus coherent and mark all devices except the
> > PCIe device non coherent?
> 
> Don't mark the bus anything (default is coherent) and mark the devices.

I think this is OK for me.

> That said, Is the PCIe controller actually on the same bus as the
> other devices? (Not talking about the same DT node, the actual bus
> in the device)

It share the same bus with other device, but on a different
master interface.

Regards,
Inochi





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
