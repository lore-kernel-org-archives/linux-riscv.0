Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352C2C61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 01:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sMpjcQMktjz1kdAD+2C72GiGKAWcZq/ShxjaUbbuqtk=; b=d0JotTS34nyy38
	VlPl7yNhm5j1pAP2a5xrLLcV0IdG1jFYFIlNNmx344DwoFFyTHon7lz3JTPkAs44u97ndK7ha4cs+
	8AFOMeDeOjKZUnq+Wd6fF80xgtssUJl7UXt7+mFCPyqQxA38GrmqLBo5xWi9ovA5NT8UrFWLjefOp
	KIYjt0M0mxF8uNkT0do1wLLaGwYDVoDKVqxvqXYnxBMp3mq2qlr3P4BjmfposGn5vYb4vw108HAvR
	4ZI0pZHGaK08q8/fBWD1PWBdSajoTsiHnNmS+5kmJgHHhadDK3C3jNJNkW3cVipZ9lRDRSt4p1nmj
	9XxxeoCoZScMcZJVaMew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5bj7-000NAy-2e;
	Wed, 22 Nov 2023 01:08:25 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5bj2-000N7s-2r
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 01:08:22 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-5875c300becso3768739eaf.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 17:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700615300; x=1701220100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4E3lnavwhWkbsPt/8jollKuN1Wp7270MVQq6Nf32IZI=;
        b=j2gUQTCNQEG+nKL68cSMLaqRwZZmtVGHyeiTthPI4+a1JC6VQsQAooBjLqnu/GuYag
         gMSkv1N0UpEIdGWnEOkLnTFWxYoEwMgRHQBNkT27pgXXAASD62x5eaCgqtHiaKmpedTA
         6E/plJONzUj7kcgeMNVK0a6XWI4EzSL6OdvpTrJYxm+WEUmO7jjWCLwtXmYGuarXOP+X
         zdq/c//GKEytA6hELtpnTUU5gfFfmoDqN9/rxw4y6DRLAWxsJHvreTwFxtWlDf+d+Ecd
         5bWWryVAC4tqFdjE80+OASKILPSzs+zsXiC1wrNwgAnA7TdWLFgS0edA30hutRWf1zHt
         jvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700615300; x=1701220100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4E3lnavwhWkbsPt/8jollKuN1Wp7270MVQq6Nf32IZI=;
        b=lsinxY9ZIg/GWTdsFpVf5VaV5pZ1cw3WKexFz8CmTVbcWODemEckBieYc92/H3oO47
         wZAyeQV63U8h07APg4a9ON4cfdpFbtlrdOTIYg3F+wqz5aMjWR8u4SeF7XUlfXdJ3Ll+
         fEn1dtlUSP/GSq2n1NwzUf+waSN/wIiJlZOrsAZM2U+OCIqyLHL05vh9WzPEgb98wqmx
         cLl9tkuOVFDLMDRFnWPo9hCOxw0Dt/icqkCa+sdEnUxdjhIUtw6wHj7xJeLh1cxVmkhl
         HHWAvHK6jgLx2NoqBXmuNyomS/v2b4Y+QS7X9c37W/IAiibu7R7UTRHxt6gRfITzJTf5
         hQkg==
X-Gm-Message-State: AOJu0Yx7H2RsqQuhG8KUr7aYwDF92ed6z/lKuNTo4q/OHj4lWrNJ6BHJ
	5wdHYp6bBwlNK4oJGaD8NHqTJA==
X-Google-Smtp-Source: AGHT+IFhS1aXruOMSeKbF/kr742mxFr/4ERJTn5q1RSxs6qFscJwCL7KnIKBT8DwBL+aJBuJSXtucQ==
X-Received: by 2002:a05:6871:e805:b0:1d6:8b7f:ce89 with SMTP id qd5-20020a056871e80500b001d68b7fce89mr1213468oac.51.1700615299719;
        Tue, 21 Nov 2023 17:08:19 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id bn5-20020a056a00324500b006be047268d5sm8713961pfb.174.2023.11.21.17.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 17:08:19 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 2/8] riscv: Apply SiFive CIP-1200 workaround to single-ASID sfence.vma
Date: Tue, 21 Nov 2023 17:07:13 -0800
Message-ID: <20231122010815.3545294-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122010815.3545294-1-samuel.holland@sifive.com>
References: <20231122010815.3545294-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_170820_921214_14ED47C4 
X-CRM114-Status: GOOD (  13.93  )
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
index 317a1811aa51..e529a643be17 100644
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
 
 #ifdef CONFIG_SMP
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 22d7ed5abf8e..0feccb8932d2 100644
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
