Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E33C021AA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 13:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=denjJoNIrqUWYNQDulX5g6PMlan/N6PzqYR4D3L0oEQ=; b=NzDO1HIFUBhEiu61aAH9BKmHG9
	kHXudNKYEkvxGd/UCXWD5vMPLqfBCYeIwjSqj3rkmz3MWPj5iIUcT6oP2FKCaw1x/s0pIj4zj3Wh9
	+xP9uW2cEvwl713CQx0c3jPouCA+po6/XUjma6I7/gnPjhGEuG0udG1Y/73/3pGMTKrLx+IIKXV3x
	hKLyE1rzHgXjUVgEBSkkuiIEjDHUj+/x0erS+S7uVC5RnZMaUyOydirRG8QVeajJeeMOzOagvwqkQ
	xujnMk+Vm4iERaXin+wbcombmeKoLw1k4iuQCTLoQIR4RzTVihXEVwwFr+eNfieJRoC1J1LvikCGQ
	34B4SPXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkMq-0000000D1yx-2YT7;
	Wed, 19 Feb 2025 13:44:00 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkM2-0000000D1j3-0yZK
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 13:43:11 +0000
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1E361403EA
	for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2025 13:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739972588;
	bh=WFjePigVwF4Z8j9CYTif0ybYr6jQ2TZ/Iin7O5BwwQ4=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Sy1GdYfnf0ibXu9MD7IVANlxgA5M+uiNrl+9OfU+GPV+FMWjwnhXXM4t4sIs/9fE3
	 3xfTi2QbzESK+biWiF/5dxO3iv+LbDoULGpFKp4G6zRVv/animRcaxX8atCQNMnxK2
	 I8lTJBCYhmUDGrQ7Aj++2sPA0omHtbhD8O7zc+cqKEV/aB+BAVGseXdn2SzDeb8vVc
	 p2LFBO8tJiR5kZr7NQrEr4i7+gZw0ttB94pagxjqvmCskiSiotwmPGef+64qkVBYa1
	 JXteMJfHht34KMA1KFjYEK5mmoV19grosRstT2TkwK/CO69cjH7y6xAa5VYkQWDI2p
	 QM03VYq3b/x4A==
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-5fcec4e9f78so1995583eaf.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2025 05:43:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739972586; x=1740577386;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WFjePigVwF4Z8j9CYTif0ybYr6jQ2TZ/Iin7O5BwwQ4=;
        b=r34bhCwjRGBu6zgIoFXeJFY6SaWPnBIWJx2i65zpYxpOJ7a5h4BtLyQLvzFEq+vYQE
         SxX8rE//tdikgeYGuJYIPYBXSTjV6H0tdlMBajSWxN7tS892ufNk0w5SaKDKOHtcpt1s
         IzFe5Ikpy4AnHMCASUa2t4G70XYkfpmUGC16JqzjdOjmsATctgy1XfJzp2KMviWlXXdL
         58nM8fZCgKf5bLgtrYKTS9eUTuOPGse7jb+t6UULbo5ka/W9yHmPxlBWbBDr9ZbLKr2K
         CK28eIvAib9G5x9fq+5UFhhYRmROj9M+7xHax02AW0PLnv/eT3SMjSQd9XFJkUFCugkK
         xVAA==
X-Forwarded-Encrypted: i=1; AJvYcCUhmUny+gK+N8CnS0aDPVmaDMq99QdeZvRrJgZ7j0kSa28JeeV0kY9QinZXonSLky6B52G/pK62KHifUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcTfptWryWv7Bc+YZDwS/7SJ6DMtZd8GUu/onIqWMsF1VBVA+K
	JEwhRTCtIOxISUTQy2DLvkPIpkMqICpSNjTCXZJG631JhwfdF+PGpyQNomlRGtvxSgY9frcC6fW
	n3F6a/7EpnIDbFRaLHHwWhJwrXFi1O/uIb+tz0/F//SdTxlYJbsyWU/NHkkNr1ek4sDzjt5j7oy
	nTJkIhu+MbH8jBkfN1Hqv73wx8y+KuMt44ZuF/ZukTBK30Jt2+BYYuANkY
X-Gm-Gg: ASbGncuNWs+Yftli7E2HQEgHIIkqcjSDHar53Kye2VXgeFf6BdCdqunBBLqF++sAbu8
	eTadfyNtdyT8E8OpRY5j3s8OLNv0XKXbnO5ik9ZLZ8hO8bJ0J/BVTjrTWT+xhE0mjR3ke1nS6ye
	NTadvVZQtZ5Kmof6U=
X-Received: by 2002:a05:6808:398a:b0:3f4:d61:36cf with SMTP id 5614622812f47-3f40f236581mr2682845b6e.30.1739972586672;
        Wed, 19 Feb 2025 05:43:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYn9lRXBv/JpzO42HxdnnTEcRnjUT2CvEOcRyp+AhxkqJL3rRw8dalMjzUUDUoa47Zxxh/fN+SUIulaLwLwpw=
X-Received: by 2002:a05:6808:398a:b0:3f4:d61:36cf with SMTP id
 5614622812f47-3f40f236581mr2682828b6e.30.1739972586434; Wed, 19 Feb 2025
 05:43:06 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 Feb 2025 05:43:05 -0800
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 Feb 2025 05:43:05 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250207093618.126636-1-sandie.cao@deepcomputing.io>
References: <20250207093618.126636-1-sandie.cao@deepcomputing.io>
Mime-Version: 1.0
Date: Wed, 19 Feb 2025 05:43:05 -0800
X-Gm-Features: AWEUYZknIHcy7u_-bftvl8Qvj-VvK3o4Nv3eX4N0vbhXOKNS0iUj00wp-j9bK3U
Message-ID: <CAJM55Z-Csuw+sUgKkNUdsXfX0LkhsQKRTXfVXxm4kmKeABodTg@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: starfive: fml13v01: enable pcie1
To: Sandie Cao <sandie.cao@deepcomputing.io>, Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_054310_396422_652E28F9 
X-CRM114-Status: GOOD (  13.56  )
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

Sandie Cao wrote:
> Starfive Soc common defines GPIO28 as pcie1 reset, GPIO21 as pcie1 wakeup;
> But the FML13V01 board uses GPIO21 as pcie1 reset, GPIO28 as pcie1 wakeup;
> redefine pcie1 gpio and enable pcie1 for pcie based Wi-Fi.
>
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>

Unfortunately I don't yet have a board to test this on, but it looks ok to me.

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  .../jh7110-deepcomputing-fml13v01.dts         | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> index 30b0715196b6..8d9ce8b69a71 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> @@ -11,6 +11,40 @@ / {
>  	compatible = "deepcomputing,fml13v01", "starfive,jh7110";
>  };
>
> +&pcie1 {
> +	perst-gpios = <&sysgpio 21 GPIO_ACTIVE_LOW>;
> +	phys = <&pciephy1>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie1_pins>;
> +	status = "okay";
> +};
> +
> +&sysgpio {
> +	pcie1_pins: pcie1-0 {
> +		clkreq-pins {
> +			pinmux = <GPIOMUX(29, GPOUT_LOW,
> +					      GPOEN_DISABLE,
> +					      GPI_NONE)>;
> +			bias-pull-down;
> +			drive-strength = <2>;
> +			input-enable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +
> +		wake-pins {
> +			pinmux = <GPIOMUX(28, GPOUT_HIGH,
> +					      GPOEN_DISABLE,
> +					      GPI_NONE)>;
> +			bias-pull-up;
> +			drive-strength = <2>;
> +			input-enable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +	};
> +};
> +
>  &usb0 {
>  	dr_mode = "host";
>  	status = "okay";
>
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> --
> 2.34.1
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
