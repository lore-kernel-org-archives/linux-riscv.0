Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCAFC25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 05:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N6a3UQXDOviCYJ6Kz5qTpznKkbBM4mvV08nJUrtcp7s=; b=dL76wKwRYR6IbO
	q08NbnTNFw4c9tEq0cfhqym7M19hINkZEb8j/YO9EhcxJ1wmb6NuAAKB5sJ7bZBxcGl+pBg7b9+Lo
	lK4+zZCzFy94jl722g+DASt2LIf5TxmpMj3LUrxBrypQpHtdbh8Kzs86YEB/vb5AMshTSrqrWr5Ks
	wpMjXrn33x7dplv94dYZfUIIcrQjIDtFL+ByYuGNscsefOdjRHqQWp6Yy56yDlk4iXs//ks178Y9A
	AQG3FFNtssQ5TIuLRoh7qn7mUr96ILQHKIrCswulykkJP16Zt4DAXZNPu2zS5oT/NEOQlUwYrMMsf
	GQH/r9A6v6+lgMcXRx+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s77XX-00000000YJ8-2g8V;
	Wed, 15 May 2024 05:50:59 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s77XS-00000000YH2-3v7q
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 05:50:58 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1715752248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p2pxGrHqcjpgn9i44FUKrB0I06kYBSdcJdo4aSs08Lg=;
	b=o/bOdpdCDquB2BlFy1SOm8ptdjQk1Wy0EJxJU10EVxhf/3zddi8KYBjen+BJft7tspUzz+
	3TXyQ1tD9gIdLSxQWq5yLiLaHxmW6Gfbik5S8LjQ2d+4SEr+EoYJBRWsTx3oM3kAQOFtzU
	/NajR4h76N+T2SM0/I4Y5CAQhDSRus+mpiKRxsA5UQ8zq617yWUJEfktC/XkfLoqq6vJtX
	VV+YF6ooh4gYzOwEqbhpubpYIJP1D6rn4Ih+LAC1xsh9PA+UNwVOGWaJe8C7iLEvOZInMy
	EjvzsNY4KDpcVCenBLH1JTJO+zkaSD30UYlf5xeF0Ptejdhr0m3kiE21tl3P0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1715752248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p2pxGrHqcjpgn9i44FUKrB0I06kYBSdcJdo4aSs08Lg=;
	b=lYMY5V7KUQISQ2HASD43vvZqJJHHtRBbloeGv92BmKsbcn9ty5ajUkzdhTFvsbAQojHY+e
	JlbaGrUKwJH2R3Dg==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 0/2] riscv: fix debug_pagealloc
Date: Wed, 15 May 2024 07:50:38 +0200
Message-Id: <cover.1715750938.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_225055_273046_16D81427 
X-CRM114-Status: UNSURE (   4.61  )
X-CRM114-Notice: Please train this message.
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

The debug_pagealloc feature is not functional on RISCV. With this feature
enabled (CONFIG_DEBUG_PAGEALLOC=y and debug_pagealloc=on), kernel crashes
early during boot.

QEMU command that can reproduce this problem:
   qemu-system-riscv64 -machine virt \
   -kernel Image \
   -append "console=ttyS0 root=/dev/vda debug_pagealloc=on" \
   -nographic \
   -drive "file=root.img,format=raw,id=hd0" \
   -device virtio-blk-device,drive=hd0 \
   -m 4G \

This series makes debug_pagealloc functional.

Nam Cao (2):
  riscv: force PAGE_SIZE linear mapping if debug_pagealloc is enabled
  riscv: rewrite __kernel_map_pages() to fix sleeping in invalid context

 arch/riscv/mm/init.c     |  3 +++
 arch/riscv/mm/pageattr.c | 28 ++++++++++++++++++++++------
 2 files changed, 25 insertions(+), 6 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
