Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5C3EB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 12:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sQbqo1lxcLHoTRy+QsuC+7OEoVaZkrk5cB2lMzEmZbw=; b=sVVRiF5P703F0H
	cRZbKKrfdqhX2YfsWAdS3L++dDa8FnBw2N1i+6wqEPWq7RUmUEQvrM+DGeu/Q4+dDu/9g19BUW5Nr
	+FLEvS7VkpzgxGV63lNC+Xzcvo5uU2Ohxy6lu6kJcJ41lpFZcamrniDH4DWSHAXYIU6ZVtxqr0JN4
	5+ZMxFIzvqPqY9IpqWgXzu+VWmW5LPSvh0hF7I0YvlRKz+Dac8Tyk9r5bYHeETCC3tEAgGUqc4NYT
	kuciYohSX1vu24l5tmsNR44a3Mu4CR/3qz4Z+ebgxNDSQKuGJXCutNZYvpo8Dk6wfdNAQYDPOkjZs
	ictnsksO1UBcxoB68IkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBx9i-00Ea9J-0B;
	Wed, 21 Jun 2023 12:41:50 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBx9f-00Ea8I-0t
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 12:41:48 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b50394a7f2so33643305ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 05:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687351306; x=1689943306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBApf8xsMY/51HLxq7FE/hd8IlqzLiV4us//ccB6YbY=;
        b=HRNownAaItbu6ZmFxsZN9xkHg/GStyz07iK3+KljRrXZ2X9CU7Yk0Ck2LNYWbk5+tn
         p1vtvKDqPH9ipVNvbI3BM7nLksdN96As+jr42dbwFZlobKsCRrMZhwpL2pAXCEzgb7Y0
         S0ACMX5o3YH69/+oWyZhWAk1mxicAtbYVH/WEyg5yb45kXtbtqZxLWdapprIT4b2qwMC
         2XbdK6bZWNWnF2lZsQBOe8QuYynKV067hw4y1HnvlVYQW97KDQ3Y+xf7J5k1WAhDOKOL
         E+qieWdUuzm863a35YyjWaqeXIzL4UNRjXEfQotPDgWqBZUSOmMNr1lqd0f5MU3HZSfi
         UtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687351306; x=1689943306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QBApf8xsMY/51HLxq7FE/hd8IlqzLiV4us//ccB6YbY=;
        b=e893nOrrCfLwAFcIOFYrjhYruYwpZlni49S5Gda1Aw31bDBy7ji2L9WqNYiruSOHQK
         U1DivvG2EhEEk+5WaNevD0MsA8TLVhd69kQ9ecMCAWnZB/+ieTV/a1SkKl3XGneHlVGt
         Rq/gXH4vKCgOggVp1cEl1C0WA2qF1+W2rfpg3pma8AQPfy8btZWahBZ9ao+KTt0PvWib
         Xe7drBPBM/pTKzJI/XA1DIoueZOlE3y3YMb0MtdpFVm6brfEYLtBzJwYFnSEhe++7xqe
         W2+1Ve2St0N3+h0y40SfFArjSTidA3E/EewTFsBFtVRPZTIXV99cVHXa6G5fUTHmhP2Y
         8zeA==
X-Gm-Message-State: AC+VfDwpJWlo/iMiZjZ1NxdH8yyocQi9vF7ADP89T48VT2fxT93IZbx7
	8p6xMebCuYP4dPcIqkaclApQ8g==
X-Google-Smtp-Source: ACHHUZ4tHx4Edm4lQKgcTiC7PZ3Txd6KhdE4YNyyqxbmlSKNl9spKek/bp9Ir4HAuzPCLXbj2XjoEg==
X-Received: by 2002:a17:902:f691:b0:1b5:1e24:8a6e with SMTP id l17-20020a170902f69100b001b51e248a6emr14177944plg.60.1687351306192;
        Wed, 21 Jun 2023 05:41:46 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([2401:4900:5305:4d9b:7b:d038:88c8:7461])
        by smtp.googlemail.com with ESMTPSA id jw10-20020a170903278a00b001b50b933febsm3400256plb.238.2023.06.21.05.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 05:41:45 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	=Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 1/1] riscv: mm: use svinval instructions instead of sfence.vma
Date: Wed, 21 Jun 2023 18:11:33 +0530
Message-Id: <20230621124133.779572-2-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230621124133.779572-1-mchitale@ventanamicro.com>
References: <20230621124133.779572-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_054147_317263_D0340F90 
X-CRM114-Status: GOOD (  14.53  )
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
 arch/riscv/mm/tlbflush.c | 62 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 56 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 77be59aadc73..ade0b5cf8b47 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -5,6 +5,12 @@
 #include <linux/sched.h>
 #include <asm/sbi.h>
 #include <asm/mmu_context.h>
+#include <asm/hwcap.h>
+#include <asm/insn-def.h>
+
+#define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
+
+static unsigned long tlb_flush_all_threshold __read_mostly = PTRS_PER_PTE;
 
 static inline void local_flush_tlb_all_asid(unsigned long asid)
 {
@@ -26,19 +32,63 @@ static inline void local_flush_tlb_page_asid(unsigned long addr,
 static inline void local_flush_tlb_range(unsigned long start,
 		unsigned long size, unsigned long stride)
 {
-	if (size <= stride)
-		local_flush_tlb_page(start);
-	else
+	if ((size / stride) <= tlb_flush_all_threshold) {
+		if (has_svinval()) {
+			asm volatile(SFENCE_W_INVAL() ::: "memory");
+			while (size) {
+				asm volatile(SINVAL_VMA(%0, zero)
+					     : : "r" (start) : "memory");
+				start += stride;
+				if (size > stride)
+					size -= stride;
+				else
+					size = 0;
+			}
+			asm volatile(SFENCE_INVAL_IR() ::: "memory");
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
+			asm volatile(SFENCE_W_INVAL() ::: "memory");
+			while (size) {
+				asm volatile(SINVAL_VMA(%0, %1) : : "r" (start),
+					     "r" (asid) : "memory");
+				start += stride;
+				if (size > stride)
+					size -= stride;
+				else
+					size = 0;
+			}
+			asm volatile(SFENCE_INVAL_IR() ::: "memory");
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
