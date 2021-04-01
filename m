Return-Path: <SRS0=bkE6=I6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63774C433ED
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 16:54:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 037D46138F
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 16:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 037D46138F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Yn6iwM/F6apO+3RnIgqo0W9wxKUDzwEyIPCc8fqqJFc=; b=IGF9D5OuKc7qtRk4h37GcMcBn
	wUhHzQt7wBZqLkc2ZotDgYD2X5DsZAZXDl7reGuwqqtddhfbGsjms9D4CBNxQ4cquo/Kj+HEF1ZLw
	zXSVSdZSAMQRXTCioBjy6ffSwU8+meVi9CQNo8pyG1IIMDPgO/ZQS8+mDndQ3rmfr5dTo1h/imSN9
	KdKmVS3H7CNncclK/nIgoJAD0IOKejY0CClcr2FS69o7eA8BU2WVTMVVawyobfmU5J/B9Eik+2/4P
	q7Rjm7HFRqOB+Tdpgm9Av62SFjrq7NjTn7WdLfnRYN6HCp2aNfQF65dpEDte+/ZYLh59OQolD+RtY
	b98M2rYgA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS0aL-00APQl-2K; Thu, 01 Apr 2021 16:54:21 +0000
Received: from mail-oo1-f42.google.com ([209.85.161.42])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS0aH-00APPG-5u
 for linux-riscv@lists.infradead.org; Thu, 01 Apr 2021 16:54:19 +0000
Received: by mail-oo1-f42.google.com with SMTP id
 i20-20020a4a8d940000b02901bc71746525so718218ook.2
 for <linux-riscv@lists.infradead.org>; Thu, 01 Apr 2021 09:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CL6cxNJtKIKQmvSTfzksNAMYKqjon+6PChUUz9zmOJ4=;
 b=CHNtCP4t3xyxq/dUMQHA0QaZ++qGZ1SKwVNbraOHEMBto4+LDdUGXXBNxeUOvwRc1b
 F/TynCGqQ5g/XY2QvlRjBsa6e8r9nVRfkyfeKh8VF5BCCv6YyoumJg/VZVq2z7EmQ6Kg
 MklGOITFs8XsZB6lhG5IjUdGFD7GH2HBEcq3CP4ekKjgcAzb/m0Mm8HuMYM0ri93F16Z
 jTiHTXya84nJKHqDGz/Xo5C48biNnri/5bQ58rwPrv2FXwiwgncs6ahWBSBjNDDOhHlh
 W1aYN9g7aRIQV1Q7TOqm/ZI/q5VpB1ngP/PvTNLuQr6CtoGa+9pFKfxVqld6laNDZbEl
 wX7w==
X-Gm-Message-State: AOAM530ouo8QbPKO4osz0/MiCLrKml+3Rmc10FENmw2ZpFxbT8CprX8E
 az7frcXSnjVO1CMFGb4dag==
X-Google-Smtp-Source: ABdhPJw+gejICHezMAuNryQdqWA8Zve/kSvWD62nMm2wCCAlpKJgdKHwi2th5zEK21YRRtHo5Tw8jA==
X-Received: by 2002:a4a:e615:: with SMTP id f21mr7883695oot.91.1617296055414; 
 Thu, 01 Apr 2021 09:54:15 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h17sm1241240otj.38.2021.04.01.09.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 09:54:13 -0700 (PDT)
Received: (nullmailer pid 597920 invoked by uid 1000);
 Thu, 01 Apr 2021 16:54:12 -0000
Date: Thu, 1 Apr 2021 11:54:12 -0500
From: Rob Herring <robh@kernel.org>
To: Greentime Hu <greentime.hu@sifive.com>
Cc: paul.walmsley@sifive.com, hes@sifive.com, erik.danie@sifive.com,
 zong.li@sifive.com, bhelgaas@google.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, sboyd@kernel.org, lorenzo.pieralisi@arm.com,
 p.zabel@pengutronix.de, alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com, jh80.chung@samsung.com,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, helgaas@kernel.org
Subject: Re: [PATCH v4 4/6] dt-bindings: PCI: Add SiFive FU740 PCIe host
 controller
Message-ID: <20210401165412.GB573380@robh.at.kernel.org>
References: <20210401060054.40788-1-greentime.hu@sifive.com>
 <20210401060054.40788-5-greentime.hu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210401060054.40788-5-greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_175417_292641_D1A918AD 
X-CRM114-Status: GOOD (  16.70  )
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

On Thu, Apr 01, 2021 at 02:00:52PM +0800, Greentime Hu wrote:
> Add PCIe host controller DT bindings of SiFive FU740.
> 
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  .../bindings/pci/sifive,fu740-pcie.yaml       | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
> new file mode 100644
> index 000000000000..ccb58e5f06d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/sifive,fu740-pcie.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive FU740 PCIe host controller
> +
> +description: |+
> +  SiFive FU740 PCIe host controller is based on the Synopsys DesignWare
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
> +    maxItems: 3
> +
> +  reg-names:
> +    items:
> +      - const: dbi
> +      - const: config
> +      - const: mgmt
> +
> +  num-lanes:
> +    const: 8
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
> +    description: A phandle to the PCIe power up reset line.

How many (maxItems)?

> +
> +  pwren-gpios:
> +    description: Should specify the GPIO for controlling the PCI bus device power on.
> +    maxItems: 1

Still need to list 'reset-gpios' here.

> +
> +required:
> +  - dma-coherent
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
> +  - reset-gpios
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    bus {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        #include <dt-bindings/clock/sifive-fu740-prci.h>
> +
> +        pcie@e00000000 {
> +            compatible = "sifive,fu740-pcie";
> +            #address-cells = <3>;
> +            #size-cells = <2>;
> +            #interrupt-cells = <1>;
> +            reg = <0xe 0x00000000 0x0 0x80000000>,
> +                  <0xd 0xf0000000 0x0 0x10000000>,
> +                  <0x0 0x100d0000 0x0 0x1000>;
> +            reg-names = "dbi", "config", "mgmt";
> +            device_type = "pci";
> +            dma-coherent;
> +            bus-range = <0x0 0xff>;
> +            ranges = <0x81000000  0x0 0x60080000  0x0 0x60080000 0x0 0x10000>,      /* I/O */
> +                     <0x82000000  0x0 0x60090000  0x0 0x60090000 0x0 0xff70000>,    /* mem */
> +                     <0x82000000  0x0 0x70000000  0x0 0x70000000 0x0 0x1000000>,    /* mem */
> +                     <0xc3000000 0x20 0x00000000 0x20 0x00000000 0x20 0x00000000>;  /* mem prefetchable */
> +            num-lanes = <0x8>;
> +            interrupts = <56>, <57>, <58>, <59>, <60>, <61>, <62>, <63>, <64>;
> +            interrupt-names = "msi", "inta", "intb", "intc", "intd";
> +            interrupt-parent = <&plic0>;
> +            interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> +            interrupt-map = <0x0 0x0 0x0 0x1 &plic0 57>,
> +                            <0x0 0x0 0x0 0x2 &plic0 58>,
> +                            <0x0 0x0 0x0 0x3 &plic0 59>,
> +                            <0x0 0x0 0x0 0x4 &plic0 60>;
> +            clock-names = "pcie_aux";
> +            clocks = <&prci PRCI_CLK_PCIE_AUX>;
> +            resets = <&prci 4>;
> +            pwren-gpios = <&gpio 5 0>;
> +            reset-gpios = <&gpio 8 0>;
> +        };
> +    };
> -- 
> 2.30.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
