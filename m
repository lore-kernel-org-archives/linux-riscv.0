Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAAFC54F51
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 01:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=muwWQI0QUmqdMylsU8Mxq7zlJdk2QEN3nrQHyZfXqzQ=; b=mK6XNYwSpxj2L5
	uFQLWBLzTzy6jftownMSRV301+7ma9rC337cgci3Z4IyUE+0d1HUFyit2w/HD3vRhhJp3mgKX7ZU6
	gN461o80TrYTi/PE9btLTWteIRCP4n8XczziwFJLE/k47nqnrIw4yssy+RfxpAVX4djiJLCf+HZ2j
	XaoMc2iYiJz0eyiHKob/eQoSGQT67eWGX6mMjf4/jZZk+zeaa/pL6eRwaUZbjqIRpeFwuk9BKONsH
	UNOA97W79zGaE9gKpR6wUu/wTpLtRmuBGbPXZ5OZBvzDKdUkgF9aH/rc1FgtO6/wpt/a/m8K0GxoF
	YtdbR1vWo9jpzdkNAt5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wotE5-00000006cLl-2lcs;
	Wed, 29 Jul 2026 01:36:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wotE3-00000006cLM-3kg6
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 01:36:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9BC8160A65;
	Wed, 29 Jul 2026 01:36:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105161F00A3A;
	Wed, 29 Jul 2026 01:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785289009;
	bh=qaJm4qDKQQDU8NT8cvf7AVcZ8BzpBKeOCQbL6WvFTuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JlUi7un3Wcd0nOutnCztacnQ1Da4uRwhr7ftz8m/FwFcNH1Fs7/93Ug6/et8Hd2RU
	 AZQfVSW23xOc1ge9TfnR0+fxO/Qx7L5IEyX470Pn7Roz5DoKu7Csa6nWbbJZT3mfnx
	 ExV71b/EesWJflEuWciybqAioD6SECZMgk6+TPMDDxDaydDnyGzVv+Nypc/kpLnGx4
	 PL4qMu5oGN9mFYVHwRdcyoD1IYwoeIIGIttyRsTF07ryAL3N7u5uBPFWZYN1zh7fUT
	 NR4B2RRCfFTExr+Up+g46GMYWGnYRdpvQGSW8LBtYsH4FIo23aqvXmV6uYXowTZr74
	 Sm7fu+5frEtlw==
Date: Wed, 29 Jul 2026 01:36:45 +0000
From: Yixun Lan <dlan@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Make dtschema recognize the
 etherent PHY correctly on K3 pico-itx board
Message-ID: <20260729013645-GKD77474@kernel.org>
References: <20260729012418.154652-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260729012418.154652-1-inochiama@gmail.com>
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

Hi Inochi,
 lacking cover letter, although it's not a really big problem..

On 09:24 Wed 29 Jul     , Inochi Amaoto wrote:
> Since the previous commit does not change the phy node name,
> the dtschema can not recognize the type of the ethernet phy,
> so the following error is produced:
> 
> /arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: phy@1 (ethernet-phy-id001c.c916): $nodename:0: 'phy@1' does not match '^ethernet-phy(@[a-f0-9]+)?$'
>         from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml
> /arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: phy@1 (ethernet-phy-id001c.c916): Unevaluated properties are not allowed ('reg', 'reset-assert-us', 're
> set-deassert-us', 'reset-gpios' were unexpected)
>         from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml
> 
> Change the nodename to make the dtschema can recognize the right
> PHY type.
> 
> Fixes: 6d6536c880fe ("riscv: dts: spacemit: Fix phy id check for the phy on pico-itx board")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Looks good, thanks for the fix

Reviewed-by: Yixun Lan <dlan@kernel.org>
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> index d78416f3118e..e91a4712f2db 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -195,7 +195,7 @@ &eth0 {
>  	status = "okay";
>  
>  	mdio {
> -		phy0: phy@1 {
> +		phy0: ethernet-phy@1 {
>  			compatible = "ethernet-phy-id001c.c916";
>  			reg = <1>;
>  			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
> -- 
> 2.55.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
