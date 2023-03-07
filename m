Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E416EC6FD1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 17:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KW8eoX6CVc81pI5o4h+iDV+1aSp8V4yW6LqPhfekARE=; b=otaV0lfKs/QdXH
	cJ/w4wGDrqDrlCM5AKYtNpr7flfo/09VXFYZ87QxUOJkDI64Bd543oyyiEfzRhYi30UhKyn6cOaxl
	5i10xsM/81FyuRksQs2wpx2N0ElUtQHlrMcOVE6ontjEfRZmnO2g2jnKUjIvdkQuy7ykiMB9d6DZk
	fUuqZhw5N0OcWSW0dh0BLL5z5HaxF0Yii/MFub7HCC8oJ9igZoIQjg3ksNuuCVJk4CCF8QUIqzJRi
	czuhYwr+bBo3UtVX04A3+PqZJS94MpY1Lrc8uXfDxd9zAoIctr4NhrtDHukmvAb6FCIlTqM63rPub
	ylqaL+dRDKNmFRzXdqXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZbBg-001oyw-Vw; Tue, 07 Mar 2023 17:33:21 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZbBX-001okj-RX
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 17:33:14 +0000
Received: by mail-pl1-x633.google.com with SMTP id i5so14939395pla.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 09:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1678210391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhoxkcYGcQslA0UXxBRCIsDkoFsS09fOQ+XclLq53kM=;
        b=mO39Qo6ECScoQF+IDHRN1zjrEj8GF0iEketodESa4sMOO0NRvK8FPOdWkZ5/ZTd/SI
         HdAzpeIY5BrW7XUg3idWI6RrqTOeo00liqlZaOg/uNVjuyeLgWwebM7n9GW4xWG68dx+
         SXrVveli12m5pjVjKQ6qnc1v3XNlc1WT6AVDuPcDjK3/cV90H4x5b44Urll9WKHR1w13
         rku2ctQJjRYweu/6+fy5OQ+Kdwqgit7t0Fs3vx45orGTkvgerSaylqRD4JlhPXH0/sAt
         eO58HowFq49cstUJQOU/muo2osnG/IFqsPQ6mofwOnY63uPFyfzgWorVFiyXnrQMaG4P
         XRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678210391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rhoxkcYGcQslA0UXxBRCIsDkoFsS09fOQ+XclLq53kM=;
        b=C+KLtjWg4EGtAPey3c6NibgkJ8arXbRqgOPAEapBSXiFy38Cy8QHJKj+9cXl1kO/KS
         0jAmcWxXVdCpMowu3HGLh2mWXf/Qlg7lIPuAnQqZQJWlSlnFjMaMNHRPBjrBAEhKBZbt
         oLWT6ZFYF/F3W1LmDAQ6YzSPsnbpWOOY7NNL8mONcIaSBmuiWf31wuhgJ+/CB+3L0BFC
         ezaiZkbjK6DjXSLqjiswokXwCrbfd0QdCHT6N4gy+ZHCF+RZZzW8GIafnNaUJEKbLxCU
         kCv2a9pP2e/6riOmjNujk87FPCJ7RTSIAEu4kZHWXrP5a9bepw4Sq8pPD5vY0IrJ3369
         kRpA==
X-Gm-Message-State: AO0yUKUW539FfxU4RIVO4WKHZywTXXatf34ymM6O8L37uqMYCYzV4ryq
	YzugxQCNZTMrFSBUlqJs6slA3Q==
X-Google-Smtp-Source: AK7set9rOJtXJscQ0vI9n+jnJLJIokrmeDZhJPAbMuRjssm/if74yj3G18y2Qge0STp7hZ1msOAxdw==
X-Received: by 2002:a05:6a20:1a9d:b0:be:a3b2:cc7d with SMTP id ci29-20020a056a201a9d00b000bea3b2cc7dmr13196243pzb.6.1678210391327;
        Tue, 07 Mar 2023 09:33:11 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id 1-20020a630301000000b004fb11a7f2d4sm7996185pgd.57.2023.03.07.09.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 09:33:10 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v17 5/7] RISC-V: Use IPIs for remote TLB flush when possible
Date: Tue,  7 Mar 2023 23:02:29 +0530
Message-Id: <20230307173231.2189275-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307173231.2189275-1-apatel@ventanamicro.com>
References: <20230307173231.2189275-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_093311_944803_D274D80D 
X-CRM114-Status: GOOD (  13.36  )
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

If we have specialized interrupt controller (such as AIA IMSIC) which
allows supervisor mode to directly inject IPIs without any assistance
from M-mode or HS-mode then using such specialized interrupt controller,
we can do remote TLB flushes directly from supervisor mode instead of
using the SBI RFENCE calls.

This patch extends remote TLB flush functions to use supervisor mode
IPIs whenever direct supervisor mode IPIs.are supported by interrupt
controller.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/mm/tlbflush.c | 93 +++++++++++++++++++++++++++++++++-------
 1 file changed, 78 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index ce7dfc81bb3f..91078377344d 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -7,14 +7,62 @@
 #include <asm/mmu_context.h>
 #include <asm/tlbflush.h>
 
+static inline void local_flush_tlb_range(unsigned long start,
+		unsigned long size, unsigned long stride)
+{
+	if (size <= stride)
+		local_flush_tlb_page(start);
+	else
+		local_flush_tlb_all();
+}
+
+static inline void local_flush_tlb_range_asid(unsigned long start,
+		unsigned long size, unsigned long stride, unsigned long asid)
+{
+	if (size <= stride)
+		local_flush_tlb_page_asid(start, asid);
+	else
+		local_flush_tlb_all_asid(asid);
+}
+
+static void __ipi_flush_tlb_all(void *info)
+{
+	local_flush_tlb_all();
+}
+
 void flush_tlb_all(void)
 {
-	sbi_remote_sfence_vma(NULL, 0, -1);
+	if (riscv_use_ipi_for_rfence())
+		on_each_cpu(__ipi_flush_tlb_all, NULL, 1);
+	else
+		sbi_remote_sfence_vma(NULL, 0, -1);
+}
+
+struct flush_tlb_range_data {
+	unsigned long asid;
+	unsigned long start;
+	unsigned long size;
+	unsigned long stride;
+};
+
+static void __ipi_flush_tlb_range_asid(void *info)
+{
+	struct flush_tlb_range_data *d = info;
+
+	local_flush_tlb_range_asid(d->start, d->size, d->stride, d->asid);
+}
+
+static void __ipi_flush_tlb_range(void *info)
+{
+	struct flush_tlb_range_data *d = info;
+
+	local_flush_tlb_range(d->start, d->size, d->stride);
 }
 
-static void __sbi_tlb_flush_range(struct mm_struct *mm, unsigned long start,
-				  unsigned long size, unsigned long stride)
+static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
+			      unsigned long size, unsigned long stride)
 {
+	struct flush_tlb_range_data ftd;
 	struct cpumask *pmask = &mm->context.tlb_stale_mask;
 	struct cpumask *cmask = mm_cpumask(mm);
 	unsigned int cpuid;
@@ -39,19 +87,34 @@ static void __sbi_tlb_flush_range(struct mm_struct *mm, unsigned long start,
 		cpumask_andnot(pmask, pmask, cmask);
 
 		if (broadcast) {
-			sbi_remote_sfence_vma_asid(cmask, start, size, asid);
-		} else if (size <= stride) {
-			local_flush_tlb_page_asid(start, asid);
+			if (riscv_use_ipi_for_rfence()) {
+				ftd.asid = asid;
+				ftd.start = start;
+				ftd.size = size;
+				ftd.stride = stride;
+				on_each_cpu_mask(cmask,
+						 __ipi_flush_tlb_range_asid,
+						 &ftd, 1);
+			} else
+				sbi_remote_sfence_vma_asid(cmask,
+							   start, size, asid);
 		} else {
-			local_flush_tlb_all_asid(asid);
+			local_flush_tlb_range_asid(start, size, stride, asid);
 		}
 	} else {
 		if (broadcast) {
-			sbi_remote_sfence_vma(cmask, start, size);
-		} else if (size <= stride) {
-			local_flush_tlb_page(start);
+			if (riscv_use_ipi_for_rfence()) {
+				ftd.asid = 0;
+				ftd.start = start;
+				ftd.size = size;
+				ftd.stride = stride;
+				on_each_cpu_mask(cmask,
+						 __ipi_flush_tlb_range,
+						 &ftd, 1);
+			} else
+				sbi_remote_sfence_vma(cmask, start, size);
 		} else {
-			local_flush_tlb_all();
+			local_flush_tlb_range(start, size, stride);
 		}
 	}
 
@@ -60,23 +123,23 @@ static void __sbi_tlb_flush_range(struct mm_struct *mm, unsigned long start,
 
 void flush_tlb_mm(struct mm_struct *mm)
 {
-	__sbi_tlb_flush_range(mm, 0, -1, PAGE_SIZE);
+	__flush_tlb_range(mm, 0, -1, PAGE_SIZE);
 }
 
 void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 {
-	__sbi_tlb_flush_range(vma->vm_mm, addr, PAGE_SIZE, PAGE_SIZE);
+	__flush_tlb_range(vma->vm_mm, addr, PAGE_SIZE, PAGE_SIZE);
 }
 
 void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		     unsigned long end)
 {
-	__sbi_tlb_flush_range(vma->vm_mm, start, end - start, PAGE_SIZE);
+	__flush_tlb_range(vma->vm_mm, start, end - start, PAGE_SIZE);
 }
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 			unsigned long end)
 {
-	__sbi_tlb_flush_range(vma->vm_mm, start, end - start, PMD_SIZE);
+	__flush_tlb_range(vma->vm_mm, start, end - start, PMD_SIZE);
 }
 #endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
