Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A666CD3447
	for <linux-riscv@archiver.kernel.org>; Sat,  9 May 2026 07:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1Xo0XCKA/vUkJeGmgp7rSoUzDv4C2Kvcz6/r1/ktOU=; b=o+lIUIrnRaM9jw
	+f/clehZFDa+457MUjCV8z2D6RPW2w39qZigBke9lPUOIZgdaYcGU4XVQNTYfS7XusW+SuocScrdk
	+NSjfsO7kdYJxi1iVdW8wehc3wRex2gC7oMHZEcFyk+b3VUl3emuVdms1ASVvIbQRM6EqPk8J+gHv
	NAcHwJZNZdc8Xvh8vMUozpqzyBxnHhPiZzvo5eVEna0e0GNA/HduA40/OwBZxInyBSHLpPhbzPk1G
	aAqBatstK0uTujRQFrvkeQx7JcMKOqgKUjvEN9tH6LQ4VwpNpMf3QqzW91HRFj885n5yhko4QY/DT
	WRKxsJTBCPJsxqIgOFaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLbxM-00000008SiK-3CeS;
	Sat, 09 May 2026 07:18:36 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLbxK-00000008Sho-26cU
	for linux-riscv@lists.infradead.org;
	Sat, 09 May 2026 07:18:36 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-82fbf5d4dc2so1935374b3a.1
        for <linux-riscv@lists.infradead.org>; Sat, 09 May 2026 00:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778311113; x=1778915913; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=skObjcn2ITTEAn6Yzrs7wNLXCgAg8sVMpOQ0WmRpnAE=;
        b=Dh48ys6KracPe2DzgYehJysb9Y8+J5gj0pXCHynjJ/JgORUug4I2N810Ed9bHZ1Fv+
         TpZVBMs2asaT9qGt1SSuOzXr/tc5ju6IEmkmeOENRQ+QwPe0MlpcXEo4y/hUJugQXJQj
         rmL5QR+L7cBXgFuEKVt1FwyeA8nEN3kjnMHXDE0l8Qwq5smuNCqkXJvVVOQXxlOIDSAl
         7zmhMna/hhE7BerWKzvipnk58BiNsbC3rIn27ONTtJQDuxvy1gX0wXZdFgQYp8A/o4dY
         j3wFqM5Iqtg9fV0nbVTTFKyEwJG1QL3duVI15iOiyBiftEfbjkZIoq2AdU2r2FVA9MF0
         JDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778311113; x=1778915913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=skObjcn2ITTEAn6Yzrs7wNLXCgAg8sVMpOQ0WmRpnAE=;
        b=WMXdtEPIPkHMeTKOdJRdb/MeMX2WTL2HaXev2iZSlWBHQB4OGuduj3mS3I+C/L+Ufv
         qCDxsaHpbnzE1kiV40HU89sT/8dE5X5SF+ZT7GxVK0BVd4HU3T0ywqzdChbp32RMXIR8
         qgr+403TEBaZKCiFJV+YAbS/CWlZJpkQY+nRPrppb8rd+4obaR1Gcd4TPiNk4SCTOF5n
         24/sSl5MNjmtKzVclzkbxgUPzutu1Z3Y7CqqBmMUu97w0r28X5wbqqxvEYB62KrkePlM
         rpC4VYWNMtMarUj9vDRbzEBsE1swnFsduzXPZe9ABr9DbfIQiyt2lf0Dfmb8MkFGC9Eh
         SxNQ==
X-Forwarded-Encrypted: i=1; AFNElJ+4cGoH+slBxgl51PECOgfhP8NBz7Y1bInC4WKLcNEu2MMwVu47Ag56YoF4ybqK1ZIgxLtYWIwA2t7xYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7RRMTDqj777zK9c6ShE9k7dwRJASMWhmN1fTU4GX9j873RoWf
	e8nnvWsASTE3Mlqskv5s7AN4gHunlZWbM/SdR6pndxr7FNlJU7kEIuCf
X-Gm-Gg: Acq92OGz5Tnf4DOuSv6ThDeD3jEmmCwqK9bZ2CUYpERwO3kSH3uK7wtO/If2rledBa+
	tNIZVXW+KpjuSbRXXuPP59iuh1aTKI90wbD0FabyDGkg3Nz0lt9sJkLtvvTBJMQsbktw/dKsA8H
	pv5B+kTdXt7c+usVIZRICl8QfnCj05P9ETOFjw+IV98Cw1KjRfrBRRpRKZBV6GLW5iWP3pxlYbG
	dNfxso5uiiqAZE2gNX9pw7izjITK+02JboJHQbXMNohoB1PIlGMMl6VxaVyKeSiW5vx2PIO5u7J
	MeMFUkryomqHVpmHkXmg/tht+aboqD3uEMN2XVSXeyuva8V7cV5HcJORBHiO8tPVqhhmWIYwjFZ
	Yw5Nbnkxb5DXFqQHsogrCmrBJeWU70KZqH5jZhkVjlwLpTvnmqZpJ7ymG+tOSZpw8ygzIS8ebGs
	M5BQlTE7DMFNZsVqjSKEZaTxPVAwC2m9B5mA==
X-Received: by 2002:a05:6a00:2442:b0:835:443e:4be2 with SMTP id d2e1a72fcca58-83a5badbebcmr16047333b3a.2.1778311112968;
        Sat, 09 May 2026 00:18:32 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcf36sm17667656b3a.41.2026.05.09.00.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 00:18:32 -0700 (PDT)
Date: Sat, 9 May 2026 15:18:11 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Alex Elder <elder@riscstar.com>, 
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: pci: spacemit: Introduce Spacemit K3
 PCIe host controller
Message-ID: <af7exVxVnDYagA7D@inochi.infowork>
References: <20260502101319.2364052-1-inochiama@gmail.com>
 <20260502101319.2364052-5-inochiama@gmail.com>
 <20260507191302.GA2284447-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260507191302.GA2284447-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_001834_582307_40505273 
X-CRM114-Status: GOOD (  21.34  )
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

On Thu, May 07, 2026 at 02:13:02PM -0500, Rob Herring wrote:
> On Sat, May 02, 2026 at 06:13:17PM +0800, Inochi Amaoto wrote:
> > Add binding support for the PCIe controller on the SpacemiT K3 SoC.
> > This controller is almost a standard Synopsys Designware PCIe IP,
> > with some extra link and reset state control.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../bindings/pci/spacemit,k3-pcie-host.yaml   | 142 ++++++++++++++++++
> >  1 file changed, 142 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
> > new file mode 100644
> > index 000000000000..be2641526b19
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pci/spacemit,k3-pcie-host.yaml
> > @@ -0,0 +1,142 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pci/spacemit,k3-pcie-host.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SpacemiT K3 PCI Express Host Controller
> > +
> > +maintainers:
> > +  - Inochi Amaoto <inochiama@gmail.com>
> > +
> > +description:
> > +  The SpacemiT K3 SoC PCIe host controller is based on the Synopsys
> > +  DesignWare PCIe IP.  The controller uses the external MSI interrupt
> > +  controller.
> > +
> > +allOf:
> > +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> > +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: spacemit,k3-pcie
> > +
> > +  reg:
> > +    items:
> > +      - description: DesignWare PCIe registers
> > +      - description: Data Bus Interface (DBI) shadow registers
> > +      - description: ATU address space
> > +      - description: PCIe configuration space
> > +      - description: Link control registers
> > +
> > +  reg-names:
> > +    items:
> > +      - const: dbi
> > +      - const: dbi2
> > +      - const: atu
> > +      - const: config
> > +      - const: link
> > +
> > +  clocks:
> > +    items:
> > +      - description: DWC PCIe Data Bus Interface (DBI) clock
> > +      - description: DWC PCIe application AXI-bus master interface clock
> > +      - description: DWC PCIe application AXI-bus slave interface clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: dbi
> > +      - const: mstr
> > +      - const: slv
> > +
> > +  resets:
> > +    items:
> > +      - description: DWC PCIe Data Bus Interface (DBI) reset
> > +      - description: DWC PCIe application AXI-bus master interface reset
> > +      - description: DWC PCIe application AXI-bus slave interface reset
> > +
> > +  reset-names:
> > +    items:
> > +      - const: dbi
> > +      - const: mstr
> > +      - const: slv
> > +
> > +  interrupts:
> > +    items:
> > +      - description: Interrupt used for port state
> > +
> > +  interrupt-names:
> > +    const: app
> > +
> > +  msi-parent: true
> > +
> > +  phys:
> > +    minItems: 1
> > +    maxItems: 6
> 
> You have to define what each entry is. I assume this is 1 per lane 
> though I thought only a power of 2 number of lanes was valid.
> 

In fact it is not 1 per lane, the PCIe accept lanes from the Comb PHY,
and the phy can provide 1 lane or 2 lanes according to the PHY MUX. 
In detail,
- PHY 0,1 is 2 lanes
- PHY 2,3,4,5 is 1 lane.

So the max number of the phys is 6 with 8 lanes.

Maybe need a description link to the phy mux configuration?

Regards,
Inochi



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
