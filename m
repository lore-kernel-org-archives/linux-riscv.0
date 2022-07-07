Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C48C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 14:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lbx1Xa00ElwPzgeme/lQP8sZ9cJypDtYXfu7nLyg7WE=; b=aOjevqrfCECsC9
	FlpUuSRQneaYNXbYXPlJ8pLcTNW/0uJsudu/8duliGjApZ0tzPgLEAxzz5mNt0CCEfqEdzfbGupSd
	2ZEw4LTf6EXoA66I7r71PaUXV8xg0Nf1icWgSYqm8P6I5dxu3u3U6BeQdPvi/MYxVsoOPUgJr3M4I
	Y+piLGtK29Ngy+xGZdCavCMSwWmbwjZ+L0jNd8A406vozUXZ9/Kncs5Uo5LEdZr9iM64gtVEtBp7Y
	ycgwo08APr5NOtoAFUH3qZVum6W5YWO5dkkjcxWMWavpjYklHqUG+oFf77xoAJ+4OWuU8f2QLkvNw
	J6+kk1z+fvrH8el1hyig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Ssz-00GdPt-Gb; Thu, 07 Jul 2022 14:53:45 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Ssl-00GdH1-M8
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 14:53:33 +0000
Received: by mail-pg1-x531.google.com with SMTP id z14so19020266pgh.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 Jul 2022 07:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fCJ8QaefSod2FLdMLTYJXcVAzkRtmLMvuXzW7AhKtNg=;
        b=ohr/MWgS1UQ+/RqKaVwpKraOsQZDAN9is50wEwY0SGO1YKNeTXChx9AZGHKtXsBBmy
         Mbp1n9fspU0TeIVN1VIrNZ7vPZzdDx1q/Eo3o+Na38S4wjuQ9jCi/QPL3PhU9kb/Nz/N
         sL7Rz0wsEVRNOzl7JGtvop7SVc9OQepRnfWrIGfdYy3U3WujeOLTny3Fd6p4OIHTVuHw
         4ONX7nnB1kHQspD5L7+rNnmUdBwLlETywejxdMnqyA0LRUWtz6nWWNUkg71C2DAp9YiA
         Lh8Sf6yiCI4CbfCT+V+YntxYuQbEXcjqhGU/Hp7/b8bbJY6ZjnWH/G9c31yRwu+6L7qe
         nZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fCJ8QaefSod2FLdMLTYJXcVAzkRtmLMvuXzW7AhKtNg=;
        b=FPhaL9BqyWBp80Ii7eSzPsW++aM6c5ZNLEpCsufRhk8hJg61VOEb5fF2wPQQtZgpcW
         rQYbxxYOMk9/Xb1YRbhkVHbWByDVVT4cI+KrmMuPcz1fcKyeymF8RRrk9HRmtv14sWV/
         5E9SWbOV3QGd5AV7q33lfHa4jzYZ9XNlUYja5fYUJQfDmcf2BNIS6AHDWjyw+dQJrcvJ
         qu12oh7extN8pMOXmb0s5zK1yaFwC+Li7E2nke1z0fgs5z3rEa2bJyZkh8Qa5bROm7pr
         XDAYuk/lkOCrI5qrzNFYURk8OJ1q9sudcPh9iGHeDAopcF7UvrDC1u1CzLkwzA+R7bI1
         m3UQ==
X-Gm-Message-State: AJIora8VI+a0aVAxPoKlEBwNRHe+2+7v2rDbG1+Xzyly0LTXrXwRFDdm
	om2GhFYKuPSSPo6Qc+u5JsBmhw==
X-Google-Smtp-Source: AGRyM1snRoAR3IesxARH9go1XUXWfZLlCv+MUuUz10z6M/0+3rvZbNtTwjV0qKUuBZJUWXwPPcq4Ag==
X-Received: by 2002:a17:903:124c:b0:16b:a568:996d with SMTP id u12-20020a170903124c00b0016ba568996dmr45373917plh.169.1657205610537;
        Thu, 07 Jul 2022 07:53:30 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([223.226.40.162])
        by smtp.gmail.com with ESMTPSA id b26-20020aa7951a000000b0052535e7c489sm27144231pfp.114.2022.07.07.07.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 07:53:29 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 3/5] RISC-V: KVM: Add G-stage ioremap() and iounmap() functions
Date: Thu,  7 Jul 2022 20:22:46 +0530
Message-Id: <20220707145248.458771-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220707145248.458771-1-apatel@ventanamicro.com>
References: <20220707145248.458771-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_075331_774695_E424D15B 
X-CRM114-Status: GOOD (  11.56  )
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

The in-kernel AIA IMSIC support requires on-demand mapping / unmapping
of Guest IMSIC address to Host IMSIC guest files. To help achieve this,
we add kvm_riscv_stage2_ioremap() and kvm_riscv_stage2_iounmap()
functions. These new functions for updating G-stage page table mappings
will be called in atomic context so we have special "in_atomic" parameter
for this purpose.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h |  5 +++++
 arch/riscv/kvm/mmu.c              | 18 ++++++++++++++----
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 59a0cf2ca7b9..60c517e4d576 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -284,6 +284,11 @@ void kvm_riscv_hfence_vvma_gva(struct kvm *kvm,
 void kvm_riscv_hfence_vvma_all(struct kvm *kvm,
 			       unsigned long hbase, unsigned long hmask);
 
+int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
+			     phys_addr_t hpa, unsigned long size,
+			     bool writable, bool in_atomic);
+void kvm_riscv_gstage_iounmap(struct kvm *kvm, gpa_t gpa,
+			      unsigned long size);
 int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 			 struct kvm_memory_slot *memslot,
 			 gpa_t gpa, unsigned long hva, bool is_write);
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index b75d4e200064..f7862ca4c4c6 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -343,8 +343,9 @@ static void gstage_wp_memory_region(struct kvm *kvm, int slot)
 	kvm_flush_remote_tlbs(kvm);
 }
 
-static int gstage_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
-			  unsigned long size, bool writable)
+int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
+			     phys_addr_t hpa, unsigned long size,
+			     bool writable, bool in_atomic)
 {
 	pte_t pte;
 	int ret = 0;
@@ -353,6 +354,7 @@ static int gstage_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
 	struct kvm_mmu_memory_cache pcache;
 
 	memset(&pcache, 0, sizeof(pcache));
+	pcache.gfp_custom = (in_atomic) ? GFP_ATOMIC | __GFP_ACCOUNT : 0;
 	pcache.gfp_zero = __GFP_ZERO;
 
 	end = (gpa + size + PAGE_SIZE - 1) & PAGE_MASK;
@@ -382,6 +384,13 @@ static int gstage_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
 	return ret;
 }
 
+void kvm_riscv_gstage_iounmap(struct kvm *kvm, gpa_t gpa, unsigned long size)
+{
+	spin_lock(&kvm->mmu_lock);
+	gstage_unmap_range(kvm, gpa, size, false);
+	spin_unlock(&kvm->mmu_lock);
+}
+
 void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 					     struct kvm_memory_slot *slot,
 					     gfn_t gfn_offset,
@@ -517,8 +526,9 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 				goto out;
 			}
 
-			ret = gstage_ioremap(kvm, gpa, pa,
-					     vm_end - vm_start, writable);
+			ret = kvm_riscv_gstage_ioremap(kvm, gpa, pa,
+						       vm_end - vm_start,
+						       writable, false);
 			if (ret)
 				break;
 		}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
