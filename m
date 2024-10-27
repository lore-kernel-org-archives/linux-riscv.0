Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728A7D1356D
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Oct 2024 16:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=R39DI0JyAN4e8c499+rFEv+vAyRfw4hxNSGR6WMRSWU=; b=Lj1PdtAhb2MuMZXod/5jr4EXms
	m8DecZabGQp/c64CHd8+fssMgAmfSR/oWepBxBt6mDJSWabpdvHtan8oc3eQNdI18fIe7Ru+zYPzX
	HdYc00x/d1WxSHU81LgIdl802XR2mKWNWyZIn05gGz9jU8PBOAPS+NQAX+0Xlk7nYj6dxzK+H2wfb
	armdpIWSEk3fIoiI6k+ZdjL0msaHLvza3/WULg+V9+zThkAqx4rFNTCwZv16LblOqqj4lD3mYr0Dk
	xA9OphdVEfU1AO6t5riTxXN61ynidUfGErBpvm7KxMEVqYFXveDo68b1mK4hx3Gp3clGX8Cyb9bIS
	JW3cOc6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t56HP-00000008Y3f-46Fs;
	Sun, 27 Oct 2024 16:38:16 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t56HN-00000008Y3G-2BRq
	for linux-riscv@lists.infradead.org;
	Sun, 27 Oct 2024 16:38:15 +0000
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EF54A3F2A8
	for <linux-riscv@lists.infradead.org>; Sun, 27 Oct 2024 16:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1730047091;
	bh=L6fX0ga/wJJ+KuonzpY47wlRqLMP80SVChx+E93Tonc=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=f4ardfP3y2achHxaXM5MzZlWNHTHrsX4LXYARnXctG+ziirSuCWUpD2o6fOK+2u/B
	 r7pr5rZMFn8xT/tNYJcT6brQ9ddPblq0XnQNlYX1huPmqGzQlYigyAMxXEKx9VKxqO
	 qjqvC5Yf40U6obaaj/Ze+xj+FjKYvq4raxZ64iL6RhmnTnTdn1WcHbV3ZAqnFZwGvS
	 IZA8YKF8D1SiU31WgeJPjIxWQesABdAI3YuAqoHfrfRlGySK5R5D/Mhi5liLL9KmoT
	 QP2Pwo9Mb+zVJH10qrijPrgcAwYmSN1C7KKdSbopGaviSe8GpXUtYuVMSA0jw5Xhqx
	 hRgUl4F+j10Nw==
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-5eb5bfc32ccso3114351eaf.3
        for <linux-riscv@lists.infradead.org>; Sun, 27 Oct 2024 09:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730047091; x=1730651891;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L6fX0ga/wJJ+KuonzpY47wlRqLMP80SVChx+E93Tonc=;
        b=DZo0DWy5vlXHz+Y2Q8MC7mxn3HvNdUlnb8I94dcMPaPvGsdVSRxrzYk7J9S9yeJ/v5
         v0g/nNjDKDL6/r7ehVPuz+G2xHRoX6dEmYqzEnLrYOwqfEr1j6fiNeub+I2dHDKtc6cW
         +lE0R3ugXEyjBcafJ9rYdwHCVwl08OBTaiVXjtmTnk6o2dsTldutpYcbrL/ZX86Fv6rn
         UbIrDDRglwvJYpPPdOnyfFyS5idsIJjITs6viU5hDuJRNMnv1F8PN2YPNl8QI/UzGIeH
         mWX1o7TgxgovueBM/wt8p/P+mquzaDISK+/tT0bARVmW+PJt48t+bnQwcBWpYWCCwISQ
         cUwg==
X-Forwarded-Encrypted: i=1; AJvYcCUtWVYa0UskXxTWaCAea7MzNMPKDRWVJcz0OLt7dj7oM4SeCZUd+fYA0gL9gfQBQ5ddMHvJFrHOp1w37g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlFnfV0F7YqRPGsXOZCXNbAle1x125L5qUwg3QkOg/p+aOPHnw
	lcDQIl0XfNZQuU74x/N00VXxitqlb4gnkPhR6Hngitc1rYAsMvDdhTyZzYWD8rSTliYqoaGqwAS
	aQbjyOgsqZJVd0gUdBpOFrMqpcVGAcT5jvfj9z1VPGD4M6PsAP+OIjsCn3+vrBAZ8Qbot80bbvE
	MlK6qIZN9CJfnvj86lqioTAUij8pidHYqKayZJSU8AaDucv1gqDQs77+Am
X-Received: by 2002:a05:6871:207:b0:277:dc01:75d6 with SMTP id 586e51a60fabf-29051db63f1mr3277945fac.38.1730047089912;
        Sun, 27 Oct 2024 09:38:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFk2PnZTePh4hB8asBsbIbJjk9A8StPDXdojH/EWhG9gZdGzL1o2gl0MrExOQ+Mk6kwusrvyZUu5zJLp8ah8xg=
X-Received: by 2002:a05:6871:207:b0:277:dc01:75d6 with SMTP id
 586e51a60fabf-29051db63f1mr3277891fac.38.1730047088150; Sun, 27 Oct 2024
 09:38:08 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 27 Oct 2024 09:38:07 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20241027144448.1813611-3-guodong@riscstar.com>
References: <20241027144448.1813611-1-guodong@riscstar.com> <20241027144448.1813611-3-guodong@riscstar.com>
Mime-Version: 1.0
Date: Sun, 27 Oct 2024 09:38:07 -0700
Message-ID: <CAJM55Z8wzAKEHJjrG5i18hCRRi5rh8y7Fx+SQ4qsTy1g0oWbQg@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] riscv: dts: starfive: jh7110-common: move usb0
 config to board dts
To: Guodong Xu <guodong@riscstar.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, rafal@milecki.pl, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Heiko Stuebner <heiko.stuebner@cherry.de>, Michael Zhu <michael.zhu@starfivetech.com>, 
	Drew Fustini <drew@beagleboard.org>, Alexandru Stan <ams@frame.work>, Daniel Schaefer <dhs@frame.work>, 
	Sandie Cao <sandie.cao@deepcomputing.io>, Yuning Liang <yuning.liang@deepcomputing.io>, 
	Huiming Qiu <huiming.qiu@deepcomputing.io>, Alex Elder <elder@riscstar.com>, linux@frame.work, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_093813_710495_104FE5A4 
X-CRM114-Status: GOOD (  13.76  )
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

Guodong Xu wrote:
> The JH7110 USB0 can operate as a dual-role USB device.  Different
> boards can have different configuration.
>
> For all current boards this device operates in peripheral mode, but
> on a new board this operates in host mode.  This property will no
> longer be common, so define the "dr_mode" property in the board files
> rather than in the common DTSI file.
>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
> v6: New patch
>
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi              | 5 -----
>  arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts           | 5 +++++
>  arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts        | 5 +++++
>  .../boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi      | 5 +++++
>  4 files changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index 9e77f79ec162..87ea81e9fed4 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -637,11 +637,6 @@ &uart0 {
>  	status = "okay";
>  };
>
> -&usb0 {
> -	dr_mode = "peripheral";
> -	status = "okay";
> -};
> -
>  &U74_1 {
>  	cpu-supply = <&vdd_cpu>;
>  };
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> index 66ad3eb2fd66..0d248b671d4b 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> @@ -52,3 +52,8 @@ &pwmdac {
>  &spi0 {
>  	status = "okay";
>  };
> +
> +&usb0 {
> +	dr_mode = "peripheral";
> +	status = "okay";
> +};
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> index dbc8612b8464..d5180c67ac55 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> @@ -80,3 +80,8 @@ &pwmdac {
>  &spi0 {
>  	status = "okay";
>  };
> +
> +&usb0 {
> +	dr_mode = "peripheral";
> +	status = "okay";
> +};
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index ef93a394bb2f..5f14afb2c24d 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -60,3 +60,8 @@ &pwmdac {
>  &spi0 {
>  	status = "okay";
>  };
> +
> +&usb0 {
> +	dr_mode = "peripheral";
> +	status = "okay";
> +};
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
