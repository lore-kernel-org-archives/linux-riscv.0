Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A084FC3DA61
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Jul 2024 22:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+z5tZ5q0ZXpOZVFlHdk7ugUj09CM9q/tn3NM1pQGVvw=; b=WTyyeCHa/iok4k8Jni2/wiN5Ni
	C6iWTDwEObc32wqEFkmq55e6lYx0mpymTfh21iLmo1MV1USXUp59KQytbImkdEHMkpm18xOrLp3Yl
	8NcIuPNp/C6eXMIDY/ROcFfkqh38nex/u8GXmBm+w92sdppd2B8bJuQwuXt5SU4oKlew5jN4D0HU8
	AsCrq8339CHpAhevwoqEASq9u07wqHKwslvFLZd4rdvv5w3T6PLZWw4NuXCsHzqoNIECraOd2duSr
	mSdiWiqkeyn/gJYBITgYr2+G7wuCvGbBK1IjwM8ZM7T69Dg6hYh3R4j+ISQlfrf+SJUWDIADOH7WJ
	Poyjg5EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVfLU-00000007jJM-0wFx;
	Sun, 21 Jul 2024 22:48:00 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVfLQ-00000007jIg-1QPF
	for linux-riscv@lists.infradead.org;
	Sun, 21 Jul 2024 22:47:58 +0000
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 621C54107F
	for <linux-riscv@lists.infradead.org>; Sun, 21 Jul 2024 22:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1721602074;
	bh=KO8tpQ9TxHjBPKSfhTTh06gsoP5zva/hPb58dTpZI7Q=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=hrOB9nRPrBbkxem5qJG6pJUmqCAbxvwCOoLclRe9q8oi54Evg8GwLklT1YneJGQx2
	 H0TLCrHJS3ciaRRYlGJALjcOW3WAc+itVxkU6cCQyqS1C7cXExYrlu4Pg1kXlWNosJ
	 PNlGuPCQBy7WPhMn+TRUgAQkM1PvLH/q96wrhZuwclHxzGlmr9OWbOepWjoUfquCh0
	 6qHjE/LNVhD2nCA9xzTdPUtpHb8H/KIS0W2TtkF/KAEvxbuzmMnuPq94UKCw8AR0Fn
	 jwfm7QWl5RCLeFmiI2UeA/tzzNX6avw8zCXVZZDZH8/n41MC0KTvOh5L9oDi81OclO
	 U5/E7u/GpHutg==
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-79f006f9f14so585645285a.0
        for <linux-riscv@lists.infradead.org>; Sun, 21 Jul 2024 15:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721602073; x=1722206873;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KO8tpQ9TxHjBPKSfhTTh06gsoP5zva/hPb58dTpZI7Q=;
        b=NnfoyGqxwFnn2Dy9pPsQBs/1FPvkWgOQxFFK+nVoQduvxemQtuCl1Ok6ugJ7nxKXQf
         W7qOLuCVTwGq2WT/vejrvzLan4tVZ9TN0HHp0OOWpBfLr41Wrp4Da/V/5a0mmdvxFfSE
         F5aOWC3GhxleRNIom2MkbtCDxJLgJVG5gU5qX/QxVHlsO5UG2TJQYyWKPl1xKNWQlTWl
         NMVRFmK1Nc3VqSpdB9oBXgbI02RtNDd3swQNq/M5HoBPIZAgfAFRhimwFeykAI9brojU
         sxq5CBTl81Pg1cij2Rhq/tDIDB/GQt6VGpo8PA/Z526/rx0WX2kW0qwrtXor5svGvV6R
         LxgA==
X-Forwarded-Encrypted: i=1; AJvYcCVhoAbb2Ekq/89BC11hxFUtAPHmxTeIKTZa+pe0WCDJDP8T18pKty8CEzDsiRwjbcB62zKCV1/WW0bph66gXmg4gHVlKcJiiwJ00ZVctfNl
X-Gm-Message-State: AOJu0YwAmiLnUBKf/H8lkbAdHHLpd+Gkdf3Iifs3T+wfQuZ6iSwV1Ww4
	qGbF8fGSFTznpI9slzHrQT0EaYRIOZ8MjYefCPz38mXG1ku6hwx/FBJ7awmEdJvP84jrUmJr18o
	5hil1BrAHO1BDOhnVut6sYuPVjOMn1UDW3fupLltsW6ZBX2iOYyfaF491xOprWJP+9pR/AdF7rw
	igBrp5q66th0A6On6GMZtF8sjDsdnHTurFgE7RKX1p31BwN7k/bl5fZ+ry
X-Received: by 2002:a05:620a:28ce:b0:79e:ff18:a510 with SMTP id af79cd13be357-7a1a18c7253mr1121275585a.2.1721602073202;
        Sun, 21 Jul 2024 15:47:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOPlLEtwtiEezjI4b0t9l3MvPIrUfLti48u+sapT3VI9Hw0/LGbiEv4A6CGCoCTi6t0+NceO6NQ3UvomsMYkM=
X-Received: by 2002:a05:620a:28ce:b0:79e:ff18:a510 with SMTP id
 af79cd13be357-7a1a18c7253mr1121273685a.2.1721602072728; Sun, 21 Jul 2024
 15:47:52 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 21 Jul 2024 18:47:52 -0400
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240618-i2c-th1520-v3-3-3042590a16b1@bootlin.com>
References: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com> <20240618-i2c-th1520-v3-3-3042590a16b1@bootlin.com>
Mime-Version: 1.0
Date: Sun, 21 Jul 2024 18:47:52 -0400
Message-ID: <CAJM55Z9W7SYDCSeZy_NEQJBryGX5v+R8-xNxOzftivbGxA1TSg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] riscv: dts: thead: Enable I2C on the BeagleV-Ahead
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Drew Fustini <dfustini@tenstorrent.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	=?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240721_154756_787664_74B0910A 
X-CRM114-Status: GOOD (  15.77  )
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

Thomas Bonnefille wrote:
> This commit enables the I2C0 controller of the TH1520, together with
> the FT24C32A EEPROM that is connected to it.
> In addition, this commit also enables the I2C controllers I2C2, I2C4
> and I2C5 as they are all three exposed on headers (P9 19 and 20 for I2C2,
> P9 17 and 18 for I2C5 and MikroBus 7 and 5 for I2C4).
> It also defined the required pinctrl nodes.
>
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
>  arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 84 ++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> index 57a2578123eb..b5c4f1811955 100644
> --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> @@ -122,6 +122,19 @@ led-pins {
>  };
>
>  &padctrl0_apsys {
> +	i2c2_pins: i2c2-0 {
> +		i2c-pins {
> +			pins = "I2C2_SDA",
> +			       "I2C2_SCL";
> +			function = "i2c";
> +			bias-pull-up = <48000>;

nit: This and below can just be written

bias-pull-up;

> +			drive-strength = <7>;
> +			input-enable;
> +			input-schmitt-enable;
> +			slew-rate = <0>;
> +		};
> +	};
> +
>  	uart0_pins: uart0-0 {
>  		tx-pins {
>  			pins = "UART0_TXD";
> @@ -145,8 +158,79 @@ rx-pins {
>  	};
>  };
>
> +&padctrl1_apsys {
> +	i2c0_pins: i2c0-0 {
> +		i2c-pins {
> +			pins = "I2C0_SDA",
> +			       "I2C0_SCL";
> +			function = "i2c";
> +			bias-pull-up = <48000>;
> +			drive-strength = <7>;
> +			input-enable;
> +			input-schmitt-enable;
> +			slew-rate = <0>;
> +		};
> +	};
> +
> +	i2c4_pins: i2c4-0 {
> +		i2c-pins {
> +			pins = "GPIO0_19", /* I2C4_SDA */
> +			       "GPIO0_18"; /* I2C4_SCL */
> +			function = "i2c";
> +			bias-pull-up = <48000>;
> +			drive-strength = <7>;
> +			input-enable;
> +			input-schmitt-enable;
> +			slew-rate = <0>;
> +		};
> +	};
> +
> +	i2c5_pins: i2c5-0 {
> +		i2c-pins {
> +			pins = "QSPI1_D0_MOSI", /* I2C5_SDA */
> +			       "QSPI1_CSN0";    /* I2C5_SCL */
> +			function = "i2c";
> +			bias-pull-up = <48000>;
> +			drive-strength = <7>;
> +			input-enable;
> +			input-schmitt-enable;
> +			slew-rate = <0>;
> +		};
> +	};
> +};
> +
>  &uart0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_pins>;
>  	status = "okay";
>  };
> +
> +&i2c0 {
> +	clock-frequency = <100000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0_pins>;
> +	status = "okay";
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c32";
> +		reg = <0x50>;
> +	};
> +};
> +
> +&i2c2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c2_pins>;
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c4_pins>;
> +	status = "okay";
> +};
> +
> +&i2c5 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c5_pins>;
> +	status = "okay";
> +};

These nodes are still not sorted alphabetically.

>
> --
> 2.45.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
