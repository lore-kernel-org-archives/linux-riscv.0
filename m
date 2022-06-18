Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B2EC43334
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jun 2022 00:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ff5owDVuklAozXJePslmBc3M3ZnrE0sqRa8t1YRlmgE=; b=olk4SOIW5P/+NX
	Cvpmgr5kKaQ/E/CVU4gbsixgZkXovbzaZMDoCXvMkBEyLaYCRZcMoLf25b22GaBHNgwWSX28jlSx6
	qMrg3CjiW2qwZZ4yssPJzb5rlkWY5qtjdDlZlWF7Ff3uu1jTdjLKsYWf/DdoDfHW7VYIJ6Qnv6GWh
	j6CImx04DVMWPkt8u0Hxzy21Ire0/rBUExx/5KV/Q4be6fJ+zZqbQsLSX+uCxDI2CWWNS4DEuNoXp
	kPOse/miQ0TPEcZi4LrPSPoJATFPcEifqGGiVl/U/U9V9e7wqdyXamJaSURKoH5oginLCNILvNjRn
	luWe3gIs0c1zdg+cBcbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2M99-009kIS-SB; Sat, 18 Jun 2022 00:17:03 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2M8Y-009k11-Kc
	for linux-riscv@lists.infradead.org; Sat, 18 Jun 2022 00:16:29 +0000
Received: by mail-yb1-xb49.google.com with SMTP id n124-20020a25d682000000b00668ca3ee0edso1508973ybg.21
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jun 2022 17:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=gW22gs8afkvNNOw8jMwW6NEDJCCvGve0dMVsklM6MqE=;
        b=CCT2+SoDeEAmkD9AbYTlkGc/M0qQ9guL15Cmz/EsdZDhodAfjxXYZA/J18LtQD+pQG
         oykDa/rvQjYTaF0Mzx4hxTbNDxJwRaqhzgAIaaLyZHOGezq3b/mVSqY+yhpKBPttRWLy
         0DSl+tHQwejzurx9ONqDdy6SN8hbJs4K34prKqf7PQRP4FPjPpLwlHiYc5WyPr+dRh8j
         655OSo7A9inWzoIeW6J9cFw8lUT4R2f96ngcNfVPWc7/w0HETIvtTNX5/Mw7w5KnrIyQ
         NLXmnBQiozl0nS941IOOorKTZoBXiINlR3QzIZS4tsvyebV1PelU8UJIgVb757MoIjOB
         HHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=gW22gs8afkvNNOw8jMwW6NEDJCCvGve0dMVsklM6MqE=;
        b=tMCCXC5B29qVStTjKEMXiU/1fpjhMRVI5JBzLIkwp6mEqYiMdHdo9EO+uF3gRJvjzs
         cax6KC/47Z1F/TAJ6LXoG30KMC/zFBJ6uVgIuLS3fy6q+CNM2CANlEcCC8KX5NoYEIps
         KbXycxlhLgjSSftHfHbAOs17PjRKYyvBAuw0yHdL7SKj8FfgQgRJoJFVYBBHvXaMjPkH
         P2g6qVVgOCjPzED3lgjlc4/wY7wIae4qaicdVSNqXJGZBgPFtq8ljDWv4ImjP0GdWPv4
         u7WGK9v4bAcABplntmR1kfjPcxVbCDUP8yyhsASQ/2vUMnXSoz7xTDyIy0+ECDt+W1e3
         yQ8w==
X-Gm-Message-State: AJIora8E+7c7qeQl7DPcQA4d96sJJXOz+3/lZlDaUNZcLq6sbQP1Y1YD
	3svnpACQm29lMh4YCyz3vg40J7sr/QM=
X-Google-Smtp-Source: AGRyM1sCiHDm22+N+g86ktaptvosqpIpBza959Yy0j0jUmemEFFjbJDgy3C9aHvkL0tqnrBGBsB7eOgKFEE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:9187:0:b0:317:76c5:3b44 with SMTP id
 i129-20020a819187000000b0031776c53b44mr10212452ywg.103.1655511385084; Fri, 17
 Jun 2022 17:16:25 -0700 (PDT)
Date: Sat, 18 Jun 2022 00:16:17 +0000
In-Reply-To: <20220618001618.1840806-1-seanjc@google.com>
Message-Id: <20220618001618.1840806-3-seanjc@google.com>
Mime-Version: 1.0
References: <20220618001618.1840806-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
Subject: [PATCH 2/3] KVM: selftests: Consolidate boilerplate code in get_ucall()
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra <atishp@atishpatra.org>, 
	David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>, 
	Andrew Jones <drjones@redhat.com>, Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_171626_782718_37B62C05 
X-CRM114-Status: GOOD (  14.42  )
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

Consolidate the actual copying of a ucall struct from guest=>host into
the common get_ucall().  Return a host virtual address instead of a guest
virtual address even though the addr_gva2hva() part could be moved to
get_ucall() too.  Conceptually, get_ucall() is invoked from the host and
should return a host virtual address (and returning NULL for "nothing to
see here" is far superior to returning 0).

Use pointer shenanigans instead of an unnecessary bounce buffer when the
caller of get_ucall() provides a valid pointer.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/ucall_common.h      |  8 ++------
 .../testing/selftests/kvm/lib/aarch64/ucall.c | 15 +++------------
 tools/testing/selftests/kvm/lib/riscv/ucall.c | 19 +++----------------
 tools/testing/selftests/kvm/lib/s390x/ucall.c | 16 +++-------------
 .../testing/selftests/kvm/lib/ucall_common.c  | 19 +++++++++++++++++++
 .../testing/selftests/kvm/lib/x86_64/ucall.c  | 16 +++-------------
 6 files changed, 33 insertions(+), 60 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/ucall_common.h b/tools/testing/selftests/kvm/include/ucall_common.h
index c6a4fd7fe443..cb9b37282701 100644
--- a/tools/testing/selftests/kvm/include/ucall_common.h
+++ b/tools/testing/selftests/kvm/include/ucall_common.h
@@ -26,9 +26,10 @@ struct ucall {
 void ucall_arch_init(struct kvm_vm *vm, void *arg);
 void ucall_arch_uninit(struct kvm_vm *vm);
 void ucall_arch_do_ucall(vm_vaddr_t uc);
-uint64_t ucall_arch_get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc);
+void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu);
 
 void ucall(uint64_t cmd, int nargs, ...);
+uint64_t get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc);
 
 static inline void ucall_init(struct kvm_vm *vm, void *arg)
 {
@@ -40,11 +41,6 @@ static inline void ucall_uninit(struct kvm_vm *vm)
 	ucall_arch_uninit(vm);
 }
 
-static inline uint64_t get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
-{
-	return ucall_arch_get_ucall(vcpu, uc);
-}
-
 #define GUEST_SYNC_ARGS(stage, arg1, arg2, arg3, arg4)	\
 				ucall(UCALL_SYNC, 6, "hello", stage, arg1, arg2, arg3, arg4)
 #define GUEST_SYNC(stage)	ucall(UCALL_SYNC, 2, "hello", stage)
diff --git a/tools/testing/selftests/kvm/lib/aarch64/ucall.c b/tools/testing/selftests/kvm/lib/aarch64/ucall.c
index 2de9fdd34159..9c124adbb560 100644
--- a/tools/testing/selftests/kvm/lib/aarch64/ucall.c
+++ b/tools/testing/selftests/kvm/lib/aarch64/ucall.c
@@ -75,13 +75,9 @@ void ucall_arch_do_ucall(vm_vaddr_t uc)
 	*ucall_exit_mmio_addr = uc;
 }
 
-uint64_t ucall_arch_get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
+void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
 {
 	struct kvm_run *run = vcpu->run;
-	struct ucall ucall = {};
-
-	if (uc)
-		memset(uc, 0, sizeof(*uc));
 
 	if (run->exit_reason == KVM_EXIT_MMIO &&
 	    run->mmio.phys_addr == (uint64_t)ucall_exit_mmio_addr) {
@@ -90,12 +86,7 @@ uint64_t ucall_arch_get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
 		TEST_ASSERT(run->mmio.is_write && run->mmio.len == 8,
 			    "Unexpected ucall exit mmio address access");
 		memcpy(&gva, run->mmio.data, sizeof(gva));
-		memcpy(&ucall, addr_gva2hva(vcpu->vm, gva), sizeof(ucall));
-
-		vcpu_run_complete_io(vcpu);
-		if (uc)
-			memcpy(uc, &ucall, sizeof(ucall));
+		return addr_gva2hva(vcpu->vm, gva);
 	}
-
-	return ucall.cmd;
+	return NULL;
 }
diff --git a/tools/testing/selftests/kvm/lib/riscv/ucall.c b/tools/testing/selftests/kvm/lib/riscv/ucall.c
index b1598f418c1f..37e091d4366e 100644
--- a/tools/testing/selftests/kvm/lib/riscv/ucall.c
+++ b/tools/testing/selftests/kvm/lib/riscv/ucall.c
@@ -51,27 +51,15 @@ void ucall_arch_do_ucall(vm_vaddr_t uc)
 		  uc, 0, 0, 0, 0, 0);
 }
 
-uint64_t ucall_arch_get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
+void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
 {
 	struct kvm_run *run = vcpu->run;
-	struct ucall ucall = {};
-
-	if (uc)
-		memset(uc, 0, sizeof(*uc));
 
 	if (run->exit_reason == KVM_EXIT_RISCV_SBI &&
 	    run->riscv_sbi.extension_id == KVM_RISCV_SELFTESTS_SBI_EXT) {
 		switch (run->riscv_sbi.function_id) {
 		case KVM_RISCV_SELFTESTS_SBI_UCALL:
-			memcpy(&ucall,
-			       addr_gva2hva(vcpu->vm, run->riscv_sbi.args[0]),
-			       sizeof(ucall));
-
-			vcpu_run_complete_io(vcpu);
-			if (uc)
-				memcpy(uc, &ucall, sizeof(ucall));
-
-			break;
+			return addr_gva2hva(vcpu->vm, run->riscv_sbi.args[0]);
 		case KVM_RISCV_SELFTESTS_SBI_UNEXP:
 			vcpu_dump(stderr, vcpu, 2);
 			TEST_ASSERT(0, "Unexpected trap taken by guest");
@@ -80,6 +68,5 @@ uint64_t ucall_arch_get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
 			break;
 		}
 	}
-
-	return ucall.cmd;
+	return NULL;
 }
diff --git a/tools/testing/selftests/kvm/lib/s390x/ucall.c b/tools/testing/selftests/kvm/lib/s390x/ucall.c
index 114cb4af295f..0f695a031d35 100644
--- a/tools/testing/selftests/kvm/lib/s390x/ucall.c
+++ b/tools/testing/selftests/kvm/lib/s390x/ucall.c
@@ -20,13 +20,9 @@ void ucall_arch_do_ucall(vm_vaddr_t uc)
 	asm volatile ("diag 0,%0,0x501" : : "a"(uc) : "memory");
 }
 
-uint64_t ucall_arch_get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
+void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
 {
 	struct kvm_run *run = vcpu->run;
-	struct ucall ucall = {};
-
-	if (uc)
-		memset(uc, 0, sizeof(*uc));
 
 	if (run->exit_reason == KVM_EXIT_S390_SIEIC &&
 	    run->s390_sieic.icptcode == 4 &&
@@ -34,13 +30,7 @@ uint64_t ucall_arch_get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
 	    (run->s390_sieic.ipb >> 16) == 0x501) {
 		int reg = run->s390_sieic.ipa & 0xf;
 
-		memcpy(&ucall, addr_gva2hva(vcpu->vm, run->s.regs.gprs[reg]),
-		       sizeof(ucall));
-
-		vcpu_run_complete_io(vcpu);
-		if (uc)
-			memcpy(uc, &ucall, sizeof(ucall));
+		return addr_gva2hva(vcpu->vm, run->s.regs.gprs[reg]);
 	}
-
-	return ucall.cmd;
+	return NULL;
 }
diff --git a/tools/testing/selftests/kvm/lib/ucall_common.c b/tools/testing/selftests/kvm/lib/ucall_common.c
index 749ffdf23855..c488ed23d0dd 100644
--- a/tools/testing/selftests/kvm/lib/ucall_common.c
+++ b/tools/testing/selftests/kvm/lib/ucall_common.c
@@ -18,3 +18,22 @@ void ucall(uint64_t cmd, int nargs, ...)
 
 	ucall_arch_do_ucall((vm_vaddr_t)&uc);
 }
+
+uint64_t get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
+{
+	struct ucall ucall;
+	void *addr;
+
+	if (!uc)
+		uc = &ucall;
+
+	addr = ucall_arch_get_ucall(vcpu);
+	if (addr) {
+		memcpy(uc, addr, sizeof(*uc));
+		vcpu_run_complete_io(vcpu);
+	} else {
+		memset(uc, 0, sizeof(*uc));
+	}
+
+	return uc->cmd;
+}
diff --git a/tools/testing/selftests/kvm/lib/x86_64/ucall.c b/tools/testing/selftests/kvm/lib/x86_64/ucall.c
index 9f532dba1003..ec53a406f689 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/ucall.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/ucall.c
@@ -22,25 +22,15 @@ void ucall_arch_do_ucall(vm_vaddr_t uc)
 		: : [port] "d" (UCALL_PIO_PORT), "D" (uc) : "rax", "memory");
 }
 
-uint64_t ucall_arch_get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
+void *ucall_arch_get_ucall(struct kvm_vcpu *vcpu)
 {
 	struct kvm_run *run = vcpu->run;
-	struct ucall ucall = {};
-
-	if (uc)
-		memset(uc, 0, sizeof(*uc));
 
 	if (run->exit_reason == KVM_EXIT_IO && run->io.port == UCALL_PIO_PORT) {
 		struct kvm_regs regs;
 
 		vcpu_regs_get(vcpu, &regs);
-		memcpy(&ucall, addr_gva2hva(vcpu->vm, (vm_vaddr_t)regs.rdi),
-		       sizeof(ucall));
-
-		vcpu_run_complete_io(vcpu);
-		if (uc)
-			memcpy(uc, &ucall, sizeof(ucall));
+		return addr_gva2hva(vcpu->vm, (vm_vaddr_t)regs.rdi);
 	}
-
-	return ucall.cmd;
+	return NULL;
 }
-- 
2.37.0.rc0.104.g0611611a94-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
