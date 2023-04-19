Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD73C77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ug8mUdNFHlvl32MBqviGEAxIIcxYqG/mNFLsAR4uTZY=; b=Lt9xe3/annbOuw
	oGjMv+SaPaK/1nBcz6FlZXggBLDocDIB8fFAlaLS8U8KO3rBNIUlNtcdlLMJtzGKZDhSDGJJCs4r8
	rp+rCCU60vPQ6K+2Baw55vIgspG+SVf/3X05H3IcRXFyLHqqJNPa+XY3FQ6m5YsUelB1muqh9UcJW
	5zyl0FRshulseltyL+9h1ryCkUIR8AeCEB5nbiBaPDEr84XwcrwvHpJV5Hb1jVxsVQg0dUtXUVnTC
	7ySrGtD6JLHFQzZJc65ROfxHili88MEAQW4G+2tz5FvivV+r5sZGCEeZOUKoe6nZynTBx+loWCjvS
	gJn4DU+zvFGMMOBIUG0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGQw-006X0Q-29;
	Wed, 19 Apr 2023 22:37:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGQn-006WXV-0B
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Apr 2023 22:37:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=LUld/G/1WeH25lUdXRYxnjPYZXeYYgEcmI7A3/bRIcw=; b=eJXo7HjH5vYPqWNF4d729XqpRB
	UCZbYawxPRX+ceQ0V9OlXPpPeOOhKV2ELt8nL0q3PZyKVZEC9ZLEXIoN1RgDaBwBedWniXqydIeMs
	71YSpYfOFZQ/nO0qO/gwA7eEVaIIosL26RenbXL/reVe0aXlwOX6MudiFfpdjLuFZGuEYgq+UL6DY
	OQZHjTsR84uzSckPQzJBDCIdwazHb/SqBqZuoFE32AtlwAmSCNOueBmLTZ3cBdhbZ1N5HqDj8em7j
	3cCpGnGP853xpCboE7ZLwD4kjSEShg6ZfbTKPZmBDo7mPTkUDB3FVSN+Y1mg7bm0M+HaN11zTiTjv
	VkygLfoA==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ppG7l-00De9m-2M
	for linux-riscv@lists.infradead.org; Wed, 19 Apr 2023 22:18:07 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-63b4dfead1bso375904b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942678; x=1684534678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUld/G/1WeH25lUdXRYxnjPYZXeYYgEcmI7A3/bRIcw=;
        b=3BXkkvcr1OqHpZ/1lavYXP7tve2GxDnWf4O2fWPOiSdbOWRF8chSO/YIyqpEuxWDXh
         BJ7QFDeoj+Jn0Arzj7+Z5YjQU574gbvT6cAETsRRSqDeVkx/Ylx7RmGaHK6RFXNh6Eit
         fV0M97Hugr5QTbW1u6+18YRRaKIRIagsziaBLExN4bCT6bnocXCkvHc2Ew+80dXvoOZo
         BF8+iOJKnVBNIx5dtVYx6vnMu5+ZMBbkouCan/31RqRplh6dabd1rARUBLlSsQGaKiSb
         4trlbYIIc+EnwzxQuThX6PKBOpT5C2rO+n2a+7R9hS1L0V6qAuL49rS0jBoNV5zJv4h3
         Joww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942678; x=1684534678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUld/G/1WeH25lUdXRYxnjPYZXeYYgEcmI7A3/bRIcw=;
        b=if/i+A2iH3bnzB2FQB/aB20QMEIZa1ZQSw6FCPL1VVwDEoqcJppwTiWkikmiD55oM6
         vvGpOkUCzeviTr9eK3KEN7T/82pmtFKhfRtx8fbvpECKn9DmSqMS+xREF195ox/GyVUW
         RGOOuVg4GcASwABol4t15e0UwFthVfehUNRf1vbQC6Jc0GZiVDi5VthgL0CJcYDgULHB
         tws07RoDHaj/4hG7TeUkYpMrdcvUdyWZ5MdxdNkgLxxSCHx1BToeWwJr4eUD80HjkjgR
         qxrMvO8DJftONFmju8DyL11lxPN5LU79Lrvc+3O59JikMUzUSW8lwvKwgHEG/TCOJ7Fc
         xbFw==
X-Gm-Message-State: AAQBX9dQacdaxAo4NzGwiUaWLtCLg3+fX7XaxZ/bhchfd5j+kC+Bz2Zy
	kN1oxsABmXjR650mzP0QZMA50w==
X-Google-Smtp-Source: AKy350bb7O7vRNJqV0slEkpJiEEitj66qfL0H4rvbzo6EDHZOM2g1chblrb/iCkgTowCPCRsrQSCkw==
X-Received: by 2002:a17:902:eb8d:b0:19c:f476:4793 with SMTP id q13-20020a170902eb8d00b0019cf4764793mr5940941plg.51.1681942678346;
        Wed, 19 Apr 2023 15:17:58 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:17:58 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 13/48] RISC-V: KVM: Return early for gstage modifications
Date: Wed, 19 Apr 2023 15:16:41 -0700
Message-Id: <20230419221716.3603068-14-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_231801_165286_F66EB8BB 
X-CRM114-Status: GOOD (  13.61  )
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

The gstage entries for CoVE VM is managed by the TSM. Return
early for any gstage pte modification operations.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/mmu.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 6b037f7..9693897 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -16,6 +16,9 @@
 #include <linux/kvm_host.h>
 #include <linux/sched/signal.h>
 #include <asm/kvm_nacl.h>
+#include <asm/csr.h>
+#include <asm/kvm_host.h>
+#include <asm/kvm_cove.h>
 #include <asm/page.h>
 #include <asm/pgtable.h>
 
@@ -356,6 +359,11 @@ int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
 		.gfp_zero = __GFP_ZERO,
 	};
 
+	if (is_cove_vm(kvm)) {
+		kvm_debug("%s: KVM doesn't support ioremap for TVM io regions\n", __func__);
+		return -EPERM;
+	}
+
 	end = (gpa + size + PAGE_SIZE - 1) & PAGE_MASK;
 	pfn = __phys_to_pfn(hpa);
 
@@ -385,6 +393,10 @@ int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
 
 void kvm_riscv_gstage_iounmap(struct kvm *kvm, gpa_t gpa, unsigned long size)
 {
+	/* KVM doesn't map any IO region in gstage for TVM */
+	if (is_cove_vm(kvm))
+		return;
+
 	spin_lock(&kvm->mmu_lock);
 	gstage_unmap_range(kvm, gpa, size, false);
 	spin_unlock(&kvm->mmu_lock);
@@ -431,6 +443,10 @@ void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 	gpa_t gpa = slot->base_gfn << PAGE_SHIFT;
 	phys_addr_t size = slot->npages << PAGE_SHIFT;
 
+	/* No need to unmap gstage as it is managed by TSM */
+	if (is_cove_vm(kvm))
+		return;
+
 	spin_lock(&kvm->mmu_lock);
 	gstage_unmap_range(kvm, gpa, size, false);
 	spin_unlock(&kvm->mmu_lock);
@@ -547,7 +563,7 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 {
-	if (!kvm->arch.pgd)
+	if (!kvm->arch.pgd || is_cove_vm(kvm))
 		return false;
 
 	gstage_unmap_range(kvm, range->start << PAGE_SHIFT,
@@ -561,7 +577,7 @@ bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	int ret;
 	kvm_pfn_t pfn = pte_pfn(range->pte);
 
-	if (!kvm->arch.pgd)
+	if (!kvm->arch.pgd || is_cove_vm(kvm))
 		return false;
 
 	WARN_ON(range->end - range->start != 1);
@@ -582,7 +598,7 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	u32 ptep_level = 0;
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
 
-	if (!kvm->arch.pgd)
+	if (!kvm->arch.pgd || is_cove_vm(kvm))
 		return false;
 
 	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
@@ -600,7 +616,7 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	u32 ptep_level = 0;
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
 
-	if (!kvm->arch.pgd)
+	if (!kvm->arch.pgd || is_cove_vm(kvm))
 		return false;
 
 	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
@@ -737,6 +753,10 @@ void kvm_riscv_gstage_free_pgd(struct kvm *kvm)
 {
 	void *pgd = NULL;
 
+	/* PGD is mapped in TSM */
+	if (is_cove_vm(kvm))
+		return;
+
 	spin_lock(&kvm->mmu_lock);
 	if (kvm->arch.pgd) {
 		gstage_unmap_range(kvm, 0UL, gstage_gpa_size, false);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
