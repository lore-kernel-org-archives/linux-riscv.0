Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DE4F532DD
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 06:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HnisGmpMkiavNyuiKcF+gAgDuhl4GCnsJ7BfHitYPRA=; b=FnAO8NfXo4aCex
	BxlH7e/2Ozh/j5k3RAf7Ra9v81PCBTrqZjTzHiFXN203ELh9ub4nF10OYJkZq8fuAwZwJZ4724pDT
	mTYNIQ3SpyXWbXqqQJtbGfoN4aKuWTGoazGjbR+yS8DRl6Osp9VJoWs24dn51lRtdtBgh2ejPToVI
	n/sgpCscEQ6ohEAqvSA5qrIgrFW8K4Uns9f7FaE/05jILguExPZQsf496wEjx0bmUZa8phxM6WKoc
	uGwp7n/9OVaL3pdPavWC7XGCQaxBIP0QeAhb0VcE4XyCDW1Epg+6UWvL3GK24agHe+5XXDZZbSdTU
	flqkJMibjMDtq7KuWaDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4utN-00000000d5X-2CS5;
	Tue, 24 Mar 2026 06:05:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4utL-00000000d59-2Rgc
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 06:05:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D0AF60128;
	Tue, 24 Mar 2026 06:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01700C19424;
	Tue, 24 Mar 2026 06:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774332326;
	bh=GHYCd8DhKH7FMGi+EYhx3JiIcXCyUlisc6Q9Y86WCgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sBw2sgMVR/zTQXLmw8RXpRwD3hZ4sZkbB96sxnm/HdZ90prALXYyih5rs7DyMTKUF
	 hbIUfMQhWp5u728xz98K9Z1PkSEAme4OlrstzTfzpimtjXfebO59Znt3WAcfRTz3YU
	 Q+cTL4XWCQx+ATM5Os7TU97uLORQ/PMjITxv+8oYxm4U5QiV4cYsyiC+Lm/ZqU2dDl
	 /TLyhkE/ivmR5DpltBnTZy6EjxAjUVMtuaAfAr773sqeo/9IILSoE35FOKATX+I4YA
	 GPi+eZlbzYSEubo5guEZRjkBlAozyPBrMNeovq2crIjV+9yc/xPWAJEShoOpvo8tfP
	 HsXMUXpDnriuQ==
Date: Tue, 24 Mar 2026 14:05:24 +0800
From: Yixun Lan <dlan@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alex Elder <elder@riscstar.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH] riscv: dts: spacemit: drop incorrect pinctrl for combo
 PHY
Message-ID: <20260324060524-GKA533070@kernel.org>
References: <20260322202502.2205755-1-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260322202502.2205755-1-aurelien@aurel32.net>
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

On 21:25 Sun 22 Mar     , Aurelien Jarno wrote:
> The combo PHY on the Banana Pi F3 is used for the USB 3.0 port. The high
> speed differential lanes are always configured as such, and do not
> require a pinctrl entry.
> 
> The existing pinctrl entry only configures PCIe secondary pins, which
> are unused for USB and instead routed to the MIPI CSI1 connector.
> 
> Remove this incorrect pinctrl entry.
> 
> Fixes: 0be016a4b5d1b9 ("riscv: dts: spacemit: PCIe and PHY-related updates")
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

Thanks for doing this, I thought Chukun was planing to submit a fix, CC him

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 404b69c47b91f..5790d927b93db 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -81,8 +81,6 @@ usb3_hub_5v: regulator-usb3-hub-5v {
>  };
>  
>  &combo_phy {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pcie0_3_cfg>;
>  	status = "okay";
>  };
>  
> -- 
> 2.51.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
