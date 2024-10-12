Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60125CF2566
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Oct 2024 13:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NIA5soBocoyzhiHB5zF2atMP2saukeZbX24DwzQtFys=; b=V5QcIo48CjYbUMeNBW0TsmBkWj
	OfW4blQMtVdrSQ2wxDwkBjjc4p9yS/G+dgXZT30fXWPNY1KuFANA0DD6wOftBwmlFEDJ5gKzjZdOK
	+41VDzs6GhheJzPjoSv28ICZerbp8xGAlTHO/egv7xzoKd06OyUzWQIEi6NEHKPWC4lZc/7c0zKMd
	+4k2NQj3XxEOJLwgGkH50wx5uTD+7QYC1/DnXUxkyhcMn11ZRJDOIO22g1/Y5iU85OdoG1W35J5e9
	LT6buk2Rz62iLcKgCmziqbmzSsNRnBMz9FH4gY9XcfqmSxgtmA9uJo72+JaT/S4kjEn37JnFeGfk1
	OQP4ZKRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szcU8-00000001I2K-2mZQ;
	Sat, 12 Oct 2024 13:48:44 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szcU5-00000001I1p-2zxn
	for linux-riscv@lists.infradead.org;
	Sat, 12 Oct 2024 13:48:43 +0000
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D78963F20D
	for <linux-riscv@lists.infradead.org>; Sat, 12 Oct 2024 13:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1728740918;
	bh=rt0UwgOB+qSrz8w0pdeUdXBOD7ZjXb/RHyISiF5KO80=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=rBtP5eHnTX/8JWxRB4Utr8XxGjy5/HUxZOFMVRzaN3HumCNAkoXe5CLtUoPubdG+P
	 +1guGhojVWQvapd1NKJZjypSdqgdnxg78fJcE4YnUoiF1zE1bMcSFZxHrV7s25nFj/
	 kjKgbfNCm6gFc5juqefYdyFXh5UkvHWyif98cC82VhV7g8AgASGWnar0fXqoUCtRYw
	 Lk0MiwYgW+m/CGdRuneO4N5dq62+9MHvYLRoBByc+I+o/1GTWiXbbE1ZHNMLZ9l/K5
	 G8OdPbNdcRCjrjLI1kLNG3JgwCHxs2JrLkgS7Skz5qEQJrYa/HsHpREhSM+yru5pRo
	 BffpCOVgr6NGA==
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-288996e6b66so201190fac.1
        for <linux-riscv@lists.infradead.org>; Sat, 12 Oct 2024 06:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728740918; x=1729345718;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rt0UwgOB+qSrz8w0pdeUdXBOD7ZjXb/RHyISiF5KO80=;
        b=M3AGU7R0SAWraxUbgTsaZ+P6NJw24U3Xv9+EprT6jZZQzQOStke/8pXgHzKcLyq2/w
         ebIqTfYCdp8D4iS9TqjIKaWmkMDClPrVMGM3BG7ZeKfaIHsv5g69h3qiQ1wutrF2adW9
         MezIlR4DBErNsCK2Bmu/b37NFiU8bQtR+xE9CQoiYezJFXHBJV9zYePqCYa8VvuCE8ak
         fFxmcOgjOfpLspl8RLwoM9/8ugsmxuUZffhz3DYe5w6GNx/+IygM2+ecTIMrZoIPcmff
         k10mqOocquObpGKh6jsC1ULXawn4noBDqNA+9EY0zff3CZ3HF+BvJpN2BqudcROJcMaA
         ljgg==
X-Gm-Message-State: AOJu0YzaZjuWUjLWH/2wZN2ZwJaVoQL8+bM6cUhzRQl7HFo6g+fcuC6C
	BoyLi/msXUtSKX6vAnb9d3WXeTExTsycQExT4Q2zfVjUnkKpBGWVKNowFK1tptqyN5TxAbEcyIO
	redIQ4TaHgODxjoZgjXu+33k6G0fphSFKvv+SQ7g1oGfTbTo3KTGMQpXZQTodOc5cPMOhU6mmLw
	EGOZhb3Avthq5FOrYJc8AQIJA2icCB45euQGRj+vWOWqciZzEz0wfv1LbY
X-Received: by 2002:a05:6871:722:b0:27b:686a:43b8 with SMTP id 586e51a60fabf-2886e0d763dmr3037267fac.47.1728740917773;
        Sat, 12 Oct 2024 06:48:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUhb7FBT2aOLXEM13xU9YHNmJCMnEhGGv19i7zdJ6DXtz+B4k+R23VQtqo3lAABpFX8Opm/NU5UsTKo8p8s3U=
X-Received: by 2002:a05:6871:722:b0:27b:686a:43b8 with SMTP id
 586e51a60fabf-2886e0d763dmr3037258fac.47.1728740917464; Sat, 12 Oct 2024
 06:48:37 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 12 Oct 2024 08:48:37 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240930-th1520-pinctrl-v3-7-32cea2bdbecb@tenstorrent.com>
References: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com> <20240930-th1520-pinctrl-v3-7-32cea2bdbecb@tenstorrent.com>
Mime-Version: 1.0
Date: Sat, 12 Oct 2024 08:48:37 -0500
Message-ID: <CAJM55Z_g63DMu+SAv2u1V86CYYOBUKwF_EZGbp9tb=zY777mVg@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] riscv: dts: thead: Add TH1520 pinctrl settings for UART0
To: Drew Fustini <dfustini@tenstorrent.com>, Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241012_064841_954888_45DF0B72 
X-CRM114-Status: GOOD (  10.92  )
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

Drew Fustini wrote:
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>
> Add pinctrl settings for UART0 used as the default debug console on
> both the Lichee Pi 4A and BeagleV Ahead boards.
>
> Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>  arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 26 ++++++++++++++++++++++
>  arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  | 26 ++++++++++++++++++++++
>  2 files changed, 52 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> index 69f82e7afd0b..6c0b768e8d17 100644
> --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> @@ -71,7 +71,33 @@ &sdio0 {
>  	status = "okay";
>  };
>
> +&padctrl0_apsys {
> +	uart0_pins: uart0-0 {
> +		tx-pins {
> +			pins = "UART0_TXD";
> +			function = "uart";
> +			bias-disable;
> +			drive-strength = <3>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +
> +		rx-pins {
> +			pins = "UART0_RXD";
> +			function = "uart";
> +			bias-disable;
> +			drive-strength = <1>;
> +			input-enable;
> +			input-schmitt-enable;
> +			slew-rate = <0>;
> +		};
> +	};
> +};
> +
>  &uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_pins>;
>  	status = "okay";
>  };
>
> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> index 58ad381fc1c3..f60b1879192d 100644
> --- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> @@ -30,7 +30,33 @@ chosen {
>  	};
>  };
>
> +&padctrl0_apsys {
> +	uart0_pins: uart0-0 {
> +		tx-pins {
> +			pins = "UART0_TXD";
> +			function = "uart";
> +			bias-disable;
> +			drive-strength = <3>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +
> +		rx-pins {
> +			pins = "UART0_RXD";
> +			function = "uart";
> +			bias-disable;
> +			drive-strength = <1>;
> +			input-enable;
> +			input-schmitt-enable;
> +			slew-rate = <0>;
> +		};
> +	};
> +};
> +
>  &uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_pins>;
>  	status = "okay";
>  };

For these two files you also broke the ordering.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
