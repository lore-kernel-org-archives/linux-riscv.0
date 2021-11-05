Return-Path: <SRS0=deyN=PY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D82EC433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Nov 2021 23:59:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03BA8610CD
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Nov 2021 23:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 03BA8610CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zAjCAc94pTnQJFpTCp1cskIdAYhMBMS6zcB7kUd6vSE=; b=BMrd2SX1gFwQHH
	SJ1I33Yo/ggumWElIXmVFI/7R36NCa1sn4AiHW/J14/MNKA72qGrrODi5Ls0697x+wLT8ZebBXXRM
	30PHnxzXPJ65yOyomawvz5cn/AN/pz5uRWrIaGX08YJI+Rj1TWM3rurhXIPZb630JIeP4lR+YQFzJ
	1xANLoG3xl0w6bgasoCnD7wzwhPBc4LUoKucQjlAWvm4AvA81cOBisEKaiBwUoCAVnmb56G0hPhIi
	TQQKlTadoYL5HWVB6CtaH5cBflCh/3jwWzN/kcLlAtdbt1T1mKrHZ1GJ3P6OuOWJe9S6Y+oxNev0c
	puX9dET6eRWJjQ4WJqkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mj976-00CSxc-9o; Fri, 05 Nov 2021 23:59:16 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mj96w-00CSqy-Rf; Fri, 05 Nov 2021 23:59:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1636156746; x=1667692746;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8N7I3xFAN4A0OtRWqWWyaemIsM7CmwJ3kiGZkFqV+q8=;
 b=cL26L92puCtIRMLE43DUHalKXZmeD6MCz2QOo+IRsyCe8B/QRjRy+xdJ
 MDkV/jLW9wlQ6yu6oGdmFDnhvpzmVN8yGtCFNj7/SqXn19Ym9PGIULIqd
 GucU5ZoT/ygUCukuo41GkeIzTuqhL50wnS3QX5Vc4/evXdP8Zs0AGFrFe
 KkMWmaLePf0rMgiwbFJya88PDzCR/AGDJXywtBnaQqvh/51xIyYVm98Mp
 jqTCWa6yrwS18mOYB7hGfjc/jB+qWA5mFOhoYVc2xvNhmsV9OKCGchD74
 6QptsdLJuiKSpNulDiYpMNiHaiynjv4Yw/DXYmzG54GjrRU6/k3+59Azf w==;
X-IronPort-AV: E=Sophos;i="5.87,212,1631548800"; d="scan'208";a="183840508"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Nov 2021 07:59:03 +0800
IronPort-SDR: GyRGGj3qfrel7v6FBgTIPpZpSotjUopIAUPRqf8A4uc6gLg7TZWjTsYU+qK5YJe9vTi8PSQffR
 tG6L4bFUgV6Xag60EiEsyzpC8kUuHItBnosz1WmVWITg207ONuDRoz7xgepi/3c6NZkJpNxfEa
 CXcoHQIKKg2vSlUV+GVVHPcDORKH/NOl26pXpQFr0AWQOU9LMz7GmBkkELUW8AL2CE/13KwI9Y
 Oomer3KQur2AYtfbB6CtgUlwyc4oYidj9K8tE23zE0q1R7ecF33d//7thTv2fc87mtf/JPVFz3
 YpKnRczw08GpPHlLAFQuzgHK
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 16:32:47 -0700
IronPort-SDR: 4prbuhVOfYfRIJwLSL7Yjz1dLcKn/hge99idIBa14P8ZIIGPjNHHUfE2mCr/KBWIIEUhc2N+z7
 swEaWYHUJpgwPYewqvPckC2DIO83iM7OGTRMRXgc6GFR0Z3HQZDL6BOGU2cb5JnX+KoyscMrUE
 62+cSD7jew3dwEd4mD7TER/g/GMbZaE652DjJ1TB8iq1POah0vHAN4TPizZYNCXJv6DuRWqKfx
 XaAGNubSHyGQrkIeAHxR/EvZe6dAY0+hi7D6pPZaSDRmqAkXnqm7EU9pTuz1y1rO/BrpRFPXQ4
 bFQ=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.48])
 by uls-op-cesaip02.wdc.com with ESMTP; 05 Nov 2021 16:59:03 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>, pbonzini@redhat.com,
 Sean Christopherson <seanjc@google.com>
Subject: [PATCH v4 4/5] RISC-V: KVM: Add v0.1 replacement SBI extensions
 defined in v02
Date: Fri,  5 Nov 2021 16:58:51 -0700
Message-Id: <20211105235852.3011900-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105235852.3011900-1-atish.patra@wdc.com>
References: <20211105235852.3011900-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_165906_989307_185294ED 
X-CRM114-Status: GOOD (  19.17  )
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

The SBI v0.2 contains some of the improved versions of required v0.1
extensions such as remote fence, timer and IPI.

This patch implements those extensions.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kvm/Makefile           |   1 +
 arch/riscv/kvm/vcpu_sbi.c         |   7 ++
 arch/riscv/kvm/vcpu_sbi_replace.c | 136 ++++++++++++++++++++++++++++++
 3 files changed, 144 insertions(+)
 create mode 100644 arch/riscv/kvm/vcpu_sbi_replace.c

diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 84c02922a329..4757ae158bf3 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -25,4 +25,5 @@ kvm-y += vcpu_switch.o
 kvm-y += vcpu_sbi.o
 kvm-$(CONFIG_RISCV_SBI_V01) += vcpu_sbi_v01.o
 kvm-y += vcpu_sbi_base.o
+kvm-y += vcpu_sbi_replace.o
 kvm-y += vcpu_timer.o
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 92b682f4f29e..3502c6166eba 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -40,9 +40,16 @@ static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01 = {
 };
 #endif
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_time;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
+
 static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
 	&vcpu_sbi_ext_v01,
 	&vcpu_sbi_ext_base,
+	&vcpu_sbi_ext_time,
+	&vcpu_sbi_ext_ipi,
+	&vcpu_sbi_ext_rfence,
 };
 
 void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
new file mode 100644
index 000000000000..a80fa7691b14
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_sbi_replace.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
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
+static int kvm_sbi_ext_time_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
+				    unsigned long *out_val,
+				    struct kvm_cpu_trap *utrap, bool *exit)
+{
+	int ret = 0;
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	u64 next_cycle;
+
+	if (!cp || (cp->a6 != SBI_EXT_TIME_SET_TIMER))
+		return -EINVAL;
+
+#if __riscv_xlen == 32
+	next_cycle = ((u64)cp->a1 << 32) | (u64)cp->a0;
+#else
+	next_cycle = (u64)cp->a0;
+#endif
+	kvm_riscv_vcpu_timer_next_event(vcpu, next_cycle);
+
+	return ret;
+}
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_time = {
+	.extid_start = SBI_EXT_TIME,
+	.extid_end = SBI_EXT_TIME,
+	.handler = kvm_sbi_ext_time_handler,
+};
+
+static int kvm_sbi_ext_ipi_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
+				   unsigned long *out_val,
+				   struct kvm_cpu_trap *utrap, bool *exit)
+{
+	int i, ret = 0;
+	struct kvm_vcpu *tmp;
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	unsigned long hmask = cp->a0;
+	unsigned long hbase = cp->a1;
+
+	if (!cp || (cp->a6 != SBI_EXT_IPI_SEND_IPI))
+		return -EINVAL;
+
+	kvm_for_each_vcpu(i, tmp, vcpu->kvm) {
+		if (hbase != -1UL) {
+			if (tmp->vcpu_id < hbase)
+				continue;
+			if (!(hmask & (1UL << (tmp->vcpu_id - hbase))))
+				continue;
+		}
+		ret = kvm_riscv_vcpu_set_interrupt(tmp, IRQ_VS_SOFT);
+		if (ret < 0)
+			break;
+	}
+
+	return ret;
+}
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi = {
+	.extid_start = SBI_EXT_IPI,
+	.extid_end = SBI_EXT_IPI,
+	.handler = kvm_sbi_ext_ipi_handler,
+};
+
+static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
+				      unsigned long *out_val,
+				      struct kvm_cpu_trap *utrap, bool *exit)
+{
+	int i, ret = 0;
+	struct cpumask cm, hm;
+	struct kvm_vcpu *tmp;
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	unsigned long hmask = cp->a0;
+	unsigned long hbase = cp->a1;
+	unsigned long funcid = cp->a6;
+
+	if (!cp)
+		return -EINVAL;
+
+	cpumask_clear(&cm);
+	cpumask_clear(&hm);
+	kvm_for_each_vcpu(i, tmp, vcpu->kvm) {
+		if (hbase != -1UL) {
+			if (tmp->vcpu_id < hbase)
+				continue;
+			if (!(hmask & (1UL << (tmp->vcpu_id - hbase))))
+				continue;
+		}
+		if (tmp->cpu < 0)
+			continue;
+		cpumask_set_cpu(tmp->cpu, &cm);
+	}
+
+	riscv_cpuid_to_hartid_mask(&cm, &hm);
+
+	switch (funcid) {
+	case SBI_EXT_RFENCE_REMOTE_FENCE_I:
+		ret = sbi_remote_fence_i(cpumask_bits(&hm));
+		break;
+	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA:
+		ret = sbi_remote_hfence_vvma(cpumask_bits(&hm), cp->a2, cp->a3);
+		break;
+	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID:
+		ret = sbi_remote_hfence_vvma_asid(cpumask_bits(&hm), cp->a2,
+						  cp->a3, cp->a4);
+		break;
+	case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA:
+	case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID:
+	case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA:
+	case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID:
+	/* TODO: implement for nested hypervisor case */
+	default:
+		ret = -EOPNOTSUPP;
+	}
+
+	return ret;
+}
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence = {
+	.extid_start = SBI_EXT_RFENCE,
+	.extid_end = SBI_EXT_RFENCE,
+	.handler = kvm_sbi_ext_rfence_handler,
+};
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
