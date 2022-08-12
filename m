Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAD6C25B0F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 04:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/e6ENdzkZxXsi/JXRp/cXaUPBDqRlMIEdBAkBNdbeZk=; b=VDuTSBvwe5S/Rb
	l+IdwSALrxK+e0Zq7HIItbM7fB8O0sAXSjwg951qrgl9GHFVgFCdrxwfRcC37ZbcWG/mPHl6CndsZ
	VGeyMsjW/wEboGLdjG256zaj1XrFZ0tHdd9RYLbjNQ1syG2i8sts6TSIMNf+AuBxPP2f+XIENcpJD
	cnCdUdBaED4nGh6aK7AOA5cH/bY0pQGdV5HCzLYMJE3U6fPWRG7JKz3dKdqpofcRt8OkVO7VLu1bP
	ZOJ0/ofp6sMs+S5Hl3b6m3Y5+xLJly0KMZxHNdj+drWD0wa2QZ8hxuOsgF0MlQ9DC6h6q7Ak3nnz7
	POImlONfTx9+IkuYKvMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMMIo-00F37l-S2; Fri, 12 Aug 2022 04:29:42 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMMIm-00F32R-F2
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 04:29:41 +0000
Received: by mail-pl1-x635.google.com with SMTP id d16so18644819pll.11
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 21:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=wel71dhtU86rT2OfhUZLvidjIvok4yQdLkjljsAL/HI=;
        b=RG5uVXJ4va2MkwODiEF8LbUbIuyy4j3jZ/pkIBMYUaMgTeDfT6tXrNUEIoQ5fA5mZs
         ehOq/YuziDR6xCS85xYGYsAWpPXKif3IjrLXwDd0aNtwx/haE+Xi5pC01325ZNKx18Bo
         gqmCFwBCjbI1/2eo4Zf6L8sMoYEAXz9zQHayCQbIVym55KuoK5YmGa5WKZ/RKQoTQ2ML
         KkjK44NcB1HECKq5brDfGi6VwiY7/0I16SLi+NGGotIagGqnaPOFMqtpZuBrL18Y4Vzd
         Runx2dFpw4iPaa7X2EpQ0e3QWqikgneEyGvAafHLN+rKvDN3sj6tCo1aszG7Bb3kk0qc
         Fgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=wel71dhtU86rT2OfhUZLvidjIvok4yQdLkjljsAL/HI=;
        b=vGC20nhupzWgJAMzyslsRgE+sn025bj0BF2bTerB/kJw5qKlK4nExZekqwZ5Agv+/r
         Onzr6a9lMGLIyfRfZe4s2ZVT4jlALI10EEm/RaKcoLWwpWWAVsx9lKFG3kKNVOd3ty2k
         raYf8ZhgrfOseNiB97TEFT3DoNq0xyC0bffZDB2mg/8QBisFCCoV3JRGyxenaQ7tyWns
         sovbSv3Wz80XjTzBEWoQ0K64dw5lIBcmTO4ZfFwO0jUSAx4nghRghR//KJkqEXOGn1US
         JSdxYwqGQfF33v7pk3vK3rvt1rx+QOD9789LlokdcWqEnKTeBmJI1Z8mr1lkA4qpA2Bu
         S/KA==
X-Gm-Message-State: ACgBeo2jhRN1wtxxT4bYiqoh5lkP7YbyOy9SJi2UGsfgdw7f53qiqIgN
	MBRq9MiOode3J9HD+uSgvrB47A==
X-Google-Smtp-Source: AA6agR4dsaiprYF0V5pqtJWT7fah1eYwNDLZCEdRWUNEn4eDTG3Hw0TnF9JEk3GqgmgKYgYZZlcfxg==
X-Received: by 2002:a17:902:a586:b0:170:f3ae:bd06 with SMTP id az6-20020a170902a58600b00170f3aebd06mr2256592plb.104.1660278578831;
        Thu, 11 Aug 2022 21:29:38 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id h29-20020aa79f5d000000b0052d981e7842sm524904pfr.208.2022.08.11.21.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 21:29:38 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v3 2/2] riscv: mm: use svinval instructions instead of sfence.vma
Date: Fri, 12 Aug 2022 09:59:21 +0530
Message-Id: <20220812042921.14508-3-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220812042921.14508-1-mchitale@ventanamicro.com>
References: <20220812042921.14508-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_212940_523758_EC711A19 
X-CRM114-Status: GOOD (  15.35  )
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

When svinval is supported the local_flush_tlb_page*
functions would prefer to use the following sequence
to optimize the tlb flushes instead of a simple sfence.vma:

sfence.w.inval
svinval.vma
  .
  .
svinval.vma
sfence.inval.ir

The maximum number of consecutive svinval.vma instructions
that can be executed in local_flush_tlb_page* functions is
limited to PTRS_PER_PTE. This is required to avoid soft
lockups and the approach is similar to that used in arm64.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 arch/riscv/mm/tlbflush.c | 108 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 102 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 27a7db8eb2c4..7d901cf4fec6 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -5,6 +5,14 @@
 #include <linux/sched.h>
 #include <asm/sbi.h>
 #include <asm/mmu_context.h>
+#include <asm/hwcap.h>
+
+static unsigned long tlb_flush_all_threshold __read_mostly = PTRS_PER_PTE;
+
+static __always_inline bool has_svinval(void)
+{
+	return static_branch_unlikely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_SVINVAL]);
+}
 
 static inline void local_flush_tlb_all_asid(unsigned long asid)
 {
@@ -23,22 +31,110 @@ static inline void local_flush_tlb_page_asid(unsigned long addr,
 			: "memory");
 }
 
+static inline void local_sfence_inval_ir(void)
+{
+	/*
+	 * SFENCE.INVAL.IR
+	 * 0001100 00001 00000 000 00000 1110011
+	 */
+	asm volatile (".word 0x18100073" ::: "memory");
+}
+
+static inline void local_sfence_w_inval(void)
+{
+	/*
+	 * SFENCE.W.INVAL
+	 * 0001100 00000 00000 000 00000 1110011
+	 */
+	asm volatile (".word 0x18000073" ::: "memory");
+}
+
+static inline void local_sinval_vma_asid(unsigned long vma, unsigned long asid)
+{
+	/*
+	 * rs1 = a0 (VMA)
+	 * rs2 = a1 (asid)
+	 * SINVAL.VMA a0, a1
+	 * 0001011 01011 01010 000 00000 1110011
+	 */
+	asm volatile ("add a0, %0, zero\n"
+			"add a1, %1, zero\n"
+			".word 0x16B50073\n"
+			:: "r" (vma), "r" (asid)
+			: "a0", "a1", "memory");
+}
+
+static inline void local_sinval_vma(unsigned long vma)
+{
+	/*
+	 * rs1 = a0 (VMA)
+	 * rs2 = 0
+	 * SINVAL.VMA a0
+	 * 0001011 00000 01010 000 00000 1110011
+	 */
+	asm volatile ("add a0, %0, zero\n"
+			".word 0x16050073\n"
+			:: "r" (vma) : "a0", "memory");
+}
+
 static inline void local_flush_tlb_range(unsigned long start,
 		unsigned long size, unsigned long stride)
 {
-	if (size <= stride)
-		local_flush_tlb_page(start);
-	else
+	if ((size / stride) <= tlb_flush_all_threshold) {
+		if (has_svinval()) {
+			local_sfence_w_inval();
+			while (size) {
+				local_sinval_vma(start);
+				start += stride;
+				if (size > stride)
+					size -= stride;
+				else
+					size = 0;
+			}
+			local_sfence_inval_ir();
+		} else {
+			while (size) {
+				local_flush_tlb_page(start);
+				start += stride;
+				if (size > stride)
+					size -= stride;
+				else
+					size = 0;
+			}
+		}
+	} else {
 		local_flush_tlb_all();
+	}
 }
 
 static inline void local_flush_tlb_range_asid(unsigned long start,
 		unsigned long size, unsigned long stride, unsigned long asid)
 {
-	if (size <= stride)
-		local_flush_tlb_page_asid(start, asid);
-	else
+	if ((size / stride) <= tlb_flush_all_threshold) {
+		if (has_svinval()) {
+			local_sfence_w_inval();
+			while (size) {
+				local_sinval_vma_asid(start, asid);
+				start += stride;
+				if (size > stride)
+					size -= stride;
+				else
+					size = 0;
+			}
+			local_sfence_inval_ir();
+		} else {
+			while (size) {
+				local_flush_tlb_page_asid(start, asid);
+				start += stride;
+				if (size > stride)
+					size -= stride;
+				else
+					size = 0;
+			}
+		}
+	} else {
 		local_flush_tlb_all_asid(asid);
+	}
 }
 
 static void __ipi_flush_tlb_all(void *info)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
