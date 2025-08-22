Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF62CA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 08:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L8dKlprQDPQVA9mepKnWpNvMBwBDmyt6Zxn6GyVXthU=; b=vmc9H/Np2U6p5T
	MwJMR0h1plR0N1UtMpdaMDr1DFfwTFusK5WRjz+M9jFIAS8lbO5I1zEQ+HxEWmsMWb+klgBvEa43n
	YwhXN0z3Qw7Q6Zd9Ya1U637jE0ZWf2QAzgF58/m4HfkKDVY+NGAv0VXlITLea8pgl1dxNz2Mt/WW3
	Ww/UM7JhnyiKkowODi+iDkasS0nl3pFuKQ5atkGN9SyqDZDRQTXhrYBGKJ6C+K9wHwajOc2jsfaYP
	9wM0MKyUQdvylNyZQnfQ1H42DSuvsbZDFLpKoUV05PInUev7DJrLO21x3y/Zt03xyWjw6tCBDq6YS
	97mvwcrf1bAYEzIaajTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjUg-00000004N3J-1e2o;
	Sat, 23 Aug 2025 08:20:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZN6-00000003W23-2lTm
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 21:32:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E99175C71AE;
	Fri, 22 Aug 2025 21:32:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE28C4CEF1;
	Fri, 22 Aug 2025 21:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755898347;
	bh=LeSrXwZaADMtK37404XLtISL1PIAJ7ce7zI3rX1/TPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lHol3RJ6EquQtHwVZq0nrk9+hlq6+jOft1pTk2RVAdHdRTwrOkIO+IUQrqf/pmJEg
	 1n6NQ/MtXiQokBc0Kjf24UdDebYVZLvqb9crhaX0mGRT2kUI3b1xzndF5+8WbuE14D
	 bSPzdOrt3VXitdVkEQuWJhmrRDZZ7v/lnmvHiCHwsl1mGYn+ErmXH4WpY8B9E/bUuC
	 bWKPe8NO+B9jAQ7VOYjJJuFmahxov/1InwJgVTFyS1SAcYejIbIuMZ18tAgFQ/6dL4
	 1voe4twkuiDZcxhQdjlAlD4f2b3Z0JlkDQsbgLRgVXIEd8Exzj4uFfPbTzoZXr6RGk
	 XcLRLj4oeM7bw==
Date: Fri, 22 Aug 2025 14:32:26 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: thead: th1520: add soft PWM fan for
 Lichee Pi 4A
Message-ID: <aKjh6hrhrRqUvnSd@x1>
References: <20250816093209.2600355-1-uwu@icenowy.me>
 <20250816093209.2600355-4-uwu@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250816093209.2600355-4-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_143228_738234_B4386C3D 
X-CRM114-Status: GOOD (  18.82  )
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

On Sat, Aug 16, 2025 at 05:32:09PM +0800, Icenowy Zheng wrote:
> Because of the SoM+Dock design of Lichee Pi 4A, heat dissipation does
> not work well; fortunately it comes with a fan port with PWM driving
> capability.
> 
> As the hardware PWM controller of Lichee Pi 4A isn't ready yet, drive it
> with pwm-gpio driver (software PWM) now.
> 
> A long PWM period is used, because not only software PWM is used, but
> also the fan port is a 2-pin one and fast PWM might confuse the BLDC
> driver on fans.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 53 +++++++++++++++++++
>  arch/riscv/boot/dts/thead/th1520.dtsi         |  2 +-
>  2 files changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> index 4020c727f09e8..f696db01353c5 100644
> --- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> @@ -4,6 +4,7 @@
>   */
>  
>  #include "th1520-lichee-module-4a.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
>  
>  / {
>  	model = "Sipeed Lichee Pi 4A";
> @@ -28,6 +29,58 @@ aliases {
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	gpio_pwm: gpio-pwm {
> +		#pwm-cells = <3>;
> +		compatible = "pwm-gpio";
> +		gpios = <&gpio3 3 GPIO_ACTIVE_HIGH>;
> +	};

I think the node name needs to be 'pwm' instead of 'gpio-pwm' as dtbs_check
warns that:

gpio-pwm: $nodename:0: 'gpio-pwm' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
from schema $id: http://devicetree.org/schemas/pwm/pwm-gpio.yaml#

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
