Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99019EE645B
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 08:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fHVFEKD9l1boAMdkrcLUwb3D7M/8fPPqTPNNWtb2Jwo=; b=i0oIHXGsH0vFQz
	L9tqCEIXlEavrZKMgs3xsl7hUR5z2LTJ6/PIqo+tW8UquUZYzHBeSc9+0flvYWxM1mux4LLaUE0OG
	L6Do4k7j+gbeFr7KfYXElvuP9ZevC5B/pOIoj3lfU5wbUJS9iaVQo43K/t4AH1RQ/S5DuFYPCWaJv
	HnJjR2LBZGE80kxQTZkE1ZTYWpMAHFHJvVTTye4fJUbEl4YR+M8WpgLtooFK8uoFQ6VmZRXmtNdHn
	oQucqE3/v79YyLdp2d2m6lRUPTK3Rbbf7E/gFSo7hdoU7dgPxYXvEGBCIz51WW3tVLB/RquLuNpYS
	VThzi3NqeP/5uQVcTh4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soelQ-0000000CHrY-0JNs;
	Thu, 12 Sep 2024 08:01:16 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soel4-0000000CHhH-05Uy;
	Thu, 12 Sep 2024 08:00:56 +0000
Received: from zq-Legion-Y7000.. (unknown [180.111.103.6])
	by APP-01 (Coremail) with SMTP id qwCowAAHDx+pn+Jm9F_9Ag--.56033S2;
	Thu, 12 Sep 2024 16:00:41 +0800 (CST)
From: zhouquan@iscas.ac.cn
To: anup@brainfault.org,
	ajones@ventanamicro.com,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v3 2/2] riscv: KVM: add basic support for host vs guest profiling
Date: Thu, 12 Sep 2024 16:00:38 +0800
Message-Id: <86e8f4eeb30dfc8700089cd88616e6cfb5a142ff.1726126795.git.zhouquan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726126795.git.zhouquan@iscas.ac.cn>
References: <cover.1726126795.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAHDx+pn+Jm9F_9Ag--.56033S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJFW7KrWUtFWxAryrGF15Arb_yoW5ZF1xpF
	Z8ur9Y9r4rKryxC34ayr1v9r45WFsYg343Xry7CFy5Wr45try8Jr4vg34DAry5JFW8Xa4S
	kFy8KFyruwn8Aw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7M4kE6xkIj40Ew7xC0wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUXqXdUUUUU=
X-Originating-IP: [180.111.103.6]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiCQ8SBmbifb+DkgAAsF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_010054_478423_12DCCF10 
X-CRM114-Status: GOOD (  12.97  )
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

From: Quan Zhou <zhouquan@iscas.ac.cn>

For the information collected on the host side, we need to
identify which data originates from the guest and record
these events separately, this can be achieved by having
KVM register perf callbacks.

Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
---
 arch/riscv/include/asm/kvm_host.h | 10 ++++++++++
 arch/riscv/kvm/Kconfig            |  1 +
 arch/riscv/kvm/main.c             | 12 ++++++++++--
 arch/riscv/kvm/vcpu.c             |  7 +++++++
 4 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 2e2254fd2a2a..35eab6e0f4ae 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -286,6 +286,16 @@ struct kvm_vcpu_arch {
 	} sta;
 };
 
+/*
+ * Returns true if a Performance Monitoring Interrupt (PMI), a.k.a. perf event,
+ * arrived in guest context.  For riscv, any event that arrives while a vCPU is
+ * loaded is considered to be "in guest".
+ */
+static inline bool kvm_arch_pmi_in_guest(struct kvm_vcpu *vcpu)
+{
+	return IS_ENABLED(CONFIG_GUEST_PERF_EVENTS) && !!vcpu;
+}
+
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 
 #define KVM_RISCV_GSTAGE_TLB_MIN_ORDER		12
diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index 26d1727f0550..0c3cbb0915ff 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -32,6 +32,7 @@ config KVM
 	select KVM_XFER_TO_GUEST_WORK
 	select KVM_GENERIC_MMU_NOTIFIER
 	select SCHED_INFO
+	select GUEST_PERF_EVENTS if PERF_EVENTS
 	help
 	  Support hosting virtualized guest machines.
 
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index bab2ec34cd87..734b48d8f6dd 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -51,6 +51,12 @@ void kvm_arch_hardware_disable(void)
 	csr_write(CSR_HIDELEG, 0);
 }
 
+static void kvm_riscv_teardown(void)
+{
+	kvm_riscv_aia_exit();
+	kvm_unregister_perf_callbacks();
+}
+
 static int __init riscv_kvm_init(void)
 {
 	int rc;
@@ -105,9 +111,11 @@ static int __init riscv_kvm_init(void)
 		kvm_info("AIA available with %d guest external interrupts\n",
 			 kvm_riscv_aia_nr_hgei);
 
+	kvm_register_perf_callbacks(NULL);
+
 	rc = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
 	if (rc) {
-		kvm_riscv_aia_exit();
+		kvm_riscv_teardown();
 		return rc;
 	}
 
@@ -117,7 +125,7 @@ module_init(riscv_kvm_init);
 
 static void __exit riscv_kvm_exit(void)
 {
-	kvm_riscv_aia_exit();
+	kvm_riscv_teardown();
 
 	kvm_exit();
 }
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 8d7d381737ee..e8ffb3456898 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -226,6 +226,13 @@ bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
 	return (vcpu->arch.guest_context.sstatus & SR_SPP) ? true : false;
 }
 
+#ifdef CONFIG_GUEST_PERF_EVENTS
+unsigned long kvm_arch_vcpu_get_ip(struct kvm_vcpu *vcpu)
+{
+	return vcpu->arch.guest_context.sepc;
+}
+#endif
+
 vm_fault_t kvm_arch_vcpu_fault(struct kvm_vcpu *vcpu, struct vm_fault *vmf)
 {
 	return VM_FAULT_SIGBUS;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
