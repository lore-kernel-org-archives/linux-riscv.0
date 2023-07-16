Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3886C001DE
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jul 2023 17:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ck4vi1MfjwLARBuIaeRowbDGHV/RJOrQEwiFFI2AeuY=; b=O6APtMGhcoW6Yh
	qM8INoh1aNWvJM77qn+ZweQPAewZ487fHOb2538DzuCWsbIUlrqcKi4dtVT2oU3f43p0snbWwpv/A
	SAXvstTmlKzXFjOToUPAS9CRpNJVFT7B6SbdB18Xf4F25iUXSgJ5PvGdhRnDCSb/pI4RqX7iaoLXq
	FMNlKiNeDhMzfpSB986D86eqMCcOzZRm9UftvxjIPNSfvbjpetb9rAj/y07TeESgWVODc0LBH5ZLn
	AjU4VshhRZ9zpSYBbxiDl+omzRQzhiU+/g8mExgIcnFUs8kmv/CawdxFqUP6MfdEcMPk7fUBWfFFF
	E6itaJTkLCZzBKEhvaEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL59y-00DDlr-34;
	Sun, 16 Jul 2023 17:03:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL59Y-00DDeN-0y
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jul 2023 17:03:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 77B4160DCB;
	Sun, 16 Jul 2023 17:03:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D8CC433C7;
	Sun, 16 Jul 2023 17:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689527002;
	bh=R60+V/37UOZT1DTXQO/7MNYMa4wOfYncK+58obmAxSE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WUGEipBanle9RykyLDUpv89TBYjl9dD8EuRLFheAN90H2eFCNdnB+1lFFtiSAMgBq
	 gE1IQNFslmIewyDH0wf5JNHioaV/ZtDHslPdKzF98jYnNxI0+Fc7rll2rUImziPxew
	 5gexT7/ZZODPt8EdF4CVrcWCE29G0qIk7l9kIwfqgMoK851S/Du2p1af3z/vD7pIsq
	 ClDkFRfyLbFNW85ZLU1Rw3lVYIZ/THesHI1B9/tLf1yBLHxfmsFjll1yyHcVXksg6b
	 ggo3OyWtGeVFYCI8OsEcWQ6bV4H2NiJ1Y2bfgCeIuQSKmG9+oiv4JwbsG2i8EnEAw2
	 mB8SUULb/TmNw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] riscv: allow kmalloc() caches aligned to the smallest value
Date: Mon, 17 Jul 2023 00:51:46 +0800
Message-Id: <20230716165147.1897-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230716165147.1897-1-jszhang@kernel.org>
References: <20230716165147.1897-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_100325_320230_E397BF65 
X-CRM114-Status: GOOD (  17.55  )
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

Currently, riscv defines ARCH_DMA_MINALIGN as L1_CACHE_BYTES, I.E
64Bytes, if CONFIG_RISCV_DMA_NONCOHERENT=y. To support unified kernel
Image, usually we have to enable CONFIG_RISCV_DMA_NONCOHERENT, thus
it brings some bad effects to coherent platforms:

Firstly, it wastes memory, kmalloc-96, kmalloc-32, kmalloc-16 and
kmalloc-8 slab caches don't exist any more, they are replaced with
either kmalloc-128 or kmalloc-64.

Secondly, larger than necessary kmalloc aligned allocations results
in unnecessary cache/TLB pressure.

This issue also exists on arm64 platforms. From last year, Catalin
tried to solve this issue by decoupling ARCH_KMALLOC_MINALIGN from
ARCH_DMA_MINALIGN, limiting kmalloc() minimum alignment to
dma_get_cache_alignment() and replacing ARCH_KMALLOC_MINALIGN usage
in various drivers with ARCH_DMA_MINALIGN etc.[1]

One fact we can make use of for riscv: if the CPU doesn't support
ZICBOM or T-HEAD CMO, we know the platform is coherent. Based on
Catalin's work and above fact, we can easily solve the kmalloc align
issue for riscv: we can override dma_get_cache_alignment(), then let
it return ARCH_DMA_MINALIGN at the beginning and return 1 once we know
the underlying HW neither supports ZICBOM nor supports T-HEAD CMO.

So what about if the CPU supports ZICBOM and T-HEAD CMO, but all the
devices are dma coherent? Well, we use ARCH_DMA_MINALIGN as the
kmalloc minimum alignment, nothing changed in this case. This case
can be improved in the future.

After this patch, a simple test of booting to a small buildroot rootfs
on qemu shows:

kmalloc-96           5041    5041     96  ...
kmalloc-64           9606    9606     64  ...
kmalloc-32           5128    5128     32  ...
kmalloc-16           7682    7682     16  ...
kmalloc-8           10246   10246      8  ...

So we save about 1268KB memory. The saving will be much larger in normal
OS env on real HW platforms.

[1] Link: https://lore.kernel.org/linux-arm-kernel/20230524171904.3967031-1-catalin.marinas@arm.com/

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Change-Id: Ica249d0f8058a02bd4bc6543b4ffc2946a4734a2
---
 arch/riscv/include/asm/cache.h      | 14 ++++++++++++++
 arch/riscv/include/asm/cacheflush.h |  2 ++
 arch/riscv/kernel/setup.c           |  1 +
 arch/riscv/mm/dma-noncoherent.c     |  8 ++++++++
 4 files changed, 25 insertions(+)

diff --git a/arch/riscv/include/asm/cache.h b/arch/riscv/include/asm/cache.h
index d3036df23ccb..2174fe7bac9a 100644
--- a/arch/riscv/include/asm/cache.h
+++ b/arch/riscv/include/asm/cache.h
@@ -13,6 +13,7 @@
 
 #ifdef CONFIG_RISCV_DMA_NONCOHERENT
 #define ARCH_DMA_MINALIGN L1_CACHE_BYTES
+#define ARCH_KMALLOC_MINALIGN	(8)
 #endif
 
 /*
@@ -23,4 +24,17 @@
 #define ARCH_SLAB_MINALIGN	16
 #endif
 
+#ifndef __ASSEMBLY__
+
+#ifdef CONFIG_RISCV_DMA_NONCOHERENT
+extern int dma_cache_alignment;
+#define dma_get_cache_alignment dma_get_cache_alignment
+static inline int dma_get_cache_alignment(void)
+{
+	return dma_cache_alignment;
+}
+#endif
+
+#endif	/* __ASSEMBLY__ */
+
 #endif /* _ASM_RISCV_CACHE_H */
diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index 8091b8bf4883..c640ab6f843b 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -55,8 +55,10 @@ void riscv_init_cbo_blocksizes(void);
 
 #ifdef CONFIG_RISCV_DMA_NONCOHERENT
 void riscv_noncoherent_supported(void);
+void __init riscv_set_dma_cache_alignment(void);
 #else
 static inline void riscv_noncoherent_supported(void) {}
+static inline void riscv_set_dma_cache_alignment(void) {}
 #endif
 
 /*
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 971fe776e2f8..027879b1557a 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -311,6 +311,7 @@ void __init setup_arch(char **cmdline_p)
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
 	    riscv_isa_extension_available(NULL, ZICBOM))
 		riscv_noncoherent_supported();
+	riscv_set_dma_cache_alignment();
 }
 
 static int __init topology_init(void)
diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index d51a75864e53..811227e54bbd 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -11,6 +11,8 @@
 #include <asm/cacheflush.h>
 
 static bool noncoherent_supported __ro_after_init;
+int dma_cache_alignment __ro_after_init = ARCH_DMA_MINALIGN;
+EXPORT_SYMBOL(dma_cache_alignment);
 
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 			      enum dma_data_direction dir)
@@ -78,3 +80,9 @@ void riscv_noncoherent_supported(void)
 	     "Non-coherent DMA support enabled without a block size\n");
 	noncoherent_supported = true;
 }
+
+void __init riscv_set_dma_cache_alignment(void)
+{
+	if (!noncoherent_supported)
+		dma_cache_alignment = 1;
+}
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
