Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7828D148A3
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 07:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gAKCQhr5PAnrrUb+5OkKoSbEFj44PppNb+Jspk6hlas=; b=F18l3uM9AM7u2W
	sfPO+lR96Fw6G/0L0XxkN7AlIYDfENIpGC23+0gyq952c0fKyFDFj/82s3+dTZ241GZsV+eIDjJZ3
	x0RLRTI58fQyV+7PwTx6vH7kLOwzd0/UXUzmYGWWnfN/Zok01O7QX0+spNKLhi+18G4nlffP24Gc0
	Pq4FlyESzwTPVtDiCEWShmAFfEfVj0JJbmr7c8bC8S7PiLiYocmvamjpgU9MEhroTbmmIsSAqTvSr
	DCEKwu1dwN/N6FTW1aoS55dBJZofwa1Nml0bDUuGpnw0pQkEiFwvEP4/Ani0KgVzJoUZyL+uMaizY
	XYFpUoN9ZZq2DrXVqUsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdkaJ-0000000G6uH-0gPn;
	Thu, 08 Jan 2026 07:37:31 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdkaG-0000000G6tY-2WKm
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 07:37:29 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 44324341EB7;
	Thu, 08 Jan 2026 07:37:26 +0000 (UTC)
Date: Thu, 8 Jan 2026 15:37:22 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: modify pinctrl node in dtsi
Message-ID: <20260108073722-GYA3634@gentoo.org>
References: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
 <20260108-kx-pinctrl-aib-io-pwr-domain-v2-3-6bcb46146e53@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-3-6bcb46146e53@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_233728_689334_A240DDD2 
X-CRM114-Status: GOOD (  17.42  )
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

Hi Troy,

  if there is one more iteration, I'd suggest to adjust the patch titile, 
to make it slightly more specific

  riscv: dts: spacemit: pinctrl: update register and IO power

On 14:42 Thu 08 Jan     , Troy Mitchell wrote:
> Change the size of the reg register to 0x1000 to match the hardware.
> This register range covers the IO power domain's register addresses.
> 
> The IO power domain registers are protected. In order to access the
> protected IO power domain registers, a valid unlock sequence must be
> performed by writing the required keys to the AIB Secure Access Register
> (ASAR).
> 
> The ASAR register resides within the APBC register address space.
> A corresponding syscon property `spacemit,apbc` is added to allow
> the pinctrl driver to access this register.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 7818ca4979b6a7755722919a5958512aa11950ab..f05429723d1bbbd718941549782461c49196ecef 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -565,10 +565,11 @@ i2c8: i2c@d401d800 {
>  
>  		pinctrl: pinctrl@d401e000 {
>  			compatible = "spacemit,k1-pinctrl";
> -			reg = <0x0 0xd401e000 0x0 0x400>;
> +			reg = <0x0 0xd401e000 0x0 0x1000>;
>  			clocks = <&syscon_apbc CLK_AIB>,
>  				 <&syscon_apbc CLK_AIB_BUS>;
>  			clock-names = "func", "bus";
> +			spacemit,apbc = <&syscon_apbc>;
>  		};
>  
>  		pwm8: pwm@d4020000 {
> 
> -- 
> 2.52.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
