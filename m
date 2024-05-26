Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B503CC25B75
	for <linux-riscv@archiver.kernel.org>; Sun, 26 May 2024 12:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rTvPyy7NIcNnH0GHp7fK2llvY3RO0CjmHpZmXUrnEm0=; b=KebU00Vr+acGuKrtMr1fnxaJJS
	40HnyLmFWChVtTizK1GPyUx6bpdBAZpMJIH9Jjk7FdEfJSGWLfB1pEr502unRkkHuIVNLDmWr+Rob
	iJ6IyQehRbai/GRbFOUYJnE8r5bCH2IMHwxyL9F6J4jsUYj7bNX59pEg6C+HUkYZG4A387+YPuofs
	aEx6j6245jmH/q6iSBYPlMiIuIUKMTA7CvzRO3X031sG+0sm1VJ82nee94udfr9uMl+1/tmUCLyQM
	wuNCPapQL56qmlz+ya+fouBdfbL7Hw4rT2f07Wl6dUgATJCbbtOmXpdI7kN6Mj9ifgoih8i9QmqwW
	wAb6veBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBCdp-0000000CfDV-2pfT;
	Sun, 26 May 2024 12:06:21 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBCdl-0000000CfCn-3pPm
	for linux-riscv@lists.infradead.org;
	Sun, 26 May 2024 12:06:19 +0000
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B35EB424A1
	for <linux-riscv@lists.infradead.org>; Sun, 26 May 2024 12:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1716725173;
	bh=QzPjQrvRFTNCaY9bkkx1AdOfiqg86uxrelAFKCvzxQw=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=WZAanrXnJGynHRMBC+FXiICapcQCjqNOSvPcuI2jeNolNUy3JPcNdAQKQ5za3gzu3
	 XmHpPLPG1W7Z2nJfIc/eP8OCMpFgGIUoCJkzqiycmot+pW6uIC/2tcGeq7/cs+ZL/e
	 2b3m9oo/S8+cYAFyLVq8l38EcNfoHHnd/JOUrftpTzd7vqddwwkQaXE0q2/SsmtRsd
	 edwyPrTP3/Hw79jScxcnbx+Y5kvsADWJRoR5AlFwmHSMC2OLbyMipuokibPcGp30h3
	 rhkZCRzZKkgOCR8Yti3hLUKM0+XJVkR2U8PgFzrImEwCxjIdpsFdoUfUPrn6dJyg01
	 4VgWllBQSiM/g==
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5295f0125dbso1492489e87.1
        for <linux-riscv@lists.infradead.org>; Sun, 26 May 2024 05:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716725172; x=1717329972;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QzPjQrvRFTNCaY9bkkx1AdOfiqg86uxrelAFKCvzxQw=;
        b=ojKjZzRHaM3ZdP2t5gYzrnYEo16mik88KcVS3HAlfw6gckQrWSsY6Fyi6lx17gBa0C
         gPdHtp567M4LHHZvDn2OCI5KFsOMlmIx/33gYsXXBjq5P9nneRGRXKe+IwTIoEIgUf36
         wP+1eIY64xSKlLQBq5WEFdkcjQFoPjYy4ChelPyIOvQzaAMOwyJLnKY8OukeuFEKXiIQ
         KS4M8GGi+qJho66RwooxaUEl28Tx0CK2Dex8/nS7juv+n6XDar8Vf9lYuflMXdd+h2Rc
         w1zIYO1OLlhz+o2A6Jo6L7WSwknEJ4sdhn0DuXVINKyE/7yrgzQlOJw9fOEZdd1KDycK
         iLMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvplSqPoK5jEAizFwf1gJrLqaXRRd5coVoJ8UI/cwvik+sSEyzVEg+/erny7y/98EbKfumkXg+BY7hQGeS8tk+y/qm42dbGRA7InniL8lZ
X-Gm-Message-State: AOJu0YxvP/OPie0nKogdLkRU3M8RN1oZz9RVMjqtQQtFx6wXpwtBa4AJ
	fDB9rG9hvxW2IlpWJkBlXkYv6uiruCYtrM+SkzRMEWUjc19Zguq1fLyIcXrRzjFIv3qSMnDDCsG
	I8qYhS8b7qiNZn7I0eH2swwS0x9lvaOlz+yNMVN1Jwj7r/gIYb9iwJjbchsjHOGUWLZZ+2IK/yQ
	YlK5hzEcZKUE9zz4m0Df34L35ZuhBsTdm4CezwZzSRFHBl7rK8//R69Fyv
X-Received: by 2002:a05:6512:344c:b0:519:1a91:30cc with SMTP id 2adb3069b0e04-5296410ae61mr3785551e87.4.1716725172289;
        Sun, 26 May 2024 05:06:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwx7fR7skOCtVUuIXew7lgRD1ZuwehO7HuKQP+7Gl7dRBpMQppQ1tqUrzN65seVnBlikG+1ZckVZ05Ol2ZpUE=
X-Received: by 2002:a05:6512:344c:b0:519:1a91:30cc with SMTP id
 2adb3069b0e04-5296410ae61mr3785524e87.4.1716725171737; Sun, 26 May 2024
 05:06:11 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 26 May 2024 08:06:10 -0400
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240517-i2c-th1520-v2-3-d364d135ccc6@bootlin.com>
References: <20240517-i2c-th1520-v2-0-d364d135ccc6@bootlin.com> <20240517-i2c-th1520-v2-3-d364d135ccc6@bootlin.com>
Mime-Version: 1.0
Date: Sun, 26 May 2024 08:06:10 -0400
Message-ID: <CAJM55Z9FZxv9TskSX7H5U8_C4a1-LMv52sFgoyzO0bYUKnZ3Ug@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] riscv: dts: thead: Enable I2C on the BeagleV-Ahead
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Drew Fustini <dfustini@tenstorrent.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	=?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240526_050618_197053_9D7FCC49 
X-CRM114-Status: GOOD (  16.29  )
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
> index 57a2578123eb..aeb04f5159d5 100644
> --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> @@ -121,6 +121,47 @@ led-pins {
>  	};
>  };
>
> +&padctrl1_apsys {

These node references should be ordered alphabetically, so please put this
below &padctrl0_apsys.

> +	i2c0_pins: i2c0-0 {
> +		i2c-pins {
> +			pins = "I2C0_SDA",
> +			       "I2C0_SCL";
> +			function = "i2c";
> +			bias-pull-up = <2100>;

Are you sure the strong pull-up is needed here and below?

> +			drive-strength = <7>;
> +			input-enable;
> +			input-schmitt-enable;
> +			slew-rate = <0>;
> +		};
> +	};
> +
> +	i2c4_pins: i2c4-0 {
> +		i2c-pins {
> +			pins = "GPIO0_19", /*I2C4_SDA*/
> +			       "GPIO0_18"; /*I2C4_SCL*/

Please add spaces here like other kernel comments. Eg. /* I2C4_SDA */

> +			function = "i2c";
> +			bias-pull-up = <2100>;
> +			drive-strength = <7>;
> +			input-enable;
> +			input-schmitt-enable;
> +			slew-rate = <0>;
> +		};
> +	};
> +
> +	i2c5_pins: i2c5-0 {
> +		i2c-pins {
> +			pins = "QSPI1_D0_MOSI", /*I2C5_SDA*/
> +			       "QSPI1_CSN0";    /*I2C5_SCL*/

Same here.

> +			function = "i2c";
> +			bias-pull-up = <2100>;
> +			drive-strength = <7>;
> +			input-enable;
> +			input-schmitt-enable;
> +			slew-rate = <0>;
> +		};
> +	};
> +};
> +
>  &padctrl0_apsys {
>  	uart0_pins: uart0-0 {
>  		tx-pins {
> @@ -143,6 +184,19 @@ rx-pins {
>  			slew-rate = <0>;
>  		};
>  	};
> +
> +	i2c2_pins: i2c2-0 {

i2c2-0 sorts before uart0-0 alphabetically.

> +		i2c-pins {
> +			pins = "I2C2_SDA",
> +			       "I2C2_SCL";
> +			function = "i2c";
> +			bias-pull-up = <2100>;
> +			drive-strength = <7>;
> +			input-enable;
> +			input-schmitt-enable;
> +			slew-rate = <0>;
> +		};
> +	};
>  };
>
>  &uart0 {
> @@ -150,3 +204,33 @@ &uart0 {
>  	pinctrl-0 = <&uart0_pins>;
>  	status = "okay";
>  };
> +
> +&i2c0 {

Again please sort these references alphabetically.

> +	status = "okay";

And the properties. Eg. move status below pinctrl-0.


> +	clock-frequency = <100000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0_pins>;
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c32";
> +		reg = <0x50>;
> +	};
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c2_pins>;
> +};
> +
> +&i2c4 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c4_pins>;
> +};
> +
> +&i2c5 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c5_pins>;
> +};
>
> --
> 2.45.1
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
