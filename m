Return-Path: <SRS0=emcE=ME=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A2CC07E9C
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jul 2021 14:13:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2F0D610CB
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jul 2021 14:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2F0D610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YlYXhI5aRHoa0Ooo8+CBgP60vfHtU+4MWiiMlxu/ZUs=; b=Rx/jgLf60lhaj2
	7YESvjBdSYL8cZzNwtv6ShJPnrsnPPkSO13wSmTGJ11zc8sgS5c2rV+J6u62ggfy6nqV0rFH42+iP
	xgkKLI+WnJ+gsSmKyAMe/sJomjmmUn7442TfpO3Opx7Ua5dbkMwnmfNi7ZHNo79Bmikl1i9/ptB7U
	UhAes9Pft2clX9XuGK5jpwxxcZxShbEcyERiKZRuDgETu1IQHzz6nXVgy2xiNX8m97XDv355VgtrT
	YRqUQjYlV+Ry7DsSIlveqQGv5U+gDJsTzJi1Y0MdpL3dERl5eisyZzM92xlJ1/U//F6R1O2V9lauG
	lky36OMmivFBXHg39Mtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2wgU-007TGd-Kw; Mon, 12 Jul 2021 14:13:22 +0000
Received: from mail-io1-f42.google.com ([209.85.166.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2wgF-007TDv-E9; Mon, 12 Jul 2021 14:13:09 +0000
Received: by mail-io1-f42.google.com with SMTP id k16so22762967ios.10;
 Mon, 12 Jul 2021 07:13:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=h/6h0UaJMVg2aWVUlChzhWyuF5oxMGeyK9DMCIo1kac=;
 b=RO3t9uzBWSZGyZpqrla3d/9+naxcLorMnY4zMTK9PnDWMtRTDVFkV8bIGQlpd+Vmub
 o58FbqJXmsoGn09ug+CQhrVApgeTTlIMXqUlgFhS6Jr0q+dHbCDmr3Qm0rh6TNFl9ZRd
 fzDDYMsiNSH3z6jy+e9Q8LjD9kkJ7fjE+Zx3JbbbFNFHK8flAp9OBOOz7rH1kWEf+DOj
 /hCsAK9uWWt7X2A8XGqgtdLPCk/PU9v6Kcndx1wu7+phos6Zt/GVvnX/3fiNNbz19IHL
 W2Kx6i7La6L43hJtM4v9zvLSr8AjvCIU4sqiXXkhRKcH6kMRIwRYdSniMoGwmkYr0Jm9
 0hYQ==
X-Gm-Message-State: AOAM533Rx9GfYMvVGTLyKNXWmpuPpkTY1y/Nypx72+BmbiQLUL2Mmvsi
 naNq6eyQ6XqT7QQs+nmhaQ==
X-Google-Smtp-Source: ABdhPJzuceYJTODmyK39U/Ix01ehe/gL8uY9ss4zcLfaiWqtvKuO9aUo1PaMhbGijJhZFJrCm9lhCw==
X-Received: by 2002:a5e:9306:: with SMTP id k6mr41405170iom.157.1626099180376; 
 Mon, 12 Jul 2021 07:13:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id z70sm7921281iof.13.2021.07.12.07.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 07:12:59 -0700 (PDT)
Received: (nullmailer pid 1850542 invoked by uid 1000);
 Mon, 12 Jul 2021 14:12:53 -0000
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 NXP Linux Team <linux-imx@nxp.com>, 
 Jaehoon Chung <jh80.chung@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 mauro.chehab@huawei.com, linux-arm-msm@vger.kernel.org, 
 Sascha Hauer <s.hauer@pengutronix.de>, Masami Hiramatsu <mhiramat@kernel.org>,
 linuxarm@huawei.com, 
 linux-arm-kernel@axis.com, devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 linux-kernel@vger.kernel.org, Lucas Stach <l.stach@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, Jonathan Chocron <jonnyc@amazon.com>, 
 linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, Richard Zhu <hongxing.zhu@nxp.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-omap@vger.kernel.org, 
 Jingoo Han <jingoohan1@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, 
 linux-samsung-soc@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Andy Gross <agross@kernel.org>, Greentime Hu <greentime.hu@sifive.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
 Shawn Guo <shawnguo@kernel.org>
In-Reply-To: <fa846c83165894accdac1715c3fddfbdcb060958.1625838920.git.mchehab+huawei@kernel.org>
References: <cover.1625838920.git.mchehab+huawei@kernel.org>
 <fa846c83165894accdac1715c3fddfbdcb060958.1625838920.git.mchehab+huawei@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: designware-pcie.txt: convert it
 to yaml
Date: Mon, 12 Jul 2021 08:12:53 -0600
Message-Id: <1626099173.609840.1850541.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_071307_506094_69D8B34B 
X-CRM114-Status: GOOD (  13.50  )
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

On Fri, 09 Jul 2021 15:57:42 +0200, Mauro Carvalho Chehab wrote:
> Convert the file to DT schema.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../bindings/pci/amlogic,meson-pcie.txt       |   4 +-
>  .../bindings/pci/axis,artpec6-pcie.txt        |   2 +-
>  .../bindings/pci/designware-pcie.txt          |  77 ----------
>  .../bindings/pci/fsl,imx6q-pcie.txt           |   2 +-
>  .../bindings/pci/hisilicon-histb-pcie.txt     |   2 +-
>  .../devicetree/bindings/pci/kirin-pcie.txt    |   2 +-
>  .../bindings/pci/layerscape-pci.txt           |   2 +-
>  .../bindings/pci/nvidia,tegra194-pcie.txt     |   4 +-
>  .../devicetree/bindings/pci/pci-armada8k.txt  |   2 +-
>  .../devicetree/bindings/pci/pcie-al.txt       |   2 +-
>  .../devicetree/bindings/pci/qcom,pcie.txt     |  14 +-
>  .../bindings/pci/samsung,exynos-pcie.yaml     |   2 +-
>  .../bindings/pci/sifive,fu740-pcie.yaml       |   2 +-
>  .../devicetree/bindings/pci/snps,dw-pcie.yaml | 135 ++++++++++++++++++
>  .../pci/socionext,uniphier-pcie-ep.yaml       |   2 +-
>  .../devicetree/bindings/pci/ti-pci.txt        |   4 +-
>  .../devicetree/bindings/pci/uniphier-pcie.txt |   2 +-
>  MAINTAINERS                                   |   2 +-
>  18 files changed, 160 insertions(+), 102 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pci/designware-pcie.txt
>  create mode 100644 Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/intel-gw-pcie.example.dt.yaml: pcie@d0e00000: '#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'clocks', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'linux,pci-domain', 'max-link-speed', 'phy-names', 'phys', 'ranges', 'reset-assert-ms', 'reset-gpios', 'resets' do not match any of the regexes: 'pcie?@[0-9a-f]+$', 'pcie?_ep@[0-9a-f]+$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/snps,dw-pcie.example.dt.yaml: pcie@dfc00000: '#address-cells', '#interrupt-cells', '#size-cells', 'device_type', 'interrupts', 'ranges' do not match any of the regexes: 'pcie?@[0-9a-f]+$', 'pcie?_ep@[0-9a-f]+$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
\ndoc reference errors (make refcheckdocs):
Documentation/devicetree/bindings/pci/pci-keystone.txt: Documentation/devicetree/bindings/pci/designware-pcie.txt
Documentation/devicetree/bindings/pci/pci-keystone.txt: Documentation/devicetree/bindings/pci/designware-pcie.txt
Documentation/devicetree/bindings/pci/pci-keystone.txt: Documentation/devicetree/bindings/pci/designware-pcie.txt
Documentation/devicetree/bindings/pci/pci-keystone.txt: Documentation/devicetree/bindings/pci/designware-pcie.txt
Documentation/devicetree/bindings/pci/pci-keystone.txt: Documentation/devicetree/bindings/pci/designware-pcie.txt
MAINTAINERS: Documentation/devicetree/bindings/pci/designware-pcie.txt

See https://patchwork.ozlabs.org/patch/1503171

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
