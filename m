Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBDFC43458
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jul 2026 05:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gblocco+iGpPiz24hjXPtTu2K6VmhqYjry7jq+5q/Kg=; b=R0s5Cb37NX0q14
	jG6lDbvIWY6nnhhnxpMmqE+yZkaYuH0mIal/NWHZ3EN3ReDSIBg7YIX8daJXRhvT04LWkdPJ8dPy6
	uLZt65Im8GeCSIj7UXl7PpSyuaZ7ixlkRUvat21VnV9I9pTGKtFzBrAZC5D5VSmbYsrAeDn4m6ph/
	+pkr9JuvmZLxo7Qim3MfP5o/5e7Ra+XzktVH54t0BRCQ9ST+jlDpg0az18ya1zrYdsFf6VSlSwhqx
	0E7DUqb8F1fU641ko3WwZhTiK6CGP7btGKGUcUaTvyGaWDyQ3T80PCONx8//00k0i78C5OWUoQmFC
	HE4Wyse2SltCMgkrdz/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wimzF-00000007Az8-2EuB;
	Sun, 12 Jul 2026 05:44:21 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wimzC-00000007AyW-1pT2
	for linux-riscv@lists.infradead.org;
	Sun, 12 Jul 2026 05:44:19 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38175907a56so2512806a91.0
        for <linux-riscv@lists.infradead.org>; Sat, 11 Jul 2026 22:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783835057; x=1784439857; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tHBOsAK2LL1+dFyhqlDju8abtbkr9TbGvS+9b0ZjGQ4=;
        b=J+VbuvctRAzL7yG5hP4zMtak4KbsXhbc7H+MLFnGjiCgemQVuULKR9TyTM1xmDflD0
         c+80B0fEuJIDTZG3Bsyn4S0Y1U7WXLx5SN13Y0mtPj4UyJk5bTd7gC55rNZmUvsFahkG
         TK3CfxI4i+XZCK5Ia09IMAqsbftNQoLzh8HgP5mIGzyBwjVP6gUpVlauIhZerK8FCsvZ
         +i3EIpqVRnk2JC2g18RbJxzxK5wcNi05+/WxDUXAfY1RMTxIMisTBZqdSc0kricLsOJ7
         dRbC1FiVHB52dVQ4nuXYswSfsJpDYooSNZ2EQ477fNK/06eWszBaOU4nPvfY5thc9OAR
         zctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835057; x=1784439857;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHBOsAK2LL1+dFyhqlDju8abtbkr9TbGvS+9b0ZjGQ4=;
        b=MeyuqsQ15FUMo2e3RFxI3jZ8Y7MNNVP4pxrZwJzF3LkeSWPqOmgKEuZr4hHbLUswKu
         3ef1I43LknIFo0kUxSkoO0SN17197V5ljYGtDr17ESHqztnNHQA4F+EXzh14lGElGD7g
         G+JgFua/psKxKK9O0ryzR7ChHIJaXyq1qmge2l/2aoMRC8xcTjCqTUWDZ+rg8VSyzF7+
         WN+8CS09f2X6dTaqew4Ql6jUSoWbGPFIXIU0Nazq/g3X8sKFyA9A88vwFb3VaQk62sgq
         UbG+skHVp3nM3E/TskRSUxJJzSz16ZEzSe/SJmq9koGIkjSfrbi/VgMqweV93rs72D8W
         HjaQ==
X-Forwarded-Encrypted: i=1; AHgh+RoSZts9osVBxb51lBFz80qtvfGf3njPk6GV3OXclA+PWr4AVv4qtpbdAosAo59DuldIFKVv64C82YINvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCK6cR/Y8Iw1w5MmfWLiSHc/sF/NKpfeq50wxwsAaZq71s3OND
	C3Z76KiN7RE3VOzg9o55NZU+i8s4bQdpuqiHMFmTEz2WIqbHF2ixgVB9
X-Gm-Gg: AfdE7clVD7Td0so5mqVwe9kY+3mey9OzkaT6G4IjrALf3xIEPd9KU7h7vB0mo2mz+Yo
	tR702KajO9OEa7T6xHOO60tAUAPyEOyP925YlPqMYeCnymGQfDe6fevsZE4a3iI0uBg//dyFQZX
	kseQFydbbq5WAqoESteS8EXgn67KlcQx7K2ktXqRwdA8y1zWAp4wouQfWPbTjwuF4R1JYvoxuRf
	Uz8G7TywGTyO+dLNZZpDS00PtoGqRoar25UV/GatvQUA3d9QuHtqje1+MAVSHcpBUr0UllCNXHG
	k5T2J26fmuNmXBM1Nhhim8PGOOCeQP/SNU3ApgnD5ik9RNXMrDHRZzX3s8WBrWtA2xctP20ePRb
	IBKMuynw4rVtG8DTGKDN8OEeHdPsj2unPbEsX7Ia+vjsjFQBAzY35MhXd/7SDhzt6
X-Received: by 2002:a17:90b:5903:b0:37f:9e21:91d8 with SMTP id 98e67ed59e1d1-38dc834de8fmr3876818a91.15.1783835057412;
        Sat, 11 Jul 2026 22:44:17 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38d11280409sm1900696a91.0.2026.07.11.22.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:44:17 -0700 (PDT)
Date: Sun, 12 Jul 2026 13:43:33 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Christian Bruel <christian.bruel@foss.st.com>, Frank Li <Frank.Li@nxp.com>, Nam Cao <namcao@linutronix.de>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Xincheng Zhang <zhangxincheng@ultrarisc.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vidya Sagar <vidyas@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3
 PCIe host controller
Message-ID: <alMpUW6902TC5T4a@inochi.infowork>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-6-inochiama@gmail.com>
 <58948c74-0990-449e-8eee-88cbb38db7e7@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <58948c74-0990-449e-8eee-88cbb38db7e7@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_224418_479016_AEC6D511 
X-CRM114-Status: GOOD (  26.25  )
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

On Fri, Jul 10, 2026 at 11:01:38AM -0500, Alex Elder wrote:
> On 7/8/26 11:00 PM, Inochi Amaoto wrote:
> > Add binding support for the PCIe controller on the SpacemiT K3 SoC.
> > This controller is almost a standard Synopsys DesignWare PCIe IP,
> > with some extra link and reset state control.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> 
> This looks OK to me.  What I see is that K3 does not require
> the interrupts and interrupt-names properties, allows up to
> six PHYs (not just one), and adds a dbi2 register that is not
> used by K1.
> 
> I might have missed it, but I don't see where the dbi2 register
> is used by the K3 code you have added.  In pcie-designware.c,
> I see that if no "dbi2" resource is found, memory at offset
> 4096 from the "dbi" base is used.  Does that apply for K3?
> If so, maybe there's no need to define dbi2.
> 
> 					-Alex
> 

Weird, I have found the following logic in dw_pcie_get_resources()
of pcie-designware.c

```
	/* DBI2 is mainly useful for the endpoint controller */
	if (!pci->dbi_base2) {
		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dbi2");
		if (res) {
			pci->dbi_base2 = devm_pci_remap_cfg_resource(pci->dev, res);
			if (IS_ERR(pci->dbi_base2))
				return PTR_ERR(pci->dbi_base2);
		} else {
			pci->dbi_base2 = pci->dbi_base + SZ_4K;
		}
	}
```

Regards,
Inochi

> > ---
> >   .../bindings/pci/spacemit,k1-pcie-host.yaml   | 50 ++++++++++++++++---
> >   1 file changed, 43 insertions(+), 7 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
> > index c4c00b5fcdc0..54817d6fd9af 100644
> > --- a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
> > +++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
> > @@ -14,26 +14,29 @@ description: >
> >     PCIe IP.  The controller uses the DesignWare built-in MSI interrupt
> >     controller, and supports 256 MSIs.
> > -allOf:
> > -  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> > -
> >   properties:
> >     compatible:
> > -    const: spacemit,k1-pcie
> > +    enum:
> > +      - spacemit,k1-pcie
> > +      - spacemit,k3-pcie
> >     reg:
> > +    minItems: 4
> >       items:
> >         - description: DesignWare PCIe registers
> >         - description: ATU address space
> >         - description: PCIe configuration space
> >         - description: Link control registers
> > +      - description: Data Bus Interface (DBI) shadow registers.
> >     reg-names:
> > +    minItems: 4
> >       items:
> >         - const: dbi
> >         - const: atu
> >         - const: config
> >         - const: link
> > +      - const: dbi2
> >     clocks:
> >       items:
> > @@ -66,6 +69,8 @@ properties:
> >     interrupt-names:
> >       const: msi
> > +  msi-parent: true
> > +
> >     spacemit,apmu:
> >       $ref: /schemas/types.yaml#/definitions/phandle-array
> >       description:
> > @@ -84,7 +89,8 @@ patternProperties:
> >       properties:
> >         phys:
> > -        maxItems: 1
> > +        minItems: 1
> > +        maxItems: 6
> >         vpcie3v3-supply:
> >           description:
> > @@ -96,13 +102,43 @@ patternProperties:
> >       unevaluatedProperties: false
> > +allOf:
> > +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: spacemit,k1-pcie
> > +    then:
> > +      properties:
> > +        reg:
> > +          maxItems: 4
> > +
> > +        reg-names:
> > +          maxItems: 4
> > +
> > +      patternProperties:
> > +        '^pcie@':
> > +          properties:
> > +            phys:
> > +              maxItems: 1
> > +
> > +      required:
> > +        - interrupts
> > +        - interrupt-names
> > +    else:
> > +      properties:
> > +        reg:
> > +          minItems: 5
> > +
> > +        reg-names:
> > +          minItems: 5
> > +
> >   required:
> >     - clocks
> >     - clock-names
> >     - resets
> >     - reset-names
> > -  - interrupts
> > -  - interrupt-names
> >     - spacemit,apmu
> >   unevaluatedProperties: false
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
