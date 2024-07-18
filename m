Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC025C3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 11:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nj9odDYK3VgnkE1G7LZ/s8Is+bBDAhf/NA6p5cjr24g=; b=e1Ou1gK26AogBK
	78nKobQbE/BkVOBAQfApL/0i5HBJj52B86kb4zLZFe3Ic75UBJHqadIPlO4jWADS0Ozo91/B2wNWv
	sbJK3GVKvWm9iwF/O66j5/tZzMrsBFscymrvFMDBmD8u8FpA3aPM45Imq5dcjfi0syvzUQflTj4Dg
	oAUXPdoLe9DZ+PTcXJ3qVdtxLH5rXvfSKBqIUx9hp3GCxgdTTtnutQOYeeRWOxjs5l/fiv7jBhTsi
	4tG008rxyINA60/Vh5hjU1FB7N+3T5+nxTMg0oKnbpyZhYZrwlIn13kBbsbTNbXmnJvayGUjYhTJa
	taV/nAi6VJHBKSXcSvJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUPEx-0000000GpUA-2uau;
	Thu, 18 Jul 2024 11:24:03 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUPEu-0000000GpRi-42Oz;
	Thu, 18 Jul 2024 11:24:02 +0000
Received: from ThinkPad-T480s.. (unknown [180.110.112.93])
	by APP-03 (Coremail) with SMTP id rQCowADHzppH+5hmqKdgFg--.35992S2;
	Thu, 18 Jul 2024 19:23:52 +0800 (CST)
From: zhouquan@iscas.ac.cn
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH 2/2] riscv: KVM: add basic support for host vs guest profiling
Date: Thu, 18 Jul 2024 19:23:51 +0800
Message-Id: <fbf8a9fcca05a1b554ac0d01b0c46fbb6263c435.1721271251.git.zhouquan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721271251.git.zhouquan@iscas.ac.cn>
References: <cover.1721271251.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowADHzppH+5hmqKdgFg--.35992S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJFW5KF4Utw45Zw43KrykXwb_yoW5CF4fpF
	s8urn5u3ya9ryxGa4ayr1v9r45WFsYgw13Xry7Cay5Gr45try8Jr4vg34DAry5JFW0qa4f
	CF95KFyruwn8Jw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwAKzVCY07xG64k0F24l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjfU5rWFUUUUU
X-Originating-IP: [180.110.112.93]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiDAYCBmaY7wwhMwAAsB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_042401_425767_62EFE9FD 
X-CRM114-Status: GOOD (  11.34  )
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
these events separately. This can be achieved by having
KVM register perf callbacks.

Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
---
 arch/riscv/include/asm/kvm_host.h |  6 ++++++
 arch/riscv/kvm/Kconfig            |  1 +
 arch/riscv/kvm/main.c             | 12 ++++++++++--
 arch/riscv/kvm/vcpu.c             |  7 +++++++
 4 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index d96281278586..b7bbe1c0c5dd 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -285,6 +285,12 @@ struct kvm_vcpu_arch {
 	} sta;
 };
 
+/* TODO: A more explicit approach might be needed here than this simple one */
+static inline bool kvm_arch_pmi_in_guest(struct kvm_vcpu *vcpu)
+{
+	return IS_ENABLED(CONFIG_GUEST_PERF_EVENTS) && !!vcpu;
+}
+
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
 
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
index 17e21df36cc1..c9d291865141 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -222,6 +222,13 @@ bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
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
