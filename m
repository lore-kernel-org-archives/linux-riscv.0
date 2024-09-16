Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0E4C3ABA2
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2024 07:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R+IKJD5InaQkC75+shhEOaFJINEf2bGx7iBgdtmJOio=; b=ZkoiX5cBugBww/
	kCVJYnNeOEm+XXq5NMiMRcqjII/z8iIPyVMVFrLvYXbR/KOJM4olaZnF+NCTHhnWm2OaHNBxAKNhT
	tKD/75sdJp1GC2IK0r1FoC+OD2GmWATn8u2JvnSNxSK1JQeHp94yFJEFilydrn8nB86QzVRKIh6eR
	CyFETMc44Oq3eFsCzy49CfRMOOjq5e4Dm7XBYvE1mQTdM58dYRPu2Yw1PPpZuZZW8412+0Tyv59Dc
	vprnCdzxGRPSdqOzoCibGhis27+0AI/sV/8BO4R+lIcNUyRbOx52loCfeWWHtjR6rIEpGVJFhHtN+
	0LpGtSvE09h4FlYlyyrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq5jm-00000003GFJ-3sMB;
	Mon, 16 Sep 2024 07:01:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq5jk-00000003GEr-17jx
	for linux-riscv@lists.infradead.org;
	Mon, 16 Sep 2024 07:01:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 42E10A41695;
	Mon, 16 Sep 2024 07:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B5ABC4CEC4;
	Mon, 16 Sep 2024 07:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1726470086;
	bh=1ikaFaSoCsPLoQgV04uNWfBUF7Pu3uTQmPOnd2a66xo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TVkh18vMOGCHbuu20LHp2Tqa/lUF4aQCbcOn9mj0y+qGt/m9y0kOWKUhoCitfXmdH
	 P+Sbq3e02AtgmgWzEAk2yWf3Q3Jz51kq5YEISIHEr9LA60Kh1zNx/z7I4ZfAHtWn1f
	 nzz/M1ib4CEqSwQdWm7lezK0PaZEFdnM9i712+ZU=
Date: Mon, 16 Sep 2024 09:01:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: WangYuli <wangyuli@uniontech.com>
Cc: stable@vger.kernel.org, sashal@kernel.org, william.qiu@starfivetech.com,
	emil.renner.berthing@canonical.com, conor.dooley@microchip.com,
	kernel@esmil.dk, conor@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6.6 v3] riscv: dts: starfive: add assigned-clock* to
 limit frquency
Message-ID: <2024091616-shut-roundish-6a17@gregkh>
References: <247345579659D8F7+20240916034603.59120-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <247345579659D8F7+20240916034603.59120-1-wangyuli@uniontech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_000128_391995_0E0ABD0F 
X-CRM114-Status: GOOD (  13.75  )
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

On Mon, Sep 16, 2024 at 11:46:02AM +0800, WangYuli wrote:
> From: William Qiu <william.qiu@starfivetech.com>
> 
> [ Upstream commit af571133f7ae028ec9b5fdab78f483af13bf28d3 ]
> 
> In JH7110 SoC, we need to go by-pass mode, so we need add the
> assigned-clock* properties to limit clock frquency.
> 
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  .../riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index 062b97c6e7df..4874e3bb42ab 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -204,6 +204,8 @@ &i2c6 {
>  
>  &mmc0 {
>  	max-frequency = <100000000>;
> +	assigned-clocks = <&syscrg JH7110_SYSCLK_SDIO0_SDCARD>;
> +	assigned-clock-rates = <50000000>;
>  	bus-width = <8>;
>  	cap-mmc-highspeed;
>  	mmc-ddr-1_8v;
> @@ -220,6 +222,8 @@ &mmc0 {
>  
>  &mmc1 {
>  	max-frequency = <100000000>;
> +	assigned-clocks = <&syscrg JH7110_SYSCLK_SDIO1_SDCARD>;
> +	assigned-clock-rates = <50000000>;
>  	bus-width = <4>;
>  	no-sdio;
>  	no-mmc;
> -- 
> 2.43.0
> 
> 

Now queued up, thanks.

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
