Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DA9C54E5D
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 23:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8NVXHII+UXE9o2EC3y5SzR2BTclUjJWC5GKuB+2448=; b=kzwffgmkjvs9Mo
	b+oCoqe+ZCTVGJYqn1TXEZWPO+DMsqHX7VDvlkr7JYO/OX6nNdBoqP4PISMOVyQJyvUEzZrC/NLZZ
	uWuALsaEISEmO1FSqUUsOnpe5BWROml3TAclu9vr8K11JE46+0dybWXb/UeB+hO5UOhfRP353Vrk2
	Mm1qQTH6GaVvmRs76jhWXkxCFVECdA6XlpZy1sShptX1o3geT7UkOXQNhHUdcL9IMGwo2F+AAZjmL
	1DeJXnQKLmrOCZNhfTsxgELHv9LeuELvCEP0VRsyO5ugjMJHHl09nhoy0bqnrWlzsI4dJZwIual0l
	GtS6KS33Szk6Reg3h9pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuVU-0000000G1Vx-2L3b;
	Thu, 14 Mar 2024 23:29:04 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuTO-0000000Fzzh-1YOX
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 23:27:01 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-60ccc3cfa39so21508377b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 16:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710458811; x=1711063611; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=oB3ZfcSJ5G1gMIeNmqomMwFWPYu8/DXA5zj+kntGd24=;
        b=hD0R0Hw6bKBwD4CjkcBv63qr5b+x/mxodEMAV6InvItyTd3g4LpL+HtwN3EUVFeFeJ
         UjJ4gjBqwF69fgaVYSkMVX3Jsdn9HTeh9DOLHxNV0eYueE0YgGK4W76+HJA80VA1Bwpr
         MNHQhjq8PKyDjEoGaR3jOmJzLafOqMo5KwHJOxe/o5FYsJZEHqTp70EBABMN/Ve0Ukj0
         QoAhyPGzQk7gzRyhxCsQ/rDKBBdzrjOgGCKaS9iUSDxg/XMVxcdY6S4pGZ7a2iMwOmvd
         TbFNdT5mT96VtMH6B+nlG/sbQylCRQJ3ikfDJREfBkzKvAtos5Jc28iki14/9dNnr7tD
         ZGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710458811; x=1711063611;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oB3ZfcSJ5G1gMIeNmqomMwFWPYu8/DXA5zj+kntGd24=;
        b=TWyPjVD0830TL3p0NI+2qNsuevCfcIoB1qacRUUoXxL06bRE+5IGtWuEWz9ACvzNEI
         nNZD5hU1noz8wQGNJPV/lTr5lDySLurrCUS5aiyAYMalCQT/pmKbpEeORDJYhPmGH1Ma
         UKS/4utCpFLYUxtjXO42q7cNCNne2ClY0oVEvzZohgXquQ1+E98ToYYqTR7/S11Sth0r
         T6o6BZyDoYMtJrzixaTyabYilSuPxhbbn03XmJt+PXy/fjsBO6rPLpJIiAFU8Ww4IOPY
         UHNmt06RZogVYPB1G72DYh3G2nwU/Z2DpkZiTaYFwvxc8C8rJrf2IQy/2vZ+VCNM5sHD
         EU6w==
X-Forwarded-Encrypted: i=1; AJvYcCWR0olDXTVHkAyWpbnq8tI9ZEuE57fcbw/+CACbVpXIRKLexPHyVMCQ65llnBnsLi22I7hw9y/vTjljpuww59UCJTg9cm6j0iMn9PCNa3VR
X-Gm-Message-State: AOJu0YxezbXC+7meWpSNtDI7mp1zW2Y+LaPNV7IalzvKMdW1ebAp4MTa
	0EW7vVBzpB6XPFbiETjfvs+ZJvwIvKmO4t9vrZ/KCnRIAUFgIyGlH9rWT1wMgymnnslHCy7eUvs
	D8w==
X-Google-Smtp-Source: AGHT+IHtBiTnO989+qzsWd/+jqel2tzrmASDdXlpQSt9dAnbWaw8Q3AQpPaqLMF1m7pFqRCnpY9R0RVtBJU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a0d:e288:0:b0:60a:56c2:a61f with SMTP id
 l130-20020a0de288000000b0060a56c2a61fmr797989ywe.8.1710458810918; Thu, 14 Mar
 2024 16:26:50 -0700 (PDT)
Date: Thu, 14 Mar 2024 16:26:25 -0700
In-Reply-To: <20240314232637.2538648-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240314232637.2538648-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Message-ID: <20240314232637.2538648-7-seanjc@google.com>
Subject: [PATCH 06/18] KVM: selftests: Rework platform_info_test to actually
 verify #GP
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ackerley Tng <ackerleytng@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_162654_767201_D3C53129 
X-CRM114-Status: GOOD (  10.15  )
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

Rework platform_info_test to actually handle and verify the expected #GP
on RDMSR when the associated KVM capability is disabled.  Currently, the
test _deliberately_ doesn't handle the #GP, and instead lets it escalated
to a triple fault shutdown.

In addition to verifying that KVM generates the correct fault, handling
the #GP will be necessary (without even more shenanigans) when a future
change to the core KVM selftests library configures the IDT and exception
handlers by default (the test subtly relies on the IDT limit being '0').

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/x86_64/platform_info_test.c | 66 +++++++++----------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86_64/platform_info_test.c b/tools/testing/selftests/kvm/x86_64/platform_info_test.c
index cdad7e2124c8..6300bb70f028 100644
--- a/tools/testing/selftests/kvm/x86_64/platform_info_test.c
+++ b/tools/testing/selftests/kvm/x86_64/platform_info_test.c
@@ -26,40 +26,18 @@
 static void guest_code(void)
 {
 	uint64_t msr_platform_info;
+	uint8_t vector;
 
-	for (;;) {
-		msr_platform_info = rdmsr(MSR_PLATFORM_INFO);
-		GUEST_ASSERT_EQ(msr_platform_info & MSR_PLATFORM_INFO_MAX_TURBO_RATIO,
-				MSR_PLATFORM_INFO_MAX_TURBO_RATIO);
-		GUEST_SYNC(0);
-		asm volatile ("inc %r11");
-	}
-}
+	GUEST_SYNC(true);
+	msr_platform_info = rdmsr(MSR_PLATFORM_INFO);
+	GUEST_ASSERT_EQ(msr_platform_info & MSR_PLATFORM_INFO_MAX_TURBO_RATIO,
+			MSR_PLATFORM_INFO_MAX_TURBO_RATIO);
 
-static void test_msr_platform_info_enabled(struct kvm_vcpu *vcpu)
-{
-	struct ucall uc;
+	GUEST_SYNC(false);
+	vector = rdmsr_safe(MSR_PLATFORM_INFO, &msr_platform_info);
+	GUEST_ASSERT_EQ(vector, GP_VECTOR);
 
-	vm_enable_cap(vcpu->vm, KVM_CAP_MSR_PLATFORM_INFO, true);
-	vcpu_run(vcpu);
-	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
-
-	switch (get_ucall(vcpu, &uc)) {
-	case UCALL_SYNC:
-		break;
-	case UCALL_ABORT:
-		REPORT_GUEST_ASSERT(uc);
-	default:
-		TEST_FAIL("Unexpected ucall %lu", uc.cmd);
-		break;
-	}
-}
-
-static void test_msr_platform_info_disabled(struct kvm_vcpu *vcpu)
-{
-	vm_enable_cap(vcpu->vm, KVM_CAP_MSR_PLATFORM_INFO, false);
-	vcpu_run(vcpu);
-	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_SHUTDOWN);
+	GUEST_DONE();
 }
 
 int main(int argc, char *argv[])
@@ -67,16 +45,38 @@ int main(int argc, char *argv[])
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
 	uint64_t msr_platform_info;
+	struct ucall uc;
 
 	TEST_REQUIRE(kvm_has_cap(KVM_CAP_MSR_PLATFORM_INFO));
 
 	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
 
+	vm_init_descriptor_tables(vm);
+	vcpu_init_descriptor_tables(vcpu);
+
 	msr_platform_info = vcpu_get_msr(vcpu, MSR_PLATFORM_INFO);
 	vcpu_set_msr(vcpu, MSR_PLATFORM_INFO,
 		     msr_platform_info | MSR_PLATFORM_INFO_MAX_TURBO_RATIO);
-	test_msr_platform_info_enabled(vcpu);
-	test_msr_platform_info_disabled(vcpu);
+
+	for (;;) {
+		vcpu_run(vcpu);
+		TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
+
+		switch (get_ucall(vcpu, &uc)) {
+		case UCALL_SYNC:
+			vm_enable_cap(vm, KVM_CAP_MSR_PLATFORM_INFO, uc.args[1]);
+			break;
+		case UCALL_DONE:
+			goto done;
+		case UCALL_ABORT:
+			REPORT_GUEST_ASSERT(uc);
+		default:
+			TEST_FAIL("Unexpected ucall %lu", uc.cmd);
+			break;
+		}
+	}
+
+done:
 	vcpu_set_msr(vcpu, MSR_PLATFORM_INFO, msr_platform_info);
 
 	kvm_vm_free(vm);
-- 
2.44.0.291.gc1ea87d7ee-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
