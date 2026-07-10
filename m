Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F03C43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 16:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SnAWe2i1spGpWR+xWpRPu9I7wcRQha2UmZcJgSa84lE=; b=pzpD2z2JoB9B8A
	JZW3Mb7TCHK1Purc+BBODbuYbAczljXXagnN3B2r/VCeZsghFRF+qnl+wI0Tdrsnmsd8MM5jRtGYt
	LozbJi5FMPINQPN/k5OZfoGMTV9pgOIFFoj1o25U+DvBUQp6sfkoCNITJWFF2YAy9eywtEHvsoZJt
	hnVy5FVzRm4rUUevaqMHGXu4KL+SFA12Q3GAJugd9i9NTwRVUJYTkX+7iQopd1bfFNnw+ik5hEWv6
	g4HyrXLGM7wis4jn45eUNAxWr3KcCmMNhcL/YDM8oKIiKaB5UK987ofTmBrkBFsr/7ESAUuixubSd
	SFB/S2gSzilHFm6gACbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDfJ-00000005Etm-1Px0;
	Fri, 10 Jul 2026 16:01:25 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDfG-00000005Esu-1cN2
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 16:01:24 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-80c8c9ae040so13344137b3.2
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 09:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1783699281; x=1784304081; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1hTfHUanZhIXs0ZjukXO0cd1RP2eKmvIle5TeFGqJ2E=;
        b=0Nkyhg4ZG3M58rXPi/bW8sAq4InSGf+zEt+x61wq+kxPfDcSEg3tL3GEKpdYy717L3
         g5tIm+HWw7BdxrF5iMjnhaTOI5kXdcFe+GSX2wvIPFOaiz+HORk+qRZ6dMilx9bFGogh
         a2CYPAeSMF6x1VQJKGtNz3lQlFaVurldNsYQY9rNzTOBTKqdFAz6AMCTy7rJ54wG6ewx
         RGC9oQRk6SP+BvHMVW2hS2D53KjymNVuSYP4QeqhvjkAmBMsk1fkXxclkMdBDB1X5DxZ
         VTtB4e7wB+FmZyxeQ0KyqSN5y4eog2JXqiFGOlh+Z1XennwYpu2Xz4mKQDtDZJqtOKJz
         VbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783699281; x=1784304081;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1hTfHUanZhIXs0ZjukXO0cd1RP2eKmvIle5TeFGqJ2E=;
        b=WWoSKfz3BbjbM+OabJVbkXkXI1iPXUP9ns1llv/20la2DYzhyZoi6ah8QSNrW2cwh2
         8UT5vhMn0bpQhzlBExqqZkVS9LBaPYnTQyCz25WhKGgZlScr8tsdaOMvv12IzDBVtiAH
         bIRDiB7EsR1g9tS5hftv/j8sCm8gv99DaAoAZmpmrbesACpMxKUG3yTrVr5rhyjFeBHe
         nRzAF4yZQI+1IffEAybgC2u9LbFFHfYLfLjeiYUo6+dcW+uuao7aLCiQVVDl1ZQ23yDH
         jZd9hEAkvuR56V+ox5kx7duBXF171TMJKh5gaYUPFyW02yicrqJFYuEktpgOVQaRMTpj
         fWvg==
X-Forwarded-Encrypted: i=1; AHgh+Rr0gQvKDtYgWowRvrYcrKarsCyN0jlD9SFCmFAYCwOD/9GUMx/0UgW438e3sCL4QeAptMkk1uqolTegjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGhrOB5qnsO8ixvDh8x1WRcYuFMtP3k/qMZrpfFRlTDockE7sb
	V2/4hP215UuXZ0Wa/qqn66enSPP2Tm7A17scSpqROqu8bRV3kksP+AVH0yfd6VtgDyQ=
X-Gm-Gg: AfdE7clj+AmT0In2AFW5ELI0wFuH95mmwFTqQCRwS5mEM0LJv18g4J+/5b1BI5oxEQd
	5s9r7RNO3jUqjEa0QieFUUAc1/hmrX4o7BulBEyxylxkhxCwdP6NNz+OV7aTE71o+vSJdnbwWuB
	DeK4yTqgx+2orz0xfEz4wIa62P1Q57jFNgCPfoAScyiI1eo+7AzNVkt4kk1uQuJxwqkMuymy6Bd
	cAQ4/HvNdLIJQss5SXUgedzCd/kZH3q6ncqAcr2PyaA85U9RNkxxP9a5oI/7G3l3ovSPVee9zaO
	uc7JO42Ol95CBWHJS90odZ82NU8GJsM7u85SGJdlFHGdwy/GDoyIKRtdOxWtRaoZRWZ3yhl65kB
	X1hjktOBpGqXYnPDDcX1OGxBGjYfUQIb1OmArNOGM0d/O/W4QqFaKRXAEcnr9DT02EnXMyFjBVR
	syDiwI9AFG2AhRPcSWhrCKkd0=
X-Received: by 2002:a05:690c:6384:b0:81e:8112:c5c9 with SMTP id 00721157ae682-81e8112ef15mr20197907b3.3.1783699280936;
        Fri, 10 Jul 2026 09:01:20 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9036e27f765sm8965376d6.11.2026.07.10.09.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 09:01:20 -0700 (PDT)
Message-ID: <338687f9-e80e-40e8-b14e-1218e61e4e0c@riscstar.com>
Date: Fri, 10 Jul 2026 11:01:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] PCI: spacemit-k1: Add device data support
To: Inochi Amaoto <inochiama@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Christian Bruel <christian.bruel@foss.st.com>, Frank Li <Frank.Li@nxp.com>,
 Nam Cao <namcao@linutronix.de>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Xincheng Zhang <zhangxincheng@ultrarisc.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vidya Sagar <vidyas@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-2-inochiama@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260709040027.958400-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_090122_697473_238FC3F6 
X-CRM114-Status: GOOD (  25.64  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 7/8/26 11:00 PM, Inochi Amaoto wrote:
> To reuse the K1 PCIe driver logic for K3 PCIe controller, add device
> data to handle the K1 specific logic and make room for the incoming
> logic for K3.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

I have two suggestions/questions, but I think this looks
good overall (please add the space that Andy suggested).

If you drop the data field in the k1_pcie structure you
can keep this tag:

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/pci/controller/dwc/pcie-spacemit-k1.c | 30 ++++++++++++++++---
>   1 file changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> index be20a520255b..f6ae8ff3589a 100644
> --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> @@ -49,8 +49,17 @@
>   #define PCIE_CONTROL_LOGIC			0x0004
>   #define PCIE_SOFT_RESET			BIT(0)
>   
> +struct k1_pcie;
> +
> +struct k1_pcie_device_data {
> +	const struct dw_pcie_host_ops *host_ops;
> +	const struct dw_pcie_ops *ops;
> +	int (*parse_port)(struct k1_pcie *k1);
> +};
> +
>   struct k1_pcie {
>   	struct dw_pcie pci;
> +	const struct k1_pcie_device_data *data;

Is it strictly necessary to keep a copy of the data
pointer in the k1_pcie structure?

It can be convenient to do so if you reuse the fields
in that structure rather than duplicating them, but
often the constant platform data is meant only for
initialization, and never needed after that.

>   	struct phy *phy;
>   	void __iomem *link;
>   	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
> @@ -278,14 +287,21 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
>   
>   static int k1_pcie_probe(struct platform_device *pdev)
>   {
> +	const struct k1_pcie_device_data *data;
>   	struct device *dev = &pdev->dev;
>   	struct k1_pcie *k1;
>   	int ret;
>   
> +	data = device_get_match_data(dev);
> +	if (!data)
> +		return -ENODEV;
> +
>   	k1 = devm_kzalloc(dev, sizeof(*k1), GFP_KERNEL);
>   	if (!k1)
>   		return -ENOMEM;
>   
> +	k1->data = data;
> +
>   	k1->pmu = syscon_regmap_lookup_by_phandle_args(dev_of_node(dev),
>   						       SYSCON_APMU, 1,
>   						       &k1->pmu_off);
> @@ -299,11 +315,11 @@ static int k1_pcie_probe(struct platform_device *pdev)
>   				     "failed to map \"link\" registers\n");
>   
>   	k1->pci.dev = dev;
> -	k1->pci.ops = &k1_pcie_ops;
> +	k1->pci.ops = data->ops;
>   	k1->pci.pp.num_vectors = MAX_MSI_IRQS;
>   	dw_pcie_cap_set(&k1->pci, REQ_RES);
>   
> -	k1->pci.pp.ops = &k1_pcie_host_ops;
> +	k1->pci.pp.ops = data->host_ops;
>   
>   	/* Hold the PHY in reset until we start the link */
>   	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
> @@ -320,7 +336,7 @@ static int k1_pcie_probe(struct platform_device *pdev)
>   
>   	platform_set_drvdata(pdev, k1);
>   
> -	ret = k1_pcie_parse_port(k1);
> +	ret = data->parse_port(k1);
>   	if (ret)
>   		return dev_err_probe(dev, ret, "failed to parse root port\n");
>   
> @@ -338,8 +354,14 @@ static void k1_pcie_remove(struct platform_device *pdev)
>   	dw_pcie_host_deinit(&k1->pci.pp);
>   }
>   
> +static const struct k1_pcie_device_data k1_pcie_device_data = {
> +	.host_ops	= &k1_pcie_host_ops,
> +	.ops		= &k1_pcie_ops,
> +	.parse_port	= k1_pcie_parse_port,
> +};
> +
>   static const struct of_device_id k1_pcie_of_match_table[] = {
> -	{ .compatible = "spacemit,k1-pcie", },
> +	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data},

In addition to the missing space that Andy mentioned,
adding a comma means the line won't need to change
when you add another entry to the array.

>   	{ }
>   };
>   


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
