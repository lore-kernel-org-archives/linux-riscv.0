Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB08D609D2
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 16:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=groIZV+qaWIX4b5wqrlDfMJJZZlld8clcSfR9YCt0dM=; b=Y6BBt4S+J0ca6A
	uO73Ftb+ok5JKQAefASOdF1OjyGCd1k6z5kButrKuhdMICXABOWOEYzeL4UgRKgNuM8GI6z3BQxrp
	s7Sv3WEkinbku4LXwMlkOrtD2nXx8+43ADYfTo51SODjvXgm2qUgi3145TfYMaqpodGIx23SoZJ5W
	5vbna1kIsYvwEAxVomO+pox1bmUNOWidmIVoPF5ptFCdIEbyLl/Zn+UZ/eCCxESqYJrJtZphPN7sd
	HWFD+37D+jE1VqWeViTSjOyOf+L5otpu1zh0eXArEnfaHsQm65wAs1GF9tiYdYDuSiykdRBD77RJb
	Idb+uEVkZahCWh+3piRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYLa-00000005ZE1-3GNq;
	Tue, 16 Dec 2025 16:56:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYLW-00000005ZDs-2IB6
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 16:56:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AC4366017F;
	Tue, 16 Dec 2025 16:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3838FC4CEF1;
	Tue, 16 Dec 2025 16:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765904181;
	bh=TARPN6Yt6Y6qE5PKNWdfNem27drZ6puaqfrsr4THSbo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cakfrr4xAHefjOXOFgjDWOJ2gW6mWvs0tWBBtjws7vUlwI6o0YZ/zRv43tKtzXUnT
	 h/A3KBw+cNqzfIdGPcLsfTV7lkUUOkDDjrqlnd5DSpjsrXoDtxrInOKJDWsjp5sLcP
	 eCuOS3CC9/Ni37YLAGvZn+s0RJo+n0MeSdc7oxt0AwwcbNybTU588V9eKw11yvyqQ7
	 DGTon/wT3pLxeViHXQyT/A15u/p+RYDGtPUJZH6xRc+2DZDqn2Kn1MsVX5c6dlg7GS
	 52aaf9qUpt6sRZqYvIdW1km6GvFAahtriQK0J8sE10RnjNzpEQ7ZAIrukOQx1W6mt1
	 xyautJitcydMQ==
From: Vinod Koul <vkoul@kernel.org>
To: Yixun Lan <dlan@gentoo.org>, Guodong Xu <guodong@riscstar.com>
Cc: Alex Elder <elder@riscstar.com>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Juan Li <lijuan@linux.spacemit.com>
In-Reply-To: <20251216-mmp-pdma-race-v1-1-976a224bb622@riscstar.com>
References: <20251216-mmp-pdma-race-v1-1-976a224bb622@riscstar.com>
Subject: Re: [PATCH] dmaengine: mmp_pdma: Fix race condition in
 mmp_pdma_residue()
Message-Id: <176590417885.422798.17247803206459718657.b4-ty@kernel.org>
Date: Tue, 16 Dec 2025 22:26:18 +0530
MIME-Version: 1.0
X-Mailer: b4 0.13.0
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


On Tue, 16 Dec 2025 22:10:06 +0800, Guodong Xu wrote:
> Add proper locking in mmp_pdma_residue() to prevent use-after-free when
> accessing descriptor list and descriptor contents.
> 
> The race occurs when multiple threads call tx_status() while the tasklet
> on another CPU is freeing completed descriptors:
> 
> CPU 0                              CPU 1
> -----                              -----
> mmp_pdma_tx_status()
> mmp_pdma_residue()
>   -> NO LOCK held
>      list_for_each_entry(sw, ..)
>                                    DMA interrupt
>                                    dma_do_tasklet()
>                                      -> spin_lock(&desc_lock)
>                                         list_move(sw->node, ...)
>                                         spin_unlock(&desc_lock)
>   |                                     dma_pool_free(sw) <- FREED!
>   -> access sw->desc <- UAF!
> 
> [...]

Applied, thanks!

[1/1] dmaengine: mmp_pdma: Fix race condition in mmp_pdma_residue()
      commit: a143545855bc2c6e1330f6f57ae375ac44af00a7

Best regards,
-- 
~Vinod



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
