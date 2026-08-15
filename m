Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4540AC5CFDB
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 10:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ecsin1AIhrdS5JBFSjhitVSgyttqyQch7DoIfDiTYt8=; b=XgptqYmXEQjCae
	iyvSP/3DfcQRkSMF+tk/AZc323WwsKyRB7L0RvMG8j+RBzT81g7SM7HbTdj7eHLYx88X1l4cpwKZV
	rCwXc5N54XTQrpq/ff1VAtDuw6+WUj1ma15HUwDozYVlE/KCEidNT6PUpZhEERH3uz9HcbGLOUmwf
	yLTdFfbJKrgBWe/bAeGEcZSEwTJsz+4HvTv5vFOTQc9MFTZBuvSyJR5lRNfaZRY4wMf5sGCjbUmqJ
	z8OYPXV9iQF7oRV1ZVb6htZhrIZgZCeeXzvMT3mvNec56R1XwdhLJTZdGPla/pBFxmRPyIZyNjZEW
	byVTB4hHt+3dMHZE0fZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvBHw-00000003j5O-1D52;
	Sat, 15 Aug 2026 10:06:52 +0000
Received: from out-99.mta0.migadu.com ([2001:41d0:1004:224b::63] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvBHu-00000003j51-1Ihi
	for linux-riscv@lists.infradead.org;
	Sat, 15 Aug 2026 10:06:51 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=V5XVfLEQRMIUdVa1VN5yR7RiRSe4x0lsprp3ClMwZ+c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786788407; v=1; x=1787393207;
 b=Pw5IeT68zZDgXeePaxQkEEnXXexNKsckbJio3dp3pidhD9GwsOrhY+PUYNHPgD8KSqJ7oTBO
 OjnTyNa0uGPyGH6NC+1hfoONLGZinX31u4cYld1pJOja1MvCMjaebEglmVlSXIyDTkYEKNWNN+u
 YKPvBoTzRZdtig4p/dbz+i8Y=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: from localhost.localdomain (2408:823d:2011:2c0:e810:54f9:f0a3:99d)
	by smtp.migadu.com with ESMTPS id e58b234c548717e0;
	Sat, 15 Aug 2026 10:06:47 +0000
X-Migadu-Flow: FLOW_OUT
From: Jinyu Tang <jinyu.tang@linux.dev>
To: Anup Patel <anup@brainfault.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atish.patra@linux.dev>
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	Yifei Jiang <jiangyifei@huawei.com>,
	Jinyu Tang <tjytimi@163.com>,
	Jinyu Tang <jinyu.tang@linux.dev>
Subject: [PATCH v4 3/5] KVM: riscv: Implement KVM_PRE_FAULT_MEMORY
Date: Sat, 15 Aug 2026 06:06:36 -0400
Message-ID: <20260815100636.861901-1-jinyu.tang@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815095548.860018-1-jinyu.tang@linux.dev>
References: <20260815095548.860018-1-jinyu.tang@linux.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_030650_494287_83F839DF 
X-CRM114-Status: GOOD (  14.20  )
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

The generic KVM_PRE_FAULT_MEMORY ioctl lets userspace populate KVM page
tables before running a vCPU over a GPA range. x86 already supports the
ioctl, but RISC-V does not expose the capability and has no arch hook.

Add the RISC-V arch hook and reuse the existing G-stage fault mapping
path with a read access. Report progress using the G-stage mapping
returned by the map path, so the ioctl can advance by the actual leaf
size that covers the requested GPA. Retry until a mapping is installed
or a signal, VM-dead request, or real error is observed.

Signed-off-by: Jinyu Tang <jinyu.tang@linux.dev>
---
 arch/riscv/kvm/Kconfig  |  1 +
 arch/riscv/kvm/gstage.c |  3 +++
 arch/riscv/kvm/mmu.c    | 45 ++++++++++++++++++++++++++++++++++++++++-
 arch/riscv/kvm/vm.c     |  1 +
 4 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index ec2cee0a39e0..8ac209e8ac87 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -28,6 +28,7 @@ config KVM
 	select KVM_COMMON
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	select KVM_GENERIC_HARDWARE_ENABLING
+	select KVM_GENERIC_PRE_FAULT_MEMORY
 	select KVM_MMIO
 	select VIRT_XFER_TO_GUEST_WORK
 	select SCHED_INFO
diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index 54d45addf18f..dff315dfd24e 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -286,6 +286,9 @@ int kvm_riscv_gstage_map_page(struct kvm_gstage *gstage,
 						    out_map->level, true);
 		} else if (ALIGN_DOWN(PFN_PHYS(pte_pfn(ptep_get(ptep))), page_size) == hpa) {
 			kvm_riscv_gstage_update_pte_prot(gstage, ptep_level, gpa, ptep, prot);
+			out_map->addr = ALIGN_DOWN(gpa, page_size);
+			out_map->level = ptep_level;
+			out_map->pte = ptep_get(ptep);
 			return 0;
 		}
 	}
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 2fabcd409991..f6ca86da53eb 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -717,7 +717,7 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	if (hfn == KVM_PFN_ERR_HWPOISON) {
 		send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
 				vma_pageshift, current);
-		return 0;
+		return -EFAULT;
 	}
 	if (is_error_noslot_pfn(hfn))
 		return -EFAULT;
@@ -782,6 +782,49 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	return ret;
 }
 
+long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
+				    struct kvm_pre_fault_memory *range)
+{
+	struct kvm_gstage_mapping out_map = { 0 };
+	struct kvm_memory_slot *memslot;
+	unsigned long map_size;
+	unsigned long hva;
+	gpa_t end;
+	gfn_t gfn;
+	int ret;
+
+	gfn = gpa_to_gfn(range->gpa);
+	memslot = kvm_vcpu_gfn_to_memslot(vcpu, gfn);
+	if (!memslot)
+		return -ENOENT;
+
+	hva = gfn_to_hva_memslot_prot(memslot, gfn, NULL);
+	if (kvm_is_error_hva(hva))
+		return -ENOENT;
+
+	for (;;) {
+		if (signal_pending(current))
+			return -EINTR;
+
+		if (kvm_check_request(KVM_REQ_VM_DEAD, vcpu))
+			return -EIO;
+
+		cond_resched();
+		ret = kvm_riscv_mmu_map(vcpu, memslot, range->gpa, hva, false, &out_map);
+		if (ret)
+			return ret;
+
+		if (!pte_val(out_map.pte))
+			continue;
+
+		map_size = PAGE_SIZE << (out_map.level * kvm_riscv_gstage_index_bits);
+		end = out_map.addr + map_size;
+		break;
+	}
+
+	return min_t(u64, range->size, end - range->gpa);
+}
+
 int kvm_riscv_mmu_alloc_pgd(struct kvm *kvm)
 {
 	struct page *pgd_page;
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index a9f083feeb76..58500a19b33b 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -187,6 +187,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_MP_STATE:
 	case KVM_CAP_IMMEDIATE_EXIT:
 	case KVM_CAP_SET_GUEST_DEBUG:
+	case KVM_CAP_PRE_FAULT_MEMORY:
 		r = 1;
 		break;
 	case KVM_CAP_NR_VCPUS:
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
