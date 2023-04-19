Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F8FC77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a9xUgF7pUNXoYbZsp+oZ6o2nv5KRwW13MdGWBAPCxyY=; b=jedvPobbCwLQhO
	VGNvsbykTQBZXf6qFG4M7bFO8pNEXCIrHr0L7AfOXHBVJsQPDElEr/NpuO7Kj3dVg5wGffiQMeqO9
	ENg6K1eYw5kiIhD6juSSX8XtBcSWx1q+iGAahmXPLZHQ05WoUbE8MnYXVNjzRhHbarwugCiN4oQZw
	1WPQwMxnZjOyp+sN3ueeOc7ghWGJ/Tb/jx74VopCxVrLTSteNzv8oY6AYTqR2HsnVu+oadk8qm+/S
	xdsD0s3CDbItMjoWcNlzDKc+dktr2UxK34dbg+tV1Vj8fS9KJkPh5ISbFzQZca8Q6cR8nlcfKrtZq
	NIQmZ123lm5PyJKmRNqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGQk-006WnM-2G;
	Wed, 19 Apr 2023 22:37:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGQg-006WXV-0d
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Apr 2023 22:37:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PU8iFueolrZCmcbo4gYTi+eKDv6f+PtpXTvRFNX2NZA=; b=DCIUkHCAO6LjgQqsEpU1VOVQPf
	NS8dP7W6hJjjh5QpqPVq0B4dfXrWned1Ls2iA8vYTUOZ+LUlH9Zvol0D39bEmSnB/+EZebNpvPH95
	ucIFGneDi/Cf84GtBgt/jauN+uMkoJbUUKI/GhUBWhgoZOcreQUgm82kmd4PnTDF3/kr8PyvShkMq
	Ua6F1K/xAzk1gEAiLOMwDtF5hQ6OcJVhIGNFv2KhpGxdXcubuHlM2C7RYDQMSYGcEMut9kCYA5wEQ
	y4F73AUD29li8ds2KZa2R8qGJ4ZV8V0rcMiJXDc8G0UI6SvSoo3qIedTgANqnlhf4wpHVFjWkELZE
	yXQOAEXw==;
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ppG8H-00DeGj-Ve
	for linux-riscv@lists.infradead.org; Wed, 19 Apr 2023 22:18:36 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-63b73203e0aso2785627b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942711; x=1684534711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PU8iFueolrZCmcbo4gYTi+eKDv6f+PtpXTvRFNX2NZA=;
        b=SCmbMjD55QloUYOgXX6MGUNEjAyAnMm/HfGRAGM1vS7vADDmD//a3bJ19IoxEPbsjR
         M2cj4sRqNKbEknJUmqcRzzuGvuAWBBnIZmhseVA9z0HrnfGvz/BvmurAl+ZaqdFV9z0+
         XE+By4GvDamj1V0iHkImOVtuMlZpTJ8+WBz54nyEAGyf404LButJI5R1r1M9kSp/2kE/
         u0yMzOB8MvU04pFuFPh8V3hwD0+VVdFu6iRbztwNwUe0wOuPOvAaUzMpoheX119q8fkx
         HByPgmjTnZTij1BszzopQyeoxfkgy1UkfAJB+AO4WFsTrtiA+xJhP2Ikh+DJT3BJUL+Y
         xQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942711; x=1684534711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PU8iFueolrZCmcbo4gYTi+eKDv6f+PtpXTvRFNX2NZA=;
        b=mAdjioR9VXDZ9XBNihI+dYA4Mw1KyH//KvJlVYl9lRe1cHsPZvgXNi1T/lkjGPv8xf
         2HTPzuct5QFbNoHFhlpNHQwninbffF5eLbEqaAZnevlNC1bjZbDwqO+NcBJEv7QKnu8x
         1KDDfscwgTrzGlcD6t04LGdhVbBD08fBw80rJmTmX1qKC59+gHN2WBBT+uBuPT6xzRwJ
         O4bSY7Fkov71FA4Wx/g5lqZKd9UzFCXEVJiGa1x1wgTLo2FIO/RrT7mo/sS9Vka14z84
         QxTCAhGe0UMLpyv43TgwpVypV7sL8F29FO+OnuxUCvfrtBfTZWIQeq86p0bZVQ1NJgOa
         8E8g==
X-Gm-Message-State: AAQBX9fzJhUUHDTUNmVjazwi1xucXpHu6PEmHBTE4CEYd0qtTsE5JajO
	/tgg6dd2I/m7Di3XL3WFxMUxTA==
X-Google-Smtp-Source: AKy350YxZk7F6dEeajji4ZjqoV6O38ZOLVkf4vnq1EOHfqdcV069hDfO+BMQgpUlX71NUn0DfXxZlw==
X-Received: by 2002:a17:90a:9e5:b0:246:aeee:e61c with SMTP id 92-20020a17090a09e500b00246aeeee61cmr4072001pjo.11.1681942711371;
        Wed, 19 Apr 2023 15:18:31 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:31 -0700 (PDT)
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
Subject: [RFC 28/48] RISC-V: KVM: Add interrupt management functions for TVM
Date: Wed, 19 Apr 2023 15:16:56 -0700
Message-Id: <20230419221716.3603068-29-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_231834_093564_B5D9BF0D 
X-CRM114-Status: GOOD (  22.18  )
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

The COVI SBI extension defines the functions related to interrupt
management for TVMs. These functions are the glue logic between
AIA code and the actually CoVE Interrupt SBI extension(COVI).

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_cove.h |  34 ++++
 arch/riscv/kvm/cove.c             | 256 ++++++++++++++++++++++++++++++
 2 files changed, 290 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_cove.h b/arch/riscv/include/asm/kvm_cove.h
index b63682f..74bad2f 100644
--- a/arch/riscv/include/asm/kvm_cove.h
+++ b/arch/riscv/include/asm/kvm_cove.h
@@ -61,10 +61,19 @@ struct kvm_riscv_cove_page {
 	unsigned long gpa;
 };
 
+struct imsic_tee_state {
+	bool bind_required;
+	bool bound;
+	int vsfile_hgei;
+};
+
 struct kvm_cove_tvm_vcpu_context {
 	struct kvm_vcpu *vcpu;
 	/* Pages storing each vcpu state of the TVM in TSM */
 	struct kvm_riscv_cove_page vcpu_state;
+
+	/* Per VCPU imsic state */
+	struct imsic_tee_state imsic;
 };
 
 struct kvm_cove_tvm_context {
@@ -133,6 +142,16 @@ int kvm_riscv_cove_vm_add_memreg(struct kvm *kvm, unsigned long gpa, unsigned lo
 int kvm_riscv_cove_gstage_map(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long hva);
 /* Fence related function */
 int kvm_riscv_cove_tvm_fence(struct kvm_vcpu *vcpu);
+
+/* AIA related CoVE functions */
+int kvm_riscv_cove_aia_init(struct kvm *kvm);
+int kvm_riscv_cove_vcpu_inject_interrupt(struct kvm_vcpu *vcpu, unsigned long iid);
+int kvm_riscv_cove_vcpu_imsic_unbind(struct kvm_vcpu *vcpu, int old_cpu);
+int kvm_riscv_cove_vcpu_imsic_bind(struct kvm_vcpu *vcpu, unsigned long imsic_mask);
+int kvm_riscv_cove_vcpu_imsic_rebind(struct kvm_vcpu *vcpu, int old_pcpu);
+int kvm_riscv_cove_aia_claim_imsic(struct kvm_vcpu *vcpu, phys_addr_t imsic_pa);
+int kvm_riscv_cove_aia_convert_imsic(struct kvm_vcpu *vcpu, phys_addr_t imsic_pa);
+int kvm_riscv_cove_vcpu_imsic_addr(struct kvm_vcpu *vcpu);
 #else
 static inline bool kvm_riscv_cove_enabled(void) {return false; };
 static inline int kvm_riscv_cove_init(void) { return -1; }
@@ -162,6 +181,21 @@ static inline int kvm_riscv_cove_vm_measure_pages(struct kvm *kvm,
 }
 static inline int kvm_riscv_cove_gstage_map(struct kvm_vcpu *vcpu,
 					    gpa_t gpa, unsigned long hva) {return -1; }
+/* AIA related TEE functions */
+static inline int kvm_riscv_cove_aia_init(struct kvm *kvm) { return -1; }
+static inline int kvm_riscv_cove_vcpu_inject_interrupt(struct kvm_vcpu *vcpu,
+						       unsigned long iid) { return -1; }
+static inline int kvm_riscv_cove_vcpu_imsic_unbind(struct kvm_vcpu *vcpu,
+						   int old_cpu) { return -1; }
+static inline int kvm_riscv_cove_vcpu_imsic_bind(struct kvm_vcpu *vcpu,
+						 unsigned long imsic_mask) { return -1; }
+static inline int kvm_riscv_cove_aia_claim_imsic(struct kvm_vcpu *vcpu,
+						 phys_addr_t imsic_pa) { return -1; }
+static inline int kvm_riscv_cove_aia_convert_imsic(struct kvm_vcpu *vcpu,
+						 phys_addr_t imsic_pa) { return -1; }
+static inline int kvm_riscv_cove_vcpu_imsic_addr(struct kvm_vcpu *vcpu) { return -1; }
+static inline int kvm_riscv_cove_vcpu_imsic_rebind(struct kvm_vcpu *vcpu,
+						   int old_pcpu) { return -1; }
 #endif /* CONFIG_RISCV_COVE_HOST */
 
 #endif /* __KVM_RISCV_COVE_H */
diff --git a/arch/riscv/kvm/cove.c b/arch/riscv/kvm/cove.c
index 4a8a8db..154b01a 100644
--- a/arch/riscv/kvm/cove.c
+++ b/arch/riscv/kvm/cove.c
@@ -8,6 +8,7 @@
  *     Atish Patra <atishp@rivosinc.com>
  */
 
+#include <linux/cpumask.h>
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/kvm_host.h>
@@ -137,6 +138,247 @@ __always_inline bool kvm_riscv_cove_enabled(void)
 	return riscv_cove_enabled;
 }
 
+static void kvm_cove_imsic_clone(void *info)
+{
+	int rc;
+	struct kvm_vcpu *vcpu = info;
+	struct kvm *kvm = vcpu->kvm;
+
+	rc = sbi_covi_rebind_vcpu_imsic_clone(kvm->arch.tvmc->tvm_guest_id, vcpu->vcpu_idx);
+	if (rc)
+		kvm_err("Imsic clone failed guest %ld vcpu %d pcpu %d\n",
+			 kvm->arch.tvmc->tvm_guest_id, vcpu->vcpu_idx, smp_processor_id());
+}
+
+static void kvm_cove_imsic_unbind(void *info)
+{
+	struct kvm_vcpu *vcpu = info;
+	struct kvm_cove_tvm_context *tvmc = vcpu->kvm->arch.tvmc;
+
+	/*TODO: We probably want to return but the remote function call doesn't allow any return */
+	if (sbi_covi_unbind_vcpu_imsic_begin(tvmc->tvm_guest_id, vcpu->vcpu_idx))
+		return;
+
+	/* This may issue IPIs to running vcpus. */
+	if (kvm_riscv_cove_tvm_fence(vcpu))
+		return;
+
+	if (sbi_covi_unbind_vcpu_imsic_end(tvmc->tvm_guest_id, vcpu->vcpu_idx))
+		return;
+
+	kvm_info("Unbind success for guest %ld vcpu %d pcpu %d\n",
+		  tvmc->tvm_guest_id, smp_processor_id(), vcpu->vcpu_idx);
+}
+
+int kvm_riscv_cove_vcpu_imsic_addr(struct kvm_vcpu *vcpu)
+{
+	struct kvm_cove_tvm_context *tvmc;
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_vcpu_aia *vaia = &vcpu->arch.aia_context;
+	int ret;
+
+	if (!kvm->arch.tvmc)
+		return -EINVAL;
+
+	tvmc = kvm->arch.tvmc;
+
+	ret = sbi_covi_set_vcpu_imsic_addr(tvmc->tvm_guest_id, vcpu->vcpu_idx, vaia->imsic_addr);
+	if (ret)
+		return -EPERM;
+
+	return 0;
+}
+
+int kvm_riscv_cove_aia_convert_imsic(struct kvm_vcpu *vcpu, phys_addr_t imsic_pa)
+{
+	struct kvm *kvm = vcpu->kvm;
+	int ret;
+
+	if (!kvm->arch.tvmc)
+		return -EINVAL;
+
+	ret = sbi_covi_convert_imsic(imsic_pa);
+	if (ret)
+		return -EPERM;
+
+	ret = kvm_riscv_cove_fence();
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+int kvm_riscv_cove_aia_claim_imsic(struct kvm_vcpu *vcpu, phys_addr_t imsic_pa)
+{
+	int ret;
+	struct kvm *kvm = vcpu->kvm;
+
+	if (!kvm->arch.tvmc)
+		return -EINVAL;
+
+	ret = sbi_covi_reclaim_imsic(imsic_pa);
+	if (ret)
+		return -EPERM;
+
+	return 0;
+}
+
+int kvm_riscv_cove_vcpu_imsic_rebind(struct kvm_vcpu *vcpu, int old_pcpu)
+{
+	struct kvm_cove_tvm_context *tvmc;
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_cove_tvm_vcpu_context *tvcpu = vcpu->arch.tc;
+	int ret;
+	cpumask_t tmpmask;
+
+	if (!kvm->arch.tvmc)
+		return -EINVAL;
+
+	tvmc = kvm->arch.tvmc;
+
+	ret = sbi_covi_rebind_vcpu_imsic_begin(tvmc->tvm_guest_id, vcpu->vcpu_idx,
+					       BIT(tvcpu->imsic.vsfile_hgei));
+	if (ret) {
+		kvm_err("Imsic rebind begin failed guest %ld vcpu %d pcpu %d\n",
+			 tvmc->tvm_guest_id, vcpu->vcpu_idx, smp_processor_id());
+		return ret;
+	}
+
+	ret = kvm_riscv_cove_tvm_fence(vcpu);
+	if (ret)
+		return ret;
+
+	cpumask_clear(&tmpmask);
+	cpumask_set_cpu(old_pcpu, &tmpmask);
+	on_each_cpu_mask(&tmpmask, kvm_cove_imsic_clone, vcpu, 1);
+
+	ret = sbi_covi_rebind_vcpu_imsic_end(tvmc->tvm_guest_id, vcpu->vcpu_idx);
+	if (ret) {
+		kvm_err("Imsic rebind end failed guest %ld vcpu %d pcpu %d\n",
+			 tvmc->tvm_guest_id, vcpu->vcpu_idx, smp_processor_id());
+		return ret;
+	}
+
+	tvcpu->imsic.bound = true;
+
+	return 0;
+}
+
+int kvm_riscv_cove_vcpu_imsic_bind(struct kvm_vcpu *vcpu, unsigned long imsic_mask)
+{
+	struct kvm_cove_tvm_context *tvmc;
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_cove_tvm_vcpu_context *tvcpu = vcpu->arch.tc;
+	int ret;
+
+	if (!kvm->arch.tvmc)
+		return -EINVAL;
+
+	tvmc = kvm->arch.tvmc;
+
+	ret = sbi_covi_bind_vcpu_imsic(tvmc->tvm_guest_id, vcpu->vcpu_idx, imsic_mask);
+	if (ret) {
+		kvm_err("Imsic bind failed for imsic %lx guest %ld vcpu %d pcpu %d\n",
+			imsic_mask, tvmc->tvm_guest_id, vcpu->vcpu_idx, smp_processor_id());
+		return ret;
+	}
+	tvcpu->imsic.bound = true;
+	pr_err("%s: rebind success vcpu %d hgei %d pcpu %d\n", __func__,
+	vcpu->vcpu_idx, tvcpu->imsic.vsfile_hgei, smp_processor_id());
+
+	return 0;
+}
+
+int kvm_riscv_cove_vcpu_imsic_unbind(struct kvm_vcpu *vcpu, int old_pcpu)
+{
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_cove_tvm_vcpu_context *tvcpu = vcpu->arch.tc;
+	cpumask_t tmpmask;
+
+	if (!kvm->arch.tvmc)
+		return -EINVAL;
+
+	/* No need to unbind if it is not bound already */
+	if (!tvcpu->imsic.bound)
+		return 0;
+
+	/* Do it first even if there is failure to prevent it to try again */
+	tvcpu->imsic.bound = false;
+
+	if (smp_processor_id() == old_pcpu) {
+		kvm_cove_imsic_unbind(vcpu);
+	} else {
+		/* Unbind can be invoked from a different physical cpu */
+		cpumask_clear(&tmpmask);
+		cpumask_set_cpu(old_pcpu, &tmpmask);
+		on_each_cpu_mask(&tmpmask, kvm_cove_imsic_unbind, vcpu, 1);
+	}
+
+	return 0;
+}
+
+int kvm_riscv_cove_vcpu_inject_interrupt(struct kvm_vcpu *vcpu, unsigned long iid)
+{
+	struct kvm_cove_tvm_context *tvmc;
+	struct kvm *kvm = vcpu->kvm;
+	int ret;
+
+	if (!kvm->arch.tvmc)
+		return -EINVAL;
+
+	tvmc = kvm->arch.tvmc;
+
+	ret = sbi_covi_inject_external_interrupt(tvmc->tvm_guest_id, vcpu->vcpu_idx, iid);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+int kvm_riscv_cove_aia_init(struct kvm *kvm)
+{
+	struct kvm_aia *aia = &kvm->arch.aia;
+	struct sbi_cove_tvm_aia_params *tvm_aia;
+	struct kvm_vcpu *vcpu;
+	struct kvm_cove_tvm_context *tvmc;
+	int ret;
+
+	if (!kvm->arch.tvmc)
+		return -EINVAL;
+
+	tvmc = kvm->arch.tvmc;
+
+	/* Sanity Check */
+	if (aia->aplic_addr != KVM_RISCV_AIA_UNDEF_ADDR)
+		return -EINVAL;
+
+	/* TVMs must have a physical guest interrut file */
+	if (aia->mode != KVM_DEV_RISCV_AIA_MODE_HWACCEL)
+		return -ENODEV;
+
+	tvm_aia = kzalloc(sizeof(*tvm_aia), GFP_KERNEL);
+	if (!tvm_aia)
+		return -ENOMEM;
+
+	/* Address of the IMSIC group ID, hart ID & guest ID of 0 */
+	vcpu = kvm_get_vcpu_by_id(kvm, 0);
+	tvm_aia->imsic_base_addr = vcpu->arch.aia_context.imsic_addr;
+
+	tvm_aia->group_index_bits = aia->nr_group_bits;
+	tvm_aia->group_index_shift = aia->nr_group_shift;
+	tvm_aia->hart_index_bits = aia->nr_hart_bits;
+	tvm_aia->guest_index_bits = aia->nr_guest_bits;
+	/* Nested TVMs are not supported yet */
+	tvm_aia->guests_per_hart = 0;
+
+
+	ret = sbi_covi_tvm_aia_init(tvmc->tvm_guest_id, tvm_aia);
+	if (ret)
+		kvm_err("TVM AIA init failed with rc %d\n", ret);
+
+	return ret;
+}
+
 void kvm_riscv_cove_vcpu_load(struct kvm_vcpu *vcpu)
 {
 	kvm_riscv_vcpu_timer_restore(vcpu);
@@ -283,6 +525,7 @@ void noinstr kvm_riscv_cove_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_
 	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
 	void *nshmem;
 	struct kvm_guest_timer *gt = &kvm->arch.timer;
+	struct kvm_cove_tvm_vcpu_context *tvcpuc = vcpu->arch.tc;
 
 	if (!kvm->arch.tvmc)
 		return;
@@ -301,6 +544,19 @@ void noinstr kvm_riscv_cove_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_
 		tvmc->finalized_done = true;
 	}
 
+	/*
+	 * Bind the vsfile here instead during the new vsfile allocation because
+	 * COVH bind call requires the TVM to be in finalized state.
+	 */
+	if (tvcpuc->imsic.bind_required) {
+		tvcpuc->imsic.bind_required = false;
+		rc = kvm_riscv_cove_vcpu_imsic_bind(vcpu, BIT(tvcpuc->imsic.vsfile_hgei));
+		if (rc) {
+			kvm_err("bind failed with rc %d\n", rc);
+			return;
+		}
+	}
+
 	rc = sbi_covh_run_tvm_vcpu(tvmc->tvm_guest_id, vcpu->vcpu_idx);
 	if (rc) {
 		trap->scause = EXC_CUSTOM_KVM_COVE_RUN_FAIL;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
