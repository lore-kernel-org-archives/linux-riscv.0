Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B27E7C719
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Feb 2026 11:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=prBlBtWqunOg/NHb5vVtubMDyy1nuE531znauGpRL2M=; b=S3mTiR/tm+9PoY
	1leDxTEQMXILnUF0k9yoAR60tYbbmjwF34zU2buFKsarAXOcjbdNkp8mKzZJIly1D8ucoXW/ozSZU
	cNU+5YsAlGcD6KiMYXis28X7gVVFL94UUa5ZiYgK7zR48sF4RC/cQAzsxyr0+UlZWQM0m6BZQKfEU
	BJeZ0oGx2gVSWeXtOKwH13JB87PoPikLENZ1j66zlmhgTMt7znfEkvfQJUa2z57oEHWfeU+ARwzWZ
	c3pVB4wOoCdnEFfxaf+onA6LuryJE5nomODAEZKLBmOPyisD8KQm7dukpWgJ0wP3c6NY50g0c276/
	3o+hxEt/7eEwawqNBaUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmVfm-00000003SyP-2eaD;
	Sun, 01 Feb 2026 11:31:22 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmVfj-00000003Sxv-2muZ
	for linux-riscv@lists.infradead.org;
	Sun, 01 Feb 2026 11:31:20 +0000
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 64436341EE4;
	Sun, 01 Feb 2026 11:31:15 +0000 (UTC)
Date: Sun, 1 Feb 2026 19:31:10 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH 2/7] riscv: dts: spacemit: Define fixed regulators for
 OrangePi RV2
Message-ID: <20260201113110-GYB109598@gentoo.org>
References: <cover.1769895215.git.gaohan@iscas.ac.cn>
 <c5799da08242f8aa1a77f144ab0273d68af1841f.1769895215.git.gaohan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c5799da08242f8aa1a77f144ab0273d68af1841f.1769895215.git.gaohan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_033119_725581_F778BAA0 
X-CRM114-Status: GOOD (  11.43  )
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

Hi Han,

On 05:38 Sun 01 Feb     , Han Gao wrote:
> Define the DC power input and the 4v power as fixed regulator supplies.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 93880ba7bdfe..bd1e45e95e38 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -23,6 +23,25 @@ chosen {
>  		stdout-path = "serial0";
>  	};
>  
> +	reg_dc_in: dc-in-12v {
this is copy & paste.. per discussion with Chukun, I'd suggest to add
'regulator-' prefix, see

https://lore.kernel.org/r/20260123145015.1926865-1-amadeus@jmu.edu.cn

> +		compatible = "regulator-fixed";
> +		regulator-name = "dc_in_12v";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
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
> +		vin-supply = <&reg_dc_in>;
> +	};
> +
>  	leds {
>  		compatible = "gpio-leds";
>  
> -- 
> 2.47.3
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
