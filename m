Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03181C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 13:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OblShWinc4Lk9DqPWvFXGSZnxO17hJAgpyy1uS0xkZ0=; b=GRyjHKtUDrZCx18o4xIhM14H5C
	9lfCih4o/RPp+KcJ94vttHxjXABVzWdLLND5CSU5IayRxMa4APaIul6iGtTna18RBD1Szt3F3Wu33
	0fi1J0s+XbLS/DYCPzErbH1Qixhe3znqhnfLL08rYQY//ucD+jnftCfmPOmZpUxV/NLxNcmqmem8A
	I7PSmsmFfJQvdr2O9RCYwXkQCslhD03zUN0Nf1tyxhs7Fgvr4BM2Oxmc4GMetJrDiw155+v4M9J3w
	fl+jTMCZIQlw9hEiFnfENOKOv43HkpTrkJE2yuhPhK8wkwzpLffmqjsZXd3fmUolwZn/6YjBt+jV9
	2caR53zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFwvm-00HZ5p-2c;
	Wed, 20 Dec 2023 13:48:14 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFwvi-00HZ2y-1L
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 13:48:13 +0000
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 300BD3F337
	for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 13:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1703080089;
	bh=Wf8bdqHDddS6qx2uHaD55Uu+LiLQy0d/grCj6aFu9Gk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=v6sb8UKrkMrX9XqrfNjORAFlrEzG8f9yApgLKydLqLa2LqNVeEc0xSNWXp4aGr8tm
	 RThnzaCJyvWyJ9os4TJ8KvVbXmI7+RrLf11Yb0JkcUiI+rQs9+Xm4CbAAbTJOyoHav
	 KTkqnwYLBBKqsTIJDWlBdmfvsSWTR6keDzRTJdMXESJXG1N8h/VQuhORKmonLOP0kT
	 U7FsMx5PQq1zB1Qqkv0d75OytNxM41IcshkaSq7NXcGtW7TgggxUsgAV87a0gtypWw
	 EzErnDnX9wAqj3FNFJBYvfa3UCTkTKDtVvqogT4WabmLETvLlnWO0AxoPANgrv2OE5
	 Q4B1rTkVnO3Zg==
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6d9fa2f1156so3710869a34.3
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 05:48:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703080088; x=1703684888;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wf8bdqHDddS6qx2uHaD55Uu+LiLQy0d/grCj6aFu9Gk=;
        b=jceGodP15E1ULiup9QyuXRLMytKjMGxuUq0gBiQLP1lsIG7OpU6kH6z+esexgFQGyN
         7pgw0cPFVzseUeS7JhuSZ6SbByIKivutW8Q5obAjFMbS0I+riewELQ9k+DhtxioMk31i
         ErhMkVkpq3Mt5mnY/BJifEmFrkBj0UxFBvfbR3u+uWnf8UHCsxeDkGAo4viiaC7vIyen
         ctVC4jDUo2WUGZqI5k3GfYrExiiwWzg9KjVYVOXaWUF9FPOd884Bu+KnP1ZYnnV2/HsN
         Gei13NTQvb7rDbKPrbxF6O/LDiHWUylMJeEBIFrLD6xQRzo84tRgtIAemuzymowf2Lcq
         AcxA==
X-Gm-Message-State: AOJu0Yw8ce0lx2KzLh5bE003c6JVROdpxIYp2j5XWAXk5ZCkk7JygELU
	gKGISOgSM0plSIm5wfX8j3Y3JSGP7TWxcOG1MectLmzcsKALocy3DlO5oZ1eEsh+VfU/M59x0k4
	E9lnldH/GySd9H1zosYWevZl/pG1QU109qE2mPq5FDNc35tuVC6pIlE8e90MM/Q==
X-Received: by 2002:a05:6830:3446:b0:6db:b23a:b416 with SMTP id b6-20020a056830344600b006dbb23ab416mr98111otu.21.1703080087908;
        Wed, 20 Dec 2023 05:48:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYA6vAaZ3TBzIgMihk2AMB3yObL8Bh76u3ZiGRAugO4EV1+9YbXqh1VlfLWf1FVtHqBXVwZ+TVgOncMeSajCQ=
X-Received: by 2002:a05:6830:3446:b0:6db:b23a:b416 with SMTP id
 b6-20020a056830344600b006dbb23ab416mr98097otu.21.1703080087626; Wed, 20 Dec
 2023 05:48:07 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 Dec 2023 05:48:07 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231220004638.2463643-4-cristian.ciocaltea@collabora.com>
References: <20231220004638.2463643-1-cristian.ciocaltea@collabora.com> <20231220004638.2463643-4-cristian.ciocaltea@collabora.com>
Mime-Version: 1.0
Date: Wed, 20 Dec 2023 05:48:07 -0800
Message-ID: <CAJM55Z-CWHs1XMOYLOYQmB8qjZ=a3fhyGv3hJAN7bbbDQdEy0g@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] riscv: dts: starfive: visionfive-v1: Setup
 ethernet phy
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Jacob Keller <jacob.e.keller@intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kernel@collabora.com, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_054810_632677_729F498D 
X-CRM114-Status: GOOD (  18.64  )
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

Cristian Ciocaltea wrote:
> The StarFive VisionFive V1 SBC uses a Motorcomm YT8521 PHY supporting
> RGMII-ID, but requires manual adjustment of the RX internal delay to
> work properly.
>
> The default RX delay provided by the driver is 1.95 ns, which proves to
> be too high. Applying a 50% reduction seems to mitigate the issue.
>
> Also note this adjustment is not necessary on BeagleV Starlight SBC,
> which uses a Microchip PHY.  Hence, there is no indication of a
> misbehaviour on the GMAC side, but most likely the issue stems from
> the Motorcomm PHY.
>
> While at it, drop the redundant gpio include, which is already provided
> by jh7100-common.dtsi.
>
> Co-developed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
>  .../jh7100-starfive-visionfive-v1.dts         | 22 ++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts b/arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts
> index e82af72f1aaf..4e396f820660 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts
> @@ -6,7 +6,6 @@
>
>  /dts-v1/;
>  #include "jh7100-common.dtsi"
> -#include <dt-bindings/gpio/gpio.h>
>
>  / {
>  	model = "StarFive VisionFive V1";
> @@ -18,3 +17,24 @@ gpio-restart {
>  		priority = <224>;
>  	};
>  };
> +
> +/*
> + * The board uses a Motorcomm YT8521 PHY supporting RGMII-ID, but requires
> + * manual adjustment of the RX internal delay to work properly.  The default
> + * RX delay provided by the driver (1.95ns) is too high, but applying a 50%
> + * reduction seems to mitigate the issue.
> + *
> + * It is worth noting the adjustment is not necessary on BeagleV Starlight SBC,
> + * which uses a Microchip PHY.  Hence, most likely the Motorcomm PHY is the one
> + * responsible for the misbehaviour, not the GMAC.
> + */
> +&mdio {
> +	phy: ethernet-phy@0 {
> +		reg = <0>;
> +		rx-internal-delay-ps = <900>;
> +	};
> +};
> +
> +&gmac {
> +	phy-handle = <&phy>;
> +};

Alphabetical ordering here, please.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
