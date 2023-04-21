Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC884C77B76
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 18:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Wb2pPoeTl7Kdrd5UyvWt0IoDeLbLIvWe/0GGP3P9qsY=; b=P2BAOccyIsmOnUflJu3ZeONAOT
	f/WaO7TkEcUnlvMrIbtF9ExIFf09xXZlE1oMAJ18k/zEYBROkSkG4Qnmt0ZvF9rLlBmt3ONDjBoKF
	0eEe2ftFXS6+Rz0yOZjhYHFJB+nufpHDbTxkVoMpMoeegDdhCvXhfQD1slS2sMWQinSl8EL1D41RS
	RnT1Du53uOPKsjVqEA43MosUaLBtVZh1uSduamrxfA4wR6VDcexjVkcfN3KlQIxzw8lWDnsnTTYmw
	XyRp532mFRpivhDRf7I48M0qbrjUjVGr12L0NiFLY0Cc1QvhXuMN/LPXW4cO8i3IszvmllzXkXiBk
	XZJM+yZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppv4J-00BYzn-1o;
	Fri, 21 Apr 2023 18:01:11 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppu0e-00BR9J-1v
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 16:53:22 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-b922aa3725fso3282845276.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Apr 2023 09:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682095998; x=1684687998;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aIXwJZ86g2cMsPal848/IoLZKDxpkMIUoWM/xoiNZjQ=;
        b=OIjqFWC1f6JrRiHtRugX+y84MBGm6ZcE+DgB55EOotUGyniIQQqePlnbirQ3o2dDFU
         ZnbasVHpI23zQIfcI6Jn3dVfZwuX6HKTuVl0G4OM/jmCEWcu3RScvyE/peQMI6YRxFAi
         gf0XUXKKZmW/2xI2sZZBymHSazOLXzzNqXiPCfYZYBJgFR1ppXYdTKevwBVLtyFVmsIu
         +l8sz+E+NsmIMDQ/1tM0lFmpgOnwSQOEUwLEGaRH1NEwhUlguM0BNFYJ1HKGHsauRDG0
         npWVDOT9XxNmTt4xr+n6quK+ZKfLBdDgq8rhh/Dtt9wDzk6+CyFCPfqqi4sAI0/YzshM
         AXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682095998; x=1684687998;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aIXwJZ86g2cMsPal848/IoLZKDxpkMIUoWM/xoiNZjQ=;
        b=lMwCvyG6hvsxV2Dt22QZYOn354UkVNV4rIhqPopSIV0lNofld69Z++DiT+V/Fd5i6G
         o9SfX6LBcuOxRFjfbfluRYqnHkNzY9xX6yX4WPiuQHsQ4mCOAJtgfEMUgyZsmhJXI4Y2
         io4G1ZM8t9YHPsfORjmYzhHe8a19/3aIeWMOmz1c4V2YWw9JnabWuEhKuPr5NboSkAhG
         FMU5P4q0u/5lJIrDOMOzAIwCHbzZM3j/tZZZtDRIT8NAirtxOdN//MEeOR3tPTFQE2/2
         E1ih90WfsDYvMt0geWDFqupIYStHjlG2EMEB0NoqHxPBfhidpQYcx5gKBFBcRSq2+933
         bCxQ==
X-Gm-Message-State: AAQBX9egcm0fbmfXXVbwP0n7W/wuK6ehQuWn5MRLshD1XRNQaiN6VVDa
	uz3jAjbPe9u3h/eQ9d/Y4bN5T25d3WIw
X-Google-Smtp-Source: AKy350bXgyJDTEgckFAM/H87961TV8R1B/izBkH2FZgQ+FxNt6ajRDFj7SNSbgxdm0eZ4bQuJyBfwm/9rS7m
X-Received: from vipin.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:479f])
 (user=vipinsh job=sendgmr) by 2002:a25:d147:0:b0:b8c:ad5:6b4e with SMTP id
 i68-20020a25d147000000b00b8c0ad56b4emr1983907ybg.12.1682095998019; Fri, 21
 Apr 2023 09:53:18 -0700 (PDT)
Date: Fri, 21 Apr 2023 09:53:01 -0700
In-Reply-To: <20230421165305.804301-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20230421165305.804301-1-vipinsh@google.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
Message-ID: <20230421165305.804301-6-vipinsh@google.com>
Subject: [PATCH 5/9]  KVM: selftests: Allow independent execution of vCPUs in dirty_log_perf_test
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
X-CRM114-CacheID: sfid-20230421_095320_657523_9699FE89 
X-CRM114-Status: GOOD (  16.46  )
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

Allow vCPUs to execute independent of dirty log iterations after
initialization is complete. Hide this feature behind the new option
"-j".

This change makes dirty_log_perf_test execute like real world workflows
where guest vCPUs keep on executing while VMM collects dirty logs. Total
pages touched during execution of test will give good estimate of how
vCPUs are performing while dirty logging is enabled.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../selftests/kvm/dirty_log_perf_test.c       | 60 ++++++++++++-------
 1 file changed, 40 insertions(+), 20 deletions(-)

diff --git a/tools/testing/selftests/kvm/dirty_log_perf_test.c b/tools/testing/selftests/kvm/dirty_log_perf_test.c
index 0a08a3d21123..ffdad535fdaa 100644
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
+			while (!READ_ONCE(iteration))
+				;
+		}
 	}
 
 	avg = timespec_div(total, vcpu_last_completed_iteration[vcpu_idx]);
@@ -238,17 +249,19 @@ static void run_test(enum vm_guest_mode mode, void *arg)
 		clock_gettime(CLOCK_MONOTONIC, &start);
 		iteration++;
 
-		pr_debug("Starting iteration %d\n", iteration);
-		for (i = 0; i < nr_vcpus; i++) {
-			while (READ_ONCE(vcpu_last_completed_iteration[i])
-			       != iteration)
-				;
-		}
+		if (lockstep_iterations) {
+			pr_debug("Starting iteration %d\n", iteration);
+			for (i = 0; i < nr_vcpus; i++) {
+				while (READ_ONCE(vcpu_last_completed_iteration[i])
+				       != iteration)
+					;
+			}
 
-		ts_diff = timespec_elapsed(start);
-		vcpu_dirty_total = timespec_add(vcpu_dirty_total, ts_diff);
-		pr_info("Iteration %d dirty memory time: %ld.%.9lds\n",
-			iteration, ts_diff.tv_sec, ts_diff.tv_nsec);
+			ts_diff = timespec_elapsed(start);
+			vcpu_dirty_total = timespec_add(vcpu_dirty_total, ts_diff);
+			pr_info("Iteration %d dirty memory time: %ld.%.9lds\n",
+				iteration, ts_diff.tv_sec, ts_diff.tv_nsec);
+		}
 
 		clock_gettime(CLOCK_MONOTONIC, &start);
 		memstress_get_dirty_log(vm, bitmaps, p->slots);
@@ -365,6 +378,10 @@ static void help(char *name)
 	       "     To leave the application task unpinned, drop the final entry:\n\n"
 	       "         ./dirty_log_perf_test -v 3 -c 22,23,24\n\n"
 	       "     (default: no pinning)\n");
+	printf(" -j: Execute vCPUs independent of dirty log iterations\n"
+	       "     Independent vCPUs execution will allow them to continuously\n"
+	       "     dirty memory while main thread is collecting and clearing\n"
+	       "     dirty logs in the main thread's iterations.\n");
 	printf(" -k: Specify the chunk size in which dirty memory gets cleared\n"
 	       "     in memslots in each iteration. If the size is bigger than\n"
 	       "     the memslot size then whole memslot is cleared in one call.\n"
@@ -399,10 +416,10 @@ int main(int argc, char *argv[])
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
@@ -426,6 +443,9 @@ int main(int argc, char *argv[])
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
2.40.0.634.g4ca3ef3211-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
