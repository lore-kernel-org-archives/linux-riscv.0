Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1F9EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 17:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gXjXUL/dS34umX2CwekGX0ociPZ/zb/qw8hDwVeCSa0=; b=l3FzKzOuKrksfe
	8qLeA1iuacIBy+wBxupEwL3goPlJqaXDPw2oam8NnUevlpry83iW581JLTdl6N52WtePGTrrRGioA
	VEdX3wpF6KRlTK4uhOUovpSfcW0SwtqoSqu3oJ7wt4pKEySyrKjHNqC/nbFxWpr9N91xbBD725Uv5
	qNAZumOJAHsZqO+LY9zGU0BIh/kAwOsgQboYQqAM6Wy1fzsK0swJ/paS3SP/zfxbbumx18GYe7w8r
	V8I6G4sQFHEeVnQ1MZXR0BQT+/VVMbuINcIVCgXdTepYXusQ0+DcU3psIe4K5iFFTYi9fWl3FCPzX
	cPPG6srI9peFhgmJ//Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLRnD-004dsU-1h;
	Mon, 17 Jul 2023 17:13:51 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLRn8-004drW-1n
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 17:13:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=I1IBVkksfG+qQKrTGDGnSHsQlmlbsma3MfWiTgZTY6Q=; b=WgcaRL2JCPPRtYMOzHVIebs+X/
	pSd/CNjzFIkV8z2rzh68t+tmKHzKfkwBTQpFpUfp7bhJHRpXzBqLbgWGYtYrxdIgN78mvXsq/NpwJ
	jYfAzYIIXYwgwqKquOFGD51QOX3z4bn91kzibs5kdaMePpFqRe5JyCKadAV/I4XvVSqW9Y8A8U0AE
	VPDhD4y7A3FAk7SPqFlpSAPtoUBiRm3ImRrPCdrkW2rKh7CKKuAD34dJURw7cJRugluO6Bz7RWcNB
	lf8UrLppn8TFn9NOzLxYADjzVgRKBGeATTh9qVqUilhBWsDL5urmRIXGimUYSMWovSOXGvT0p3EfW
	2B4UJDMQ==;
Received: from [2a01:e34:ec5d:a741:8a4c:7c4e:dc4c:1787] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1qLRmy-00AkKP-0S; Mon, 17 Jul 2023 19:13:36 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1qLRmw-009E8k-21;
	Mon, 17 Jul 2023 19:13:34 +0200
Date: Mon, 17 Jul 2023 19:13:34 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Ziv Xu <ziv.xu@starfivetech.com>
Subject: Re: [PATCH v4 3/3] riscv: dts: starfive: Add QSPI controller node
 for StarFive JH7110 SoC
Message-ID: <ZLV2vqycWIA5TanD@aurel32.net>
Mail-Followup-To: William Qiu <william.qiu@starfivetech.com>,
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Ziv Xu <ziv.xu@starfivetech.com>
References: <20230704090453.83980-1-william.qiu@starfivetech.com>
 <20230704090453.83980-4-william.qiu@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230704090453.83980-4-william.qiu@starfivetech.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_101347_600322_84E5B3B5 
X-CRM114-Status: GOOD (  13.55  )
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

Hi,

On 2023-07-04 17:04, William Qiu wrote:
> Add the quad spi controller node for the StarFive JH7110 SoC.
> 
> Co-developed-by: Ziv Xu <ziv.xu@starfivetech.com>
> Signed-off-by: Ziv Xu <ziv.xu@starfivetech.com>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-2.dtsi         | 32 +++++++++++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 18 +++++++++++
>  2 files changed, 50 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index 2a6d81609284..983b683e2f27 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -126,6 +126,38 @@ &i2c6 {
>  	status = "okay";
>  };
>  
> +&qspi {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	nor_flash: flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		cdns,read-delay = <5>;
> +		spi-max-frequency = <12000000>;
> +		cdns,tshsl-ns = <1>;
> +		cdns,tsd2d-ns = <1>;
> +		cdns,tchsh-ns = <1>;
> +		cdns,tslch-ns = <1>;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			spl@0 {
> +				reg = <0x0 0x20000>;
> +			};
> +			uboot@100000 {
> +				reg = <0x100000 0x300000>;
> +			};
> +			data@f00000 {
> +				reg = <0xf00000 0x100000>;
> +			};

It appears that this uses the old layout for the SPI flash. The new
layout is described there:

https://doc-en.rvspace.org/VisionFive2/Boot_UG/JH7110_SDK/boot_address_allocation.html

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
