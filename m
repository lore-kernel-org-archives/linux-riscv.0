Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7AFC87FCA
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 12:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TmDX8KOk//XbVuJmVy14Z146ILZByQDz7logK6xQCos=; b=zDjw6ZDVKNec4U
	ITcmSflvB8HMcjRLJP0Wkh3BHkTRXmzLarIhomP+o1qeHB6SjBZ+Y/e3ajediiwB+bUlRKrzfieIl
	DJ8/61ELa2Hj5MQCMEO/tleohECQ3zSSzXzD9echJwrvKPs4FAa2vMiq/Q4ZbUk8jYbrFYcyvVDe1
	uZPA8qmFrV249BatYkqs8JHnAO91qFDuPqjgYyC2FBAyTkFzf0on/9XCKFDXCzgsomWlJSoD3xKYo
	Dh3hQV6iKeS05X6csboMvO3Xs4JgpMyYDhbmpm+eaNhYyWAE6han8tOpse72moEazOCEg6xQkMIns
	MRPXePlJz9jRhK9orUjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufHWG-00000009oxV-1gjM;
	Fri, 25 Jul 2025 12:27:24 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufHWD-00000009ox7-3s8Q
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 12:27:23 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3e3c34a9b4cso9023175ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 05:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753446441; x=1754051241; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A/mBvaMsi9x4Ax/J09iijgNlpW3/r7uWvIizFrxl++U=;
        b=bQ3tV3l6Ile9eIB6ChOScG4+4oE3UEEtG9QtPlJhTOdp1Nqd3kxfNo8yKU+NEgJZtX
         0jlB44LCK1ur6PAsUbQkvbP28aHaxG3WEFlFyxOOzZrfwsNJEiM46LigMPEHyS30anjT
         nYzqV4tiJetMtfVJaghKNyUYdjSYTu6x2lhepAiKqEvcwfxGhEGyj62NeDNdWYCzdIN1
         LrphJZHJVW0e1n67UBJIU1NcvAvEI+xrgtWw1ENv5vXu/8ewwPUDStjn13ExuX0ptJf/
         hKPNdmOO+hNYNMRrXmK0T5Y9b5uwFWJFpV9Q+SM6XJHyMpn/EaZ7bTW2EEuBvxZkyovy
         pz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753446441; x=1754051241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A/mBvaMsi9x4Ax/J09iijgNlpW3/r7uWvIizFrxl++U=;
        b=gnFMg3c3L9v7kY3XrX/hNrOwoKi2Ein7K9/97+7DM3yRcRQ4rVrRcf0Ndz22kXJhWW
         zfaGh5SA8kgL2Hnfzy97RyrMPSequsPi2dTqTKZRNtr5ev3yHv6hBRPCNq2itxIm4rl1
         AUN8xZR4WSWaWLXkGHTpOfNIuGOU+vwD3RR1vWkTBB0s7s0o5kAbaQaq44Fu3yzlVBtv
         pmP6EE4ClB7fCkt+u9A1kvg1f8UGEfGOB3GBwLDmgzHJdRlLISleCPDb+HKghVIAn+uR
         3Dv4HgR0SEsTV4V22UAok150Q68xpDslgsAJPvrdV/LehEH3QX8FqL390fCCeqS2qBub
         6Plw==
X-Forwarded-Encrypted: i=1; AJvYcCWkLO+v9x2YmYSkNM9BcBNtUBS0E+BLlxPkDgh89eHVDNXhe1U7XadESM9QGQaqHqdKrhnWNxBiVYpEmw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLD3s8AY90+d+JRnG5zkm6UCGsKRkHTmMZD6p7GffBOwOyyhvF
	Tk6qUEuar+aM9np7Hl6lob+/xp+z+8vbp7joFGXNeDPGboxzkXPEKI2Z287B3kqUL3g=
X-Gm-Gg: ASbGncvEwvB5FhNnlPdYtbEJOKEi/2XGe8brMU8R5IGVbRkhkBe4dolFgDt1aDPNOGu
	ygkzZh/V1/Kj8t0Bp0gbka4wYXun1NbkvwPDvEnBldt0+Y7+FpHH/2wHpjEKG+DLiDayiO72kkD
	Bsw4dNBZlfe8+CPjT9SK6gj2zLUOtbaF6kj471fJZF/e/ShQAXKLQ5mDz9QAptv6d93sX7ILajI
	vr/HSCQF7qGIILdVMboINSvy+LDCTNGnE/GHMafO8lSEoUbMvHv/Z5BhQCmwVL/viYlsKKo3WtA
	rrRI8o8rbN95NZNbT9imcxIb9/2XVK4RyA0wMHE2riK/OnP4GmqkGuCebkJo/e7BuHf50BKd3aJ
	fgqnyj8GPZ3cNRjM4RZaDJPCH0k2Y+f67Jw==
X-Google-Smtp-Source: AGHT+IFpJvG04PuJm5q96eMexOibQMJOXrzeJLswA3Q+kKbIfnRtQOm28/7c/YDY/oduCAUIYURw7A==
X-Received: by 2002:a92:cd81:0:b0:3e2:9fa7:a60a with SMTP id e9e14a558f8ab-3e3c52414bfmr27234165ab.3.1753446440729;
        Fri, 25 Jul 2025 05:27:20 -0700 (PDT)
Received: from [10.211.55.5] ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e3b7248082sm12856165ab.60.2025.07.25.05.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 05:27:20 -0700 (PDT)
Message-ID: <bcab3c8d-af99-44c7-a994-b5e0e5c39c7f@riscstar.com>
Date: Fri, 25 Jul 2025 07:27:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/8] riscv: dts: spacemit: enable the i2c8 adapter
To: Yixun Lan <dlan@gentoo.org>
Cc: lee@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mat.jonczyk@o2.pl, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux.amoon@gmail.com, troymitchell988@gmail.com, guodong@riscstar.com,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250724202511.499288-1-elder@riscstar.com>
 <20250724202511.499288-7-elder@riscstar.com>
 <20250724211113-GYA748868@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250724211113-GYA748868@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_052722_107478_974C4C18 
X-CRM114-Status: GOOD (  13.44  )
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

On 7/24/25 4:11 PM, Yixun Lan wrote:
> Hi Alex,
> 
> On 15:25 Thu 24 Jul     , Alex Elder wrote:
>> Define properties for the I2C adapter that provides access to the
>> SpacemiT P1 PMIC.  Enable this adapter on the Banana Pi BPI-F3.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 15 +++++++++++++++
>>   arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    |  7 +++++++
>>   arch/riscv/boot/dts/spacemit/k1.dtsi            | 11 +++++++++++
>>   3 files changed, 33 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> index fe22c747c5012..7c9f91c88e01a 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> @@ -40,6 +40,21 @@ &emmc {
>>   	status = "okay";
>>   };
>>   
>> +&i2c8 {
>> +	pinctrl-0 = <&i2c8_cfg>;
>> +	pinctrl-names = "default";
> ..
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
> I think these two can be moved into dtsi, as they are
> common and fixed properties for the i2c controller

You're right.  I will update this in v10, which I will
send later today.  I'd like to hear from Lee before I
prepare that though.

>> +	status = "okay";
>> +
>> +	pmic@41 {
>> +		compatible = "spacemit,p1";
>> +		reg = <0x41>;
>> +		interrupts = <64>;
> ..
>> +		status = "okay";
> status property here can be dropped as enabled by default

OK.

>> +	};
>> +};
>> +
>>   &uart0 {
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&uart0_2_cfg>;
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> index 3810557374228..96d7a46d4bf77 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> @@ -11,6 +11,13 @@
>>   #define K1_GPIO(x)	(x / 32) (x % 32)
>>   
>>   &pinctrl {
>> +	i2c8_cfg: i2c8-cfg {
>> +		i2c8-0-pins {
>> +			pinmux = <K1_PADCONF(93, 0)>,	/* PWR_SCL */
>> +				 <K1_PADCONF(94, 0)>;	/* PWR_SDA */
>> +		};
>> +	};
>> +
>>   	uart0_2_cfg: uart0-2-cfg {
>>   		uart0-2-pins {
>>   			pinmux = <K1_PADCONF(68, 2)>,
>> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> index abde8bb07c95c..2a5a132d5a774 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> @@ -459,6 +459,17 @@ pwm7: pwm@d401bc00 {
>>   			status = "disabled";
>>   		};
>>   
>> +		i2c8: i2c@d401d800 {
>> +			compatible = "spacemit,k1-i2c";
>> +			reg = <0x0 0xd401d800 0x0 0x38>;
> ..
>> +			interrupts = <19>;
> I'd suggest to move interrupts property after clock, see my similar
> comment
> https://lore.kernel.org/all/20250724121916-GYA748228@gentoo/

OK.

					-Alex

> 
>> +			clocks = <&syscon_apbc CLK_TWSI8>,
>> +				 <&syscon_apbc CLK_TWSI8_BUS>;
>> +			clock-names = "func", "bus";
>> +			clock-frequency = <400000>;
>> +			status = "disabled";
>> +		};
>> +
>>   		pinctrl: pinctrl@d401e000 {
>>   			compatible = "spacemit,k1-pinctrl";
>>   			reg = <0x0 0xd401e000 0x0 0x400>;
>> -- 
>> 2.43.0
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
