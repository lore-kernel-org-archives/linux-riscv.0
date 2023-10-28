Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67493C00141
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Oct 2023 23:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UTdTCNVfuJqxnTixd26Ly5vZCfKD+1FZCa1EDUWVXmw=; b=1e5XsP0+w1wgys
	14OQO5hTs8MHEk32jEzlIGsKfw7WxBwv2K0kQA2oL5LUL2+W5HQAasyzea13D8BQQL2jbJLvbi2KH
	Zbu2bgVThLEN8pJo2hCcUG+1Sd1o88LqfvUXcaU6hkHjULVnbumgTWJkJK0YHWrJ8cniYJmjCWQUu
	qbipKa39KBIpUzIBZ6JSVVOD7Yuy3AtyCZ0/hpfosOFu3edWKwu5BKFQm0hZVYP9SZ4mbd4IZOigI
	VcrOih/sJgu0o3RUTor69GwbqjZLfQ1Xmu04ngSOjmUa88B6y7LSTW+m5ZraRcLwDyGsk8aOdR2kc
	bt/KQT2b2URxIGd5jkPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwsV5-000vVS-1S;
	Sat, 28 Oct 2023 23:13:51 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwsUz-000vS8-2W
	for linux-riscv@lists.infradead.org;
	Sat, 28 Oct 2023 23:13:47 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6b709048d8eso2874933b3a.2
        for <linux-riscv@lists.infradead.org>; Sat, 28 Oct 2023 16:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698534824; x=1699139624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4NRNhpDELMiOf33wYuzLfhwPwCzaIpnJue9EEzIQdY=;
        b=bQEkK+8Aox+2ymqbxmZ+yoGMQ644R/uIL5aBiBqyzecTPCD7/4gPy0Rbln0AkhYp6A
         Qrs/niVH2ViRpj5CdVhhj5YYqTbE786K35b41CUjLlbjUWaoLvvQAKyhT7FJu8F+1AYE
         e5UlYHLEVktx/bHveEcz+bhzv8wfbne2CpuvMwo1d8XfbEGRVW4SocfJEESZCKJTvUbh
         nq80u5h399fRl+MPZovwZFjbcJ3t0ueaGj+X2DfO60ntzdVfHW55MEryU68kUf5fqdxV
         5G0ZrIT5axY7s+xwjxKZw8jA6mJXoGdycUd/MJlIo50AkoFJHGMj442jMGx28rs1nN57
         Hsog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698534824; x=1699139624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4NRNhpDELMiOf33wYuzLfhwPwCzaIpnJue9EEzIQdY=;
        b=R/F/YMY/AM8LMyF3GDDSVvwvaYJYjb3bTHbHRLCioDtXFXVUD6zsxfVd8qkdT9ScM4
         Tjuk+GhYNCmdzk6n3+N64i9jD3/thXxCV9SBD4kKznm91WfOBurdCm0EIVnRtYwDRB6S
         7c65O/CjVPS6ZGEAyL8J5v3WX0jsFY7DcFdCljA1SAVLeZnonlAMi3UwyLHjg3Oe6Fqq
         YlSTkTGTcQqJW+ScxhbVq8QhwM8DKMCaYFwwP4CY2+EEVQnAJkKuoL7MwTNnKGShJTU6
         S8DboGkhw3f8/0rsBX9jlw68zMNCrgtzFon+9H6takHeAKxtdiS5TndZf8S935yCv1GM
         /AEA==
X-Gm-Message-State: AOJu0Yysde/yV/ZYrIGElA8d1FPhakBuuCjb2AvCFPyJIKI9V0BPUxo3
	t7LFIMr8oK5XlB6MRsQ1I8IsjxPsgMZu8MXYq5o=
X-Google-Smtp-Source: AGHT+IHFtwqkvMLL8vTXw7lsMTaEWiNW/nYYuBPFSSXqkCgtp1/aoWCoS2LcxRJlFYSU2eWn0N2URQ==
X-Received: by 2002:a05:6a21:3b45:b0:16b:a5fb:eee5 with SMTP id zy5-20020a056a213b4500b0016ba5fbeee5mr5984191pzb.28.1698534824609;
        Sat, 28 Oct 2023 16:13:44 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u17-20020a17090341d100b001b8622c1ad2sm3679345ple.130.2023.10.28.16.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 16:13:43 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 02/11] riscv: Improve flush_tlb_range() for hugetlb pages
Date: Sat, 28 Oct 2023 16:12:00 -0700
Message-ID: <20231028231339.3116618-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231028231339.3116618-1-samuel.holland@sifive.com>
References: <20231028231339.3116618-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_161345_819312_F29B36C1 
X-CRM114-Status: GOOD (  14.54  )
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

From: Alexandre Ghiti <alexghiti@rivosinc.com>

flush_tlb_range() uses a fixed stride of PAGE_SIZE and in its current form,
when a hugetlb mapping needs to be flushed, flush_tlb_range() flushes the
whole tlb: so set a stride of the size of the hugetlb mapping in order to
only flush the hugetlb mapping. However, if the hugepage is a NAPOT region,
all PTEs that constitute this mapping must be invalidated, so the stride
size must actually be the size of the PTE.

Note that THPs are directly handled by flush_pmd_tlb_range().

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
[Samuel: Removed CONFIG_RISCV_ISA_SVNAPOT check]
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Rebase on Alexandre's "riscv: tlb flush improvements" series v5

 arch/riscv/mm/tlbflush.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index fa03289853d8..b6d712a82306 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -3,6 +3,7 @@
 #include <linux/mm.h>
 #include <linux/smp.h>
 #include <linux/sched.h>
+#include <linux/hugetlb.h>
 #include <asm/sbi.h>
 #include <asm/mmu_context.h>
 
@@ -147,7 +148,33 @@ void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		     unsigned long end)
 {
-	__flush_tlb_range(vma->vm_mm, start, end - start, PAGE_SIZE);
+	unsigned long stride_size;
+
+	if (!is_vm_hugetlb_page(vma)) {
+		stride_size = PAGE_SIZE;
+	} else {
+		stride_size = huge_page_size(hstate_vma(vma));
+
+		/*
+		 * As stated in the privileged specification, every PTE in a
+		 * NAPOT region must be invalidated, so reset the stride in that
+		 * case.
+		 */
+		if (has_svnapot()) {
+			if (stride_size >= PGDIR_SIZE)
+				stride_size = PGDIR_SIZE;
+			else if (stride_size >= P4D_SIZE)
+				stride_size = P4D_SIZE;
+			else if (stride_size >= PUD_SIZE)
+				stride_size = PUD_SIZE;
+			else if (stride_size >= PMD_SIZE)
+				stride_size = PMD_SIZE;
+			else
+				stride_size = PAGE_SIZE;
+		}
+	}
+
+	__flush_tlb_range(vma->vm_mm, start, end - start, stride_size);
 }
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
