Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642ABC77B7A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 16:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Bd/EIA0M6UdMoX0y/RCiDzJ0ZJTZQ7ZfOgrunEuJAeA=; b=WkhfWODi+t0s4GzDj6vjWC0x8a
	nMZxFztIp+zDS/Cbfiwc+u+EkYyLLmBkDlSMPYNCq1kxF3Cw42DiuH6fXLO4D1e03b0fSjFM3rIFg
	/P+NvYT5JrVYgxgLFs/86Q3LBI3+s8BJFrtjSyyb2d/M2k22oEm6zUACRvlKEC1zNijYhwpEI3VFb
	daz93Ildq3UHTYbhfEZJZTxeBI4YyCMM+dAp+Rk9h+GOMF5UJ7XEkV0BxTt5cGHFgxy+0A8jNXe+j
	VlH/wGqc4wcYCL0wUYBYRzUTVA73UaK8FNies8Nq3YZMfKNTqD1N++8IC6vCdlqG51iM/vr4rZD2N
	mDQtIEpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q57LP-007LiB-1S;
	Fri, 02 Jun 2023 16:09:39 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q57LG-007LX7-36
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 16:09:33 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-517bad1b8c5so2085631a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Jun 2023 09:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685722169; x=1688314169;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TCZIk7VgxCOZOGj9BrulapCebBiXjQ5+VJfBT1Ieq9g=;
        b=48Jv9Ndg6W2FWtv0TNF+EvHQkuzevnf0de3wNHQhiINnd1y+TJ3ZHZNsYvgiBjl6lh
         9WUrwiuBOv0A4GYPSawEV6yVx5LbPQL0U+gQGnFWAFVUnyrF1z1qm1xlbl6HRjy6NNwE
         8XB2SVK1dbUaEeLrM/H8JHaqBSIup+A6xNFpzpaufkcVOP+VAaTUukUdmKNrTQcISuZt
         yTtWhk1kuZr3BXzyN9NP6mKp7IAXkKM1nK9WQaTXO/PtqFm7I9EIaNt4fcwETtWcECAj
         9ktEJ+8oLB8jJgpGPXgzImfVTKXWHcOIgbQS6xiesRZonieLTn89FjSta0ZVX6QUoqee
         mZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685722169; x=1688314169;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TCZIk7VgxCOZOGj9BrulapCebBiXjQ5+VJfBT1Ieq9g=;
        b=ZA3XC6UANL6GQTHidfaCO7R/5rBvO7pt+kkiR2de4yQawZZFrdkIqK6yquQ1aoWLeZ
         O4JgBp4WgJNlY9DPl84SWyFudpexChynqw2dcQq+qx/CJcj+DItVaOZP0KEnfX39uRS2
         qV62dc4hD0nmkuWcggiSNJ8qWTALAnk1nOUJZCnw0kvThJpTbWmZCVKAziHSBiOnOl7F
         2cR+sfgRqv9wR6rlSsgKEsqJR/jAhBqP8fYoB/KOmD2WSYWulbEobvha1HbbeVbgvjEw
         AQ6wSCAyAnFgfY9X3HsTsFz9LjmyKhmJTq26wB5NVB1BQwFfkJpUp141DnbcYGGfHcPl
         ZlMQ==
X-Gm-Message-State: AC+VfDwof2m0SN0SkxbK7BDna52K9fI469og3dBUnX21TEFStVh4QJRz
	9gzwfbMasyseLQFl9gKgUeFp9jcIYepE
X-Google-Smtp-Source: ACHHUZ5eYF/RV9lQrAgLH67VBGXqFnNNXk0G34PjM3lxGa6/KnJxp9P54a/FAO5X5SRVmoZXvlFdh+lSImCS
X-Received: from vipin.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:479f])
 (user=vipinsh job=sendgmr) by 2002:a63:d044:0:b0:53f:32cf:bcd1 with SMTP id
 s4-20020a63d044000000b0053f32cfbcd1mr2492124pgi.5.1685722169678; Fri, 02 Jun
 2023 09:09:29 -0700 (PDT)
Date: Fri,  2 Jun 2023 09:09:03 -0700
In-Reply-To: <20230602160914.4011728-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20230602160914.4011728-1-vipinsh@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230602160914.4011728-6-vipinsh@google.com>
Subject: [PATCH v2 05/16] KVM: selftests: Allow independent execution of vCPUs
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
X-CRM114-CacheID: sfid-20230602_090931_016693_203C0A11 
X-CRM114-Status: GOOD (  17.35  )
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

Give users command line option (-j) to execute vCPUs independently of
dirty log iterations after initialization is complete.

This change makes dirty_log_perf_test behave like real world workflows
where guest vCPUs keep on executing while VMM collects and clear dirty
logs. Total pages touched during execution of test will give good
estimate of how vCPUs are performing while dirty logging is enabled.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../selftests/kvm/dirty_log_perf_test.c       | 64 +++++++++++++------
 1 file changed, 44 insertions(+), 20 deletions(-)

diff --git a/tools/testing/selftests/kvm/dirty_log_perf_test.c b/tools/testing/selftests/kvm/dirty_log_perf_test.c
index 14b012a0dcb1..fbf973d6cc66 100644
--- a/tools/testing/selftests/kvm/dirty_log_perf_test.c
+++ b/tools/testing/selftests/kvm/dirty_log_perf_test.c
@@ -69,6 +69,7 @@ static int iteration;
 static int vcpu_last_completed_iteration[KVM_MAX_VCPUS];
 static atomic_ullong total_reads;
 static atomic_ullong total_writes;
+static bool lockstep_iterations;
 
 static void vcpu_worker(struct memstress_vcpu_args *vcpu_args)
 {
@@ -83,12 +84,16 @@ static void vcpu_worker(struct memstress_vcpu_args *vcpu_args)
 	struct timespec total = (struct timespec){0};
 	struct timespec avg;
 	struct ucall uc = {};
+	int current_iteration = -1;
 	int ret;
 
 	run = vcpu->run;
 
 	while (!READ_ONCE(host_quit)) {
-		int current_iteration = READ_ONCE(iteration);
+		if (lockstep_iterations)
+			current_iteration = READ_ONCE(iteration);
+		else
+			current_iteration++;
 
 		clock_gettime(CLOCK_MONOTONIC, &start);
 		ret = _vcpu_run(vcpu);
@@ -118,13 +123,19 @@ static void vcpu_worker(struct memstress_vcpu_args *vcpu_args)
 				ts_diff.tv_nsec);
 		}
 
-		/*
-		 * Keep running the guest while dirty logging is being disabled
-		 * (iteration is negative) so that vCPUs are accessing memory
-		 * for the entire duration of zapping collapsible SPTEs.
-		 */
-		while (current_iteration == READ_ONCE(iteration) &&
-		       READ_ONCE(iteration) >= 0 && !READ_ONCE(host_quit)) {}
+		if (lockstep_iterations) {
+			/*
+			 * Keep running the guest while dirty logging is being disabled
+			 * (iteration is negative) so that vCPUs are accessing memory
+			 * for the entire duration of zapping collapsible SPTEs.
+			 */
+			while (current_iteration == READ_ONCE(iteration) &&
+			       READ_ONCE(iteration) >= 0 && !READ_ONCE(host_quit))
+				;
+		} else {
+			while (!READ_ONCE(iteration) && !READ_ONCE(host_quit))
+				;
+		}
 	}
 
 	avg = timespec_div(total, vcpu_last_completed_iteration[vcpu_idx]);
@@ -332,18 +343,20 @@ static void run_test(enum vm_guest_mode mode, void *arg)
 		clock_gettime(CLOCK_MONOTONIC, &start);
 		iteration++;
 
-		pr_debug("Starting iteration %d\n", iteration);
-		for (i = 0; i < nr_vcpus; i++) {
-			while (READ_ONCE(vcpu_last_completed_iteration[i])
-			       != iteration)
-				;
+		if (lockstep_iterations) {
+			pr_debug("Starting iteration %d\n", iteration);
+			for (i = 0; i < nr_vcpus; i++) {
+				while (READ_ONCE(vcpu_last_completed_iteration[i])
+				       != iteration)
+					;
+			}
+
+			ts_diff = timespec_elapsed(start);
+			vcpu_dirty_total = timespec_add(vcpu_dirty_total, ts_diff);
+			pr_info("Iteration %d dirty memory time: %ld.%.9lds\n",
+				iteration, ts_diff.tv_sec, ts_diff.tv_nsec);
 		}
 
-		ts_diff = timespec_elapsed(start);
-		vcpu_dirty_total = timespec_add(vcpu_dirty_total, ts_diff);
-		pr_info("Iteration %d dirty memory time: %ld.%.9lds\n",
-			iteration, ts_diff.tv_sec, ts_diff.tv_nsec);
-
 		clock_gettime(CLOCK_MONOTONIC, &start);
 		get_dirty_log(vm, bitmaps, p->slots);
 		ts_diff = timespec_elapsed(start);
@@ -365,6 +378,10 @@ static void run_test(enum vm_guest_mode mode, void *arg)
 		}
 	}
 
+	/* Block further vCPUs execution */
+	if (!lockstep_iterations)
+		WRITE_ONCE(iteration, 0);
+
 	/*
 	 * Run vCPUs while dirty logging is being disabled to stress disabling
 	 * in terms of both performance and correctness.  Opt-in via command
@@ -458,6 +475,10 @@ static void help(char *name)
 	       "     To leave the application task unpinned, drop the final entry:\n\n"
 	       "         ./dirty_log_perf_test -v 3 -c 22,23,24\n\n"
 	       "     (default: no pinning)\n");
+	printf(" -j: Execute vCPUs independent of dirty log iterations\n"
+	       "     Independent vCPUs execution will allow them to continuously\n"
+	       "     dirty memory while main thread is collecting and clearing\n"
+	       "     dirty logs in each iteration.\n");
 	printf(" -k: Specify the chunk size in which dirty memory gets cleared\n"
 	       "     in memslots in each iteration. If the size is bigger than\n"
 	       "     the memslot size then whole memslot is cleared in one call.\n"
@@ -492,10 +513,10 @@ int main(int argc, char *argv[])
 		kvm_check_cap(KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2);
 	dirty_log_manual_caps &= (KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE |
 				  KVM_DIRTY_LOG_INITIALLY_SET);
-
+	lockstep_iterations = true;
 	guest_modes_append_default();
 
-	while ((opt = getopt(argc, argv, "ab:c:eghi:k:l:m:nop:r:s:v:x:w:")) != -1) {
+	while ((opt = getopt(argc, argv, "ab:c:eghi:jk:l:m:nop:r:s:v:x:w:")) != -1) {
 		switch (opt) {
 		case 'a':
 			p.random_access = true;
@@ -519,6 +540,9 @@ int main(int argc, char *argv[])
 		case 'i':
 			p.iterations = atoi_positive("Number of iterations", optarg);
 			break;
+		case 'j':
+			lockstep_iterations = false;
+			break;
 		case 'k':
 			p.clear_chunk_size = parse_size(optarg);
 			break;
-- 
2.41.0.rc0.172.g3f132b7071-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
