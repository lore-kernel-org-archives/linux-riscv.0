Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7579FC43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 22:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jD7WKnbOLb/UxUXQTaGGUlAHQKqS407LTvGcY116+DY=; b=B93Yx/lC2IA3cJ
	c3kWMKQfVN8T/9eY2Zvjpb5fHbUYcqRsmbuCJ7ACyIg6r2oQFqnD9G55ufZ83a5hkn42Fty5VFIsW
	cjpQhi1Su6EOOTEmiy3dditsQhtYt8ifsW35OSR/v3jLTaUo5CyTYRU4pVYWuCszk3st2KX4yNJCk
	zgN++FoKgQTb4eObNsr+ub8JgKqb1oq/ZKzTO9WEReMF/1eq5g0c8bgwCCMg9JYECVEZUIZylcwJK
	qETaXiw0fNeHvVFX1V3L5VZHP3bW+k/mw5K+9G1HBrRUVTEpawZSDxLsetn/H/RlmpAxB9SfCqG9A
	6U+BY5X2160zW70ZCbRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiJrF-00000005xuq-0b9t;
	Fri, 10 Jul 2026 22:38:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiJrD-00000005xuW-0SbQ
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 22:38:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 88172438EE;
	Fri, 10 Jul 2026 22:38:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE27C1F000E9;
	Fri, 10 Jul 2026 22:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783723086;
	bh=bT+lBDZmy3qgOlVkIU92FEFu8S6OCaCVxq9KDzjctNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tnws5BCVipZU6j4wfdKOwN1lJ2RzRfJatEeoUES8MFfCI12PozQCI7bF6Crly5qLw
	 0tUGqWfTbOIzA638RAq8Qb7UcUZWQ+g0W3j4uUo91ObrhoPcK4i/vb7fRqcVkseCm1
	 Dx5tKdSe/YeJlAYfTt2vgSvZJ73Qa158aWWwgAAFzZsp9R7W+NRvQ4OjMIAVsWP0xh
	 jdXPIxBFDcfyDi9gZ4F7C4Q8i1OGwF3+GIX2N5+ghGxnglmPljWqNGLCMin7jTi5bx
	 69FTM9oScvgEdqQGgvbI4iA14V/1L+InmA+LXvBCmA/Rl7Nd1/YS1wQLQeCN8LFEhi
	 eSW0guh4SZU/Q==
Date: Fri, 10 Jul 2026 22:38:04 +0000
From: Yixun Lan <dlan@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add enough deassert time for
 the PHY on PICO ITX
Message-ID: <20260710223804-GKB106000@kernel.org>
References: <20260710063314.1030249-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260710063314.1030249-1-inochiama@gmail.com>
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

On 14:33 Fri 10 Jul     , Inochi Amaoto wrote:
> RTL8211F require at least 50ms deassert to guarantee the register
> access, 10ms is only enough for the PHY reset.
> 
IMO, it's kind of too trivial to split into two separate patches,
while duplicating the commit message

> Fixes: 74657a376960 ("riscv: dts: spacemit: Add ethernet device for K3")
If you agree to squash the patches, then should be fine to put both Fixes here
also suggest to adjust title to be more simple and explict
riscv: dts: spacemit: Increase deassert time for PHY RTL8211F

> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
the fix looks good to me, so
Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> index 1eb5abbc61f9..b2a7d2d0d3a8 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -200,7 +200,7 @@ phy0: phy@1 {
>  			reg = <1>;
>  			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
>  			reset-assert-us = <10000>;
> -			reset-deassert-us = <10000>;
> +			reset-deassert-us = <50000>;
>  		};
>  	};
>  };
> -- 
> 2.55.0
> 
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
