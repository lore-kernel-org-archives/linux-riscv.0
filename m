Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EBBEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 05:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5HX3X/z3ovKQoQ1qMH+FR4whcMTcIujsPdjzMwrCd2w=; b=LBRykMwDfH298e
	pobSRA0ETR/9cBIKFLga+2kzBAOYkVaEc0s4/XaDawAsqWEPJ2xYpZrfPTba4w9m8w412xC8n7AID
	TxuKiCkWI4lS2wisqkEWqI0Lq0FAaOcqBG74cdycGo7HuVdud740t1t2DLoBQaMOMye7/v40KYCPg
	KRgAHUUxs+/ZLchFG5xaykh8GUFPaITCyhq+jlaEFHjbmrJwTYg4IeAH12UWlpFD3KbHggsPLOC8U
	2IJ9wbHJm8P16m5ASRpMchAszjIvlcDjfNLlq4XuZJtr6t1+HdSv0SJevfhc07OkcNRuPpeApaYoX
	+3ubTSwCIWO0LsRq+hkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzbQ-005DoQ-1n;
	Wed, 19 Jul 2023 05:19:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzbI-005Di0-0h
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:19:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zV5zqI83iPv7AITQY55QeT+k9nsbrdlD6lFEUZyFCiE=; b=EQReZD/98wFeKCHeExtmz9X8j9
	5ZykumVXSuH4SXyHJAQPNcSUCeOKueQbm4mVFYAaKvgT7AMAZTwr5dMgLlUWwbqL7rXbSf3mPRC4p
	qtZOjqbDUJT5FDX/GQnA9Viynn6xcSMZCs4wOwO3MKTyRkHbtoRgXiW3Vne1AY9wouHBzckoAsvWv
	Jr6TJF0rAK0NGeQsTkiER4UtObxtLLNHcGukOfDBJ547IaDmu5JQ4Wph7qXCXhBVdZYSiKc4ttwfu
	iT9MNCZzu0zKzbpG2xMR9RkNXkDSICIzge7A9hv10PntnetYjjLfU+riRLzY6JZPq83TD914XxHrB
	0iDwYhWw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLmiV-00BhWv-1Z
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 15:34:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7874E6164B;
	Tue, 18 Jul 2023 15:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC4A2C433C8;
	Tue, 18 Jul 2023 15:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689694430;
	bh=mqwYcIZH+M6h8d7AW+YLg7/JE8kUv6dByMB/fsXMe5E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZauC2YoS57Y7Z75WX93K8wwq6vCm7vKYIrjQ7e1PVKNVB9oFy4zuFqlAHt/o9u8ig
	 +jHL7t3YG0DIEB6aHqFTmfny58qvFcbf5CIXyGWvdZTy1e53lTQ536dn67rE17C/nX
	 tNSMeABCJ0uBzJAhNRUYMbCjBerE73usUmO+jRF0pZkGkqrR+kns0jDAsySb5rrjm0
	 vJ0c0tNKTFlWD33YC5Vz/yDQMvPds538rFQgalIrZPB3wuBc466LP3kRSqQwFP4Ch0
	 oEvk6Z0ioJ5Hc+hwquvbxlp6Z83T51FMAMWjgZo4xqIpfbbJNOElQr6m7JucSJtx3Y
	 kYKEx/dV4ZjKQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/2] riscv: enable DMA_BOUNCE_UNALIGNED_KMALLOC for !dma_coherent
Date: Tue, 18 Jul 2023 23:22:14 +0800
Message-Id: <20230718152214.2907-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230718152214.2907-1-jszhang@kernel.org>
References: <20230718152214.2907-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_163423_908564_B869AA05 
X-CRM114-Status: GOOD (  11.09  )
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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
