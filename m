Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D5DC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 08:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RtCgWS9BvHuoKbOe2ylgQbe2ChHaYWIf/ZUwqAoWuaw=; b=4a5ZMjanfrY0pj
	b0BG7kRy6MAzazYstzcdIeIcoz9qsocDNB/muwq3NyHlLgL+GGc1d45KUxKTZ3DCSAJnPbZVQUpAO
	9u3nU728UbBvAzLty4xUD3rM+utMgjcju5vpCSVwj0Z0GkKl756LZVsVvfBzfJICQ7/Zy1czhZVoq
	DO/GAyWNYanWagQ5VYNnZZXzOJDpOwX5k8/QCODyxZkCQf8h1zJXEjcG0Yv+yi38W6XDheH6ZYyFX
	cqnRhfY9OPlhgb/nd9lzLdSm5Apc5xCp/O/NuNIa7EPIYoqZUEJG6Nf+vk4PM/9+itxFR1oy/u7Wc
	25l1565uu4FTqYrPtYog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okhrq-004NU0-Pq; Tue, 18 Oct 2022 08:22:30 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okhrn-004NTR-4e
	for linux-riscv@lists.infradead.org; Tue, 18 Oct 2022 08:22:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A201DB81D96;
	Tue, 18 Oct 2022 08:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCB95C433D6;
	Tue, 18 Oct 2022 08:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666081343;
	bh=rz7Gw5a3z7KjJRKfcO6V0p7vWLOfBAT0jPly/egslAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nV3WAVYWjG5A6CPs+Lln8E7ThPtoz2FnrJbpAr4tn4rOy+XI1OlXNOCEcYj8R7prZ
	 f7qLpq+L4eXNUrhMLdbMbEpM7t2CAQ7q9nhi7o9vQqEvC2E4snnOKwYbWMExfF1cAH
	 iEDXq+RmzFWiWQsoG3Ndm2PW/Af+NZAjSkHHnw46wi/te8avj7CsTMLolroPE07Jd2
	 Sfk9qn9hERDVXolS6hi5o4fNHIQS+z6PeKXlnp3hhGh5a9GARYYRBYf0fNSIw/5002
	 nL57eT4b4/bZTg1xtyLrVw2D528e9Esj+SJzoi8k2zXT1zKjR1MYwW/qJspWO82Xhd
	 WeOlFva1rQrJQ==
Date: Tue, 18 Oct 2022 10:22:17 +0200
From: Matthias Brugger <matthias.bgg@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v4 2/3] riscv: dts: starfive: Add common DT for JH7100
 based boards
Message-ID: <Y05iOWKMYn00lEhN@ziggy.stardust>
References: <20221017210542.979051-1-cristian.ciocaltea@collabora.com>
 <20221017210542.979051-3-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221017210542.979051-3-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_012227_486895_4A4874B4 
X-CRM114-Status: GOOD (  21.10  )
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

On Tue, Oct 18, 2022 at 12:05:41AM +0300, Cristian Ciocaltea wrote:
> In preparation for adding initial device tree support for the StarFive
> VisionFive board, which is similar with BeagleV Starlight, move most
> of the content from jh7100-beaglev-starlight.dts to a new file, to be
> shared between the two boards.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>  .../dts/starfive/jh7100-beaglev-starlight.dts | 153 +-----------------
>  ...aglev-starlight.dts => jh7100-common.dtsi} |   3 -
>  2 files changed, 1 insertion(+), 155 deletions(-)
>  copy arch/riscv/boot/dts/starfive/{jh7100-beaglev-starlight.dts => jh7100-common.dtsi} (96%)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> index f7a230110512..7cda3a89020a 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> @@ -5,160 +5,9 @@
>   */
>  
>  /dts-v1/;
> -#include "jh7100.dtsi"
> -#include <dt-bindings/gpio/gpio.h>
> -#include <dt-bindings/leds/common.h>
> -#include <dt-bindings/pinctrl/pinctrl-starfive-jh7100.h>
> +#include "jh7100-common.dtsi"
>  
>  / {
>  	model = "BeagleV Starlight Beta";
>  	compatible = "beagle,beaglev-starlight-jh7100-r0", "starfive,jh7100";
> -
> -	aliases {
> -		serial0 = &uart3;
> -	};
> -
> -	chosen {
> -		stdout-path = "serial0:115200n8";
> -	};
> -
> -	cpus {
> -		timebase-frequency = <6250000>;
> -	};
> -
> -	memory@80000000 {
> -		device_type = "memory";
> -		reg = <0x0 0x80000000 0x2 0x0>;
> -	};
> -
> -	leds {
> -		compatible = "gpio-leds";
> -
> -		led-ack {
> -			gpios = <&gpio 43 GPIO_ACTIVE_HIGH>;
> -			color = <LED_COLOR_ID_GREEN>;
> -			function = LED_FUNCTION_HEARTBEAT;
> -			linux,default-trigger = "heartbeat";
> -			label = "ack";
> -		};
> -	};
> -};
> -
> -&gpio {
> -	i2c0_pins: i2c0-0 {
> -		i2c-pins {
> -			pinmux = <GPIOMUX(62, GPO_LOW,
> -				  GPO_I2C0_PAD_SCK_OEN,
> -				  GPI_I2C0_PAD_SCK_IN)>,
> -				 <GPIOMUX(61, GPO_LOW,
> -				  GPO_I2C0_PAD_SDA_OEN,
> -				  GPI_I2C0_PAD_SDA_IN)>;
> -			bias-disable; /* external pull-up */
> -			input-enable;
> -			input-schmitt-enable;
> -		};
> -	};
> -
> -	i2c1_pins: i2c1-0 {
> -		i2c-pins {
> -			pinmux = <GPIOMUX(47, GPO_LOW,
> -				  GPO_I2C1_PAD_SCK_OEN,
> -				  GPI_I2C1_PAD_SCK_IN)>,
> -				 <GPIOMUX(48, GPO_LOW,
> -				  GPO_I2C1_PAD_SDA_OEN,
> -				  GPI_I2C1_PAD_SDA_IN)>;
> -			bias-pull-up;
> -			input-enable;
> -			input-schmitt-enable;
> -		};
> -	};
> -
> -	i2c2_pins: i2c2-0 {
> -		i2c-pins {
> -			pinmux = <GPIOMUX(60, GPO_LOW,
> -				  GPO_I2C2_PAD_SCK_OEN,
> -				  GPI_I2C2_PAD_SCK_IN)>,
> -				 <GPIOMUX(59, GPO_LOW,
> -				  GPO_I2C2_PAD_SDA_OEN,
> -				  GPI_I2C2_PAD_SDA_IN)>;
> -			bias-disable; /* external pull-up */
> -			input-enable;
> -			input-schmitt-enable;
> -		};
> -	};
> -
> -	uart3_pins: uart3-0 {
> -		rx-pins {
> -			pinmux = <GPIOMUX(13, GPO_LOW, GPO_DISABLE,
> -				  GPI_UART3_PAD_SIN)>;
> -			bias-pull-up;
> -			drive-strength = <14>;
> -			input-enable;
> -			input-schmitt-enable;
> -			slew-rate = <0>;
> -		};
> -		tx-pins {
> -			pinmux = <GPIOMUX(14, GPO_UART3_PAD_SOUT,
> -				  GPO_ENABLE, GPI_NONE)>;
> -			bias-disable;
> -			drive-strength = <35>;
> -			input-disable;
> -			input-schmitt-disable;
> -			slew-rate = <0>;
> -		};
> -	};
> -};
> -
> -&i2c0 {
> -	clock-frequency = <100000>;
> -	i2c-sda-hold-time-ns = <300>;
> -	i2c-sda-falling-time-ns = <500>;
> -	i2c-scl-falling-time-ns = <500>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&i2c0_pins>;
> -	status = "okay";
> -
> -	pmic@5e {
> -		compatible = "ti,tps65086";
> -		reg = <0x5e>;
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -
> -		regulators {
> -		};
> -	};
> -};
> -
> -&i2c1 {
> -	clock-frequency = <400000>;
> -	i2c-sda-hold-time-ns = <300>;
> -	i2c-sda-falling-time-ns = <100>;
> -	i2c-scl-falling-time-ns = <100>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&i2c1_pins>;
> -	status = "okay";
> -};
> -
> -&i2c2 {
> -	clock-frequency = <100000>;
> -	i2c-sda-hold-time-ns = <300>;
> -	i2c-sda-falling-time-ns = <500>;
> -	i2c-scl-falling-time-ns = <500>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&i2c2_pins>;
> -	status = "okay";
> -};
> -
> -&osc_sys {
> -	clock-frequency = <25000000>;
> -};
> -
> -&osc_aud {
> -	clock-frequency = <27000000>;
> -};
> -
> -&uart3 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&uart3_pins>;
> -	status = "okay";
>  };
> diff --git a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> similarity index 96%
> copy from arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> copy to arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> index f7a230110512..b93ce351a90f 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> @@ -11,9 +11,6 @@
>  #include <dt-bindings/pinctrl/pinctrl-starfive-jh7100.h>
>  
>  / {
> -	model = "BeagleV Starlight Beta";
> -	compatible = "beagle,beaglev-starlight-jh7100-r0", "starfive,jh7100";
> -
>  	aliases {
>  		serial0 = &uart3;
>  	};
> -- 
> 2.38.0
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
