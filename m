Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B3CC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 22:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TpK+2jpBOJaMOT1cja/70yZ7N4grBw8PoThk5Pc2OTo=; b=36noJIbUahPv+E
	/isbI/NgtdpysfO3ULqYHD0rn9UWh91eNPT0D2tVOC5PH5pFGnpw/CIS0vT8OZii4i9AqtduOZcA1
	OoyfQSOuK7ODzB1vXTxis6tu3BLmKMruXhrzb950y22n1PMrhW+1hXeuffpbwAJXO8d9IkF0ZMhD4
	vo1iCtXh1oYR2cN625ckKIHnz0TVoU7CQsgOYVfULcHfWF/VQ1AkIpHfxBIPatiQ1in8Wig3cSOso
	fRr+qFmm+iaYCob4i97orxOKAr4OeF71MSub1oqYFFJCTm6a9vsOHDUtHD3JCzssPqGFMN7KhiOdC
	zTInxX/uwI2Ik2QbbcSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK6ih-004pAd-Fp; Tue, 15 Feb 2022 22:54:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK6iV-004p7M-LB; Tue, 15 Feb 2022 22:54:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7F078613FB;
 Tue, 15 Feb 2022 22:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D452FC340FC;
 Tue, 15 Feb 2022 22:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644965676;
 bh=vp0AA5rWNWbwH+h7RrfOW+1FW77YNO31CyLQUGfkQek=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=K3AFijseqC8GbeefAxP32BuWuyj0dYJ4Ia8GwqQo5txlC7d37OSdcvqOOFYVv0m9d
 p9c7lXNewgA3CMClmpJMlhEs3ny9AIOz4VjKR9B/mdBdLVIM/oLm6kEPK6pgdzyDBL
 zM8oPb/ZUR89LdED7edEt+40xGFeFzBCdW/hXy5yGi8DaxCTd5Au6JmMSpXguLl4aO
 FyaLJyh1Fe3S1hAah9W6rQ/PH1UjVuDraKPwXavoOLlVmA3T6EKGdxWkIS/7xeMRdT
 ad0bYkM0C6ws46CuOa+fN0IXMoMux61pGYcI8tyf/ShRV6XYeySDAQP4tzm+UUo9lL
 +towKOuOi7cng==
Received: by mail-ed1-f43.google.com with SMTP id g7so781305edb.5;
 Tue, 15 Feb 2022 14:54:36 -0800 (PST)
X-Gm-Message-State: AOAM531j19Jb32D+bTahV8DvVAjLB639jUrfbbAO6ICwKtQY50DTSmUT
 N6VwuIVWkGgQpQ+gJ0WvA6aBcuuQcI9yalnCfQ==
X-Google-Smtp-Source: ABdhPJwIhjgFezkhGh/JThuKg8ThIEnytIpHYE2ZFs4zMkn1bSCelwpeUJLERmuj2x6h/ToJGmqArMx73XuAI+0Vol0=
X-Received: by 2002:a05:6402:5242:b0:40f:6a4f:ff33 with SMTP id
 t2-20020a056402524200b0040f6a4fff33mr126833edd.30.1644965675039; Tue, 15 Feb
 2022 14:54:35 -0800 (PST)
MIME-Version: 1.0
References: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 15 Feb 2022 16:54:23 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+bfr=csxzKN3T=tBY7bZ6Gny+sm5xtMP8nmyiD3joNFg@mail.gmail.com>
Message-ID: <CAL_Jsq+bfr=csxzKN3T=tBY7bZ6Gny+sm5xtMP8nmyiD3joNFg@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] pwm: dt-bindings: Include generic pwm schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Lee Jones <lee.jones@linaro.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, 
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Heiko Stuebner <heiko@sntech.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>,
 Rahul Tanwar <rtanwar@maxlinear.com>, 
 Jeff LaBundy <jeff@labundy.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Vignesh R <vigneshr@ti.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Linux PWM List <linux-pwm@vger.kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-sunxi@lists.linux.dev, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_145439_816782_B068C86C 
X-CRM114-Status: GOOD (  12.38  )
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

On Mon, Feb 14, 2022 at 3:22 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Hi,
>
> Changes since v1:
> 1. Add tags.
> 2. Adjust subject (Uwe).
>
> Best regards,
> Krzysztof
>
> Krzysztof Kozlowski (15):
>   dt-bindings: pwm: allwinner,sun4i-a10: Include generic pwm schema
>   dt-bindings: pwm: imx: Include generic pwm schema
>   dt-bindings: pwm: intel,lgm: Include generic pwm schema
>   dt-bindings: pwm: iqs620a: Include generic pwm schema
>   dt-bindings: pwm: mxs: Include generic pwm schema
>   dt-bindings: pwm: rockchip: Include generic pwm schema
>   dt-bindings: pwm: sifive: Include generic pwm schema
>   dt-bindings: pwm: renesas,pwm: Include generic pwm schema
>   dt-bindings: pwm: toshiba,visconti: Include generic pwm schema
>   dt-bindings: pwm: brcm,bcm7038: Do not require pwm-cells twice
>   dt-bindings: pwm: intel,keembay: Do not require pwm-cells twice
>   dt-bindings: pwm: samsung: Do not require pwm-cells twice
>   dt-bindings: pwm: tiecap: Do not require pwm-cells twice
>   dt-bindings: pwm: tiehrpwm: Do not require pwm-cells twice
>   dt-bindings: pwm: renesas,tpu: Do not require pwm-cells twice

For the series:

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
