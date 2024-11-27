Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C51DD6ACCE
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 13:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WHC9Yb9RJQ2OweO+9TyTtcYjVx34zblfjq1W+JeHEcc=; b=DXpLMTyGxY20MP7W0b2BBPmaRH
	5+aOk4LX4Ky/jc3I0h9yKr4Jy3qdD0O+pvjZ2AWnw8dgJ1vaWCmLdPTTkki6g3uFa8VPocUFb74pb
	NYLNSF8XTZd9/5Qa1WrPz/5Ux3rC/Z6WKBvy4akGe5bnEbq9VLI0l7d1AlS0XsAzQzqoaKJJuwq6s
	/7fBfSXqe4HQfubJkkw+yN6cG25XSuhRDrOLcQMohwy9ngn870yCIT1dsGGJtlcmIPV41vZiKQDeh
	ypdB0B2RfmKNZ8UqV2pF6Ecy/+txJppwaWR3gEwvgI52o9iGYa7k++OR30Q8Ne6Yv+aTklzANAaFS
	oTCiCFSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGI1L-0000000DE86-23vS;
	Wed, 27 Nov 2024 13:23:55 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGI1I-0000000DE7a-12px
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 13:23:53 +0000
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 06B353FDB1
	for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 13:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1732713830;
	bh=cL5M32W3R5eUX/4zpFKVLV/R7h3YjIcs++U+D/L5AM8=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=kZT2zcNZ4whr2Esw3nQOaMBqrwe0Gh38IGj6VBs6jQH/XnptLC10BoGGggVQkvnnI
	 t33OkjwK3u6y5Avx5xUasv8HrtRzKZKK3I73XPVrwhzgtkPzsmiqHR6Wa10ARP6QZ5
	 kokFt/kZ/kP5wVr3csILHEN/rgmrBD9BNEzIq/H0/dw9/RYt5pogbzCgBMsCP7cU6P
	 kMi3Kz2ZOqXlqbBS8INsvyu6rtuh9woP5n7kNZRu5qmaq5r7+7fHCh0C6eO9KFdghV
	 vspjdSq9f6cHqT665QM32LUuk7CqSAWGXYyB5zBsdWwsQTirTeCpfkK7PkOmKKdrY8
	 aTBTVSa5pEXsA==
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-71d4366e193so2109046a34.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 05:23:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732713828; x=1733318628;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cL5M32W3R5eUX/4zpFKVLV/R7h3YjIcs++U+D/L5AM8=;
        b=dW2mJoiA47SfHL6IKuUo4vOaqwwTpWqa/BMsUA6JL2fu6cpGdwfQGGI2k2fYOs1x34
         MkfsFBMoss1WKr4gFFHT++jYJ4bE701duqki2PW6cViz6e8SalU0YQOP4JVJ7nlkQzER
         nYrLJVSJ5ropPeCjeEWqSEV9z6NgqCPHslXINfeRgKbWV3T0/5hV9nN1AJbQYtnAX95F
         9Loq6CwFh3s4AVhZ8bOtXUfPE+tomrLvj0MEqZNQaN6gfen7JTfQ5Nyrlvz8rdwl/Tp/
         jtR2KL86AKfA027pHe02xd/Oyf3vhr0sElOT1/JrczqYvyYh1I0I9Svj9deK10hHCD5Q
         Ra/w==
X-Forwarded-Encrypted: i=1; AJvYcCVxaFCKzAcqbna3NbVtNR6bOoEYNShxVQfaxG34DEt/3MXXt+t3FQyBhmyg1VeClUVY3AWDeBFjeZ2wRA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdAZI3mTSUk2/H8TbGyVZeGR63unIG+QFAUxgaXVMcsQc9FF5v
	EHV1mvJitrEzLQJPp8Kc86jUagySvkjx2L2u79CKgrnZSPWNF8cHNmfwcxnikIIb0c47FFbq6i9
	Umugj8ZnOzbkuCMAOIN74fikUFakARRdG0tXcyr+dHJEUHQzzg4PUrdMYGe86ChWZOgsteAKY2U
	I6/m9Qs2TtQ/840+KYXbt5U91ltCMKaexSkN/cZ95clJwgvHSXTlC8IT15
X-Gm-Gg: ASbGncsJU53WkchUGJ6q96sg0wRkDhZRylXW9eO5UJG3br5ph8X0TTevZttOz8dOTgr
	HBa4+2X6Mepf0yHzSH9urUf6GahOIkcd0TeSS1AHc97VP2DHwDWN+D4NhcHce
X-Received: by 2002:a05:6808:f0a:b0:3e0:4f6c:abcb with SMTP id 5614622812f47-3ea6dd47acbmr3886370b6e.28.1732713828048;
        Wed, 27 Nov 2024 05:23:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGufrHOyrMhM1rehaDhI1q2R5G+xXwoSxzeI2W2FAdnLZZRRJ6/ihK0V7J0ERO8UeSUM8vMDAVAOcN6kRcdi7Q=
X-Received: by 2002:a05:6808:f0a:b0:3e0:4f6c:abcb with SMTP id
 5614622812f47-3ea6dd47acbmr3886347b6e.28.1732713827792; Wed, 27 Nov 2024
 05:23:47 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 Nov 2024 05:23:47 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20241126073836.17208-2-e@freeshell.de>
References: <20241126073836.17208-1-e@freeshell.de> <20241126073836.17208-2-e@freeshell.de>
Mime-Version: 1.0
Date: Wed, 27 Nov 2024 05:23:47 -0800
Message-ID: <CAJM55Z8---o6_ZxeyUu_M74LA_zKfeksBmRGFkm2C66hRJbPug@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] riscv: dts: starfive: jh7110-pine64-star64: enable
 usb0 host function
To: E Shattow <e@freeshell.de>, Henry Bell <dmoo_dv@protonmail.com>
Cc: Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_052352_413760_44738A2C 
X-CRM114-Status: GOOD (  13.34  )
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

E Shattow wrote:
> Pine64 Star64 set JH7110 on-chip USB host mode and vbus pin assignment

Here I'd like it explained that the Star64 board routes 1 of the 4 USB-A ports
to USB0 on the SoC rather than to the USB 3.0 <-> PCIe chip.

(Confusing for users that 1 of the 4 similar ports only does USB 2.0, but
that's too late to change and not relevant here)

With that fixed:
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

>
> Signed-off-by: E Shattow <e@freeshell.de>
> ---
>  .../boot/dts/starfive/jh7110-pine64-star64.dts | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> index fe4a490ecc61..b764d4d92fd9 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> @@ -80,7 +80,23 @@ &spi0 {
>  	status = "okay";
>  };
>
> +&sysgpio {
> +	usb0_pins: usb0-0 {
> +		vbus-pins {
> +			pinmux = <GPIOMUX(25,  GPOUT_SYS_USB_DRIVE_VBUS,
> +					       GPOEN_ENABLE,
> +					       GPI_NONE)>;
> +			bias-disable;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +	};
> +};
> +
>  &usb0 {
> -	dr_mode = "peripheral";
> +	dr_mode = "host";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&usb0_pins>;
>  	status = "okay";
>  };
> --
> 2.45.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
