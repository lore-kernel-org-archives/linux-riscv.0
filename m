Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F3BC38142
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 07:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNe7Fi+/27MkKm778uWw4VQvO+PJFC4ds48gfAMJSIs=; b=VAeT37MJfZPldBPL4JFXBWVrra
	qFM1e2kjtI7bjOlIbHFg4ovLgNkQLz4DTjp7IqoI2GFoqQ+72POG2yrd7QJw+HJiZ8a/mnGjAz276
	LIP4swuT0286qy5NrHvikRIRV+ThofiYIRSSodJURFmlDZutjeiXrdFF1zyVssrvnq5BYjhyKRWY2
	Hrq2y7arrYkzb+IQpWFl2bc70P06hxhK/x4hbGs1dy//NytFsBgavoK3hbDHdtbUJgW6mETgXAm4U
	5Af3vj+UGgcJvCNd9ABSJ9L7UaTHwFJeeNxGFiLn9uUK8JY4RbXRwc7rHt0GrvAG19yS4yOwya236
	84RPVj/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIPE5-003pbK-I2; Thu, 19 Jan 2023 07:20:45 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIPE1-003pZR-VG
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 07:20:43 +0000
Received: by mail-wm1-x330.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so2909232wml.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jan 2023 23:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EonMWt4N08H4pcq7W9DgoBt7pacxKJTS9n8ZU1ACaR4=;
        b=c5k888DHCMgwj2p4c7VKB+53hbN8QqUUGD+eq4cBJ9SFiF/Lcsd2MBJc6I+F/CglPN
         TSHD5ijJMGyCKkf8ZgRZxEUVgGHTVq6170KaXg7gnYBHlJvVAyAjam/Hp/T4I6RiVuB7
         TWHXbsgI7BqheCpGU6MPZOhYHQVXZxIK54s9NeSXWMSgxU+TkALp6He4GOjDEgd4BlE6
         822Cuvr+uUPA/zcB3X5loJ7MfWIgMGisEfZlN2ZcSvT7UenCQkSEYtIf6HjfoZmaBYwk
         acTxloUojf3EbUtOlGH+zsgWf4s2kiqpP7Hc6FrBklnpn+KcNBmD7rGwm7CjmVkBmUdO
         jPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EonMWt4N08H4pcq7W9DgoBt7pacxKJTS9n8ZU1ACaR4=;
        b=tb/q890CmjqLPXC3R+Asxc62VsLfnlkCWPbxoB9HRTFSC5+VhT9xZ5S0WbKGbqU46i
         EPRZHt+6+aNU0E99pUgW/UvxUn9NHSbh1cMli3qAZFqTX2ccmKkfAo6wX/ruirWNUive
         cGJEBllAL4C4hynrHOmEwWpNt1sfqmi1UQ1FhfO0GLlFs5D0Ii+tMHzSu05CY9RnpZ1h
         XFsM4+fdINe2bABfwjvyBYOiMFo8181WF5AffJebN1jQ32sEz6VdtqErXJZ6yZbV2kLV
         iwKb7hoW4l6GyndGXRjo0qMXUKVHiYxf1S7hw+a3wmJw8+O3AVVkLTjMP1U4+r90U8Dy
         9XIw==
X-Gm-Message-State: AFqh2krJrP4iNGDrw0YBgR4kQbdI9FLGiTRPRSSEeV02KmRdv/X46BiQ
	H+swXKXHZSr6AtpJpwiiYjhkNQ==
X-Google-Smtp-Source: AMrXdXvWsSpXnziYInRsyzHlCtWTCvH0LOIewncRqr3HS2r29MSj6gXsgc/2gLu1d+ZnN7zjC8CbUA==
X-Received: by 2002:a05:600c:4f8d:b0:3d3:3d1b:6354 with SMTP id n13-20020a05600c4f8d00b003d33d1b6354mr5351090wmq.3.1674112838626;
        Wed, 18 Jan 2023 23:20:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3936:d49c:4a01:ee1e? ([2a01:e0a:982:cbb0:3936:d49c:4a01:ee1e])
        by smtp.gmail.com with ESMTPSA id l23-20020a05600c1d1700b003db0dbbea53sm4488667wms.30.2023.01.18.23.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 23:20:38 -0800 (PST)
Message-ID: <ad80f09b-3e05-ac71-b471-2b0279eb5ae6@linaro.org>
Date: Thu, 19 Jan 2023 08:20:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] spi: dt-bindings: drop unneeded quotes
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goat?=
 =?UTF-8?Q?er?= <clg@kaod.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Han Xu <han.xu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
 Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Li-hao Kuo <lhjeff911@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?77+9ZWNraQ==?=
 <rafal@milecki.pl>, Vaishnav Achath <vaishnav.a@ti.com>,
 Parshuram Thombare <pthombar@cadence.com>, Leilk Liu
 <leilk.liu@mediatek.com>, Gabor Juhos <juhosg@openwrt.org>,
 Bert Vermeulen <bert@biot.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Marek Vasut <marex@denx.de>, Birger Koblitz <mail@birger-koblitz.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Anson Huang <Anson.Huang@nxp.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Kuldeep Singh <singh.kuldeep87k@gmail.com>,
 Pragnesh Patel <pragnesh.patel@sifive.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Erwan Leray <erwan.leray@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_232042_075433_2AD7567C 
X-CRM114-Status: GOOD (  14.39  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 18/01/2023 18:39, Krzysztof Kozlowski wrote:
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/spi/allwinner,sun4i-a10-spi.yaml  |  2 +-
>   .../bindings/spi/allwinner,sun6i-a31-spi.yaml  |  2 +-
>   .../bindings/spi/amlogic,meson-gx-spicc.yaml   |  6 +++---
>   .../bindings/spi/amlogic,meson6-spifc.yaml     |  6 +++---

For meson changes:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

>   .../bindings/spi/aspeed,ast2600-fmc.yaml       |  2 +-
>   .../devicetree/bindings/spi/cdns,qspi-nor.yaml |  2 +-
>   .../devicetree/bindings/spi/cdns,xspi.yaml     |  6 +++---
>   .../bindings/spi/fsl,spi-fsl-qspi.yaml         |  2 +-
>   .../devicetree/bindings/spi/fsl-imx-cspi.yaml  |  2 +-
>   .../bindings/spi/mediatek,spi-mt65xx.yaml      |  2 +-
>   .../spi/mediatek,spi-slave-mt27xx.yaml         |  2 +-
>   .../bindings/spi/mikrotik,rb4xx-spi.yaml       |  2 +-
>   .../bindings/spi/mxicy,mx25f0a-spi.yaml        |  2 +-
>   .../devicetree/bindings/spi/mxs-spi.yaml       |  2 +-
>   .../bindings/spi/nvidia,tegra210-quad.yaml     |  2 +-
>   .../bindings/spi/qcom,spi-qcom-qspi.yaml       |  5 ++---
>   .../bindings/spi/realtek,rtl-spi.yaml          |  2 +-
>   .../bindings/spi/snps,dw-apb-ssi.yaml          |  2 +-
>   .../devicetree/bindings/spi/spi-cadence.yaml   |  2 +-
>   .../devicetree/bindings/spi/spi-fsl-lpspi.yaml |  2 +-
>   .../devicetree/bindings/spi/spi-gpio.yaml      |  4 ++--
>   .../devicetree/bindings/spi/spi-mux.yaml       |  4 ++--
>   .../devicetree/bindings/spi/spi-nxp-fspi.yaml  |  2 +-
>   .../devicetree/bindings/spi/spi-pl022.yaml     | 18 +++++++++---------
>   .../devicetree/bindings/spi/spi-rockchip.yaml  |  2 +-
>   .../devicetree/bindings/spi/spi-sifive.yaml    |  6 +++---
>   .../bindings/spi/spi-sunplus-sp7021.yaml       |  2 +-
>   .../devicetree/bindings/spi/spi-xilinx.yaml    |  2 +-
>   .../bindings/spi/spi-zynqmp-qspi.yaml          |  2 +-
>   .../devicetree/bindings/spi/sprd,spi-adi.yaml  |  5 ++---
>   .../devicetree/bindings/spi/st,stm32-qspi.yaml |  2 +-
>   .../devicetree/bindings/spi/st,stm32-spi.yaml  |  2 +-
>   .../bindings/spi/xlnx,zynq-qspi.yaml           |  2 +-
>   33 files changed, 53 insertions(+), 55 deletions(-)
> 

<snip>

> diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
> index 53eb6562b979..e5eca3a6f132 100644
> --- a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
> +++ b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
> @@ -2,8 +2,8 @@
>   # Copyright 2019 BayLibre, SAS
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/spi/amlogic,meson-gx-spicc.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/spi/amlogic,meson-gx-spicc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Amlogic Meson SPI Communication Controller
>   
> @@ -41,7 +41,7 @@ properties:
>       maxItems: 2
>   
>   allOf:
> -  - $ref: "spi-controller.yaml#"
> +  - $ref: spi-controller.yaml#
>     - if:
>         properties:
>           compatible:
> diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
> index ac3b2ec300ac..806043fed4d1 100644
> --- a/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
> +++ b/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
> @@ -2,8 +2,8 @@
>   # Copyright 2019 BayLibre, SAS
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/spi/amlogic,meson6-spifc.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/spi/amlogic,meson6-spifc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Amlogic Meson SPI Flash Controller
>   
> @@ -11,7 +11,7 @@ maintainers:
>     - Neil Armstrong <neil.armstrong@linaro.org>
>   
>   allOf:
> -  - $ref: "spi-controller.yaml#"
> +  - $ref: spi-controller.yaml#
>   
>   description: |
>     The Meson SPIFC is a controller optimized for communication with SPI

<snip>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
