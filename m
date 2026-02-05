Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1494E8B364
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 05:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BDD+VAc65u0WakE/BUiBMwb643Inucn237SJ6QJXCkc=; b=xPGdAHyfV22IK2
	tRaKlxj78hd+YqUtYwjMEotOq4A92etWE5RpX4vg0/+8yE2xYajH/7blTw8v9F+J8NMq3WQ/acrUN
	WfeOneHJ0FtvMBNvDQyg7HtucxyzuJ94dcjveecgE1cgAcNmTu/wfhcHplpm3n542DG2uY/SpN6q1
	SdQtTRGVJ2V3JqpLkXHn3yvh9ek3YqGsqiCk76+BoZU/nWuKVsBC2At+Hx7fQNC0P49oqmMQSs8/a
	k/dOh5K0FgWVqulLoNgdM/5idUTKRm7/vCJjlFftPO0KlyChZF585tyVadvUhO4WfDw53IVAcA/8M
	UwzC2T3boMWPPNqJknPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnrms-00000009Rre-2dlG;
	Thu, 05 Feb 2026 05:20:18 +0000
Received: from relay3.mymailcheap.com ([217.182.119.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnrmp-00000009Rqm-1gH1
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 05:20:16 +0000
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay3.mymailcheap.com (Postfix) with ESMTPS id AE9E93EC2C;
	Thu,  5 Feb 2026 05:20:11 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id 4AB0B400D5;
	Thu,  5 Feb 2026 05:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1770268811; bh=rKiM9obf5J95LrwQvikvlTBi0k90jrSuoyJmI+GnCrU=;
	h=From:To:Cc:Subject:Date:From;
	b=ai3P1gKBXn10pa96H5KA6uSSJZM2T3JxUesA04AItcASi5hdcIId+ImAbvzXfrTIK
	 /hsHqp5/f4KU5nQc8ZNrHgQl5m5+4i2KZLOy7xunBQDBmrktWhcPlsY7x/tbgeBR6C
	 MbNBUPyNzyhM8hxvAQmqOZITM40b8IjE5t6IRTwQ=
Received: from liushuyu-p15 (unknown [117.151.13.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 6A3EC4017F;
	Thu,  5 Feb 2026 05:20:03 +0000 (UTC)
From: Zixing Liu <liushuyu@aosc.io>
To: WANG Xuerui <kernel@xen0n.name>,
	Huacai Chen <chenhuacai@kernel.org>,
	Bibo Mao <maobibo@loongson.cn>
Cc: Kexy Biscuit <kexybiscuit@aosc.io>,
	Mingcong Bai <jeffbai@aosc.io>,
	Zixing Liu <liushuyu@aosc.io>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5] KVM: Add KVM_GET_REG_LIST ioctl for LoongArch
Date: Thu,  5 Feb 2026 13:18:21 +0800
Message-ID: <20260205051822.1318253-1-liushuyu@aosc.io>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4AB0B400D5
X-Spamd-Result: default: False [1.40 / 10.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: nf1.mymailcheap.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_212015_589400_0577504D 
X-CRM114-Status: GOOD (  20.32  )
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

This ioctl can be used by the userspace applications to determine which
(special) registers are get/set-able in a meaningful way.

This can be very useful for cross-platform VMMs so that they do not have
to hardcode register indices for each supported architectures.

Signed-off-by: Zixing Liu <liushuyu@aosc.io>
---
 Documentation/virt/kvm/api.rst |   2 +-
 arch/loongarch/kvm/vcpu.c      | 120 +++++++++++++++++++++++++++++++++
 2 files changed, 121 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 01a3abef8abb..f46dd8be282f 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -3603,7 +3603,7 @@ VCPU matching underlying host.
 ---------------------
 
 :Capability: basic
-:Architectures: arm64, mips, riscv, x86 (if KVM_CAP_ONE_REG)
+:Architectures: arm64, loongarch, mips, riscv, x86 (if KVM_CAP_ONE_REG)
 :Type: vcpu ioctl
 :Parameters: struct kvm_reg_list (in/out)
 :Returns: 0 on success; -1 on error
diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index 656b954c1134..de02e409ae39 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -5,6 +5,7 @@
 
 #include <linux/kvm_host.h>
 #include <asm/fpu.h>
+#include <asm/kvm_host.h>
 #include <asm/lbt.h>
 #include <asm/loongarch.h>
 #include <asm/setup.h>
@@ -14,6 +15,8 @@
 #define CREATE_TRACE_POINTS
 #include "trace.h"
 
+#define NUM_LBT_REGS 6
+
 const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	KVM_GENERIC_VCPU_STATS(),
 	STATS_DESC_COUNTER(VCPU, int_exits),
@@ -1186,6 +1189,105 @@ static int kvm_loongarch_vcpu_set_attr(struct kvm_vcpu *vcpu,
 	return ret;
 }
 
+static int kvm_loongarch_walk_csrs(struct kvm_vcpu *vcpu, u64 __user *uindices)
+{
+	unsigned int i, count;
+	const unsigned int csrs_to_save[] = {
+		LOONGARCH_CSR_CRMD,	  LOONGARCH_CSR_PRMD,
+		LOONGARCH_CSR_EUEN,	  LOONGARCH_CSR_MISC,
+		LOONGARCH_CSR_ECFG,	  LOONGARCH_CSR_ESTAT,
+		LOONGARCH_CSR_ERA,	  LOONGARCH_CSR_BADV,
+		LOONGARCH_CSR_BADI,	  LOONGARCH_CSR_EENTRY,
+		LOONGARCH_CSR_TLBIDX,	  LOONGARCH_CSR_TLBEHI,
+		LOONGARCH_CSR_TLBELO0,	  LOONGARCH_CSR_TLBELO1,
+		LOONGARCH_CSR_ASID,	  LOONGARCH_CSR_PGDL,
+		LOONGARCH_CSR_PGDH,	  LOONGARCH_CSR_PGD,
+		LOONGARCH_CSR_PWCTL0,	  LOONGARCH_CSR_PWCTL1,
+		LOONGARCH_CSR_STLBPGSIZE, LOONGARCH_CSR_RVACFG,
+		LOONGARCH_CSR_CPUID,	  LOONGARCH_CSR_PRCFG1,
+		LOONGARCH_CSR_PRCFG2,	  LOONGARCH_CSR_PRCFG3,
+		LOONGARCH_CSR_KS0,	  LOONGARCH_CSR_KS1,
+		LOONGARCH_CSR_KS2,	  LOONGARCH_CSR_KS3,
+		LOONGARCH_CSR_KS4,	  LOONGARCH_CSR_KS5,
+		LOONGARCH_CSR_KS6,	  LOONGARCH_CSR_KS7,
+		LOONGARCH_CSR_TMID,	  LOONGARCH_CSR_CNTC,
+		LOONGARCH_CSR_TINTCLR,	  LOONGARCH_CSR_LLBCTL,
+		LOONGARCH_CSR_IMPCTL1,	  LOONGARCH_CSR_IMPCTL2,
+		LOONGARCH_CSR_TLBRENTRY,  LOONGARCH_CSR_TLBRBADV,
+		LOONGARCH_CSR_TLBRERA,	  LOONGARCH_CSR_TLBRSAVE,
+		LOONGARCH_CSR_TLBRELO0,	  LOONGARCH_CSR_TLBRELO1,
+		LOONGARCH_CSR_TLBREHI,	  LOONGARCH_CSR_TLBRPRMD,
+		LOONGARCH_CSR_DMWIN0,	  LOONGARCH_CSR_DMWIN1,
+		LOONGARCH_CSR_DMWIN2,	  LOONGARCH_CSR_DMWIN3,
+		LOONGARCH_CSR_TVAL,	  LOONGARCH_CSR_TCFG,
+	};
+
+	for (i = 0, count = 0;
+	     i < sizeof(csrs_to_save) / sizeof(csrs_to_save[0]); i++) {
+		const u64 reg = KVM_IOC_CSRID(i);
+		if (uindices && put_user(reg, uindices++))
+			return -EFAULT;
+		count++;
+	}
+
+	/* Skip PMU CSRs if not supported by the guest */
+	if (!kvm_guest_has_pmu(&vcpu->arch))
+		return count;
+	for (i = LOONGARCH_CSR_PERFCTRL0; i <= LOONGARCH_CSR_PERFCNTR3; i++) {
+		const u64 reg = KVM_IOC_CSRID(i);
+		if (uindices && put_user(reg, uindices++))
+			return -EFAULT;
+		count++;
+	}
+
+	return count;
+}
+
+static unsigned long kvm_loongarch_num_regs(struct kvm_vcpu *vcpu)
+{
+	/* +1 for the KVM_REG_LOONGARCH_COUNTER register */
+	unsigned long res =
+		kvm_loongarch_walk_csrs(vcpu, NULL) + KVM_MAX_CPUCFG_REGS + 1;
+
+	if (kvm_guest_has_lbt(&vcpu->arch))
+		res += NUM_LBT_REGS;
+
+	return res;
+}
+
+static int kvm_loongarch_copy_reg_indices(struct kvm_vcpu *vcpu,
+					  u64 __user *uindices)
+{
+	u64 reg;
+	unsigned int i;
+
+	i = kvm_loongarch_walk_csrs(vcpu, uindices);
+	if (i < 0)
+		return i;
+	uindices += i;
+
+	for (i = 0; i < KVM_MAX_CPUCFG_REGS; i++) {
+		reg = KVM_IOC_CPUCFG(i);
+		if (put_user(reg, uindices++))
+			return -EFAULT;
+	}
+
+	reg = KVM_REG_LOONGARCH_COUNTER;
+	if (put_user(reg, uindices++))
+		return -EFAULT;
+
+	if (!kvm_guest_has_lbt(&vcpu->arch))
+		return 0;
+
+	for (i = 1; i <= NUM_LBT_REGS; i++) {
+		reg = (KVM_REG_LOONGARCH_LBT | KVM_REG_SIZE_U64 | i);
+		if (put_user(reg, uindices++))
+			return -EFAULT;
+	}
+
+	return 0;
+}
+
 long kvm_arch_vcpu_ioctl(struct file *filp,
 			 unsigned int ioctl, unsigned long arg)
 {
@@ -1251,6 +1353,24 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
 		r = kvm_loongarch_vcpu_set_attr(vcpu, &attr);
 		break;
 	}
+	case KVM_GET_REG_LIST: {
+		struct kvm_reg_list __user *user_list = argp;
+		struct kvm_reg_list reg_list;
+		unsigned n;
+
+		r = -EFAULT;
+		if (copy_from_user(&reg_list, user_list, sizeof(reg_list)))
+			break;
+		n = reg_list.n;
+		reg_list.n = kvm_loongarch_num_regs(vcpu);
+		if (copy_to_user(user_list, &reg_list, sizeof(reg_list)))
+			break;
+		r = -E2BIG;
+		if (n < reg_list.n)
+			break;
+		r = kvm_loongarch_copy_reg_indices(vcpu, user_list->reg);
+		break;
+	}
 	default:
 		r = -ENOIOCTLCMD;
 		break;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
