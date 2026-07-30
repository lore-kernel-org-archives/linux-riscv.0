Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1A5C54FD2
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 09:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:Subject:Mime-Version:To:Date:Cc:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8JfLWJcSTyGr0/6nUTN+uOjk54u5Lq6GS9bIl3tPF5A=; b=3EfbUXJBJMmCwR
	K5WhPWcZits5ENtneYyNY5I+Gmw8fhkdW7ABXAJhWHbbR+/9Unz893yAoyExBfl60+nSlUGnEJ6Em
	nbVXC/9TOKzD+yHUCMdMozJbsitbajkwicB02H1/3ffbWWFlRUCRuzJgj3wssk9vbvjmtjPw+qbPX
	snIrOf4URdzrClAr0VZpWDOw2Of5nWqW37hy23dsjslwgf3RvXbhDOmRBNH9dnReZxHjTNMt6F2+4
	1uVQIzkCa/RSD4Vg4KeByg6HdMzrP4KCrbGy76Ql744eEpS74abYOsSvqxQ4MHA2PVCHo00xy74og
	Td11Q7UzIeH9E7oTVcww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNBx-0000000A224-0dd6;
	Thu, 30 Jul 2026 09:36:41 +0000
Received: from va-2-42.ptr.blmpb.com ([209.127.231.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNBs-0000000A1yo-324M
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 09:36:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1785404187;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=bN7RFHsa0lOlR0S7CzP3PJMMnicWDiS8G1yRtLup2oQ=;
 b=XfP99j6IYupWVtM58ve71L1Oecbs6/gteir5Z119TgLunremC/3oauWTNKnlHVEtKlQF+f
 a4RdhIGG22NFu5oWz3sN2WLPdhTHLdCflZGznIwA92ChxhmeXrPSOgdM+NvsdZlUwLNlDB
 YU/19ajL3bX4VlYGf0mLQZ6fmhA2R6XoiHPKLgaMbqxEtItf5TGm4AGcvNf0qXpu/T50Qv
 rBRf460uLu2tKJAts33mhdddOzv2Krbm+/rUVbtdSnpiBIrL92pLQTMQGCZQ1TXljUyVhp
 ea7Z1Pm33cvbH4uOnPK9tMzuy5RGikYGug9+DPIiA7LvKkPiXWGv6OVlRQjwcQ==
Message-Id: <20260730093614.983508-1-xiangwencheng@lanxincomputing.com>
X-Mailer: git-send-email 2.53.0
Cc: <atish.patra@linux.dev>, <pjw@kernel.org>, <palmer@dabbelt.com>, 
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <kvm@vger.kernel.org>, 
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, <xiangwencheng@lanxincomputing.com>
Date: Thu, 30 Jul 2026 17:36:14 +0800
X-Original-From: BillXiang <xiangwencheng@lanxincomputing.com>
To: <anup@brainfault.org>
Mime-Version: 1.0
Subject: [PATCH] riscv: KVM: Add hart-to-vCPU mapping for faster MSI injection
Received: from lanxin-ThinkBook-16-G5-IRH ([123.120.5.129]) by smtp.feishu.cn with ESMTP; Thu, 30 Jul 2026 17:36:25 +0800
X-Lms-Return-Path: <lba+26a6b1b19+a6466b+lists.infradead.org+xiangwencheng@lanxincomputing.com>
From: "BillXiang" <xiangwencheng@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_023636_826895_CBCFC939 
X-CRM114-Status: GOOD (  16.40  )
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

Replace linear searches over all vCPUs in MSI injection paths with a
direct hart_index -> vCPU lookup table. This avoids O(n) scans on
every injected interrupt and improves performance when the number of
vCPUs is large.

Both kvm_riscv_aia_inject_msi_by_id() and kvm_riscv_aia_inject_msi()
now use the table instead of iterating over the vCPU list.

Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
---
 arch/riscv/include/asm/kvm_aia.h |  2 +
 arch/riscv/kvm/aia_device.c      | 67 +++++++++++++++++++++-----------
 2 files changed, 47 insertions(+), 22 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
index c67ec5ac0..71240b0a2 100644
--- a/arch/riscv/include/asm/kvm_aia.h
+++ b/arch/riscv/include/asm/kvm_aia.h
@@ -47,6 +47,8 @@ struct kvm_aia {
 
 	/* Internal state of APLIC */
 	void		*aplic_state;
+
+	struct kvm_vcpu **hart_to_vcpu;
 };
 
 struct kvm_vcpu_aia_csr {
diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index be83c2d5f..595553817 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -253,6 +253,14 @@ static int aia_init(struct kvm *kvm)
 	if (ret)
 		return ret;
 
+	aia->hart_to_vcpu = kcalloc(kvm->created_vcpus,
+					sizeof(struct kvm_vcpu*),
+					GFP_KERNEL);
+	if (!aia->hart_to_vcpu) {
+		ret = -ENOMEM;
+		goto fail_cleanup_aplic;
+	}
+
 	/* Iterate over each VCPU */
 	kvm_for_each_vcpu(idx, vcpu, kvm) {
 		vaia = &vcpu->arch.aia_context;
@@ -274,6 +282,12 @@ static int aia_init(struct kvm *kvm)
 		/* Update HART index of the IMSIC based on IMSIC base */
 		vaia->hart_index = aia_imsic_hart_index(aia,
 							vaia->imsic_addr);
+		
+		if (aia->hart_to_vcpu[vaia->hart_index]) {
+			ret = -EINVAL;
+			goto fail_cleanup_imsics;
+		}
+		aia->hart_to_vcpu[vaia->hart_index] = vcpu;
 
 		/* Initialize IMSIC for this VCPU */
 		ret = kvm_riscv_vcpu_aia_imsic_init(vcpu);
@@ -293,6 +307,9 @@ static int aia_init(struct kvm *kvm)
 			continue;
 		kvm_riscv_vcpu_aia_imsic_cleanup(vcpu);
 	}
+	kfree(aia->hart_to_vcpu);
+	aia->hart_to_vcpu = NULL;
+fail_cleanup_aplic:
 	kvm_riscv_aia_aplic_cleanup(kvm);
 	return ret;
 }
@@ -551,30 +568,28 @@ void kvm_riscv_vcpu_aia_deinit(struct kvm_vcpu *vcpu)
 int kvm_riscv_aia_inject_msi_by_id(struct kvm *kvm, u32 hart_index,
 				   u32 guest_index, u32 iid)
 {
-	unsigned long idx;
 	struct kvm_vcpu *vcpu;
+	struct kvm_aia *aia = &kvm->arch.aia;
 
 	/* Proceed only if AIA was initialized successfully */
 	if (!kvm_riscv_aia_initialized(kvm))
 		return -EBUSY;
 
-	/* Inject MSI to matching VCPU */
-	kvm_for_each_vcpu(idx, vcpu, kvm) {
-		if (vcpu->arch.aia_context.hart_index == hart_index)
-			return kvm_riscv_vcpu_aia_imsic_inject(vcpu,
-							       guest_index,
-							       0, iid);
-	}
+	if (!aia->hart_to_vcpu || hart_index >= kvm->created_vcpus)
+		return 0;
 
-	return 0;
+	vcpu = aia->hart_to_vcpu[hart_index];
+	if (!vcpu)
+		return 0;
+	
+	return kvm_riscv_vcpu_aia_imsic_inject(vcpu, guest_index, 0, iid);
 }
 
 int kvm_riscv_aia_inject_msi(struct kvm *kvm, struct kvm_msi *msi)
 {
 	gpa_t tppn, ippn;
-	unsigned long idx;
 	struct kvm_vcpu *vcpu;
-	u32 g, toff, iid = msi->data;
+	u32 g, toff, iid = msi->data, hart_index;
 	struct kvm_aia *aia = &kvm->arch.aia;
 	gpa_t target = (((gpa_t)msi->address_hi) << 32) | msi->address_lo;
 
@@ -589,18 +604,22 @@ int kvm_riscv_aia_inject_msi(struct kvm *kvm, struct kvm_msi *msi)
 	g = tppn & (BIT(aia->nr_guest_bits) - 1);
 	tppn &= ~((gpa_t)(BIT(aia->nr_guest_bits) - 1));
 
-	/* Inject MSI to matching VCPU */
-	kvm_for_each_vcpu(idx, vcpu, kvm) {
-		ippn = vcpu->arch.aia_context.imsic_addr >>
-					IMSIC_MMIO_PAGE_SHIFT;
-		if (ippn == tppn) {
-			toff = target & (IMSIC_MMIO_PAGE_SZ - 1);
-			return kvm_riscv_vcpu_aia_imsic_inject(vcpu, g,
-							       toff, iid);
-		}
-	}
+	if (!aia->hart_to_vcpu)
+		return 0;
 
-	return 0;
+	hart_index = aia_imsic_hart_index(aia, target);
+	if(hart_index >= kvm->created_vcpus)
+		return 0;
+	
+	vcpu = aia->hart_to_vcpu[hart_index];
+	if (!vcpu)
+		return 0;
+
+	ippn = vcpu->arch.aia_context.imsic_addr >> IMSIC_MMIO_PAGE_SHIFT;
+	if (ippn != tppn)
+		return 0;
+	toff = target & (IMSIC_MMIO_PAGE_SZ - 1);
+	return kvm_riscv_vcpu_aia_imsic_inject(vcpu, g,	toff, iid);
 }
 
 int kvm_riscv_aia_inject_irq(struct kvm *kvm, unsigned int irq, bool level)
@@ -641,10 +660,14 @@ void kvm_riscv_aia_init_vm(struct kvm *kvm)
 
 void kvm_riscv_aia_destroy_vm(struct kvm *kvm)
 {
+	struct kvm_aia *aia = &kvm->arch.aia;
 	/* Proceed only if AIA was initialized successfully */
 	if (!kvm_riscv_aia_initialized(kvm))
 		return;
 
+	kfree(aia->hart_to_vcpu);
+	aia->hart_to_vcpu = NULL;
+
 	/* Cleanup APLIC context */
 	kvm_riscv_aia_aplic_cleanup(kvm);
 }
-- 
2.53.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
