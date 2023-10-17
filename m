Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC6DCDB482
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 13:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a0KBD4ukic7I2mlA0yswHd1GRVdMUNpf3+nnjvvqn8w=; b=Dph00gZ8NiK0rP
	lMCpmNIZvhCQ4Lpw8GE7XHWWRdqUG7W1NVsHXuxFZzYrHmYnIkY+QGjY1yi3F8fnY2Kk7zDKdk7CX
	YMcArX4C3rC2ee+n1qnurO5Chw2rBXcpnALUjWPWkza8XWmVQAGbYp4nSlKbGdfVX+Gl3iTvG2JUY
	aqYbM2XTxGvxM1Rct5C9S9ZcPOKX2VYgVyyvYG+nEOelIZ9UhVBUM5ID8A7pgnoy3qasPdKV3wHWU
	z/9Fo/xXUplVSRwVv2+vplKT7XFIdyJfxovqSnRih7rRxsKDtblfIWKPPpUGVJRZt2EtxL+TiDcSO
	0578PrmKBBiQnopelQqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qskbm-00CTXy-1C;
	Tue, 17 Oct 2023 13:59:42 +0000
Received: from 213-147-166-120.nat.highway.webapn.at ([213.147.166.120] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qskbk-00CTXE-18;
	Tue, 17 Oct 2023 13:59:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/3] riscv: only select DMA_DIRECT_REMAP from RISCV_ISA_ZICBOM
Date: Tue, 17 Oct 2023 15:59:25 +0200
Message-Id: <20231017135926.1240101-3-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017135926.1240101-1-hch@lst.de>
References: <20231017135926.1240101-1-hch@lst.de>
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

RISCV_DMA_NONCOHERENT is also used for whacky non-standard
non-coherent ops that use different hooks in dma-direct.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0ac0b538379718..9c48fecc671918 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -273,7 +273,6 @@ config RISCV_DMA_NONCOHERENT
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select DMA_BOUNCE_UNALIGNED_KMALLOC if SWIOTLB
-	select DMA_DIRECT_REMAP if MMU
 
 config RISCV_NONSTANDARD_CACHE_OPS
 	bool
@@ -549,6 +548,7 @@ config RISCV_ISA_ZICBOM
 	depends on RISCV_ALTERNATIVE
 	default y
 	select RISCV_DMA_NONCOHERENT
+	select DMA_DIRECT_REMAP
 	help
 	   Adds support to dynamically detect the presence of the ZICBOM
 	   extension (Cache Block Management Operations) and enable its
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
