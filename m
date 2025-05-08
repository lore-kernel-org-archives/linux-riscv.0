Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249C8C3ABC3
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 02:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5wiGB3yklgTSwGLQh7SdDzvoMhLmkMcYoZT0HXZ1cSA=; b=FJFro3+9LaYS8h
	hySsbCUOOX0ZXYHsBReJG04Y4t7KwV5USydF0CKzpZegxKbNmxKr229X7RGWQEkbt0tGP9nnizkYo
	hKQ0mfpixQCroGaoRTv862LHSPnQyMNWwZXMeJ9agX4fV4rYcRrxcJk4VMl9q5erucIhxuObIq+LC
	7B3wA377+D4cX5rEkUUFbzSpGFOr9lvOXISoinNfdT1ii3dwoFvKyTRku2PSoPrETNrCnfqb0ePdM
	Pdu4dFU7C8TfFgb7BgFQOArh8Vx8LBv9aVBI2DfAl4ZuvqkQygD8UJ10sI8pCQHz2NlMLeLkHdf1g
	YGldvsCuwu3yM32nNxhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCqrg-0000000H8v6-3nKw;
	Thu, 08 May 2025 02:20:00 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCqre-0000000H8uW-0kKB
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 02:19:59 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-85de3e8d0adso9949839f.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 May 2025 19:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746670797; x=1747275597; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BLdPkGjCt3zHlhnTHlv9FcwC/B6Ceh0B+t68w+L9rVI=;
        b=K+gVVAFUxI9cJ+1Ako/0YMTzvgnGDJgxz/kMbr+gpOZR6lGtZpP4C7LxrWVUsk4lRo
         TYPTWCF2EybXUSpdBTwjj0RSQ3ITQRD7E6669Igp78HhOqmd4o2jytYrTlaHJdTz2yFk
         yWCzBbzTJXyhOIBCJVNvt35NJuGGCVEWRMnbdYCQgMZLMI7gGkf4nHB1z77CSm5sRcdh
         njYMBwMWliOfRDwZXLFQ8ViJYkymhcuHJ6JcbB8E1HhtM+1uSxM052cLgWSAxcSDoowz
         ryOLP+ZpX3oIz7h5ZCO5h05NaAKM4nDnX+aaiGQ/VAIMCmf6mQf/KhYw0vPXTjGP4WwH
         nvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746670797; x=1747275597;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BLdPkGjCt3zHlhnTHlv9FcwC/B6Ceh0B+t68w+L9rVI=;
        b=clOSHPOy+d9PIj8YqcltovtBZWxmaIs1zkeJ02BBtqA8FCDxTW0Vh0sbAwnfm6xMuC
         S+aT6aqH9zz0wszV3/vf52VzCzqHvRHvBNzvIzzwr6U0coKBjZGtac1ME6WTUu0cKLAn
         CR+uoRhZN+CRY4UdVpLWZm2nsEQkKz3FXZTEpgTsQzxSEs8Y+33ICfBgTZ+TA8G/VNv7
         DTJjUDCVoEBOeJDkRDPZ7M3cjWJ1vOgogdv8S2xYXEHQteuLkBP7HDP9eYlKCVMBBux2
         hf/x+V8QCaNhItxC2fhAQhIPYhm2FPn5LdWi7MlRmrtfAaARtWiZcn1nido4FywEEzGR
         kbKg==
X-Forwarded-Encrypted: i=1; AJvYcCV/IMUJ0EfXIALU6kik/jsSZbYqG9BLLmtpQhcIGx3gcPPALYw8dztCi4V8N/znJd3gpbknRUqd6u8mRg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTilKzt+9oPbl/PLrlif6nFQTwyocL1BmeB30EoVUMCM5ygA8v
	4bqJ/0KdAntufK+LB8THdB3qmh4SqQbNRv9DivPsj17b0VjRncYl/YPs6LDd/EM=
X-Gm-Gg: ASbGncs9AawyHzC13VKeqIWWec3cdDZfbd4uqdKMa1m99CXy9Nym5ZLpz9nYemFx0Em
	ytZCB008C7QN3xjJ53ktAyqbm7TONleA97Sb7idcThgZnXBo+n9Qy4pr66Dik9xrfLGWnlSIvvN
	DH8Ak//+QSQKZkP4GS5WG2U8Kww21wPy5XfgR7SI+knQ67S/2i0lAgroX+hxSR2gRuxzF2ec5dE
	eQweg3iLqR6UyHu6QU7XfAq+sMWXwyePhgXDFBQl6LpHSOjOthnNdPgesp8y979Dy2MzYwfrhIF
	G7dZ0XJjaWlZj1patfZIi2Oqsw6UQfhw2a5obrAvJBaqO6KdC5GAxfcrUGLzd7DCALa/y45qSkR
	j6fPK
X-Google-Smtp-Source: AGHT+IHghU5JB92rQb5/laIi7WxHhA2dq9+e76tP2eBE8wVgOV2VIOrFMw9IYclbvj3Kg1D1ug4KfA==
X-Received: by 2002:a05:6602:1589:b0:867:40d9:bf7e with SMTP id ca18e2360f4ac-867473b3bf4mr660105739f.9.1746670796681;
        Wed, 07 May 2025 19:19:56 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88a8d0071sm2975776173.1.2025.05.07.19.19.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 19:19:56 -0700 (PDT)
Message-ID: <c9aac0f1-7fed-4d12-b80a-767df7168a43@riscstar.com>
Date: Wed, 7 May 2025 21:19:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] dt-bindings: soc: spacemit: define spacemit,k1-ccu
 resets
To: Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, heylenay@4d2.org, inochiama@outlook.com,
 guodong@riscstar.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-2-elder@riscstar.com>
 <20250507223554-GYA505240@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250507223554-GYA505240@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_191958_487890_786B152C 
X-CRM114-Status: GOOD (  15.02  )
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

On 5/7/25 5:35 PM, Yixun Lan wrote:
> hi Alex,
> 
> On 16:06 Tue 06 May     , Alex Elder wrote:
>> There are additional SpacemiT syscon CCUs whose registers control both
>> clocks and resets:  RCPU, RCPU2, and APBC2. Unlike those defined
>> previously, these will (initially) support only resets.  They do not
>> incorporate power domain functionality.
>>
>> Previously the clock properties were required for all compatible nodes.
>> Make that requirement only apply to the three existing CCUs (APBC, APMU,
>> and MPMU), so that the new reset-only CCUs can go without specifying them.
>>
>> Define the index values for resets associated with all SpacemiT K1
>> syscon nodes, including those with clocks already defined, as well as
>> the new ones (without clocks).
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +++-
>>   .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 ++++++++++++++++++
>>   2 files changed, 150 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
>> index 30aaf49da03d3..133a391ee68cd 100644
>> --- a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
>> +++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
>> @@ -19,6 +19,9 @@ properties:
>>         - spacemit,k1-syscon-apbc
>>         - spacemit,k1-syscon-apmu
>>         - spacemit,k1-syscon-mpmu
>> +      - spacemit,k1-syscon-rcpu
>> +      - spacemit,k1-syscon-rcpu2
>> +      - spacemit,k1-syscon-apbc2
>>   
>>     reg:
>>       maxItems: 1
>> @@ -47,9 +50,6 @@ properties:
>>   required:
>>     - compatible
>>     - reg
>> -  - clocks
>> -  - clock-names
>> -  - "#clock-cells"
>>     - "#reset-cells"
>>   
>>   allOf:
>> @@ -57,13 +57,28 @@ allOf:
>>         properties:
>>           compatible:
>>             contains:
>> -            const: spacemit,k1-syscon-apbc
>> +            enum:
>> +              - spacemit,k1-syscon-apmu
>> +              - spacemit,k1-syscon-mpmu
>>       then:
>> -      properties:
>> -        "#power-domain-cells": false
>> -    else:
>>         required:
>>           - "#power-domain-cells"
>> +    else:
>> +      properties:
>> +        "#power-domain-cells": false
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - spacemit,k1-syscon-apbc
>> +              - spacemit,k1-syscon-apmu
>> +              - spacemit,k1-syscon-mpmu
>> +    then:
>> +      required:
>> +        - clocks
>> +        - clock-names
>> +        - "#clock-cells"
>>   
>>   additionalProperties: false
>>   
>> diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
>> index 35968ae982466..f5965dda3b905 100644
>> --- a/include/dt-bindings/clock/spacemit,k1-syscon.h
>> +++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
> would it be better to move all reset definition to its dedicated dir?
> which like: include/dt-bindings/reset/spacemit,k1-syscon.h?

That's fine with me.  I should have thought of that.

Krzysztof, I'll drop your Reviewed-by if I make that change,
but if you say I can before I post v7 I will keep it.

I'll wait a bit more before I update so others can comment
(on this or anything else).

Thanks.

					-Alex

> 
>> @@ -78,6 +78,9 @@
>>   #define CLK_APB			31
>>   #define CLK_WDT_BUS		32
>>   
>> +/* MPMU resets */
>> +#define RESET_WDT		0
>> +
>>   /* APBC clocks */
>>   #define CLK_UART0		0
>>   #define CLK_UART2		1
>> @@ -180,6 +183,59 @@
>>   #define CLK_TSEN_BUS		98
>>   #define CLK_IPC_AP2AUD_BUS	99
>>   
>> +/* APBC resets */
>> +#define RESET_UART0		0
>> +#define RESET_UART2		1
>> +#define RESET_UART3		2
>> +#define RESET_UART4		3
>> +#define RESET_UART5		4
>> +#define RESET_UART6		5
>> +#define RESET_UART7		6
>> +#define RESET_UART8		7
>> +#define RESET_UART9		8
>> +#define RESET_GPIO		9
>> +#define RESET_PWM0		10
>> +#define RESET_PWM1		11
>> +#define RESET_PWM2		12
>> +#define RESET_PWM3		13
>> +#define RESET_PWM4		14
>> +#define RESET_PWM5		15
>> +#define RESET_PWM6		16
>> +#define RESET_PWM7		17
>> +#define RESET_PWM8		18
>> +#define RESET_PWM9		19
>> +#define RESET_PWM10		20
>> +#define RESET_PWM11		21
>> +#define RESET_PWM12		22
>> +#define RESET_PWM13		23
>> +#define RESET_PWM14		24
>> +#define RESET_PWM15		25
>> +#define RESET_PWM16		26
>> +#define RESET_PWM17		27
>> +#define RESET_PWM18		28
>> +#define RESET_PWM19		29
>> +#define RESET_SSP3		30
>> +#define RESET_RTC		31
>> +#define RESET_TWSI0		32
>> +#define RESET_TWSI1		33
>> +#define RESET_TWSI2		34
>> +#define RESET_TWSI4		35
>> +#define RESET_TWSI5		36
>> +#define RESET_TWSI6		37
>> +#define RESET_TWSI7		38
>> +#define RESET_TWSI8		39
>> +#define RESET_TIMERS1		40
>> +#define RESET_TIMERS2		41
>> +#define RESET_AIB		42
>> +#define RESET_ONEWIRE		43
>> +#define RESET_SSPA0		44
>> +#define RESET_SSPA1		45
>> +#define RESET_DRO		46
>> +#define RESET_IR		47
>> +#define RESET_TSEN		48
>> +#define RESET_IPC_AP2AUD	49
>> +#define RESET_CAN0		50
>> +
>>   /* APMU clocks */
>>   #define CLK_CCI550		0
>>   #define CLK_CPU_C0_HI		1
>> @@ -244,4 +300,76 @@
>>   #define CLK_V2D			60
>>   #define CLK_EMMC_BUS		61
>>   
>> +/* APMU resets */
>> +#define RESET_CCIC_4X		0
>> +#define RESET_CCIC1_PHY		1
>> +#define RESET_SDH_AXI		2
>> +#define RESET_SDH0		3
>> +#define RESET_SDH1		4
>> +#define RESET_SDH2		5
>> +#define RESET_USBP1_AXI		6
>> +#define RESET_USB_AXI		7
>> +#define RESET_USB3_0		8
>> +#define RESET_QSPI		9
>> +#define RESET_QSPI_BUS		10
>> +#define RESET_DMA		11
>> +#define RESET_AES		12
>> +#define RESET_VPU		13
>> +#define RESET_GPU		14
>> +#define RESET_EMMC		15
>> +#define RESET_EMMC_X		16
>> +#define RESET_AUDIO		17
>> +#define RESET_HDMI		18
>> +#define RESET_PCIE0		19
>> +#define RESET_PCIE1		20
>> +#define RESET_PCIE2		21
>> +#define RESET_EMAC0		22
>> +#define RESET_EMAC1		23
>> +#define RESET_JPG		24
>> +#define RESET_CCIC2PHY		25
>> +#define RESET_CCIC3PHY		26
>> +#define RESET_CSI		27
>> +#define RESET_ISP_CPP		28
>> +#define RESET_ISP_BUS		29
>> +#define RESET_ISP		30
>> +#define RESET_ISP_CI		31
>> +#define RESET_DPU_MCLK		32
>> +#define RESET_DPU_ESC		33
>> +#define RESET_DPU_HCLK		34
>> +#define RESET_DPU_SPIBUS	35
>> +#define RESET_DPU_SPI_HBUS	36
>> +#define RESET_V2D		37
>> +#define RESET_MIPI		38
>> +#define RESET_MC		39
>> +
>> +/*	RCPU resets	*/
>> +#define RESET_RCPU_SSP0		0
>> +#define RESET_RCPU_I2C0		1
>> +#define RESET_RCPU_UART1		2
>> +#define RESET_RCPU_IR		3
>> +#define RESET_RCPU_CAN		4
>> +#define RESET_RCPU_UART0		5
>> +#define RESET_RCPU_HDMI_AUDIO	6
>> +
>> +/*	RCPU2 resets	*/
>> +#define RESET_RCPU2_PWM0		0
>> +#define RESET_RCPU2_PWM1		1
>> +#define RESET_RCPU2_PWM2		2
>> +#define RESET_RCPU2_PWM3		3
>> +#define RESET_RCPU2_PWM4		4
>> +#define RESET_RCPU2_PWM5		5
>> +#define RESET_RCPU2_PWM6		6
>> +#define RESET_RCPU2_PWM7		7
>> +#define RESET_RCPU2_PWM8		8
>> +#define RESET_RCPU2_PWM9		9
>> +
>> +/*	APBC2 resets	*/
>> +#define RESET_APBC2_UART1	0
>> +#define RESET_APBC2_SSP2	1
>> +#define RESET_APBC2_TWSI3	2
>> +#define RESET_APBC2_RTC		3
>> +#define RESET_APBC2_TIMERS0	4
>> +#define RESET_APBC2_KPC		5
>> +#define RESET_APBC2_GPIO	6
>> +
>>   #endif /* _DT_BINDINGS_SPACEMIT_CCU_H_ */
>> -- 
>> 2.45.2
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
