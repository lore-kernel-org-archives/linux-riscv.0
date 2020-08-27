Return-Path: <SRS0=FYRI=CF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19CE6C433DF
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2020 08:24:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C398D20738
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2020 08:24:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ciSxnqmO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C398D20738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c2D9fB3j1WEy+2mrxwEUuyTUI0bmBPpHBGzD4vyT40k=; b=ciSxnqmOI5qt3eKlH/dNRZASF
	m1c/dVelKxe2uKD5RSdYn49HLQHtDbWjcdb3uzcy9E51vHB+boYIW9mgHofrGbZnOXGNB43xc7uMd
	9H2jZyDtLFriJVBENJoF30Ku1F/4I/wvfxPVs5Q5kgw2yH+Ei06uCc0+D63gLSHrtboJTfK4L9Y9I
	BV5HC9GbbSU+mYwvRCWPfcHpxa8urMSNuA4tZuw02L2T1zWexA1NIEqbz0m9P6e8QreWjBWnVRuRC
	UonOpMBsaDkvYYJCbT4OvzNPlEVeaRK/ypG8sOtTSv90xlYlau4VD374EsVFtaKckBcoLSqnFf49y
	ZABBsyVFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBDCY-0001Sc-MH; Thu, 27 Aug 2020 08:24:06 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBDCT-0001OJ-Uw; Thu, 27 Aug 2020 08:24:03 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 6EE67404E57DEB67FD5B;
 Thu, 27 Aug 2020 16:23:53 +0800 (CST)
Received: from huawei.com (10.174.187.31) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Thu, 27 Aug 2020
 16:23:43 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
 <anup.patel@wdc.com>, <alistair.francis@wdc.com>, <atish.patra@wdc.com>,
 <deepa.kernel@gmail.com>
Subject: [PATCH RFC 2/2] target/kvm: Add interfaces needed for log dirty
Date: Thu, 27 Aug 2020 16:22:51 +0800
Message-ID: <20200827082251.1591-3-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20200827082251.1591-1-jiangyifei@huawei.com>
References: <20200827082251.1591-1-jiangyifei@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.187.31]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_042402_749797_2286E3FE 
X-CRM114-Status: GOOD (  12.12  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: zhang.zhanghailiang@huawei.com, kvm@vger.kernel.org, yinyipeng1@huawei.com,
 victor.zhangxiaofeng@huawei.com, linux-kernel@vger.kernel.org,
 Yifei Jiang <jiangyifei@huawei.com>, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, wu.wubin@huawei.com, dengkai1@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add two interfaces of log dirty for kvm_main.c, and detele the interface
kvm_vm_ioctl_get_dirty_log which is redundantly defined.

CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT is added in defconfig.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 arch/riscv/configs/defconfig |  1 +
 arch/riscv/kvm/Kconfig       |  1 +
 arch/riscv/kvm/mmu.c         | 43 ++++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vm.c          |  6 -----
 4 files changed, 45 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index d36e1000bbd3..857d799672c2 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -19,6 +19,7 @@ CONFIG_SOC_VIRT=y
 CONFIG_SMP=y
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM=y
+CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
 CONFIG_HOTPLUG_CPU=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index 2356dc52ebb3..91fcffc70e5d 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -26,6 +26,7 @@ config KVM
 	select KVM_MMIO
 	select HAVE_KVM_VCPU_ASYNC_IOCTL
 	select SRCU
+	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	help
 	  Support hosting virtualized guest machines.
 
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 88bce80ee983..df2a470c25e4 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -358,6 +358,43 @@ void stage2_wp_memory_region(struct kvm *kvm, int slot)
 	kvm_flush_remote_tlbs(kvm);
 }
 
+/**
+ * kvm_mmu_write_protect_pt_masked() - write protect dirty pages
+ * @kvm:    The KVM pointer
+ * @slot:   The memory slot associated with mask
+ * @gfn_offset: The gfn offset in memory slot
+ * @mask:   The mask of dirty pages at offset 'gfn_offset' in this memory
+ *      slot to be write protected
+ *
+ * Walks bits set in mask write protects the associated pte's. Caller must
+ * acquire kvm_mmu_lock.
+ */
+static void kvm_mmu_write_protect_pt_masked(struct kvm *kvm,
+        struct kvm_memory_slot *slot,
+        gfn_t gfn_offset, unsigned long mask)
+{
+    phys_addr_t base_gfn = slot->base_gfn + gfn_offset;
+    phys_addr_t start = (base_gfn +  __ffs(mask)) << PAGE_SHIFT;
+    phys_addr_t end = (base_gfn + __fls(mask) + 1) << PAGE_SHIFT;
+
+    stage2_wp_range(kvm, start, end);
+}
+
+/*
+ * kvm_arch_mmu_enable_log_dirty_pt_masked - enable dirty logging for selected
+ * dirty pages.
+ *
+ * It calls kvm_mmu_write_protect_pt_masked to write protect selected pages to
+ * enable dirty logging for them.
+ */
+void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
+        struct kvm_memory_slot *slot,
+        gfn_t gfn_offset, unsigned long mask)
+{
+    kvm_mmu_write_protect_pt_masked(kvm, slot, gfn_offset, mask);
+}
+
+
 int stage2_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
 		   unsigned long size, bool writable)
 {
@@ -433,6 +470,12 @@ void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
 {
 }
 
+void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
+					struct kvm_memory_slot *memslot)
+{
+	kvm_flush_remote_tlbs(kvm);
+}
+
 void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *free)
 {
 }
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index 4f2498198cb5..f7405676903b 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -12,12 +12,6 @@
 #include <linux/uaccess.h>
 #include <linux/kvm_host.h>
 
-int kvm_vm_ioctl_get_dirty_log(struct kvm *kvm, struct kvm_dirty_log *log)
-{
-	/* TODO: To be added later. */
-	return -ENOTSUPP;
-}
-
 int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 {
 	int r;
-- 
2.19.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
