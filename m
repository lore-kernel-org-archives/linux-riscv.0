Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E196CC5CFC1
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 11:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=49J00Cd80AQmSUt8Jips/zEy+8MAW+E4Ne1YbyKZl8U=; b=072Q6T4r1cgHD5
	O23e3t5Fa9PeiYWYliW/O/q9nftLvWhyHsU5ykHRz/x+HA8OK/CtGU86UFVNtnoymktN2zHKT6G+e
	F62uG3gYetg0G6u1jmau+2Cfzd7nYIepqxCBHL1UW5FJQROVzCSRx2H1lQ7o+5FkX/K1yUh56AVm4
	gjK/ssAObEqFU7VpinMotlO7zHoFb5O/m2GEtMz99NqXeKR6PKi2qqBYatv/rBsvqmOoFbPLG6UrT
	kTBet+vQQHy7RC+S4seVxtvzmLPmWAkIWdW6La/u64vk7ch2mVQiKxLU4+MIB5KZd3R3ZWWd7VLvV
	rI8isRxH+MIsDQvM7bxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuqM8-00000002bly-0K5o;
	Fri, 14 Aug 2026 11:45:48 +0000
Received: from out-215.mta0.migadu.com ([2001:41d0:1004:224b::d7] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuqM5-00000002bkQ-2SXr
	for linux-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 11:45:47 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=NElRwhKXJKskKs7L0lwTCSgGuGKP1HD6hmKGJ40v/N0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786707943; v=1; x=1787312743;
 b=Bzo//H+07bX3bVJcSd88NG0NM+adp8DgmOJWUQdeMy0g+BY1XKq+sd9kXyBNstfensU/wumy
 400WxefPNSzYx0XES16SGKzyU14QAHF7kKhPRsXlogxDgw3JbXHt7dA8qD66VBOXRTQS2nTDL2g
 +Oe7M5fv/AvhuhKLI9XFVBdM=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: from localhost.localdomain (2408:823d:2011:2c0:e810:54f9:f0a3:99d)
	by smtp.migadu.com with ESMTPS id 7749c2dafb5b1cfd;
	Fri, 14 Aug 2026 11:45:43 +0000
X-Migadu-Flow: FLOW_OUT
From: Jinyu Tang <jinyu.tang@linux.dev>
To: Anup Patel <anup@brainfault.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	Jinyu Tang <tjytimi@163.com>,
	Jinyu Tang <jinyu.tang@linux.dev>
Subject: [PATCH v3 1/3] KVM: riscv: Implement KVM_PRE_FAULT_MEMORY
Date: Fri, 14 Aug 2026 07:45:05 -0400
Message-ID: <20260814114507.583424-2-jinyu.tang@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814114507.583424-1-jinyu.tang@linux.dev>
References: <20260814114507.583424-1-jinyu.tang@linux.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_044545_768973_D64CCD9F 
X-CRM114-Status: GOOD (  12.94  )
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
v2 -> v3:
- Retry internally when the map path returns success without a visible
  G-stage mapping, instead of exposing -EAGAIN.  (Sashiko)

 arch/riscv/kvm/Kconfig  |  1 +
 arch/riscv/kvm/gstage.c |  3 +++
 arch/riscv/kvm/mmu.c    | 42 +++++++++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vm.c     |  1 +
 4 files changed, 47 insertions(+)

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
index e5002cb9cbef..6bd8b8fd6ceb 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -280,6 +280,9 @@ int kvm_riscv_gstage_map_page(struct kvm_gstage *gstage,
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
index 6035b5ec9503..33d4ba406b0d 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -748,6 +748,48 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
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
+		if (pte_val(out_map.pte))
+			break;
+	}
+
+	map_size = PAGE_SIZE << (out_map.level * kvm_riscv_gstage_index_bits);
+	end = ALIGN_DOWN(range->gpa, map_size) + map_size;
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
