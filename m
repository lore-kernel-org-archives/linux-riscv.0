Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3953CD484E
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 05:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJfYsejiyJLyc2a0tbm4/jUSD82juQq/DxnoKpt2zJc=; b=aScUiYlEDpt8Mt
	N3SWNpqc0CAHaB3xpsH94Ll+RERjfGFNPkjPQLCz6Ge/ows9VIr7pJGPWVHidrmySsaLGFxlVOtT/
	/f8j4PUHXOiiPDxf0czZWl2/JgjKA+VMLKqMpn6vjJ6u/GPVH8ucKfCsOnsfB8XzzOSdIKuynqrJT
	3t7kEaoORaoJBy8bKDBYNntz5S6tQLwO9qIK2hEE/GyiS/Xw4al2Qs1DlJKvXkpfaUzBIeEjymiQN
	89DAzwv7x1+WWvKsoRTySnR4jgTzgdfTH8Kq4tzSHpUMbjkB8BTZQDk/5PF3oXrDSvc0PdW/ehm/0
	TRovPMI8rTL2Pjz3V0jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfuW-0000000FgbE-24aL;
	Tue, 12 May 2026 05:44:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfuU-0000000Fgb4-3rTj
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 05:44:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0681F60055;
	Tue, 12 May 2026 05:44:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE32C2BCB0;
	Tue, 12 May 2026 05:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778564641;
	bh=8knoL5yl+L/C1sO73WYMrEIqVvOTPdr2v82r8D/MlYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UAsFfDP93SdyCex0eOLxjTPzb+hB66LGW0zPAflAuQTW6kShm78EL/2RCIIES6gvT
	 mrRnNz6EJ1cg2tvH9CMEzndU0Eu9gmPMHy9il0MIE2Hc7iQ3oG6DWta371i2NGLyGB
	 6oR6EF0SI1JvI3AnOGDadLeVLhYdXBNMU3eGdt5jPKzbjMMDPpzp9loRwfOj9PT1YG
	 ATcTOWbf8HkUfej7yOecqVv6jkgi3vtK5tA9S24Dyf/AzOkOAaC5XhoWYbNQrFvoBN
	 CidtdC2+K2AOyUQ6ZFLyIFsny+FFOc+HpKTzlMoNiVQ0jnwkOrBAxMOcsLMJ7SwDOv
	 DoWzjh7BrnQEg==
Date: Tue, 12 May 2026 05:43:58 +0000
From: Yixun Lan <dlan@kernel.org>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: Re: [PATCH v9 7/8] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
Message-ID: <20260512054358-GKE3624147@kernel.org>
References: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
 <20260511-orangepi-sd-card-uhs-v9-7-ae48c0b2b2cf@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260511-orangepi-sd-card-uhs-v9-7-ae48c0b2b2cf@gmail.com>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.dev>, linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, linux-riscv@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>, Margherita Milani <margherita.milani@amarulasolutions.com>, Palmer Dabbelt <palmer@dabbelt.com>, Javier Martinez Canillas <javierm@redhat.com>, Paul Walmsley <pjw@kernel.org>, spacemit@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Iker,

Please note, once you are sending new patch series, please drop patch 1-4
which already picked by Ulf, but keep increase the version number


On 10:54 Mon 11 May     , Iker Pedrosa wrote:
> Add complete SD card controller support with UHS high-speed modes.
> 
> - Enable sdhci0 controller with 4-bit bus width
> - Configure card detect GPIO with inversion
> - Connect vmmc-supply to buck4 for 3.3V card power
> - Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
> - Add dual pinctrl states for voltage-dependent pin configuration
> - Support UHS-I SDR25, SDR50, and SDR104 modes
> 
> This enables full SD card functionality including high-speed UHS modes
> for improved performance.
> 
> Suggested-by: Anand Moon <linux.amoon@gmail.com>
> Tested-by: Anand Moon <linux.amoon@gmail.com>
> Tested-by: Margherita Milani <margherita.milani@amarulasolutions.com>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index e20daa50a152..8fea6e87acec 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -221,7 +221,7 @@ buck3_1v8: buck3 {
>  				regulator-always-on;
>  			};
>  
> -			buck4 {
> +			buck4: buck4 {
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <3300000>;
>  				regulator-ramp-delay = <5000>;
> @@ -242,7 +242,7 @@ buck6 {
>  				regulator-always-on;
>  			};
>  
> -			aldo1 {
> +			aldo1: aldo1 {
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <3400000>;
>  				regulator-boot-on;
> @@ -374,3 +374,21 @@ hub_3_0: hub@2 {
>  		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
>  	};
>  };
> +
> +&sdhci0 {
I'd suggest to add alias (to 'aliases' node), so we will have stable
dev node regardless whichever device probe first.. something should like
	aliases {
		..
		mmc0 = &emmc;
		mmc1 = &sdhci0;
		..
	}

So, how about let's make it convention here, first device is emmc, second
is SD card, third is sdio device (haven't added yet).. We introduced emmc
early before this patch, so it stays unchanged which is nice for end user

Please apply this alias idea to all boards although I only comment in this
patch..

> +	pinctrl-names = "default", "uhs";
> +	pinctrl-0 = <&mmc1_cfg>;
> +	pinctrl-1 = <&mmc1_uhs_cfg>;
> +	bus-width = <4>;
> +	cd-gpios = <&gpio K1_GPIO(80) (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +	no-mmc;
> +	no-sdio;
> +	disable-wp;
> +	cap-sd-highspeed;
> +	vmmc-supply = <&buck4>;
> +	vqmmc-supply = <&aldo1>;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	status = "okay";
> +};
> 
> -- 
> 2.54.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
