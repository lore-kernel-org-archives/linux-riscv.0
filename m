Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB027C282C6
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 00:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5M1QFf3M6QMw3vEVmduOD6p1gjZs19jAPpkwZ56c9KU=; b=kAZYtVnPEkTtT6
	ydqLLD/+BvDP+V2Bd3E8C0ZSFsLDzAhZQoh+5f6FHWa/HR4iXzk2Ae7ffruI7EDKX/ta3A5J1mush
	UgCqNqYVyClcEENRRhHeaivLnaMOciWt/x/FhckIVud2LT5kZYkPMmYog6X6kx22Dbjpw8e+W9pS7
	qlF0b2cWI8WkAXyHR6o/fTUJE2jJUlO3asY8wfYHU9pDnXG2GzC/YbSLcv+UKxVhDGB7nk373gWh0
	AS5tMX3AtTT+vDlKsbjCIuijWmmGTYKgnUnq0DKFm/jkofOcTdRjjzvy4emuB+QC4kQ3NUloKSNIK
	VBd1NKGtLj3ARcvy4QmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpGHg-00000002fZn-286I;
	Tue, 04 Mar 2025 00:37:20 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpGHd-00000002fYm-46f1
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 00:37:19 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6dcd4f1aaccso84444566d6.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Mar 2025 16:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741048636; x=1741653436; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jkdclXu2BjEaGsp2gaaSDivFgOqo2Ctx5xrHZRDqZfs=;
        b=SaooJsx9Pzg22KZAY+qHPfBNsjtxc+gqXhfAiTVMttcU8wAYu0LMpP/OcL6Lq6mg9D
         7xUp0f0eah+l1EeUDOCqpvabY4XPnfz22+9+DLNsalfJVWmNS7QOseItBkrxQlF/0Uep
         6oo3vjIg69Zee1BzqWXGIrR1mYVDTWXdXvfD2A7eyqy1Jd2SNMbOACVMjgcIM/aJpW6f
         /fh+8i/3nicm6RtigEeCJbNHwaidQDgw9NuiYY4/MIvjVApES+uWtPzKEMVZzhpLFUEP
         C5KmU+TgkzSlQht9oF2QwlpLC+1bpzIzkJ3u5WqeDTP7bHOh2V7ObaC/p+ilhJIEhe7f
         1pZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741048636; x=1741653436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jkdclXu2BjEaGsp2gaaSDivFgOqo2Ctx5xrHZRDqZfs=;
        b=vmyD34siwJxdFfi1qd+TGKPFl2IsB6yds5r5IkwZZRHSx3ZSi+oZQfRtLHZcGyD54o
         9SscSn2YJseZoaU/Uj1s/jAMHjS0A9J7dqK0SK+6HBKEt6qmyv3drQ52ubu8fEq+vx42
         +D9HqmfM2aL/V9DHBJOgJ8BHlNtiLQuOmOWc64kaw0UcnZTvuNGqYzbPCQ14b0uhCGqF
         AamzuOwoNqPfl7IDrnDqszQL+/ruJ11l1y7xVC+4pJiV5+h1L9goElUmMDWLi6If5EaH
         GqXxluzG5AOr/srUYuaXii2PXnrzTK0BmXyqOv9+QkKX89JMKOogTNc4/8LchqKWfyjA
         keQg==
X-Forwarded-Encrypted: i=1; AJvYcCV2HKgYT06jI/8tu/o9R0bY4zxK1hxcEQxnvEQSPvQ1WviGr4pYHhRwXEKae7PLUVDxl9a3LPdwukYb+g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2BAsJ7KHrIudmPUKJyte3jKN49zRFNkh8ZVgN1Nu+1nBqsFxX
	5vAt9eHhf8+72ZclMlVdZKsmXQ3Tz9EvteKoxVNzr3herf+CXV+c
X-Gm-Gg: ASbGncuaphVHjXlsOaKDvX1yPA3rZ/e2/Ibh/GLd7rRBnwEmuqzAzCqL6pypnzqJcW7
	fy1GKJ2xv9APFbkul7oHzil8x4BrTx0hIBsRjMKsAMixN1n4SGoy/jfuQTScrJfjLB4FvpXAOEW
	fya4RO6vWcgkwwjnjqkiSOm1gaj0st0YB43irNXP9yxyX/56kL5UVpEbQs4Qc/EZ+j/YiUxKud3
	OE+LKiO0m43Knt8Liy6cCcNwXxdP8yvMAKklFU8MS/kAkfSECjtC7CPjGMTSMn8T4QNHYkc9p97
	jXc2nk7BTi+RU1/eSf7A
X-Google-Smtp-Source: AGHT+IGQbwXba2MFwiNePHYnLnKYFfggC79zX3LMmSKQG33QbOsKtz/15wOdDccKw9clJ6yC4X6TZw==
X-Received: by 2002:ad4:5f07:0:b0:6e6:5caa:e5d with SMTP id 6a1803df08f44-6e8a0c8038dmr239929856d6.4.1741048636326;
        Mon, 03 Mar 2025 16:37:16 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e8976da321sm59229366d6.99.2025.03.03.16.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 16:37:15 -0800 (PST)
Date: Tue, 4 Mar 2025 08:36:47 +0800
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
Message-ID: <pgyynmrrtxi2jlrgstcbxh4f2wuxhyulw5gmssjw6rs44nix5y@msi25bjahz37>
References: <20250221013758.370936-2-inochiama@gmail.com>
 <20250221-cavalier-cramp-6235d4348013@spud>
 <2egxw3r63cbsygpwqaltp4jjlkuwoh4rkwpgv4haj4sgz5sked@vkotadyk4g6y>
 <20250224-enable-progress-e3a47fdb625c@spud>
 <7ht3djv7zgrbkcvmdg6tp62nmxytlxzhaprsuvyeshyojhochn@ignvymxb3vfa>
 <20250225-lapel-unhappy-9e7978e270e4@spud>
 <ynefy5x672dlhctjzyhkitxoihuucxxki3xqvpimwpcedpfl2u@lmklah5egof4>
 <pbj22qvat76t74nppabekvyncc4ptt6wede4q6wfygbrzcj3ag@ruvt26eqiybu>
 <je4falvfemkemlvdfzdmgc7jx2gz6grpbmo6hwtpedjm7xi2gk@jr4frv3tn3l5>
 <20250303-aground-snitch-40d6dfe95238@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250303-aground-snitch-40d6dfe95238@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_163718_018627_DDE1F32F 
X-CRM114-Status: GOOD (  39.37  )
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

On Mon, Mar 03, 2025 at 05:04:28PM +0000, Conor Dooley wrote:
> On Fri, Feb 28, 2025 at 05:20:28PM +0800, Inochi Amaoto wrote:
> > On Fri, Feb 28, 2025 at 04:46:22PM +0800, Inochi Amaoto wrote:
> > > On Fri, Feb 28, 2025 at 02:34:00PM +0800, Inochi Amaoto wrote:
> > > > On Tue, Feb 25, 2025 at 11:35:23PM +0000, Conor Dooley wrote:
> > > > > On Tue, Feb 25, 2025 at 07:48:59AM +0800, Inochi Amaoto wrote:
> > > > > > On Mon, Feb 24, 2025 at 06:54:51PM +0000, Conor Dooley wrote:
> > > > > > > On Sat, Feb 22, 2025 at 08:34:10AM +0800, Inochi Amaoto wrote:
> > > > > > > > On Fri, Feb 21, 2025 at 05:01:41PM +0000, Conor Dooley wrote:
> > > > > > > > > On Fri, Feb 21, 2025 at 09:37:55AM +0800, Inochi Amaoto wrote:
> > > > > > > > > > The pcie controller on the SG2044 is designware based with
> > > > > > > > > > custom app registers.
> > > > > > > > > > 
> > > > > > > > > > Add binding document for SG2044 PCIe host controller.
> > > > > > > > > > 
> > > > > > > > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > > > > > > > ---
> > > > > > > > > >  .../bindings/pci/sophgo,sg2044-pcie.yaml      | 125 ++++++++++++++++++
> > > > > > > > > >  1 file changed, 125 insertions(+)
> > > > > > > > > >  create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > > > > > > > 
> > > > > > > > > > diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > > > > > > > new file mode 100644
> > > > > > > > > > index 000000000000..040dabe905e0
> > > > > > > > > > --- /dev/null
> > > > > > > > > > +++ b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
> > > > > > > > > > @@ -0,0 +1,125 @@
> > > > > > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > > > > > +%YAML 1.2
> > > > > > > > > > +---
> > > > > > > > > > +$id: http://devicetree.org/schemas/pci/sophgo,sg2044-pcie.yaml#
> > > > > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > > > > +
> > > > > > > > > > +title: DesignWare based PCIe Root Complex controller on Sophgo SoCs
> > > > > > > > > > +
> > > > > > > > > > +maintainers:
> > > > > > > > > > +  - Inochi Amaoto <inochiama@gmail.com>
> > > > > > > > > > +
> > > > > > > > > > +description: |+
> > > > > > > > > > +  SG2044 SoC PCIe Root Complex controller is based on the Synopsys DesignWare
> > > > > > > > > > +  PCIe IP and thus inherits all the common properties defined in
> > > > > > > > > > +  snps,dw-pcie.yaml.
> > > > > > > > > > +
> > > > > > > > > > +allOf:
> > > > > > > > > > +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> > > > > > > > > > +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> > > > > > > > > > +
> > > > > > > > > > +properties:
> > > > > > > > > > +  compatible:
> > > > > > > > > > +    const: sophgo,sg2044-pcie
> > > > > > > > > > +
> > > > > > > > > > +  reg:
> > > > > > > > > > +    items:
> > > > > > > > > > +      - description: Data Bus Interface (DBI) registers
> > > > > > > > > > +      - description: iATU registers
> > > > > > > > > > +      - description: Config registers
> > > > > > > > > > +      - description: Sophgo designed configuration registers
> > > > > > > > > > +
> > > > > > > > > > +  reg-names:
> > > > > > > > > > +    items:
> > > > > > > > > > +      - const: dbi
> > > > > > > > > > +      - const: atu
> > > > > > > > > > +      - const: config
> > > > > > > > > > +      - const: app
> > > > > > > > > > +
> > > > > > > > > > +  clocks:
> > > > > > > > > > +    items:
> > > > > > > > > > +      - description: core clk
> > > > > > > > > > +
> > > > > > > > > > +  clock-names:
> > > > > > > > > > +    items:
> > > > > > > > > > +      - const: core
> > > > > > > > > > +
> > > > > > > > > > +  dma-coherent: true
> > > > > > > > > 
> > > > > > > > > Why's this here? RISC-V is dma-coherent by default, with dma-noncoherent
> > > > > > > > > used to indicate systems/devices that are not.
> > > > > > > > 
> > > > > > > > The PCIe is dma coherent, but the SoC itself is marked as
> > > > > > > > dma-noncoherent.
> > > > > > > 
> > > > > > > By "the SoC itself", do you mean that the bus that this device is on is
> > > > > > > marked as dma-noncoherent? 
> > > > > > 
> > > > > > Yeah, I was told only PCIe device on SG2044 is dma coherent.
> > > > > > The others are not.
> > > > > > 
> > > > > > > IMO, that should not be done if there are devices on it that are coherent.
> > > > > > > 
> > > > > > 
> > > > > > It is OK for me. But I wonder how to handle the non coherent device
> > > > > > in DT? Just Mark the bus coherent and mark all devices except the
> > > > > > PCIe device non coherent?
> > > > > 
> > > > > Don't mark the bus anything (default is coherent) and mark the devices.
> > > > 
> > > > I think this is OK for me.
> > > > 
> > > 
> > > In technical, I wonder a better way to "handle dma-noncoherent".
> > > In the binding check, all devices with this property complains 
> > > 
> > > "Unevaluated properties are not allowed ('dma-noncoherent' was unexpected)"
> > > 
> > 
> > > It is a pain as at least 10 devices' binding need to be modified.
> > > So I wonder whether there is a way to simplify this.
> > > 
> > 
> > Ignore this, I misunderstood the dma device. it seems like 
> > only dmac and eth needs it.
> 
> Nah, not gonna ignore it ;) You do make a valid point about it being
> painful, but given you mention a different master for the pci device,
> having two different soc@<foo> nodes sounds like it might make sense.
> One marked dma-noncoherent w/ the existing devices and one that is
> unmarked (since that's default) to represent the master than pci is on?

Yeah, That make sense. I think it serves as a better way for SG2044.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
