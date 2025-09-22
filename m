Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBDBCAC59A
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 03:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pAiFIfBvdP4wdOvsEruk1eDI0CHrmeFyg+m6g/7JARo=; b=ReazCzqi2yL2XH
	un4aFK0/+sC4q3B95MOrBIkYv6vyTutkEWFzv6mzm8QYLI3Liw4v8yVL5DISD2AzUJ9HU42z35mef
	xeLK/7ZTWrCMjzRfBW9fs81ogDTqisTGkziiNHFoj3I91s0f8aiWhBtxQQwfZiSaQgkEvXi9KS98q
	wnA6t/XSX4pRKbqvKxMjpaWrSY8fgHWmbcyRKa/oWQDDBhppAqp8f/2zngEOyKj6kshla37D5bDE1
	VOEVHWJlcgIJ2JTFIRX7yvnHqZq7VMTLA4pKF6PRKin1yG1W7yQ6ttVNCfaa/gUJq9qx/QtpQ+QZB
	txZ+/mbnNlJFet8P5xag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0X84-00000008gSX-3HOO;
	Mon, 22 Sep 2025 03:22:16 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0X80-00000008gRP-0Bsn
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 03:22:15 +0000
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id B70E6341002;
	Mon, 22 Sep 2025 03:22:08 +0000 (UTC)
Date: Mon, 22 Sep 2025 11:21:58 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: add 24c02 eeprom on BPI-F3
Message-ID: <20250922032158-GYA1291757@gentoo.org>
References: <20250921210237.943370-1-aurelien@aurel32.net>
 <20250921210237.943370-3-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250921210237.943370-3-aurelien@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_202212_113559_C4FD04C8 
X-CRM114-Status: GOOD (  15.82  )
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

On 23:01 Sun 21 Sep     , Aurelien Jarno wrote:
> The BPI-F3 contains a 24c02 eeprom, that contains among other things the
> MAC addresses of the two network interfaces. For this reason, mark it as
> read-only.
> 
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 3b6e4f52e9aad..574d10fdf9b82 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -115,6 +115,15 @@ &i2c2 {
>  	pinctrl-0 = <&i2c2_0_cfg>;
>  	pinctrl-names = "default";
>  	status = "okay";
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c02";
> +		reg = <0x50>;
> +		vcc-supply = <&vcc1v8_sys>;
> +		pagesize = <16>;
..
> +		read-only;
so you're sure there is no demand to write data to eeprom?
(update info at linux env)
> +		size = <256>;
> +	};
>  };
>  
>  &i2c8 {
> @@ -143,7 +152,7 @@ buck2 {
>  				regulator-always-on;
>  			};
>  
> -			buck3 {
> +			vcc1v8_sys: buck3 {
I'm not sure if adding an alias here is a good idea, it occurs buck3
serve the suppy for many devices, besides, to me it's more proper to
name it as eeprom_vcc1v8 for the eeprom according to schematics in
this case..

>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <1800000>;
>  				regulator-ramp-delay = <5000>;
> -- 
> 2.47.2
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
