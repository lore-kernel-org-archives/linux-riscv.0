Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C16CC61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 09:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SgC4qIt6/I9Qmcx2zk8niRM+U1iAZUTe12kTWKegvFE=; b=LVvFAz71dILEAY
	DOkq58/G13ZyYRtMphmGfVeMOb8kuUrqm/MYdUlICuwRP4YRHuRvBA0trrtnYf0JbGfUxS0/9YPke
	B0SGMROAgdJIDcSQuFfbzqVstjpWBH1EVrnR6dCMOxFDenczYz/T2k7RKbT/8qMNAvJUNp+rYpbF9
	ABOeXNQwt4/rQONdixnHy7nVxJT9AWlRTvDhBrp78elPvTTy3hN3B/PPXHBKZFasbko23DAs8JWyc
	7sLlphnQM5uoJZNTcubfNCh89QHxZuEJAzQOip88CQXCy8GtRPHmQrY9eiV1vXbaMW9ezL9mM+vt/
	X0Oo27PbxpQnUehFa4+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUl8U-00BL7x-Va; Wed, 22 Feb 2023 09:10:02 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUl8R-00BL5b-DY
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 09:10:00 +0000
Received: by mail-wr1-x435.google.com with SMTP id p8so7109275wrt.12
        for <linux-riscv@lists.infradead.org>; Wed, 22 Feb 2023 01:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ubuy4lrHVayY+gCmE+zSECXr6/1O7hAoJ2UbRAjtNSw=;
        b=GaNiGUYdc/5Rd9TgV8ZhJyQgKwb86qxML5ImgRwqDaILUvc4RQMMqYQ1Ai+6aFMQNh
         alvxIy7fdDFomBJnMqUeuR5cLOGJBNA9DoFr/fIvIFf20jIrYJfMFOaq9lGx7anYIFon
         7OP/fuhru9ehYV1ikjg2StHR0CJ6lWXtMsLwSxfG8OpDtVQ2CKgYrw69ZJmCVHo8XTay
         MBHBGZIQTgXy/WfOe1/aKWNpOdcMKAoorL+JPAjq3PTvM12BvD75cKSGOfZXxLDP6XmK
         /3vHfqDswB7Ivmp7wPDcBPL3NtmoglTBPGZbOP7WyYE0N4eFSmCkKPR2yVsX46u+OZCf
         RJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ubuy4lrHVayY+gCmE+zSECXr6/1O7hAoJ2UbRAjtNSw=;
        b=0F+GapEY5HEXfZInBASQT3am4KIxrMkqcS1KMohBXnVAbxOXgGCC0v9wYJmd4PbCo+
         pjwKcGQr6eN2fuQrFR2H/AzYLwD8esreyB9iSkjAyozJ0jegZdQL/JPAYvgR5jms3BiB
         gYhHH7iy5ny44zwEHln+d/ErHku5kucrY64VMeuuXtMLL8LRTEVQlcIIKZWMDqSF6Ryq
         becmjZDZOQGfto3ms/duoHxmwX1haTqLi0kub+VJ93SLp4Yy3AyLADLaZmrL0QhDrkuz
         iJH5iRx8dneckrCrx1g0BPLu1zun5Sv/Jo7bM6x7tmx7nRYW+Sau8BT0ydtiRoLc6Z5N
         qxEQ==
X-Gm-Message-State: AO0yUKXpQUypaKmg6rF2y1zyvyflhG1A+BFah2dCffSFA7lutCb/CjX8
	vNHOTUwTxrYvktF1Yw4kw8AHaw==
X-Google-Smtp-Source: AK7set9dCMxJ/Z20zUDFqH3zxjNit+AwoLo+j7n6AMy1qGnV0bAqTf0janE3/tVP+eAS5g+i3WOkRg==
X-Received: by 2002:a05:6000:18a5:b0:2c3:d032:5b29 with SMTP id b5-20020a05600018a500b002c3d0325b29mr7485828wri.12.1677056995564;
        Wed, 22 Feb 2023 01:09:55 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u4-20020adfed44000000b002c706c754fesm3425292wro.32.2023.02.22.01.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 01:09:55 -0800 (PST)
Message-ID: <a799e064-b0ac-7300-b706-0c33e2d3610a@linaro.org>
Date: Wed, 22 Feb 2023 10:09:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 3/3] riscv: dts: starfive: jh7110: Add PLL clock node
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20230221141147.303642-1-xingyu.wu@starfivetech.com>
 <20230221141147.303642-4-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230221141147.303642-4-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_010959_495150_51512EA9 
X-CRM114-Status: GOOD (  14.00  )
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

On 21/02/2023 15:11, Xingyu Wu wrote:
> Add the PLL clock node for the Starfive JH7110 SoC and
> modify the SYSCRG node to add PLL clocks.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index b6612c53d0d2..0cb8d86ebce5 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -461,12 +461,16 @@ syscrg: clock-controller@13020000 {
>  				 <&gmac1_rgmii_rxin>,
>  				 <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
>  				 <&i2srx_bclk_ext>, <&i2srx_lrck_ext>,
> -				 <&tdm_ext>, <&mclk_ext>;
> +				 <&tdm_ext>, <&mclk_ext>,
> +				 <&pllclk JH7110_CLK_PLL0_OUT>,
> +				 <&pllclk JH7110_CLK_PLL1_OUT>,
> +				 <&pllclk JH7110_CLK_PLL2_OUT>;
>  			clock-names = "osc", "gmac1_rmii_refin",
>  				      "gmac1_rgmii_rxin",
>  				      "i2stx_bclk_ext", "i2stx_lrck_ext",
>  				      "i2srx_bclk_ext", "i2srx_lrck_ext",
> -				      "tdm_ext", "mclk_ext";
> +				      "tdm_ext", "mclk_ext",
> +				      "pll0_out", "pll1_out", "pll2_out";
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
>  		};
> @@ -476,6 +480,13 @@ sys_syscon: syscon@13030000 {
>  			reg = <0x0 0x13030000 0x0 0x1000>;
>  		};
>  
> +		pllclk: pll-clock-controller {

Does not look like you tested the DTS against bindings. Please run `make
dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
for instructions). You should see here warnings of mixing non-MMIO nodes
in MMIO-bus.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
