Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CC7CD37B9
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 11:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+TrTCqCv0H2jbyxiMgzLsDNDDkN5nlR8e6prYuIkKQw=; b=mne27rdtTBvuAU
	CB0mEdSyuaCO6CA738gkmKG6ay9Ibo+AKK5lN3xSf+/imJiFQX5HUVT1TKMUp2tD/Hyhp/VrgjxeI
	1KMMVO/MyfWi/Qci4C1X1Y7HMRyorztDunryrSGLozWFFdYYoOa0DvpAm8vGkrlnkqTP9bywl6r8s
	09Fl+GIWXvqUSNI6BFR+/txeuxEBad81KbKBvaeutI0bDK1myxG/W1+1WWZmJ3n3H4mEqXCTwWFT6
	YncyL9jNgYYhew2byLD1E4L6MfR2GyCowgYtVoVZgLRFcjLrRcdIRsozOrOSCb9IBiWS37r0JJ2BH
	iRuU0kS28yZgEH16trkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMP2r-0000000DNDs-3Cj8;
	Mon, 11 May 2026 11:43:33 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMP2p-0000000DNCg-3v9h
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 11:43:33 +0000
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45562c41ec7so1310022f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 04:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778499810; x=1779104610; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vq0OHDPrSqmT5iEr31Nrcm4QgRLDSjmnaM+8FKnpEIY=;
        b=R6F1hnAfFKsoOTbY7VFj4U4C4G8KatXdLFGFP1dVVrR+LzY5juXqH959AZsJGRDa4h
         ke4v3DfRXYTeUyLSdC//CwmOSxpSZybmeBsKYeRaSGolme47tHyoOhq3BVJkljztPvPc
         Y8ZT7XMVZEWFoR9nwkuqBbhYHk2fRKoVnTaVFve6VwJxEwQBrGpiTkqYm+VMdVqYaILB
         0Dhv7U1787IWUZxcu9DSAXIY48qIF54sODipU+yDwdrm5J1dygKdnCnF0im5w+e9dos6
         EHNqQ+HQ4SS+0MTCZBw4cyjLorqxDcyoNFYgY6EKzVOvD0OGga8Ft2i9Kira5+bdbFNh
         wBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778499810; x=1779104610;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vq0OHDPrSqmT5iEr31Nrcm4QgRLDSjmnaM+8FKnpEIY=;
        b=dxzrXnUd5ZEnt/5igtvZnwzwzbGTAVKwfNHIRzd6xjOVP3rIzPoVVMXodlgtwcbWxR
         Hm0lxLgnDdxpJWSRFGDY+CHeKU1VxFnxq8GgP5brh0iBFNWaTexVt6/C48iP4vz/NRWQ
         RMTg6KgqWdYCfybQvjtHHMA6z7yPkFXCz1PqAHEWvYQ/fpJXyMbg7Kzn4Tl+erGGPvWn
         VnQ5uktaXrzF3iVM7G3KzhttJNtzNjncVI5t2ZPNoMc3DlEGHJL5EIOUP8/aqcR//fcB
         HekBjdqn3OMi+q3hpkSGMF7w2dI/1QiSW5OY41n19aDtgnH637fOtpKYAFYGnMrBa4Ac
         TunA==
X-Forwarded-Encrypted: i=1; AFNElJ8uc9hhhTHy8awGh4vSxWNqdXeb8qns811lcunE82Mx8usibIV19tb8ppJ+CeF93cTp+Qcp4fJ1CGqGKw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCmEO+kYmO6i6wXs3koaruRn2Cd8WOdizV5J4qIv6lZEaz8GaT
	fkuIdv00HYl18UmF7kjgiGLqNeHW1/VkDk2yJyRyqJHNZOrZ4hxPY5TV
X-Gm-Gg: Acq92OG2CpKPNnAL9x0NdPnvNyBSske0O/bRzMWfI6fQxhsOAhaHeRuGxsjsYCLMmbo
	IDFG8MyZ5GlIDEcR2Om05wTcyBqobWS6yXN7zdQXbcVSTI8Wpz5HeGKW2PL6AEiTVmGokKbPJ21
	QE046frBNLEz6SBr4x0TcNzoaIN8M+drlz2a8ie+NMHTWb9IDkFiZ/xlrFUPrQCapWNvD9jmkEB
	BMh2Ww74xrxNFjIL1eWI1m4QBG6oYCa+lYH+N0JhPw0mUoeElGxjTESKe+yh9iXxWjrrlQFSAuG
	/6LPxuXNbHuX89gIThTOT8QxUbmh5qRRLS2FXeUJDP9kyFA3gpjDHYrsqlmfiN3mH8Fo/xdSirV
	FhzcqiYeAgZVaX+1GLUmEhV8e0WzMheX0JPBGyyo821qnk0W4/zOOEZBGbzSKQrU190CLpaTrTy
	oth/LsjuPrmk8pDWKy+HUy6sfbf9VpbkYgbUWgAzX2h1CMDAqkPAssPvaAbsGfHXI=
X-Received: by 2002:a5d:64c9:0:b0:43d:75ec:26f7 with SMTP id ffacd0b85a97d-4515cb3d91dmr38402992f8f.29.1778499809527;
        Mon, 11 May 2026 04:43:29 -0700 (PDT)
Received: from [192.168.0.40] (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-458b3664e3esm9488989f8f.3.2026.05.11.04.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 04:43:29 -0700 (PDT)
Message-ID: <46f93cdb-e65d-4c83-9050-f8223690b0ce@gmail.com>
Date: Mon, 11 May 2026 13:43:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 8/8] riscv: dts: spacemit: k1-musepi-pro: add SD card
 support with UHS modes
To: Iker Pedrosa <ikerpedrosam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Trevor Gamblin <tgamblin@baylibre.com>
References: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
 <20260511-orangepi-sd-card-uhs-v9-8-ae48c0b2b2cf@gmail.com>
From: Andre Heider <a.heider@gmail.com>
Content-Language: de-DE
In-Reply-To: <20260511-orangepi-sd-card-uhs-v9-8-ae48c0b2b2cf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_044332_001820_60CC432B 
X-CRM114-Status: GOOD (  16.34  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Iker,

On 11.05.26 10:54 AM, Iker Pedrosa wrote:
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

with the cd issue mentioned below this is:

Tested-by: Andre Heider <a.heider@gmail.com>


> ---
>   arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 66 ++++++++++++++++++++++++++
>   1 file changed, 66 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> index 29e333b670cf..774a4640f065 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> @@ -18,6 +18,24 @@ aliases {
>   		ethernet0 = &eth0;
>   		serial0 = &uart0;
>   	};
> +	reg_dc_in: dc-in-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "dc_in_5v";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
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
>   	chosen {
>   		stdout-path = "serial0";
> @@ -77,3 +95,51 @@ &uart0 {
>   	pinctrl-names = "default";
>   	status = "okay";
>   };
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
> +		vin-supply = <&reg_vcc_4v>;
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

cd doesn't work with that on my muse pi pro. This on top fixes it though:

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index c3920fc708f51..ad68ded8dfd7e 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -396,8 +396,7 @@ &sdhci0 {
     pinctrl-0 = <&mmc1_cfg>;
     pinctrl-1 = <&mmc1_uhs_cfg>;
     bus-width = <4>;
-   cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
-   cd-inverted;
+   cd-gpios = <&gpio K1_GPIO(80) (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>;
     no-mmc;
     no-sdio;
     disable-wp;

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

Thanks!
Andre

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
