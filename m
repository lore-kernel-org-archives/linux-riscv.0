Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12C5CD343F
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 18:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=azsV1P0S8pHXQvcrDSYBySUonZYaxhf/t3pk3Inq8DA=; b=M3czwtWBndCVCC
	5TjMH+pfKdcAyCcOBRXJDHqfulvobD72JwbiVL6dgUbmlWYdAhdn/Bpir1faqnffRUemNZFWGWPeR
	od5yjmSSmbP2jHY25QLvbw22CqJR/cO2OH0B5h5z1EBSAMjosWln4uT6U/EJWDdeNPKzio8L7kMu3
	4xriHUIIyA2lSqU5/bUgiJBXn6bvh6vp4dB05CkkCryBuqYweEIXO5XXdhyA4xq5ppOnANJeBq1YA
	SnS0YJUVhfw6NtfQmHr0yNkH+TR9a+Qr6o3zyo+Z6Xs04bj9qrL8oHImNYOsBoCk0/T4sRVHzm0Ir
	WCU3N1EcctrbujVA4ZzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL3TK-00000004bFT-21UZ;
	Thu, 07 May 2026 18:29:18 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL3TH-00000004bEG-3j4u
	for linux-riscv@lists.infradead.org;
	Thu, 07 May 2026 18:29:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=UhWt9GIcE0Eg5lAt4TvJi+a4FqjU40A5a8Y0h0GVjdA=; b=tl3qD4DIve1t57w4IepB4O3aUX
	WI8RndCoJA7rzWgQ0X0aRlRrnmjDdv4ATUqAf8tdKai6hFozEwMeIHWQB7yknemaMd/G9I0YMlMIV
	PKDS3Eo5XNB3wCxwCvEUlYzgncviRheivcEPNjvoCT9pPPhDuHIu/+pmo/cyYQSWsYFG1Eldv8Efc
	+3OLAzshMQz6FmwYKRrqWkAa9YqOiEPSX0g8hUN9IR0NCUlNdZmVXT1m8MlYjT/Khjyg1R1VTculK
	mGABxiKaeblL2uQ/s7op42k4DWcjCmI48dQUOUsLTmXxszUrFR0fWTdaj5eRtWSrmu2tnjT5Sqj5i
	a0slrciA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wL3Sz-000000090rv-1Xu2;
	Thu, 07 May 2026 20:28:57 +0200
Date: Thu, 7 May 2026 20:28:56 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: Re: [PATCH v8 8/9] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
Message-ID: <afzZ6Fjdt4puGjZ6@aurel32.net>
Mail-Followup-To: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
 <20260413-orangepi-sd-card-uhs-v8-8-c21c40ec16d0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260413-orangepi-sd-card-uhs-v8-8-c21c40ec16d0@gmail.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_112915_934047_1559420C 
X-CRM114-Status: GOOD (  16.31  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.dev>, linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-riscv@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, Yixun Lan <dlan@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On 2026-04-13 10:02, Iker Pedrosa wrote:
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
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 5790d927b93d..a7d88564630f 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -220,7 +220,7 @@ buck3_1v8: buck3 {
>  				regulator-always-on;
>  			};
>  
> -			buck4 {
> +			buck4: buck4 {
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <3300000>;
>  				regulator-ramp-delay = <5000>;
> @@ -241,7 +241,7 @@ buck6 {
>  				regulator-always-on;
>  			};
>  
> -			aldo1 {
> +			aldo1: aldo1 {
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <3400000>;
>  				regulator-boot-on;
> @@ -367,3 +367,23 @@ hub_3_0: hub@2 {
>  		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
>  	};
>  };
> +
> +&sdhci0 {
> +	pinctrl-names = "default", "uhs";
> +	pinctrl-0 = <&mmc1_cfg>;
> +	pinctrl-1 = <&mmc1_uhs_cfg>;
> +	bus-width = <4>;
> +	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
> +	cd-inverted;
> +	broken-cd;

Card detect is marked as broken as a proper definition requires pull-up 
support in pinctrl. Support for that went into 7.1, so I guess it's not 
safe to use the proper definition. That means using the following 
changes on to of this patch:

--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -406,9 +406,7 @@ &sdhci0 {
 	pinctrl-0 = <&mmc1_cfg>;
 	pinctrl-1 = <&mmc1_uhs_cfg>;
 	bus-width = <4>;
-	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
-	cd-inverted;
-	broken-cd;
+	cd-gpios = <&gpio K1_GPIO(80) (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
 	no-mmc;
 	no-sdio;
 	disable-wp;

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
