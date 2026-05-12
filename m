Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710BBCD484E
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 05:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1KlwTtXHUlLnJRJuZ00/M09XeyH2gpEw5SFYfyxEtlQ=; b=tNmqEIBLs6JeNa
	+9HyGFNvQLckkIcb63KBgGOZSQLPkYuLZlTjuleg8m16AivdtZQWbsj6F9kk1Jk4smUVemtNRGq94
	ioeTKlIAZYdqmrojwCfU/yA74qF2Rinay2i0Mq87YxzmZ+rMErilt+TW8Q7uhXwj1fCxzgaEEd4HS
	wyX9iJ9MAUP4oGBG+nm+a+j9k6Jvw/QwlSn2uFB+L82riIds/PTSd1cHtcgnHGSE+08AZStDMBdLA
	/ZrPDOm5WcAvl5rWn/3xqqHATQolFFxbiUs0dnjxHjZSVFVYOtYqj25p2sXOsi8+iqPYc2I01MBbC
	UWUw0Ef2kXGJ+XRoQaHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfYC-0000000FYZ8-3Tfs;
	Tue, 12 May 2026 05:21:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfYC-0000000FYYT-0YQt
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 05:21:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3279960103;
	Tue, 12 May 2026 05:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B96C2BCB8;
	Tue, 12 May 2026 05:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778563258;
	bh=DKykONumnN8vEAkNqUHocQNuYxuy08HseTU9qi3MfU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ISF34sO4Kyt0LWF1g1Qy9SHd4SwpidsMOSdsluazACG6ullhYMhA/Hn3ZaPf0lCFu
	 6nz3rADFvJKXfBlqps+EAlz9Fi1MVJi/aKXXgbk9JTP9UPU5yRrdChrqFr4FmvdHJ0
	 h8+OmyE4aetyGCxlNmxVloa4LT15I9rxldJlqaTzk00OCC3fIeMgtz13wybdftlIHz
	 T8B0QHJ/KytY5+t4sLH7UZzbytHf3iYXreOhjGgAoIwStGVM3VxvnrkKPzZ0J/6HaQ
	 yorofaw4HfFiFhaUACELeqRqyZUUSIjV8yNlGfyANcZupMzvo3fSPEuAQfvdjLW8Td
	 vTF78sUdtaYsA==
Date: Tue, 12 May 2026 05:20:56 +0000
From: Yixun Lan <dlan@kernel.org>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Ulf Hansson <ulfh@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Trevor Gamblin <tgamblin@baylibre.com>
Subject: Re: [PATCH v9 8/8] riscv: dts: spacemit: k1-musepi-pro: add SD card
 support with UHS modes
Message-ID: <20260512052056-GKD3624147@kernel.org>
References: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
 <20260511-orangepi-sd-card-uhs-v9-8-ae48c0b2b2cf@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260511-orangepi-sd-card-uhs-v9-8-ae48c0b2b2cf@gmail.com>
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

Hi Iker, Trevor,

On 10:54 Mon 11 May     , Iker Pedrosa wrote:
> From: Trevor Gamblin <tgamblin@baylibre.com>
> 
> Update the Muse Pi Pro devicetree with SD card support to match what
> was done for the OrangePi RV2 in [1]. More precisely:
> 
> - Enable sdhci0 controller with 4-bit bus width
> - Configure card detect GPIO with inversion
> - Connect vmmc-supply to buck4 for 3.3V card power
> - Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
> - Add dual pinctrl states for voltage-dependent pin configuration
> - Support UHS-I SDR25, SDR50, and SDR104 modes
> 
> [1] https://lore.kernel.org/linux-riscv/20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com/T/#
> 
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 66 ++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> index 29e333b670cf..774a4640f065 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> @@ -18,6 +18,24 @@ aliases {
>  		ethernet0 = &eth0;
>  		serial0 = &uart0;
>  	};
Add one blank line here, but see comment below..
> +	reg_dc_in: dc-in-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "dc_in_5v";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
reg_dc_in is not used, drop it, for the reason, see recent discussion of
this thread here[1][2], especially refer to Krzysztof's original comment
https://lore.kernel.org/all/6530526f-59ca-4753-a068-46c62a1a1fed@kernel.org/ [1]
https://lore.kernel.org/all/20260511065338-GKA3624147@kernel.org/  [2]

> +
> +	reg_vcc_4v: vcc-4v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_4v";
> +		regulator-min-microvolt = <4000000>;
> +		regulator-max-microvolt = <4000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
>  
>  	chosen {
>  		stdout-path = "serial0";
> @@ -77,3 +95,51 @@ &uart0 {
>  	pinctrl-names = "default";
>  	status = "okay";
>  };
> +
> +&i2c8 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c8_cfg>;
> +	status = "okay";
> +
> +	pmic@41 {
> +		compatible = "spacemit,p1";
> +		reg = <0x41>;
> +		interrupts = <64>;
..
> +		vin-supply = <&reg_vcc_4v>;
This should be adjusted, please check schematics as I haven't done it
myself, for reason behind please refer to this patch (which was merged
in v7.1)

http://lore.kernel.org/r/20260206-spacemit-p1-v4-1-8f695d93811e@riscstar.com

> +
> +		regulators {
> +			buck4: buck4 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-ramp-delay = <5000>;
> +				regulator-always-on;
> +			};
> +
> +			aldo1: aldo1 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3400000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +		};
> +	};
> +};
> +
> +&sdhci0 {
> +	pinctrl-names = "default", "uhs";
> +	pinctrl-0 = <&mmc1_cfg>;
> +	pinctrl-1 = <&mmc1_uhs_cfg>;
> +	bus-width = <4>;
> +	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
> +	cd-inverted;
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
