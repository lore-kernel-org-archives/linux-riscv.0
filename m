Return-Path: <SRS0=/Tun=ML=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50DF0C07E95
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 22:03:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDA4A610CC
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 22:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDA4A610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gr9sF9RMPC94iYeLPcjENm+xef0TVW+ppEtAT4SvB+Y=; b=lEdXTWeg/5murH
	4h/AFTzPOKgKCcd6BVnpuFD/JEK5phiPlJJqKgyKA3uW51HzcG18nXMS3DYnwOCO7f6nMISv/d61h
	en4S2ad1Rls0x4thqgl9vmMGsKe3MckqjQzd7uml08AR0gdKhoLM3n6QI5BHq/UsytquuQzAkJEvM
	A1VZ534c4xZ3+kXHNeFTqTPo2tuwsZHsjf3+PgNkt+Mp3LlcwFTfC7dMeKdQHZzSAfAr0oRi7QhhI
	ejsTbL33lQB9dIm2xkv34Ay1OZNSAqIagaSHi/UdrJfofIV/VPgbOhjwu1WFxxy37T+unrwJZxUZp
	6LOanY6UVWNgrMt6eeGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5bLe-00BNyF-8K; Mon, 19 Jul 2021 22:02:50 +0000
Received: from mail-il1-f176.google.com ([209.85.166.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5bLP-00BNwd-K7; Mon, 19 Jul 2021 22:02:37 +0000
Received: by mail-il1-f176.google.com with SMTP id y6so17397247ilj.13;
 Mon, 19 Jul 2021 15:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f1jPjrRlaCoGW6NcDg+XE1Qycqf9T6zQzCIsLWnTwZQ=;
 b=RYUalILH+9oyxYOqXwGDyx9oPlvRyNUKV7BVPihAd75MthJHPWGQPbT/QiEKTLlHlg
 ZIQMuxHigRdKVJJEzOrPlyP3ZWVBMKIBp+AaeCurpV9oRpDGMLjMuY9YpDSHIMwiBD8i
 ViwylPVGOyvRlOn828eDwMkBbzEQ+XbZK55uCWsnMObcBubP4ngIOD7YKME8jOj48gHX
 rm8k1GVli9Sh7QT1H+Gyc7JAz7g10dvCv/GZkFDd7Wcg68MkEat/RKBy/FPsTkVOl0Wo
 F4iT/UB/GXc6/oSI1q7cqM6bzwuF/dVLHyKUOlEu8rRqkjtGnJryTsmx7xH6AEfOmA/p
 uWfw==
X-Gm-Message-State: AOAM532SAkJDpjGQ2W5MsXayHKwz3v3LgQfQnW8lNs/lHd7rQYAgPxiI
 u4b/pesqdhT+E4oGKzHKXA==
X-Google-Smtp-Source: ABdhPJw7EeICoNwI7faYsy/ynAxnzY/CYjaXAly9aLu6w9Sr0yXeF9bmNozCXqaxmtS1LZg+Uz4WKw==
X-Received: by 2002:a92:d706:: with SMTP id m6mr17728297iln.78.1626732154753; 
 Mon, 19 Jul 2021 15:02:34 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id o13sm10372829ilq.58.2021.07.19.15.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 15:02:34 -0700 (PDT)
Received: (nullmailer pid 2677074 invoked by uid 1000);
 Mon, 19 Jul 2021 22:02:27 -0000
Date: Mon, 19 Jul 2021 16:02:27 -0600
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Xiaowei Song <songxiaowei@hisilicon.com>,
 mauro.chehab@huawei.com, Jonathan Hunter <jonathanh@nvidia.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Lucas Stach <l.stach@pengutronix.de>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Kevin Hilman <khilman@baylibre.com>, 
 Binghui Wang <wangbinghui@hisilicon.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 linux-omap@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@axis.com, 
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, 
 Andy Gross <agross@kernel.org>, linux-riscv@lists.infradead.org, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 linux-arm-msm@vger.kernel.org, Greentime Hu <greentime.hu@sifive.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Richard Zhu <hongxing.zhu@nxp.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
 NXP Linux Team <linux-imx@nxp.com>, Jonathan Chocron <jonnyc@amazon.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
 Shawn Guo <shawnguo@kernel.org>, linux-pci@vger.kernel.org, 
 Neil Armstrong <narmstrong@baylibre.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 linuxarm@huawei.com, Thierry Reding <thierry.reding@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>
Subject: Re: [PATCH v5 3/5] dt-bindings: PCI: update references to Designware
 schema
Message-ID: <20210719220227.GA2676918@robh.at.kernel.org>
References: <cover.1626608375.git.mchehab+huawei@kernel.org>
 <dfff4d94631546c53450d1baeddc694dd26b5c36.1626608375.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dfff4d94631546c53450d1baeddc694dd26b5c36.1626608375.git.mchehab+huawei@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_150235_701379_BDA78AF0 
X-CRM114-Status: GOOD (  10.96  )
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

On Sun, 18 Jul 2021 13:40:50 +0200, Mauro Carvalho Chehab wrote:
> Now that its contents were converted to a DT schema, replace
> the references for the old file on existing properties.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../devicetree/bindings/pci/amlogic,meson-pcie.txt |  4 ++--
>  .../devicetree/bindings/pci/axis,artpec6-pcie.txt  |  2 +-
>  .../devicetree/bindings/pci/fsl,imx6q-pcie.txt     |  2 +-
>  .../bindings/pci/hisilicon-histb-pcie.txt          |  2 +-
>  .../devicetree/bindings/pci/kirin-pcie.txt         |  2 +-
>  .../devicetree/bindings/pci/layerscape-pci.txt     |  2 +-
>  .../bindings/pci/nvidia,tegra194-pcie.txt          |  5 +++--
>  .../devicetree/bindings/pci/pci-armada8k.txt       |  2 +-
>  Documentation/devicetree/bindings/pci/pcie-al.txt  |  2 +-
>  .../devicetree/bindings/pci/qcom,pcie.txt          | 14 +++++++-------
>  .../bindings/pci/samsung,exynos-pcie.yaml          |  4 ++--
>  .../devicetree/bindings/pci/sifive,fu740-pcie.yaml |  4 ++--
>  .../bindings/pci/socionext,uniphier-pcie-ep.yaml   |  4 ++--
>  Documentation/devicetree/bindings/pci/ti-pci.txt   |  4 ++--
>  .../devicetree/bindings/pci/uniphier-pcie.txt      |  2 +-
>  15 files changed, 28 insertions(+), 27 deletions(-)
> 

Applied, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
