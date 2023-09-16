Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCC2CD37B1
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 00:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHPyoVuX1hP6lBG3H5zsAneUt79JQ3sFY9L76KSCwiQ=; b=Qw2E+IOBQaT+6O
	ih6emaq0Yc3ZUKiyzR3VVhrKCdKH7c3md3MX4fUberG4ogT3wVvIHVmo4BTdBJHfsX6dva1NTlBU/
	R+RtS2+tGk0czXaGEIucG9tOQaAFEeDZMwuqKBm33PsQHZLAjf3ooBvvn05Vh9tiU/rpMx8TipbkD
	IWA2EJPCp97zv5ugUZ7RxArcfvrimQZPJdHDF4jVr4Kgdgq97T+H8Axr5Ef2jWMc2DBHHIdI+MhGt
	EOWIgnRx60mKpHxJCK9lVqlV76s8K6CO5J3097J/sU9fh2otNyuAhPfGqzi+pN+DlDX94Qa2d/PYe
	5FTflye0i5Z5PB2cqeBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJF6-00BduK-11;
	Sat, 16 Sep 2023 00:33:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJE1-00BcqK-05
	for linux-riscv@bombadil.infradead.org;
	Sat, 16 Sep 2023 00:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=T4d9JtkzBqCpjbUcqi6GepdBrHqatH15LR+RcbQRSno=; b=k3poX6uUFwwz9vVTOUN+Gr8zDB
	p/2LR1Knx2Z1C48nR+o65pYpPlNI1VvrXe1hwc3Ktwgcaw5cPFsMJJpncptxEuUCRkpd2tul1FiZe
	BtkVJCmjNBi9X2RqFCK2ulH/ay3RrEVMGD8qj2eXtliXrKdfJEPmdCatrPxbHyoebeZ4SjJn4KHPm
	BwK0zwcf4plp9hBUBMLIu9MF+ADd2mtqccA1SZc+kgmC4Two+vG31TLvoRxii9I3KOn3NMV+kYwB6
	doVxI3aNUexTCCtOxz+Ao/zy2UnM7NIhE1qfXUj7WrlCKy8+dymDip6RBhr8vkzl+EJeLw5kwjJbe
	yC3eDDXw==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJDu-009jmq-3A
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 00:31:51 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-59c07ca1b44so21116897b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 17:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824304; x=1695429104; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=T4d9JtkzBqCpjbUcqi6GepdBrHqatH15LR+RcbQRSno=;
        b=jIk0sYFArxUpghYY6TCMeshdQuCoCJ3R1VmYYXok/L19Kjtn17gRmHVV+fd4kN/Sk4
         K5pNqzfwHugktGP8wK14eP4bhBZvlxPTXFeXPvA+vP0NVUXSfAv/T8aWrL/Tm7lakaPn
         uKnLMWlFRgO0DM2cRw8/XP3claOZw8s/wFS32e0zeQifETRXrKG0go23Clx6TYHvZImu
         R1LnnJMAV9ndyaKQAM2GQJM2S9+UfoSZV+zYJAHlWm1EFskQtwx98z1dgMJSHqKIguFv
         t5S0OGkQSq3UNFuKxAh52H7mTkbs+oqCznOPe/iUyqAgSgm54IJNnfW2p42HlcDf/RB6
         HVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824304; x=1695429104;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4d9JtkzBqCpjbUcqi6GepdBrHqatH15LR+RcbQRSno=;
        b=r91NQxeD3Kfc2qf6r++ywXu4HX5VxVn5y+i/vUEcq6iGRPUsau919x2hmhkQeDOcSb
         PBjM2PHguoZq0KKb0m+Un9Yt1UgthI1ZL4zjgHoOTGZdq4tJIqnXBKIVZB63nJsT0Rgx
         P0p7Cmi6SAr9OQzfRqX+hczsT3aWA1Nto8W0/xFeWJBV6iCeH1x9OqPwJvis1JfL7L3W
         GSinDPJ0r3abSKzk33lhW7/8yYcI4S6OAuuIdCJmQix88eLuoJSUt1UWTjPbgmJAnRD1
         vdXS1KJsH4eymcOty6CLwOrEif7Vsy1gV77YAoG0haHdD0gR2oYMOUspzmQYMUfJb+bX
         FrJA==
X-Gm-Message-State: AOJu0YxF4aWbCPQvEEqup2IS9PHdvTWY345jfqLCYvdp/gGdy5v/gMXG
	PJMtKHsBHchVenfl5iLPs9SjymEjkTQ=
X-Google-Smtp-Source: AGHT+IFHuI3+InjaYoGpeoRnBjmpOWBEwR2qvNTEjtEAfl3mVa5tl1N1hW80goIMLDXxJcvVvIl5YUYpSE0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:181b:b0:d81:4107:7a1 with SMTP id
 cf27-20020a056902181b00b00d81410707a1mr70396ybb.2.1694824304643; Fri, 15 Sep
 2023 17:31:44 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:31:04 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-13-seanjc@google.com>
Subject: [PATCH 12/26] KVM: arm64: Move arm_{psci,hypercalls}.h to an internal
 KVM path
From: Sean Christopherson <seanjc@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Jason Herne <jjherne@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, 
	Alex Williamson <alex.williamson@redhat.com>, Andy Lutomirski <luto@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Anish Ghulati <aghulati@google.com>, Venkatesh Srinivas <venkateshs@chromium.org>, 
	Andrew Thornton <andrewth@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_013148_703799_88D83B2E 
X-CRM114-Status: GOOD (  12.66  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Anish Ghulati <aghulati@google.com>

Move arm_hypercalls.h and arm_psci.h into arch/arm64/kvm now that KVM
no longer supports 32-bit ARM, i.e. now that there's no reason to make
the hypercall and PSCI APIs "public".

Signed-off-by: Anish Ghulati <aghulati@google.com>
[sean: squash into one patch, write changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c                         | 5 +++--
 {include => arch/arm64}/kvm/arm_hypercalls.h | 0
 {include => arch/arm64}/kvm/arm_psci.h       | 0
 arch/arm64/kvm/guest.c                       | 2 +-
 arch/arm64/kvm/handle_exit.c                 | 2 +-
 arch/arm64/kvm/hyp/Makefile                  | 4 ++--
 arch/arm64/kvm/hyp/include/hyp/switch.h      | 4 ++--
 arch/arm64/kvm/hyp/nvhe/switch.c             | 4 ++--
 arch/arm64/kvm/hyp/vhe/switch.c              | 4 ++--
 arch/arm64/kvm/hypercalls.c                  | 4 ++--
 arch/arm64/kvm/psci.c                        | 4 ++--
 arch/arm64/kvm/pvtime.c                      | 2 +-
 arch/arm64/kvm/trng.c                        | 2 +-
 13 files changed, 19 insertions(+), 18 deletions(-)
 rename {include => arch/arm64}/kvm/arm_hypercalls.h (100%)
 rename {include => arch/arm64}/kvm/arm_psci.h (100%)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 4866b3f7b4ea..6de1d63b981b 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -41,9 +41,10 @@
 #include <asm/kvm_emulate.h>
 #include <asm/sections.h>
 
-#include <kvm/arm_hypercalls.h>
 #include <kvm/arm_pmu.h>
-#include <kvm/arm_psci.h>
+
+#include "arm_hypercalls.h"
+#include "arm_psci.h"
 
 static enum kvm_mode kvm_mode = KVM_MODE_DEFAULT;
 
diff --git a/include/kvm/arm_hypercalls.h b/arch/arm64/kvm/arm_hypercalls.h
similarity index 100%
rename from include/kvm/arm_hypercalls.h
rename to arch/arm64/kvm/arm_hypercalls.h
diff --git a/include/kvm/arm_psci.h b/arch/arm64/kvm/arm_psci.h
similarity index 100%
rename from include/kvm/arm_psci.h
rename to arch/arm64/kvm/arm_psci.h
diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 95f6945c4432..32045ad51ec4 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -18,7 +18,6 @@
 #include <linux/string.h>
 #include <linux/vmalloc.h>
 #include <linux/fs.h>
-#include <kvm/arm_hypercalls.h>
 #include <asm/cputype.h>
 #include <linux/uaccess.h>
 #include <asm/fpsimd.h>
@@ -27,6 +26,7 @@
 #include <asm/kvm_nested.h>
 #include <asm/sigcontext.h>
 
+#include "arm_hypercalls.h"
 #include "trace.h"
 
 const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index 617ae6dea5d5..f1d02d6f8683 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -21,7 +21,7 @@
 #include <asm/stacktrace/nvhe.h>
 #include <asm/traps.h>
 
-#include <kvm/arm_hypercalls.h>
+#include "arm_hypercalls.h"
 
 #define CREATE_TRACE_POINTS
 #include "trace_handle_exit.h"
diff --git a/arch/arm64/kvm/hyp/Makefile b/arch/arm64/kvm/hyp/Makefile
index a38dea6186c9..4ce8c86967b5 100644
--- a/arch/arm64/kvm/hyp/Makefile
+++ b/arch/arm64/kvm/hyp/Makefile
@@ -4,7 +4,7 @@
 #
 
 incdir := $(srctree)/$(src)/include
-subdir-asflags-y := -I$(incdir)
-subdir-ccflags-y := -I$(incdir)
+subdir-asflags-y := -I$(incdir) -I$(srctree)/arch/arm64/kvm
+subdir-ccflags-y := -I$(incdir) -I$(srctree)/arch/arm64/kvm
 
 obj-$(CONFIG_KVM) += vhe/ nvhe/ pgtable.o
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 9cfe6bd1dbe4..cd21cf71d7db 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -16,8 +16,6 @@
 #include <linux/jump_label.h>
 #include <uapi/linux/psci.h>
 
-#include <kvm/arm_psci.h>
-
 #include <asm/barrier.h>
 #include <asm/cpufeature.h>
 #include <asm/extable.h>
@@ -31,6 +29,8 @@
 #include <asm/debug-monitors.h>
 #include <asm/processor.h>
 
+#include "arm_psci.h"
+
 struct kvm_exception_table_entry {
 	int insn, fixup;
 };
diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index c353a06ee7e6..c0553ac36a46 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -13,8 +13,6 @@
 #include <linux/jump_label.h>
 #include <uapi/linux/psci.h>
 
-#include <kvm/arm_psci.h>
-
 #include <asm/barrier.h>
 #include <asm/cpufeature.h>
 #include <asm/kprobes.h>
@@ -29,6 +27,8 @@
 #include <nvhe/fixed_config.h>
 #include <nvhe/mem_protect.h>
 
+#include "arm_psci.h"
+
 /* Non-VHE specific context */
 DEFINE_PER_CPU(struct kvm_host_data, kvm_host_data);
 DEFINE_PER_CPU(struct kvm_cpu_context, kvm_hyp_ctxt);
diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index 6537f58b1a8c..f7423c890b5c 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -13,8 +13,6 @@
 #include <linux/percpu.h>
 #include <uapi/linux/psci.h>
 
-#include <kvm/arm_psci.h>
-
 #include <asm/barrier.h>
 #include <asm/cpufeature.h>
 #include <asm/kprobes.h>
@@ -28,6 +26,8 @@
 #include <asm/thread_info.h>
 #include <asm/vectors.h>
 
+#include "arm_psci.h"
+
 /* VHE specific context */
 DEFINE_PER_CPU(struct kvm_host_data, kvm_host_data);
 DEFINE_PER_CPU(struct kvm_cpu_context, kvm_hyp_ctxt);
diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
index 7fb4df0456de..d34a31c9ace2 100644
--- a/arch/arm64/kvm/hypercalls.c
+++ b/arch/arm64/kvm/hypercalls.c
@@ -6,8 +6,8 @@
 
 #include <asm/kvm_emulate.h>
 
-#include <kvm/arm_hypercalls.h>
-#include <kvm/arm_psci.h>
+#include "arm_hypercalls.h"
+#include "arm_psci.h"
 
 #define KVM_ARM_SMCCC_STD_FEATURES				\
 	GENMASK(KVM_REG_ARM_STD_BMAP_BIT_COUNT - 1, 0)
diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
index 1f69b667332b..c461e15026c9 100644
--- a/arch/arm64/kvm/psci.c
+++ b/arch/arm64/kvm/psci.c
@@ -13,8 +13,8 @@
 #include <asm/cputype.h>
 #include <asm/kvm_emulate.h>
 
-#include <kvm/arm_psci.h>
-#include <kvm/arm_hypercalls.h>
+#include "arm_hypercalls.h"
+#include "arm_psci.h"
 
 /*
  * This is an implementation of the Power State Coordination Interface
diff --git a/arch/arm64/kvm/pvtime.c b/arch/arm64/kvm/pvtime.c
index 4ceabaa4c30b..b07d250d223c 100644
--- a/arch/arm64/kvm/pvtime.c
+++ b/arch/arm64/kvm/pvtime.c
@@ -8,7 +8,7 @@
 #include <asm/kvm_mmu.h>
 #include <asm/pvclock-abi.h>
 
-#include <kvm/arm_hypercalls.h>
+#include "arm_hypercalls.h"
 
 void kvm_update_stolen_time(struct kvm_vcpu *vcpu)
 {
diff --git a/arch/arm64/kvm/trng.c b/arch/arm64/kvm/trng.c
index 99bdd7103c9c..b5dc0f09797a 100644
--- a/arch/arm64/kvm/trng.c
+++ b/arch/arm64/kvm/trng.c
@@ -6,7 +6,7 @@
 
 #include <asm/kvm_emulate.h>
 
-#include <kvm/arm_hypercalls.h>
+#include "arm_hypercalls.h"
 
 #define ARM_SMCCC_TRNG_VERSION_1_0	0x10000UL
 
-- 
2.42.0.459.ge4e396fd5e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
