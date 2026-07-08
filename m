Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDC2C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 17:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fa/J9oLmcscRWJd0t1E1XPLWGiZmoL9J0+LTvjJRoaA=; b=nLaBMGMnztwKgg
	OuqH3nSOCEXU4RjfqAdSnnFdys/7X47aJjiR4DZDqWilZzqLvWwyAiiMB7yn72BvNOvpo7VYQOBUN
	4flp6lsJwf9MebKL8/pCqtxiOJGd+eiGb6UEq4AS0CUB3SYPWXV+6iDcACGtiZ55/qKHitaMg6xAx
	2LcSB5TOa+LMUi5t75hbRsBidKGbFf/868wFk5YZKtyNVPC8j8DR0FffwrE4QHPyw7dGKZtvUJ5Kd
	g2bUsYSnxvKe1BbpKzbni7t1f5pMUkssO8uIL0+nhtnE5qpzuZK0U6iJJvJGKSG+SD+aPNF10uac7
	b8vxciqypqWg3b0iQYSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whWES-000000007lj-1u62;
	Wed, 08 Jul 2026 17:38:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whWEQ-000000007lb-3pKp
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 17:38:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A867543A08;
	Wed,  8 Jul 2026 17:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D74C1F00A3A;
	Wed,  8 Jul 2026 17:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783532326;
	bh=9V10ZeP0GQsP4iVy9VhSI/lI04caCn9a45QxaUqe0d4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=GVDBTL44OP6LCxySK26ft2Tytx+EtFDjg9GBcLEPtmPXNtO4nZrkUiCTksePT/rh3
	 9R4pClvgn9g+HVbv1etI4tL1gUwaoPzNHjUNqgktAKydRY4yACmbneBzRedMNOoXh3
	 qcjiIUT56Rh3exJv5P1IK6WOUqRgFR27VqdiobA3IdVLmf9IGjgIzmgnfFIhQb8pF5
	 PgvP7Dw1y+ZVS4qWTi3+aUZXiA7cEJUB9IJP/yqXSgFC+8NcBqD/OrQ/Auh56PXkxT
	 wAkvhazebXOv6ZkfdfmY+cjIPBzNB2lSg1kokiq9GTohZ1a8k5ZEI/29yvL1RQOrOQ
	 3YxpvjCzYuDhQ==
Date: Wed, 8 Jul 2026 11:38:44 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Jia Wang <wangjia@ultrarisc.com>
cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, 
    Bartosz Golaszewski <brgl@kernel.org>, 
    Samuel Holland <samuel.holland@sifive.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
    devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 9/9] riscv: defconfig: enable ARCH_ULTRARISC
In-Reply-To: <177995553472.929162.16657480414876825285.b4-reply@b4>
Message-ID: <d23703f7-29c3-c1f9-6f6b-80e155c56746@kernel.org>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com> <20260515-ultrarisc-pinctrl-v1-9-bf559589ea8a@ultrarisc.com> <1b822b1e-cf1c-45c7-8109-3e0330911419@kernel.org> <177995553472.929162.16657480414876825285.b4-reply@b4>
MIME-Version: 1.0
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

On Thu, 28 May 2026, Jia Wang wrote:

> On 2026-05-21 22:57 +0200, Krzysztof Kozlowski wrote:
> > On 15/05/2026 03:18, Jia Wang via B4 Relay wrote:
> > > From: Jia Wang <wangjia@ultrarisc.com>
> > > 
> > > Enable `ARCH_ULTRARISC` in the default RISC-V defconfig.
> > > 
> > > Link: https://lore.kernel.org/lkml/20260427-ultrarisc-pcie-v4-1-98935f6cdfb5@ultrarisc.com/
> > 
> > Drop link, not relevant here.
> >
> 
> Will drop the link, thanks.
>  
> > > 
> > > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> > > ---
> > >  arch/riscv/configs/defconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > > index c2c37327b987..9fdc4d1831ed 100644
> > > --- a/arch/riscv/configs/defconfig
> > > +++ b/arch/riscv/configs/defconfig
> > > @@ -32,6 +32,7 @@ CONFIG_SOC_STARFIVE=y
> > >  CONFIG_ARCH_SUNXI=y
> > >  CONFIG_ARCH_TENSTORRENT=y
> > >  CONFIG_ARCH_THEAD=y
> > > +CONFIG_ARCH_ULTRARISC=y
> > 
> > This patch should be sent with with the patch adding that config option.
> >
> 
> Ack, will include it in the same series as the config option patch.

I've pulled this out, dropped the link, and queued it for v7.2-rc along 
with the arch/riscv/Kconfig patch.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
