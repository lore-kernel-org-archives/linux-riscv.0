Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C23EEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 12:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dxajn/HWBi3Dv7zOXzKjFW+AltukJfyiS4O8XPdYtu4=; b=T9O2pLpBAtSh0I
	JwROTjm7xtRFxF5HKvekUSpTQWZ/idwbS/6fQI7Nrh2qw5HYFKcDrtBcTQB5leNmtk9g7V2ZAq6rp
	7xJyEpmBSyNz5UgzeP+QeIEpB2rcR4C4IIIzCfqx9FIrTdSZTwWSnxAwIhMgpb9/bAv9bo+0gC1Mm
	ixkFlp4ISSfa1hRYbk2GIaqbZhh7X0YBPgfgS6f8nAOBAGmqNsy/PPH7rTJyaJFcRYDcnGuXnErvb
	pgwhkWpuozjbik/w4hcjzCcvpTfuUXB5Z3dBFS+BAwh4hXTOdWC03Q1YtA8MTp61voBrQB4ToRDG0
	h1oCLB5r1SNlCxGoxh0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBDrm-008Sqp-1z;
	Mon, 19 Jun 2023 12:20:18 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBDrk-008Sq2-0V
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 12:20:17 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-988c495f35fso91614266b.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jun 2023 05:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687177214; x=1689769214;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r8IkgjCbYZ6ybcsI1GkHhRXG+M118R7BE1wtTAsnJr8=;
        b=ClBnqG9Gjo9yzp03JC2sB9Tl5OykGEG0MCJfr1gRTiPcMlb2sUa63W1A/h/3FcWLZ6
         Oy+I69ZWHgkwChDAddgOpSJnOFM9+abTF6e1r5FBj+O42kaBoGYG0U0mC7k920HYfGIF
         FAQh/w9ifmvIm7waigd8Lj1Y4DeFo1UeUkH8y2Lgf0RZYTSMy9fabS9jneySUICduSAY
         wMB/lz9ssGuuLUzSwZuB8bSDc+sZMiRDCHVvS3SSpsbJYgUQkDKp5xuBM7QUy0586W4B
         sy3v8JwtknzXVgYmQgfnckuUpNmuLUpsd+2aCcn03JLheYs9kqu0H6wjdMY2qpPD1A24
         +J1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687177214; x=1689769214;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r8IkgjCbYZ6ybcsI1GkHhRXG+M118R7BE1wtTAsnJr8=;
        b=P19if4YvCVruQ7uqc8iRGX1kyPf7De0bMCLdukQSS8QiH66aU6E0dgVUmCcjJxqy1x
         WWRHxnxUru4JdWPuk8UKn7QCXV25heNF2u4l4+Buy664kZfqBswBJWMA1p71d7jmvv5A
         GLqk9sPsW7+fM/CE98VgbK04tg+M/iKWl9HvubBF6PRzS5T6+/hVoS658yVDkdDKEqPh
         S6lSznV5weMWjFn2pIL9hbI+B/leNGP+k5UoPpfCNaFycfqVMkjCWkMOa3tQrqC/AH/l
         bVxVh2JtrqijpPW5YruUDoKmE5uvLhZfwuxKlSdSQvM8+3ce0Gzs5teNYcbz+rztDSU4
         lX3Q==
X-Gm-Message-State: AC+VfDx3FTwNnMwRZ67C5zId7Y9kPfCPJkxxuNwttTZKcsBZS5V4KEKH
	qCL59t3BuA9yFN9vTEF5OArejw==
X-Google-Smtp-Source: ACHHUZ47zEpJ6DeZD7uVxLdbu7k9xsdXjPX7y1tBu5kP3TPtRM2Jk60R/mDNGae7578PNVPH21KORg==
X-Received: by 2002:a17:907:7d86:b0:978:8790:9103 with SMTP id oz6-20020a1709077d8600b0097887909103mr9499787ejc.70.1687177214016;
        Mon, 19 Jun 2023 05:20:14 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id c21-20020a170906341500b00985bdb7dd5fsm4805480ejb.201.2023.06.19.05.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 05:20:13 -0700 (PDT)
Message-ID: <7b7694da-8b40-d76a-adca-4cf9aa206ff4@linaro.org>
Date: Mon, 19 Jun 2023 14:20:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 3/3] riscv: dts: starfive: Add QSPI controller node for
 StarFive JH7110 SoC
Content-Language: en-US
To: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Ziv Xu <ziv.xu@starfivetech.com>
References: <20230619083517.415597-1-william.qiu@starfivetech.com>
 <20230619083517.415597-4-william.qiu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230619083517.415597-4-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_052016_199006_CB16D3BA 
X-CRM114-Status: GOOD (  13.69  )
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

On 19/06/2023 10:35, William Qiu wrote:
> Add the quad spi controller node for the StarFive JH7110 SoC.
> 
> Co-developed-by: Ziv Xu <ziv.xu@starfivetech.com>
> Signed-off-by: Ziv Xu <ziv.xu@starfivetech.com>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-2.dtsi         | 32 +++++++++++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 18 +++++++++++
>  2 files changed, 50 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index 2a6d81609284..22212c1150f9 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -126,6 +126,38 @@ &i2c6 {
>  	status = "okay";
>  };
>  
> +&qspi {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	nor_flash: flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg=<0>;

Missing spaces.

> +		cdns,read-delay = <5>;
> +		spi-max-frequency = <12000000>;
> +		cdns,tshsl-ns = <1>;
> +		cdns,tsd2d-ns = <1>;
> +		cdns,tchsh-ns = <1>;
> +		cdns,tslch-ns = <1>;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			spl@0 {
> +				reg = <0x0 0x20000>;
> +			};
> +			uboot@100000 {
> +				reg = <0x100000 0x300000>;
> +			};
> +			data@f00000 {
> +				reg = <0xf00000 0x100000>;
> +			};
> +		};
> +	};
> +};
> +
>  &sysgpio {
>  	i2c0_pins: i2c0-0 {
>  		i2c-pins {
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 4c5fdb905da8..0b24f9e66e67 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -440,6 +440,24 @@ i2c6: i2c@12060000 {
>  			status = "disabled";
>  		};
>  
> +		qspi: spi@13010000 {
> +			compatible = "starfive,jh7110-qspi", "cdns,qspi-nor";
> +			reg = <0x0 0x13010000 0x0 0x10000
> +				0x0 0x21000000 0x0 0x400000>;

This should be two items so <>, <>. Not one item.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
