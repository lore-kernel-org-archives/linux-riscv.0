Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18D11088E58
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 01:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qU1gFl4xRuZkEc5I5M3bc9ToZ4aezMmvtcFluuR6O7g=; b=1t9d4gijI/zeGj
	WXz5lRmVIoVZIkkto1I21Y5Y3BYhp67RHp5oIIEn+2GwWWMBkiQT/cUFsuhLhiA6t6ZJCL5Hq+Lvw
	GJQU69AduDUCojWq7os7f2KAXfyJIK16IleXEKqpd4zE2W5FNNsk6VCLE3C+jNcT8jxoeFKf5r0lO
	Hk5HpfLOfQlVjHUA+F/4BLSBd7i/r/RZ7Bxm8QAfVlNOZZU846BuViNep5v1hE/cl8oSdYPe4VE5j
	xRu+28fh48st3XUeehuMIZD23vf3wVAcyQuETdc8+XNMTmeFtu7rDVBAGgIOKQgpJMuvDO4OqM9Vx
	kqFZk2Zktkfbu5vhhIkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w32ZV-00000009d01-1M1u;
	Thu, 19 Mar 2026 01:53:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w32ZQ-00000009czD-1Si0
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 01:53:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A2A23412F2;
	Thu, 19 Mar 2026 01:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D009C19421;
	Thu, 19 Mar 2026 01:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773885187;
	bh=0E5OqoKU9mNupvcGG7Hc3GPoauqIcESgXzJArXxkHDg=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=pSLcPVWMa+BVZkgO5QU9TWEWwO46D3ZCp6PuP1rL14PuTB5QVLPGs+EnBUFsBQdEO
	 cYwf+AvQGnbBvahVxPzDzTfbLLKOuBSdj2Nhog5MfpCY3pHL2xFWeIG64gu2ANaNev
	 CmfGqIwmuKWsxaSaSPKcSibP5RAqfyclpuhkofyvUBsMeRsLeMHHG1g939ecovHH+u
	 8+spxu7zhMfpLrpPAcBtD8UKBFvARQPB7FhdsyyF10F4je6O1cRmCPzHnHG72GvjOk
	 fmnyAlBkGhAw0FoV1TW4yMiZG5LbCyorWpWFzW3LC+WbDEl6Z+sFXQtup8gEUMXY3m
	 AJxrBFqB4k06w==
Date: Thu, 19 Mar 2026 09:53:05 +0800
From: Yixun Lan <dlan@kernel.org>
To: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH v3 7/7] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
Message-ID: <20260319015305-GKA489299@kernel.org>
References: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
 <20260316-orangepi-sd-card-uhs-v3-7-aefd3b7832df@gmail.com>
 <absKDGLCw26xr7Z4@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <absKDGLCw26xr7Z4@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_185308_428968_83E917AB 
X-CRM114-Status: GOOD (  24.74  )
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

Hi Aurelien,

On 21:24 Wed 18 Mar     , Aurelien Jarno wrote:
> Hi,
> 
> On 2026-03-16 15:03, Iker Pedrosa wrote:
> > Add complete SD card controller support with UHS high-speed modes.
> > 
> > - Enable sdhci0 controller with 4-bit bus width
> > - Configure card detect GPIO with inversion
> > - Connect vmmc-supply to buck4 for 3.3V card power
> > - Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
> > - Add dual pinctrl states for voltage-dependent pin configuration
> > - Support UHS-I SDR25, SDR50, and SDR104 modes
> > 
> > This enables full SD card functionality including high-speed UHS modes
> > for improved performance.
> > 
> > Suggested-by: Anand Moon <linux.amoon@gmail.com>
> > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 23 +++++++++++++++++++++--
> >  1 file changed, 21 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > index 404b69c47b91f8c37d74a3031dbad0d94a28d1b4..a7d480d01ccc0439dbf456ed5a81f467af68056a 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > @@ -222,7 +222,7 @@ buck3_1v8: buck3 {
> >  				regulator-always-on;
> >  			};
> >  
> > -			buck4 {
> > +			buck4: buck4 {
> >  				regulator-min-microvolt = <500000>;
> >  				regulator-max-microvolt = <3300000>;
> >  				regulator-ramp-delay = <5000>;
> > @@ -243,7 +243,7 @@ buck6 {
> >  				regulator-always-on;
> >  			};
> >  
> > -			aldo1 {
> > +			aldo1: aldo1 {
> >  				regulator-min-microvolt = <500000>;
> >  				regulator-max-microvolt = <3400000>;
> >  				regulator-boot-on;
> > @@ -369,3 +369,22 @@ hub_3_0: hub@2 {
> >  		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
> >  	};
> >  };
> > +
> > +&sdhci0 {
> > +	pinctrl-names = "default", "state_uhs";
> > +	pinctrl-0 = <&mmc1_cfg>;
> > +	pinctrl-1 = <&mmc1_uhs_cfg>;
> > +	bus-width = <4>;
> > +	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
> > +	cd-inverted;
> 
> Thanks for this driver. Unfortunately, this is not correct for the 
> Banana PI F3. The OrangePi RV2 buffers the signal from the SD card 
> connector through a transistor, inverting the signal. On the Banana PI 
> F3, the signal goes directly to the GPIO, and does not even have a 
> pull-up.
> 
> With the following change, I have been able to get the patchset working 
> as expected:
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index a7d480d01ccc0..72b0f75f936aa 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -375,8 +375,7 @@ &sdhci0 {
>  	pinctrl-0 = <&mmc1_cfg>;
>  	pinctrl-1 = <&mmc1_uhs_cfg>;
>  	bus-width = <4>;
> -	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
> -	cd-inverted;
> +	cd-gpios = <&gpio K1_GPIO(80) (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
Have to mention, to use the pull-up, the patch to support gpio config should be applied
https://lore.kernel.org/r/20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech

if you don't want to introduce the dependency, add "broken-cd" property
should also workaround this..
>  	no-mmc;
>  	no-sdio;
>  	disable-wp;
> 
> Regards
> Aurelien
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
