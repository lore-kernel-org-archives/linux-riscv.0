Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0323CCD18D
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 17:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/p3/H5AC/GeR2i5iWCUSs/numC8lEYoIfzpkrbBpFbo=; b=X6t5iPriKUe4rB
	z1226EjKW3/B+MDyHSfyyJMW1qJXZMRk65W2BdbXzNh+tUJPeOMDc58SZoHenrWRHv5SdckOQSVKC
	WLep+v4U2bhs708JXEAdxyZAl+IqSUxm8XQRedcFPQ676SZlA4ev1Fbqssnlph02UmD7rP+Sr0jNK
	bZ6Kpsvr9IOj5+LO2dLgn30PIqKN4R9+DS/7van+jEcJNgAstTMfJIH0gf0HuWY84rFFPztK4LYtT
	bvEomTydxDAze0wSRlHHgnvgvvy0f3oDgsdBru3JM/YYNN4qfzhKDxcYa0BTdosqDW8e6Mgd64xas
	+JdNno9BKVpI1BCYkFEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Luy-0000000Dxoh-3qr9;
	Mon, 13 Oct 2025 17:01:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Luw-0000000DxoM-1Rnf
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 17:01:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 96D6844CAF;
	Mon, 13 Oct 2025 17:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE13CC4CEE7;
	Mon, 13 Oct 2025 17:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760374861;
	bh=4MFSAeuVpBQvqmqSjyK0yJwFQ/ROFaatrCdCEs5ayzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gohuTDctP/tRfmO3/xVb5WLeKnExyL5x1G4z8tKesogZC8d4hdxZOxFdM3cisefKt
	 vuFy4URynmScK2I3YKULu+SyXWuni0UiHUVIb4AYDxdiTeh77KfNrJLztNYuozvdic
	 XorxEJxxuoWF5RH3CI6IQrlUjn1Dp1HGPiCrJZlMUbSZ5e0aPDwTVpPIbb4FYW/oLy
	 e+m4MrLz/8oMtb5f+zCEjKavwylklTtKXg/cz0NMIGXSdenHO+OIsAfNK6IGgTu/WA
	 yC8jNan0AlVc551WRYrLXhrfL75zzx5R8z0zMVHrNVjV+zBq7C8gHQWbm22idgQSb0
	 SI0Ys/E8n6F5A==
Date: Mon, 13 Oct 2025 10:00:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Yixun Lan <dlan@gentoo.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, elder@riscstar.com,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Guodong Xu <guodong@riscstar.com>
Subject: Re: [PATCH] dmaengine: mmp_pdma: fix DMA mask handling
Message-ID: <20251013170055.GA3968340@ax162>
References: <20250918-mmp-pdma-simplify-dma-addressing-v1-1-5c2be2b85696@riscstar.com>
 <20250930221001.GA66006@ax162>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250930221001.GA66006@ax162>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_100102_446199_2192501F 
X-CRM114-Status: GOOD (  25.36  )
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

Hi Vinod,

On Tue, Sep 30, 2025 at 03:10:01PM -0700, Nathan Chancellor wrote:
> On Thu, Sep 18, 2025 at 10:27:27PM +0800, Guodong Xu wrote:
> > The driver's existing logic for setting the DMA mask for "marvell,pdma-1.0"
> > was flawed. It incorrectly relied on pdev->dev->coherent_dma_mask instead
> > of declaring the hardware's fixed addressing capability. A cleaner and
> > more correct approach is to define the mask directly based on the hardware
> > limitations.
> > 
> > The MMP/PXA PDMA controller is a 32-bit DMA engine. This is supported by
> > datasheets and various dtsi files for PXA25x, PXA27x, PXA3xx, and MMP2,
> > all of which are 32-bit systems.
> > 
> > This patch simplifies the driver's logic by replacing the 'u64 dma_mask'
> > field with a simpler 'u32 dma_width' to store the addressing capability
> > in bits. The complex if/else block in probe() is then replaced with a
> > single, clear call to dma_set_mask_and_coherent(). This sets a fixed
> > 32-bit DMA mask for "marvell,pdma-1.0" and a 64-bit mask for
> > "spacemit,k1-pdma," matching each device's hardware capabilities.
> > 
> > Finally, this change also works around a specific build error encountered
> > with clang-20 on x86_64 allyesconfig. The shift-count-overflow error is
> > caused by a known clang compiler issue where the DMA_BIT_MASK(n) macro's
> > ternary operator is not correctly evaluated in static initializers. By
> > moving the macro's evaluation into the probe() function, the driver avoids
> > this compiler bug.
> > 
> > Fixes: 5cfe585d8624 ("dmaengine: mmp_pdma: Add SpacemiT K1 PDMA support with 64-bit addressing")
> > Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> > Closes: https://lore.kernel.org/lkml/CA+G9fYsPcMfW-e_0_TRqu4cnwqOqYF3aJOeKUYk6Z4qRStdFvg@mail.gmail.com
> > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> 
> Tested-by: Nathan Chancellor <nathan@kernel.org> # build
> 
> It would be great if this could be picked up before the 6.18 DMA pull
> request so that I do not have to patch our CI to avoid this issue.

This patch resolves a (bogus) clang warning that breaks the build with
-Werror. Can you please queue this for a future DMA fixes pull request?
This has been available for almost a month and really should have made
the original 6.18 pull request but I dropped the ball on pinging again
before it went out since I was dealing with Kbuild this cycle.

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
