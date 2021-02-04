Return-Path: <SRS0=a4kH=HG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A77C433E6
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 05:33:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 102A764F47
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 05:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 102A764F47
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b1eN4TxHqA7Qd+Fwc6za7SXessy9s+mOGfYUe5ZVY04=; b=GXHZfiFwqylarZvb7E8/DjurS
	OsjP+0OQxZ6k/EF1l0jSc4cWqdJmSqg0P7irbaOc0dHIcXp4+09fcufti89FnNHyysnJFso2ZQTyg
	wSVYciCGG7JR6/9YCR3SuqQQoGYdelz9BMfjmV2zBU7Sl2u45gs0Ycehy+nYsCudlB2vF+3p6mk3X
	hUdNEnjajbM9bQXiBUxhpg8i5W6eZiyAOjOCQpUNhV4TqPZsRaCpon+y2nGzRLRUy1cE8uNJbP1nN
	RNwbdVKJVCPbQcCq25iu4wZW+y1n0v8Y/GVmsIadCFcr5bv/K7l9+HS873INelXF0a7+GKzQBZ+RX
	42qFsjRpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7XGI-000678-VS; Thu, 04 Feb 2021 05:33:03 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7XGC-00063g-Og; Thu, 04 Feb 2021 05:32:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612416776; x=1643952776;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IOK4UTswE1NPODeHGHqIzkeqat1sNm/Kk7Q10PMGCio=;
 b=T8QLmY0cFmSmoobHBa3p0Fe3kRSn8BY9KHB0Y0JZ72Zkm7VkqEKzgqa7
 IKzyqLaFhTO1ym79W1Byjx2zbEcXiPZHOKV+X+hmXu82cYrXv0j2fgq2o
 uEeuI4ONn9zX1gJIxdG8higjflgMvRaqIJM+roCzYmpB1eCoZ1xtkuolw
 PdI6aDTA37CIbntgWtaqcq/aAlXF2FsG2VBGJsG9rI1n78WUiLHiYPKDM
 KxnYYmW1io53zWCLxP+d/U+PQaTn+TJSzl8Gpex0QWWesOauXIBf0TQBq
 7yg6zwhHUMbhkOwIyq5obLekrscExEJuIv0m4DXYzPa7SG22B2vBcpAlH w==;
IronPort-SDR: 2Fnp922rA1lqKOkO/Jk3nCT60VzdIb42HotWFaOgKdSVqdHvcFsBanZTpPpSPy7K+8rDI46qW4
 e5bc1JwXppC8aeebHDJfz6g2GwdilxfnepvG+tupjuT11pxxMdxIdNDhBuJoeUNDfkm4RMSEIc
 HdEft0E7/SrELxfUWLg7m1YkDibtldbyM9N8tRbZi2P8k1MFS4nHWKKViHyOPtfc4X0vHOWcRz
 c6Z5N1zs6dWrI+HArO6Dv0gbpyLaQzA7XI0c6cXQgy0CwVAcSnQIXmU2RimYyBlGyFwP43Fbft
 Xt4=
X-IronPort-AV: E=Sophos;i="5.79,400,1602518400"; d="scan'208";a="159086438"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Feb 2021 13:32:54 +0800
IronPort-SDR: YWY983/l920IH9Is7i3IHF6Pps62Xf2vm2mSVnua1k2sLBB4feGMlWLOArvm3IAXKiKdaMN9Yj
 BI68mObMAXHIW+3QWikqZJOi8pNwg0Gk/menSCvWhImosXhi8VpMuNyx0gHvY7qAyqT7mFsmXI
 g6NTTyH/sOXLhT+xSwDFDX2ieUpREyDIkKF0KoyT9utRIZH7/pxT9JAbr5AuOxPpZo59Wd/exn
 gftOYAB1fdN5ayXsy0pUhATB0/c16K/4lHTdIKAlLxP/nE6PhAY+FmhEjDlfk7kYThhfWnvBvo
 ifAcmKZr5zgwbXttD1QYFloS
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 21:14:57 -0800
IronPort-SDR: gh2i3bdN2t7D2qvONDYOjfWtidHrKydscEsmK6KdMXRpTw5f0ANiCKTUVnaMCYhUDYELOKUY1W
 9tqANDxEy21cR9n32D0VeksyGuP24gzYJqW6QegtARpm+laOoHqtgsrU0TjyxDKr2wa8SBQWuE
 UfeQ8bk7yEu4b6i3J6cGPcnObJrAxDKk5p5Ehjw2YQzS9TiZoY3mQe3owU8v0FSOhuQKzHSyzz
 uoEciFj+biHL5jYZ4FpKn+YSSO/BcJdaSeUTPt+txLH+oNuR8eY2tTpZk3E38UhNjQ0Bbbx3iV
 CZ0=
WDCIronportException: Internal
Received: from cnf008142.ad.shared (HELO jedi-01.hgst.com) ([10.86.63.165])
 by uls-op-cesaip02.wdc.com with ESMTP; 03 Feb 2021 21:32:54 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] RISC-V: Reorganize SBI code by moving legacy SBI to
 its own file
Date: Wed,  3 Feb 2021 21:32:35 -0800
Message-Id: <20210204053239.1609558-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204053239.1609558-1-atish.patra@wdc.com>
References: <20210204053239.1609558-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_003257_059281_96B02371 
X-CRM114-Status: GOOD (  23.98  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 kvm@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

With SBI v0.2, there may be more SBI extensions in future. It makes more
sense to group related extensions in separate files. Guest kernel will
choose appropriate SBI version dynamically.

Move the existing implementation to a separate file so that it can be
removed in future without much conflict.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |   1 +
 arch/riscv/kvm/Makefile               |   2 +-
 arch/riscv/kvm/vcpu_sbi.c             | 126 +------------------------
 arch/riscv/kvm/vcpu_sbi_legacy.c      | 129 ++++++++++++++++++++++++++
 4 files changed, 136 insertions(+), 122 deletions(-)
 create mode 100644 arch/riscv/kvm/vcpu_sbi_legacy.c

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 5b3523a01bce..743c71f0c331 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -25,5 +25,6 @@ struct kvm_vcpu_sbi_extension {
 		       bool *exit);
 };
 
+void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
 const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(unsigned long extid);
 #endif /* __RISCV_KVM_VCPU_SBI_H__ */
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 7cf0015d9142..1ba4afe112f1 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -10,6 +10,6 @@ ccflags-y := -Ivirt/kvm -Iarch/riscv/kvm
 kvm-objs := $(common-objs-y)
 
 kvm-objs += main.o vm.o vmid.o tlb.o mmu.o
-kvm-objs += vcpu.o vcpu_exit.o vcpu_switch.o vcpu_timer.o vcpu_sbi.o
+kvm-objs += vcpu.o vcpu_exit.o vcpu_switch.o vcpu_timer.o vcpu_sbi.o vcpu_sbi_legacy.o
 
 obj-$(CONFIG_KVM)	+= kvm.o
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index a96ed3e3a9a3..29eecf8cbdc3 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -9,9 +9,7 @@
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/kvm_host.h>
-#include <asm/csr.h>
 #include <asm/sbi.h>
-#include <asm/kvm_vcpu_timer.h>
 #include <asm/kvm_vcpu_sbi.h>
 
 static int kvm_linux_err_map_sbi(int err)
@@ -32,23 +30,12 @@ static int kvm_linux_err_map_sbi(int err)
 	};
 }
 
-static void kvm_sbi_system_shutdown(struct kvm_vcpu *vcpu,
-				    struct kvm_run *run, u32 type)
-{
-	int i;
-	struct kvm_vcpu *tmp;
-
-	kvm_for_each_vcpu(i, tmp, vcpu->kvm)
-		tmp->arch.power_off = true;
-	kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
-
-	memset(&run->system_event, 0, sizeof(run->system_event));
-	run->system_event.type = type;
-	run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
-}
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_legacy;
+static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
+	&vcpu_sbi_ext_legacy,
+};
 
-static void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu,
-				       struct kvm_run *run)
+void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
 {
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
 
@@ -86,109 +73,6 @@ int kvm_riscv_vcpu_sbi_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
 	return 0;
 }
 
-static int kvm_sbi_ext_legacy_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
-				      unsigned long *out_val,
-				      struct kvm_cpu_trap *utrap,
-				      bool *exit)
-{
-	ulong hmask;
-	int i, ret = 0;
-	u64 next_cycle;
-	struct kvm_vcpu *rvcpu;
-	struct cpumask cm, hm;
-	struct kvm *kvm = vcpu->kvm;
-	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
-
-	if (!cp)
-		return -EINVAL;
-
-	switch (cp->a7) {
-	case SBI_EXT_0_1_CONSOLE_GETCHAR:
-	case SBI_EXT_0_1_CONSOLE_PUTCHAR:
-		/*
-		 * The CONSOLE_GETCHAR/CONSOLE_PUTCHAR SBI calls cannot be
-		 * handled in kernel so we forward these to user-space
-		 */
-		kvm_riscv_vcpu_sbi_forward(vcpu, run);
-		*exit = true;
-		break;
-	case SBI_EXT_0_1_SET_TIMER:
-#if __riscv_xlen == 32
-		next_cycle = ((u64)cp->a1 << 32) | (u64)cp->a0;
-#else
-		next_cycle = (u64)cp->a0;
-#endif
-		ret = kvm_riscv_vcpu_timer_next_event(vcpu, next_cycle);
-		break;
-	case SBI_EXT_0_1_CLEAR_IPI:
-		ret = kvm_riscv_vcpu_unset_interrupt(vcpu, IRQ_VS_SOFT);
-		break;
-	case SBI_EXT_0_1_SEND_IPI:
-		if (cp->a0)
-			hmask = kvm_riscv_vcpu_unpriv_read(vcpu, false, cp->a0,
-							   utrap);
-		else
-			hmask = (1UL << atomic_read(&kvm->online_vcpus)) - 1;
-		if (utrap->scause)
-			break;
-
-		for_each_set_bit(i, &hmask, BITS_PER_LONG) {
-			rvcpu = kvm_get_vcpu_by_id(vcpu->kvm, i);
-			ret = kvm_riscv_vcpu_set_interrupt(rvcpu, IRQ_VS_SOFT);
-			if (ret < 0)
-				break;
-		}
-		break;
-	case SBI_EXT_0_1_SHUTDOWN:
-		kvm_sbi_system_shutdown(vcpu, run, KVM_SYSTEM_EVENT_SHUTDOWN);
-		*exit = true;
-		break;
-	case SBI_EXT_0_1_REMOTE_FENCE_I:
-	case SBI_EXT_0_1_REMOTE_SFENCE_VMA:
-	case SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID:
-		if (cp->a0)
-			hmask = kvm_riscv_vcpu_unpriv_read(vcpu, false, cp->a0,
-							   utrap);
-		else
-			hmask = (1UL << atomic_read(&kvm->online_vcpus)) - 1;
-		if (utrap->scause)
-			break;
-
-		cpumask_clear(&cm);
-		for_each_set_bit(i, &hmask, BITS_PER_LONG) {
-			rvcpu = kvm_get_vcpu_by_id(vcpu->kvm, i);
-			if (rvcpu->cpu < 0)
-				continue;
-			cpumask_set_cpu(rvcpu->cpu, &cm);
-		}
-		riscv_cpuid_to_hartid_mask(&cm, &hm);
-		if (cp->a7 == SBI_EXT_0_1_REMOTE_FENCE_I)
-			ret = sbi_remote_fence_i(cpumask_bits(&hm));
-		else if (cp->a7 == SBI_EXT_0_1_REMOTE_SFENCE_VMA)
-			ret = sbi_remote_hfence_vvma(cpumask_bits(&hm),
-						cp->a1, cp->a2);
-		else
-			ret = sbi_remote_hfence_vvma_asid(cpumask_bits(&hm),
-						cp->a1, cp->a2, cp->a3);
-		break;
-	default:
-		ret = -EINVAL;
-		break;
-	};
-
-	return ret;
-}
-
-const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_legacy = {
-	.extid_start = SBI_EXT_0_1_SET_TIMER,
-	.extid_end = SBI_EXT_0_1_SHUTDOWN,
-	.handler = kvm_sbi_ext_legacy_handler,
-};
-
-static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
-	&vcpu_sbi_ext_legacy,
-};
-
 const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(unsigned long extid)
 {
 	int i = 0;
diff --git a/arch/riscv/kvm/vcpu_sbi_legacy.c b/arch/riscv/kvm/vcpu_sbi_legacy.c
new file mode 100644
index 000000000000..126d97b1292d
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_sbi_legacy.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0
+/**
+ * Copyright (c) 2020 Western Digital Corporation or its affiliates.
+ *
+ * Authors:
+ *     Atish Patra <atish.patra@wdc.com>
+ */
+
+#include <linux/errno.h>
+#include <linux/err.h>
+#include <linux/kvm_host.h>
+#include <asm/csr.h>
+#include <asm/sbi.h>
+#include <asm/kvm_vcpu_timer.h>
+#include <asm/kvm_vcpu_sbi.h>
+
+static void kvm_sbi_system_shutdown(struct kvm_vcpu *vcpu,
+				    struct kvm_run *run, u32 type)
+{
+	int i;
+	struct kvm_vcpu *tmp;
+
+	kvm_for_each_vcpu(i, tmp, vcpu->kvm)
+		tmp->arch.power_off = true;
+	kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
+
+	memset(&run->system_event, 0, sizeof(run->system_event));
+	run->system_event.type = type;
+	run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
+}
+
+static int kvm_sbi_ext_legacy_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
+				      unsigned long *out_val,
+				      struct kvm_cpu_trap *utrap,
+				      bool *exit)
+{
+	ulong hmask;
+	int i, ret = 0;
+	u64 next_cycle;
+	struct kvm_vcpu *rvcpu;
+	struct cpumask cm, hm;
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+
+	if (!cp)
+		return -EINVAL;
+
+	switch (cp->a7) {
+	case SBI_EXT_0_1_CONSOLE_GETCHAR:
+	case SBI_EXT_0_1_CONSOLE_PUTCHAR:
+		/*
+		 * The CONSOLE_GETCHAR/CONSOLE_PUTCHAR SBI calls cannot be
+		 * handled in kernel so we forward these to user-space
+		 */
+		kvm_riscv_vcpu_sbi_forward(vcpu, run);
+		*exit = true;
+		break;
+	case SBI_EXT_0_1_SET_TIMER:
+#if __riscv_xlen == 32
+		next_cycle = ((u64)cp->a1 << 32) | (u64)cp->a0;
+#else
+		next_cycle = (u64)cp->a0;
+#endif
+		ret = kvm_riscv_vcpu_timer_next_event(vcpu, next_cycle);
+		break;
+	case SBI_EXT_0_1_CLEAR_IPI:
+		ret = kvm_riscv_vcpu_unset_interrupt(vcpu, IRQ_VS_SOFT);
+		break;
+	case SBI_EXT_0_1_SEND_IPI:
+		if (cp->a0)
+			hmask = kvm_riscv_vcpu_unpriv_read(vcpu, false, cp->a0,
+							   utrap);
+		else
+			hmask = (1UL << atomic_read(&kvm->online_vcpus)) - 1;
+		if (utrap->scause)
+			break;
+
+		for_each_set_bit(i, &hmask, BITS_PER_LONG) {
+			rvcpu = kvm_get_vcpu_by_id(vcpu->kvm, i);
+			ret = kvm_riscv_vcpu_set_interrupt(rvcpu, IRQ_VS_SOFT);
+			if (ret < 0)
+				break;
+		}
+		break;
+	case SBI_EXT_0_1_SHUTDOWN:
+		kvm_sbi_system_shutdown(vcpu, run, KVM_SYSTEM_EVENT_SHUTDOWN);
+		*exit = true;
+		break;
+	case SBI_EXT_0_1_REMOTE_FENCE_I:
+	case SBI_EXT_0_1_REMOTE_SFENCE_VMA:
+	case SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID:
+		if (cp->a0)
+			hmask = kvm_riscv_vcpu_unpriv_read(vcpu, false, cp->a0,
+							   utrap);
+		else
+			hmask = (1UL << atomic_read(&kvm->online_vcpus)) - 1;
+		if (utrap->scause)
+			break;
+
+		cpumask_clear(&cm);
+		for_each_set_bit(i, &hmask, BITS_PER_LONG) {
+			rvcpu = kvm_get_vcpu_by_id(vcpu->kvm, i);
+			if (rvcpu->cpu < 0)
+				continue;
+			cpumask_set_cpu(rvcpu->cpu, &cm);
+		}
+		riscv_cpuid_to_hartid_mask(&cm, &hm);
+		if (cp->a7 == SBI_EXT_0_1_REMOTE_FENCE_I)
+			ret = sbi_remote_fence_i(cpumask_bits(&hm));
+		else if (cp->a7 == SBI_EXT_0_1_REMOTE_SFENCE_VMA)
+			ret = sbi_remote_hfence_vvma(cpumask_bits(&hm),
+						cp->a1, cp->a2);
+		else
+			ret = sbi_remote_hfence_vvma_asid(cpumask_bits(&hm),
+						cp->a1, cp->a2, cp->a3);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	};
+
+	return ret;
+}
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_legacy = {
+	.extid_start = SBI_EXT_0_1_SET_TIMER,
+	.extid_end = SBI_EXT_0_1_SHUTDOWN,
+	.handler = kvm_sbi_ext_legacy_handler,
+};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
