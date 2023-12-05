Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C44BC10F05
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 18:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJ2WeNfVuUSVvPBrmt0Uqj1cIpcfnZXe8SS2UX0eWvE=; b=v0nTu1R6z9Y2Te
	z/OhwsmsfI7SLN4x8+5Dv9foho2+yVSzh282dYgQdob1btji4OaExAOuE1bcYppXK7rwEacD48CZ2
	fPo8ketdHpqIoFqshS1ZH1qixt786wMAUrULd50NCfuMoGsLLZPzdjol0E6RbmUgCPqNW1McEZbIV
	KkUuu5fssKepTLZ6aJCZZLWxauBm8vsRH/8805+8tn8psWwPUO+iQGM4b9qV247WjbGORnV51Q4st
	dqDtX6RXnuE8I72jxkndbD5BYrHe45GAvt12amAn0g4PVpV42Br2xiRsOcOHzWt9pk2IJbWMEHs4M
	APc7moVyLwTCOtroWDQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZtj-0087FB-0h;
	Tue, 05 Dec 2023 18:11:55 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZtW-0086tF-0f
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 18:11:45 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a1cee2c1620so79168066b.2
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 10:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701799899; x=1702404699; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gX5WWhfig998/yZSJ0nntzGN5FS4doIX9lLnxn8Eabk=;
        b=Cmt9miF/PdEZb5WloXsUkWYnCXh3e7wMNkZB52BTnn2jKcXmU7wmtTgtxVsJn30VYi
         lGbLVjFzj6LA5A+/la0JIFYRqmIxr6moz1RdOXoZvCQXK8o/n+Swr4RCEdlOGby4Y2gI
         pgE6qxRoPyJua2QX7zHvJcHAH7Krd1ctzmUlezYi5H+vOuGLEBJMkyWoyVqIAXJTVBeg
         7wdRlNM/ajc+PjG0xBTqx/O2XrFagVWj0wQ6sw8hiFgWso8N+mNm3KjXKGcBjj+L0iZH
         txNZeWIhdheeouU9HGw2kLb1fPaSESejynyXhxM6BirqMiOjCSppf5PhWfhPEnX0r0/1
         ZlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701799899; x=1702404699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gX5WWhfig998/yZSJ0nntzGN5FS4doIX9lLnxn8Eabk=;
        b=d/POZ7wo6u+JkyluMsm9Y/Kgm7WVwjF8AfVYcSqQd6wRo9latONpzQd9zLK+j8Vg+y
         Khc/kwIprOa/cAhoHAMG7S5Md0ziPPtJv+HXI5lBqzXfiWdPAOKKbufa056ZpUe5I69F
         Q2LxtKxGIAEijXZCwEerDQnB+f99sCIh7udQK8Cvf6ieQsSVlnoPkjCLywcionOsz1wu
         Z+ps4UXL6vNVl3OziERChnUhK4QkD4hRVj68JWXggzjk9Dx+BK1hWc70Ltn4RUS2UAW+
         gcpb4LpTFkKjjMozFcfR5JU6Adi9JJ8PJKL7+G7EYSA9KVSD0d1FY811yV6823vjL0/a
         g38Q==
X-Gm-Message-State: AOJu0Yz5iKZGogpoA95V63dkhvG9Cfg9eD8qdffn3Fzpse5WPxEzfHbm
	O8l1R893loJipQz6RLcsEGXpOA==
X-Google-Smtp-Source: AGHT+IGVDqSAVAc4n/NzKSePh93TSBdvQlfnzm4mjv1k7NCVmXDLW2EClZhu4K7O7TGJV0YruDqlXw==
X-Received: by 2002:a17:906:209e:b0:a1c:7444:a847 with SMTP id 30-20020a170906209e00b00a1c7444a847mr443883ejq.239.1701799898948;
        Tue, 05 Dec 2023 10:11:38 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id p4-20020a170906140400b00a1b61096ce6sm3768390ejc.129.2023.12.05.10.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 10:11:38 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	pbonzini@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgross@suse.com,
	srivatsa@csail.mit.edu,
	guoren@kernel.org
Subject: [PATCH v1 13/14] RISC-V: KVM: selftests: Add steal_time test support
Date: Tue,  5 Dec 2023 19:11:33 +0100
Message-ID: <20231205181119.207204-29-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205181119.207204-16-ajones@ventanamicro.com>
References: <20231205181119.207204-16-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_101142_274336_5C9BCE65 
X-CRM114-Status: GOOD (  13.65  )
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
 tools/testing/selftests/kvm/Makefile          |  5 +-
 .../selftests/kvm/include/riscv/processor.h   |  1 +
 tools/testing/selftests/kvm/steal_time.c      | 99 +++++++++++++++++++
 3 files changed, 103 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index a5963ab9215b..ab52bd0c0c5b 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -193,12 +193,13 @@ TEST_GEN_PROGS_s390x += kvm_binary_stats_test
 
 TEST_GEN_PROGS_riscv += demand_paging_test
 TEST_GEN_PROGS_riscv += dirty_log_test
-TEST_GEN_PROGS_riscv += guest_print_test
 TEST_GEN_PROGS_riscv += get-reg-list
+TEST_GEN_PROGS_riscv += guest_print_test
+TEST_GEN_PROGS_riscv += kvm_binary_stats_test
 TEST_GEN_PROGS_riscv += kvm_create_max_vcpus
 TEST_GEN_PROGS_riscv += kvm_page_table_test
 TEST_GEN_PROGS_riscv += set_memory_region_test
-TEST_GEN_PROGS_riscv += kvm_binary_stats_test
+TEST_GEN_PROGS_riscv += steal_time
 
 SPLIT_TESTS += get-reg-list
 
diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index dc50ad62e150..a0f9efe5a2a8 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -128,6 +128,7 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t subtype,
 
 enum sbi_ext_id {
 	SBI_EXT_BASE = 0x10,
+	SBI_EXT_STA = 0x535441,
 };
 
 enum sbi_ext_base_fid {
diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
index 171adfb2a6cb..bae0c5026f82 100644
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
@@ -203,6 +205,103 @@ static void steal_time_dump(struct kvm_vm *vm, uint32_t vcpu_idx)
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
+	uint64_t id = RISCV_SBI_EXT_REG(KVM_RISCV_SBI_EXT_STA);
+	unsigned long enabled;
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
