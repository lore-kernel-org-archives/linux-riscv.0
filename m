Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DDEC76196
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 18:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J6wtuCHAHICRTaT/qnqt9QVZGBJh+ibe587eZ2ZUKz4=; b=oFaBiA8A5HVk5b
	9raafucBt1wY0MYJPQmnLfMU0if6yP0knvsVQPPSZ0yxbartVAIp4gVmEekaUDSQXD2Dg65G9521m
	LpKYQNz8LY9dkne92PuNm5Irc09j+GJCpg5NO9iKb5D45Rj3JMV8vgcvcAZHWg66Njj5/0C6rI3Up
	ZYPnGtl4Etd880sC57jghbp5LqkITHVf09vEUVbXcnjVEKdOWtmdkr52t9R7nad0ELd4unV+umzVZ
	OhSkZE8uU4EUIIEVNdvzO/yll3LR+xey+W0zRrjknVNDlG87IXomMa1ZWJ65lxtSD9VvgWOYyhMPN
	fR8HYosylh40wQgBdqzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUJ8-008FZD-1d;
	Thu, 06 Apr 2023 18:26:02 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUJ5-008FYO-33
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 18:26:01 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-93071f06a95so159148466b.2
        for <linux-riscv@lists.infradead.org>; Thu, 06 Apr 2023 11:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680805556;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j7Q2Y5PSxjfNuuYETIJE0tc7Nl05PML4hPeE9FZ3t1U=;
        b=LyZ0MroWIx7yQATTWi7dnR72e4lHzBaxVKcXKV8E0fOBtt5cs33Bxj0rkLYm1qvpjt
         71iqLmw6M1SjavFuptr1hBspndmbtGClUbMoef355RRW6Kjj64Vfjzch8aDKLvoitFbU
         2iacdF2BOo8dFbpfDl0fCQgD7CUTVlNKhJ0IGbFt6oeJ/i1t27Dw2UbjcONJ6coEyzYO
         gDo7HDb1tVCN12jaKk6KhYoL0Jn8wtZsjFhCOh34qTKOwIGIzbHMgFLvenMjg/RvpxV4
         X6ZxgN4fsN7VPwD5qbKOC47UKOeC4fGrgg+04Pkgm1xqJfUvV6SlB6vTN00qA+YH+n7d
         3QJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680805556;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j7Q2Y5PSxjfNuuYETIJE0tc7Nl05PML4hPeE9FZ3t1U=;
        b=tuM94tsIkh3MbC7bTtSo6p5BVVng/AWn8XP0unc/VwnOyhsKWKBSu5sYn27xsu0j1t
         DpxVeGm9sQAEP9dQTBp9uXlWwRjodkK6WQ2w3iC++hdJBUhsghaaIyJZFj+YP69x4+Dc
         e7qWYz/AQDxdbE0ZW5vq5CWaZ/0z3C+6MeGZcHc2KWBf8z8LcJ8VLtgA5rumf88KJppW
         j8ltn1OmDVO+xKzgUUQA8gA4YLTnfdAkUeXS2SvCXvuPOQ91RIiHHwDN/L2N5XUnP4EO
         XCjyQTM6u7X+qYu7zcXP084L+KYaKBI5Z6e8YLLVA5IzpZlACiZDSKaAMYoVjkJOXCka
         7MVw==
X-Gm-Message-State: AAQBX9fVvE+oazlEWP1HclEhBam14pku2jmMLdHWt+3ZkyduQgWzKe7k
	rc07FckswRhJUF1Th7sEJD6mEA==
X-Google-Smtp-Source: AKy350Z+LY2W1omro8GAJRTq6Ah27eM8V7j5+Ouj215Swxjc9vV2rpYK6UOXULEWcDwfHrTaFnUnhw==
X-Received: by 2002:aa7:c647:0:b0:4fc:6475:d249 with SMTP id z7-20020aa7c647000000b004fc6475d249mr434834edr.3.1680805556612;
        Thu, 06 Apr 2023 11:25:56 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed? ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id a29-20020a509b5d000000b004fd204d180dsm1029128edj.64.2023.04.06.11.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 11:25:56 -0700 (PDT)
Message-ID: <56e47e45-b3c0-4d32-923c-88023faef827@linaro.org>
Date: Thu, 6 Apr 2023 20:25:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 3/3] riscv: dts: starfive: add PCIe dts configuration
 for JH7110
Content-Language: en-US
To: Minda Chen <minda.chen@starfivetech.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mason Huo <mason.huo@starfivetech.com>,
 Leyfoon Tan <leyfoon.tan@starfivetech.com>,
 Kevin Xie <kevin.xie@starfivetech.com>
References: <20230406111142.74410-1-minda.chen@starfivetech.com>
 <20230406111142.74410-4-minda.chen@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230406111142.74410-4-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_112559_986218_E7058812 
X-CRM114-Status: GOOD (  13.38  )
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

On 06/04/2023 13:11, Minda Chen wrote:
> The PCIe is a PCIe2, single lane PCIe compliant controller.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-2.dtsi         | 58 ++++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 88 +++++++++++++++++++
>  2 files changed, 146 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index cf0a66faf5d3..4552919e69b0 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -191,6 +191,50 @@
>  		};
>  	};
>  
> +	pcie0_wake_default: pcie0_wake_default {

No underscores in node names. Test your patches against bindings before
sending.


>  	uart0_pins: uart0-0 {
>  		tx-pins {
>  			pinmux = <GPIOMUX(5, GPOUT_SYS_UART0_TX,
> @@ -228,3 +272,17 @@
>  	dr_mode = "peripheral";
>  	status = "okay";
>  };
> +
> +&pcie0 {
> +	pinctrl-names = "default";
> +	reset-gpios = <&sysgpio 26 GPIO_ACTIVE_LOW>;
> +	phys = <&pciephy0>;
> +	status = "okay";
> +};
> +
> +&pcie1 {
> +	pinctrl-names = "default";
> +	reset-gpios = <&sysgpio 28 GPIO_ACTIVE_LOW>;
> +	phys = <&pciephy1>;
> +	status = "okay";
> +};
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 2f67196ffac0..c309ec550ba7 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -642,5 +642,93 @@
>  			#reset-cells = <1>;
>  			power-domains = <&pwrc JH7110_PD_VOUT>;
>  		};
> +
> +		pcie0: pcie@2B000000 {

Lower case hex.

> +			compatible = "starfive,jh7110-pcie";
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			#interrupt-cells = <1>;

Why reg is not second property?

> +			reg = <0x0 0x2B000000 0x0 0x1000000
> +			       0x9 0x40000000 0x0 0x10000000>;
> +			reg-names = "reg", "config";
> +			device_type = "pci";
> +			starfive,stg-syscon = <&stg_syscon 0xc0 0xc4 0x130 0x1b8>;
> +			bus-range = <0x0 0xff>;
> +			ranges = <0x82000000  0x0 0x30000000  0x0 0x30000000 0x0 0x08000000>,
> +				 <0xc3000000  0x9 0x00000000  0x9 0x00000000 0x0 0x40000000>;
> +			interrupts = <56>;

Your binding requires cells, so I am pretty sure you did not test what
you wrote.



Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
