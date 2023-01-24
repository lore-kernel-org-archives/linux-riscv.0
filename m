Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4565BC25B4E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 08:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AKN/n3cwJRiuw+Y0xUzCfChRRXxmaP5pk1eeKdTLF1c=; b=GxF+EMXHJOIIH2
	8A3TNIOEm/r5Tik5E1WA4SR+UuwPU0kq6rXy9kmvWzZ8bDFym2zwz1WOFLdpzZR6hybU2HIM8zXha
	O/CUUCOIC3bb6PMGr98vKXn9+XS3l3EqG5CCq3bA8zcCr78AXZPwOYAxsGD3I7ISoBCmzNdyCHqy9
	hkAhHO8gVVUfi8Zm+vddI4FaJIkq5Usl0HuP1vfbNS4FcbVe4EhfWpAnHGQ79SjLk6IfWxzV6y4aj
	qQ/N9oBE1F1Vr3AwWLIoOWbhvkMjt6WKRllrswk8qnB6iN+6iCpCYT00urXVVvtEnceio9cCqe0pZ
	X8B1AxwpznPNZnSNPE5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKEV9-002iWp-VB; Tue, 24 Jan 2023 08:17:55 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKEV5-002iTg-Oq
	for linux-riscv@lists.infradead.org; Tue, 24 Jan 2023 08:17:53 +0000
Received: by mail-wm1-x334.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so12235319wma.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jan 2023 00:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OiP0gZn/cpqwNmZsHPi77/HmJt+0GSm02rEXJE0mZuc=;
        b=rz5WOHaNNlWgEXLRbetKeX7R0dRN7zSC9YmNQarI9o4w7Tq5jxfXRqxTsxgHzpx4I9
         0yCwad4pvGwH35vsywIACFAKq4+tmuXHMABvAo0ziD9anYJtCqDdCdcshYllGX+jL33S
         V2jUHNwZjihkw5PkuVs6JSLbPqas8jVCHD1eRQgn0qmI9O5z3akmD8e0KxYGOkHPcExc
         Fs2kH8M96BLXC3Qw6sek5qgvA/pZtumGefcPFbod9+08KQP1qc8bRANz9r4AuZ40tlvZ
         UWZ75isPIPXvR1YDxyxT4wsID9oqc6K65nm1U6AzoDk60eiCoeQHwjb7C+rjvLNcASJE
         as0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OiP0gZn/cpqwNmZsHPi77/HmJt+0GSm02rEXJE0mZuc=;
        b=HlSbKDjJBJmTTk+Yu4rTof/Y8hJ4/kAZb7lS1bym2nWi7sTWfJpqTAWUsp5zbLq2OO
         jA31Zk/HGcd1o1AD0fXG85cjgHbnkiIEId2jS29EMFcMCwJpS8XeHP9zXeXUB0ZOM8jQ
         zaEBpp97o5myQOVTIQVHJxQmJyfDiG3vDtPzOQeMvbHpI4OO8nz07epG+jY5k0PTjw0r
         qkTRa4xjuPecC3/yOEeIXAjYfNs0hXpb6VBtJZpvJIWy8dLdcmdFKhX4P2jfyFVR9Lg3
         oDA/gY4Q7nSzPF1zeHLUDLGJHJ55SLLUQSr8iKRl8K8clUkvgpzVxlMJ/QggWhCYeImb
         ryTQ==
X-Gm-Message-State: AFqh2kqrURy3TUhlSY/d4AkCBe0ygQ5YgfqbHyeYeZ52wig1G8RLzLtZ
	cF0Q4njISuBL30hOJA6zqjBWAA==
X-Google-Smtp-Source: AMrXdXunRvOxaqJzjCgh5gUlJhksZxNRxnNWUPvYFTObnizcuMzYRwgIcDkar5wVJKqfvWoZ4n/TQw==
X-Received: by 2002:a1c:6a10:0:b0:3da:f665:5b66 with SMTP id f16-20020a1c6a10000000b003daf6655b66mr27262779wmc.6.1674548268129;
        Tue, 24 Jan 2023 00:17:48 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g16-20020adffc90000000b002882600e8a0sm1298395wrr.12.2023.01.24.00.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 00:17:47 -0800 (PST)
Message-ID: <934be0a4-3639-5f72-cf54-b796b32df484@linaro.org>
Date: Tue, 24 Jan 2023 09:17:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/2] spi: dt-bindings: cleanup examples - indentation,
 lowercase hex
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
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
 <20230118173932.358153-2-krzysztof.kozlowski@linaro.org>
 <20230123201751.GA2450665-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230123201751.GA2450665-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_001751_818630_5E488D72 
X-CRM114-Status: GOOD (  15.22  )
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

On 23/01/2023 21:17, Rob Herring wrote:
> On Wed, Jan 18, 2023 at 06:39:32PM +0100, Krzysztof Kozlowski wrote:
>> Cleanup examples:
>>  - use 4-space indentation (for cases when it is neither 4 not 2 space),
>>  - drop redundant blank lines,
>>  - use lowercase hex.
>>
>> No functional impact except adjusting to preferred coding style.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../bindings/spi/amlogic,meson-gx-spicc.yaml  |  26 +--
>>  .../bindings/spi/amlogic,meson6-spifc.yaml    |  22 +--
>>  .../bindings/spi/aspeed,ast2600-fmc.yaml      |  24 +--
>>  .../bindings/spi/brcm,spi-bcm-qspi.yaml       | 156 +++++++++---------
>>  .../bindings/spi/cdns,qspi-nor.yaml           |   4 +-
>>  .../bindings/spi/nvidia,tegra210-quad.yaml    |  42 ++---
>>  .../bindings/spi/qcom,spi-qcom-qspi.yaml      |   1 -
>>  .../devicetree/bindings/spi/renesas,rspi.yaml |  22 +--
>>  .../bindings/spi/spi-sunplus-sp7021.yaml      |   4 +-
>>  .../devicetree/bindings/spi/st,stm32-spi.yaml |   1 -
>>  10 files changed, 150 insertions(+), 152 deletions(-)
> 
> [...]
> 
>> diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
>> index d35c6f7e2dd5..18afdaab946d 100644
>> --- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
>> @@ -95,7 +95,6 @@ examples:
>>               <&dmamux1 1 40 0x400 0x05>;
>>        dma-names = "rx", "tx";
>>        cs-gpios = <&gpioa 11 0>;
> 
> Looks like the indentation needs adjusting here.
> 

Ack

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
