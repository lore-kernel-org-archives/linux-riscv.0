Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4732BC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 21:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/bGsZj9dqtvKxVohAam8MbEXgOAdvnMqIapiY22iOsY=; b=vq1O+r9Iz2GW3S
	HX25CycjAh1tvjb1+va5LVwLgvDaDPCvoPzrWyfLkM4IW61OYUxcGE9mqouL3qmiXRw9Tk7DaxnUw
	UAYPCfh0+0BLjpeGOrOIY4DmP9qDkN9SEUFuk7MsoN/0g2hCuFoe0sP8RWctYjsmFTWtTfvJpJ2iP
	u8wCON7fgR+/cfjcSrG/gu6CPXTQk5atIr2lDJKvhxPi+q3TyVpi8PuM9B9xApLhJvtcHOQGNKPpH
	LcPsj6TVScvThabfQdTuu6et29C/FON6lej6DFXUZcf53meU0O3XjkfFC2VwNnRDT+Qz4B4RwxlhK
	IRSdIab7rqn9FPFYOSkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o724y-001hJS-Nv; Thu, 30 Jun 2022 21:52:04 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o724v-001hHa-BO
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 21:52:02 +0000
Received: by mail-lf1-x129.google.com with SMTP id a4so708020lfm.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jun 2022 14:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NrGas5lulMJdCQFvtdHCPkDfHPqr2UrmNuzK4irkMDQ=;
        b=qNhf+eF3ou+OVuBeZcYuSohm7adWxuKi6Yti0wH8bSh+rn6DndIf7DuGYB1f4KK8qt
         DQh7A3jNA52nPGbBERaiWj+hhdug4lHLUcYgbylBVnN1M1rmnL4bHVXl9so2OAk70Kol
         ppPogOM7Yfz5iZIO7ZCRIJrAxmaPYXsarHk0xmmqdn0cMqNbblQh3pyw2vY/FtMgJd5y
         hCQtcbwDeYyKxHz0lXeQPvCW4k5sS7l2OGN6ra/IfS/OBFcMG7EvKJhz4Qi0RLZVnkms
         eTpsxPnvbqwvQr/Y+dzniw6/aIav/3pP1gfyXYwGI+HaXsv6x2RppynNq4a0m+ieGc0n
         IN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NrGas5lulMJdCQFvtdHCPkDfHPqr2UrmNuzK4irkMDQ=;
        b=f/H4SoZ+XRhFQOIdZyf1mLm4dGxfb5FKn4kLwv73Ww7noe8xAEy2cHhYwUSO8y5B+I
         eQGXffCPfKoIIdsBS4iC5GIJTzsxx+E+kTC7LD7uV8N7sqmsBle7hbkfAWExRl62TCYa
         rjOtJOl/i3x+Ju4mDZ6GvF9Bxej2g8KWMO0tWy4jRBClIcu+kfIV4R3r6oGS83XHc5aP
         d7fusNPB9rhpB/7KVlrncINDHZ0bAF6qcJViEhreHX4un95ba5zdXuZY/uJwwe+VwZoj
         tWM1PKK4eu5dS/nzN+6B4SqIj7P582n7MUYrqxqYL9aEP9F82xrzsnMIPD7o5ptkKgFI
         8VfA==
X-Gm-Message-State: AJIora+iONN3D+ELUU+8DFZgav8iy5cy+9AbY5fmiCIXV4783GTm4MyQ
	KqDymtMKnzgW9jUq3jqXyUs=
X-Google-Smtp-Source: AGRyM1smx3NRBQNbNVKAperCZ6SfrYZXWBWZAqtLbA5mlnisA9vFR0m9cfl7wPwPzhY7YfaqPG1NNw==
X-Received: by 2002:a05:6512:2292:b0:47f:68b3:3c21 with SMTP id f18-20020a056512229200b0047f68b33c21mr7126215lfu.316.1656625918646;
        Thu, 30 Jun 2022 14:51:58 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
        by smtp.gmail.com with ESMTPSA id c16-20020a056512325000b0047f963bf815sm3293106lfr.93.2022.06.30.14.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 14:51:58 -0700 (PDT)
Date: Fri, 1 Jul 2022 00:51:55 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Conor Dooley <mail@conchuod.ie>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	Jose Abreu <joabreu@synopsys.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 08/15] riscv: dts: canaan: fix the k210's timer nodes
Message-ID: <20220630215155.xzhtfkolgy2iubqe@mobilestation>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <20220629184343.3438856-9-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220629184343.3438856-9-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_145201_448289_8C8F5A61 
X-CRM114-Status: GOOD (  21.21  )
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

On Wed, Jun 29, 2022 at 07:43:37PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The timers on the k210 have non standard interrupt configurations,
> which leads to dtbs_check warnings:
> 
> k210_generic.dtb: timer@502d0000: interrupts: [[14], [15]] is too long
> From schema: Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> 
> Split the timer nodes in two, so that the second timer in the IP block
> can actually be accessed & in the process solve the dtbs_check warning.

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

Just to note. IMO the DW APB Timer driver has been incorrectly
designed in the first place. The dts-node is supposed to describe the
whole IP-core timers set as the original Canaan k210 DT-file expected,
since there are common CSRs in the registers range, which currently
get to be unreachable. But since the DT-bindings has already been
defined that way in the framework of DW APB Timer driver alas there
is nothing we can do to fix it.

-Sergey

> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/canaan/k210.dtsi | 46 +++++++++++++++++++++++-----
>  1 file changed, 38 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
> index cd4eae82d8b2..72f70128d751 100644
> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
> @@ -319,28 +319,58 @@ fpioa: pinmux@502b0000 {
>  
>  			timer0: timer@502d0000 {
>  				compatible = "snps,dw-apb-timer";
> -				reg = <0x502D0000 0x100>;
> -				interrupts = <14>, <15>;
> +				reg = <0x502D0000 0x14>;
> +				interrupts = <14>;
>  				clocks = <&sysclk K210_CLK_TIMER0>,
>  					 <&sysclk K210_CLK_APB0>;
>  				clock-names = "timer", "pclk";
>  				resets = <&sysrst K210_RST_TIMER0>;
>  			};
>  
> -			timer1: timer@502e0000 {
> +			timer1: timer@502d0014 {
>  				compatible = "snps,dw-apb-timer";
> -				reg = <0x502E0000 0x100>;
> -				interrupts = <16>, <17>;
> +				reg = <0x502D0014 0x14>;
> +				interrupts = <15>;
> +				clocks = <&sysclk K210_CLK_TIMER0>,
> +					 <&sysclk K210_CLK_APB0>;
> +				clock-names = "timer", "pclk";
> +				resets = <&sysrst K210_RST_TIMER0>;
> +			};
> +
> +			timer2: timer@502e0000 {
> +				compatible = "snps,dw-apb-timer";
> +				reg = <0x502E0000 0x14>;
> +				interrupts = <16>;
>  				clocks = <&sysclk K210_CLK_TIMER1>,
>  					 <&sysclk K210_CLK_APB0>;
>  				clock-names = "timer", "pclk";
>  				resets = <&sysrst K210_RST_TIMER1>;
>  			};
>  
> -			timer2: timer@502f0000 {
> +			timer3: timer@502e0014 {
> +				compatible = "snps,dw-apb-timer";
> +				reg = <0x502E0014 0x114>;
> +				interrupts = <17>;
> +				clocks = <&sysclk K210_CLK_TIMER1>,
> +					 <&sysclk K210_CLK_APB0>;
> +				clock-names = "timer", "pclk";
> +				resets = <&sysrst K210_RST_TIMER1>;
> +			};
> +
> +			timer4: timer@502f0000 {
> +				compatible = "snps,dw-apb-timer";
> +				reg = <0x502F0000 0x14>;
> +				interrupts = <18>;
> +				clocks = <&sysclk K210_CLK_TIMER2>,
> +					 <&sysclk K210_CLK_APB0>;
> +				clock-names = "timer", "pclk";
> +				resets = <&sysrst K210_RST_TIMER2>;
> +			};
> +
> +			timer5: timer@502f0014 {
>  				compatible = "snps,dw-apb-timer";
> -				reg = <0x502F0000 0x100>;
> -				interrupts = <18>, <19>;
> +				reg = <0x502F0014 0x14>;
> +				interrupts = <19>;
>  				clocks = <&sysclk K210_CLK_TIMER2>,
>  					 <&sysclk K210_CLK_APB0>;
>  				clock-names = "timer", "pclk";
> -- 
> 2.36.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
