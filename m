Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693ECCA1013
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 13:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J68F4AcsxTJqFWrom2FxbA3rrXAScKbom/Nh2VxLIJk=; b=N+O7XGv9cgQknv
	7t4NvS5fOeTgEQwxyxi0+DPVQfwtZlFh2vpmiseYicLfy9UTbMwtYbAnNIbhBnKUkGG40XKzOdp7T
	126chTbGvZJbceDf4oTohXBSlw4nh4wzcWBwWxrS46MUKSA0nze3++6UMLmoYIePz4ks8eqVCLiAy
	CmAOxAAnTIYVJ8bBntOKOw7SfN6ls8hNDLk2Zo/4HSWBoVqeVAsU5fo3qUOG4l3yUCE+FLRYgbXFS
	XAu1IfgJvrRnVHKIg5lqdV9/dO0C8lkZdJntRSyfl5tCpTqr2PkGTNIU8HRXhNwrXGIUhCVTeVTM2
	1ctxjutRkItPMj4ZzLMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzF2o-0000000Hass-1jzj;
	Thu, 18 Sep 2025 13:51:30 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzF2l-0000000HasW-2Xtk
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 13:51:28 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-88432e60eebso27652939f.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Sep 2025 06:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758203486; x=1758808286; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vM4y9eRdzyomlugDECoWGADI8eAEH9U89ng3nFm0pbU=;
        b=QTLIPvmrZNb9Pl0aKa8+PlKLuPMTnmq0Ba0TBRwwht6absn4u8Yxlzsd+BUcCSf8YJ
         LxWDV3BMaNkrjP1RaZGgbngxMUcQXXBlQ88dnuNVpU/J70FPLdbTwZ52U92P4cLPbf/v
         WaP6eYUWH1i800V27/xZtric8tJQrhQ9LWHelEb7TgYVffmPTw33JwzHVGvUKtXDHbYI
         aieKfIXO3AnvX7FQHP48ZsUAz+/cD0tvnMVtWwva17UiuNn2sHyJ3K42o8/TsiLIOBwi
         RUZcfr/uSojTVEWTWR//6Q42yrU6iEyJCviRU3tK9XjK4euQy6HxOVz6W9+8B+P0dENr
         5WMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758203486; x=1758808286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vM4y9eRdzyomlugDECoWGADI8eAEH9U89ng3nFm0pbU=;
        b=TUVXrP+oCn5cAnIEUgXZvXVNXuAU1aBbTdwVHOZriyKTG15styXKJ9Tp+A4+AzRSWH
         fh043PbkhtpoB82SKHwqXxvKXUhdK1RwLGMdaJi092Hdw8vUVrTosbq/S9WdyPAXHZ6G
         pWvQR7Jc/BvPB/Y0OLwpS3G44r7MSlnlEza6T7hwXgabrJmKKe6Nm/LqKR3A+fz4XYTk
         DwGU6EyHCsfzWxapEH7Wev4e+eeuD4+ZfXyQv3LwGyv7im0ROLFkvzU6GDUNhJrrWDSz
         vTQwaZnzyWYA9rh2Svo6eUXA6ncZtvJdGeUnTMF4qXO0AIYtlKGenifQki0DtPop7Ll/
         Z6RA==
X-Forwarded-Encrypted: i=1; AJvYcCUz4aZw8sv6ZlcEki/++Sa6ICe77oFFLjIXcsIk5QHpRSVA5dW2wjDTbVLwy5cQ3YLP9ghrObQpmmT8ww==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr/uVjwhjTfVdbfO918uo5oq0n1m+BFQl2/lBI0mEiVlWaW6tb
	DsiDluElRCpdB9iCkzVscStLjfruXehRkuWlNy0CUDa+Lk66+9UOfboiDQeshM3tA3Y=
X-Gm-Gg: ASbGncsu9FbXetvnYD7rBITm2Ca7A8BM3QjbRzqFjvGpU8bSdcvQGb0yu6oJeBtWbqj
	NG6ncu5Q2cN+EPYyB5Q9Q24iJuo7jhuaG/wjwNbSALmfCu27yKKo/XfU4NP4rvZtWFkPB3cPNRy
	RRwqOjT7dc/ROQFRhhmwuxHhcz+tnXy3jxV8u1xt01kru0XmRxqZaEwU1aEjLVP1CFCtrfuq5fx
	hhw6l9CR6cwAsD3D/l1D9XadMZ6/qXQmNQpua6eTLKXdoze9ETBTbJZZdQ2nWMxvDX/r9D2Dls2
	FvONj5QTJqqFe2DYa1u9VbwHjEwGq0WVenguxDo+CJJQlC9pn3lIpCjJDgRHGvVcUv6MGrPSHuy
	MO4C/vYvDJdRBSZmzWt5obP0wullo0MVaoJAjy8FGa59RVG3F1GaQlmc8Zj2YTbIR7E2lQ6jYsS
	/+2KqeK+/2SHd6r6Ju
X-Google-Smtp-Source: AGHT+IHGLUiTqtzLxz7lFW1lX9Y3PBwmaxFa80wh+wM2x5l9w0PsCrOK+nmIqYNhug9aW0T3WfX/Vg==
X-Received: by 2002:a05:6602:3413:b0:887:55f8:5dea with SMTP id ca18e2360f4ac-89d296b6ed1mr938651239f.14.1758203486168;
        Thu, 18 Sep 2025 06:51:26 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8a484d05729sm81694739f.28.2025.09.18.06.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 06:51:25 -0700 (PDT)
Message-ID: <5956e320-7cbb-4d9a-95a7-720cfa6b9654@riscstar.com>
Date: Thu, 18 Sep 2025 08:51:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: define a SPI controller node
To: Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-4-elder@riscstar.com>
 <20250918133209-GYB1273705@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250918133209-GYB1273705@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_065127_657823_735ECCF6 
X-CRM114-Status: GOOD (  18.77  )
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

On 9/18/25 8:32 AM, Yixun Lan wrote:
> Hi Alex,
> 
> On 17:07 Wed 17 Sep     , Alex Elder wrote:
>> Define a node for the fourth SoC SPI controller (number 3) on
>> the SpacemiT K1 SoC.
>>
>> Enable it on the Banana Pi BPI-F3 board, which exposes this feature
>> via its GPIO block:
>>    GPIO PIN 19:  MOSI
>>    GPIO PIN 21:  MISO
>>    GPIO PIN 23:  SCLK
>>    GPIO PIN 24:  SS (inverted)
>>
>> Define pincontrol configurations for the pins as used on that board.
>>
>> (This was tested using a GigaDevice GD25Q64E SPI NOR chip.)
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   .../boot/dts/spacemit/k1-bananapi-f3.dts      |  6 ++++++
>>   arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 20 +++++++++++++++++++
>>   arch/riscv/boot/dts/spacemit/k1.dtsi          | 19 ++++++++++++++++++
>>   3 files changed, 45 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> index 6013be2585428..380d475d2f3f3 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> @@ -44,6 +44,12 @@ &pdma {
>>   	status = "okay";
>>   };
>>   
>> +&spi3 {
> ..
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&ssp3_0_cfg>;
> Can you swap the order of these two pinctrl properties?
> Yes, we currently have some inconsistency in tree, I plan to fix during next cycle

Sure, I'll do that.

>> +	status = "okay";
>> +};
>> +
>>   &uart0 {
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&uart0_2_cfg>;
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> index 3810557374228..16c953eca2aaa 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> @@ -28,4 +28,24 @@ pwm14-1-pins {
>>   			drive-strength = <32>;
>>   		};
>>   	};
>> +
>> +	ssp3_0_cfg: ssp3-0-cfg {
>> +		ssp3-0-no-pull-pins {
>> +			pinmux = <K1_PADCONF(75, 2)>,	/* SCLK */
>> +				 <K1_PADCONF(77, 2)>,	/* MOSI  */
>> +				 <K1_PADCONF(78, 2)>;	/* MISO */
>> +
>> +			bias-disable;
>> +			drive-strength = <19>;
>> +			power-source = <3300>;
>> +		};
>> +
>> +		ssp3-0-frm-pins {
>> +			pinmux = <K1_PADCONF(76, 2)>;	/* FRM (frame) */
>> +
>> +			bias-pull-up = <0>;
>> +			drive-strength = <19>;
>> +			power-source = <3300>;
>> +		};
>> +	};
>>   };
>> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> index 66b33a9110ccd..a826cc1ac83d5 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> @@ -834,6 +834,25 @@ storage-bus {
>>   			#size-cells = <2>;
>>   			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
>>   
>> +			spi3: spi@d401c000 {
>> +				compatible = "spacemit,k1-spi";
>> +				reg = <0x0 0xd401c000 0x0 0x30>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +				clocks = <&syscon_apbc CLK_SSP3>,
>> +					 <&syscon_apbc CLK_SSP3_BUS>;
> ..
>> +				clock-names = "core",
>> +					      "bus";
> can you simply put them together in one line? it's kind of tedious to split..

Sure I can do that.  I've seen it both ways.

>> +				resets = <&syscon_apbc RESET_SSP3>;
>> +				interrupts-extended = <&plic 55>;
> why use interrupts-extended?

Because it specifies both the controller and interrupt number
explicitly.  Why *not* use interrupts-extended?

>> +				spacemit,k1-ssp-id = <3>;
>> +				dmas = <&pdma 20>,
>> +				       <&pdma 19>;
> .. em, so the SPI will use pdma, then probably you should also adjust Kconfig to
> select PDMA driver?

You're right.  Thanks for catching that.

					-Alex

> 
>> +				dma-names = "rx",
>> +					    "tx";
>> +				status = "disabled";
>> +			};
>> +
>>   			emmc: mmc@d4281000 {
>>   				compatible = "spacemit,k1-sdhci";
>>   				reg = <0x0 0xd4281000 0x0 0x200>;
>> -- 
>> 2.48.1
>>
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
