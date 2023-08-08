Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4D0C001E0
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 23:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PKu79FY6OKNAsHMT8Etq5m5YKdOVJVNPORSmBvzanr0=; b=aXktf8QL8tOSFnxLm1c5whQuXt
	rPeNyzoSmvLXkn12u2o0Z4Djn8LCnokJnmV1YkOOT+emtsGdOIixmPMtk6+FUpyLOJjXl8jWRc8Ed
	9ePMcXl1G29aJ+J0hNbGPL+xGWXm98gtUvn4C6x2zf94/NjAsdwf5qQ6gORHryulk3+j/62+j7JwN
	0bJJCYUYQBiZj7WpkJRTcXvWfatrkrVdGzhK2vU3254M1S/OQcxMD2pNWEssKfwfImVEumRh9Y1dG
	1Eve0kAv0eYcIMiiv1mJFVIqz636DsQNqz8V92QFOh05j88dQVUK7r9ut65qggxQhLM0X9aIu3xcP
	lj16TRBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTVuO-003e3D-2L;
	Tue, 08 Aug 2023 23:14:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTVti-003dJX-0I
	for linux-riscv@bombadil.infradead.org;
	Tue, 08 Aug 2023 23:13:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EbIRM778vEtJ8vWvhEMC2KLHHOEdIHGrq5z82YRomuQ=; b=YKKquQ+zUs7pNkZ+9vNQvLkgey
	psvKdwvni4hP6t5t//Q+ZmLJ4RuAk7yDM4yU0ljfGtY05MJi8SNQniKUJdrRvgbyHRlO603v1YMz8
	jfLnEhD2bPDXeIg7eTkhwFEWQWcwBZvORmm+MY259KmpvPJgAycnMZa5Pafj6EhzV+ABWOV8NGUiC
	Rsb2eI0zs+LwGZhGFCIb9cDI+KtlN1BaufFun+PpIfh2vhH4We0YtLmY4KbajRcXowYqdQavFtDdo
	IwLIy+Hz7I4dYFoGgPSKRPubyGfloTKBYPnGbsSx+53Ap4qD5LpWb+1ODgXcwYiMrVQg0EtdAJ7lO
	n/TPKv7A==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTVtX-0057lo-1O
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 23:13:48 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-56942667393so77743997b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 16:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691536420; x=1692141220;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EbIRM778vEtJ8vWvhEMC2KLHHOEdIHGrq5z82YRomuQ=;
        b=bKvtNHGSvuJp2zqnSdoMkiGVpjkiGLOxNjSdkIgER1Zdna1MWeHTf9G9gAIOW6bDNu
         ZJm9xaGVD14fHa3fYBaKXTeFMtYpHZo20pdswwAUkBImXBacCufsZFDb5raNvi4h+28W
         i3AOuKTe1lqg90upzZfwofEHk1NTsWkytPLN6wQ/qeOLTv8ZxQQLGXH6Q0qxQz1An7xM
         Ku6ZWNtvVot/oo9ROsoKcbt4dAQdiDq8etGt/0YX943OPvbH+t/iOzucdKC/SFHiFYb7
         OTWFNaQW3q3Otg2LOg2Qd4esvihImxDOuOGWjRln2q12LolXg4KMvnUbhd4/HPRsTcfv
         Sh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691536420; x=1692141220;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EbIRM778vEtJ8vWvhEMC2KLHHOEdIHGrq5z82YRomuQ=;
        b=gr2XmKY9c7ESpW0ApPmWyJabl8K+unb/1nePWSbZemlakmD5j28golsEEXdoScbpvp
         wWU/Oy8sOLQnDAa2j/v7065tVyFHc8E3EbfHDyIxMM0AKSdFygh+4WaDdgUNum0HuZVr
         Ve4yR+VrCM8aJlL32DAlNJuNc+usX2L8BnNZIO66BTfK9ZZ/GSp3tqJSu0WJAwzgL2Bz
         8WanHl9VQFHHU3zRvXom3OxHYZDhhyvTDmXugbJOVK5RFlDckGIeSZQFdqNS1GBpA7dU
         pbV3bB2KZGnme5RmLGtTtHwASre2qsXlPHf+UwAIeu23Uh6zYmU/yS2mYoAR7t2ETRAC
         0SIw==
X-Gm-Message-State: AOJu0YzXFoaJTe8GNQj9/iHA0J321wBO8m0SzUbn7Jx6+rz3CLvV3iqb
	GbXmYaY9z89UrU6e8+5deZXjax+DVOUI
X-Google-Smtp-Source: AGHT+IHaShLlv9O1yBtKO3H2sibMGhr0bad7TgyyGlfrw9JZmZ9g7Xq+c+3UitlQEGZVwD9RTySQ7Yzi+Jp+
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a25:860e:0:b0:d5d:511b:16da with SMTP id
 y14-20020a25860e000000b00d5d511b16damr19364ybk.2.1691536419844; Tue, 08 Aug
 2023 16:13:39 -0700 (PDT)
Date: Tue,  8 Aug 2023 23:13:21 +0000
In-Reply-To: <20230808231330.3855936-1-rananta@google.com>
Mime-Version: 1.0
References: <20230808231330.3855936-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230808231330.3855936-6-rananta@google.com>
Subject: [PATCH v8 05/14] KVM: Allow range-based TLB invalidation from common code
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Reiji Watanabe <reijiw@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Raghavendra Rao Anata <rananta@google.com>, 
	David Matlack <dmatlack@google.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Gavin Shan <gshan@redhat.com>, Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_001346_592467_685AA876 
X-CRM114-Status: GOOD (  13.92  )
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

From: David Matlack <dmatlack@google.com>

Make kvm_flush_remote_tlbs_range() visible in common code and create a
default implementation that just invalidates the whole TLB.

This paves the way for several future features/cleanups:

 - Introduction of range-based TLBI on ARM.
 - Eliminating kvm_arch_flush_remote_tlbs_memslot()
 - Moving the KVM/x86 TDP MMU to common code.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/x86/include/asm/kvm_host.h |  2 ++
 arch/x86/kvm/mmu/mmu.c          |  8 ++++----
 arch/x86/kvm/mmu/mmu_internal.h |  3 ---
 include/linux/kvm_host.h        | 12 ++++++++++++
 virt/kvm/kvm_main.c             | 13 +++++++++++++
 5 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index a2d3cfc2eb75c..b547d17c58f63 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1804,6 +1804,8 @@ static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
 		return -ENOTSUPP;
 }
 
+#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
+
 #define kvm_arch_pmi_in_guest(vcpu) \
 	((vcpu) && (vcpu)->arch.handling_intr_from_guest)
 
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index ec169f5c7dce2..6adbe6c870982 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -278,16 +278,16 @@ static inline bool kvm_available_flush_remote_tlbs_range(void)
 	return kvm_x86_ops.flush_remote_tlbs_range;
 }
 
-void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn,
-				 gfn_t nr_pages)
+int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn,
+				      u64 nr_pages)
 {
 	int ret = -EOPNOTSUPP;
 
 	if (kvm_x86_ops.flush_remote_tlbs_range)
 		ret = static_call(kvm_x86_flush_remote_tlbs_range)(kvm, start_gfn,
 								   nr_pages);
-	if (ret)
-		kvm_flush_remote_tlbs(kvm);
+
+	return ret;
 }
 
 static gfn_t kvm_mmu_page_get_gfn(struct kvm_mmu_page *sp, int index);
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index d39af5639ce97..86cb83bb34804 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -170,9 +170,6 @@ bool kvm_mmu_slot_gfn_write_protect(struct kvm *kvm,
 				    struct kvm_memory_slot *slot, u64 gfn,
 				    int min_level);
 
-void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn,
-				 gfn_t nr_pages);
-
 /* Flush the given page (huge or not) of guest memory. */
 static inline void kvm_flush_remote_tlbs_gfn(struct kvm *kvm, gfn_t gfn, int level)
 {
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index ade5d4500c2ce..f0be5d9c37dd1 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1359,6 +1359,7 @@ int kvm_vcpu_yield_to(struct kvm_vcpu *target);
 void kvm_vcpu_on_spin(struct kvm_vcpu *vcpu, bool yield_to_kernel_mode);
 
 void kvm_flush_remote_tlbs(struct kvm *kvm);
+void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 nr_pages);
 
 #ifdef KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE
 int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min);
@@ -1488,6 +1489,17 @@ static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
 int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
 #endif
 
+#ifndef __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
+static inline int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
+						    gfn_t gfn, u64 nr_pages)
+{
+	return -EOPNOTSUPP;
+}
+#else
+int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
+				      gfn_t gfn, u64 nr_pages);
+#endif
+
 #ifdef __KVM_HAVE_ARCH_NONCOHERENT_DMA
 void kvm_arch_register_noncoherent_dma(struct kvm *kvm);
 void kvm_arch_unregister_noncoherent_dma(struct kvm *kvm);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d6b0507861550..26e91000f579d 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -366,6 +366,19 @@ void kvm_flush_remote_tlbs(struct kvm *kvm)
 }
 EXPORT_SYMBOL_GPL(kvm_flush_remote_tlbs);
 
+void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 nr_pages)
+{
+	if (!kvm_arch_flush_remote_tlbs_range(kvm, gfn, nr_pages))
+		return;
+
+	/*
+	 * Fall back to a flushing entire TLBs if the architecture range-based
+	 * TLB invalidation is unsupported or can't be performed for whatever
+	 * reason.
+	 */
+	kvm_flush_remote_tlbs(kvm);
+}
+
 static void kvm_flush_shadow_all(struct kvm *kvm)
 {
 	kvm_arch_flush_shadow_all(kvm);
-- 
2.41.0.640.ga95def55d0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
