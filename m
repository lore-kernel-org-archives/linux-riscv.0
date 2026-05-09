Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CD1CD343F
	for <linux-riscv@archiver.kernel.org>; Sat,  9 May 2026 12:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LYmuJ9859Va6Kl0Ca/4PZ4nOc6Y7IOBiXf7RA65LpVY=; b=ON4B+ihkZZXKiR
	XRDLViPanPhpDeb8NZ6iYpePW7q9otT0tJW+k99p8QYMcR93u4eS7bxwG09eeAyXAe6GkK6TgGqQQ
	Lwj1bGvOlC4SBcKWUmcVYRccrBLRlbdYIjILvG+UeTN7rhTe/1ZT11GUCDnP2dFcq/SW7eC4BthFj
	9M9A6VxfpXki2oIKmsBcuVj5xYFZ1OePLsvuRXA51jAaTR/EJV1Pt1OzRQYwWqr/YE3wFagK1IYkc
	s23qgrikbzqvzXnhN4kYwLvMRecS6Nn4ncv6ptiUq7dLJkCissEbbRvOxFA2UnayRdeQdRMX+FshT
	enO58AQ9arbj3Uv84wWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLgT0-00000008tbv-2JcU;
	Sat, 09 May 2026 12:07:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLgSx-00000008tbY-0kb7
	for linux-riscv@lists.infradead.org;
	Sat, 09 May 2026 12:07:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 10A8543F63;
	Sat,  9 May 2026 12:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66FB6C2BCB2;
	Sat,  9 May 2026 12:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778328448;
	bh=+OOyDX3IQBKlPPnum+OZiZP/b9YGU/MTfJLeZadekkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vJULz4BDAIAcuxRXUQ84SFU7F4fQNpTThsNVgLwNgZckeaod6u9/Ng6JiBb80VNLr
	 y9vbMuBv2C1wTXozl0UHEx+TZVG/Dm4i1wxQlLXXhiFRwz95XRUaFIShavsqvirD4H
	 PmsOmXyo3gGTv24sLHUOpsIuqou85IzYSSM84ps7Tr5MumkIVrY6RCbBReznpsrtTM
	 2lvaF8s0bVYrdAqpYrhrtD6D0x96Q/hYBDoK2ozNfI77xTINXD8h2sw13ANVTWXnug
	 xQZ1GBVjWMjr0TTSUyZcmaN+Kv5+1387YuEeNjmsQQ/QQuwqYEOAXR/poCE1x0kYi6
	 nnm0C7HxCdmOA==
Date: Sat, 9 May 2026 12:07:26 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable eMMC for OrangePi RV2
Message-ID: <20260509120726-GKA3601591@kernel.org>
References: <20260509100000.3315109-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260509100000.3315109-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_050731_337649_519F6D37 
X-CRM114-Status: GOOD (  11.85  )
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

Hi Chukun, 

On 18:00 Sat 09 May     , Chukun Pan wrote:
> The OrangePi RV2 board has one eMMC slot, so enable eMMC.
> Tested using a 16 GiB AJTD4R eMMC module.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 3a829e3c9cbc..c95ca38e3d4a 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -78,6 +78,16 @@ &combo_phy {
>  	status = "okay";
>  };
>  
> +&emmc {
> +	bus-width = <8>;
> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;
> +	no-sd;
> +	no-sdio;
> +	non-removable;
> +	status = "okay";
> +};
> +
>  &eth0 {
>  	phy-handle = <&rgmii0>;
>  	phy-mode = "rgmii-id";
> -- 
> 2.34.1
> 
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
