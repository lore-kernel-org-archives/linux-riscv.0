Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6694CC47DD9
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 00:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RUAyed5Tj4bGx77/wQDo5sMJ5mkmGm67PtqO/7C7ACQ=; b=yFh0RSsc5gdwSe
	VLvBMIYBe7rX2JxzM8YiyNRgEegTkV4dQG2l5AyJPYN66gXa8ruAvrHpJwtOwrHFFXQQhzknUJ90o
	KtNKkibMnKf+daq9vh43l5Bfds2c1ZoiqpMYXplkZh3qvDG4RjgONfpVhLflOff72IWvdegIY/UOC
	nMptCVt7hjS00ClmHQbzQBPzO3BhnByg+zDzZ+p7Bb+mwBrzoT1BEBIoiACuml/IrDWuE5Lvh6LPm
	nJrWOnJxsUEw5FwkYhTCB5clWtRxGBD0hKuHUKHc8yrwuVz76I9posHVrxEOHSf274hA276CjPWOo
	/HSbMCiliLidXpliB+DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdJia-00000007Fnm-2v5p;
	Fri, 23 Feb 2024 00:47:12 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdJew-00000007E0W-1T4S
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 00:43:29 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-6e4686ed5d5so183565b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 16:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708649003; x=1709253803; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Gc43wBFyEWO0ZO0dpPNQ+d7W+GksBMsxe3wuyqOBBYI=;
        b=KHnWjbOH97BipXVTsnvxUta2npIsvt5m+jbz5/ulrtQ1vbgFDBewQafCaWvJWxQ7IR
         sCMac6ttfhbWI1xrNr3WttHqD6p670i8JqBkp5HFTyDfTR9TD9fXvweb1NXWaLwXTyb6
         uoWtA199CHlf4k4RCjVI7RpLEnsg9QD7l6YmSQSauop2Y7D600QXQO5bL88YOTbCPUJ0
         k4DncfboXHiVgi/BzLdiEEgpxch0Bpb2rX/+0pn7sqBn5MVb1Y5VwEj4o1wkq1JOowz9
         +lulVHuYgwT6L8htrWLKn6+EPD9qzm2533qW5PVJQ2zGQZpfRY0tJuNhe75CH799JIi8
         YsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708649003; x=1709253803;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gc43wBFyEWO0ZO0dpPNQ+d7W+GksBMsxe3wuyqOBBYI=;
        b=NUDg/h0+KLgQVeD4OMECio3EUoOWhJ1OYYyltkZWyS2fYh11hDibC10JxYuph1zQxZ
         aqrjslU6Q2+WWPGrlip2FcZFqt9cqggdqP3IMzcAZZkGgB61b1DCPet82N/ronDGEQ1o
         MD9k4WkJFirU5ICV/1OX8BA7S52RU0Y2hTbOC237hPoR/2Uhq2UghcoFAavVgbV16kEb
         3cKGwgCSG8naWEXnCf6fwOQ/O01kswmo80k4LioUhBk/TmW1buaxC0NSbHbgWLSAhtVB
         KWGpFo6oKpl8UGz4YSXu0Kk554m6p0SYIOtBpRlhLJxkZ+T4nRDD2UTtsiXMZTche4Ym
         +uaw==
X-Forwarded-Encrypted: i=1; AJvYcCUlEiqYi0UIMEVT7UnjyL7OSwLnPBtKsRoYXozgMPKD03l318HwVSgUvqyq9O8g3eqV6MF3Zp+Wew2+HO10wmZiSmX293ILmLnORUaw796/
X-Gm-Message-State: AOJu0Yy6QPqNakAEjFzPTApYPsH80MoM+YyckuV2MbL/Hm4C8NS3f8wl
	1sZfKrdCYetFhAVNY9EihgVP7dNHB9q2PjttyeYyQJMZWQq/BQkvHNNGqTxO/qOBAlRkJgLeHT1
	4Qw==
X-Google-Smtp-Source: AGHT+IH8J8hOUDN/iwRypevdW7KRyW+a1uJn7645jMv/ZgZVJ0iWo7rJ7snpuFhqmTRKnqRT0U6drKpAx6Q=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:188b:b0:6e4:8b79:f5be with SMTP id
 x11-20020a056a00188b00b006e48b79f5bemr32117pfh.3.1708649003443; Thu, 22 Feb
 2024 16:43:23 -0800 (PST)
Date: Thu, 22 Feb 2024 16:42:58 -0800
In-Reply-To: <20240223004258.3104051-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240223004258.3104051-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240223004258.3104051-12-seanjc@google.com>
Subject: [PATCH v9 11/11] KVM: selftests: Add a basic SEV-ES smoke test
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
X-CRM114-CacheID: sfid-20240222_164326_610416_6E9CC8BF 
X-CRM114-Status: GOOD (  14.87  )
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

Extend sev_smoke_test to also run a minimal SEV-ES smoke test so that it's
possible to test KVM's unique VMRUN=>#VMEXIT path for SEV-ES guests
without needing a full blown SEV-ES capable VM, which requires a rather
absurd amount of properly configured collateral.

Punt on proper GHCB and ucall support, and instead use the GHCB MSR
protocol to signal test completion.  The most important thing at this
point is to have _any_ kind of testing of KVM's __svm_sev_es_vcpu_run().

Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Michael Roth <michael.roth@amd.com>
Cc: Peter Gonda <pgonda@google.com>
Cc: Carlos Bilbao <carlos.bilbao@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/x86_64/sev.h        |  2 ++
 .../selftests/kvm/lib/x86_64/processor.c      |  2 +-
 tools/testing/selftests/kvm/lib/x86_64/sev.c  |  6 +++-
 .../selftests/kvm/x86_64/sev_smoke_test.c     | 30 +++++++++++++++++++
 4 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86_64/sev.h b/tools/testing/selftests/kvm/include/x86_64/sev.h
index de5283bef752..8a1bf88474c9 100644
--- a/tools/testing/selftests/kvm/include/x86_64/sev.h
+++ b/tools/testing/selftests/kvm/include/x86_64/sev.h
@@ -25,6 +25,8 @@ enum sev_guest_state {
 #define SEV_POLICY_NO_DBG	(1UL << 0)
 #define SEV_POLICY_ES		(1UL << 2)
 
+#define GHCB_MSR_TERM_REQ	0x100
+
 void sev_vm_launch(struct kvm_vm *vm, uint32_t policy);
 void sev_vm_launch_measure(struct kvm_vm *vm, uint8_t *measurement);
 void sev_vm_launch_finish(struct kvm_vm *vm);
diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index aa92220bf5da..a33289a5b89a 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -1074,7 +1074,7 @@ void kvm_get_cpu_address_width(unsigned int *pa_bits, unsigned int *va_bits)
 
 void kvm_init_vm_address_properties(struct kvm_vm *vm)
 {
-	if (vm->subtype == VM_SUBTYPE_SEV) {
+	if (vm->subtype == VM_SUBTYPE_SEV || vm->subtype == VM_SUBTYPE_SEV_ES) {
 		vm->arch.c_bit = BIT_ULL(this_cpu_property(X86_PROPERTY_SEV_C_BIT));
 		vm->gpa_tag_mask = vm->arch.c_bit;
 	}
diff --git a/tools/testing/selftests/kvm/lib/x86_64/sev.c b/tools/testing/selftests/kvm/lib/x86_64/sev.c
index 9f5a3dbb5e65..e248d3364b9c 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/sev.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/sev.c
@@ -53,6 +53,9 @@ void sev_vm_launch(struct kvm_vm *vm, uint32_t policy)
 	hash_for_each(vm->regions.slot_hash, ctr, region, slot_node)
 		encrypt_region(vm, region);
 
+	if (policy & SEV_POLICY_ES)
+		vm_sev_ioctl(vm, KVM_SEV_LAUNCH_UPDATE_VMSA, NULL);
+
 	vm->arch.is_pt_protected = true;
 }
 
@@ -90,7 +93,8 @@ struct kvm_vm *vm_sev_create_with_one_vcpu(uint32_t policy, void *guest_code,
 	struct vm_shape shape = {
 		.type = VM_TYPE_DEFAULT,
 		.mode = VM_MODE_DEFAULT,
-		.subtype = VM_SUBTYPE_SEV,
+		.subtype = policy & SEV_POLICY_ES ? VM_SUBTYPE_SEV_ES :
+						    VM_SUBTYPE_SEV,
 	};
 	struct kvm_vm *vm;
 	struct kvm_vcpu *cpus[1];
diff --git a/tools/testing/selftests/kvm/x86_64/sev_smoke_test.c b/tools/testing/selftests/kvm/x86_64/sev_smoke_test.c
index 54d72efd9b4d..026779f3ed06 100644
--- a/tools/testing/selftests/kvm/x86_64/sev_smoke_test.c
+++ b/tools/testing/selftests/kvm/x86_64/sev_smoke_test.c
@@ -12,6 +12,21 @@
 #include "linux/psp-sev.h"
 #include "sev.h"
 
+
+static void guest_sev_es_code(void)
+{
+	/* TODO: Check CPUID after GHCB-based hypercall support is added. */
+	GUEST_ASSERT(rdmsr(MSR_AMD64_SEV) & MSR_AMD64_SEV_ENABLED);
+	GUEST_ASSERT(rdmsr(MSR_AMD64_SEV) & MSR_AMD64_SEV_ES_ENABLED);
+
+	/*
+	 * TODO: Add GHCB and ucall support for SEV-ES guests.  For now, simply
+	 * force "termination" to signal "done" via the GHCB MSR protocol.
+	 */
+	wrmsr(MSR_AMD64_SEV_ES_GHCB, GHCB_MSR_TERM_REQ);
+	__asm__ __volatile__("rep; vmmcall");
+}
+
 static void guest_sev_code(void)
 {
 	GUEST_ASSERT(this_cpu_has(X86_FEATURE_SEV));
@@ -31,6 +46,16 @@ static void test_sev(void *guest_code, uint64_t policy)
 	for (;;) {
 		vcpu_run(vcpu);
 
+		if (policy & SEV_POLICY_ES) {
+			TEST_ASSERT(vcpu->run->exit_reason == KVM_EXIT_SYSTEM_EVENT,
+				    "Wanted SYSTEM_EVENT, got %s",
+				    exit_reason_str(vcpu->run->exit_reason));
+			TEST_ASSERT_EQ(vcpu->run->system_event.type, KVM_SYSTEM_EVENT_SEV_TERM);
+			TEST_ASSERT_EQ(vcpu->run->system_event.ndata, 1);
+			TEST_ASSERT_EQ(vcpu->run->system_event.data[0], GHCB_MSR_TERM_REQ);
+			break;
+		}
+
 		switch (get_ucall(vcpu, &uc)) {
 		case UCALL_SYNC:
 			continue;
@@ -54,5 +79,10 @@ int main(int argc, char *argv[])
 	test_sev(guest_sev_code, SEV_POLICY_NO_DBG);
 	test_sev(guest_sev_code, 0);
 
+	if (kvm_cpu_has(X86_FEATURE_SEV_ES)) {
+		test_sev(guest_sev_es_code, SEV_POLICY_ES | SEV_POLICY_NO_DBG);
+		test_sev(guest_sev_es_code, SEV_POLICY_ES);
+	}
+
 	return 0;
 }
-- 
2.44.0.rc0.258.g7320e95886-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
