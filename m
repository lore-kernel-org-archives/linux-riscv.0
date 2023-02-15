Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D2AC636D4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 10:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8rAtpAROSeMIeUhi8B64Kk5GrIVLmHukYfJSvoxoVog=; b=OU6geEOxD10NFZ
	L8yYs28peyORe9/xbzeN/7amMSbZitIkWQX2ZRbYmYn+A0EzhHyswLpzzKSQdJacbxBzg/tY8/Ivd
	370kwEO4u6Y9N6jFXvILiHaNkmIx7WYuoGDb9iBtmHBNQQMuunUSxJONQji2wjzyhhZVS6rMr70j3
	9oKrXNeCtsAMQ2KzjyyAXaZJHdX0G5Zi+dTsn4CtdOmfR50a+KrlPWyZMcm2czG2sehq+rPa2cEwM
	3JDh2oZySyHQPutj4OD39r2AaFx23xLNAcOUp/5bzkRSN1dX8BSoLHXeP8rg369k69quriEsTg3C4
	JwEhYBpMeoDMQQWoBJgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSF4c-005SnI-5h; Wed, 15 Feb 2023 10:31:38 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSF4Y-005SmS-Jm
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 10:31:36 +0000
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2421A3F4B2
	for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 10:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1676457092;
	bh=J/qDZkmn3KorSy6ubx2WDUhB6Kbdc/XauTgIuTzEF0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=opnWgQXcBM8nmJoaHvCchIjyolFlrBkKPKoei6AzwdRKmU7KHSu26UqiSBULMd2du
	 usLH/OGtTXbuHHXkIJit4r8aj5QgHXKEao91zbWHP8NJQvsYF/IRJAN5RNJbO/O8Px
	 xpwt+puIAwHxggdmlo0GOs8pYUuXxqbfTn7yLytbk2nSgoDZVRDv9ZnYcua4DDdHEN
	 A3ARSDPSB3VTrWZFRle4EVUJRx2uiuZ1Mm0dlwx8qgppRlFWjwb6hm4L6IQtcIf2pS
	 8S4Y0MW+J0F9hnGtmXMk1gmDIMymZTj5zzQyRk3o6KQZJg3naMyMg3zzPJxPSIWS4b
	 t1KuS6awTIhhg==
Received: by mail-qv1-f69.google.com with SMTP id f1-20020ad442c1000000b0056c228fa15cso10241966qvr.4
        for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 02:31:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J/qDZkmn3KorSy6ubx2WDUhB6Kbdc/XauTgIuTzEF0w=;
        b=JqLkgwkAYx3wUXMJAYmyEhII5wF/HRb0hk/gFgsZRsSubNbCU55EMRuK5msK54PuIH
         hIhug6SqH7kUm5gqQ7V/SKYi/ezUXkCCi5GuOT8NfzYva4AKTn/klvy8mxXXvT0DxjFm
         TJDgmiOtBn9fc3t+H9aeIwhoYkMA/BqKSdK4eIOb8K9lFILir0mKISwl3GawcHSAsLau
         wYwo32hVgKqE3kcjaf1qUlwA3XSt57vLNMMHIecpAiKbJGrnQPadmzjFBkeharGXPNY/
         Un8QYKCLh/wECzTPUGfhbcFWKjnPK+XWNFjlDA/20pnbawzcLNFYOCT9X7f4FzBAqjuX
         a5Bg==
X-Gm-Message-State: AO0yUKWzGH5ZmRCUqAbrhbUDvlRVVWDaVkrEvaZ5EKM0z4sy6tKWb0XQ
	ZcT6CMo5qAQHoCwgxbrDvCvLH5NTt2oh8qyYxIGa/30YPgF0v+yU+essF1RKb6WA00JQhOAT8rn
	CbqQsUCyuJffl7D0+rki4vi3U+ykYONR5UTJGJ9GHgmCOUoQxx0T5w6elJScUQw==
X-Received: by 2002:a05:622a:164f:b0:3bc:e3a8:d1d6 with SMTP id y15-20020a05622a164f00b003bce3a8d1d6mr181347qtj.229.1676457091045;
        Wed, 15 Feb 2023 02:31:31 -0800 (PST)
X-Google-Smtp-Source: AK7set93hU2+oyuJ0C/LkbPAo2V6UGo4U5RSMbjNWw6Z8F8v4OAUsS6GhrWp/1jIOKMsaNCVvqP0POp7oTjMZpkPQ+g=
X-Received: by 2002:a05:622a:164f:b0:3bc:e3a8:d1d6 with SMTP id
 y15-20020a05622a164f00b003bce3a8d1d6mr181338qtj.229.1676457090719; Wed, 15
 Feb 2023 02:31:30 -0800 (PST)
MIME-Version: 1.0
References: <20230203081913.81968-1-william.qiu@starfivetech.com> <20230203081913.81968-4-william.qiu@starfivetech.com>
In-Reply-To: <20230203081913.81968-4-william.qiu@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 15 Feb 2023 11:31:14 +0100
Message-ID: <CAJM55Z8CRT_H-by=Nj0Nu1iWug1wdPMZceiE+RMJvE+q4RzQ7w@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] riscv: dts: starfive: Add mmc node
To: William Qiu <william.qiu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-mmc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_023135_077164_978BF12F 
X-CRM114-Status: GOOD (  20.05  )
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

On Fri, 3 Feb 2023 at 09:21, William Qiu <william.qiu@starfivetech.com> wrote:
>
> This adds the mmc node for the StarFive JH7110 SoC.
> Set mmco node to emmc and set mmc1 node to sd.
>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-2.dtsi         | 23 ++++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 37 +++++++++++++++++++
>  2 files changed, 60 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index c60280b89c73..e1a0248e907f 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -42,6 +42,29 @@ &rtc_osc {
>         clock-frequency = <32768>;
>  };
>
> +&mmc0 {
> +       max-frequency = <100000000>;
> +       bus-width = <8>;
> +       cap-mmc-highspeed;
> +       mmc-ddr-1_8v;
> +       mmc-hs200-1_8v;
> +       non-removable;
> +       cap-mmc-hw-reset;
> +       post-power-on-delay-ms = <200>;
> +       status = "okay";
> +};
> +
> +&mmc1 {
> +       max-frequency = <100000000>;
> +       bus-width = <4>;
> +       no-sdio;ru
> +       no-mmc;
> +       broken-cd;
> +       cap-sd-highspeed;
> +       post-power-on-delay-ms = <200>;
> +       status = "okay";
> +};

Please add these so they're sorted alphabetically (but keep the clocks
at the top), so there's at least some sort of system.

>  &gmac0_rmii_refin {
>         clock-frequency = <50000000>;
>  };
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 64d260ea1f29..ae1a664e7af5 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -370,6 +370,11 @@ syscrg: clock-controller@13020000 {
>                         #reset-cells = <1>;
>                 };
>
> +               sysreg: syscon@13030000 {
> +                       compatible = "starfive,sysreg", "syscon";
> +                       reg = <0x0 0x13030000 0x0 0x1000>;
> +               };
> +
>                 gpio: gpio@13040000 {
>                         compatible = "starfive,jh7110-sys-pinctrl";
>                         reg = <0x0 0x13040000 0x0 0x10000>;
> @@ -407,5 +412,37 @@ gpioa: gpio@17020000 {
>                         gpio-controller;
>                         #gpio-cells = <2>;
>                 };
> +
> +               mmc0: mmc@16010000 {
> +                       compatible = "starfive,jh7110-mmc";
> +                       reg = <0x0 0x16010000 0x0 0x10000>;
> +                       clocks = <&syscrg JH7110_SYSCLK_SDIO0_AHB>,
> +                                <&syscrg JH7110_SYSCLK_SDIO0_SDCARD>;
> +                       clock-names = "biu","ciu";
> +                       resets = <&syscrg JH7110_SYSRST_SDIO0_AHB>;
> +                       reset-names = "reset";
> +                       interrupts = <74>;
> +                       fifo-depth = <32>;
> +                       fifo-watermark-aligned;
> +                       data-addr = <0>;
> +                       starfive,sysreg = <&sysreg 0x14 0x1a 0x7c000000>;

This may need updating depending on whether you fix the driver or bindings.

> +                       status = "disabled";
> +               };
> +
> +               mmc1: mmc@16020000 {
> +                       compatible = "starfive,jh7110-mmc";
> +                       reg = <0x0 0x16020000 0x0 0x10000>;
> +                       clocks = <&syscrg JH7110_SYSCLK_SDIO1_AHB>,
> +                                <&syscrg JH7110_SYSCLK_SDIO1_SDCARD>;
> +                       clock-names = "biu","ciu";
> +                       resets = <&syscrg JH7110_SYSRST_SDIO1_AHB>;
> +                       reset-names = "reset";
> +                       interrupts = <75>;
> +                       fifo-depth = <32>;
> +                       fifo-watermark-aligned;
> +                       data-addr = <0>;
> +                       starfive,sysreg = <&sysreg 0x9c 0x1 0x3e>;
> +                       status = "disabled";
> +               };
>         };
>  };
> --
> 2.34.1
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
