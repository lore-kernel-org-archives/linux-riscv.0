Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6AEC2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 21:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XZAEUCcZdAYqJe8HWlAwISE3Cm/Gg4U5ciP12ps7oMg=; b=JPaX5Pq9nP/mQf
	sNsDUf7AaPlSQnNVJ6jhn701YHKQWukvCt8VWEQKU4xDrVmYu5GhhNfQbTIhnqX7Sppqse8eBdT0D
	ptih6NAyY5brhmf39KnTejR/S+alFxRF8812COpox6OEaHBtYvAZrUn+AWoutPYhpfJ0wW3T5U/5q
	0cNYlSDakCNSp0GuHcaal/MqJfgUAgs0mtEr6Hf7+mqNNQUrvOZuYISQhkPIeo/koDf/wMJ5t5at8
	j9fp4tczIoyvKXo8qELiNloatJIplGQmMDGKA5mVukCvX49EZ2llZ3MVg0U77VhkqIhDonUclO7Yh
	E1XxVoE+rbLHpMHe82NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMDkh-00000004Zqi-0fVW;
	Tue, 25 Jun 2024 21:30:59 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMDke-00000004Zq6-3QFx
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 21:30:58 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1f9cd92b146so47109045ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 14:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1719351056; x=1719955856; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B2W8rgNXG1QVMuA1bBYIoQVqie0Y2SU5GMCzLUNZnjw=;
        b=RU4Y7bV3BH7cvrEliirGxx/M8ZKzMYjK2j9pCOJvv1Eb39Rv+CkG/xE9bs57xd5vM9
         Wdnb2ZYfSfHWvfOY29iwKkBPluFjVAa+ltY9yooEykvBlTPVvVllDAxCpXcEZ6KpTlIj
         wRTt8HiKlVjiWjBzJi+aAIaWTU29a3Fb6SQM5i3zbQ4e1HvznnU90dFyBviKw594MWNa
         so+GAbfUq3Ttn1/XCSBWVStu0JCHNZ5HWsaAh3GlDJihMubS1hvW5AxwXc4lj6DCYcu5
         eJPlKx7kiFHM68d+oLnhmsPspx5Ft12gE1LIFwZ4kVBTnxeJs0HOI/l5M10kPzl0kl6j
         yoog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719351056; x=1719955856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2W8rgNXG1QVMuA1bBYIoQVqie0Y2SU5GMCzLUNZnjw=;
        b=H2QCIkI/UkgabgI5xMoSPJ3OCKa+hFCb52bnKsxL1t+T/gCRa3P89GSy02DboCpTfR
         a1FvFG7iCUr33LNxS/x9aSKbmqlDblLINzTWtxmAjskCSTaIZjJZcbm++IPlIAPZ8Dir
         Q1kTj7new2li/zQB1bRD16lE+YzQ8edQeqBXDabkAJw/nIvQqRvSlawyf5fqsQBzA0Jy
         2rpiWbrRZxpCE3in8+55fwHponWlEB7r4TkvQvkW61QvITWWH0TMMl0w1Xix8Vb+09oJ
         HNR0d8t+o7b6CuH5RPi2+xjjE2HidKnXCY21CeZRiydfprwl299IKqA3cR+8SwtZhkSS
         wxdg==
X-Forwarded-Encrypted: i=1; AJvYcCWElu5NocaxaIWzFab9OhCdf0QVx9JgY0fHNgIFYikBoatEzCPjZ6Pfb/sLBn7pvPcOnhU5FGVEDKPZZER+e5bezyztlop3K83WwBOEXT9C
X-Gm-Message-State: AOJu0YxqVHR3Vlw7jK4wwWPrqqAdNVpK//CoOkopMUgusDOt7PtDcILd
	VeNpjEUvB7c1++dYReF68qa291UtkWrjAvM5ZKkZIrkpnMgvmVBXjnDSAdGj7fY=
X-Google-Smtp-Source: AGHT+IHLYzhYJqgZIhjVBl957rNEit7/68mjSYfy0ZR3K9f3qNxYJuPCUrQQrG4u1+TQDgmb+OtrJg==
X-Received: by 2002:a17:902:d4cd:b0:1fa:18c3:2788 with SMTP id d9443c01a7336-1fa1d51c210mr95820215ad.24.1719351049966;
        Tue, 25 Jun 2024 14:30:49 -0700 (PDT)
Received: from x1 ([2601:1c2:1802:170:efe7:d185:104e:b7b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb7d245asm86453135ad.232.2024.06.25.14.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 14:30:49 -0700 (PDT)
Date: Tue, 25 Jun 2024 14:30:47 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Conor Dooley <conor@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 3/3] riscv: dts: thead: Enable I2C on the BeagleV-Ahead
Message-ID: <Zns3B/eJUUqFL6XE@x1>
References: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>
 <20240618-i2c-th1520-v3-3-3042590a16b1@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240618-i2c-th1520-v3-3-3042590a16b1@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_143056_893698_FC8EE2C6 
X-CRM114-Status: GOOD (  17.71  )
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

On Tue, Jun 18, 2024 at 09:42:40AM +0200, Thomas Bonnefille wrote:
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
> 
> -- 
> 2.45.2
>

Reviewed-by: Drew Fustini <dfustini@tenstorrent.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
