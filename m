Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D07C27C53
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jun 2024 22:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s+lQrb4TJKRfsyQqC2Euj/oxSGYP1lyrFCRLbIeUbss=; b=I0LnGeMzHijlaY
	Cv2NcohFGMdAMYWzZVIoozBqRVK4FpStbcJ0lzKJ1YscYUYt7lDtQWavSV7JE0fCidZ99isLEzCFv
	t9WZDIRqxFEZRnZWoW4KVHCavVjTPkUFfJTE9yXlelhV5M0B+lqgYIhLW7ynONDAmzuWOSsu/u5Tv
	V8Bdb1h1OV6topfOIWxCbvfKzUP3RO1Is+4zvzgQ6UpR73jYqqWly3pBQi6EeHgtZQZKOqvqbRcSE
	Kn0EElb7RLd1ZOH8aZ2MaXO/mEiCQWMqsGGh7t5UK9Ll1c2EyII81GQgrl5RvKW8uYmVJGCmUvOGf
	iifDJK22oZazr9Ez8nOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIyQ1-00000008RPr-2so4;
	Sun, 16 Jun 2024 22:32:13 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIyPz-00000008RPP-07pS
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jun 2024 22:32:12 +0000
Date: Sun, 16 Jun 2024 22:31:49 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup.patel@wdc.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 8/9] riscv: dts: spacemit: add Banana Pi BPI-F3 board
 device tree
Message-ID: <20240616223149.GB3983622@ofsar>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
 <tencent_904B1050FBC0B10A172C263924BD518F8F05@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_904B1050FBC0B10A172C263924BD518F8F05@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_153211_124798_4DFD5F2F 
X-CRM114-Status: GOOD (  16.24  )
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

Hi

On 01:20 Mon 17 Jun     , Yangyu Chen wrote:
> Banana Pi BPI-F3 [1] is a industrial grade RISC-V development board, it
> design with SpacemiT K1 8 core RISC-V chip [2].
> 
> Currently only support booting into console with only uart enabled,
> other features will be added soon later.
> 
> [1] https://docs.banana-pi.org/en/BPI-F3/BananaPi_BPI-F3
> [2] https://www.spacemit.com/en/spacemit-key-stone-2/
> 
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> ---
>  arch/riscv/boot/dts/Makefile                 |  1 +
>  arch/riscv/boot/dts/spacemit/Makefile        |  2 ++
>  arch/riscv/boot/dts/spacemit/bananapi-f3.dts | 19 +++++++++++++++++++
>  3 files changed, 22 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/spacemit/Makefile
>  create mode 100644 arch/riscv/boot/dts/spacemit/bananapi-f3.dts
> 
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index fdae05bbf556..bff887d38abe 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -5,6 +5,7 @@ subdir-y += microchip
>  subdir-y += renesas
>  subdir-y += sifive
>  subdir-y += sophgo
> +subdir-y += spacemit
>  subdir-y += starfive
>  subdir-y += thead
>  
> diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
> new file mode 100644
> index 000000000000..5c512f4e297d
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_SPACEMIT) += bananapi-f3.dtb
Can we have "k1" prefix at least? so k1-bananapi-f3.dtb
it's much clear to let people know the board has k1 SoC,
in case vendor has more chip series..

> diff --git a/arch/riscv/boot/dts/spacemit/bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/bananapi-f3.dts
> new file mode 100644
> index 000000000000..023274189b49
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/bananapi-f3.dts
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
> + */
> +
> +#include "k1.dtsi"
> +
> +/ {
> +	model = "Banana Pi BPI-F3";
> +	compatible = "bananapi,bpi-f3", "spacemit,k1";
> +
> +	chosen {
> +		stdout-path = "serial0";
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> -- 
> 2.45.1
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
