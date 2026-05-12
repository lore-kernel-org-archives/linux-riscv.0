Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825F3CD4851
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 12:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WleMPJ+fReHcAd6UXGMlzqaioWdVkqpkGdghAaYiXio=; b=ZdMwPUXRq/eBvi
	bIZ7txrzsgpSPgVh/shFpb4ebpgVhGc/XtMYdkMUtTmCXskkjI68dQLzF8CSgoqtMJj3V2DhJwQ4f
	9NZSh87SGjNncPxmbTmuL0hqD/zcA/YEaZ6nKNVU8a6xU2+kL0cdSLtoHTMYAIckpSaNZH77J21f8
	eT1+kHEeQctoGqt/ZGSCF7UwuGRGBD/rZ4jltk52iuqA8IBrXvepGYfJlTOeFm/3t6v6/fCvEjnxK
	oafo0uRktevDlLoFBBbtrKcNZsnKMJmZHJwrsnZDPcE6+E99t63Ua9WwBbW9nV5UbPOKkp3rHkb1O
	+94DXu/3X7ynrJLGulXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMm6a-0000000Gegz-2qgL;
	Tue, 12 May 2026 12:20:56 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMm6Y-0000000GegB-2B18
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 12:20:55 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-44509921fbcso2772033f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 May 2026 05:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778588452; x=1779193252; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rAedPaQpPe7CcNir+E8j0QYU1SXE2Pa0U/4eeZrHwts=;
        b=Lj7XPafnhc1p1MHna1youXFNHIllCNqIaZFSLlocTNhTz5TK1FfbQ53KIrne7y5YkV
         MXan2i3Sfe+0NqzhQwbyo19k5LeI/eaS/wWq1dWB023kKXsBAuhyAcWnOk4ix0UASudU
         TomLR3AxzIPtG+4SDdzjHNlDG6rHAj+oxKyf+tIavxdwRAjC6xwueqPmowqgsBanZhsV
         dbYtPsj4AoCFEhVkmve1Kb4Y+k3whTfHj1nv9fY6Eb0i8uzhESfXS76sCi3qQz8BwFb2
         Q42zf6QqtDmE83W3dTvFV3Ag0NArCzf9PeNyX8Asvj6xGyrEywarWVl70FlWQBMVDgxz
         +Pog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778588452; x=1779193252;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rAedPaQpPe7CcNir+E8j0QYU1SXE2Pa0U/4eeZrHwts=;
        b=XuBOqr5ytP0JGiUax934BXKWG0z9CW+ZDwAJtWzFW8XjcB6Vp50ycvm8Yw40h+qmIu
         5R+ObHXXK3uO+bARA+H8Dad713Igz4H7uOHuaPNK9fba2DYIt03vFJg5a74RjycRaJA3
         PxcRR40X8FxIpmw18d2b5r7X3HpTT9fiS+mgmbgZquo9dGNc9HhyyqhemW/PfNJhc+G/
         ZHsS7kOQjYKmPX4KVQkWKBaBQVM6VSXslzL/aSKmlTHhg5FV7jrjyAihv+qtQfNAeKPM
         zLsPRSSxc+/2JUJeNLhBu0vjHWE1p8Wkm9Ds3Z4oP0ubA1QlWpDPhEknaJd3BhBecmki
         aKdw==
X-Forwarded-Encrypted: i=1; AFNElJ+DnEmWRXcFxE6jSUN3J0AdKwPyjunstDuwXFJQ7NivzccX16VabVAnYvhxYoCulC29uXpMN8+8ajlXtg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6calBWIki3cGQZpfXZUI9zf2YRAcRUM9CysaD/Fb8NiiQJFll
	erwy3V1pWdFQHvXe/bzFzZEdvWNxiir/uW4LxvWzb+/oDKdxhsLT/R/P
X-Gm-Gg: Acq92OHWgqUxMbp62ODSR4m+0AqX8PV2Zkz5J8+fhm98Ly6PFKFX4fo81x+eaFZg4Sd
	WWLzxSxdmcW6JgwpsSlOcNJtBdpBWX7DKbVJTBos+LD3GKiYITHG7xjRme1yNMQ5KcU3Ze9WPJO
	I5PUt2AXbMb2gcgxaE+iOLM/MzgkJcO9aKWSryKPYTn9BGugZEnHL0BqNtTqTPON1FGqaaWKkla
	bzRM4W+MBoi0c+t/83GDY/whaaj3TN3cDLQNaz9W4V/oKPf7lQ7ZeOsPnlrx/bS9VsURBxgct14
	rdKRzAr7XUOK8B4njT199TDeiaOng5vUEDP9ESAinew1GPZocru26Y2Co+KtKvYQYD40JjSIqHs
	Rd0PERlUk6EYstSIXiHLIvUGyIwomdItg7f0NN66C0pfoIH6+Ogw8yLaOb9IsufX7LpdA2BGBJq
	iZHdc5MXsOQsRIafT0axlw0j6acHmqYZ7dfPwzaijh3dNtpqAYjapm7wQN+99oODo=
X-Received: by 2002:a5d:64e3:0:b0:441:1cf8:be9b with SMTP id ffacd0b85a97d-4515d9a06cemr43636765f8f.37.1778588450808;
        Tue, 12 May 2026 05:20:50 -0700 (PDT)
Received: from [192.168.0.40] (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491f8d4c3sm32022927f8f.34.2026.05.12.05.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 05:20:50 -0700 (PDT)
Message-ID: <a41f87cc-55e4-4a48-bbee-d863e5a4b00a@gmail.com>
Date: Tue, 12 May 2026 14:20:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] riscv: dts: spacemit: k1-musepi-pro: add PMIC and
 power infrastructure
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260511111116.1109643-1-a.heider@gmail.com>
 <20260511111116.1109643-2-a.heider@gmail.com>
 <20260512113913-GKH3624147@kernel.org>
From: Andre Heider <a.heider@gmail.com>
Content-Language: de-DE
In-Reply-To: <20260512113913-GKH3624147@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_052054_594643_101AE02F 
X-CRM114-Status: GOOD (  14.20  )
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

On 12.05.26 1:39 PM, Yixun Lan wrote:
> Hi Andre,
> 
> On 13:11 Mon 11 May     , Andre Heider wrote:
>> Enable i2c8 and add the connected SpacemiT P1 PMIC with its related regulators
>> for the board's power infrastructure and voltage regulation support.
>>
>> Signed-off-by: Andre Heider <a.heider@gmail.com>
>> ---
>>   .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 144 ++++++++++++++++++
>>   1 file changed, 144 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
>> index 29e333b670cf0..88c35ad1ef2ae 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
>> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
>> @@ -17,6 +17,7 @@ / {
>>   	aliases {
>>   		ethernet0 = &eth0;
>>   		serial0 = &uart0;
>> +		i2c8 = &i2c8;
>>   	};
>>   
>>   	chosen {
>> @@ -33,6 +34,25 @@ led1 {
>>   			default-state = "on";
>>   		};
>>   	};
>> +
> ..
>> +	reg_usb_vbus: regulator-usb-vbus {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "USBVBUS";
>> +		regulator-min-microvolt = <12000000>;
>> +		regulator-max-microvolt = <12000000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +	};
> I think you can further drop above regulator, which merely serve as vin-supply
> and not used by devices, plus it's a non-controllable fixed regulator

It is, but as mentioned on the cover letter I left this one as it's consistent with the other k1 boards.
I don't care either way, so I'll just drop it.

Thanks,
Andre

> 
>> +
>> +	reg_vcc_4v0: regulator-vcc-40v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "VCC4V0";
>> +		regulator-min-microvolt = <4000000>;
>> +		regulator-max-microvolt = <4000000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +		vin-supply = <&reg_usb_vbus>;
>> +	};
>>   };
>>   
>>   &emmc {
>> @@ -72,6 +92,130 @@ &pdma {
>>   	status = "okay";
>>   };
>>   
>> +&i2c8 {
>> +	pinctrl-0 = <&i2c8_cfg>;
>> +	pinctrl-names = "default";
>> +	status = "okay";
>> +
>> +	pmic@41 {
>> +		compatible = "spacemit,p1";
>> +		reg = <0x41>;
>> +		interrupts = <64>;
>> +		vin1-supply = <&reg_vcc_4v0>;
>> +		vin2-supply = <&reg_vcc_4v0>;
>> +		vin3-supply = <&reg_vcc_4v0>;
>> +		vin4-supply = <&reg_vcc_4v0>;
>> +		vin5-supply = <&reg_vcc_4v0>;
>> +		vin6-supply = <&reg_vcc_4v0>;
>> +		aldoin-supply = <&reg_vcc_4v0>;
>> +		dldoin1-supply = <&buck5>;
>> +		dldoin2-supply = <&buck5>;
>> +
>> +		regulators {
>> +			buck1 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3450000>;
>> +				regulator-ramp-delay = <5000>;
>> +				regulator-always-on;
>> +			};
>> +
>> +			buck2 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3450000>;
>> +				regulator-ramp-delay = <5000>;
>> +				regulator-always-on;
>> +			};
>> +
>> +			buck3 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <1800000>;
>> +				regulator-ramp-delay = <5000>;
>> +				regulator-always-on;
>> +			};
>> +
>> +			buck4 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3300000>;
>> +				regulator-ramp-delay = <5000>;
>> +				regulator-always-on;
>> +			};
>> +
>> +			buck5: buck5 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3450000>;
>> +				regulator-ramp-delay = <5000>;
>> +				regulator-always-on;
>> +			};
>> +
>> +			buck6 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3450000>;
>> +				regulator-ramp-delay = <5000>;
>> +				regulator-always-on;
>> +			};
>> +
>> +			aldo1 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +				regulator-boot-on;
>> +			};
>> +
>> +			aldo2 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +			};
>> +
>> +			aldo3 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +			};
>> +
>> +			aldo4 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +			};
>> +
>> +			dldo1 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +				regulator-boot-on;
>> +			};
>> +
>> +			dldo2 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +			};
>> +
>> +			dldo3 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +			};
>> +
>> +			dldo4 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +				regulator-always-on;
>> +			};
>> +
>> +			dldo5 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +			};
>> +
>> +			dldo6 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +				regulator-always-on;
>> +			};
>> +
>> +			dldo7 {
>> +				regulator-min-microvolt = <500000>;
>> +				regulator-max-microvolt = <3400000>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>>   &uart0 {
>>   	pinctrl-0 = <&uart0_2_cfg>;
>>   	pinctrl-names = "default";
>> -- 
>> 2.53.0
>>
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
