Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8021CCFC276
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 08:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4JycLIiprAl9syFy/pFca2KEIe9HpGVoDw6RsTvW7Ug=; b=EcZejcoF6YaP5p
	DuwSD6rXDCi5mRqLmWEMkkyAoRc8wnnSCsYGmlKsNKzbRx8ZCv6/zM0R7ct+Wnr0zbPG3tVfpm+yk
	j7EVPh+hD9SwSsGuw9+8fwG8WcgkJ+k43NFX2+VQ17AaBPLvzOeh9rip7jqmtZ+obG5pzzst41/IM
	PlHO9+GEeQGUTojs+9YxFmkDbfbTlCYuVx/x8kLheXFqBjTgUJ00S7Fczd1OAkmyhkZ/DKNKb3Ped
	ROmK0EDeQhmCpSy9jTRbmFMyPIGUGq+vmNMWHauVPgsR2RGOI8a5LzZXMLItxPIdatw/7k1LGbhm7
	gvVGZIubCm6ofuiAdCTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0d9k-00000007YKU-1ny2;
	Tue, 15 Oct 2024 08:43:52 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0d9h-00000007YIn-3GI4;
	Tue, 15 Oct 2024 08:43:51 +0000
Received: from zq-Legion-Y7000.. (unknown [121.237.44.89])
	by APP-01 (Coremail) with SMTP id qwCowADnx7U7Kw5nCvutBw--.31767S2;
	Tue, 15 Oct 2024 16:43:40 +0800 (CST)
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
Subject: [PATCH v5 2/2] riscv: KVM: add basic support for host vs guest profiling
Date: Tue, 15 Oct 2024 16:43:00 +0800
Message-Id: <00342d535311eb0629b9ba4f1e457a48e2abee33.1728980031.git.zhouquan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728980031.git.zhouquan@iscas.ac.cn>
References: <cover.1728980031.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADnx7U7Kw5nCvutBw--.31767S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJFW7KrW7Kw13AFy8GFyrCrg_yoW5ur1rpF
	Z8ur9Y9r4rKr97C34ayr1v9r45WFsYgw13Xry7CFy5Wr4Utry8Jr4vg34DAry5JFW8Xa4S
	kFyrKFyruwn8Aw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
	xVA2Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r4a6rW5MxkIecxEwVAFwV
	W8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMI
	IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRkHUkUUUUU
	=
X-Originating-IP: [121.237.44.89]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiCRELBmcOALGnrQAAsH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_014350_220991_FD484C5E 
X-CRM114-Status: GOOD (  12.40  )
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

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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
