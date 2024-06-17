Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4157BC27C79
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 10:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=izQxzRtsXasRfyVR4nw8pGxruOYZa38cFNUXK9Q2JIY=; b=GysvtWNujb/2c/EDwT5KNS6dhQ
	h04AcLn2Affo0MVlqXFsStGFz/8S0jXXLls1wvQ+ziUwTifnEWeeELftQkInsnKKl9xkjn3g8VnnI
	aFa+2IcyV9kp7kMKJ3iDfJwJoyRrh0Tdz76OC5xjC4ACID+itE8yDbM0VziznsseQ+MoB5OyihP7r
	kGGyCW+RQy5IZx5rRWNktrazmlRtqHTrgzvFPRmwMWbYFTE9JQgvkYqKowOJFypGXjshr5NmA6Wsu
	GuHnS16oXhGKJDrqErlSCUAp4aZbCfs08obicpMdgaXVs3ArrEWsHvW3yDlZkvBqJtYt5vgzHH8+G
	K7xi86UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ9d7-0000000AGMV-0sbV;
	Mon, 17 Jun 2024 10:30:29 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ9d1-0000000AGJq-31qE
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 10:30:27 +0000
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CB13F3F724
	for <linux-riscv@lists.infradead.org>; Mon, 17 Jun 2024 10:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1718620217;
	bh=MXAKt8EKETZvadP49CyuSOUePneOkznNxCX+hfllm1k=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=XIFVl6Lbsbpi3RjF8o6AaipErUuyNbZic+D3RJ733ZOHRMfoSyimVPg+V9x6YBosS
	 RvXhGSaIWkT2oryPbyMFl2+5sqboQKWiWrkU7U5H8tghc7OMmpIKWGeJi8z6iiXwXE
	 12iSfIOmyAbaGipS985FiCBJG4FSNrpk6vrtqf5LeQiKUBUNKUJC1tfVc0MNL5yef3
	 1DLesWS/67Xfh+fqZ75O2f8cBaa8BGmLmC+A1bOfGC4jrfWsB+MZ46DAsKzowWrV7H
	 StvCK3bHmNeFq6v9YjIg5TJ8GlHQ01Po16rXUGwMkgBTGVsj9Lpx7PNvh7pO0miaUh
	 Om5K3VRSHHGtg==
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3d23e15f885so3612269b6e.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jun 2024 03:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718620216; x=1719225016;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MXAKt8EKETZvadP49CyuSOUePneOkznNxCX+hfllm1k=;
        b=Ww7LFfbrfsxLYNkDMWjP1mBs15BodwkpISoCWxmC5h5KUE5nWjEKPwYbE/xR0CZkJf
         fwGWNSAsxHehyePvWVJsakcvogdpkxV8Y7EQVfxaQDNPpfyEAQBS+m7MAYHiVnairh85
         CIX2MCKMchfi/V9n1wkLItK+sM89bJzJ/dB/jAM+5Es7+sSgwhB5nixpaGfaKA1VAaEk
         eMQbkoBrhqDcF+8JF9/Jzt3pKfzZAILraxjbAcpPvU9R5BjDPNy6v8YO4/afiFpXMbmO
         /16qgkpTC3wMuGjVdzYn97tC8nFf8qAoRGXYhJdF4yzMdHhpR5QWrYolGTcdqGfl9o4l
         0cYw==
X-Forwarded-Encrypted: i=1; AJvYcCV0xWqBN6LpPRAQYqs9xp3H5dUAZeeZKq/rn6YZCBbkUHe+74D6NPNW+vDrrZSddCobcGLxMaWlbeh7F2p0qQyfvTxngW0SzNPic9IFfEe3
X-Gm-Message-State: AOJu0YxPK/K53DXzeZ9ZFS9UxeOYe4dQ/s0UVAGksPL1QStaAy+LgR1I
	cyNgMCuo0ndfiRQ0buKeEF1lotShKvhlngTta1bbhbwm2dHT70GNnuEVX80sUEKq7ZvM2knbOVO
	MvEtYhVK8pw90jp9tF0RqAte3grbe65d8yEurtwSjflGH4UK/peVBVJ33TrDFyI8WIaYqH9BjRJ
	TswqpaXDV8Vx5Pxvy8uZfY0mqdd1SpqUI6261kM/5ePeDnDVqy44Ok6C3u
X-Received: by 2002:a05:6808:178e:b0:3d2:277e:45e3 with SMTP id 5614622812f47-3d24e8ce5a3mr10656446b6e.13.1718620216555;
        Mon, 17 Jun 2024 03:30:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+9wQA5vwfPc+PCiFhPHOS+btBOsojBilQG1Cz2k1uXktyifoa7BZcR5yZNh9VDUC79iFyorh+9SwK/IhPV5I=
X-Received: by 2002:a05:6808:178e:b0:3d2:277e:45e3 with SMTP id
 5614622812f47-3d24e8ce5a3mr10656422b6e.13.1718620216111; Mon, 17 Jun 2024
 03:30:16 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 17 Jun 2024 06:30:15 -0400
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240613005817.1485-2-naoki@milkv.com>
References: <20240613005817.1485-1-naoki@milkv.com> <20240613005817.1485-2-naoki@milkv.com>
Mime-Version: 1.0
Date: Mon, 17 Jun 2024 06:30:15 -0400
Message-ID: <CAJM55Z_j8gWFyKvsiu-oGDV7Hacr4Amt5FdkHdjKnhZwZgxncA@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: starfive: enable heartbeat LED for Milk-V Mars
To: FUKAUMI Naoki <naoki@hdr-nlb4-0bbd2e21834cb637.elb.us-east-2.amazonaws.com>, 
	kernel@esmil.dk
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_033024_046850_6534CB19 
X-CRM114-Status: GOOD (  14.51  )
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

FUKAUMI Naoki wrote:
> Milk-V Mars has a green LED to show system load. This patch enables
> a green LED as a heartbeat LED.
>
> Signed-off-by: FUKAUMI Naoki <naoki@milkv.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> index fa0eac78e0ba..4f4bbf64dbe4 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> @@ -4,11 +4,24 @@
>   */
>
>  /dts-v1/;
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
>  #include "jh7110-common.dtsi"
>
>  / {
>  	model = "Milk-V Mars";
>  	compatible = "milkv,mars", "starfive,jh7110";
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-0 {
> +			gpios = <&aongpio 3 GPIO_ACTIVE_HIGH>;
> +			color = <LED_COLOR_ID_GREEN>;
> +			linux,default-trigger = "heartbeat";
> +			function = LED_FUNCTION_HEARTBEAT;

Hi Naoki,

Thank you for the patch! I know the JH7100 boards are a bad example but
normally we don't assign triggers/functions to LEDs unless they have a clearly
marked purpose on the board. Otherwise we'll let userspace assign their
function (usually with udev rules).
As far as I can tell this line is marked "STS_PWR" in the schematic, the LED
itself is just marked "Green", and the silkscreen doesn't seem to indicate that
this LED should be a heartbeat. So I'd prefer just describing the LED and let
it be up to users or pre-cooked images to assign the function.

/Emil

> +		};
> +	};
>  };
>
>  &gmac0 {
> --
> 2.43.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
