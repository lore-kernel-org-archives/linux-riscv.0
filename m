Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCE6C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Dec 2021 22:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HIxwGjWC6bEvmfNKPXyvvFCpb1LgauOQJYLWugUOJ3Q=; b=LL4XRhTL70pvF9
	npPBoM6DZtxmdfjd7xAYc/fvVTyVog10rMc4nZtKZ4WmV1L3SYVarLcp8SqRioq2FC2Y/upefPt1j
	h+uItOM7cXHXdUpZNFbPRCDYasWyqHB9o0OF9h30ovtaOGCryzWptm08eJCpNxBpBAzctKnUqc8ZM
	bWhA3HVKypbg84H3SUmnqDFlsXSbldK648HBHVVnzCwgenTG8JK9oZfuotrdIsBHddSG+Qg3QAy7L
	FD3jdu5qGX0V4pPHY/n4SPPh0mLcfG/nbkZ3TJq2mt1vO5M9Eoh3Ns4NnB5O++Nr8Z+4SaYkfcj7k
	cIXiAJ0PB+3Yads5SjIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxG6f-00FvH0-32; Tue, 14 Dec 2021 22:17:09 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxG6K-00Fv7K-O4; Tue, 14 Dec 2021 22:16:50 +0000
Received: by mail-oi1-f174.google.com with SMTP id o4so29110740oia.10;
 Tue, 14 Dec 2021 14:16:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/P7WdlopaK3BJckMeyOdCZ27ARBVlWa5L1sm5URTLic=;
 b=aLSWJMLTTCbBK/QDLJyT1ChbWBTZCRO4OPUy6XW1mVALrVaiskGv+nmtkj0lKYCXhQ
 +0FVoU9F+EgTPvX3QBQqwqWRer4glLaqVX8b4yzTAy0vDlmn+fwr967tOeDcp+PzN0/S
 eYfuX/Op0Ucnz5s85EQNJsddhneJlHHqUR6CAXj6ZVuRvpfCP/yHCb6ZABWi5JNorQTV
 HqnmfoefS2SuoyWg/16BpTCEty880uCZesay5lq6Ax9o2HaQGN7i//N82dKGfIVXfcpq
 RiKm984Gl2X9fNXUgwi6ucMnFZES9LVPlGL3OT7WWLUMRGVs81cD5f7EC/KzbSJ+u373
 cFMg==
X-Gm-Message-State: AOAM531UhM5x0EJwWbxHldLUr06bQwKq2XMkLzsuSFgrnud0QkAKi+jQ
 tJoFPblSp0/f/U0eTf9Tvw==
X-Google-Smtp-Source: ABdhPJwW4S9aXKgQmc4ylqmSsIukwflmXezSDLsLGo9bKW6HtV2kspuhgVhb1ZvRlT55hVXDVSM3Kw==
X-Received: by 2002:aca:1b15:: with SMTP id b21mr35225195oib.64.1639520206668; 
 Tue, 14 Dec 2021 14:16:46 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id g7sm40352oon.27.2021.12.14.14.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 14:16:45 -0800 (PST)
Received: (nullmailer pid 4053556 invoked by uid 1000);
 Tue, 14 Dec 2021 22:16:44 -0000
Date: Tue, 14 Dec 2021 16:16:44 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Jingoo Han <jingoohan1@gmail.com>,
 devicetree@vger.kernel.org, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org,
 Xiaowei Song <songxiaowei@hisilicon.com>
Subject: Re: [PATCH] dt-bindings: PCI: designware: Fix
 'unevaluatedProperties' warnings
Message-ID: <YbkXzPqy8gNwKDWR@robh.at.kernel.org>
References: <20211206194426.2470080-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206194426.2470080-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_141648_817399_7A72A389 
X-CRM114-Status: GOOD (  11.37  )
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

On Mon, 06 Dec 2021 13:44:25 -0600, Rob Herring wrote:
> With 'unevaluatedProperties' support implemented, there's a number of
> warnings from the Designware PCIe based bindings:
> 
> Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.example.dt.yaml: pcie@1ffc000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'device_type', 'bus-range', 'ranges', '#interrupt-cells', 'interrupt-map-mask', 'interrupt-map' were unexpected)
> Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.example.dt.yaml: pcie@1ffc000: Unevaluated properties are not allowed ('clock-names' was unexpected)
> Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.example.dt.yaml: pcie@f4000000: Unevaluated properties are not allowed ('bus-range', '#address-cells', '#size-cells', 'device_type', 'ranges', 'num-lanes', '#interrupt-cells', 'interrupts', 'interrupt-names', 'interrupt-map-mask', 'interrupt-map', 'clocks', 'clock-names' were unexpected)
> Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.example.dt.yaml: pcie@f4000000: Unevaluated properties are not allowed ('clock-names' was unexpected)
> Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.example.dt.yaml: pcie@f5000000: Unevaluated properties are not allowed ('bus-range', '#address-cells', '#size-cells', 'device_type', 'phys', 'ranges', 'num-lanes', '#interrupt-cells', 'interrupts', 'interrupt-names', 'interrupt-map-mask', 'interrupt-map', 'reset-gpios', 'pcie@0,0' were unexpected)
> Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.example.dt.yaml: pcie@f5000000: Unevaluated properties are not allowed ('phys', 'hisilicon,clken-gpios' were unexpected)
> Documentation/devicetree/bindings/pci/intel-gw-pcie.example.dt.yaml: pcie@d0e00000: Unevaluated properties are not allowed ('device_type', '#address-cells', '#size-cells', 'linux,pci-domain', 'bus-range', '#interrupt-cells', 'interrupt-map-mask', 'interrupt-map' were unexpected)
> Documentation/devicetree/bindings/pci/intel-gw-pcie.example.dt.yaml: pcie@d0e00000: Unevaluated properties are not allowed ('resets', 'phys', 'phy-names', 'reset-assert-ms' were unexpected)
> Documentation/devicetree/bindings/pci/rockchip-dw-pcie.example.dt.yaml: pcie@fe280000: Unevaluated properties are not allowed ('clock-names', 'msi-map', 'phys', 'phy-names', 'power-domains', 'resets', 'reset-names' were unexpected)
> Documentation/devicetree/bindings/pci/samsung,exynos-pcie.example.dt.yaml: pcie@15700000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', '#interrupt-cells', 'device_type', 'bus-range', 'ranges', 'interrupt-map-mask', 'interrupt-map' were unexpected)
> Documentation/devicetree/bindings/pci/samsung,exynos-pcie.example.dt.yaml: pcie@15700000: Unevaluated properties are not allowed ('clock-names', 'phys', 'vdd10-supply', 'vdd18-supply' were unexpected)
> Documentation/devicetree/bindings/pci/sifive,fu740-pcie.example.dt.yaml: pcie@e00000000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', '#interrupt-cells', 'device_type', 'dma-coherent', 'bus-range', 'ranges', 'interrupts', 'interrupt-parent', 'interrupt-map-mask', 'interrupt-map', 'clock-names', 'clocks' were unexpected)
> Documentation/devicetree/bindings/pci/sifive,fu740-pcie.example.dt.yaml: pcie@e00000000: Unevaluated properties are not allowed ('dma-coherent', 'clock-names', 'resets', 'pwren-gpios' were unexpected)
> Documentation/devicetree/bindings/pci/socionext,uniphier-pcie-ep.example.dt.yaml: pcie-ep@66000000: Unevaluated properties are not allowed ('clock-names', 'clocks', 'reset-names', 'resets', 'phy-names', 'phys' were unexpected)
> Documentation/devicetree/bindings/pci/toshiba,visconti-pcie.example.dt.yaml: pcie@28400000: Unevaluated properties are not allowed ('clock-names' was unexpected)
> Documentation/devicetree/bindings/pci/toshiba,visconti-pcie.example.dt.yaml: pcie@28400000: Unevaluated properties are not allowed ('device_type', 'bus-range', 'num-viewport', '#address-cells', '#size-cells', '#interrupt-cells', 'ranges', 'interrupt-names', 'interrupt-map-mask', 'interrupt-map', 'max-link-speed' were unexpected)
> 
> The main problem is that snps,dw-pcie.yaml and snps,dw-pcie-ep.yaml
> shouldn't set 'unevaluatedProperties: false'. Otherwise, bindings that
> reference them cannot add additional properties. With that addressed,
> there's a handful of other undocumented properties to add.
> 
> Cc: Xiaowei Song <songxiaowei@hisilicon.com>
> Cc: Binghui Wang <wangbinghui@hisilicon.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Greentime Hu <greentime.hu@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> Cc: linux-pci@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/pci/hisilicon,kirin-pcie.yaml          | 13 +++++++++++++
>  .../devicetree/bindings/pci/sifive,fu740-pcie.yaml  |  4 ++--
>  .../devicetree/bindings/pci/snps,dw-pcie-ep.yaml    |  2 +-
>  .../devicetree/bindings/pci/snps,dw-pcie.yaml       |  2 +-
>  .../bindings/pci/socionext,uniphier-pcie-ep.yaml    |  2 +-
>  5 files changed, 18 insertions(+), 5 deletions(-)
> 

Applied, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
