Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074B9CD4F54
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 11:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WzmGB0pwACqJSaCOLWW41babK5OKH6/iRdcSRWlnyKQ=; b=hxmXwEO8mZo9Fi
	asJF7W/2HsIGMJwfIziUpHh61orckiL3FMw5rnGsIu8Ofb865gmn4wvJMlBluuyiidZgiHspttggL
	/ygCYl9a7qXqNW2vv2EIq8qPCmHynESdZDZk4E5/c4tulbxtNPfNpAJOLkC9R7AdJITsgjGRAbMB4
	bqgjjZc4saU5LmMsIDS0pxE882D3c5xeGG2fWyshelW06nye5TrTU2OZhU1WazwzNs5hs/cW127tg
	7H8vEBJIZELQUq309rqjA1KIx3QOBaDyEGnALV7AhLWFZaA14h2+Gn6HDwMq4kEFHAZsCzfIPo9pG
	RlJSaf7gyBvk5OZrDscQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPf1k-00000004RKo-1vYn;
	Wed, 20 May 2026 11:23:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPf1i-00000004RKX-2fxz
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 11:23:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AF557600CB;
	Wed, 20 May 2026 11:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D444D1F000E9;
	Wed, 20 May 2026 11:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779276229;
	bh=wkNSjwILngGg4QbYdkWTNQlfqCaMiO9D/Tb+mr1JSl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mVXipd3/q47+BWEW/jiq8yk1n4185mBOpzY+ug8klxJIPAjyIvy5idFrzdwCgCxOg
	 yju1rF64XfEatyF4kXI7rTGFEvkdymIkfXqxGhzAgjlngSRkeyWZBErEyzQxaRXv2n
	 Ppy0iWt97GgUCke2xGULSD1MegkoyWAeJafR1/jFAqUBE6Di0VduEfox41l9PIOwhm
	 gcUoJLmfCDXU0OOkt3uooesmxsJIgKCmmyOQ51le63+zefm+togA4mylBvXZBu3EX5
	 UvVCSEWGTDadJN/JERcT6K6DUECERHowWLni+v29kEw724Ek9M91YWCPkg6JrbpTDV
	 fGvIxAlMf3bLg==
Date: Wed, 20 May 2026 11:23:46 +0000
From: Yixun Lan <dlan@kernel.org>
To: Jennifer Berringer <jberring@redhat.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: set console baud rate on OrangePi
 RV2
Message-ID: <20260520112346-GKB3717228@kernel.org>
References: <20260520111150.3300707-1-jberring@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260520111150.3300707-1-jberring@redhat.com>
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

Hi Jennifer, 

On 07:11 Wed 20 May     , Jennifer Berringer wrote:
> Set the baud rate to 115200, matching what is used by U-Boot on this
> platform so that the console is usable even when console options are not
> specified in cmdline.
> 
> Fixes: bab8dea259100 ("riscv: dts: spacemit: Add OrangePi RV2 board device tree")
> Signed-off-by: Jennifer Berringer <jberring@redhat.com>

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 7c49bce427f30..07dbd292eee33 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -22,7 +22,7 @@ aliases {
>  	};
>  
>  	chosen {
> -		stdout-path = "serial0";
> +		stdout-path = "serial0:115200n8";
>  	};
>  
>  	pcie_vcc3v3: regulator-pcie-vcc3v3 {
> 
> base-commit: e2518e8cb1dde64af2d1bb246639bb7ef7523f7a
> -- 
> 2.53.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
