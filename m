Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2BEC4828F
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Feb 2024 05:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6fWhGt8j1VZFGQEXyFQqtP+dmnZeZqXJqZ6A7pXssM0=; b=3KfFkYxzll+RHo
	dnxEyoQm3C9UNIR3uGlyxxLJDetGu66VO/su45y1NwSpaQeB7drjrh8NJb3sgWf2N1XBrx/pJ3NMF
	W263d8Jm3p+wq498x2Ttgxm6wwVTcXwJwUZDKs+bfgrHbq0pfkpCOHhq7dzY3mANVMb+Ys2vBgNvB
	pShEaJxuppI0KgTcu0SIovnlARen7F3Cgb6w/hB0HQ5sDoyGN5RELqDPnaYoiAhFVa0fewa5GUSiY
	lhQleamF0ruTYWYw6p2AXoXzZzAvMg0VX5c0207ySbaSoNEYXQv0BlXvd6zfN8RsGulhv8WWfFvAI
	cBQgvChriwLqXYXi9U5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW8eo-0000000FP6Q-1Vc2;
	Sat, 03 Feb 2024 05:33:38 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3bL-0000000Dsmv-26Vc
	for linux-riscv@lists.infradead.org;
	Sat, 03 Feb 2024 00:09:59 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1d950445c0bso26578025ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 16:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706918981; x=1707523781; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=VzhuhwHBOVTPe3ek7qdXtFf4wVMa0yBW9i03fvIkD6g=;
        b=iChnUukdJGoSHjzVu5DwZOMOVWhIzOEt6DOXlDAlat9wHHmiDRto5fxhVwi1wwwmpW
         U/VahC18KLaMXUmFU+/aMPunh/JEem6/brseQMLkxmusYD5xEeyNanlx68/3+9apUUTa
         H/ulFDk4PUEPtTKMMBT0lWNs8/QZGM0YSad5aQGL1jbk5A/qweVD8yapi6ow09XDvegO
         GTsf9/ZS3iMnQ+8tSx8Osqtbuih8G5zIvYYSXXiFLKnFrI+ensSqx6eaUZRWerKdJh+b
         5khy2NDTIJveWxLHCBvNZhxNpbzekHpWBZPluxF0By7gUrJkm1we2VBHRc8i/dcPCn6Y
         lF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706918981; x=1707523781;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzhuhwHBOVTPe3ek7qdXtFf4wVMa0yBW9i03fvIkD6g=;
        b=l9l0ITdTPKm3nWbaNBQQ2SY8yCOzT1o1zqgpmBeWpHZbJ44lRgzqpzl+q3+R0XE+W8
         rwteDEfAXnVWt7fNo3lEvteIvCjdMkTNBs+Ft5Ylwhh9QdcIL3O2gWf20q9Yh1Vwan4i
         CEZCBCsI/jF57mlpmcFELeo8Fwn6h4H+prKLNhW1garbFaoWCccz91EO6oc2e4Ds4FVe
         K/gCMT4PP7keq3MFVrtnj+pdpSd/ci0BhkByKLYOAWDUZOH/dfCZASkCYuz+jaqgioY8
         0WX7+sJzeKu6xPZXURLZyDgG//kXd697E/ZmrwUwuBf+kamvbYDiGfmINd3U6EsvZUq6
         o0wQ==
X-Gm-Message-State: AOJu0Yw/6wrVP33MiWL8qwQAYU1YyGuSnM/ndY3CewtMdYJNwgJAjwSf
	vda+cjvxk9zrticLsv6+uL0T5aNPWk00wonsVOKCBWe/NlYHlKZSUDarSovZhoSLllwCVe/jwqs
	BAg==
X-Google-Smtp-Source: AGHT+IFdVzXVjWcXSdnVu4txbSAxtL7z3o5BSMoU53EUfpfZ3637JRMu4aCEDmVPmG/jpu55q3noR5dZ8rg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:e741:b0:1d9:1ca3:1883 with SMTP id
 p1-20020a170902e74100b001d91ca31883mr51751plf.5.1706918980700; Fri, 02 Feb
 2024 16:09:40 -0800 (PST)
Date: Fri,  2 Feb 2024 16:09:16 -0800
In-Reply-To: <20240203000917.376631-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240203000917.376631-1-seanjc@google.com>
X-Mailer: git-send-email 2.43.0.594.gd9cf4e227d-goog
Message-ID: <20240203000917.376631-11-seanjc@google.com>
Subject: [PATCH v8 10/10] KVM: selftests: Add a basic SEV smoke test
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Andrew Jones <andrew.jones@linux.dev>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Peter Gonda <pgonda@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_160944_482592_BB4C7E68 
X-CRM114-Status: GOOD (  12.92  )
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

From: Peter Gonda <pgonda@google.com>

Add a basic smoke test for SEV guests to verify that KVM can launch an
SEV guest and run a few instructions without exploding.  To verify that
SEV is indeed enabled, assert that SEV is reported as enabled in
MSR_AMD64_SEV, a.k.a. SEV_STATUS, which cannot be intercepted by KVM
(architecturally enforced).

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Vishal Annapurve <vannapurve@google.com>
Cc: Ackerly Tng <ackerleytng@google.com>
cc: Andrew Jones <andrew.jones@linux.dev>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Michael Roth <michael.roth@amd.com>
Suggested-by: Michael Roth <michael.roth@amd.com>
Signed-off-by: Peter Gonda <pgonda@google.com>
[sean: rename to "sev_smoke_test"]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile          |  1 +
 .../selftests/kvm/x86_64/sev_smoke_test.c     | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/x86_64/sev_smoke_test.c

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 169b6ee8f733..da20e6bb43ed 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -120,6 +120,7 @@ TEST_GEN_PROGS_x86_64 += x86_64/vmx_pmu_caps_test
 TEST_GEN_PROGS_x86_64 += x86_64/xen_shinfo_test
 TEST_GEN_PROGS_x86_64 += x86_64/xen_vmcall_test
 TEST_GEN_PROGS_x86_64 += x86_64/sev_migrate_tests
+TEST_GEN_PROGS_x86_64 += x86_64/sev_smoke_test
 TEST_GEN_PROGS_x86_64 += x86_64/amx_test
 TEST_GEN_PROGS_x86_64 += x86_64/max_vcpuid_cap_test
 TEST_GEN_PROGS_x86_64 += x86_64/triple_fault_event_test
diff --git a/tools/testing/selftests/kvm/x86_64/sev_smoke_test.c b/tools/testing/selftests/kvm/x86_64/sev_smoke_test.c
new file mode 100644
index 000000000000..c1534efab2be
--- /dev/null
+++ b/tools/testing/selftests/kvm/x86_64/sev_smoke_test.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+
+#include "test_util.h"
+#include "kvm_util.h"
+#include "processor.h"
+#include "svm_util.h"
+#include "linux/psp-sev.h"
+#include "sev.h"
+
+static void guest_sev_code(void)
+{
+	GUEST_ASSERT(this_cpu_has(X86_FEATURE_SEV));
+	GUEST_ASSERT(rdmsr(MSR_AMD64_SEV) & MSR_AMD64_SEV_ENABLED);
+
+	GUEST_DONE();
+}
+
+static void test_sev(void *guest_code, uint64_t policy)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	struct ucall uc;
+
+	vm = vm_sev_create_with_one_vcpu(policy, guest_code, &vcpu);
+
+	for (;;) {
+		vcpu_run(vcpu);
+
+		switch (get_ucall(vcpu, &uc)) {
+		case UCALL_SYNC:
+			continue;
+		case UCALL_DONE:
+			return;
+		case UCALL_ABORT:
+			REPORT_GUEST_ASSERT(uc);
+		default:
+			TEST_FAIL("Unexpected exit: %s",
+				  exit_reason_str(vcpu->run->exit_reason));
+		}
+	}
+
+	kvm_vm_free(vm);
+}
+
+int main(int argc, char *argv[])
+{
+	TEST_REQUIRE(is_kvm_sev_supported());
+
+	test_sev(guest_sev_code, SEV_POLICY_NO_DBG);
+	test_sev(guest_sev_code, 0);
+
+	return 0;
+}
-- 
2.43.0.594.gd9cf4e227d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
