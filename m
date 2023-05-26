Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3155C7EE23
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 17:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IXiYu5PBJeMBirgyWl1wfixvFh+0ab7pY2YHeo/QEP0=; b=gJ0OxPNTV2XWmg
	/xhtdo/ihAaDke2ONBDDn1L90GmEeMxY6/rHpaeU8C/s9oB9WmTWa6CtosBDg6RPiFDcSZDrGt9Fs
	ZDiWkfUeC/bKU/PKaMtXMAif5q9V0eBtoqioG2y7FdQ75Hw2R78CVrx0L0O4i/c4dvEY4mxAygtPB
	PvfaMDqtfvyhzaNPybl3q5FP2k0+5o1Is9Zs+ZmdqP33PNYQcRRJ0ip1BX/0CZL64OGRvAU+if/S8
	ktkEM59XWgTIsLHc8QjSGxHMTAdIdvLddw1bpOsS9fNj7n2rP7Koj8266X8FhZi1HtZwgf/rWUVju
	lJQcRvnwbRXWg5f89hxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ayP-003Fky-1J;
	Fri, 26 May 2023 17:11:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ayJ-003Fgm-0z
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 17:11:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DCFC6651D3;
	Fri, 26 May 2023 17:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D6FC433EF;
	Fri, 26 May 2023 17:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685121081;
	bh=Sb+M48Kvrrwe56O2VNb3Wy6c5mOmMps4uXhVYIYGrVA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bNCXjNb4yjDWVmK8nVob+9hyyY8G6hAJF9rkXgE10A1fmr6dPhyHr82KyXokkoJMh
	 vhYiAMlsJ3rYifkJ0MND8EjH8qski6jZNSGf0igixo1rRawZRSqTIMCAjQ2CT9Puva
	 9XQTDnC0qD1sU1xQtsN9fHq+BwgScWu+AH510ELfxQhyEvuNEH/PfSoKs/CKXEftJD
	 4Dahcxl81zim9vpr11kdsU6Wcn2yDzsWmbUWvP1nlzU+KniHqHflKWRRPBiOZVdzoc
	 rNsdUj2cRzxWT/HPUhfPbzbFfSIX1tsT0m2qYe6IGpOBWH1FwFTq3cAp99q2kOeYgM
	 CZTuJ2IuA1tSA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH 6/6] riscv: enable DMA_BOUNCE_UNALIGNED_KMALLOC for !dma_coherent
Date: Sat, 27 May 2023 00:59:58 +0800
Message-Id: <20230526165958.908-7-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230526165958.908-1-jszhang@kernel.org>
References: <20230526165958.908-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_101123_386153_EE4DD4FE 
X-CRM114-Status: GOOD (  11.57  )
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
index b958f67f9a12..14f030cd6357 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -260,6 +260,7 @@ config RISCV_DMA_NONCOHERENT
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select DMA_DIRECT_REMAP
+	select DMA_BOUNCE_UNALIGNED_KMALLOC if SWIOTLB
 
 config AS_HAS_INSN
 	def_bool $(as-instr,.insn r 51$(comma) 0$(comma) 0$(comma) t0$(comma) t0$(comma) zero)
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
