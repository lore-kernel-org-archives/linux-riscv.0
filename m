Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F8CC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 11:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Buj5NswBYjd96hF6YOhvmJWU9Zog+QOn9MZPAPCkwIc=; b=G0M6WlJzNg3uSI
	tDlx5iDA1j4188EeOL8AgfvXYylMurOcekshoWYumhEVU5Q4SrDzjplaRBtHtR//VYJdODYAqPLp1
	7SgWp+k/OSTmyW8lgqX8YAfsBDIgr9LSCu5UTICW8GUfJ26nUE/jNqMw1JEMjsGTww8oYZhPEpMff
	zpQK6+/ddyeXGYZVy+MZevgX2vwGvwIChNJFrY8s0fjPRtnhVYR+m9/07tvrA/MeVSm0XrAGQkueV
	j8qNHx9NhVB85zUBU5juxSt+RF89ajOPhAKOu5/q25nAbBVWmcQ42STKu85xPetg4XMbAsapBT4oK
	6zFULhTjzIZEMSBKZnCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4hPL-00ExPf-22; Mon, 12 Dec 2022 11:55:43 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4hPF-00ExHU-B2
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 11:55:39 +0000
Received: by mail-wm1-x332.google.com with SMTP id h8-20020a1c2108000000b003d1efd60b65so4942770wmh.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 03:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/owj4dKvul9yQPdKIbLIisU85z4JvHjwmNbR5T/KcKc=;
        b=m828u87ePEdiN6J0F0mBLEBYWQ0Duzd4VUVie1oA/kVzMdFM5unYTFiCddppiMFcDn
         dSgkjg/l30yaUj6ts2pAfz2D7RTl4oq2svJ05PYyCYnssrAzspJOkkJ4DidtjPgeuhcS
         2SBE080Y51l9DSmX+0WhfqXNvZrXtYJL/TkHDfaZgDVIFtiwG5MxyroYSkvhKMLUMxv0
         NclaF1MrZZWqZGM3/28eiwwyPcjWMIAY9MrtQwXNBy6axByFDkFcDXuCwa/qH2NC1xs6
         UpNSOwShbRfSCvcCPCFubU5k0Ra4YWD1evBMgOeYHatCk0tqwl1oV11KVXu8mcP284Y5
         8mZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/owj4dKvul9yQPdKIbLIisU85z4JvHjwmNbR5T/KcKc=;
        b=3F5opem2Nx0tG2l1wS6hdOKjb/CPG0L3UIQND0T/3E4Jv3Rv9o/w23jt4pBVWiADxc
         /VbVFGrTJ2yVLb43hZgUQGzS0s0K3jdPEugeJlf54xz4Opb/X1+i84E47BmjTDGyh9lc
         Evvk4O4jM+RcdSfDciJZYeBNvEexxXIQVDJ5Hpv4qX9I3UhEc5GebgV2N+bxrOViaPBI
         Rc1i8mtotYekmo6h9dQ0X4siRyIEkXyGBmDoNhNMl5nMc5lRp1zy2X7YERpjqsM1m3O1
         5wNmvVC9MZxMyxbOO+Ohojt7q8+7dJ88djF+sEc5YxeQhZU1x+EovAtRg4BqX3JaWowU
         18kw==
X-Gm-Message-State: ANoB5pnSF3F/Y28T+oYFFexEwDhycyRYpxCWGMFWA9JbKlIrkTM3nJIA
	66qHX9vd8pPBYekhlQAvcu0=
X-Google-Smtp-Source: AA0mqf58jNIo9idrf0Z9GJcddQ8a7UCnMqj4fEx86F9b1wIZEemPVkIctQIAaPOTSDSqVqSSPFlaeg==
X-Received: by 2002:a05:600c:3501:b0:3cf:8e6f:e02e with SMTP id h1-20020a05600c350100b003cf8e6fe02emr12477935wmq.3.1670846134509;
        Mon, 12 Dec 2022 03:55:34 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:1484:ef11:b25c:4612])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c190700b003b4cba4ef71sm9793820wmq.41.2022.12.12.03.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 03:55:33 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel@sholland.org>,
	Guo Ren <guoren@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 4/6] riscv: mm: dma-noncoherent: Pass direction and operation to ALT_CMO_OP()
Date: Mon, 12 Dec 2022 11:55:03 +0000
Message-Id: <20221212115505.36770-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_035537_418475_8BD5C153 
X-CRM114-Status: GOOD (  10.24  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Pass direction and operation to ALT_CMO_OP() macro.

Vendors might want to perform different operations based on the direction
and callbacks (arch_sync_dma_for_device/arch_sync_dma_for_cpu/
arch_dma_prep_coherent) so to handle such cases pass the direction and
operation to ALT_CMO_OP() macro. This is in preparation for adding errata
for the Andes CPU core.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4 -> v5
* Updated commit message.

RFC v3 -> v4
* New patch
---
 arch/riscv/include/asm/cacheflush.h  |  4 ++++
 arch/riscv/include/asm/errata_list.h |  8 ++++++--
 arch/riscv/mm/dma-noncoherent.c      | 15 ++++++++++-----
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index 03e3b95ae6da..e22019668b9e 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -8,6 +8,10 @@
 
 #include <linux/mm.h>
 
+#define NON_COHERENT_SYNC_DMA_FOR_DEVICE	0
+#define NON_COHERENT_SYNC_DMA_FOR_CPU		1
+#define NON_COHERENT_DMA_PREP			2
+
 static inline void local_flush_icache_all(void)
 {
 	asm volatile ("fence.i" ::: "memory");
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 2ba7e6e74540..48e899a8e7a9 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -124,7 +124,7 @@ asm volatile(ALTERNATIVE(						\
 #define THEAD_flush_A0	".long 0x0275000b"
 #define THEAD_SYNC_S	".long 0x0190000b"
 
-#define ALT_CMO_OP(_op, _start, _size, _cachesize)			\
+#define ALT_CMO_OP(_op, _start, _size, _cachesize, _dir, _ops)		\
 asm volatile(ALTERNATIVE_2(						\
 	__nops(6),							\
 	"mv a0, %1\n\t"							\
@@ -146,7 +146,11 @@ asm volatile(ALTERNATIVE_2(						\
 			ERRATA_THEAD_CMO, CONFIG_ERRATA_THEAD_CMO)	\
 	: : "r"(_cachesize),						\
 	    "r"((unsigned long)(_start) & ~((_cachesize) - 1UL)),	\
-	    "r"((unsigned long)(_start) + (_size))			\
+	    "r"((unsigned long)(_start) + (_size)),			\
+	    "r"((unsigned long)(_start)),				\
+	    "r"((unsigned long)(_size)),				\
+	    "r"((unsigned long)(_dir)),					\
+	    "r"((unsigned long)(_ops))					\
 	: "a0")
 
 #define THEAD_C9XX_RV_IRQ_PMU			17
diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index d919efab6eba..e2b82034f504 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -19,13 +19,16 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 
 	switch (dir) {
 	case DMA_TO_DEVICE:
-		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
+		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size,
+			   dir, NON_COHERENT_SYNC_DMA_FOR_DEVICE);
 		break;
 	case DMA_FROM_DEVICE:
-		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
+		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size,
+			   dir, NON_COHERENT_SYNC_DMA_FOR_DEVICE);
 		break;
 	case DMA_BIDIRECTIONAL:
-		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
+		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size,
+			   dir, NON_COHERENT_SYNC_DMA_FOR_DEVICE);
 		break;
 	default:
 		break;
@@ -42,7 +45,8 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 		break;
 	case DMA_FROM_DEVICE:
 	case DMA_BIDIRECTIONAL:
-		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
+		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size,
+			   dir, NON_COHERENT_SYNC_DMA_FOR_CPU);
 		break;
 	default:
 		break;
@@ -53,7 +57,8 @@ void arch_dma_prep_coherent(struct page *page, size_t size)
 {
 	void *flush_addr = page_address(page);
 
-	ALT_CMO_OP(flush, flush_addr, size, riscv_cbom_block_size);
+	ALT_CMO_OP(flush, flush_addr, size, riscv_cbom_block_size,
+		   0, NON_COHERENT_DMA_PREP);
 }
 
 void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
