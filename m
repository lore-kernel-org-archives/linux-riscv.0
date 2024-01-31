Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A14C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 14:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6aSOss3HrEKf6O0wEa2TD/jhghIInuIC53TT+JXo4QM=; b=yVPVt+6zDCgT2g
	Ahh/ZpiJFSbNnIJj6cRqcjLUW4+3egH0Cq8he3lK8QIUlJR4e59h9YPAmBcEvNRvfKqcJy5ARdRtW
	tB1jrHUlVAP2Dh9zWrSvNR54f84cjyptoNdwIjG653gG21XyWjXE2LrVEJTFs1RG7d0IcsNzVhePB
	80cms5tidV4um/veF2Cvf477MbdL9YBd93VQ5O72qEUDrBJc6Cgo856EfibILtsaTbVZxRNY+uX3Q
	1I0k8XOU7hKrRB+GPg8NugW4IkbZE8PXNMiOC9iq7jeuQ2rDSTKXDArM5pgGfUnkvkpKflT+ka0Ai
	Z8FlA9TAdIVw3NRPGiNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVBvJ-000000040Ui-22bx;
	Wed, 31 Jan 2024 14:50:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVBvF-000000040Qw-3U0L;
	Wed, 31 Jan 2024 14:50:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D28ADA7;
	Wed, 31 Jan 2024 06:51:22 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14BD43F762;
	Wed, 31 Jan 2024 06:50:35 -0800 (PST)
Date: Wed, 31 Jan 2024 14:50:33 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Aleksandr Shubin <privatesub2@gmail.com>
Subject: Re: [PATCH v8 3/3] riscv: dts: allwinner: d1: Add pwm node
Message-ID: <20240131145033.0b05f4c6@donnerap.manchester.arm.com>
In-Reply-To: <20240131125920.2879433-4-privatesub2@gmail.com>
References: <20240131125920.2879433-1-privatesub2@gmail.com>
	<20240131125920.2879433-4-privatesub2@gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_065042_000281_A3223044 
X-CRM114-Status: GOOD (  15.50  )
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
Cc: devicetree@vger.kernel.org, John Watts <contact@jookia.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>, linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, linux-arm-kernel@lists.infradead.org, Cheo Fusi <fusibrandon13@gmail.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 31 Jan 2024 15:59:16 +0300
Aleksandr Shubin <privatesub2@gmail.com> wrote:

Hi,

> D1 and T113s contain a pwm controller with 8 channels.
> This controller is supported by the sun20i-pwm driver.
> 
> Add a device tree node for it.
> 
> Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>

Compared against the manual:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> index 5a9d7f5a75b4..435a1e66aa6a 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -145,6 +145,18 @@ uart3_pb_pins: uart3-pb-pins {
>  			};
>  		};
>  
> +		pwm: pwm@2000c00 {
> +			compatible = "allwinner,sun20i-d1-pwm";
> +			reg = <0x02000c00 0x400>;
> +			clocks = <&ccu CLK_BUS_PWM>,
> +				 <&dcxo>,
> +				 <&ccu CLK_APB0>;
> +			clock-names = "bus", "hosc", "apb0";
> +			resets = <&ccu RST_BUS_PWM>;
> +			status = "disabled";
> +			#pwm-cells = <0x3>;
> +		};
> +
>  		ccu: clock-controller@2001000 {
>  			compatible = "allwinner,sun20i-d1-ccu";
>  			reg = <0x2001000 0x1000>;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
