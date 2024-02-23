Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E35C54798
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 00:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dCai9bC4C8wcmUre2j27OXNpGeNsNW3/myjlv4Lr1NY=; b=wRadOfn329CRek
	96xrKT4gt7nwgGh8WNzw4g3+MYPNpRSwXDbDLc1mG8F/+3MiWUf0o5oLK3f46y3uUt3Apw++evdv6
	GnJg9CWApJVsDvfN7ig0WqaFgGHdSaksGo4rqTDYWe/AEdFtsHJd9YGDkqKPK9OFtMGi96Qzlea1S
	s6b1Do0SslTtl73Ppl8dyeALd3cU+KpfiAW9HuT8Ag99n6LHkbEvxTvgAOT69+39/sl7SEzSV4Uks
	ZLvo9BB2Nof7SbA6TGj531Zt9cSWDnLe2B0EnV+6hkZk2l1YbK3jOsD5NXJvNEzPTgB1VZ3paaWmZ
	lYTJqoB45se+1vO8rHqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdJhX-00000007FIf-1GvY;
	Fri, 23 Feb 2024 00:46:07 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdJet-00000007Dyq-2uaI
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 00:43:26 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1dc1db2fb48so2879055ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 16:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708649001; x=1709253801; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ufdAB/OIgPR6sk1BH6tXU4Lb92iEyKpRUAsMWFh65lo=;
        b=m4geC0X49TUmAshGfUTPSxJsyPwR9hPYrexz0Vkq5LfWk11kG/wVJKMxG2xP9M29mi
         wb7MtrfHdSQeYM99bBaPc5L/h1ZhaJ5PoWcKyyb3xG2/gn4JQAwmau1N2OSLH5JTXJNq
         ntxDNpJOuKeI11hHwL5r4vb8WNHWehho34X4O/EDy2x7Gt5QQfG14wgyozNqZDvk1YMe
         8UIebCisMOgh1KupX4IhSE4MdsvfvbDDsecfrkwdPo6RrzM1FJ2Mpkx/WmEdpZ5J4vNb
         ssOgRlR46hI+HHm8PkQoHhQafgVdL7GVqRyelpwBE8BEKTDm049teb/WcWsn3u1rJ9WJ
         hA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708649001; x=1709253801;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufdAB/OIgPR6sk1BH6tXU4Lb92iEyKpRUAsMWFh65lo=;
        b=SzPSxrkT5Pcmln0CeYZfiszkPDZHsQJClRsZj6DvOb3gBoxznLZOBbMHwhiRIT/e9Z
         k2e+8s2QpAleeJcnQT1oD+xZq2etQg4OJkT/HBE9PlLtRXuU4dzNmS292AymwAcZ0ZKz
         NP3IUWJjOXwJB1dtKvJgrVwsW8otncfHz3ZFRNJtcbBASq1FC6xQGgNByxUonxSOJACs
         Va/Hyh74plb5v2EUIm6HzarqNN0E6XnMB36Tctcv9g+iEYaiuwj/xVB8jVFCWQ+1WEst
         QeGKmHVuftcIBj4KsAnc7zd5OzZVj1RwrkG5yDMYJBnrWa5yE8yfqaQSkaK6/gkZK+/R
         t24w==
X-Forwarded-Encrypted: i=1; AJvYcCWNsxDePoLEmG73DJC4l1jdTbzKr2Xyna9dKvUYt1FOVOsk/fsUMY5SsHYm719puWNFIKqCZMOJiYdcfz3xGD+dqFQSXpUROETz2agdxPPx
X-Gm-Message-State: AOJu0YwRP/k4eMZlRBAEsTx+jsB9hnT38JIMUE+D249X+3983zpAPuQF
	AWthTBTslPEl3SSTwsQlUS3iIODbvV6z3XadoXSqNnBisUMnV0JsK2FEBM7VHQGMlsq4SuPGwvg
	wtA==
X-Google-Smtp-Source: AGHT+IG8+r/xpCHDcIabTu60pIgBwVS8FUp4lQYZJVuuCn7QXyTR4BHnC5QtDdnTL8fekJtdMeUpyEN6qt8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:234c:b0:1dc:1c81:1b2a with SMTP id
 c12-20020a170903234c00b001dc1c811b2amr1699plh.1.1708649001454; Thu, 22 Feb
 2024 16:43:21 -0800 (PST)
Date: Thu, 22 Feb 2024 16:42:57 -0800
In-Reply-To: <20240223004258.3104051-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240223004258.3104051-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240223004258.3104051-11-seanjc@google.com>
Subject: [PATCH v9 10/11] KVM: selftests: Add a basic SEV smoke test
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
	Michael Roth <michael.roth@amd.com>, Carlos Bilbao <carlos.bilbao@amd.com>, 
	Peter Gonda <pgonda@google.com>, Itaru Kitayama <itaru.kitayama@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_164324_098768_D177AC30 
X-CRM114-Status: GOOD (  12.49  )
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
Tested-by: Carlos Bilbao <carlos.bilbao@amd.com>
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
index 000000000000..54d72efd9b4d
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
+	TEST_REQUIRE(kvm_cpu_has(X86_FEATURE_SEV));
+
+	test_sev(guest_sev_code, SEV_POLICY_NO_DBG);
+	test_sev(guest_sev_code, 0);
+
+	return 0;
+}
-- 
2.44.0.rc0.258.g7320e95886-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
