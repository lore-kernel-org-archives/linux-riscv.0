Return-Path: <SRS0=66UJ=IV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF09BC433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Mar 2021 20:35:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68056619BA
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Mar 2021 20:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68056619BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NsKwcJtMq6oBXJnYYzmRF3uku6NxLFXtWujjAcqaJSk=; b=g5PTHAdMN4SOi9pNIgnfF3B93
	d+u/qwepw3fQu8lFR9VhG3E+npnn62+2GFz+wXOrXz2nw0rpRlGAad2N6vq6zrvTR/jQB+I0B7XQT
	js7SwTeL4CtqV++7OEZiF9AOf1relk6fZ8G6O5vmBLNxJlVWhyXiN/6XfKZ4n9zx4jBwvMnY079gP
	n1QQ6SwSJI/HjQjPv1fSHz1Vk4L4SgIGaC+DR/GhrNVCu9lNZVjjmLM3U2S53cDWYF6AC0hW0DdYj
	AwYXrR+qOE5xWgUg3tzhqbyp6O4YwTLEtXp5p2V02CYrErFbX76lMYHdiXzO7nF2pBn/slTm4DgYk
	inCFg5H6A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOnkF-00Ffmt-5d; Tue, 23 Mar 2021 20:35:19 +0000
Received: from mail-io1-f45.google.com ([209.85.166.45])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOnkA-00FfmM-AU
 for linux-riscv@lists.infradead.org; Tue, 23 Mar 2021 20:35:16 +0000
Received: by mail-io1-f45.google.com with SMTP id n198so19166873iod.0
 for <linux-riscv@lists.infradead.org>; Tue, 23 Mar 2021 13:35:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9YIaGfAZj+YyjN7GR+t7YC8glZc4pR3XJSdqGay7KgQ=;
 b=d9X9lwkNgPMABpQGBWFQzk3L2OvOUKhBzVB48+2bEd1dxClycIVf29HRJjDcOFo4k7
 tcrFarbXj5jzuqAJBbTRxWERd1brCsuD3vb++bzeaftFmPMszIF0rHAP523bcA+XkQvE
 7YcKDd2khgMEi7+58BdmfVzQ/0Au7rCMAYiyb5Qq3v/ZSFgZQDoVRdM9Lkqyvtr2WtBs
 bIljmcsQP0X7DQjODBsUeefg3ygXTjLg59iGRyqilufeltqIqlUSdcAwyvgj5zUMD0OP
 1kiTsUsZVs8FWrU4u8FhUULHVuq/6rYz+bcLv3FQ+IXq7uJA7tDXSEhmzSyE7RuDc7+Z
 iDKQ==
X-Gm-Message-State: AOAM532SGgofA/uI7Gvqdkc9YInqPVjsTcBm58k92vCvWQT0ZVBcw/UM
 zTIej3gasOcT/dXD86jc7Q==
X-Google-Smtp-Source: ABdhPJwzJ2B7jz3IcS2YFgHRhk8QN9GsvyttcWFvv1Wu+rg5K/Q853NzU1OV8ds7D7TbHLSDnOtZ4A==
X-Received: by 2002:a02:9986:: with SMTP id a6mr6462501jal.46.1616531713152;
 Tue, 23 Mar 2021 13:35:13 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id o14sm9982424ilt.39.2021.03.23.13.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 13:35:12 -0700 (PDT)
Received: (nullmailer pid 1273621 invoked by uid 1000);
 Tue, 23 Mar 2021 20:35:08 -0000
Date: Tue, 23 Mar 2021 14:35:08 -0600
From: Rob Herring <robh@kernel.org>
To: Greentime Hu <greentime.hu@sifive.com>
Cc: paul.walmsley@sifive.com, hes@sifive.com, erik.danie@sifive.com,
 zong.li@sifive.com, bhelgaas@google.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, mturquette@baylibre.com, sboyd@kernel.org,
 lorenzo.pieralisi@arm.com, p.zabel@pengutronix.de, alex.dewar90@gmail.com,
 khilman@baylibre.com, hayashi.kunihiko@socionext.com, vidyas@nvidia.com,
 jh80.chung@samsung.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, helgaas@kernel.org
Subject: Re: [PATCH v2 4/6] dt-bindings: PCI: Add SiFive FU740 PCIe host
 controller
Message-ID: <20210323203508.GA1251968@robh.at.kernel.org>
References: <cover.1615954045.git.greentime.hu@sifive.com>
 <8008af6d86737b74020d7d8f9c3fbc9b500e9993.1615954046.git.greentime.hu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8008af6d86737b74020d7d8f9c3fbc9b500e9993.1615954046.git.greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_203514_582028_4650E496 
X-CRM114-Status: GOOD (  20.91  )
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

On Thu, Mar 18, 2021 at 02:08:11PM +0800, Greentime Hu wrote:
> Add PCIe host controller DT bindings of SiFive FU740.
> 
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  .../bindings/pci/sifive,fu740-pcie.yaml       | 119 ++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
> new file mode 100644
> index 000000000000..c25a91b18cd7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
> @@ -0,0 +1,119 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/sifive,fu740-pcie.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive fu740 PCIe host controller
> +
> +description:
> +  SiFive fu740 PCIe host controller is based on the Synopsys DesignWare
> +  PCI core. It shares common features with the PCIe DesignWare core and
> +  inherits common properties defined in
> +  Documentation/devicetree/bindings/pci/designware-pcie.txt.
> +
> +maintainers:
> +  - Paul Walmsley <paul.walmsley@sifive.com>
> +  - Greentime Hu <greentime.hu@sifive.com>
> +
> +allOf:
> +  - $ref: /schemas/pci/pci-bus.yaml#
> +
> +properties:
> +  compatible:
> +    const: sifive,fu740-pcie
> +
> +  reg:
> +    maxItems: 4

What's the 4th item because there's only 3 names:

> +
> +  reg-names:
> +    items:
> +      - const: dbi
> +      - const: config
> +      - const: mgmt
> +
> +  device_type:
> +    const: pci

Already in pci-bus.yaml

> +
> +  dma-coherent:
> +    description: Indicates that the PCIe IP block can ensure the coherency
> +
> +  bus-range:
> +    description: Range of bus numbers associated with this controller.

Already in pci-bus.yaml

> +
> +  num-lanes: true

Need to define possible values if not all of 1,2,4,8,16.

> +
> +  msi-parent: true
> +
> +  interrupt-names:
> +    items:
> +      - const: msi
> +      - const: inta
> +      - const: intb
> +      - const: intc
> +      - const: intd
> +
> +  resets:
> +    description: A phandle to the PCIe power up reset line
> +
> +  pwren-gpios:
> +    description: Should specify the GPIO for controlling the PCI bus device power on

maxItems: 1

> +
> +  perstn-gpios:
> +    description: Should specify the GPIO for controlling the PCI bus device reset

The DWC binding and pci.txt already define 'reset-gpios' for this 
purpose.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - device_type

pci-bus.yaml already requires this.

> +  - dma-coherent
> +  - bus-range

This generally doesn't need to be required unless the h/w can't support 
0-0xff.

> +  - ranges

pci-bus.yaml already requires this.

> +  - num-lanes
> +  - interrupts
> +  - interrupt-names
> +  - interrupt-parent
> +  - interrupt-map-mask
> +  - interrupt-map
> +  - clock-names
> +  - clocks
> +  - resets
> +  - pwren-gpios
> +  - perstn-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pcie@e00000000 {
> +        #address-cells = <3>;
> +        #interrupt-cells = <1>;
> +        #size-cells = <2>;
> +        compatible = "sifive,fu740-pcie";
> +        reg = <0xe 0x00000000 0x1 0x0

Humm, 4GB for DBI space? The DWC controller doesn't have that much 
space, and the kernel will map *all* of that. That's not an 
insignificant amount of memory just for page tables.

> +               0xd 0xf0000000 0x0 0x10000000
> +               0x0 0x100d0000 0x0 0x1000>;

<> around each reg entry.

> +        reg-names = "dbi", "config", "mgmt";
> +        device_type = "pci";
> +        dma-coherent;
> +        bus-range = <0x0 0xff>;
> +        ranges = <0x81000000  0x0 0x60080000  0x0 0x60080000 0x0 0x10000        /* I/O */
> +                  0x82000000  0x0 0x60090000  0x0 0x60090000 0x0 0xff70000      /* mem */
> +                  0x82000000  0x0 0x70000000  0x0 0x70000000 0x0 0x1000000      /* mem */
> +                  0xc3000000 0x20 0x00000000 0x20 0x00000000 0x20 0x00000000>;  /* mem prefetchable */

<> around each ranges entry.

> +        num-lanes = <0x8>;
> +        interrupts = <56 57 58 59 60 61 62 63 64>;

And here.

> +        interrupt-names = "msi", "inta", "intb", "intc", "intd";
> +        interrupt-parent = <&plic0>;
> +        interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> +        interrupt-map = <0x0 0x0 0x0 0x1 &plic0 57>,
> +                        <0x0 0x0 0x0 0x2 &plic0 58>,
> +                        <0x0 0x0 0x0 0x3 &plic0 59>,
> +                        <0x0 0x0 0x0 0x4 &plic0 60>;
> +        clock-names = "pcie_aux";
> +        clocks = <&prci PRCI_CLK_PCIE_AUX>;
> +        resets = <&prci 4>;
> +        pwren-gpios = <&gpio 5 0>;
> +        perstn-gpios = <&gpio 8 0>;
> +    };
> -- 
> 2.30.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
