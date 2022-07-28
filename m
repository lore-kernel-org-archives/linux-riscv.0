Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDD4C04A68
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jul 2022 22:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zFB/390slN5o87Fv+lO4ih7ROme8WwxsnJ5bpU16zwQ=; b=ROwJmoAq4xt8n7
	IO2U5DvKv6x6rDz0Yxz127JrFLu76i1nz0ZGUq21bNz9uE/FeWmGmwQxGkg44kJoRcCyjrNKoGlx6
	lasuL18qn4NTN86ymHv7rBoSwBQjNB0NwBgxtUHKegb7IGBfk36jndUYmt4YPt/SNqHayz3pohCzR
	nhSTptx88/g77EsF/eR8+CnfqHyVAvlupz9RdZ9euaZg9UUnC9igSb9tT/NDYw4hyIPpVUZry1AfX
	IX8dphMy0ERJ51xNSz45NosRlngeD2QOIUmD7ZQtX0gin7l2ACpegKm64gjFE/yZnWYCP+xngoeCL
	zzZlW8N4VPHVNRk5melA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHC9I-00FbUd-QP; Thu, 28 Jul 2022 22:38:32 +0000
Received: from mail-il1-f182.google.com ([209.85.166.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHC8B-00Fb6P-SW; Thu, 28 Jul 2022 22:37:25 +0000
Received: by mail-il1-f182.google.com with SMTP id h16so1637573ilc.10;
        Thu, 28 Jul 2022 15:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=dYYAr8co2bcY4aoh9KM7tdmdrbq0srMDfWvjozC6xYU=;
        b=teCn+ATMmirJjxlMBIDyNlI8ZmMoYINRMh3v2BZ92pVPDgr8WqVRz084cnRgXGFsXc
         j73AlOGxzJDJbDRIlIB6zmGGfhJr2gQGpxEXropk5/pCtaI8N7HQ125fsAMtry5EfKjY
         zt2mlN+ewdZbeK2kxb2Buxc0bVXgGshpVOY8ULiIiSr8r/Ltd1kSy5D7cXo9lHQRI2fs
         h5eLSQug7OtehunfnkiRjTrwFYGbl9HOvaLd4CmgEi43tuCEw55EcqE+r/XyFKRY3Fjj
         1k/0/8bQHaA0ZBZijzJ4UI5OGQffG9rkKDoCzH4H9Hb8IHtNXr/TUhAPp9vvJIG483i0
         6PGA==
X-Gm-Message-State: AJIora/zOr9H3IUbMgWU4g1msrYsKFHJHo/fYA+ush1SUVWmix7OqEBl
	ZXyxVAqlPMtZYPG8+MbyxA==
X-Google-Smtp-Source: AGRyM1t8gPtr0jfiLGqpqBeVgPBWp5Jvaj+VqsYRj5EBlOfRnZku+XX3U8Phe8/Vi4cysn8vqzid8A==
X-Received: by 2002:a05:6e02:1aa5:b0:2dd:384:f3ba with SMTP id l5-20020a056e021aa500b002dd0384f3bamr295123ilv.45.1659047841615;
        Thu, 28 Jul 2022 15:37:21 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id y8-20020a027308000000b00339c4e447e2sm897117jab.151.2022.07.28.15.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 15:37:21 -0700 (PDT)
Received: (nullmailer pid 1710887 invoked by uid 1000);
	Thu, 28 Jul 2022 22:37:18 -0000
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>, 
	Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org, 
	Richard Zhu <hongxing.zhu@nxp.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, Frank Li <Frank.Li@nxp.com>, 
	Binghui Wang <wangbinghui@hisilicon.com>, linux-arm-kernel@lists.infradead.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>, devicetree@vger.kernel.org, 
	NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-pci@vger.kernel.org, 
	Greentime Hu <greentime.hu@sifive.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, 
	Bjorn Helgaas <bhelgaas@google.com>, Shawn Guo <shawnguo@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Lucas Stach <l.stach@pengutronix.de>, 
	Xiaowei Song <songxiaowei@hisilicon.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <20220728143427.13617-6-Sergey.Semin@baikalelectronics.ru>
References: <20220728143427.13617-1-Sergey.Semin@baikalelectronics.ru> <20220728143427.13617-6-Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v4 05/17] dt-bindings: PCI: dwc: Stop selecting generic bindings by default
Date: Thu, 28 Jul 2022 16:37:18 -0600
Message-Id: <1659047838.052652.1710886.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_153723_967611_98A95707 
X-CRM114-Status: GOOD (  20.33  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 28 Jul 2022 17:34:15 +0300, Serge Semin wrote:
> It's highly encouraged to have the separate DT schema for each available
> particular device, while the generic schema should be left untouched
> representing just a set of the common device properties (mainly advertised
> by the IP-core reference manual). Seeing there is no currently DW PCIe
> RP/EP dts nodes with only generic compatible string and since there isn't
> any vendor-specific compatible string added to the generic DT schema,
> before it's too late let's mark the snps,dw-pcie.yaml and
> snps,dw-pcie-ep.yaml schemas not selected for checking by default and add
> the explicit requirement to have the compatible string containing the
> generic device name.
> 
> Note due to this modification we need to switch some of the DW PCIe-based
> DT-bindings to referring to the common DT-schema instead of evaluating
> against the generic DW PCIe DT-bindings. They are already defined as
> having the vendor-specific compatible string only. So we can't change that
> semantic.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v3:
> - This is a new patch unpinned from the next one:
>   https://lore.kernel.org/linux-pci/20220503214638.1895-2-Sergey.Semin@baikalelectronics.ru/
>   by the Rob' request. (@Rob)
> - Fix compatible property schema so one would work as expected: string
>   must contain either generic DW PCIe IP-core name or both generic and
>   equipped with IP-core version names.
> ---
>  .../bindings/pci/fsl,imx6q-pcie.yaml          |  3 ++-
>  .../bindings/pci/hisilicon,kirin-pcie.yaml    |  3 ++-
>  .../bindings/pci/sifive,fu740-pcie.yaml       |  3 ++-
>  .../bindings/pci/snps,dw-pcie-ep.yaml         | 24 +++++++++++++++----
>  .../devicetree/bindings/pci/snps,dw-pcie.yaml | 24 +++++++++++++++----
>  .../pci/socionext,uniphier-pcie-ep.yaml       |  9 +++----
>  .../bindings/pci/toshiba,visconti-pcie.yaml   |  3 ++-
>  7 files changed, 53 insertions(+), 16 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.example.dtb: pcie@e00000000: Unevaluated properties are not allowed ('clocks', 'interrupts' were unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/toshiba,visconti-pcie.example.dtb: pcie@28400000: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/toshiba,visconti-pcie.yaml
Documentation/devicetree/bindings/pci/snps,dw-pcie-ep.example.dtb:0:0: /example-0/pcie-ep@dfd00000: failed to match any schema with compatible: ['vendor,soc-pcie', 'snps,dw-pcie-ep']
Documentation/devicetree/bindings/pci/snps,dw-pcie.example.dtb:0:0: /example-0/pcie@dfc00000: failed to match any schema with compatible: ['vendor,soc-pcie', 'snps,dw-pcie']
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.example.dtb: pcie@15700000: compatible: 'anyOf' conditional failed, one must be fixed:
	['samsung,exynos5433-pcie'] does not contain items matching the given schema
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.example.dtb: pcie@15700000: Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'ranges' were unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie.example.dtb: pcie@66000000: compatible: 'anyOf' conditional failed, one must be fixed:
	['socionext,uniphier-pcie'] does not contain items matching the given schema
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie.example.dtb: pcie@66000000: Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'interrupt-names', 'interrupts', 'ranges' were unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/socionext,uniphier-pcie.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.example.dtb: pcie@f4000000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts' were unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.example.dtb: pcie@f5000000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts' were unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
