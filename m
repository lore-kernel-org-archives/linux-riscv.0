Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4154DC77B76
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 11:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SfmR+flTXwF40jE13g7bJK1PeYAvsKJv6i95IKlg5S0=; b=ISFqSt51a+UKlB
	ao77Lj6HcFi/UaWR3Rq0VuC/cbDAkdRp4DWlJnGcHnrQ7QGt8rN4QCZaT4yV+/WgSQYxqVR6OsKZr
	HJooWAHey89KLQt/9mAN2rOfe+Vvc5KficCFZb4BdeywE6alHLaL4QelowLkdAprdm+NXgDhqaaow
	6d7X0mWEAJkcPOQUcDEHhDHeFfPiD4XZvETUPrylPTAIQw+rD2rGD95p+PQfGo47WxIUSG3igynhB
	CPfJa5kCHGMVAlqsh3z8+TRUC0YX3KZFNQ/2gh8pqD1v8KYxpNU2DMNKRE/te/cI9ntZYYi9whMUT
	y7zCuwBjuVr57275tzXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poNJ2-00G1nD-2n;
	Mon, 17 Apr 2023 11:46:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poNJ0-00G1lo-1d
	for linux-riscv@bombadil.infradead.org;
	Mon, 17 Apr 2023 11:45:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8ct0u4CmO4a7HpXOWDldSz4nx+smg1PHi+0O93Q47W4=; b=bOUY+zyYwboX2ZIpFhOB/XBYXV
	Nb809Wnj9yh0KCeMZ8huphWMhzK3QbkScMCJXAaei0tGcUsIXksbo3wBYHpHthJaoKJw/398A1hH5
	7kRQMEe/5ovcn6HOvX/ZRK4W3NYayhFe5b8RnrIuIVrjV5yiLBGr218DaVsPjb7BfcsA3wORnWJHD
	pBc+dks5gGpNRHrq7JqH2aTsiFrtSOu978pUUh24E59NTpAjfYXgovIt65k/+fhBUBqvIM1qEgy1+
	cV8nt5VxjRnGK4u6IpSUeJfGRoPhuhgPgp4kweCFjjpHsh9mUQoA2NhpKM5ntAk5Mr8E5HZu0+Xt6
	KcWNIpHA==;
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poMBq-00HIFH-0y
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 10:34:38 +0000
Received: by mail-ej1-x634.google.com with SMTP id xi5so62796550ejb.13
        for <linux-riscv@lists.infradead.org>; Mon, 17 Apr 2023 03:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1681727668; x=1684319668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ct0u4CmO4a7HpXOWDldSz4nx+smg1PHi+0O93Q47W4=;
        b=ELNqQ1JCfT5JTk3oOtOQSrfZK6TpHdh3CarJZPCGOa6ompORV/ZUbCoXy5ucWC/lGE
         AQ101maE/TCvcRNDA5EEgzoVVSp7D6CgNztDon61r15QmEh1x5k+BR04N9UQJHE3XGx+
         2pd/hXRBSNRffMjUHWj8Huc5CtJgpjrQU2ii48kdnN0L/X1Hkb9PzzS1Js+vj+eFXlOk
         w08/uPfj3ojD19QYLvq3UKUjoyribqf8ah7bA7kLBVIbeyCfb0C0AuQuYCRJgv/OxLMv
         PYSiE6JsSNtSz+M8GSWKVhvucKBvNpExOcSLvV0+X5CTOlg4flsqf4+Unxu+TW8uSTqi
         XmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681727668; x=1684319668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ct0u4CmO4a7HpXOWDldSz4nx+smg1PHi+0O93Q47W4=;
        b=YzAHqGVRJTG+3tmsbDEgSn0Snveg2Lo0ZUXcQNKUsoZ7FgPqGDqdSj5gGAD+nvliE7
         bxwkYVsJa/yDEzUkxf0/R9TafLPo3O2+rJ023z5fh/4us++Nr8fJQyaRwaggvfxoDMO0
         G9T5TqaEhYzctEjJfJTtOuOmIA0bPuWYFcmevYBdyROnju7hb8ibWSpAACEdbg6IVrHs
         qPfO6x1cLwk4/QwlahKLl7x8s3tkKcR4kgZxXZVfsCrVKe5VYbenpmVRHCPwW0QTnZOu
         wL1ZkXDpKD0S9oRGtjV8iFmTCHtOBjCaKUSvmJs/n3mC5UEblID2D+Yfs8upnCl24mrr
         kGmQ==
X-Gm-Message-State: AAQBX9dipR81tO9qlh71P9Vb2gZ8GThJTPNL5Pk/M15UcGd/A44o/tgM
	jLTPtikfhV8n+xrlWYcD4RbQQw==
X-Google-Smtp-Source: AKy350arFYwZkBbaRFJ38pbZxZHlWyHHhIBQYlbpCRgxsNJ0BcKssdr/4XERblTR0+mULmXDFuurXg==
X-Received: by 2002:a17:906:fc04:b0:94e:5780:23f9 with SMTP id ov4-20020a170906fc0400b0094e578023f9mr9018032ejb.48.1681727668495;
        Mon, 17 Apr 2023 03:34:28 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id oz19-20020a1709077d9300b0094ebd376fadsm5859616ejc.144.2023.04.17.03.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 03:34:28 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: 'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paolo Bonzini ' <pbonzini@redhat.com>,
	'Juergen Gross ' <jgross@suse.com>,
	"'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>
Subject: [RFC PATCH 14/14] KVM: selftests: riscv: Add steal_time test support
Date: Mon, 17 Apr 2023 12:34:02 +0200
Message-Id: <20230417103402.798596-15-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417103402.798596-1-ajones@ventanamicro.com>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_113430_459132_8E7CBE69 
X-CRM114-Status: GOOD (  13.83  )
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

With the introduction of steal-time accounting support for
RISC-V KVM we can add RISC-V support to the steal_time test.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/kvm/Makefile          |   3 +-
 .../selftests/kvm/include/riscv/processor.h   |   1 +
 tools/testing/selftests/kvm/steal_time.c      | 100 ++++++++++++++++++
 3 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 84a627c43795..6b8aae3604bf 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -171,10 +171,11 @@ TEST_GEN_PROGS_s390x += kvm_binary_stats_test
 
 TEST_GEN_PROGS_riscv += demand_paging_test
 TEST_GEN_PROGS_riscv += dirty_log_test
+TEST_GEN_PROGS_riscv += kvm_binary_stats_test
 TEST_GEN_PROGS_riscv += kvm_create_max_vcpus
 TEST_GEN_PROGS_riscv += kvm_page_table_test
 TEST_GEN_PROGS_riscv += set_memory_region_test
-TEST_GEN_PROGS_riscv += kvm_binary_stats_test
+TEST_GEN_PROGS_riscv += steal_time
 
 TEST_PROGS += $(TEST_PROGS_$(ARCH_DIR))
 TEST_GEN_PROGS += $(TEST_GEN_PROGS_$(ARCH_DIR))
diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index f052e8be0e42..4870c6107e10 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -123,6 +123,7 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t subtype,
 
 enum sbi_ext_id {
 	SBI_EXT_BASE = 0x10,
+	SBI_EXT_STA = 0x535441,
 };
 
 enum sbi_ext_base_fid {
diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
index c87f38712073..f35739e858fe 100644
--- a/tools/testing/selftests/kvm/steal_time.c
+++ b/tools/testing/selftests/kvm/steal_time.c
@@ -11,7 +11,9 @@
 #include <pthread.h>
 #include <linux/kernel.h>
 #include <asm/kvm.h>
+#ifndef __riscv
 #include <asm/kvm_para.h>
+#endif
 
 #include "test_util.h"
 #include "kvm_util.h"
@@ -203,6 +205,104 @@ static void steal_time_dump(struct kvm_vm *vm, uint32_t vcpu_idx)
 	pr_info("    st_time: %ld\n", st->st_time);
 }
 
+#elif defined(__riscv)
+
+/* SBI STA shmem must have 64-byte alignment */
+#define STEAL_TIME_SIZE		((sizeof(struct sta_struct) + 63) & ~63)
+
+static vm_paddr_t st_gpa[NR_VCPUS];
+
+struct sta_struct {
+	uint32_t sequence;
+	uint32_t flags;
+	uint64_t steal;
+	uint8_t preempted;
+	uint8_t pad[47];
+} __packed;
+
+static void sta_set_shmem(vm_paddr_t gpa, unsigned long flags)
+{
+	unsigned long lo = (unsigned long)gpa;
+#if __riscv_xlen == 32
+	unsigned long hi = (unsigned long)(gpa >> 32);
+#else
+	unsigned long hi = gpa == -1 ? -1 : 0;
+#endif
+	struct sbiret ret = sbi_ecall(SBI_EXT_STA, 0, lo, hi, flags, 0, 0, 0);
+
+	GUEST_ASSERT(ret.value == 0 && ret.error == 0);
+}
+
+static void check_status(struct sta_struct *st)
+{
+	GUEST_ASSERT(!(READ_ONCE(st->sequence) & 1));
+	GUEST_ASSERT(READ_ONCE(st->flags) == 0);
+	GUEST_ASSERT(READ_ONCE(st->preempted) == 0);
+}
+
+static void guest_code(int cpu)
+{
+	struct sta_struct *st = st_gva[cpu];
+	uint32_t sequence;
+	long out_val = 0;
+	bool probe;
+
+	probe = guest_sbi_probe_extension(SBI_EXT_STA, &out_val);
+	GUEST_ASSERT(probe && out_val == 1);
+
+	sta_set_shmem(st_gpa[cpu], 0);
+	GUEST_SYNC(0);
+
+	check_status(st);
+	WRITE_ONCE(guest_stolen_time[cpu], st->steal);
+	sequence = READ_ONCE(st->sequence);
+	check_status(st);
+	GUEST_SYNC(1);
+
+	check_status(st);
+	GUEST_ASSERT(sequence < READ_ONCE(st->sequence));
+	WRITE_ONCE(guest_stolen_time[cpu], st->steal);
+	check_status(st);
+	GUEST_DONE();
+}
+
+static bool is_steal_time_supported(struct kvm_vcpu *vcpu)
+{
+	unsigned long enabled;
+	uint64_t id = RISCV_SBI_EXT_REG(KVM_REG_RISCV_SBI_SINGLE,
+					KVM_RISCV_SBI_EXT_STA);
+
+	vcpu_get_reg(vcpu, id, &enabled);
+	TEST_ASSERT(enabled == 0 || enabled == 1, "Expected boolean result");
+
+	return enabled;
+}
+
+static void steal_time_init(struct kvm_vcpu *vcpu, uint32_t i)
+{
+	/* ST_GPA_BASE is identity mapped */
+	st_gva[i] = (void *)(ST_GPA_BASE + i * STEAL_TIME_SIZE);
+	st_gpa[i] = addr_gva2gpa(vcpu->vm, (vm_vaddr_t)st_gva[i]);
+	sync_global_to_guest(vcpu->vm, st_gva[i]);
+	sync_global_to_guest(vcpu->vm, st_gpa[i]);
+}
+
+static void steal_time_dump(struct kvm_vm *vm, uint32_t vcpu_idx)
+{
+	struct sta_struct *st = addr_gva2hva(vm, (ulong)st_gva[vcpu_idx]);
+	int i;
+
+	pr_info("VCPU%d:\n", vcpu_idx);
+	pr_info("    sequence:  %d\n", st->sequence);
+	pr_info("    flags:     %d\n", st->flags);
+	pr_info("    steal:     %"PRIu64"\n", st->steal);
+	pr_info("    preempted: %d\n", st->preempted);
+	pr_info("    pad:      ");
+	for (i = 0; i < 47; ++i)
+		pr_info("%d", st->pad[i]);
+	pr_info("\n");
+}
+
 #endif
 
 static void *do_steal_time(void *arg)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
