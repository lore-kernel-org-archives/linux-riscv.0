Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36112C47074
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 22:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2xrtIk3GBKAEHdHQaWtzlHE8TY7iZe2kzPb7kxBT/VQ=; b=W0cvSoXxk6Y/UA
	eldH1dbSwsvWCSDClhqHBfTAP+9cJsr5Y6N122BmXa7ffxXM34WRb1IQZyAsgtAradB9Rhf+Wdrm4
	iLjGEswS7SesJyqd+gRcuASP0V+Qc5YOOFjZE4gzBnxjIELvN2N7L2pASwKjXIe4bOekYXKx6uNCa
	qizUVpeny0oWwlHE3807YG8NLNTFzcP2CwvvqeDn/lypj4BFPy1k9k5ACwVX43znyG4LmqWUDyEze
	LuVPyxAdc6xpNdw8A+LURtq9Je/UxwgRyA8TnRq/VP1A4MqBZeVFmSwDx30EuK4b9RV9uMc0UTvjC
	VVLiq1OTpqM9Y75JRCtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKmpa-0098Uw-0E;
	Tue, 02 Jan 2024 22:01:50 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKmpU-0098QZ-1Q
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 22:01:46 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1d408c2908cso23253195ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jan 2024 14:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704232903; x=1704837703; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6c+wYTacIgINHvokNTIzxqzbFxSPL5G6VDrdebR45nU=;
        b=df8FMgAiRYGhgh4t1+Y5NqhiGbGPeMPVtPMNBv3TmxTMixBbO3YupJIBJnn2XTmn3r
         39W8isLekOiusQFQgqUmufbFeJUUmGC9AUD3jVm84xmVMQYm1eU7mH0jHJoKKYw+5MzY
         64q953slGqGrf/a1qucQUmuyA6tFoU5CnyeaHzsEmdMWHczqvubVQFd3aQzqV5I7Y0qa
         sr+G/wEr7OnOjOgeWEb0sX6Fkm8nXd1H10tO/bMi+XW2sDO+/e9bWyfKPvyQRwEGWa5u
         IC6yWGTVwL+Zessgcv0LZN9WisfxoMSI9OdbPCLqayJPXV67goC15HZw2qBKMCgpFeQ0
         4uuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704232903; x=1704837703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6c+wYTacIgINHvokNTIzxqzbFxSPL5G6VDrdebR45nU=;
        b=iboQID+Mg9eLauIDQmWEncVpIzC7iTY6ilupGWa9uGLLoSOQlpWMiC1HIopCt2mzws
         21gkhaC5RJipIMLhOkMVgibjhRhor2/lQabwxEvATzHSRbVZVzjJvA1MiBIf/HL6sUzO
         wHAgtPJvcbTLAtRHwdb/kpOZILv0g7g2p3TiB2fJvGBiwtif7NT+zp8kz8U65D+YugTu
         vOa/hB90b0ckUoXCCGW2Q+3cysFtmxXDZE/3QJzVpUBh5Tenn/1gddKEILye8jeXlEv/
         SVkwseBgz8oRyKboXCwRPuKPBzCwgY6CXFWhlixkUdBgWSHK29gnpVlntk+pEXu7/ZZL
         8MlA==
X-Gm-Message-State: AOJu0YwGGOtMDyywkt+U8Xo/L0MzBSegUdT2IPuaNCJKV5oou/Wbl5Fk
	8v1DVQZyYXItTgdHbaEPvZ+in0NWjbgrhQ==
X-Google-Smtp-Source: AGHT+IE2GdHLRUcW4ROKdXldqRiWcx2M7fdl7/RqRT5d/m4h5bCpV21xGk3IklfQQqw3IhSZ5sLqag==
X-Received: by 2002:a17:902:d584:b0:1d4:5f9:d3d7 with SMTP id k4-20020a170902d58400b001d405f9d3d7mr8348439plh.127.1704232903384;
        Tue, 02 Jan 2024 14:01:43 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id r59-20020a17090a43c100b0028ce507cd7dsm101724pjg.55.2024.01.02.14.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 14:01:43 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v4 06/12] riscv: Apply SiFive CIP-1200 workaround to single-ASID sfence.vma
Date: Tue,  2 Jan 2024 14:00:43 -0800
Message-ID: <20240102220134.3229156-7-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240102220134.3229156-1-samuel.holland@sifive.com>
References: <20240102220134.3229156-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_140144_517113_FC58C732 
X-CRM114-Status: GOOD (  14.35  )
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

commit 3f1e782998cd ("riscv: add ASID-based tlbflushing methods") added
calls to the sfence.vma instruction with rs2 != x0. These single-ASID
instruction variants are also affected by SiFive errata CIP-1200.

Until now, the errata workaround was not needed for the single-ASID
sfence.vma variants, because they were only used when the ASID allocator
was enabled, and the affected SiFive platforms do not support multiple
ASIDs. However, we are going to start using those sfence.vma variants
regardless of ASID support, so now we need alternatives covering them.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - Rebase on Alexandre's "riscv: tlb flush improvements" series v5

 arch/riscv/include/asm/errata_list.h | 12 +++++++++++-
 arch/riscv/include/asm/tlbflush.h    | 19 ++++++++++++++++++-
 arch/riscv/mm/tlbflush.c             | 23 -----------------------
 3 files changed, 29 insertions(+), 25 deletions(-)

diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 83ed25e43553..6781460ae564 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -44,11 +44,21 @@ ALTERNATIVE(__stringify(RISCV_PTR do_page_fault),			\
 	    CONFIG_ERRATA_SIFIVE_CIP_453)
 #else /* !__ASSEMBLY__ */
 
-#define ALT_FLUSH_TLB_PAGE(x)						\
+#define ALT_SFENCE_VMA_ASID(asid)					\
+asm(ALTERNATIVE("sfence.vma x0, %0", "sfence.vma", SIFIVE_VENDOR_ID,	\
+		ERRATA_SIFIVE_CIP_1200, CONFIG_ERRATA_SIFIVE_CIP_1200)	\
+		: : "r" (asid) : "memory")
+
+#define ALT_SFENCE_VMA_ADDR(addr)					\
 asm(ALTERNATIVE("sfence.vma %0", "sfence.vma", SIFIVE_VENDOR_ID,	\
 		ERRATA_SIFIVE_CIP_1200, CONFIG_ERRATA_SIFIVE_CIP_1200)	\
 		: : "r" (addr) : "memory")
 
+#define ALT_SFENCE_VMA_ADDR_ASID(addr, asid)				\
+asm(ALTERNATIVE("sfence.vma %0, %1", "sfence.vma", SIFIVE_VENDOR_ID,	\
+		ERRATA_SIFIVE_CIP_1200, CONFIG_ERRATA_SIFIVE_CIP_1200)	\
+		: : "r" (addr), "r" (asid) : "memory")
+
 /*
  * _val is marked as "will be overwritten", so need to set it to 0
  * in the default case.
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 7712ffe2f6c4..002c4c2620f3 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -22,10 +22,27 @@ static inline void local_flush_tlb_all(void)
 	__asm__ __volatile__ ("sfence.vma" : : : "memory");
 }
 
+static inline void local_flush_tlb_all_asid(unsigned long asid)
+{
+	if (asid != FLUSH_TLB_NO_ASID)
+		ALT_SFENCE_VMA_ASID(asid);
+	else
+		local_flush_tlb_all();
+}
+
 /* Flush one page from local TLB */
 static inline void local_flush_tlb_page(unsigned long addr)
 {
-	ALT_FLUSH_TLB_PAGE(__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory"));
+	ALT_SFENCE_VMA_ADDR(addr);
+}
+
+static inline void local_flush_tlb_page_asid(unsigned long addr,
+					     unsigned long asid)
+{
+	if (asid != FLUSH_TLB_NO_ASID)
+		ALT_SFENCE_VMA_ADDR_ASID(addr, asid);
+	else
+		local_flush_tlb_page(addr);
 }
 
 void flush_tlb_all(void);
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 37b3c93e3c30..292d7cf3c4f6 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -7,29 +7,6 @@
 #include <asm/sbi.h>
 #include <asm/mmu_context.h>
 
-static inline void local_flush_tlb_all_asid(unsigned long asid)
-{
-	if (asid != FLUSH_TLB_NO_ASID)
-		__asm__ __volatile__ ("sfence.vma x0, %0"
-				:
-				: "r" (asid)
-				: "memory");
-	else
-		local_flush_tlb_all();
-}
-
-static inline void local_flush_tlb_page_asid(unsigned long addr,
-		unsigned long asid)
-{
-	if (asid != FLUSH_TLB_NO_ASID)
-		__asm__ __volatile__ ("sfence.vma %0, %1"
-				:
-				: "r" (addr), "r" (asid)
-				: "memory");
-	else
-		local_flush_tlb_page(addr);
-}
-
 /*
  * Flush entire TLB if number of entries to be flushed is greater
  * than the threshold below.
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
