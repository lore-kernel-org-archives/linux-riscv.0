Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A098AD1814C
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 02:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JeyF+6p6jw903EVe+IFR2Fx22pvkqukisR+0o4WS/b4=; b=ZguSvwXC9e+f+K
	fDe4Ahr5U2iSmdnYd6vubDhgfy+Dd4m1HIE7JfB0sL2MU5ADrNF58zCSd2X2XspIfjRpbzDCEsSDJ
	FCKTQEHNcrfYErK2kpnpYn9B0W1+mbNGPlssHZ38/ZJa2wNOzfGURQxSi/63MTeKlfTNvW1Dsi++U
	CMJv/d6rruY+xcavKO11uXZbmMG0HiJZSpH9+Ajbu2VniHyvQfHPUmkonNqXxKI5o06kz1NQ3iJ4V
	i996xzf2Ky0XVFWpRtgFN+5gAF96IdLVS+JAyLrrBl/+yTVGeeyl9p9/QErKDSwZuoFhk4LxK6JWm
	RBRO0KKa7w3Wi1ZBfaKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0XmT-00000006wFA-1OWe;
	Tue, 15 Oct 2024 02:59:29 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0XmP-00000006wDc-3FAW;
	Tue, 15 Oct 2024 02:59:27 +0000
Received: from zq-Legion-Y7000.. (unknown [121.237.44.89])
	by APP-01 (Coremail) with SMTP id qwCowABnT36E2g1n1j+cBw--.30815S2;
	Tue, 15 Oct 2024 10:59:17 +0800 (CST)
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
Subject: [PATCH v4 2/2] riscv: KVM: add basic support for host vs guest profiling
Date: Tue, 15 Oct 2024 10:58:37 +0800
Message-Id: <00342d535311eb0629b9ba4f1e457a48e2abee33.1728957131.git.zhouquan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728957131.git.zhouquan@iscas.ac.cn>
References: <cover.1728957131.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowABnT36E2g1n1j+cBw--.30815S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJFW7KrWUtFWxAryrGF15Arb_yoW5ZF4xpF
	Z8ur9Y93yrKr97C34ayr1v9r45WFsYgw13Xry7uFy5Gr45try8Jr4vg34DAry5JFW8Xa4S
	kFyrKFyruwn8Aw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7
	v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF
	7I0E8cxan2IY04v7M4kE6xkIj40Ew7xC0wCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14
	v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
	xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
	kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
	6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
	CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUFVbkUUUU
	U
X-Originating-IP: [121.237.44.89]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiDAgLBmcNsJGTIAAAsx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_195926_376936_180B0095 
X-CRM114-Status: GOOD (  12.50  )
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
index f3427f6de608..5682e338ae6d 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -51,6 +51,12 @@ void kvm_arch_disable_virtualization_cpu(void)
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
