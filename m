Return-Path: <SRS0=hRw5=MF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55248C07E95
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jul 2021 08:32:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E50CA61279
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jul 2021 08:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E50CA61279
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EGmU0dTKo1D5lagHuep4ugjG8FHt8R/ZAKJEbb3MsBU=; b=QU9ZIosPue9W3p
	cm9HpzDKPWPGRU6bALc38Qyvoi6I12sGhWv8/8igq/c45o9l4rQY2w9IJkF5ctKrNfpSSq60uf9d1
	JN5hLx8LZO5ReyH/jjen1NIZGJj9VGdMEUP977tCVU0pMiH1IrKJfUjGniaEtCN7KVzm74hFdAOhJ
	gaz+sRdaZJCHQiq/xivZfOqUxnNCjsuhD7jOCM4PTQCmii/RqJHHAA2cIycLwV9WrYHt8L0b1vwQR
	GGUOViTh1niY9N57qZcbMo06OaU6US1kCR8/ucuwS2cnY/qzeNUlrW/upIDH8NcSesN0Gt9FFczm0
	7rA429SsHywv1ZVRjiTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3Dpb-009RwL-Jb; Tue, 13 Jul 2021 08:31:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3DpN-009Rcb-4h; Tue, 13 Jul 2021 08:31:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 108EE6127C;
 Tue, 13 Jul 2021 08:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626165100;
 bh=vCzKuNoKiBxSGIGRN6demDaGtX6onzKhSozcN6yvzxI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WTpIf7OCkrQI0Psl1TQDpx3ah/ff9bEvdnD8KZIITUb16hNuzoLtLaJkLz0Zgq78I
 voQW9beo0TC1xcjrumCclhy8bHBiVv27eGbKg31yKydTrD1DV7HzI2Q+NEev5je2AP
 fjfKpS3lHv0de56cycngELdDiVNqelcEwZIXctkIiRCE6k5j/BBDVh2DVZPgAJldJq
 D+p/nT9gLxqaLG76VvUN/2CgiSdy/v1WYe+ZJk9wsYJyTKEJHR/Q0Bke7fGB86ztxC
 Ik1mIgthNrw8SyAuJJWVt3DoKfiy3OMr7NnGjrlN6xLbXcejghwiIZYDzrkkQXRFUi
 SY8TbsdogwJJw==
Date: Tue, 13 Jul 2021 10:31:27 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Bjorn
 Helgaas <bhelgaas@google.com>, Fabio Estevam <festevam@gmail.com>,
 Greentime Hu <greentime.hu@sifive.com>, Gustavo Pimentel
 <gustavo.pimentel@synopsys.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Jesper Nilsson
 <jesper.nilsson@axis.com>, Jingoo Han <jingoohan1@gmail.com>, Jonathan
 Chocron <jonnyc@amazon.com>, Jonathan Hunter <jonathanh@nvidia.com>, Kevin
 Hilman <khilman@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Lucas Stach <l.stach@pengutronix.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Richard Zhu <hongxing.zhu@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: designware-pcie.txt: convert
 it to yaml
Message-ID: <20210713103127.3891c8e9@coco.lan>
In-Reply-To: <20210712174504.GA2158814@robh.at.kernel.org>
References: <cover.1625838920.git.mchehab+huawei@kernel.org>
 <fa846c83165894accdac1715c3fddfbdcb060958.1625838920.git.mchehab+huawei@kernel.org>
 <20210712174504.GA2158814@robh.at.kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_013141_278427_81E476EF 
X-CRM114-Status: GOOD (  26.83  )
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

Em Mon, 12 Jul 2021 11:45:04 -0600
Rob Herring <robh@kernel.org> escreveu:

> On Fri, Jul 09, 2021 at 03:57:42PM +0200, Mauro Carvalho Chehab wrote:
> > Convert the file to DT schema.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>


> > diff --git a/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml b/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml
> > index 1810bf722350..3f49c8017c7a 100644
> > --- a/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml
> > +++ b/Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml


> > +  reg:
> > +    description: |
> > +      It should contain Data Bus Interface (dbi, dbi2) registers for all
> > +      versions.
> 
> Not all versions have dbi2.
> 
> > +      For designware cores version < 4.80, contains the configuration
> > +      address space. For designware core version >= 4.80,
> > +      contains the configuration and ATU address space.
> 
> config space should always be present. For a brief time (around 2014), 
> it was not required but has been since. For purposes of the schema, we 
> can say always required.
> 
> ATU is optional in 4.80 or later. 
> 
> > +    minItems: 2
> > +    maxItems: 4
> > +
> > +  reg-names:
> > +    minItems: 2
> > +    maxItems: 4
> > +    items:
> > +      contains:
> 
> Drop contains.
> 
> > +        enum: [dbi, dbi2, config, atu, addr_space]

This actually generated a warning:

/new_devel/v4l/hikey970/Documentation/devicetree/bindings/pci/intel-gw-pcie.example.dt.yaml: pcie@d0e00000: reg-names:2: 'app' is not one of ['dbi', 'dbi2', 'config', 'atu', 'addr_space']

I guess it needs to be changed to:

	enum: [dbi, dbi2, config, atu, addr_space, app]

or intel-gw-pcie.yaml would require an extra change.

That's said, I didn't find any DTS using compatible = "intel,lgm-pcie",
but looking at drivers/pci/controller/dwc/pcie-intel-gw.c, it seems
that this is a mandatory register on such hardware.

> > +
> > +  num-lanes:
> > +    $ref: '/schemas/types.yaml#/definitions/uint32'
> > +    description: |
> > +      number of lanes to use (this property should be specified unless
> > +      the link is brought already up in BIOS)
> > +    maxItems: 1
> 
> Drop. Not an array. 'maximum: 16' is needed though pci-bus.yaml may 
> cover that already.

It seems that num-lanes is not there at pci-bus.yaml - at least not
at the version I'm using here (2021.7.dev1+ge5f58d415b1d).


> > +patternProperties:
> > +  "pcie?_ep@[0-9a-f]+$":
> > +    type: object
> > +    properties:
> > +      compatible:
> > +        contains:
> > +          const: snps,dw-pcie-ep
> 
> This doesn't make sense. This is defining a child node of the DW 
> controller with 'snps,dw-pcie-ep'.

This was an attempt to silence those warnings:

	From schema: /new_devel/v4l/hikey970/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
/new_devel/v4l/hikey970/Documentation/devicetree/bindings/pci/intel-gw-pcie.example.dt.yaml: pcie@d0e00000: '#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'clocks', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'linux,pci-domain', 'max-link-speed', 'phy-names', 'phys', 'ranges', 'reset-assert-ms', 'resets' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /new_devel/v4l/hikey970/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
/new_devel/v4l/hikey970/Documentation/devicetree/bindings/pci/snps,dw-pcie.example.dt.yaml: pcie@dfc00000: '#address-cells', '#interrupt-cells', '#size-cells', 'device_type', 'interrupts', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /new_devel/v4l/hikey970/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml

Somehow, dtschema is only accepting 'pinctrl-[0-9]+' regex when parsing 
examples on this file. I've no idea how to fix it.

As a reference, this is how the examples are now declared:

<snip>
examples:
  - |
    pcie@dfc00000 {
      compatible = "snps,dw-pcie";
      reg = <0xdfc00000 0x0001000>, /* IP registers */
            <0xd0000000 0x0002000>; /* Configuration space */
      reg-names = "dbi", "config";
      #address-cells = <3>;
      #size-cells = <2>;
      device_type = "pci";
      ranges = <0x81000000 0 0x00000000 0xde000000 0 0x00010000>,
               <0x82000000 0 0xd0400000 0xd0400000 0 0x0d000000>;
      interrupts = <25>, <24>;
      #interrupt-cells = <1>;
      num-lanes = <1>;
    };
    pcie-ep@dfd00000 {
      compatible = "snps,dw-pcie-ep";
      reg = <0xdfc00000 0x0001000>, /* IP registers 1 */
            <0xdfc01000 0x0001000>, /* IP registers 2 */
            <0xd0000000 0x2000000>; /* Configuration space */
      reg-names = "dbi", "dbi2", "addr_space";
    };
</snip>

Thanks,
Mauro

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
