Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D67C636CC
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Feb 2023 03:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j7fxJAdtwPuu2OI/bqhto8mokgnltJKQBr+Wfpev5RA=; b=hkHxbh8BzStORc
	p2rdtRxw+NpD6RapCnjvzaK9OcugQb/A1A14429v+NugW0zs+tXiT8GpFXpNgUK/ijbNMi1DJcerr
	d2LvL9lpyCfdyrNV7R3RSv0qDmTAFK3TEpgqjnqtCBiMJ4WkYznofwExux5w7hKrMGZqhAIYRUVcu
	huf46FckEoEEIhCMxf308419gKBxHrJ9jAuVj87FGBNz3DSJHECgJeaDRN/BJhZU145/xsDqvB84Z
	e7A4+iUCZKFJw+T6czFOQ91dQt/OXEUfp+zaMMGqdoCHVPjT4EQPKEvkTkegw/GoXa7KeL7tq2e49
	8ksWHKa6L0oljTa186cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQgZZ-008WOy-A3; Sat, 11 Feb 2023 03:29:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQgPY-008RpU-2G; Sat, 11 Feb 2023 03:18:49 +0000
Received: from localhost (unknown [86.120.32.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8B4A56602125;
	Sat, 11 Feb 2023 03:18:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676085526;
	bh=9SuKyW5m2s3LuV67I9467kX5ZI8GexmXrVSVNnkz2OQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hMTt6dPu/18IXFr94zL95Pql9lUdJQIC8cRbs4VqMuTNSx9GF2XloISZKM+sBOr4u
	 CsboPdGCB0WK1VYgN2LIAMbtwzKUrSMRGelHNbGahZm9MERYVOPB8944+pwz+OX5QY
	 EBjcqKPDg+yy/WacrnF+ow+01z55aOeOlOsdd3WISdMKgdS09bvoU5aZLZej5AIrf1
	 NmctoUae4i0AnT+Vj5b0hIxO2usmUimXWT4H/GLzMlUr+AVnEtuV2SxrbkvvUT7Zjl
	 U/NN9R5hqCyffo4/qvcZlfZbXKDt+Gj2/DfVtf8HPNuY0Wj2mBlmNQdJzIFbBHH9RC
	 rhRwKeCL0yLKg==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 05/12] riscv: Implement non-coherent DMA support via SiFive cache flushing
Date: Sat, 11 Feb 2023 05:18:14 +0200
Message-Id: <20230211031821.976408-6-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_191848_278150_63CF1250 
X-CRM114-Status: GOOD (  11.91  )
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

From: Emil Renner Berthing <kernel@esmil.dk>

This variant is used on the StarFive JH7100 SoC.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/riscv/Kconfig              |  6 ++++--
 arch/riscv/mm/dma-noncoherent.c | 37 +++++++++++++++++++++++++++++++--
 2 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 9c687da7756d..05f6c77faf6f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -232,12 +232,14 @@ config LOCKDEP_SUPPORT
 	def_bool y
 
 config RISCV_DMA_NONCOHERENT
-	bool
+	bool "Support non-coherent DMA"
+	default SOC_STARFIVE
 	select ARCH_HAS_DMA_PREP_COHERENT
+	select ARCH_HAS_DMA_SET_UNCACHED
+	select ARCH_HAS_DMA_CLEAR_UNCACHED
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SETUP_DMA_OPS
-	select DMA_DIRECT_REMAP
 
 config AS_HAS_INSN
 	def_bool $(as-instr,.insn r 51$(comma) 0$(comma) 0$(comma) t0$(comma) t0$(comma) zero)
diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index d919efab6eba..e07e53aea537 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -9,14 +9,21 @@
 #include <linux/dma-map-ops.h>
 #include <linux/mm.h>
 #include <asm/cacheflush.h>
+#include <soc/sifive/sifive_ccache.h>
 
 static bool noncoherent_supported;
 
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 			      enum dma_data_direction dir)
 {
-	void *vaddr = phys_to_virt(paddr);
+	void *vaddr;
 
+	if (sifive_ccache_handle_noncoherent()) {
+		sifive_ccache_flush_range(paddr, size);
+		return;
+	}
+
+	vaddr = phys_to_virt(paddr);
 	switch (dir) {
 	case DMA_TO_DEVICE:
 		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
@@ -35,8 +42,14 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 			   enum dma_data_direction dir)
 {
-	void *vaddr = phys_to_virt(paddr);
+	void *vaddr;
+
+	if (sifive_ccache_handle_noncoherent()) {
+		sifive_ccache_flush_range(paddr, size);
+		return;
+	}
 
+	vaddr = phys_to_virt(paddr);
 	switch (dir) {
 	case DMA_TO_DEVICE:
 		break;
@@ -49,10 +62,30 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 	}
 }
 
+void *arch_dma_set_uncached(void *addr, size_t size)
+{
+	if (sifive_ccache_handle_noncoherent())
+		return sifive_ccache_set_uncached(addr, size);
+
+	return addr;
+}
+
+void arch_dma_clear_uncached(void *addr, size_t size)
+{
+	if (sifive_ccache_handle_noncoherent())
+		sifive_ccache_clear_uncached(addr, size);
+}
+
 void arch_dma_prep_coherent(struct page *page, size_t size)
 {
 	void *flush_addr = page_address(page);
 
+	if (sifive_ccache_handle_noncoherent()) {
+		memset(flush_addr, 0, size);
+		sifive_ccache_flush_range(__pa(flush_addr), size);
+		return;
+	}
+
 	ALT_CMO_OP(flush, flush_addr, size, riscv_cbom_block_size);
 }
 
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
