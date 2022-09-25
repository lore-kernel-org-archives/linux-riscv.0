Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAA9C6FA82
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Sep 2022 16:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=abbvMNr5jBzNZJhx2zMqpfx5BiGJuX9cAreRE+bYyfA=; b=E6lPxij2cj6fi6
	IAVunrkVQnXXemgXYKfpZUL4BcUe3IR7N6rSAcqFy+6/L8XGxhQrHoAIFAEyWIoGqzGQmy84KzSSV
	uPRnN4wYJKsrYv/36kEjZHGlVboZvl6bx+8X9yTfQ5z/kskxWXWMpsKEpPctZVYHH4FgEoU8clk5h
	MILtln3QL7Hyd702m6C90EzKE8znP1hnLytRFbhJTq3MS/ZLOa98P0RT19HH2A1b6upDwMmrMoZmO
	h19MZQVoOnSkDbDPrBI40hJlS62bQIjf6AEw4Iub7uPh5YTfR1W1n36haEMbKhwbT5tIM/mO/+HLc
	syMtnrfFrlN8bNR4iNRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocUZb-00EwVB-2l; Sun, 25 Sep 2022 16:33:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocUZT-00EwOj-7w; Sun, 25 Sep 2022 16:33:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A14AE6103C;
	Sun, 25 Sep 2022 16:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 196BCC433C1;
	Sun, 25 Sep 2022 16:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664123613;
	bh=gEVSZo6IZOnVd4BVQuHJHN2F00a6Y7EMFpgV8m6o8aI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WIdEn7WYr3y/rpGD9loAckzLSySmgfgp9dyLicUsMfjjwdn40cLuN6zLLj/LOV9Nt
	 w7+0SOOs6WSK8DMfhBCdUEZxebtKCMKrVB5goKF1Kb8XEiPr+NwjkgijP9GjQF3l7C
	 WyHw1FOIynVG+LrVeAgZu8sC73ZZ+13s/gGI0an6PJKx2ACr7p9QeLDjlO2adlyJQE
	 OZ9DMtTFSyq7GsfuNfX1jtojKvTksuDbkOx0AKUxBaE4u9RhaEjyaNrF0KVYtL/Hnb
	 4tk8/VMxL0skJxsU6cEywngiUcasms2wim1spP3albK3bob826eHX0WIcy1uGM9LNO
	 L4aeTag7IZXcw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v3 2/3] RISC-V: KVM: Use generic guest entry infrastructure
Date: Mon, 26 Sep 2022 00:23:59 +0800
Message-Id: <20220925162400.1606-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925162400.1606-1-jszhang@kernel.org>
References: <20220925162400.1606-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_093335_395424_98BF7410 
X-CRM114-Status: GOOD (  12.65  )
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

Use generic guest entry infrastructure to properly handle
TIF_NOTIFY_RESUME.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kvm/Kconfig |  1 +
 arch/riscv/kvm/vcpu.c  | 18 ++++++------------
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index f5a342fa1b1d..f36a737d5f96 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -24,6 +24,7 @@ config KVM
 	select PREEMPT_NOTIFIERS
 	select KVM_MMIO
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
+	select KVM_XFER_TO_GUEST_WORK
 	select HAVE_KVM_VCPU_ASYNC_IOCTL
 	select HAVE_KVM_EVENTFD
 	select SRCU
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 3da459fedc28..e3e6b8608288 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/entry-kvm.h>
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/kdebug.h>
@@ -959,7 +960,9 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 	run->exit_reason = KVM_EXIT_UNKNOWN;
 	while (ret > 0) {
 		/* Check conditions before entering the guest */
-		cond_resched();
+		ret = xfer_to_guest_mode_handle_work(vcpu);
+		if (!ret)
+			ret = 1;
 
 		kvm_riscv_gstage_vmid_update(vcpu);
 
@@ -967,16 +970,6 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 		local_irq_disable();
 
-		/*
-		 * Exit if we have a signal pending so that we can deliver
-		 * the signal to user space.
-		 */
-		if (signal_pending(current)) {
-			ret = -EINTR;
-			run->exit_reason = KVM_EXIT_INTR;
-			++vcpu->stat.signal_exits;
-		}
-
 		/*
 		 * Ensure we set mode to IN_GUEST_MODE after we disable
 		 * interrupts and before the final VCPU requests check.
@@ -999,7 +992,8 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 		if (ret <= 0 ||
 		    kvm_riscv_gstage_vmid_ver_changed(&vcpu->kvm->arch.vmid) ||
-		    kvm_request_pending(vcpu)) {
+		    kvm_request_pending(vcpu) ||
+		    xfer_to_guest_mode_work_pending()) {
 			vcpu->mode = OUTSIDE_GUEST_MODE;
 			local_irq_enable();
 			kvm_vcpu_srcu_read_lock(vcpu);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
