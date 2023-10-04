Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDE5E7C4CE
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 15:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sQo9Zizku/urOXFV2oWowlazwbzHS4wnjDicL3PDLb8=; b=HvCKNz3GrEV3fk
	Es82M3UCOVHj/N4yPG2GynvL7iGiJeuzJA/nEz8nGK4Eioks8zN9eDykFuRECNDTfYdswRpj7s7zf
	G5uwk9lUSV5k8ASyf5pYMuUavtKWstybM/QSnCIaLbLngzNPrSMYt5Yo6HPjN/hW1g1DWyCn/WbT/
	vHqtNvwGueI8M4uaag26GJRZT0Y9gusxECi2DGN79qDiihie4DAZgKfhOp1a3OKSlqF1YcPTZYZT7
	+hJEpSPIniiWJEXlXvrRz2B/PzGSRqrDkCftNZEEbdvwYqBWd5m6xR1bPBg/aVPtpGmgAaf61mUqp
	7Nc7iwzPhx3er1fJi+wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3gb-000Kuq-2p;
	Wed, 04 Oct 2023 15:21:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3gY-000KuC-2E
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 15:21:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EFFED61592;
	Wed,  4 Oct 2023 15:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714F4C433C8;
	Wed,  4 Oct 2023 15:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696432873;
	bh=BR+PVMz/ReRBIlT1fOhImOYNK5ZWPSxCh5WYYcVu/ys=;
	h=From:To:Cc:Subject:Date:From;
	b=Chh7oeJ+A4mln+ikBhojpHDOIhJBfLVXn5Ws6cF1qsi1LuJhWKt/H7zp4KUGfv5aH
	 YKMR9ORLbYksk1FP9WZZhXKgAdFi4hNuEq5rAZ54KOAtbsXqdMc67AbjSA1LjWeHL7
	 RuUViLrYsPxjUFx6ewqpeTIXS0RNvGaS8WwAdxXRiCi6RKDBhdlSBGuIPXoxWdXWd1
	 WosubUYRotDeRfR0r8ekOLw7Q4NSQ6JlSEbrLb/NTb5bTJ9YssmeBVLu9e1tVDlVld
	 tCNRqw7X+vWOMQ14fHTv7mcQghtrG8ql6dTzkgZiVpSzlnKoUGutzwuFjKzqzpFqmj
	 bSvA3bz3Hgrqw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>,
	Christoph Hellwig <hch@lst.de>,
	Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH] soc: renesas: make ARCH_R9A07G043 (riscv version) depend on NONPORTABLE
Date: Wed,  4 Oct 2023 23:08:56 +0800
Message-Id: <20231004150856.2540-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_082114_790317_CCC83DEB 
X-CRM114-Status: GOOD (  10.03  )
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

Drew found "CONFIG_DMA_GLOBAL_POOL=y causes ADMA buffer alloc to fail"
the log looks like:
[    3.741083] mmc0: Unable to allocate ADMA buffers - falling back to standard DMA

The logic is: generic riscv defconfig selects ARCH_RENESAS then
ARCH_R9A07G043 which selects DMA_GLOBAL_POOL, which assumes all
non-dma-coherent riscv platforms have a dma global pool, this assumption
seems not correct. And I believe DMA_GLOBAL_POOL should not be
selected by ARCH_SOCFAMILIY, instead, only ARCH under some specific
conditions can select it globaly, for example NOMMU ARM and so on,
because it's designed for special cases such as "nommu cases where
non-cacheable memory lives in a fixed place in the physical address
map" as pointed out by Robin.

Fix the issue by making ARCH_R9A07G043 (riscv version) depend on
NONPORTABLE, thus generic defconfig won't select ARCH_R9A07G043 by
default. And even for random config case, there will be less debug
effort once we see NONPORTABLE is enabled.

Reported-by: Drew Fustini <dfustini@baylibre.com>
Closes: https://lore.kernel.org/linux-riscv/ZRuamJuShOnvP1pr@x1/
Fixes: 484861e09f3e ("soc: renesas: Kconfig: Select the required configs for RZ/Five SoC")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/soc/renesas/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 5a75ab64d1ed..12040ce116a5 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -333,6 +333,7 @@ if RISCV
 
 config ARCH_R9A07G043
 	bool "RISC-V Platform support for RZ/Five"
+	depends on NONPORTABLE
 	select ARCH_RZG2L
 	select AX45MP_L2_CACHE if RISCV_DMA_NONCOHERENT
 	select DMA_GLOBAL_POOL
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
