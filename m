Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63FAC7618E
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 18:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KvWbSbQQDXmmtMSAR6zmttymFQHZVVGMmP25qu/dQd8=; b=saD3xY9YUd9lMOD1j/aASc9QXc
	mVSqrgM7sebXH3u13qCTVH4hr2rQ+xfYZTTcGuU+++2QGeIm2KlJkTB1+pwYGFdpsQmO5dVTkLBfP
	5P3ZnaBVAejKRUnOGM28bBJAjoCvvWThOKL6N1YLEwxsVAXKSCFzHpCjVMpRSVsYgd/vlHrzDDpEy
	P//cwNZDiILD4zlHlTShQGPbcQmI9ZBeW0KuSNHaSKZJltKhFNG+PI3V7ozLKqVd0lo1UE9bs7xgG
	EoD9sar2g6l3kHuwy0ScyuTIoFz/LjsfSxRVUozTIEQT3qLh2GZpoPJVidiH+YOsnrax4ExzxD5DZ
	s6gVxxkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppv4F-00BYxM-2o;
	Fri, 21 Apr 2023 18:01:07 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppu0b-00BR7W-0U
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 16:53:20 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-51b121871ecso1487746a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Apr 2023 09:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682095996; x=1684687996;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QAMadok09XxgFvaDO3J6Lgqv+ZDwnOLb2IYSq9G7u+A=;
        b=5l1CzLumfw4VvnGKs1LekidIOHm6RR2ZhVTA1I+whH2HeXgm2o8PhxoPUQLTHfydb9
         MbBxamdeRZWqIzwIX6cPpq9NGQ3282H+LGUyBZpLlO6iAgfWncKkZnXQevgjEqCzsFvI
         /ie9WS7cdYCl1aCB7+4MGfZNo6IMNnRdfZplWSdxceYc0BIUM6d0gO/blOvoZokSUVGw
         Y1vWnwlcSKtpR4AbEKzTUp+leY3IooaW0MIg6qShyiSd1O990V5j6KZFgnSxmwclrSfF
         iRRS2VvoFH4pfGHIeK5C/wh3ElWiAy4UgpcFTrfc4JtiPWNVC38kZkoYq7eJ04Cn12As
         uI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682095996; x=1684687996;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QAMadok09XxgFvaDO3J6Lgqv+ZDwnOLb2IYSq9G7u+A=;
        b=blRAdShwzQO7bjx05f8tbpM2b1Qs3CG5du833ILkS61F+tThQiiikF2OTJ3sAbfdG8
         6JusoikrbSISnGej97Jp3Vll49Cf9fv4IghBCNio+2O4W+JCnkg9DYprR9CmqeahsyU2
         3/q+tg4Smqn6KhxnOIbnE2LP6M5zMZM4Un/4zkVsNKeuLldZ21j85Feh5sqgiRKSg3oF
         kmEB7lWdDRJ2qmI6udh8RP14Lh0nM4bCeo6iGOi0C2i3q/bjBEuf96NTVZQo7vDMudpi
         e3Op0ufxmfdcTWhm+q36LMFOoHSKHzV/BBxcFADZlTW39SsJEuyeDWg7Q3rI8oKza07c
         NTvw==
X-Gm-Message-State: AAQBX9c6QC4avbl6dcH4mzMCkMAqRopjjkbK4qqCXq7GwyULDWkIJqnA
	fmnnM44VMSQf7s4CX6tKWOYUFEDvpZdS
X-Google-Smtp-Source: AKy350ZjCHa4QHnHiWhcJq+auFhrVPVMASZyckOmf5zCb6ojNKQ4+uKrop3naLHjd6GRNHOZE2DYdu7UHwlH
X-Received: from vipin.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:479f])
 (user=vipinsh job=sendgmr) by 2002:a63:105e:0:b0:520:53fa:9878 with SMTP id
 30-20020a63105e000000b0052053fa9878mr1424111pgq.6.1682095996166; Fri, 21 Apr
 2023 09:53:16 -0700 (PDT)
Date: Fri, 21 Apr 2023 09:53:00 -0700
In-Reply-To: <20230421165305.804301-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20230421165305.804301-1-vipinsh@google.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
Message-ID: <20230421165305.804301-5-vipinsh@google.com>
Subject: [PATCH 4/9] KVM: selftests: Print read and write accesses of pages by
 vCPUs in dirty_log_perf_test
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
X-CRM114-CacheID: sfid-20230421_095317_202465_C56C2A52 
X-CRM114-Status: GOOD (  11.32  )
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

Fetch read and write accesses of pages from guest code and print count
across all vCPUs in dirty_log_perf_test.

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
index 338f03a4a550..0a08a3d21123 100644
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
@@ -176,6 +186,8 @@ static void run_test(enum vm_guest_mode mode, void *arg)
 			      dirty_log_manual_caps);
 
 	arch_setup_vm(vm, nr_vcpus);
+	atomic_store(&total_reads, 0);
+	atomic_store(&total_writes, 0);
 
 	/* Start the iterations */
 	iteration = 0;
@@ -295,6 +307,10 @@ static void run_test(enum vm_guest_mode mode, void *arg)
 			clear_dirty_log_total.tv_nsec, avg.tv_sec, avg.tv_nsec);
 	}
 
+	pr_info("Total pages touched: %llu (Reads: %llu, Writes: %llu)\n",
+		atomic_load(&total_reads) + atomic_load(&total_writes),
+		atomic_load(&total_reads), atomic_load(&total_writes));
+
 	memstress_free_bitmaps(bitmaps, p->slots);
 	arch_cleanup_vm(vm);
 	memstress_destroy_vm(vm);
-- 
2.40.0.634.g4ca3ef3211-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
