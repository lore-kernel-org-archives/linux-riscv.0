Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6CDCDB484
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 13:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oPU4+Q/8HykngUU7EuaKdIGp7yS5LHNh0JXuz4Q/xnw=; b=ihvySS2S4hEfEp
	LD8WeawS6cVQyd7761xeSoBtdqMaqSTTjRgZqR78GiQzQec8pbkH98mhihb6FKUF+TD2SXIEz25b7
	x5mHPilbTHMB5dCG+ZjVlNeIW8C/F52eKcvuz9JKaUB3dTiwLkgA2FMjgWeEgB2w93LXNiIAaVrIU
	VbqNpbnMN6pPbM7U1yL9s766FYuRqiQFpfm2tf34khSHM483RolblW0IobCw9NUleewbCMoIY5dvk
	TZvVIcqOqrSHawwzoxAxePKSsjOqfnXv4MK8elK28a/U1BlcYZ7WF9AKD08jD0u1E2Kt/MfS/VTLB
	trjALWfBaNLJusED9qMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qskbi-00CTXJ-2I;
	Tue, 17 Oct 2023 13:59:38 +0000
Received: from 213-147-166-120.nat.highway.webapn.at ([213.147.166.120] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qskbg-00CTWU-08;
	Tue, 17 Oct 2023 13:59:36 +0000
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH 1/3] riscv: RISCV_NONSTANDARD_CACHE_OPS shouldn't depend on RISCV_DMA_NONCOHERENT
Date: Tue, 17 Oct 2023 15:59:24 +0200
Message-Id: <20231017135926.1240101-2-hch@lst.de>
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

RISCV_NONSTANDARD_CACHE_OPS is also used for the pmem cache maintenance
helpers, which are built into the kernel unconditionally.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig    | 1 -
 drivers/cache/Kconfig | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d607ab0f7c6daf..0ac0b538379718 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -277,7 +277,6 @@ config RISCV_DMA_NONCOHERENT
 
 config RISCV_NONSTANDARD_CACHE_OPS
 	bool
-	depends on RISCV_DMA_NONCOHERENT
 	help
 	  This enables function pointer support for non-standard noncoherent
 	  systems to handle cache management.
diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
index a57677f908f3ba..d6e5e3abaad8af 100644
--- a/drivers/cache/Kconfig
+++ b/drivers/cache/Kconfig
@@ -3,7 +3,7 @@ menu "Cache Drivers"
 
 config AX45MP_L2_CACHE
 	bool "Andes Technology AX45MP L2 Cache controller"
-	depends on RISCV_DMA_NONCOHERENT
+	depends on RISCV
 	select RISCV_NONSTANDARD_CACHE_OPS
 	help
 	  Support for the L2 cache controller on Andes Technology AX45MP platforms.
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
