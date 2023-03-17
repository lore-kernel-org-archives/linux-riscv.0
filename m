Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B265C6FD1D
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 08:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vZEmPpnz0qVsCP1BDsJs591ydGjuB+nQtkXX0fMr8v0=; b=AqVRTLAoQycKjB
	+V3q6h1cmlZyD2i0nUsZ9XYGMho3FslyLCWi0iRJUUvZZTE31o5v+lfXLYulIkruq/7oxdwo1m1l3
	UYHk92RhA1vKp64ssWkEcBuO9FeYOpopfWItVwosPVeHYNMOcs8pm9GWe0LDMpYuptLPEmnX/OBOS
	WM6Pv6eQGzxz/Nox9Xb0P0RPBRV+bffH1WEWp7sfMvwYuU/5+Z9BqUhKYSOTtB6vPcMpsBLHpktlB
	TGjnipesKm3b7CUdcNRcUyQdPBS2ASC8odF55g/foEakE9qA2wL9AWluHslyctBgFrlCutx2vTaKe
	notB0YmoIpX1NirJplrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd5hZ-001Xnv-32;
	Fri, 17 Mar 2023 08:44:41 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd5hV-001Xln-0z
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 08:44:40 +0000
Received: by mail-ed1-x536.google.com with SMTP id x3so17397313edb.10
        for <linux-riscv@lists.infradead.org>; Fri, 17 Mar 2023 01:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679042675;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=juFmrQz7oKZJRVloOKbAwgle6hn0N8TdFSrYHqJtuGs=;
        b=alyQrUOzldXMFXcXM/xm57EnS7Biz1DBBOCfYjMGS+7LLhegBZpU9leCj5vcMtwmLE
         HPYbUWzopVK2UWhT9Bx7o8W2KKqzOF217Tx1jZER1jkeAb+WEfIt1utEjhcXplxyfiXr
         afYezteJUkdwfm/v7IsGnLl+azcWRjGVbhVTLeYnlgJ8dj7jozEzDh1WVtibhJlpbd2s
         0cwY/4DtVZTvNe11Lusn/tfqI0zA/RUH3kdSWB+qpiluR41RRA6+VJmJXQjVJKw1u5BS
         n/HdliYLBUZFLH9SseWrmT0axULEsZPJGH3m4b8zBoKFeI24PCS+QeULJ8TPc9wKv1d7
         ZQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679042675;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=juFmrQz7oKZJRVloOKbAwgle6hn0N8TdFSrYHqJtuGs=;
        b=GQiH/3v1EaVjnAXKHJwey99uQgeC0SkG/LDCd+9tBDXmwdmBB2+UGCIzEoylARMMtx
         oX0er6Q3S1Uy4h+auImGxjela6L8+MXZ19Ib2MB0UzpFZfH37dZmewwBO/jM3/JDND3U
         RFY4TrI0XJZinF4VMb/K9ro7EhXgHryaibHqzUVTT7/y9ROIgx7zIV/raHu3vF4YIPuj
         rGqs0N2sCxzx2rBg6Bd5Ne+lynsVffrzUEwyQG72sn6dcxrOpWbZuApN+ETu2WqvEZ0T
         HNsEBRkUF4Q93hc9LIkaOKlBUZy3RCA42+2fLkM1N2cDeOSNsnke57UwyvvGbR1brL+p
         ipgA==
X-Gm-Message-State: AO0yUKW15cy0LQeV/mvANtkeVomDwFgaTpUfHYJck2sej4jthAV3PMpn
	H8hq/Zjw4n3p0/Y+y5VfOjXhNg==
X-Google-Smtp-Source: AK7set8TDDSh0NPwZz11d/QCnupF+zzxPhz66o7xVZyQ0Nwr55I5QWoofBSxOkS7LU7Suo6Z4CCdEw==
X-Received: by 2002:a17:906:568a:b0:931:d8db:8a2f with SMTP id am10-20020a170906568a00b00931d8db8a2fmr1374810ejc.58.1679042675695;
        Fri, 17 Mar 2023 01:44:35 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:848a:1971:93e0:b465? ([2a02:810d:15c0:828:848a:1971:93e0:b465])
        by smtp.gmail.com with ESMTPSA id lt11-20020a170906fa8b00b008e54ac90de1sm701978ejb.74.2023.03.17.01.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 01:44:35 -0700 (PDT)
Message-ID: <79593668-6ded-7290-f39b-e226d30e6e95@linaro.org>
Date: Fri, 17 Mar 2023 09:44:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 5/5] dts: usb: add StarFive JH7110 USB dts
 configuration.
Content-Language: en-US
To: Minda Chen <minda.chen@starfivetech.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Conor Dooley <conor@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Pawel Laszczak <pawell@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Chen <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20230315104411.73614-1-minda.chen@starfivetech.com>
 <20230315104411.73614-6-minda.chen@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230315104411.73614-6-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_014437_371583_55DF8AB0 
X-CRM114-Status: GOOD (  14.23  )
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

On 15/03/2023 11:44, Minda Chen wrote:
> USB Glue layer and Cadence USB subnode configuration,
> also includes USB and PCIe phy dts configuration.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

> ---
>  .../jh7110-starfive-visionfive-2.dtsi         |  7 +++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 54 +++++++++++++++++++
>  2 files changed, 61 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index a132debb9b53..c64476aebc1a 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -236,3 +236,10 @@
>  	pinctrl-0 = <&uart0_pins>;
>  	status = "okay";
>  };
> +
> +&usb0 {
> +	status = "okay";
> +	usbdrd_cdns3: usb@0 {

You should rather override by phandle this as well.

> +		dr_mode = "peripheral";
> +	};
> +};
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index f70a4ed47eb4..17722fd1be62 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -362,6 +362,60 @@
>  			status = "disabled";
>  		};
>  
> +		usb0: usb@10100000 {
> +			compatible = "starfive,jh7110-usb";
> +			clocks = <&stgcrg JH7110_STGCLK_USB0_LPM>,
> +				 <&stgcrg JH7110_STGCLK_USB0_STB>,
> +				 <&stgcrg JH7110_STGCLK_USB0_APB>,
> +				 <&stgcrg JH7110_STGCLK_USB0_AXI>,
> +				 <&stgcrg JH7110_STGCLK_USB0_UTMI_APB>;
> +			clock-names = "lpm", "stb", "apb", "axi", "utmi_apb";
> +			resets = <&stgcrg JH7110_STGRST_USB0_PWRUP>,
> +				 <&stgcrg JH7110_STGRST_USB0_APB>,
> +				 <&stgcrg JH7110_STGRST_USB0_AXI>,
> +				 <&stgcrg JH7110_STGRST_USB0_UTMI_APB>;
> +			starfive,stg-syscon = <&stg_syscon 0x4 0xc4 0x148 0x1f4>;
> +			starfive,sys-syscon = <&sys_syscon 0x18>;
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x0 0x0 0x10100000 0x100000>;

reg and ranges should be second property. This also applies to your
binding example.


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
