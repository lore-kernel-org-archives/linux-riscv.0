Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06A2C27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 09:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Zyr7JTU4UuRo6QDebb2aOFZEkwwOhiKysUgt84qT1k=; b=kt/FXnFFmxA+J2
	ZGMcoYJpwsjLHjZipCoFJt5v1TW0nWvzPi3eBBwJUwiiS38P+pYp4vVAAfRk+Kir2CYDA4QVg0hyV
	PDcMnogMTqnMmIQKOfBKcnQCzUJPSTXjjaaMRgLvxPopmW2B5uOyqqeXZtTdH2hhT72ut6rFM27No
	3tBrmVJSIUZmG+2P86o1kXd9vOqIGGwCjMESD9nkxucwUiqf2R2g64xdQh3XcOXu3y4VDxKVDk98I
	KcBB9elftiGomaCOY/0ymGqSz0svzLVGvwVxz4wHGr6UfZiWP/Qk9V79zGxnfH9KdYElivQHxe31+
	g/iedv5LweeE03wyRCJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJVKj-0000000ECnB-0VcC;
	Tue, 18 Jun 2024 09:40:57 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJVKh-0000000ECmU-0VgM
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 09:40:56 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-52c7f7fdd24so6531669e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jun 2024 02:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718703653; x=1719308453; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1dUAwLlzqf/kLhtXAP0bzcDfhg1+v3m5zpzjEvnZvI=;
        b=HenXnXiviQKB1JIEr94imNwjhSCklW5x1sq0/uVg9JQzEyJiqPUEsz1H1S1z9jjTHR
         ZAqK3uhrZSSEAFWdamDgE8nwCIhPuGh5et7pW/6+uKbtqw1nWOPAx4piK9nhEUT1AhHV
         yxD27UjoIlIiGdVmZn+BGouPHkPiiuMNLDse98sMGSfIiQWXyiKeyOmAXquG69VAGJzL
         /5FvTPv1kKY0xfUutYpyxsEWyeOYr3zx/be0vON+JiS+1EpgySxyTXOJWveJFQO8zrnZ
         9BMGlHtf/zXwMbJAqROyZmEqc5791+q359dJY3SAt9780zF5URBJmWKGTb5cvUvOc2oa
         h2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718703653; x=1719308453;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q1dUAwLlzqf/kLhtXAP0bzcDfhg1+v3m5zpzjEvnZvI=;
        b=Z9b+k16BwlgYJm3afHRCXDYwmmQJfyL0gIZwSWn5XHmyCgMFgfhydybkATl832Mhfn
         AStWAVHmb4JEqsyJuvM7A6EalHHxfVyjiDhulul+i38OD25Rj5fJbvJphy6dC/mgAoqc
         Nfz5CNb5d5uPZHtuhUgj9QrmCWB76vrNamZHiY7ChoIfZdFrpD0dZBN3TcUrY/64J+TS
         K323/mAcPe+6n7rT9QlFg8FzSbglaVjH8ZVMn04oKiCgubPD5St5T1Vdx+bZJvWVmvtL
         JD/fxgS7/JR0pSgon2T1hYAS1VLSScjftjuUEbyL83/DbcNZQvVmv/2pWuo/DmCX6rvv
         M1vg==
X-Forwarded-Encrypted: i=1; AJvYcCWHzTMxySolf9rSaZDVXQZ8yO15IFrkZudWllIRfeOnVGrHK1lyDIiK3Gzjef3q28SAt2ZElWDtT0DAPxMnVNMfyHKJZIlj1O1muLsnJ+8r
X-Gm-Message-State: AOJu0Ywd2YpKrSH2KqhxCu2qS4sP/DLW5jTefUbRFx5SB955eFaKremf
	R+zJJ7lUWFrA0KhVQ+k+8XM4H5i51u91vuAfnnzLKoIpGmubQAfqKgxcpXHlj9Q=
X-Google-Smtp-Source: AGHT+IFW4Mx2N85kJ7p6HdOoFLfWozgy2f4xtgZ+uqGFT3wZK0oboBOmMnX4YcNUGqA3hYiDQhDaZg==
X-Received: by 2002:a19:2d1c:0:b0:52c:a5d6:2f27 with SMTP id 2adb3069b0e04-52ca6e9035emr6828300e87.50.1718703653227;
        Tue, 18 Jun 2024 02:40:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f602f620sm182613095e9.19.2024.06.18.02.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 02:40:52 -0700 (PDT)
Message-ID: <bb6036e2-613c-4d36-bcbc-3a407e3c727b@linaro.org>
Date: Tue, 18 Jun 2024 11:40:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] riscv: dts: add mmc controllers for Sophgo SG2042
 SoC
To: Chen Wang <unicornxw@gmail.com>, adrian.hunter@intel.com,
 aou@eecs.berkeley.edu, conor+dt@kernel.org, guoren@kernel.org,
 inochiama@outlook.com, jszhang@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh@kernel.org, ulf.hansson@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org,
 chao.wei@sophgo.com, haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com,
 tingzhu.wang@sophgo.com
Cc: Chen Wang <unicorn_wang@outlook.com>
References: <cover.1718697954.git.unicorn_wang@outlook.com>
 <e2d3b19e06fa29116b8032addc70c8dc1ec3866e.1718697954.git.unicorn_wang@outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <e2d3b19e06fa29116b8032addc70c8dc1ec3866e.1718697954.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_024055_267132_D0307CD2 
X-CRM114-Status: GOOD (  11.94  )
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

On 18/06/2024 10:39, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> SG2042 has two MMC controller, one for emmc, another for sd-card.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 17 ++++++++++
>  arch/riscv/boot/dts/sophgo/sg2042.dtsi        | 32 +++++++++++++++++++
>  2 files changed, 49 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> index 49b4b9c2c101..164db23586e0 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> @@ -14,6 +14,23 @@ chosen {
>  	};
>  };
>  
> +&emmc {
> +	bus-width = <4>;
> +	no-sdio;
> +	no-sd;
> +	non-removable;
> +	wp-inverted;
> +	status = "okay";
> +};
> +
> +&sd {
> +	bus-width = <4>;
> +	no-sdio;
> +	no-mmc;
> +	wp-inverted;
> +	status = "okay";
> +};
> +
>  &uart0 {
>  	status = "okay";
>  };
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> index 81fda312f988..bfdfd6f32912 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> @@ -346,5 +346,37 @@ uart0: serial@7040000000 {
>  			resets = <&rstgen RST_UART0>;
>  			status = "disabled";
>  		};
> +
> +		emmc: mmc@704002a000 {
> +			compatible = "sophgo,sg2042-dwcmshc";
> +			reg = <0x70 0x4002A000 0x0 0x1000>;

Lowercase hex.

> +			interrupt-parent = <&intc>;
> +			interrupts = <134 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =

Odd wrapping. Don't. See DTS coding style.

> +				<&clkgen GATE_CLK_AXI_EMMC>,
> +				<&clkgen GATE_CLK_100K_EMMC>,
> +				<&clkgen GATE_CLK_EMMC_100M>;
> +			clock-names =

Ditto

> +				"core",
> +				"timer",
> +				"card";
> +			status = "disabled";


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
