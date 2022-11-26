Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E276C43217
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Nov 2022 00:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g+BndR6Ap3LXbuiInsQhQK3tgVadW0r7MLUzlQXH1c8=; b=vzpPmr8sW8enKl
	ZkLjOBRmUnuDhxwuUvcLZCw0CHzqrNm7pt3fV6MU/6rXbVLL+YguK7TZXCmhYZ19IX/61f6/kxcC1
	49vYec3CbkGv1sejYSOM9LqVcztcA4hjUyX2Nw5rtNW9aDUsyCv0IF6VxXHkCNE6PrwePpwBUnNTH
	2KYUf2tOn4MRGmB9HlOBtVVLimUqXkZNTUBx9AQkmmn7+KDWEqSUBKazw4NhBhlAkCBSgBSOJEggD
	SOA5yeUPTx1ez/s4WfYRux5iCix8eI9QoKLR0FuFCmqzT3G8op8J99zsgEdP1g2iE9r1qG0agWyZG
	EJpug657/MR6FGn8VsDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyioe-0034tC-Qp; Sat, 26 Nov 2022 00:13:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyioT-0034qr-JE; Sat, 26 Nov 2022 00:12:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3B53661151;
	Sat, 26 Nov 2022 00:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22E8C4314B;
	Sat, 26 Nov 2022 00:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669421572;
	bh=NX59x0btHEExShFPzdq1i8eWPgH9Un3tDf6A+TNeddY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JdJ4JFwtw18V1l3Vb4h9RfzMQJEXRUkuMjq9uHDYAnD8AnAi8eWQYW9XahnrTyzLr
	 toCX4Y+LryDqiPKxdHKbRay1eg4SNVfy3pZClV/PpTjckkPgZl27M1XHeNjaFphgYn
	 V9V532LftfgaAZio/SL4RGMPVt1MI602g7yV/jbIB3KUSCn/aWxkUtZrzFAE5tZ7Hq
	 10g3w1lDa8CiorrStWSip/P4mPhAQ39BQ1zaqMx5ktYKDE/yxEzQv92T/qjzMyUGrU
	 00bdWfOkajK8RMj2xvIsXfYszZQ+xFTvBCYBBI2T+xaC4RYxjPw2eO8UTb0CIP5ZQW
	 oY/0PRYPwN3Xg==
Received: by mail-ej1-f48.google.com with SMTP id cw8so3280888ejb.10;
        Fri, 25 Nov 2022 16:12:52 -0800 (PST)
X-Gm-Message-State: ANoB5pm5eIiNCNJHB6Yd0MJnuWWqy2emwL4Z1ty6BuW1e+ZXHFy6+tBZ
	+OPzgC9IjbfX7FMHDAKWtxNoHWN5TUNBpSHukj4=
X-Google-Smtp-Source: AA0mqf6y+AsjP1DN+grrm7BVX4iyUMma6U7nH1KxSUQlTyP3Wy9fs9Wn9OeTwkAUAjFcpm5B6srXAl5cvlbkFB7x8hM=
X-Received: by 2002:a17:906:4e8c:b0:7ba:9c18:1204 with SMTP id
 v12-20020a1709064e8c00b007ba9c181204mr11627014eju.262.1669421570883; Fri, 25
 Nov 2022 16:12:50 -0800 (PST)
MIME-Version: 1.0
References: <20221125234656.47306-1-samuel@sholland.org> <20221125234656.47306-2-samuel@sholland.org>
In-Reply-To: <20221125234656.47306-2-samuel@sholland.org>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 26 Nov 2022 08:12:39 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQp54e9toE6aU3zNzmXf2gZwhcx+1A_HLR2ZSKDhnGO9w@mail.gmail.com>
Message-ID: <CAJF2gTQp54e9toE6aU3zNzmXf2gZwhcx+1A_HLR2ZSKDhnGO9w@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] MAINTAINERS: Match the sun20i family of
 Allwinner SoCs
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andre Przywara <andre.przywara@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Christian Hewitt <christianshewitt@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Stanislav Jakubek <stano.jakubek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_161257_707466_A24E0AB9 
X-CRM114-Status: GOOD (  16.99  )
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

On Sat, Nov 26, 2022 at 7:47 AM Samuel Holland <samuel@sholland.org> wrote:
>
> Allwinner sunxi SoCs with a RISC-V CPU use the sun20i designator. Match
> that pattern in addition to the designators for 32 and 64-bit ARM SoCs.
Reviewed-by: Guo Ren <guoren@kernel.org>

>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>
> (no changes since v1)
>
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cd2cbb940f11..6a79f736fe35 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1828,7 +1828,7 @@ F:        drivers/pinctrl/sunxi/
>  F:     drivers/soc/sunxi/
>  N:     allwinner
>  N:     sun[x456789]i
> -N:     sun50i
> +N:     sun[25]0i
>
>  ARM/Amlogic Meson SoC CLOCK FRAMEWORK
>  M:     Neil Armstrong <neil.armstrong@linaro.org>
> --
> 2.37.4
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
