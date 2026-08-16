Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9906DC5DF66
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Aug 2026 08:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Ox4a4+iGvrx871ceSq7CIC1GviqwbQoCdUQTaZQ2hI=; b=GrRM9YcSOuyTJe
	mYTZ6oQeRniMtPENlbS4NA/Hd4EtabJnL+nGEJDCIarORe+nZSeNb9Lr2ID3809KYev8KhF7DakOV
	mHZS2Rhqf/AMszzuHKZxEfHjH9vd99BNeYVET/hvH0pxp+gZpzF1mk1NKfSzwduckjc0feKDxrgck
	gPFTc2kgGytuTF0fkCSz5BGJSlmGiBWgTI0pCaYmt/GY1unB5lMlhU5wMMEroqct5Ve2T/u6/Vzxk
	wvPs5dwFZBIifq6GFm7baWsw7AAS/yx4/oj3YdBDGDCizyX9pVMm2eAjBALakQu0x9UI6hJnLX2N1
	sMsR3v5P3v/M+jU5SI7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvWQ4-00000004adw-2yrn;
	Sun, 16 Aug 2026 08:40:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvWQ3-00000004adp-2fcp
	for linux-riscv@lists.infradead.org;
	Sun, 16 Aug 2026 08:40:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A3BC9401CC;
	Sun, 16 Aug 2026 08:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE8661F000E9;
	Sun, 16 Aug 2026 08:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786869637;
	bh=11Tl+8QITJlApV/arZRysuZlEcln9IcnFTpqE9Wj410=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GAEIP+fJLQsJweuQV2dasPDpw0vzWVP6I6DYe6tcHmKd61IpmwqVL1Kr/AgnCGCRO
	 scYIXIp6hwMYXZDOcsv8BOL+vkV9kbpvb3gPGV6f7xumpDB0z6F4B8lWzoOsc1g7wA
	 bZYyt/h0L7bbugcJ9gWYpVH0HQFwbgGcSjxoBk1+y1mODUemZwKXpxV0zX2Xz0OuSK
	 Yrd6pdUk3UuPKr3jOYVWkFIRRuY/JUBgwKVAXASxvxzvTNx4WeYQEW+o6vjDzA7lmK
	 OGyYg9nwTv2VSLOpO4IuUdbu09SBP0XrWlXDRpiGg7Y3ItE2EaA17dFhvuyrRe7f3V
	 EeLoa156ujwGA==
Date: Sun, 16 Aug 2026 08:40:34 +0000
From: Yixun Lan <dlan@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	spacemit@lists.linux.dev, stable@vger.kernel.org,
	Guodong Xu <docular.xu@gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: fix IMSIC guest parameters
Message-ID: <20260816084034-GKC318749@kernel.org>
References: <20260816074125.2105828-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260816074125.2105828-1-guoren@kernel.org>
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

hi Guo,

On 07:41 Sun 16 Aug     , Guo Ren wrote:
> From: "GUO Ren (XuanTie)" <guoren@kernel.org>
> 
> The initial K3 device tree used generic/placeholder values for the
> IMSIC guest configuration:
> 
>   riscv,guest-index-bits = <6>;
>   riscv,num-guest-ids    = <511>;
> 
> According to the SpacemiT K3 User Manual [1] these values are
> incorrect for the X100 cores:
> 
>  - Hypervisor Extension: RVH 1.0, GEILEN = 8
>  - Advanced Interrupt Architecture (AIA):
>     - M-mode MSI: 512
>     - S-mode MSI: 512
>     - VS-mode MSI: 64
> 
> Therefore:
> 
> - S-mode IMSIC (simsic) only needs guest-index-bits = 3 (to cover
>   GEILEN = 8) and num-guest-ids = 63.
..
> - M-mode IMSIC (mimsic) does not implement guest interrupt files at
>   all, so the guest-related properties must be omitted.
> 
Cc Junhui

There is already one fix for IMSIC [1], but it's actually too late to
pick for v7.3 .. I'm not sure how best to handle this, would it possible
on your side to pick Junhui's patch and rework to combine them to 
send a V2? or I could pick his patch first ..

https://lore.kernel.org/all/20260729-k3-mimsic-fix-v1-1-368c0aec04b9@pigmoral.tech/ 

> Although the KVM AIA driver will re-detect the actual number of guest
> interrupt files via hgeie and correct guest-index-bits at runtime, the
> device tree should still describe the correct hardware parameters.
> 
> Update the device tree to match the silicon.
> 
..
> [1] https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/08_cpu.md
> 
no blank line and use "Link: https://.. [1]" format

> Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3 SoC")
> Cc: stable@vger.kernel.org
> Cc: Guodong Xu <docular.xu@gmail.com>
> Cc: Yixun Lan <dlan@kernel.org>
> Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index 19fc9b49668e..4120eb0c4083 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -1127,9 +1127,9 @@ simsic: interrupt-controller@e0400000 {
>  					      <&cpu4_intc 9>, <&cpu5_intc 9>,
>  					      <&cpu6_intc 9>, <&cpu7_intc 9>;
>  			msi-controller;
> -			riscv,guest-index-bits = <6>;
> +			riscv,guest-index-bits = <3>;
>  			riscv,hart-index-bits = <4>;
> -			riscv,num-guest-ids = <511>;
> +			riscv,num-guest-ids = <63>;
>  			riscv,num-ids = <511>;
>  		};
>  
> @@ -1168,9 +1168,7 @@ mimsic: interrupt-controller@f1000000 {
>  					      <&cpu4_intc 11>, <&cpu5_intc 11>,
>  					      <&cpu6_intc 11>, <&cpu7_intc 11>;
>  			msi-controller;
> -			riscv,guest-index-bits = <6>;
>  			riscv,hart-index-bits = <4>;
> -			riscv,num-guest-ids = <511>;
>  			riscv,num-ids = <511>;
>  			status = "reserved";
>  		};
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
