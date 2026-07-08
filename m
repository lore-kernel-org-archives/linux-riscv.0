Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3276CC43602
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 03:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DSgiBmdOwnzhPJwTIYqsO1/kXHOszgMi2f+b0/u2YPY=; b=2Y/WQfbthrxQPs
	WH7yTUIX6G5C48IAvhj/ejOe53Nugnu1uyAlG/Q5ykYHpeFzwY7ZgZs5w5ks/eRJsOvc+sXFpVlSJ
	IDyabW1RNy7lQz1GQqrnC4srN1s+rS9wFEHF6closblanAo3mmR/xdec3PxF6MGTmKVMtB1n0WLen
	402rwInca4vb8rxlKuPRmVF7DLambeAcs2yC+l5w8LeIaEehl8wKbafA39VTxWtQsNpRyLCC7WCay
	CGDjb8JLv7DFgv8d10w1wM9WuoQ2dwVAcuTV8rnzTBs16IwCjtC+yS7xz1GXOmeqCNrqsP9mTwdoy
	Jir2jl56LCmVOV7MBGmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ66-0000000GGZ0-0hV6;
	Wed, 08 Jul 2026 03:37:18 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5V-0000000GFq3-3UTU
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 03:36:53 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-37ff8e0ad0fso268840a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jul 2026 20:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481801; x=1784086601; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bdv2Ctkz/FW0hn4mHAySYNVwcrKaEen484H6Mm8b//s=;
        b=MNi+wcgHy4W3t3jVJuqyyDpLOyYGJFWeyR1BWeFz1JvsY+SkNZemThrXPdtfrUoLWR
         b9IsvaM2jz6OrnIaHJhPm4mM8k31RA96RdnUvIGdAEpUJthI3SJ4ASpQ+rwABgAxzISA
         8j3wCh9v4fsk/NcIA57uk0/E0ShSdp5Nn3LqaV1Y5IpfuawC6xD5pCdEl5pVYvZrg8YM
         7n7I3xGrszfKz6Cp5XN1pybjTPTFuL36o7HcL8a/b2fYGHxryxhIX983ZhCmc3aoug6n
         5ovNrJgradL2qajUx/dxJj3MstWakG2ahN5hLbscgOMuDJJWOcMiUILQI46zUXHzM8HK
         bIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481801; x=1784086601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bdv2Ctkz/FW0hn4mHAySYNVwcrKaEen484H6Mm8b//s=;
        b=ikh7oPZNEW8gn3nIA9Y4fO8n/d6E1uHd3xyitIvhdq1CjN03H72wY4llC3sxy6HOj7
         WXxTzQvx/gXjoGTh843vunPcD/5SyUtbtUWJPz6wzddEQWstTP5z2NxBOsXWtmSUGSfC
         k47nGbhmLdB+zmtGDQPyOvVXmhYz2i0HjlVkAbeHbe3iS0r/M2gOfNlDdbZU1SyduAxQ
         Otnd6eo0MxGHI6XjABJ0vj1hiaYYf5A91LtfWM0qtHV2dhH7OhJUZdRhggGWLAcMowyX
         ipP0K8yjN9LJcPmlkAnFZK545ksuSr+mYNiy0BelKdRm5wXGiSxCRA9BAsnYybDAaTQN
         i1vA==
X-Gm-Message-State: AOJu0Yw7lwhHRn4DaMvTKGw1OWnEaM1NhwCJLrQtwW1GIy4cJZiEDjzm
	OHMBqqqIXsWgi1tHxjKVlWk/CjD/nmwlwhSLzNFV16JXjqPO065VkSTx
X-Gm-Gg: AfdE7cmi8t5wOyZJ/Q//ptwO5U+oK/1Ft5y1Ddxi5cIHCJDVK3BhYtCVhSxfGHhix1Z
	s1iLfut9FQAQsOCwKddF1LOr1PO81jFz6G8Uuw713MmeIS4QLwGima8oNokP4jzCjBvppTFmZtW
	IF3eh/gbFfkNgmTIhJj5bE6erO91ULxGSuDGW8knX8/XDprlHCAVgaN7gHE0HSEB34ECVfDD1Aq
	w083mTEgujhthEgsmQIZoX1GzRCj8MQ6Y9jVW3cDf4XFrKU8h3dc30KZXmjLY5RbWZ+BfTUmpm8
	PMRQfc3wF/y10z3aaOszFbaPVtRz0TRgPV8Z6IDBtjchljDv4hbrQRhiw+d8gNnJ3rQ9hobeYAj
	us8IF28e23t//rIYdFyKmOc7ZdcWPUfnd3Zfh2n4AOSfpd12PSo3YuOdGI3avjmdyKGtQ2VVMGf
	+cQXwlWoxkJhi2QA6Va6tkewcjlwdL5Z67UCENxAg=
X-Received: by 2002:a17:90b:5290:b0:387:e0db:3d8d with SMTP id 98e67ed59e1d1-3894395516amr711810a91.40.1783481801232;
        Tue, 07 Jul 2026 20:36:41 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm21092850eec.29.2026.07.07.20.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:36:40 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Tue, 07 Jul 2026 20:34:36 -0700
Subject: [PATCH v3 13/17] riscv: kvm: Add emulated test csr
MIME-Version: 1.0
Message-Id: <20260707-riscv_insn_table-v3-13-3f8e5f75ba97@gmail.com>
References: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
In-Reply-To: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Nam Cao <namcao@linutronix.de>, Alexandre Ghiti <alex@ghiti.fr>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Conor Dooley <conor@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783481777; l=5057;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=oHl0N2vpojWj02TJpZJMDrHhq8G9Cg4fhg6BkSVUMOQ=;
 b=f0/7JmOW73SvUy0ZQ6FNsrrekd4jPc1glCSUOAPV1wBR0CHqyzyAdPHvMn6Kgn7F2HQA/J1RT
 JVOWRlWMUMtAgaNQP6Ht6OpkBNnT+1o0lQcFeJd/mP/Dc/RKXZIqzFo
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_203642_990922_20955190 
X-CRM114-Status: GOOD (  18.68  )
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

To test the riscv kvm implementation of emulated CSRs, add support to
emulate the vsscratch csr when CONFIG_RISCV_KVM_TEST_CSR is set.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 arch/riscv/Kconfig.debug                   |  1 +
 arch/riscv/include/asm/kvm_host.h          | 10 ++++++++++
 arch/riscv/include/asm/kvm_vcpu_test_csr.h | 15 +++++++++++++++
 arch/riscv/kvm/Kconfig.debug               | 16 ++++++++++++++++
 arch/riscv/kvm/Makefile                    |  1 +
 arch/riscv/kvm/vcpu_insn.c                 |  5 +++++
 arch/riscv/kvm/vcpu_test_csr.c             | 21 +++++++++++++++++++++
 7 files changed, 69 insertions(+)

diff --git a/arch/riscv/Kconfig.debug b/arch/riscv/Kconfig.debug
index eafe17ebf710..be202267da6d 100644
--- a/arch/riscv/Kconfig.debug
+++ b/arch/riscv/Kconfig.debug
@@ -1 +1,2 @@
 source "arch/riscv/kernel/tests/Kconfig.debug"
+source "arch/riscv/kvm/Kconfig.debug"
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 75b0a951c1bc..4d30d30ebefc 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -167,6 +167,12 @@ struct kvm_vcpu_reset_state {
 	unsigned long a1;
 };
 
+#ifdef CONFIG_RISCV_KVM_TEST_CSR
+struct kvm_test_csr {
+	unsigned long val;
+};
+#endif
+
 struct kvm_vcpu_arch {
 	/* VCPU ran at least once */
 	bool ran_atleast_once;
@@ -265,6 +271,10 @@ struct kvm_vcpu_arch {
 		gpa_t shmem;
 		u64 last_steal;
 	} sta;
+
+#ifdef CONFIG_RISCV_KVM_TEST_CSR
+	struct kvm_test_csr test_csr;
+#endif
 };
 
 /*
diff --git a/arch/riscv/include/asm/kvm_vcpu_test_csr.h b/arch/riscv/include/asm/kvm_vcpu_test_csr.h
new file mode 100644
index 000000000000..a844fccaafc3
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_vcpu_test_csr.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __KVM_VCPU_RISCV_TEST_CSR_H
+#define __KVM_VCPU_RISCV_TEST_CSR_H
+
+#include <asm/kvm_vcpu_insn.h>
+
+#define KVM_RISCV_VCPU_TEST_CSR_FUNCS \
+	{.base = CSR_VSSCRATCH,	.count = 1,	.func = kvm_riscv_vcpu_test_csr },
+
+int kvm_riscv_vcpu_test_csr(struct kvm_vcpu *vcpu, unsigned int csr_num,
+			    unsigned long *val, unsigned long new_val,
+			    unsigned long wr_mask);
+
+#endif /* !__KVM_VCPU_RISCV_TEST_CSR_H */
diff --git a/arch/riscv/kvm/Kconfig.debug b/arch/riscv/kvm/Kconfig.debug
new file mode 100644
index 000000000000..dc76e02120a3
--- /dev/null
+++ b/arch/riscv/kvm/Kconfig.debug
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "arch/riscv/kvm testing"
+
+config RISCV_KVM_TEST_CSR
+        bool "Test KVM CSR emulation"
+        depends on KVM
+        default n
+        help
+            Enable this option to enable the emulation of a test hypervisor csr.
+            The KVM test csr is the vsscratch register. Once this is enabled,
+            reading/writing to the vsscratch register will trap into the host
+            supervisor and reflect the change.
+
+            If unsure, say N.
+
+endmenu # "arch/riscv/kvm testing"
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 296c2ba05089..5092b86751c4 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -38,6 +38,7 @@ kvm-y += vcpu_sbi_sta.o
 kvm-y += vcpu_sbi_system.o
 kvm-$(CONFIG_RISCV_SBI_V01) += vcpu_sbi_v01.o
 kvm-y += vcpu_switch.o
+kvm-$(CONFIG_RISCV_KVM_TEST_CSR) += vcpu_test_csr.o
 kvm-y += vcpu_timer.o
 kvm-y += vcpu_vector.o
 kvm-y += vm.o
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 78adc2830819..c3e4cf2cd44b 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -10,6 +10,8 @@
 #include <asm/cpufeature.h>
 #include <asm/insn.h>
 
+#include <asm/kvm_vcpu_test_csr.h>
+
 struct insn_func {
 	unsigned long mask;
 	unsigned long match;
@@ -112,6 +114,9 @@ static int seed_csr_rmw(struct kvm_vcpu *vcpu, unsigned int csr_num,
 static const struct csr_func csr_funcs[] = {
 	KVM_RISCV_VCPU_AIA_CSR_FUNCS
 	KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS
+#ifdef CONFIG_RISCV_KVM_TEST_CSR
+	KVM_RISCV_VCPU_TEST_CSR_FUNCS
+#endif
 	{ .base = CSR_SEED, .count = 1, .func = seed_csr_rmw },
 };
 
diff --git a/arch/riscv/kvm/vcpu_test_csr.c b/arch/riscv/kvm/vcpu_test_csr.c
new file mode 100644
index 000000000000..b8aa503cdaba
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_test_csr.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/kvm_host.h>
+#include <asm/kvm_vcpu_insn.h>
+#include <asm/kvm_vcpu_test_csr.h>
+
+#define vcpu_to_test_csr(vcpu) (&(vcpu)->arch.test_csr)
+
+int kvm_riscv_vcpu_test_csr(struct kvm_vcpu *vcpu, unsigned int csr_num,
+			    unsigned long *val, unsigned long new_val,
+			    unsigned long wr_mask)
+{
+	struct kvm_test_csr *test_csr = vcpu_to_test_csr(vcpu);
+
+	*val = test_csr->val;
+
+	if (wr_mask)
+		test_csr->val = (test_csr->val & ~wr_mask) | (new_val & wr_mask);
+
+	return KVM_INSN_CONTINUE_NEXT_SEPC;
+}

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
