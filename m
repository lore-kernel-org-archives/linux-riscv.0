Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F2EC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 13:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=a+E4X/26wIfQNp1K6yayyNhbQ87r4oL585IL2GhnWYM=; b=1RX1Maa59rCVPrYGNqZblZFrJH
	hUnaTrKHcYLvwk7oAZIP+8/Q83Nj2spI7zKVAFtXDFiaeZ/OjVqw8wzR+B7tVYRYJ/T02Zq0lHRqx
	tLSa7PoK+arMwMgaamBrPE8xdbwQNV2Jhla8XhioOKzjbqcvfyx1xSYRk+YTcYtjpBbvBYjrIf5kv
	/gPdAejH1ET2VXGRn1rcgz66D7xZQ17brC3rakF8dCbJcUNbeuMGFVyLWU7LklFELrsTlENXrK7Pz
	VOjI84NoBFYtle09LxIRGRknkaWaO6hD2LgaXptpKLBwEF9cPg2wDo5KJNHDaGpqgc/K8aXn1ErJ9
	yjilXotg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1RDS-00000002yNN-2cjz;
	Mon, 29 Apr 2024 13:38:46 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1RDP-00000002yMh-40gY
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 13:38:45 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5BA243FE60
	for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 13:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714397922;
	bh=kzInz2Vec2Du6of2Q2xRfBv09lBEjQPll+bykpZr/3A=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=pCGJMsAdbesIO5ygg3UU/dSWG3Qg8HAkgdKKtP9gtIpmvWefBNOvAIoqFlkmcLNcX
	 OxWpOAtmIhUjr8boeRNL/NYoE4o1+ag5r4RKC7odHo8OuLiMJSTPYx0BOZ8bQns10J
	 A1uYMvBAGE+P3GvMPgHuVwBZdHkzZ5+BygDRR4Re/4mgikEVy6GPttqjJgmlrc6uYw
	 bvp8PsKmcMmcY0z/02itUeeWNe/9CgCUOJ05C+uUL0BIzaM6cB8we6jR5DLa2c3hFM
	 /SJE46Jang73dLYHS0ykJ8Pc6twXOcpdCgRgEEnQH39mmAQIlFr+M3U2pZfqAKLmJ1
	 ABacP53ckffSQ==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-43aa091f95aso31068201cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 06:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714397921; x=1715002721;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kzInz2Vec2Du6of2Q2xRfBv09lBEjQPll+bykpZr/3A=;
        b=T6OQlrZMm3MOapGzJIeByp6bdOjEseoSUuo9aUOUh7XlNsi/18PEi1IXHbYNCAj0OO
         tVLvZ/y9BU7BTM5nT2pvGX6G0UE48oL4hedRdCiBmCfQJwlKULopeoy1728Jca1HvxMU
         MmgYhgtko9TjY6/O7p6M02//vaerlvvuikMuioFubXVhqgaCOe+gjjdtLpW3qlNfbHdk
         wVEjbpdqgtBenT7+NU6GGYk2H6k15nOJ+3AEdgk2fgD2wTnTPP2lAb6wqBb/+D0QIlLE
         uMUzQ5MnV3v55smcACVYZbkeHgC+1XpzM5nDDGJGaOm/sM8EjP02OlofP5tU8RY0WqNX
         OJYg==
X-Forwarded-Encrypted: i=1; AJvYcCU7b/ZyEo+Q/L+jjlVxIJBoguscYr1SfNxzBEpIyQ0iWkiHruU8nKIW8QuWCa/WkcpZJmgFnEy5d5GKOGAYQKVm0Etaa6WLWG6Y+b3OxJlo
X-Gm-Message-State: AOJu0YwhuImzLormObM6QUfR42IPbCtEoz8xWHTzWSqxIrQI+YmlpHnh
	0tbSKaWYCi+QDlMKPZCT5v9UsRrVM7fDyjROVeyf6r9lnx8dfZvl0FyMF9Q500Of9i6zUBEifqJ
	KnawT9civg0LKXj/IcG9IZfyY2hf36owJBcUbvxw6ILt3Q3viEhxjKvZELcrg8rzQG1gfI2jZJz
	CYeKVk0e+64wL9R1L74fgYxZX08PAD35b1X/9TPeiIxOHozoFL4JUObkMlMij9eNt/pfw=
X-Received: by 2002:a05:622a:d2:b0:43a:c1cd:2f54 with SMTP id p18-20020a05622a00d200b0043ac1cd2f54mr5559225qtw.56.1714397921138;
        Mon, 29 Apr 2024 06:38:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeybrboGuMYLfrb0LN1/Eksczu7rd1QL7MzncvDdBt5BJRSCjVGbxulLQUKQopeFU++pv+AdoWRrTYLVYMbT4=
X-Received: by 2002:a05:622a:d2:b0:43a:c1cd:2f54 with SMTP id
 p18-20020a05622a00d200b0043ac1cd2f54mr5559199qtw.56.1714397920849; Mon, 29
 Apr 2024 06:38:40 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Apr 2024 06:38:40 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240425082138.374445-5-thomas.bonnefille@bootlin.com>
References: <20240425082138.374445-1-thomas.bonnefille@bootlin.com> <20240425082138.374445-5-thomas.bonnefille@bootlin.com>
Mime-Version: 1.0
Date: Mon, 29 Apr 2024 06:38:40 -0700
Message-ID: <CAJM55Z8Nj8WAohbANf99nznKxkrTMnSxyC8imYXNJZnuC0XH1g@mail.gmail.com>
Subject: Re: [PATCH 4/4] riscv: dts: thead: Enable I2C on the BeagleV-Ahead
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, jszhang@kernel.org, guoren@kernel.org, 
	wefu@redhat.com, andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Cc: miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_063844_146921_BA623F7F 
X-CRM114-Status: GOOD (  15.73  )
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
>
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
>  .../boot/dts/thead/th1520-beaglev-ahead.dts   | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> index d9b4de9e4757..22a6935e7204 100644
> --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> @@ -79,3 +79,25 @@ &sdio0 {
>  &uart0 {
>  	status = "okay";
>  };
> +
> +&i2c0 {
> +	status = "okay";
> +	clock-frequency = <100000>;
> +
> +	eeprom: eeprom@50 {

Nothing seems to reference this. Are you planning on adding adding some code
that needs to read this? Otherwise the label is not really needed.

> +		compatible = "atmel,24c32";
> +		reg = <0x50>;
> +	};
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	status = "okay";
> +};
> +
> +&i2c5 {
> +	status = "okay";
> +};

Does u-boot or some other firmware set up pinctrl for these 3 I2Cs? Otherwise
enabling them doesn't really make sense before we have the pinctrl settings for
them.

/Emil

> --
> 2.44.0
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
