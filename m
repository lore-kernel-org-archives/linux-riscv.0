Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823E4EFCD98
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 10:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7xRWC6dxPZPj6/v/KakToE3Oze+PeLZJqhx8dE5kQ9s=; b=OA+siuPJXcFVqk
	1eXRTPlGoF0OUFGdIOobAp+ziypSScxke6vpt+GtyeIs3F25OOVPeypUd+niK5mS9VBEpd3D5/hvB
	2ixbC+q7yAYdMovzkF9wD/LwvS2RhE0rK4IhhkxPlyo6qPjsoji/lfSPk/zAijpNrUiQSz8LFyhLR
	xhhKLFnF21byd6ocDtydtPribKIWXnh48k1FpnbwWpScS6fSkqjzngxeyvG1J3Ha1PIlPxlCd01+b
	ak4DUM8fEAhFRHO43Ufq2Pdp9x0WtT/JDXVhd8eKe5KYVCdtn6Ohgo+Ko1AUjixM4lXkDD99LGzUU
	r7wvvIwiazxbf+3OqvFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYDS-000000077Ll-0Rha;
	Mon, 09 Mar 2026 10:52:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYDQ-000000077LC-16VE
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 10:52:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B1F8460121;
	Mon,  9 Mar 2026 10:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85023C2BCAF;
	Mon,  9 Mar 2026 10:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773053519;
	bh=1EZLF6reVfsACLYhIQJ/1CQNkvrzppvUxxc05yyeYb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mtnX8aKYF8J8EJ/PpgyRiq1sJOJs0RxjAILcEBg8ndDCUMOUIm4c4qULmL1yXqr9h
	 PpcoPSxnWm2RJ9N4on+2YOGaH6nLDubl/XlkqZXRpBQ8qeI7LWothi+HMFDAYtbq+h
	 B67Wmf3Krm9doChxb7DgFxh6U+qpqgIAkxellFcOFDt4xr+JQbDA0oezgCyDG16Vcp
	 xTU8VXIGGxSzhuVADDudB0w9400TEaMePZNZ8pKf+FgEXqbOjNPHBuf10/Ubkeac3p
	 2Ww3+r0BpAssO5F4qO1VORZEYFO39m7Q3859BFSj1nSiv/0pj4kE5ZrfU8cEcOVsNn
	 R5IHr1/9Ul4QA==
Date: Mon, 9 Mar 2026 18:51:56 +0800
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 1/1] riscv: dts: spacemit: Add 'linux,pci-domain' to
 PCIe nodes for K1
Message-ID: <20260309105156-GKD302167@kernel.org>
References: <20260309030000.1157040-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309030000.1157040-1-amadeus@jmu.edu.cn>
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

On 11:00 Mon 09 Mar     , Chukun Pan wrote:
> The SpacemiT K1 SoC has 3 PCIe EP controller nodes. Add the
> 'linux,pci-domain' property to assign a PCI domain number to
> each of the controllers instead of assigning it randomly.
> 
> This creates a stable sysfs path, allowing userspace scripts
> to reliably target specific PCIe devices (such as PCIe NICs).
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
Looks good to me

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
> Changes in v2:
> - Improve the commit messages
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 529ec68e9c23..d2015201f8e5 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -1033,6 +1033,7 @@ pcie-bus {
>  			#size-cells = <2>;
>  			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
>  				     <0x0 0xb8000000 0x1 0x38000000 0x3 0x48000000>;
> +
>  			pcie0: pcie@ca000000 {
>  				device_type = "pci";
>  				compatible = "spacemit,k1-pcie";
> @@ -1044,6 +1045,7 @@ pcie0: pcie@ca000000 {
>  					    "atu",
>  					    "config",
>  					    "link";
> +				linux,pci-domain = <0>;
>  				#address-cells = <3>;
>  				#size-cells = <2>;
>  				ranges = <0x01000000 0x0 0x00000000 0x0 0x8f002000 0x0 0x00100000>,
> @@ -1087,6 +1089,7 @@ pcie1: pcie@ca400000 {
>  					    "atu",
>  					    "config",
>  					    "link";
> +				linux,pci-domain = <1>;
>  				#address-cells = <3>;
>  				#size-cells = <2>;
>  				ranges = <0x01000000 0x0 0x00000000 0x0 0x9f002000 0x0 0x00100000>,
> @@ -1130,6 +1133,7 @@ pcie2: pcie@ca800000 {
>  					    "atu",
>  					    "config",
>  					    "link";
> +				linux,pci-domain = <2>;
>  				#address-cells = <3>;
>  				#size-cells = <2>;
>  				ranges = <0x01000000 0x0 0x00000000 0x0 0xb7002000 0x0 0x00100000>,
> -- 
> 2.25.1
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
