Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1900C25B75
	for <linux-riscv@archiver.kernel.org>; Sun, 26 May 2024 12:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=k7ef9CU5VcK5XBFdrnCj1MCIIsrUqksNJOgacd3OvpE=; b=LwbgSooAeQ+9P1A7rSeKK0hH9S
	7U1hfW4C05d3J/Sr56qAa1f8TzIuiZ8XXz2IziQS7oiVNBgNm336KcjikSkRGk2wibCUknRadFg88
	YjHQ3Zg/MSlUgG2gp5Pl608nsz6B9WhjvXIOQIIzc/cpGCjbvnAQHwCVImHRbhay8JqCFtXSPXs95
	26aSPHMyO+XfCPmo2mCHANeAQvy1llLoyVWof8L9K8bho9Vq9H97651gwpZXcJceFRWA+Fu+9flp6
	UBY6kRDkSEZ1VJn36+cLSZJ0Pcd9wC4s2DC/nFt1+5mu1sHwqrvpoHECa2U4mf49lOeEFjrwkANlA
	cVtjHpEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBCYz-0000000CerW-1LLP;
	Sun, 26 May 2024 12:01:21 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBCYv-0000000Ceqs-49Q3
	for linux-riscv@lists.infradead.org;
	Sun, 26 May 2024 12:01:20 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C97013F469
	for <linux-riscv@lists.infradead.org>; Sun, 26 May 2024 12:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1716724868;
	bh=tvkwPnG/2WS9EBDE3dwEymI8zBU1MKtjDDlk1d+P43Y=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=cZxp1FGpu5+RT5MxAL/6L5ZboOyid6UKX6919bXRJ/p3k7xPvz5aKiEDCBLbVaIxZ
	 Pr2aepMBY86bZyZiItsSPG/JI3CXVuqkscX+RpffDvYSZ7S0NMlNHuQ9MBJhFl+D1A
	 waIdkb1yeDnZ06EkiH2R7fCjx3MSU50dewrzEiJ1K0hsMh9EVfWnzhLdRqeqgc4qIm
	 dosU+iVZzeC89Uyr+dcHCAwNurbzSYrgllJC0PgwVttH+o8B0cuv3tPLaY6VvOxB9+
	 HUQ+qZFL0OiGTwFHkzupJTYyl7+2y5PB/65PVA21/60nAk79SSFUGTB2YW9hLnS/Ti
	 gCL+dL6G0pdJg==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-43fb0949d28so38641441cf.0
        for <linux-riscv@lists.infradead.org>; Sun, 26 May 2024 05:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716724868; x=1717329668;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tvkwPnG/2WS9EBDE3dwEymI8zBU1MKtjDDlk1d+P43Y=;
        b=cT4b0G3F6yBN0992pG3qM/6brspkU9PGDrZL8jc3clfE/mXSiD1/nCOjuC7UgCpudF
         BAdxsL0hf5y1ko4BfOLmIM6DmBpfsHAYKXmDK2Y5Ui9Jfhe2filLKPD6+nM8PDLCEAJA
         xafxao6CjRoa3uevcVdaUNEN0d6JU3UpkE3lQ7QJWmE5iPYmm0zcGzobuCzohJ5vXpMo
         lRvHvhoT2JgAReEcsr/qTYm2895mCVoxIS/yj5E8pjK3LG70FwV25mX96YEGiCAcpKjY
         99+z/shKXt0f2+4eZbnJ9YJOULAYB6sjfYqCoJZKRXx33nAzvQCsiiTJ6SNvr7SiS34s
         OlhA==
X-Forwarded-Encrypted: i=1; AJvYcCV9Ht6Io1+9qXtvT+bTZuDZeK+4zpN00TMDJbNAG48TfGRLu7pqqCKazhqTwQEYhYprxoKdSXe7SycWejIj7ll+lnAMk0q49JOpONZHmoGd
X-Gm-Message-State: AOJu0YxhcKOuFll2aP3QzKGg5tvHn8HjJbVWsQ5tMgoYgX8A61J5kphO
	0YJpxvdy11qCd02JnIvzA29K4Axtn1CkyeNVkQThJdgGBleznWssQNVDERCUGCF8dOwm9agrU4k
	0eKODzzQ3YbSygKoXXsVn8o8ljQ0bdaM+NvJku8SHeAxTD8W6xwZhXybV/dCE0hUfK+tIWFVura
	QoSSEurAKxtBSrGNOD4XhVXQXX/PwvlbdQu8n1eMx9o38VX2o74J0SycmA
X-Received: by 2002:ac8:7c44:0:b0:43e:b52:eea1 with SMTP id d75a77b69052e-43fa746b00cmr180430411cf.16.1716724867705;
        Sun, 26 May 2024 05:01:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJkeH2LUqAq82Lwd2C/Zgjoasg6mKLwrH8I1wgWYFfVMAYYWA5MjWZNr4+CmcBQiREsO5oMSN6bb46jagFZVU=
X-Received: by 2002:ac8:7c44:0:b0:43e:b52:eea1 with SMTP id
 d75a77b69052e-43fa746b00cmr180430101cf.16.1716724867369; Sun, 26 May 2024
 05:01:07 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 26 May 2024 12:01:06 +0000
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240517-i2c-th1520-v2-2-d364d135ccc6@bootlin.com>
References: <20240517-i2c-th1520-v2-0-d364d135ccc6@bootlin.com> <20240517-i2c-th1520-v2-2-d364d135ccc6@bootlin.com>
Mime-Version: 1.0
Date: Sun, 26 May 2024 12:01:06 +0000
Message-ID: <CAJM55Z_jXFx05YJFOfsguvdABALhi143xpwt61AGiXiyTwRc7A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] riscv: dts: thead: Add TH1520 I2C nodes
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
X-CRM114-CacheID: sfid-20240526_050118_380039_9B185A45 
X-CRM114-Status: GOOD (  15.09  )
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

Hi Thomas,

Thanks for the patch. Some comments below.

Thomas Bonnefille wrote:
> Add nodes for the five I2C on the T-Head TH1520 RISCV SoC.
>
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 50 +++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index de7116290ca4..ae6cf4c441cf 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -252,6 +252,36 @@ gpio2: gpio-controller@0 {
>  			};
>  		};
>
> +		i2c0: i2c@ffe7f20000 {
> +			compatible = "thead,th1520-i2c", "snps,designware-i2c";
> +			reg = <0xff 0xe7f20000 0x0 0x4000>;
> +			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk CLK_I2C0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c1: i2c@ffe7f24000 {
> +			compatible = "thead,th1520-i2c", "snps,designware-i2c";
> +			reg = <0xff 0xe7f24000 0x0 0x4000>;
> +			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk CLK_I2C1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c4: i2c@ffe7f28000 {
> +			compatible = "thead,th1520-i2c", "snps,designware-i2c";
> +			reg = <0xff 0xe7f28000 0x0 0x4000>;
> +			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk CLK_I2C4>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +

These nodes should be ordered by their memory addres, but the gpio2 controller
above has address 0xffe7f34000 which is greater than i2c0 at 0xffe7f20000.

>  		gpio@ffe7f38000 {
>  			compatible = "snps,dw-apb-gpio";
>  			reg = <0xff 0xe7f38000 0x0 0x1000>;
> @@ -342,6 +372,16 @@ uart2: serial@ffec010000 {
>  			status = "disabled";
>  		};
>
> +		i2c3: i2c@ffec014000 {
> +			compatible = "thead,th1520-i2c", "snps,designware-i2c";
> +			reg = <0xff 0xec014000 0x0 0x4000>;
> +			interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk CLK_I2C3>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		dmac0: dma-controller@ffefc00000 {
>  			compatible = "snps,axi-dma-1.01a";
>  			reg = <0xff 0xefc00000 0x0 0x1000>;
> @@ -416,6 +456,16 @@ uart5: serial@fff7f0c000 {
>  			status = "disabled";
>  		};
>
> +		i2c5: i2c@fff7f2c000 {
> +			compatible = "thead,th1520-i2c", "snps,designware-i2c";
> +			reg = <0xff 0xf7f2c000 0x0 0x4000>;
> +			interrupts = <49 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk CLK_I2C5>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +

I know it's probably hard to test i2c2 with the Ahead board, but chances are
very low that the disignware driver works with i2c0, i2c1, i2c3, i2c4 and i2c5,
but not i2c2, so plaese add that node too. The audio and aon i2cs are fine to
add later.

>  		timer4: timer@ffffc33000 {
>  			compatible = "snps,dw-apb-timer";
>  			reg = <0xff 0xffc33000 0x0 0x14>;
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
