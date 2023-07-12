Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882DFEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 18:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vVkcAl0Wa+iM63qUwUSBNedITbsiTew+AEDz/DsDwmI=; b=OpQnJmI+S6+Hvm
	kwRVMm8y5G2JtsFBYIBgu1vFJjHBRn9EmHnAt+ryks7oUDodRmPqZmZdTooUSQOTs9ZCZiju5JRE1
	6MbNYYV9z5vYu5e903f8N5QJSyZqlw1gOwYQlf8AOr0OTpbHzz0rkkFkGqjUyta8z3EtfKSU8ly3w
	M/68gmUoxnM155KrsbXniLbTTdX/s5GRbfkIgTwkCbQSnFR0fSwR5gB1n7z/ZaeJNJtlx68r8lYfF
	Nv0HifXc6CXPJPH607e2d6XLyp9CdiOYeJZ9V+6DS+YOrTcVKqF3wwE79FAotxKUi0YKqk3Qf0sqO
	q+1IhuIFld5KeUNkRCZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJeIt-000rRQ-1K;
	Wed, 12 Jul 2023 18:11:07 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJeIq-000rQP-0p
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 18:11:06 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B8E763F120
	for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 18:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1689185462;
	bh=jZV4lxXU1ZB6Js3u/270T4FZAtmvDEeFk82+tjv5Ytg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=k+dhtSXXEJf3TwV8UMej0Qy7H1jmmXmM2SgJiEaEx2ygj/Zv16HoFWaMDpSaK9nyy
	 /+u3uJ/y/yT63x+/16hxibe3kYD5hTcZL0+MrqmzZcc1+0xDrX6qeHuI4xQSmRt2bK
	 3iXWre/neluC+inZuf8TVDBM2QoyHnD9MWt5nYEGPCh4CYxJUCRzD9n+IM13SznXp+
	 EmG4njcrJgVKP9gMkLvIpBpLCMuvhSBgXym9CCDZ2Dv3cRKPpW2AAwveLdfTSriNOx
	 5lBIlVUX8Q3RldOV3R8zBIvAigUHj35tnBj0ijl55iFkK0a3W3KLQlWUtFEm6Gtvga
	 6MuVRBAmlKUSw==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-40252a2fd0dso82525691cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 11:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689185461; x=1691777461;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZV4lxXU1ZB6Js3u/270T4FZAtmvDEeFk82+tjv5Ytg=;
        b=ijTPnxKigPk39MR2HIRuOipQeNlbk7owpaskkeyKCGcvy+I4eOKR8+2Ons4HYrdUJK
         9vnb5T6v8i09aK1Uu7ixQAmWZcS0jCa/HAQGP0teWzU4HTGrv2ghknm+O4uEWY3QFx4w
         GhPnzd10npQ7dcIt6CfCK/x3Ew68uSxQMcG4uH0JPpLuzqiXxIi/QDL0DBm65l7TtxTo
         zsZLn5RSiEA3ekMmPk4BfH50l0EJTmjXkqmVPlNxxOMrrpb/QykETBPXISkq8qMw9FJG
         w1yN1qW6idDtQqE+iNGIlRJ291SLz+OY9zBxjSuAP2AY+R5wkrp5mjESIKR7Euyitg2R
         kpqQ==
X-Gm-Message-State: ABy/qLb5snxXprKrwJkplNto8bzuXocWUzaEU8M1HDG0WN898tHFOgAC
	DRftJ8b15TgGMwEyqB81xgELQWNH8L0T9LqL5zMEZMpUMMlXyzTATIgKbb5pDp7NjLxIdcLUunb
	E25k6G/rmy58I+liOoeyyri3lKZKBy7EkhE6xojaXAxG9Ocy96vWkEyAoVDRoWw==
X-Received: by 2002:a05:622a:144d:b0:403:b395:b3c0 with SMTP id v13-20020a05622a144d00b00403b395b3c0mr9913199qtx.3.1689185461757;
        Wed, 12 Jul 2023 11:11:01 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHEi6ZnXrU4jchYntQmVhlI+BbvJ58VQ34IJb9Ptwwjd3rb28kvuNYpTLkLgpIcX7In9qBHKfW1YR3dXyt8LFc=
X-Received: by 2002:a05:622a:144d:b0:403:b395:b3c0 with SMTP id
 v13-20020a05622a144d00b00403b395b3c0mr9913166qtx.3.1689185461476; Wed, 12 Jul
 2023 11:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230712092007.31013-1-xingyu.wu@starfivetech.com> <20230712092007.31013-9-xingyu.wu@starfivetech.com>
In-Reply-To: <20230712092007.31013-9-xingyu.wu@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 12 Jul 2023 20:10:45 +0200
Message-ID: <CAJM55Z_DVgYuLBXMb=_V5nmYDCGnzty2TCJ5FLwNXHFRdaVi4Q@mail.gmail.com>
Subject: Re: [PATCH v7 8/9] riscv: dts: starfive: jh7110: Add DVP and HDMI TX
 pixel external clocks
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_111104_631656_526B62CC 
X-CRM114-Status: GOOD (  16.57  )
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

On Wed, 12 Jul 2023 at 11:22, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>
> Add DVP and HDMI TX pixel external fixed clocks and the rates are
> 74.25MHz and 297MHz.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../dts/starfive/jh7110-starfive-visionfive-2.dtsi   |  8 ++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi             | 12 ++++++++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index fa0061eb33a7..de0f40a8be93 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -38,6 +38,10 @@ gpio-restart {
>         };
>  };
>
> +&dvp_clk {
> +       clock-frequency = <74250000>;
> +};
> +
>  &gmac0_rgmii_rxin {
>         clock-frequency = <125000000>;
>  };
> @@ -54,6 +58,10 @@ &gmac1_rmii_refin {
>         clock-frequency = <50000000>;
>  };
>
> +&hdmitx0_pixelclk {
> +       clock-frequency = <297000000>;
> +};
> +
>  &i2srx_bclk_ext {
>         clock-frequency = <12288000>;
>  };
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index ec2e70011a73..e9c1e4ad71a2 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -197,6 +197,12 @@ opp-1500000000 {
>                         };
>         };
>
> +       dvp_clk: dvp-clock {
> +               compatible = "fixed-clock";
> +               clock-output-names = "dvp_clk";
> +               #clock-cells = <0>;
> +       };
> +
>         gmac0_rgmii_rxin: gmac0-rgmii-rxin-clock {
>                 compatible = "fixed-clock";
>                 clock-output-names = "gmac0_rgmii_rxin";
> @@ -221,6 +227,12 @@ gmac1_rmii_refin: gmac1-rmii-refin-clock {
>                 #clock-cells = <0>;
>         };
>
> +       hdmitx0_pixelclk: hdmitx0-pixel-clock {
> +               compatible = "fixed-clock";
> +               clock-output-names = "hdmitx0_pixelclk";
> +               #clock-cells = <0>;
> +       };
> +
>         i2srx_bclk_ext: i2srx-bclk-ext-clock {
>                 compatible = "fixed-clock";
>                 clock-output-names = "i2srx_bclk_ext";
> --
> 2.25.1
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
