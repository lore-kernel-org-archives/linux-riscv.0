Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF685E83EF9
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 13:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4QrijcC7mXujSwANmj/PNy4O2YThMgtSNYIg43u/nW4=; b=iAY4jHBHeEXkEQ
	xRHhF82hMb5su7q0uClzQHRlTKjl/Vvf3RO56P44npTdZ6T7EHo6Cq0xKW6VUoR8A3uEe6v5uVYn0
	AlEX9mUs3DzQMu+COu+G91R/TqWfgxhWbLDgsGSlchmI/2lTxjmTuZVPOgYzKZsGX98o+2nXWh9dy
	a3MnEuzAbZ4Xk/F8u1HA+T53FXVSBeiNb+j6sVZ0QsbbJ+1tbYgxsO7rN8JpJaueE5+7lwe7VA7zk
	fpJq6LmdRFWo1H9Zqxscc6udroNjDexvf84Af1tLjpmWFYZRwUCyxp+U4S7r9l0HKtOqw5R6vwKkl
	132sktH1SfupWtMki6Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndCG-00000008XOk-0Wux;
	Wed, 04 Feb 2026 13:45:32 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndCC-00000008XKr-1Wwd;
	Wed, 04 Feb 2026 13:45:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1770212725; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=5R42yBenU3WsqPgksKfBN/gXqqDJrrdf2h4U39oXsd8=;
	b=XOS+UWOsr5RTI9iurWVMyzJy1BWVFrYZUnIuLXwWTWgcNErHFPreMljK1rVMpYCCAvzb3VWqTvxtF75sCkPine6NJYFdGBKA6A91kgMwfhCiIpNT0cQKYROTnRhS2qYcapfB+YtWgr2unbfsPGXQIiiDpH3208a/2cZ7YaQJ+Is=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WyXBzAg_1770212721 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 04 Feb 2026 21:45:22 +0800
From: fangyu.yu@linux.alibaba.com
To: pbonzini@redhat.com,
	corbet@lwn.net,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: guoren@kernel.org,
	radim.krcmar@oss.qualcomm.com,
	andrew.jones@oss.qualcomm.com,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH v5 3/3] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
Date: Wed,  4 Feb 2026 21:45:07 +0800
Message-Id: <20260204134507.33912-4-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260204134507.33912-1-fangyu.yu@linux.alibaba.com>
References: <20260204134507.33912-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_054529_411684_612015BB 
X-CRM114-Status: GOOD (  15.40  )
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

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

Add a VM capability that allows userspace to select the G-stage page table
format by setting HGATP.MODE on a per-VM basis.

Userspace enables the capability via KVM_ENABLE_CAP, passing the requested
HGATP.MODE in args[0]. The request is rejected with -EINVAL if the mode is
not supported by the host, and with -EBUSY if the VM has already been
committed (e.g. vCPUs have been created or any memslot is populated).

KVM_CHECK_EXTENSION(KVM_CAP_RISCV_SET_HGATP_MODE) returns a bitmask of the
HGATP.MODE formats supported by the host.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 Documentation/virt/kvm/api.rst | 27 +++++++++++++++++++++++++++
 arch/riscv/kvm/vm.c            | 19 +++++++++++++++++--
 include/uapi/linux/kvm.h       |  1 +
 3 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 01a3abef8abb..62dc120857c1 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -8765,6 +8765,33 @@ helpful if user space wants to emulate instructions which are not
 This capability can be enabled dynamically even if VCPUs were already
 created and are running.
 
+7.47 KVM_CAP_RISCV_SET_HGATP_MODE
+---------------------------------
+
+:Architectures: riscv
+:Type: VM
+:Parameters: args[0] contains the requested HGATP mode
+:Returns:
+  - 0 on success.
+  - -EINVAL if args[0] is outside the range of HGATP modes supported by the
+    hardware.
+  - -EBUSY if vCPUs have already been created for the VM, if the VM has any
+    non-empty memslots.
+
+This capability allows userspace to explicitly select the HGATP mode for
+the VM. The selected mode must be supported by both KVM and hardware. This
+capability must be enabled before creating any vCPUs or memslots.
+
+If this capability is not enabled, KVM will select the default HGATP mode
+automatically. The default is the highest HGATP.MODE value supported by
+hardware.
+
+``KVM_CHECK_EXTENSION(KVM_CAP_RISCV_SET_HGATP_MODE)`` returns a bitmask of
+HGATP.MODE values supported by the host. A return value of 0 indicates that
+the capability is not supported. Supported-mode bitmask use HGATP.MODE
+encodings as defined by the RISC-V privileged specification, such as Sv39x4
+corresponds to HGATP.MODE=8, so userspace should test bitmask & BIT(8).
+
 8. Other capabilities.
 ======================
 
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index 4b2156df40fc..7d1e1d257df5 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -202,6 +202,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_VM_GPA_BITS:
 		r = kvm_riscv_gstage_gpa_bits(&kvm->arch);
 		break;
+	case KVM_CAP_RISCV_SET_HGATP_MODE:
+		r = kvm_riscv_get_hgatp_mode_mask();
+		break;
 	default:
 		r = 0;
 		break;
@@ -212,12 +215,24 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 
 int kvm_vm_ioctl_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
 {
+	if (cap->flags)
+		return -EINVAL;
+
 	switch (cap->cap) {
 	case KVM_CAP_RISCV_MP_STATE_RESET:
-		if (cap->flags)
-			return -EINVAL;
 		kvm->arch.mp_state_reset = true;
 		return 0;
+	case KVM_CAP_RISCV_SET_HGATP_MODE:
+		if (!kvm_riscv_hgatp_mode_is_valid(cap->args[0]))
+			return -EINVAL;
+
+		if (kvm->created_vcpus || !kvm_are_all_memslots_empty(kvm))
+			return -EBUSY;
+#ifdef CONFIG_64BIT
+		kvm->arch.kvm_riscv_gstage_pgd_levels =
+				3 + cap->args[0] - HGATP_MODE_SV39X4;
+#endif
+		return 0;
 	default:
 		return -EINVAL;
 	}
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index dddb781b0507..00c02a880518 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -974,6 +974,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_GUEST_MEMFD_FLAGS 244
 #define KVM_CAP_ARM_SEA_TO_USER 245
 #define KVM_CAP_S390_USER_OPEREXEC 246
+#define KVM_CAP_RISCV_SET_HGATP_MODE 247
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
