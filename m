Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D77C0018C
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Oct 2023 23:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ke9uUiY/eXBNOC3zyRMy0bsdoypBLwQJezndPcpqsFE=; b=yyYFE9HFuS0hKp
	kjmH+wFzFmlYImZzxlbF1OqV/yaMt02ji6NNzq63r4IW10fYY6dm7CKwOt7Bd73BKpt/wCOnYYMu0
	7tvF4K5fDJWtwzI9WRGNA6LOkmkAaXUgF48UjTT70bjuixkH8ANnl6nzWGDnDk9sev6zKptGjjJ7Q
	rmnj1VcNtkPMG7T59BE85AbOP29lzAY2jvqxN1DdGSdVAiNuj+WhbDOufBiXzq8pYGi8ajfVKe5Rk
	mLVQqsWHDf+VhEj803zlNtrI7k7JeOQ8HSCH72nbAipzSXtbrvmagC2P/WeGG4WVJJN5tcRF9rFyU
	5KtOgR50IW9CG/N+bMqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwsVD-000va2-0q;
	Sat, 28 Oct 2023 23:13:59 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwsV5-000vUH-0Q
	for linux-riscv@lists.infradead.org;
	Sat, 28 Oct 2023 23:13:54 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2800bdf888dso1290874a91.1
        for <linux-riscv@lists.infradead.org>; Sat, 28 Oct 2023 16:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698534830; x=1699139630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UP8DHxv66mJzZKknfJMFXXbwrunx+Hl9Ii6vLteV5ng=;
        b=M69abNZ5UueVM84bI2TGc5h2ZfS1NC/rnvRzcJMI2f1QbXqX8Esp5YNMoCUo5SpZ00
         iwALbgBW7mvfrcKq6QadP/Xf/ezTl8oZ6sE+VedzLraNB8tIVVrUnRrwr31JrbuEdAOM
         jcI8cZX/Au41L2qF8Kqq91A/4JQU/TG8jUQmtNlrmoVIQCvcrxO0X5jW8w26o6BCTfPt
         yCwo2mejRKTfMivWqKJn2aR3u6LFKtscbkq+MF45d60/WR/8i9HK5cdhFSxzBhuO9fzV
         zg1UmuxPa8guinOl5rVtYcwr90L191g/q+GmxK3U3IG/6HjH2JzVZkyjlkiV+9djiKlN
         Vz4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698534830; x=1699139630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UP8DHxv66mJzZKknfJMFXXbwrunx+Hl9Ii6vLteV5ng=;
        b=Ps54MVKOBHTeOyBcGH8AtIbylZAjzTWNHdOq1HgarR3gUV1vdwAZ7VdnuelhQFobw/
         oFWREtrOBYeJS2zH1qsy4TVyCSqBlFt7wx0jKGa2oegwGuIfRHCz+xN/Lvt32MOPvfp3
         X3EYlgSIzipMnGWjL9PxMZuFqv+idIQYzw3dmYSUYmI0936dpneVEynWYjDgpK35SntS
         WkaW/oDA5KB8fkxYRXt0vqHDQCsA3mjR7V2CItdTe5IlCQ2JR4OkBX/0jBGdy8UaQXkN
         H4Sd4HYmpZahZDSn3WocTLJN8SGouURpEJ4uo1cxY1XcJqFrOSKuFfdhCgH5n1aIezj4
         shlQ==
X-Gm-Message-State: AOJu0YzYZyH9/ZPjoFcLwkyP8TWGsHzGY5/x3T6YTdHrD2Q5v9/5fOKb
	5pTCbvWfxRkRoIr9L/z/+xJlpw==
X-Google-Smtp-Source: AGHT+IGnkbRXw2gehdqQUYovjjCjlvZO0f8kuIzIEbkVVgufqh5Fzfqz26Y3uN2f14MpzFpb+9CFvQ==
X-Received: by 2002:a17:90a:1506:b0:280:2a3f:9938 with SMTP id l6-20020a17090a150600b002802a3f9938mr2800689pja.12.1698534830039;
        Sat, 28 Oct 2023 16:13:50 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u17-20020a17090341d100b001b8622c1ad2sm3679345ple.130.2023.10.28.16.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 16:13:49 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 06/11] riscv: Apply SiFive CIP-1200 workaround to single-ASID sfence.vma
Date: Sat, 28 Oct 2023 16:12:04 -0700
Message-ID: <20231028231339.3116618-7-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231028231339.3116618-1-samuel.holland@sifive.com>
References: <20231028231339.3116618-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_161351_170270_1780A016 
X-CRM114-Status: GOOD (  14.05  )
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

Changes in v2:
 - Rebase on Alexandre's "riscv: tlb flush improvements" series v5

 arch/riscv/include/asm/errata_list.h | 12 +++++++++++-
 arch/riscv/include/asm/tlbflush.h    | 19 ++++++++++++++++++-
 arch/riscv/mm/tlbflush.c             | 23 -----------------------
 3 files changed, 29 insertions(+), 25 deletions(-)

diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index b55b434f0059..d3f3c237adad 100644
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
