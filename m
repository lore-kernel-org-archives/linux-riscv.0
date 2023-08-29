Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90203C83F16
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 09:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RhaDvD/9FCs4PsLkoCN3F2jrotvIyxCBWSfKqNB4tUw=; b=CIBmbXYh5J9sWn
	Od+K5elF/tjpZSA1poEKaTEpaqzVmJNZiljmYjp39JxzR6OCV1IeSZc9tKTDgNQq7lJKHQUASRdLs
	tRFCLzw0JLa32ffO+5MeL12JzsnLC1JD5VpepJzXuxEu/PQ7bUx3Ika6sVTLpCdjwpSAeKode8zri
	GvgVYu3eqAjj1MBoTRxvTCGOAk7Bo/G8UT4Kvlrp22Ni/c4L2Gp3yHdiCBbRu2D9YQJMjdiHzierF
	U0ADQeyu1ZtDzaXtlAO9B4M/ZTMh69IedQAIBAMSOLWUFajqLxMa+VwS+g/7YaudRojkHbiWrYPNC
	QakeShimITI4ye8ucqKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qavBn-00BA5D-0X;
	Tue, 29 Aug 2023 09:39:11 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qavBk-00BA4V-1W
	for linux-riscv@lists.infradead.org;
	Tue, 29 Aug 2023 09:39:10 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 170D43F659
	for <linux-riscv@lists.infradead.org>; Tue, 29 Aug 2023 09:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1693301944;
	bh=gTippXVpSNNz9qzwb3ZwRyGCLyetmmexG2eFM+R4Cws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=SF7/n0sxplvyQpmrXTUei+QllTXsQE9PGCuShKz0OGYR5i45MYKcPIx2SlPB6lpIa
	 o+hbytNmaMxi82jv9PgjwwztH5NjUkvhgZihg38E1koCdCiMgKOdZj40y1xjVrXUe8
	 Xd8fFfWSZdFNnJmcXcLv4iMnFdTRpulQ+vA1CLR8lRZLlNPWhioKbV10IRARVt1uQC
	 OO2VFrfv1G44kDk1eP37NsaZmgxEFkO+tciAY+3k2aWa3QkHkTsYDnhPN98yXbmTe0
	 5e6EJpEa6PpgOv6+Z4TrLctMwg2po501KOn8jPn5MtQ9jWBge8ysG8ZZs5aefsx42/
	 N6+3y5Qhq8FJA==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-410f0988ea6so47406201cf.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Aug 2023 02:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693301943; x=1693906743;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gTippXVpSNNz9qzwb3ZwRyGCLyetmmexG2eFM+R4Cws=;
        b=WXnJ67DXerGSV/t4B3mfq+lo35j5JEnxXzHkbyRfyHnRjzzgNk+Qhpv+NcuZrFfaNQ
         pMZr23GnocuyPgxT5QyWnu+UeFc/MU4z5uwNcVCNRC06DjxGZT4V56PkXRK5s800Rt9e
         5MRiWNLyLO/coSbrHGuCRSSIxnACMoRbq7spEdaMzeMw+f6BHvUlDN8uUfjx9rzMWyMY
         t02iUZDq52YqT3lI7USrcZIrY3dafnAe7wQeuFzYcwLTIatnjBR6+l8tQcQnvTAy2x0d
         nSWNkaOK85KnNqS/9wVXkS3CY9ncan4z2H7oHX3FdlmEKsu+jmMYKXNgvl+XHoadbB8v
         edpQ==
X-Gm-Message-State: AOJu0YyudQEbaxTa7h4pwZpkduTZO7v89N5UDD9ndY1j/DCbm631EMVT
	0IIc1t+q774uOiX0/VOumtZDRJzdsU7z8Lnl8sJE2RmaYxIM6zwi4d+NCvOrO3uCyj++jo9IPH6
	wx0UVM4LsCbJrlmj2VCPL34DME+bjKtbCqelVJDTzX2WA4rYydf4E1Xz1DzM7eQ==
X-Received: by 2002:a05:622a:143:b0:412:2f80:abe4 with SMTP id v3-20020a05622a014300b004122f80abe4mr4205705qtw.46.1693301943118;
        Tue, 29 Aug 2023 02:39:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLWz7iEHHsdF1zihnHlrPh2AIw2E72KlWSpDq4tWYiTK1S3tWsZy7Ux1KU97H/VDehpWQvp6k93Yxn7RuCS70=
X-Received: by 2002:a05:622a:143:b0:412:2f80:abe4 with SMTP id
 v3-20020a05622a014300b004122f80abe4mr4205688qtw.46.1693301942895; Tue, 29 Aug
 2023 02:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230825081328.204442-1-william.qiu@starfivetech.com> <20230825081328.204442-5-william.qiu@starfivetech.com>
In-Reply-To: <20230825081328.204442-5-william.qiu@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Tue, 29 Aug 2023 11:38:47 +0200
Message-ID: <CAJM55Z-Ab1DAQyQC9TRFFBidus6wCRns9RQjx-iyYyNK1e-e6A@mail.gmail.com>
Subject: Re: [RFC v4 4/4] riscv: dts: starfive: jh7100: Add PWM node and pins configuration
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thierry Reding <thierry.reding@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_023908_836944_36C639E8 
X-CRM114-Status: GOOD (  16.29  )
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

On Fri, 25 Aug 2023 at 10:16, William Qiu <william.qiu@starfivetech.com> wrote:
> Add StarFive JH7100 PWM controller node and add PWM pins configuration
> on VisionFive 2 board.

Hi William,

This is the VisionFive V1 board right?

/Emil

> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../boot/dts/starfive/jh7100-common.dtsi      | 24 +++++++++++++++++++
>  arch/riscv/boot/dts/starfive/jh7100.dtsi      |  9 +++++++
>  2 files changed, 33 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> index b93ce351a90f..746867b882b0 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> @@ -84,6 +84,24 @@ GPO_I2C2_PAD_SDA_OEN,
>                 };
>         };
>
> +       pwm_pins: pwm-0 {
> +               pwm-pins {
> +                       pinmux = <GPIOMUX(7,
> +                                 GPO_PWM_PAD_OUT_BIT0,
> +                                 GPO_PWM_PAD_OE_N_BIT0,
> +                                 GPI_NONE)>,
> +                                <GPIOMUX(5,
> +                                 GPO_PWM_PAD_OUT_BIT1,
> +                                 GPO_PWM_PAD_OE_N_BIT1,
> +                                 GPI_NONE)>;
> +                       bias-disable;
> +                       drive-strength = <35>;
> +                       input-disable;
> +                       input-schmitt-disable;
> +                       slew-rate = <0>;
> +               };
> +       };
> +
>         uart3_pins: uart3-0 {
>                 rx-pins {
>                         pinmux = <GPIOMUX(13, GPO_LOW, GPO_DISABLE,
> @@ -154,6 +172,12 @@ &osc_aud {
>         clock-frequency = <27000000>;
>  };
>
> +&ptc {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pwm_pins>;
> +       status = "okay";
> +};
> +
>  &uart3 {
>         pinctrl-names = "default";
>         pinctrl-0 = <&uart3_pins>;
> diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> index 4218621ea3b9..7f5bb19e636e 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> @@ -248,5 +248,14 @@ watchdog@12480000 {
>                         resets = <&rstgen JH7100_RSTN_WDTIMER_APB>,
>                                  <&rstgen JH7100_RSTN_WDT>;
>                 };
> +
> +               ptc: pwm@12490000 {
> +                       compatible = "starfive,jh7100-pwm";
> +                       reg = <0x0 0x12490000 0x0 0x10000>;
> +                       clocks = <&clkgen JH7100_CLK_PWM_APB>;
> +                       resets = <&rstgen JH7100_RSTN_PWM_APB>;
> +                       #pwm-cells = <3>;
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
