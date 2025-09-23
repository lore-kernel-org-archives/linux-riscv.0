Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6D7CAC5B1
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 12:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5096igNt8P7W2LMwsOqQIzdAfKmVFuuivNaUGMbwHv8=; b=4/g29xwpbpm1LQ
	ltXYl5bUWf6SDYjhXzZ5B52xakr3X4DhwE8TiQ8qULTPgcCOueB7mPC8Jrc0W7ifbLXUqvGsmCD0/
	UNdgshkLeUdmWMc2soKTnimOAO0tuDBjErDHgDNaJPvW7dSKhTxKCZjJ3Gtyd3VIw7wHNTvTQCeta
	1EDNm4RVQ1mQXmSTeJYMEpEeaKubHMcYG59YUmaew/RnbeJBfKTenPFIlv4v+7bIh31Fk5QFtyTfN
	FE+jJy+Yo2cSBQUTyXHVZChcQnDVOghH6T4TyoLIQhNHajcRoN3wqBiMXEsRcoXBGseDsfir4hxG5
	znh52+1zsfT3C4QQIhww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v12Sc-0000000DLQI-3TE9;
	Tue, 23 Sep 2025 12:49:34 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v12Sa-0000000DLOR-22Td
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 12:49:33 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-8ea63b6f26fso4715439f.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Sep 2025 05:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758631771; x=1759236571; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=waPoQEusBLXFr5L4eEB+vbwGGd0bLGE9s1F+Tc6/eDg=;
        b=ECUi6hQ57CloGJ+4zZ0pyiqokoSOd6g9KHKMHiBF20PIGnO/7KJ65ieD0uWiQMDNSY
         dhhq7PV23vm2Z+TJWQXGLdG3joi0kpDFSmnfqx+0NohkIO8N6kPJBJfQFrrc78BTlWen
         glm9FXxA5QwFTzyv1gHOcp3mAkCC05iMQKvQmNo4Ni0JAX7X7GVnDdNR1hZC2+wKF2Vp
         1YL0sR9nIKMyVYs/xiKyWSFIYV/aXH0fbQztvvqng3nle+FTDG7fnXM41jlUQvD1Ikbb
         G5TEDgCkfUO+KWr7LIGxAxkZcBJxqQQvHshK2cywae1LllbDJzsXWd9lfDEo/1Ynwx5k
         4vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758631771; x=1759236571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=waPoQEusBLXFr5L4eEB+vbwGGd0bLGE9s1F+Tc6/eDg=;
        b=COr9OP1L4dz5va1C2b/rTw/tTzJfdXHRwLKl8x0G8iOABNtM7M0q6jYZ8E3pscDWVD
         4U/G+6uFNIQoh73bPtOqlnTNFjTodafpYLluUHHn2bIMhe/SXwCszHhHQTqzFdGKodD9
         TSOv7RmsVqendw0RywIaWl7QIs3GJANvP1C8FgofyiAU/TSMLlnUq6zbkry3vsT5qnxS
         owf9IoIjvfW4pFhsIZSjwdKm0LfXaagB3U9jT/sm1E+4BgvjWi8bXmt2It9mLaMiouQo
         Gfz9HbxeuO9MnRTmL2hd5j2YZwYIzkgnANol5vdQDjQAVYpxljiwzmmb2mnFZi3YJkUT
         zZGA==
X-Forwarded-Encrypted: i=1; AJvYcCXfrgBuPDKaGIAYdHwBU5HNOZVEyaXCGNXYMfa5wuRKrpzW/R77c/ZS3+0TPicjZt+atF7ce4BxyArpCA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxjmSZJlCVLOW+lZC+3fNAQINmZ9Tlohy/CSD+MC5RVX69rF7J0
	PqXkES81qg7FBKHG+cCvOOt6EXryr+gbEca8Vt24+9xWH7DeKXpwjmP8dc7RlpL5huI=
X-Gm-Gg: ASbGncvgnXk9tFYgyfljaJ4IO3AJMEbRtdIEX/GTVoV15r1YTdPXCQEBgKUqlAcKAqv
	Q72wGbA7f7KZBvH1RBx9D0oBIJ05MqPkGNbxYoQukynNsJaKIB23IXNy2m1/igGlEavwZNsfHki
	qS988BPCcVsnqnvRxTtz+l5sKXtAHQEtEVVoYLm/Z2biPHvbTq/BlUHhAAJFWaMQVf1q6pMcn4R
	LcU5eJC3zw6mSIcdIpeLF1EWNWG76z8XYtZSCo83aG3VOGwvoDEJBYmok8C5OV5ytnhrx2zhlxs
	gnWIuDbd5uzUxmTZdEdtJ/us8TufMKkPOR6Xf4fAJkyh/sMpM90cZ6+BM96r0Y6j1nrTrqB5/Qr
	ZFJ9oXCSmc0SgScHEujXI7grhYRQTf/56z5VoFeVaYLCxWg9U7eWfNtKcPHAGfQ==
X-Google-Smtp-Source: AGHT+IGpn78bpHsCcVyT6ZTPrazok3rGvE1esop28BxCS5HsGV4C6tLow/zSSA+i8GZpHEaTZ2FBYA==
X-Received: by 2002:a05:6e02:480a:b0:424:4bc:4b33 with SMTP id e9e14a558f8ab-4258229353amr31444535ab.1.1758631771380;
        Tue, 23 Sep 2025 05:49:31 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-556f74174cfsm3556602173.57.2025.09.23.05.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 05:49:31 -0700 (PDT)
Message-ID: <83c5e504-facb-47a8-a9ba-f85097416484@riscstar.com>
Date: Tue, 23 Sep 2025 07:49:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: define a SPI controller node
To: Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, ziyao@disroot.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250922161717.1590690-1-elder@riscstar.com>
 <20250922161717.1590690-4-elder@riscstar.com>
 <20250923001930-GYB1303776@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250923001930-GYB1303776@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_054932_561223_15471DAE 
X-CRM114-Status: GOOD (  21.68  )
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

On 9/22/25 7:19 PM, Yixun Lan wrote:
> Hi Alex,
> 
> On 11:17 Mon 22 Sep     , Alex Elder wrote:
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
>> v3: - Moved the SPI controller into the dma-bus memory region
>>
>>   .../boot/dts/spacemit/k1-bananapi-f3.dts      |  7 +++++++
>>   arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 20 +++++++++++++++++++
>>   arch/riscv/boot/dts/spacemit/k1.dtsi          | 16 +++++++++++++++
>>   3 files changed, 43 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> index 2aaaff77831e1..d9d865fbe320e 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> @@ -14,6 +14,7 @@ aliases {
>>   		ethernet0 = &eth0;
>>   		ethernet1 = &eth1;
>>   		serial0 = &uart0;
>> +		spi3 = &spi3;
>>   	};
>>   
>>   	chosen {
>> @@ -92,6 +93,12 @@ &pdma {
>>   	status = "okay";
>>   };
>>   
>> +&spi3 {
>> +	pinctrl-0 = <&ssp3_0_cfg>;
>> +	pinctrl-names = "default";
>> +	status = "okay";
>> +};
>> +
>>   &uart0 {
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&uart0_2_cfg>;
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> index aff19c86d5ff3..205c201a3005c 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> @@ -76,4 +76,24 @@ pwm14-1-pins {
>>   			drive-strength = <32>;
>>   		};
>>   	};
>> +
>> +	ssp3_0_cfg: ssp3-0-cfg {
> ..
>> +		ssp3-0-no-pull-pins {
> I'd prefer not to enforce "pull" info inside the name, you can't embed
> all property info, besides, what's if you want to change/override later?
> 
> how about just name it as ssp3-0-defaul-pins or simply ssp3-0-pins?

I should have looked more closely at this before I sent it out
for review; sorry about that.

Yes I agree with you, ssp-0-pins and ssp3-0-frm-pins would be
better.

> 
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
>> index 6cdcd80a7c83b..eb8a14dd72ea4 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> @@ -797,6 +797,22 @@ uart9: serial@d4017800 {
>>   				status = "disabled";
>>   			};
>>   
>> +			spi3: spi@d401c000 {
>> +				compatible = "spacemit,k1-spi";
>> +				reg = <0x0 0xd401c000 0x0 0x30>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +				clocks = <&syscon_apbc CLK_SSP3>,
>> +					 <&syscon_apbc CLK_SSP3_BUS>;
>> +				clock-names = "core", "bus";
>> +				resets = <&syscon_apbc RESET_SSP3>;
>> +				interrupts = <55>;
> ..
>> +				dmas = <&pdma 20>,
>> +				       <&pdma 19>;
> can we also squash the dmas into one line? but, do split if there are too many..
> 
> yes, it's simply a style change that I'd like to keep them consistent at DT level,
> besides you might also want to adjust dt-binding examples to align with them here..

Yes I'll do that.  Thanks for the review.

					-Alex

> thanks
> 
>> +				dma-names = "rx", "tx";
>> +				status = "disabled";
>> +			};
>> +
>>   			/* sec_uart1: 0xf0612000, not available from Linux */
>>   		};
>>   
>> -- 
>> 2.48.1
>>
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
