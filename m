Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF25CC43602
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 03:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79F3BnfS4TQuzrls+Oh/7tni19vtJZEjAssy+Q7ILfo=; b=aoV7oKnKDy61xI
	ejRJL6RK6nfC9zyNNzwPZek0NqEnOQJd7+Tup8Gjamf/xyJKDBfgbDkqZh6mvSAZ+YHv7jebpfByi
	4weVIJihiD96GOf2pS2fXCXeTtvx6On+yxn7VDfQ7S2uCPvnbkezTHLD8+g0CEVhKpA+qSJvOoUnE
	8n6qcaCeo/X7nYJWo9FRDMihwJFcGMYbIHt/V1CyXC9Xk+JaqkkcrzbCtjiWxh7b4PDuhiQfn5ME6
	1c+EKZSaXwWV4yHLv0JD4K3QZSNKBgCueKJKGK9wjx1myxXlmsap/pxILe16fxcRehriRBIwaIsNZ
	G0SVDTES5YmGJQGI/VGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ61-0000000GGRn-1WJE;
	Wed, 08 Jul 2026 03:37:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5c-0000000GFxX-1GzT
	for linux-riscv@bombadil.infradead.org;
	Wed, 08 Jul 2026 03:36:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/bprvjfkZ0oqVTmlvbtRw94STPHY60J1TjXPxacGDgk=; b=R9vFi2y9gzOqmT0uqyddfRsIiU
	TBeik3v29hH2RgPGUHld7HZ40E0v/q/i4jk1RtloL+iug+VSPCGkLCNipatVXVRkrGk/3Npf1Yaub
	jknkWa92sU+EegROcZxqemE0+kY9AdbZlaoFMTC1ke8rlEavbdgdTfY+6jGtLln0a7f/Eyw0cHk06
	K38Lv/75XAo8Zt+ht5Ood0j+QvsaB6hCiJ9S4wvfoDKbaPXMJa2PVnat+dm0tYkKTxccq1cCz59tv
	6BfUQ60NyH0gqopnXMJsCcRAYdbisN6B5TAJxy/bPH8kv6l6vcF54rY+w07Q1PFAC/fr1mh7ugPu6
	z1iLhJdw==;
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whJ5Z-00000007yXm-0bFn
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 03:36:46 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c99eaa1f020so170437a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jul 2026 20:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481803; x=1784086603; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/bprvjfkZ0oqVTmlvbtRw94STPHY60J1TjXPxacGDgk=;
        b=AwqMnNfp52lis0MRWk9U6Pd5tFqQwclPVNMFLR8xe8GOHiZIc7cALfKrbBq0e8XwQ7
         HSm8Gdl3DBMhkuOL/wMM2i5/FkW/AoU7aaGy6Qc3DaiRmoztwarFWaICUC0uVUJoLNJs
         IAWrUEHDzlpVfP/NST1uzEnG8qfbes+7LLrMY+GfWmcM/+56R0X5UwLC2zEArlaIA3zG
         llrSWrSKPIPOcdqYyW2PUI9hzwexr6ykgxjfum2f8Je29DYje422rOoGwwnStPlPdHmQ
         BCqtEgBHtCzpJ+WiBGuZiMMBHubV2kB3h743k5c6ffuohSRjiTKJeTV+7cg1xTjhTLrd
         KfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481803; x=1784086603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/bprvjfkZ0oqVTmlvbtRw94STPHY60J1TjXPxacGDgk=;
        b=o2gOmpcNC6O7iT4odLAMAHPO3KUx+6AwdD6Un6IDClwEAQUCA69iZBjiIMBnpUDvMk
         eSYn44mwd4IWw0MP8XiyKZLY33lZr1uuytH0kMkqrTckTULN0ex7wYO6wmSBcVCk1tzY
         Zl41VyhYbqwJYkUDAwA+/y+pUX8e34wYXkQ/xiXXtlW+k9GX+by9mF4M3rGa90mB8zi3
         f6MYhyWDJ7yofDJtrKjzUKVMXmAh4LM1y4LUFNELS6KG6LB8FZRcuupw8OeAv2vNmOkr
         i1CcYnqxKTN7A/CRfPAPl4JTjEGTyo4KsijHujyZg0kQuIPzVA3Yr6AgXkClZ3Pj/xjo
         qyKA==
X-Gm-Message-State: AOJu0YyRZqFwys3466UlNeC7Lkt0css/DcnEJ2+FVwf5FeuBykq42D3Q
	tDbsJYw2DA389GAcMBCP95gbrGGAy3bzvNmMPxZt2qa65pI73qxpaTp0
X-Gm-Gg: AfdE7clvqalEJb5vTFLOG2XMNL+8GMR3gC9EoeqZb/u0h23ElDRLVIYWMolRMn+A9zJ
	N5pTlAjt3EiN3zz9yFE4l03Z6AglsmTtCssuBrKRi9qnOoBvCOd0sKwWAYWUlEqxKZZHG9DFZQX
	LFcKrzkb3XKsVdMu+UzVOedsLDyZ9cmj+MvZ12KK0imHxsAvpAoNOzjXUjGeTE1yeGRpti8cswM
	2hBOMDFTeLIw4tyeGrZpTNdJTGgVLEIojKNgLNB2/laGQ9E0DFrUb85U0qjKlyn9nAGUAdcr1aD
	GwxwsDyfbLdWMOzeZXW3GnojqdWa3nfPq/5qkBHvXawwXtFreLRFKvZ/1MInrHOtPBXg2zpV6p2
	+AzPsulE+ZJvtQ8OVwb3vge5cQJoq6stDSXP+knXrBp+TxWbRiWhd0iqwUEijJaSsIGUaHrwfbf
	2ppXhIzexOTZBHPElcsWncYQ7/rkvY2BHS0MCL8Sw=
X-Received: by 2002:a05:6300:220d:b0:3bf:6c08:2843 with SMTP id adf61e73a8af0-3c0bd23ef9dmr601090637.50.1783481802761;
        Tue, 07 Jul 2026 20:36:42 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm21092850eec.29.2026.07.07.20.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:36:42 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Tue, 07 Jul 2026 20:34:37 -0700
Subject: [PATCH v3 14/17] KVM: riscv: selftests: Add csr emulation test
MIME-Version: 1.0
Message-Id: <20260707-riscv_insn_table-v3-14-3f8e5f75ba97@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783481778; l=4678;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=qi/WyV6rxMYApvKgE9MTfWvRwuKF3Auj3h2yBnFI9Mg=;
 b=QczF1j024KNg8/dB49Lgm4Ao2CfVqUU6ddLzHSDUYeMCWduTnE82y0t5vR2FFGF8EVkyU4Mi0
 eWDQJmNv8UjAE94S/3gzb4BUmUKXenPsYliWICDyA0ktInJOh35mlXn
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_043645_432324_24131C45 
X-CRM114-Status: GOOD (  15.83  )
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

Introduce a kvm test that uses the emulated test csr to validate that
all emulated reads/writes to csrs function as expected.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 tools/testing/selftests/kvm/Makefile.kvm     |   1 +
 tools/testing/selftests/kvm/riscv/csr_test.c | 133 +++++++++++++++++++++++++++
 2 files changed, 134 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 07a5fc2bf67c..88ccd15e8f94 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -212,6 +212,7 @@ TEST_GEN_PROGS_s390 += s390/irq_routing
 TEST_GEN_PROGS_s390 += mmu_stress_test
 
 TEST_GEN_PROGS_riscv = $(TEST_GEN_PROGS_COMMON)
+TEST_GEN_PROGS_riscv += riscv/csr_test
 TEST_GEN_PROGS_riscv += riscv/sbi_pmu_test
 TEST_GEN_PROGS_riscv += riscv/ebreak_test
 TEST_GEN_PROGS_riscv += riscv/mmio_test
diff --git a/tools/testing/selftests/kvm/riscv/csr_test.c b/tools/testing/selftests/kvm/riscv/csr_test.c
new file mode 100644
index 000000000000..bdedf7c84001
--- /dev/null
+++ b/tools/testing/selftests/kvm/riscv/csr_test.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * csr_test.c - Tests the csr functionality. CONFIG_RISCV_KVM_TEST_CSR needs to be enabled.
+ */
+#include "kvm_util.h"
+#include "ucall_common.h"
+
+#define CSR_TEST 0x240
+#define MASK 0x15
+#define FP 0x00006000
+
+/*
+ * Use the fcsr as a U-mode accesible csr and compare against the custom 'test'
+ * hypervisor csr (currently using vsscratch)
+ */
+#define test_csr(write, initial, mode)								\
+static void test_##write(void)									\
+{												\
+	unsigned long hypervisor_result, reference_result, old_hypervisor;			\
+	asm volatile (										\
+		"csrs	sstatus, %[enable_fp]\n"						\
+		"csrw	fcsr, %[init]\n"							\
+		#write"	zero, fcsr, %[mask]\n"							\
+		"csrr	%[ref_res], fcsr\n"							\
+		: [ref_res] "=&r" (reference_result)						\
+		: [enable_fp] "r" (FP), [mask] #mode(MASK), [init] "r" (initial)		\
+		: "memory"									\
+	);											\
+	asm volatile (										\
+		"csrw	%[test_csr], %[init]\n"							\
+		#write"	%[old], %[test_csr], %[mask]\n"						\
+		"csrr	%[hyp_res], %[test_csr]\n"						\
+		: [hyp_res] "=&r" (hypervisor_result), [old] "=&r" (old_hypervisor)		\
+		: [test_csr] "i"(CSR_TEST), [mask] #mode(MASK), [init] "r" (initial)		\
+		: "memory"									\
+	);											\
+	/* Check that writing works */								\
+	GUEST_ASSERT_EQ(reference_result, hypervisor_result);					\
+	/* Check that reading works */								\
+	GUEST_ASSERT_EQ(old_hypervisor, initial);						\
+	GUEST_DONE();										\
+}
+
+test_csr(csrrw, 0x0, r)
+test_csr(csrrs, 0x0, r)
+test_csr(csrrc, 0x15, r)
+test_csr(csrrwi, 0x0, i)
+test_csr(csrrsi, 0x0, i)
+test_csr(csrrci, 0x15, i)
+
+static void run(void *guest_code, char *instruction)
+{
+	int fd;
+	struct ucall uc;
+	struct kvm_vm *vm;
+	struct kvm_vcpu *vcpu;
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+
+	fd = kvm_create_device(vm, KVM_DEV_TYPE_TEST);
+
+	vcpu_run(vcpu);
+
+	TEST_ASSERT(get_ucall(vcpu, &uc) == UCALL_DONE,
+		    "CSR instruction '%s' failed: '%s'", instruction,
+		    uc.buffer);
+
+	close(fd);
+	kvm_vm_free(vm);
+}
+
+static void check_test_csr_guest(void)
+{
+	unsigned long scause, stvec;
+
+	asm volatile(
+		".option push\n"
+		".option norvc\n"
+		"la	%[stvec], 1f\n"
+		"csrw	stvec, %[stvec]\n"
+		"csrwi	%[test_csr], 0x0\n"
+		"1:\n"
+		"csrr	%[scause], scause\n"
+		".option pop\n"
+		: [scause] "=&r" (scause), [stvec] "=&r" (stvec)
+		: [test_csr] "i" (CSR_TEST)
+	);
+
+	/* An illegal instruction will be generated if CONFIG_RISCV_KVM_TEST_CSR is not enabled. */
+	if (scause == 2)
+		GUEST_FAIL("CONFIG_RISCV_KVM_TEST_CSR not enabled.\n");
+	GUEST_DONE();
+}
+
+static int check_test_csr(void)
+{
+	struct ucall uc;
+	struct kvm_vm *vm;
+	struct kvm_vcpu *vcpu;
+	int success;
+	int fd;
+
+	vm = vm_create_with_one_vcpu(&vcpu, check_test_csr_guest);
+
+	fd = __kvm_create_device(vm, KVM_DEV_TYPE_TEST);
+	if (fd < 0)
+		return 0;
+
+	vcpu_run(vcpu);
+
+	success = get_ucall(vcpu, &uc) == UCALL_DONE;
+
+	close(fd);
+	kvm_vm_free(vm);
+
+	return success;
+}
+
+int main(void)
+{
+	/* Skip if CONFIG_RISCV_KVM_TEST_CSR not enabled */
+	if (!check_test_csr())
+		exit(KSFT_SKIP);
+
+	run(test_csrrw, "csrrw");
+	run(test_csrrs, "csrrs");
+	run(test_csrrc, "csrrc");
+	run(test_csrrwi, "csrrwi");
+	run(test_csrrsi, "csrrsi");
+	run(test_csrrci, "csrrci");
+
+	return 0;
+}

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
