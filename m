Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B611AEB64DD
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jul 2023 17:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gvfwZquRmUsrTOjmBGdtTWmVi0RkKcSpGWh2LzMo4dk=; b=SZ3SmGANJLMzds
	JsZ3Qro//tQsNlD2OBzojeTcdE5xbOHbuvTQ6sWrteFZHVoBJhqLd07m9qZIsUkI1IoME2jt6/alv
	OZ8oNQ2KR7RNA4HoYiq+d/LcyD51SmX6nCz/ErQwJOAla9X/Hg1HIGjMM93CwJNNiFUDESAdjzleE
	WKrRzIrKVq7ZZ6jhEwa64sS7MBXYXHsst1dMt5WC7KaNvgjP3UwUpw2JvVJybf053uGb0KHRrUDNf
	ESCSAq+KVwfjwVqx24At4Os480uyOs+qu/gC2sQtV76Y2XXztL1oES2aSGJEhc3VPWU0YXmERD8C+
	YIfuu4iL/WcFtI887pJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL5AB-00DDsZ-2I;
	Sun, 16 Jul 2023 17:04:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL59Z-00DDfH-2B
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jul 2023 17:03:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 39AD660DDB;
	Sun, 16 Jul 2023 17:03:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DD4AC433C9;
	Sun, 16 Jul 2023 17:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689527004;
	bh=61mHo/GoVFw4VYteCT18+1hTq6UHmH6Xpf8WnsgzgCo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vO6eZga+ienruHXDg35BGubyuIUJiAL1YyXmXrYs1J5+HGDaEcPgHQZd8pwxYrooU
	 WokiyETebjl6dNFeWMDBANeTWTKKK6r0xK2LOim7QQeW4ErwbKkDrz3HE7rYqIsGQk
	 i0+0+5tduLOS9s/+jgt7iU/eO+2VuQqCXZ2SpN52nQi2K/MzM/a61y1a+6wK3qO4Le
	 4pexAyiwFbgLLRhsLBwnC9qkmh3m4onCefHfdZQk+I8w/86gLggnnFDVKOjBvY+Z0w
	 VxLqk81TpI5mzF8M6jbMYXlurSAViV5kZBzTVsN+YwB7k8XDmTSVDYglr7b807mbpZ
	 7cXMcynUHNwLg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] riscv: enable DMA_BOUNCE_UNALIGNED_KMALLOC for !dma_coherent
Date: Mon, 17 Jul 2023 00:51:47 +0800
Message-Id: <20230716165147.1897-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230716165147.1897-1-jszhang@kernel.org>
References: <20230716165147.1897-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_100326_762895_2418DC9F 
X-CRM114-Status: GOOD (  11.17  )
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

With the DMA bouncing of unaligned kmalloc() buffers now in place,
enable it for riscv when RISCV_DMA_NONCOHERENT=y to allow the
kmalloc-{8,16,32,96} caches. Since RV32 doesn't enable SWIOTLB
yet, and I didn't see any dma noncoherent RV32 platforms in the
mainline, so skip RV32 now by only enabling
DMA_BOUNCE_UNALIGNED_KMALLOC if SWIOTLB is available. Once we see
such requirement on RV32, we can enable it then.

NOTE: we didn't force to create the swiotlb buffer even when the
end of RAM is within the 32-bit physical address range. That's to
say:
For RV64 with > 4GB memory, the feature is enabled.
For RV64 with <= 4GB memory, the feature isn't enabled by default. We
rely on users to pass "swiotlb=mmnn,force" where mmnn is the Number of
I/O TLB slabs, see kernel-parameters.txt for details.

Tested on Sipeed Lichee Pi 4A with 8GB DDR and Sipeed M1S BL808 Dock
board.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4c07b9189c86..6681bd6ed2d7 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -267,6 +267,7 @@ config RISCV_DMA_NONCOHERENT
 	select ARCH_HAS_SETUP_DMA_OPS
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
+	select DMA_BOUNCE_UNALIGNED_KMALLOC if SWIOTLB
 	select DMA_DIRECT_REMAP
 
 config AS_HAS_INSN
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
