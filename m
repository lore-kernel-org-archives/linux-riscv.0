Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77B8C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Mar 2022 07:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fVwYg60wC4dH6yjvqXdHyBU4DWw7TDwWJLrlWrA2OlM=; b=O7pist8LhODhjj
	nf6xe16Rmo4N4SQEaDGDI341TJeUeV/XYrIdhvILXHrECWyN4Y9fPCQugLdxb1FPF5yhJMUo7RMNT
	iJLdhp/VW7UK3erFuDCWGZFkB4JW25t14rZK2ocqrUaYr9GcMyfgRadY0+QRAkEUbOxLyqcvgGfhy
	2MtziyLAWSK+zPynESrlLlhx9OIboVOBDBdEyA0fYPDqUTTSUT4N/xLHyVoBAfCAp2i/qdktNQXPC
	IivEoTUEX4909TifgUXlVTGpbx4Qdu94crSvpbK5mYVaiOIHeoNUdb0P2MW+HOZZ9MB4KbZgd90jD
	umnWgC6yz5n5jBancINw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ6IU-00BKGi-FS; Tue, 29 Mar 2022 07:29:46 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ6IQ-00BKDp-PI
 for linux-riscv@lists.infradead.org; Tue, 29 Mar 2022 07:29:44 +0000
Received: by mail-pj1-x1033.google.com with SMTP id gb19so16577265pjb.1
 for <linux-riscv@lists.infradead.org>; Tue, 29 Mar 2022 00:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6rXr5EFnwcPfvG4wwHcp5gBTd13vVk723LJlXrxEIl0=;
 b=JUEfuj4EGIOyLkV/IXA9H+MaweDOMgrZPy7qZw8Pyng5lrFo1g12sEgAvyyDoeI+/Z
 YPk2gGUnDX7efP5RkgRPk4mRgN8A2gGZmlzNHpPC9HvA2qQU9wBS+bdi8sfIjs/DsP/w
 xSUYVR13TsKBRnGeCYKcLnwTjvV48fHV5QJ2MB0uRDjihOxUpVGbWsPNpSJkZPwie9pO
 j41Itpr2BFG30RoEPPqklTH4OzYeRSKIMIrDTeaSALBCOyv8omF7HVz6pZOdi8H157h0
 qA2PW3g5DT19eO2KsOy7Dh0jldHhgbiK/7Oq0zHx0pAh1DUrUhFFRjOB4Y4XYBt2n5Ms
 /f0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6rXr5EFnwcPfvG4wwHcp5gBTd13vVk723LJlXrxEIl0=;
 b=x7zvDEtLHRHYQSkcZSwQ7u0+RhSJJvDR3vbtCWYV0BBTDQHIXAsXY52ptOqRzEZcdf
 CamEwWR5CnCQNa6LMPNsVuch9CPg2skelLITsm+2KXEjfeO6UahZKvjDowegHFd96YHP
 zoet0EaW639TQ90oXIatDeEP9DeQ6Vc7bJoCZFei7gUHowntExzhUdbUh5Nr4+dfnmI3
 9Z7VuJ4Oqzs1uvFjbjX3rXkOExWx4C4ziaMJ50Fm+wsZ4GBfdVR6GQ95HqE26GHH4Zvl
 cvaIepEZCFhgnA7B/44M0iSJy864Rzy7giiSwtKlrLTJ+IvjkwHjV5xcVVPmsSkpuNcN
 IDYw==
X-Gm-Message-State: AOAM530ErDqXlAa8VV7Cnhhq/QlFkbw/7AdvZk4g3qpZgkcQRRifsaXY
 jlojVOc/iRrc08zy4IUTZzSY7Q==
X-Google-Smtp-Source: ABdhPJyQsJ0ZlUOLuEkiaRQqfOzbwaJd1hT2x05o7Ql9dQ+kWwo1Qx58V2AZp5og6pJtenzmq+sD/A==
X-Received: by 2002:a17:902:9a98:b0:155:f634:5f37 with SMTP id
 w24-20020a1709029a9800b00155f6345f37mr14193551plp.86.1648538982243; 
 Tue, 29 Mar 2022 00:29:42 -0700 (PDT)
Received: from localhost.localdomain ([122.171.166.231])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a056a00240600b004e17ab23340sm19440564pfh.177.2022.03.29.00.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 00:29:41 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 3/3] KVM: selftests: riscv: Improve unexpected guest trap
 handling
Date: Tue, 29 Mar 2022 12:59:11 +0530
Message-Id: <20220329072911.1692766-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220329072911.1692766-1-apatel@ventanamicro.com>
References: <20220329072911.1692766-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_002942_874830_D3A478E0 
X-CRM114-Status: GOOD (  12.85  )
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

Currently, we simply hang using "while (1) ;" upon any unexpected
guest traps because the default guest trap handler is guest_hang().

The above approach is not useful to anyone because KVM selftests
users will only see a hung application upon any unexpected guest
trap.

This patch improves unexpected guest trap handling for KVM RISC-V
selftests by doing the following:
1) Return to host user-space
2) Dump VCPU registers
3) Die using TEST_ASSERT(0, ...)

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../selftests/kvm/include/riscv/processor.h   |  8 +++--
 .../selftests/kvm/lib/riscv/processor.c       |  9 +++---
 tools/testing/selftests/kvm/lib/riscv/ucall.c | 31 +++++++++++++------
 3 files changed, 31 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index eca5c622efd2..4fcfd1c0389d 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -119,10 +119,12 @@ static inline void set_reg(struct kvm_vm *vm, uint32_t vcpuid, uint64_t id,
 #define SATP_ASID_SHIFT				44
 #define SATP_ASID_MASK				_AC(0xFFFF, UL)
 
-#define SBI_EXT_EXPERIMENTAL_START	0x08000000
-#define SBI_EXT_EXPERIMENTAL_END	0x08FFFFFF
+#define SBI_EXT_EXPERIMENTAL_START		0x08000000
+#define SBI_EXT_EXPERIMENTAL_END		0x08FFFFFF
 
-#define KVM_RISCV_SELFTESTS_SBI_EXT	SBI_EXT_EXPERIMENTAL_END
+#define KVM_RISCV_SELFTESTS_SBI_EXT		SBI_EXT_EXPERIMENTAL_END
+#define KVM_RISCV_SELFTESTS_SBI_UCALL		0
+#define KVM_RISCV_SELFTESTS_SBI_UNEXP		1
 
 struct sbiret {
 	long error;
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index 3961487a4870..56e4705f7744 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -268,10 +268,11 @@ void vcpu_dump(FILE *stream, struct kvm_vm *vm, uint32_t vcpuid, uint8_t indent)
 		core.regs.t3, core.regs.t4, core.regs.t5, core.regs.t6);
 }
 
-static void __aligned(16) guest_hang(void)
+static void __aligned(16) guest_unexp_trap(void)
 {
-	while (1)
-		;
+	sbi_ecall(KVM_RISCV_SELFTESTS_SBI_EXT,
+		  KVM_RISCV_SELFTESTS_SBI_UNEXP,
+		  0, 0, 0, 0, 0, 0);
 }
 
 void vm_vcpu_add_default(struct kvm_vm *vm, uint32_t vcpuid, void *guest_code)
@@ -310,7 +311,7 @@ void vm_vcpu_add_default(struct kvm_vm *vm, uint32_t vcpuid, void *guest_code)
 
 	/* Setup default exception vector of guest */
 	set_reg(vm, vcpuid, RISCV_CSR_REG(stvec),
-		(unsigned long)guest_hang);
+		(unsigned long)guest_unexp_trap);
 }
 
 void vcpu_args_set(struct kvm_vm *vm, uint32_t vcpuid, unsigned int num, ...)
diff --git a/tools/testing/selftests/kvm/lib/riscv/ucall.c b/tools/testing/selftests/kvm/lib/riscv/ucall.c
index 9e42d8248fa6..8550f424d093 100644
--- a/tools/testing/selftests/kvm/lib/riscv/ucall.c
+++ b/tools/testing/selftests/kvm/lib/riscv/ucall.c
@@ -60,8 +60,9 @@ void ucall(uint64_t cmd, int nargs, ...)
 		uc.args[i] = va_arg(va, uint64_t);
 	va_end(va);
 
-	sbi_ecall(KVM_RISCV_SELFTESTS_SBI_EXT, 0, (vm_vaddr_t)&uc,
-		  0, 0, 0, 0, 0);
+	sbi_ecall(KVM_RISCV_SELFTESTS_SBI_EXT,
+		  KVM_RISCV_SELFTESTS_SBI_UCALL,
+		  (vm_vaddr_t)&uc, 0, 0, 0, 0, 0);
 }
 
 uint64_t get_ucall(struct kvm_vm *vm, uint32_t vcpu_id, struct ucall *uc)
@@ -73,14 +74,24 @@ uint64_t get_ucall(struct kvm_vm *vm, uint32_t vcpu_id, struct ucall *uc)
 		memset(uc, 0, sizeof(*uc));
 
 	if (run->exit_reason == KVM_EXIT_RISCV_SBI &&
-	    run->riscv_sbi.extension_id == KVM_RISCV_SELFTESTS_SBI_EXT &&
-	    run->riscv_sbi.function_id == 0) {
-		memcpy(&ucall, addr_gva2hva(vm, run->riscv_sbi.args[0]),
-			sizeof(ucall));
-
-		vcpu_run_complete_io(vm, vcpu_id);
-		if (uc)
-			memcpy(uc, &ucall, sizeof(ucall));
+	    run->riscv_sbi.extension_id == KVM_RISCV_SELFTESTS_SBI_EXT) {
+		switch (run->riscv_sbi.function_id) {
+		case KVM_RISCV_SELFTESTS_SBI_UCALL:
+			memcpy(&ucall, addr_gva2hva(vm,
+			       run->riscv_sbi.args[0]), sizeof(ucall));
+
+			vcpu_run_complete_io(vm, vcpu_id);
+			if (uc)
+				memcpy(uc, &ucall, sizeof(ucall));
+
+			break;
+		case KVM_RISCV_SELFTESTS_SBI_UNEXP:
+			vcpu_dump(stderr, vm, vcpu_id, 2);
+			TEST_ASSERT(0, "Unexpected trap taken by guest");
+			break;
+		default:
+			break;
+		}
 	}
 
 	return ucall.cmd;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
