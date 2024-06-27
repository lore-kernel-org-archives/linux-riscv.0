Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C980C2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 16:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xrcsYvrZqHLTkBWJXGF64shU5TcnatXlZMyPNw6Bf0s=; b=TOWeQCeFwZJlD1
	fATTzAGVnuIQok+O5Soen8IKYwHjU5HIOE/ArwM7v22c+B+mAfi4gT9llaXoNi2W2BK+MEvhyiSrM
	JrD4A/Y7/+wWDUrSYaKvw7BKtIa0cFcg9+s9ijNdCcFVLcZoQamiNnXxkLXq4y9L+f81BP3lsGKUd
	3lGxHHcKuwjXC23ewObLXhoYDyGEjK8TYVmvGCgbSjcbG0FgwRltttpHX0H0isP2JZLPbV+XRdXqF
	FW1F3xtZxbr+O0z2AIqFnm4hYzLPbn8w6H0XH5Bvq36hOKQ4Ozc9dQg/3FoF68qanJGMLduRXiPFe
	uHDGZIpUBk1QpWP5KbYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMsNS-0000000B6Xn-2jxI;
	Thu, 27 Jun 2024 16:53:42 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMsNP-0000000B6XJ-1Pti
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 16:53:40 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3c9cc681ee4so4248557b6e.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jun 2024 09:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1719507218; x=1720112018; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xgRMcFjdAXSfJmpNDWirZ3ZJOzi2fPO0oxRqfISjGUI=;
        b=PaiF7kqB6oO+TTZJJwnuoGPSV+GF+v+4eoQV8xsghs+VK0rcGNmVKJrL+o1X8W6ZDX
         wlYFM+nnhc2II9Y1AYNgL8XZTsREpCJXviGguAufP9UkE1D4xdMJKuJKE8Qj5gXvov/y
         uMdYRuYrqbB0RsNbqUCsvFEAOziZVESokdDEXqqykzOmoWMHoVhRmBu4hl8VQtNBdBre
         yxxqXfAkMST9BMfkXNOovet89KDNhAKSoYbtY2i6enDSo7/1p4qlQck9DH0cwkyuGzRg
         olQDUA3B/s2GtvyxdYx5Gmfsf95A5QQFDvsulSZb44ybsT5nrr3rQTAZZhrAbnSlvXia
         byPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719507218; x=1720112018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xgRMcFjdAXSfJmpNDWirZ3ZJOzi2fPO0oxRqfISjGUI=;
        b=NvBMYR2LV4Q3LM7Dp/OIBZee+C0puflGJRNSmioyYXtoTCfIPANfI6JPJOJzHLjD7Y
         Kybu/TDOpJQNm0KFtq2HzmtehRMyfxFnO3jIuvV32+WJebLrf3YI5AF9/g/tIvDrMKRj
         slEfo1tz1T+SOovMqMn2BvJzyD+dihZOX8OXVQ+3FOSU4CvNFnZcOHACwg2Epgo9ePUa
         P5hnhuezpmmVoiqviVqMQqCcGSVVEu1NONIZGVJaUx9acghup5LZD0QF4Ls7H+VvP5Sr
         /F/XRfXALYu5M25Z/9hzMR+Y6fKPyWAF97pVQNuYBvgMCwg7+bbBvDBe90N2iRZ9dEKd
         8H9g==
X-Gm-Message-State: AOJu0YxXGx9rPJhyDnwxkdZCFLybBMsNMQci31rTsIX267NnFUKS/N5B
	iXIf5MT0A8DbNw4629gOT94qxSLlqEPKg5/n0gr8tXB+X9mr82f57imyewruxtY2P8BPta9QDHa
	b
X-Google-Smtp-Source: AGHT+IF2xW+HeDrE7uJXd3kjJz80Due0WXPJcpVN5Yx83rJHKpt+8lD+3Y2IF5Rs4BD2GqbvTkP0fw==
X-Received: by 2002:a05:6808:18a0:b0:3d2:1c91:86df with SMTP id 5614622812f47-3d545a6a3edmr16253593b6e.36.1719507218121;
        Thu, 27 Jun 2024 09:53:38 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-3d56779fac1sm296678b6e.45.2024.06.27.09.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 09:53:37 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v7] riscv: mm: Add support for Svinval extension
Date: Thu, 27 Jun 2024 22:23:27 +0530
Message-Id: <20240627165327.7685-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_095339_401270_EC196CC8 
X-CRM114-Status: GOOD (  16.18  )
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

The Svinval extension splits SFENCE.VMA instruction into finer-grained
invalidation and ordering operations and is mandatory for RVA23S64 profile.
When Svinval is enabled the local_flush_tlb_range_threshold_asid function
should use the following sequence to optimize the tlb flushes instead of
a simple sfence.vma:

sfence.w.inval
svinval.vma
  .
  .
svinval.vma
sfence.inval.ir

The maximum number of consecutive svinval.vma instructions that
can be executed in local_flush_tlb_range_threshold_asid function
is limited to 64. This is required to avoid soft lockups and the
approach is similar to that used in arm64.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
Changes in v7:
- Use existing svinval macros in the insn-def.h
- Rename local_sinval_vma_asid to local_sinval_vma

Changes in v6:
- Rebase on latest torvalds/master

Changes in v5:
- Reduce tlb flush threshold to 64
- Improve implementation of local_flush_tlb* functions

Changes in v4:
- Rebase and refactor as per latest changes on torvalds/master
- Drop patch 1 in the series

Changes in v3:
- Fix incorrect vma used for sinval instructions
- Use unified static key mechanism for svinval
- Rebased on torvalds/master

Changes in v2:
- Rebased on 5.18-rc3
- update riscv_fill_hwcap to probe Svinval extension

 arch/riscv/mm/tlbflush.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 9b6e86ce3867..d3396619d8c4 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -6,6 +6,28 @@
 #include <linux/hugetlb.h>
 #include <asm/sbi.h>
 #include <asm/mmu_context.h>
+#include <asm/cpufeature.h>
+
+#define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
+
+static inline void local_sfence_inval_ir(void)
+{
+	asm volatile(SFENCE_INVAL_IR() ::: "memory");
+}
+
+static inline void local_sfence_w_inval(void)
+{
+	asm volatile(SFENCE_W_INVAL() ::: "memory");
+}
+
+static inline void local_sinval_vma(unsigned long vma, unsigned long asid)
+{
+	if (asid != FLUSH_TLB_NO_ASID)
+		asm volatile(SINVAL_VMA(%0, %1) : : "r" (vma), "r" (asid) :
+			     "memory");
+	else
+		asm volatile(SINVAL_VMA(%0, zero) : : "r" (vma) : "memory");
+}
 
 /*
  * Flush entire TLB if number of entries to be flushed is greater
@@ -26,6 +48,16 @@ static void local_flush_tlb_range_threshold_asid(unsigned long start,
 		return;
 	}
 
+	if (has_svinval()) {
+		local_sfence_w_inval();
+		for (i = 0; i < nr_ptes_in_range; ++i) {
+			local_sinval_vma(start, asid);
+			start += stride;
+		}
+		local_sfence_inval_ir();
+		return;
+	}
+
 	for (i = 0; i < nr_ptes_in_range; ++i) {
 		local_flush_tlb_page_asid(start, asid);
 		start += stride;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
