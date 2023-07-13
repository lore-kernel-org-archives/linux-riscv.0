Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300A2C0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 13:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b31wRh1tHZz12j6bG+V6iZZKqzF+5WX22EOaeIFCvlA=; b=mvfhQgQTejddMk
	3ZgnoL9v+6r3jJJNx4KqNR/SIoWx07r2RN72bLoiQcMeadz0Gyd20ddpssSoTgRhiVydFKc+/BRXO
	PHUQ/A1DPfByau4w0TQzoWMSZQqlyLLK8WWG6zYpsGZuN76ZaB9RCbaa9YBTUaUGF6tAS4b2ZeC/k
	FRz9sYTAiP56pypB92xzku3TaoKtsave9PiWqH9bIh/sy/73w21OIyvmkALfYrwmP0zzAonHpIm5h
	cUyzGb/kiYuOJTgZC3oHqL3WOBEl9osGPhDGcGI5PV/KRYNuOVS8RJ9diA6YU5BVTR1uwoNOFDq5n
	vOcg/1KJem83opqw1Cww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJwJk-003PWm-2e;
	Thu, 13 Jul 2023 13:25:12 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJwJh-003PW1-07
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 13:25:10 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5A7063F722
	for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 13:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1689254705;
	bh=njPCzRp+gLgGXnuaFscEFk6TNloreb9Z1F7nmpn2GCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=jicX3NZEdw7emPlyq8fXfhaqu8m2eJOc+oJFloGHuyYSPyUYhlVHM7LbNUOLxz6+q
	 7e9P2HjQ1OLQKmgyRWWpSWIHbL2Ilt2pzfwCbPjlJ9iV5rKtTvH3Qg8LrYAwQrgCDS
	 UfMHh9GhvTvQnN45N++lgoGwjpifqagwvdB3mtXN3ZQcR+sb6qkAIxkFUb9+c96TEi
	 EWKXtv/SwsK7dcdx6RbPjaHy5AkP5jiw5A502TQkQdZXiJ/jLFKLlIUzFUrkFzlR8s
	 4ks0tSm9Yvl7/NBKwmXJO4xHWhsHCT81klB3cntyNaMWJ7JpYJmsN2ESEfBZ8a9JMT
	 diPMwqYHsbWEQ==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-40349e4eb27so6746681cf.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 06:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689254702; x=1691846702;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njPCzRp+gLgGXnuaFscEFk6TNloreb9Z1F7nmpn2GCo=;
        b=OAk9hXWE7M6v/hUUWxHa2IvLw5rBR+/yKQujBKLg64QWrd1pt5B0TX4K5BqJzuYDIF
         9uAvwnBabVnw5NMq7rgONrkyy8wkJTpGab5mkZRSttIO45iZk554DSVdsAU/zxpueeku
         UYIyrqtztGeudf0sEYUxAocik7b/rHp0cZQ4VUyoGY3gIJFs5h6V4/bNl2IU8Syqvv2M
         RBXEu0Ff4Rj4fi6NTvVbP7ovBlvHmyL5Jsnlh+TucJwH6PrRsUvK6FlOTPDMdizmWGkN
         9sB+AaRZ2MvqjlSEIZgxCyhqghJFV68UVeBUi7mE7/qLvdAjN8JttTnPk1AnYqEzEfpM
         kgqQ==
X-Gm-Message-State: ABy/qLaInW3U288fFwJlqnzfSX3wfrYls6by3YLNv46tJOPxLZYnyhdu
	bxYtx5DkuVdRVf4pqsE3sz6i7/fiP5jIECCc7ouRLWGwHlsnrpXZQHXNeVTtFgiH8hmDfLaE2xa
	Ld4Gz8tKqqEyrc9torUQc9KSaILZdZu6HsK8VxmfPWC7dfNH+1Ad+AZGbr5KPI1F4AgIsUg==
X-Received: by 2002:a05:622a:14d4:b0:3f6:aff0:6dec with SMTP id u20-20020a05622a14d400b003f6aff06decmr1750867qtx.32.1689254702766;
        Thu, 13 Jul 2023 06:25:02 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEWYwWyI37hBY/T3E7FV4GEsBkoCOExBvaA0XLzyYLy56YtYThzvj/ApC8dphahHLu8bbys9suJD14jU2FGI2M=
X-Received: by 2002:a05:622a:14d4:b0:3f6:aff0:6dec with SMTP id
 u20-20020a05622a14d400b003f6aff06decmr1750857qtx.32.1689254702551; Thu, 13
 Jul 2023 06:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com> <20230704064610.292603-8-xingyu.wu@starfivetech.com>
In-Reply-To: <20230704064610.292603-8-xingyu.wu@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Thu, 13 Jul 2023 15:24:46 +0200
Message-ID: <CAJM55Z989XRDuzff14pFa+AFnL6xBsswONFfdFxKbwGy55TwoA@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 7/7] riscv: dts: starfive: jh7110: Add PLL
 clocks source in SYSCRG node
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Hal Feng <hal.feng@starfivetech.com>, William Qiu <william.qiu@starfivetech.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_062509_772142_994EA65E 
X-CRM114-Status: GOOD (  14.02  )
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

On Tue, 4 Jul 2023 at 08:49, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>
> Add PLL clocks input from PLL clocks driver in SYSCRG node.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 11dd4c9d64b0..cdfd036a0e6c 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -452,12 +452,16 @@ syscrg: clock-controller@13020000 {
>                                  <&gmac1_rgmii_rxin>,
>                                  <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
>                                  <&i2srx_bclk_ext>, <&i2srx_lrck_ext>,
> -                                <&tdm_ext>, <&mclk_ext>;
> +                                <&tdm_ext>, <&mclk_ext>,
> +                                <&pllclk JH7110_CLK_PLL0_OUT>,
> +                                <&pllclk JH7110_CLK_PLL1_OUT>,
> +                                <&pllclk JH7110_CLK_PLL2_OUT>;

Once these are updated to <&pll ?> or <&pllclk JH7110_PLLCLK_PLL?_OUT>
if you still want to keep the defines:
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

>                         clock-names = "osc", "gmac1_rmii_refin",
>                                       "gmac1_rgmii_rxin",
>                                       "i2stx_bclk_ext", "i2stx_lrck_ext",
>                                       "i2srx_bclk_ext", "i2srx_lrck_ext",
> -                                     "tdm_ext", "mclk_ext";
> +                                     "tdm_ext", "mclk_ext",
> +                                     "pll0_out", "pll1_out", "pll2_out";
>                         #clock-cells = <1>;
>                         #reset-cells = <1>;
>                 };
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
