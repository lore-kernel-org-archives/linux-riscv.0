Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D96C77B7A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 16:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KjGfPPl6DYw8l70b3B/8ZCoO2k2KO+awtI5EVbosgxw=; b=yCFErSoRAS8m4rW0jnOGsbztWc
	FauVxzSatYMyUDKr6r47eVFEpDdEnbM+wQ5tRXWMjF3UHnEcmvEJPf1En8QoRRafPmoB185j0xhsK
	INlHyB0fJ328N8aX4OBL+wmq/ZKAl458P5ayLDzBxOe+x1Ty6Oq6zq07sj0cWlBvNFw3kU39IQkdZ
	LgZpzzP76QLFBwrh/W6Xr7Zw2seBuz1+ZMVziVinobTWQPoJ2oOWU3vrtEPS5PGKIJ13QpZb9QhXp
	zCMEDQ4zJySpAAOfYgC/TdQ09hx80S0Yl6ZDJslnb8begv5AatPeu6JiqKBIKn1gtao+V6Ck8apqb
	VVwf3mOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q57LM-007Le0-12;
	Fri, 02 Jun 2023 16:09:36 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q57LE-007LUd-1b
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 16:09:31 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-5340957a1f1so975247a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Jun 2023 09:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685722167; x=1688314167;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vX8ZCjC9l+xt5cqUnwzlqCkk/7EvJIEZcs67EwYM95Y=;
        b=ZpYUhbbZC6uUYrReM+ixNdEUwp22WUU7l8j2aahWsJUYqP381L7DaYeopKye6+Q9sn
         w6jGO0nX6WnAtH7Q3sGlOdc68vECR5PacYtF8uFrv3gPYqUB1KYLtsQIi3wA+701ktoo
         VcYLyZENUnFYI88cWmJbgLosheXItBqWsjUj1JOOFK7yQMQ1EVYBrKEM74EAZ9G1JJes
         +Fy3XP3gLD3JszJ1CTZiXeoILpXFoZBpgnn/vdDYBMvk+Dqwv0kvHMMpaOH7tt3QFj+s
         ke1ao1kRwftxIusnCaBSonu2zz1KVzCGGfUgW7HZsGqYe4xCh5lCKxmVw7qkF3LGd5ny
         Gpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685722167; x=1688314167;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vX8ZCjC9l+xt5cqUnwzlqCkk/7EvJIEZcs67EwYM95Y=;
        b=LC01k3X3vCmiQtJdsy2u4fRW+Ku9TYzlD7jDD2hyJOKb0SgjuCDddtSXfJLrCDDEne
         iQlmnaL7Ia03UbnnxOQlE3YIk4twOtFcb0FPGwTSOcH4w1JSGvAenjFaqeBjATMNzxul
         ZOiMmgNRmaGr1K9KxObnFUyUF+XE7wyzE6tUHMQU0lCXEFs9jlq0SrRh3+JLaofuEal+
         NWoNzn5HwgbxWEnG/xCrwZrnfdkjRqhttqMKcwZ69ujU54RTMOT+cIEXSPMrnu+9W3wP
         DkSL5UKrX/UwKXUH4eeLarHTdmucZowlgnNoYQ5Vg+U+j8ACDrPnXByDMsfaaD8aNiLR
         5APQ==
X-Gm-Message-State: AC+VfDyz2XgQPm/1uRohEVRwgHxfdscvEj2mjKur6Ihwntd2xXfUmz34
	Tf4KfnfsvKbQfP2fMODk4dyLuhubFFbB
X-Google-Smtp-Source: ACHHUZ7w+3zMwOJ66cN0pwH2useIGj7AgTlfLjnw5VFZgi7VE2BNKptqAZGtU12TE7bl7/aJEHHayi6hzCyj
X-Received: from vipin.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:479f])
 (user=vipinsh job=sendgmr) by 2002:a63:685:0:b0:530:866e:c3c1 with SMTP id
 127-20020a630685000000b00530866ec3c1mr2520235pgg.11.1685722167618; Fri, 02
 Jun 2023 09:09:27 -0700 (PDT)
Date: Fri,  2 Jun 2023 09:09:02 -0700
In-Reply-To: <20230602160914.4011728-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20230602160914.4011728-1-vipinsh@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230602160914.4011728-5-vipinsh@google.com>
Subject: [PATCH v2 04/16] KVM: selftests: Print read-write progress by vCPUs
 in dirty_log_perf_test
From: Vipin Sharma <vipinsh@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, james.morse@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, aleksandar.qemu.devel@gmail.com, 
	tsbogend@alpha.franken.de, anup@brainfault.org, atishp@atishpatra.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	seanjc@google.com, pbonzini@redhat.com, dmatlack@google.com, 
	ricarkol@google.com
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_090928_540744_C9703687 
X-CRM114-Status: GOOD (  12.07  )
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

Fetch count of read and write accesses from guest code and print sum of
these values across all vCPUs in dirty_log_perf_test.

This data provides progress made by vCPUs during dirty logging
operations. Since, vCPUs execute in lockstep with userspace dirty log
iterations, this metric is not very interesting. However, in future
commits when dirty_log_perf_test can execute vCPUs independently from
dirty log iterations then this metric can give good measure of vCPUs
performance during dirty logging.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../selftests/kvm/dirty_log_perf_test.c        | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/dirty_log_perf_test.c b/tools/testing/selftests/kvm/dirty_log_perf_test.c
index 2e31f13aaba6..14b012a0dcb1 100644
--- a/tools/testing/selftests/kvm/dirty_log_perf_test.c
+++ b/tools/testing/selftests/kvm/dirty_log_perf_test.c
@@ -12,6 +12,7 @@
 #include <stdlib.h>
 #include <time.h>
 #include <pthread.h>
+#include <stdatomic.h>
 #include <linux/bitmap.h>
 
 #include "kvm_util.h"
@@ -66,17 +67,22 @@ static u64 dirty_log_manual_caps;
 static bool host_quit;
 static int iteration;
 static int vcpu_last_completed_iteration[KVM_MAX_VCPUS];
+static atomic_ullong total_reads;
+static atomic_ullong total_writes;
 
 static void vcpu_worker(struct memstress_vcpu_args *vcpu_args)
 {
 	struct kvm_vcpu *vcpu = vcpu_args->vcpu;
 	int vcpu_idx = vcpu_args->vcpu_idx;
 	uint64_t pages_count = 0;
+	uint64_t reads = 0;
+	uint64_t writes = 0;
 	struct kvm_run *run;
 	struct timespec start;
 	struct timespec ts_diff;
 	struct timespec total = (struct timespec){0};
 	struct timespec avg;
+	struct ucall uc = {};
 	int ret;
 
 	run = vcpu->run;
@@ -89,7 +95,7 @@ static void vcpu_worker(struct memstress_vcpu_args *vcpu_args)
 		ts_diff = timespec_elapsed(start);
 
 		TEST_ASSERT(ret == 0, "vcpu_run failed: %d\n", ret);
-		TEST_ASSERT(get_ucall(vcpu, NULL) == UCALL_SYNC,
+		TEST_ASSERT(get_ucall(vcpu, &uc) == UCALL_SYNC,
 			    "Invalid guest sync status: exit_reason=%s\n",
 			    exit_reason_str(run->exit_reason));
 
@@ -101,6 +107,8 @@ static void vcpu_worker(struct memstress_vcpu_args *vcpu_args)
 		if (current_iteration) {
 			pages_count += vcpu_args->pages;
 			total = timespec_add(total, ts_diff);
+			reads += uc.args[2];
+			writes += uc.args[3];
 			pr_debug("vCPU %d iteration %d dirty memory time: %ld.%.9lds\n",
 				vcpu_idx, current_iteration, ts_diff.tv_sec,
 				ts_diff.tv_nsec);
@@ -123,6 +131,8 @@ static void vcpu_worker(struct memstress_vcpu_args *vcpu_args)
 	pr_debug("\nvCPU %d dirtied 0x%lx pages over %d iterations in %ld.%.9lds. (Avg %ld.%.9lds/iteration)\n",
 		vcpu_idx, pages_count, vcpu_last_completed_iteration[vcpu_idx],
 		total.tv_sec, total.tv_nsec, avg.tv_sec, avg.tv_nsec);
+	atomic_fetch_add(&total_reads, reads);
+	atomic_fetch_add(&total_writes, writes);
 }
 
 struct test_params {
@@ -270,6 +280,8 @@ static void run_test(enum vm_guest_mode mode, void *arg)
 			      dirty_log_manual_caps);
 
 	arch_setup_vm(vm, nr_vcpus);
+	atomic_store(&total_reads, 0);
+	atomic_store(&total_writes, 0);
 
 	/* Start the iterations */
 	iteration = 0;
@@ -388,6 +400,10 @@ static void run_test(enum vm_guest_mode mode, void *arg)
 			clear_dirty_log_total.tv_nsec, avg.tv_sec, avg.tv_nsec);
 	}
 
+	pr_info("Total pages touched: %llu (Reads: %llu, Writes: %llu)\n",
+		atomic_load(&total_reads) + atomic_load(&total_writes),
+		atomic_load(&total_reads), atomic_load(&total_writes));
+
 	free_bitmaps(bitmaps, p->slots);
 	arch_cleanup_vm(vm);
 	memstress_destroy_vm(vm);
-- 
2.41.0.rc0.172.g3f132b7071-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
