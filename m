Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63ED2C48BF6
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 00:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qpwWx15bh9fvjLMGBGYrY1WRs6WjpaDiQUANxiP9XYs=; b=DA9JnJZSYRnmhw
	rC2w2/Q0WuAq4rxViNON3O//zNPw0CfiIuafozrDR3LRA9F4tOSLLWzGTpHIqBpAn/qlSvgawxKu+
	5X60FQt2IohHr9ICTWsbMYSROVuIl0Ubn7/VgbxH7WyJG/7y8/FFt6jAjDT+P2spkOGuWHHaKpqbb
	r1RxoQKx5idz9+ikXWnkFJFNaQd1oBFqyHBqho9RMQsXoWwJ+p0v2jB5zAmCkBlywrs4wOPA30RvF
	7XfPYKOfxft2o0BeQ/qS2Ruw54iAJrxwjUmRsEmmEtHor0eiAVQSvDTyf9xV5KnMEQPNH5IrB/p1p
	9oYneZcjp40XnT8EPvcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfqou-0000000FkuS-42YI;
	Fri, 01 Mar 2024 00:32:12 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfpjK-0000000FZwI-0P0M
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 23:22:24 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6e49a5b1bbfso739423a34.3
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 15:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709248940; x=1709853740; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jEC1X5CZdJa4ryFg9hWmhSsIovSPBi+ZbblNH/6mwk=;
        b=N3eCpfQq1r7ZBDIwOaS/gX6qVdZF+MPSgJWTtvghWvpwkOZmljpXXDzpu8lL/WUlzA
         Mzef/UhcuiOzB/L+c3H0wTHvTNQDIVeamm0DPiLJI3BfmoFu120c7EF19lB7Blr2ZuGi
         6w84krWzVAWZa9lI8NmAo+7ly6vJYbkKwwlW6dhH+Z0xVtWF7p+nhnbxmxCWb2OIxu/D
         sVx2iswEh2ddVb8VaI+5Z3V0nuOPBRzbkHjCqOgM/X/L60g5kljAxSeordZsHUded3K1
         k+e/6O7PPRbzDKIpoqugKuxikUIm4oe1jIXJC39dfBUH1XR76CqyOm2sRpCJhzjGDVrz
         uFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709248940; x=1709853740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jEC1X5CZdJa4ryFg9hWmhSsIovSPBi+ZbblNH/6mwk=;
        b=AiOjXmO5XazKl2fyPePK0BwICERwkPKH4kYWBO7QArOge4oSHtEnfcRQsiTwmxWVtb
         8RNctFqjzhc8Ho2+hi5HWfbUE0FvYeyRMhwOJrOV8Xf1GBgxOCszGLEE662umfKfQfs+
         1MrvmUcXkCjPwvYRa7I6s2OIO4fECt8MjfZx3eAAiDe/hhRBr/od75kT1DFamJDGyqGN
         Iym7Da/hjswvXd+KwyoIJgkpCxY+bS3snTMcoDNHJxmaC8rJaxzjhP7Jkf5UzHrhL2vN
         bjW4PCVdP7iwgPHqLmEnXgjI/OBlOjQyI2tjt80SLKGqF8LoNqxf8lKOrGpB0zUi81sZ
         eOvw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ5QfHbB0zTroUirAEkeETpb6ansgUeI1E/XKQfTVGnSLIXtvrMcFlQO/SB4K2FkV/jXcwCcaDrLEe7i5eO8ohTM3ihxXdiN+lQlI1lJCg
X-Gm-Message-State: AOJu0YzdWIECVQ+4fCYdF9bTu0MS9HswftUZhESFr0d7bD/dq2AkKe24
	SREyNdVXIWDt1t/fur9JAZ3/MtuXEF1zaOLoiL1z0p5MKULWkpekPsFhGqOoGQfO8MsL+3wAW2h
	n
X-Google-Smtp-Source: AGHT+IGX4/HV5W58fetZh8Yw57gYr75gd/4aFWyaezvIp/BsV5LakI2yn+mW+sbVnuOSeLnU1moubA==
X-Received: by 2002:a05:6870:ac22:b0:21e:dd7a:2d3e with SMTP id kw34-20020a056870ac2200b0021edd7a2d3emr4104469oab.22.1709248940592;
        Thu, 29 Feb 2024 15:22:20 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id c6-20020aa78806000000b006e55aa75d6csm1779719pfo.122.2024.02.29.15.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 15:22:20 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v5 07/13] riscv: Apply SiFive CIP-1200 workaround to single-ASID sfence.vma
Date: Thu, 29 Feb 2024 15:21:48 -0800
Message-ID: <20240229232211.161961-8-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240229232211.161961-1-samuel.holland@sifive.com>
References: <20240229232211.161961-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_152222_366526_026AB0B4 
X-CRM114-Status: GOOD (  13.73  )
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
index ea33288f8a25..6e2762101968 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -43,11 +43,21 @@ ALTERNATIVE(__stringify(RISCV_PTR do_page_fault),			\
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
index 4f86424b1ba5..463b615d7728 100644
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
index 69402c260a89..365e0a0e4725 100644
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
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
