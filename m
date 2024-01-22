Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E87C47DAF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 09:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vzMSUDaXeJGIJ5dqnMMOURIaGiBC91zKmz9q4jxaQWM=; b=AulHb7ZjRvR3QP
	9PKa506g3ojhEEOY82f+IHvSwlHZBItVz2l5Pmg2WzJV/f7mhabF8eeTO4SNENKxiCkSOC3+mqzQk
	E2TT5xJ0apoQOcv9fTZxKmwALpGy0ck2PPxngbPc3H+JvKeSbs8lNgIMXlbUjMXY/DSZee/f6WCB9
	xuQvLBRur+TYGHei3bVe/yL3r32hHIwPd5QqvLLxEpg0URJMmcsm7vod/R2z3XPy1lSF86gYLNeg9
	aDtsK2AKecGGiIzmrUQMAqv0pfCSrYecNNaNAIBYiAgGp/m4Ttl7j/Q+j+8fY1mrCmT3q/NoYIYvd
	6VKZr3yKQ7yVNeGbZiqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRqsP-00BLGz-37;
	Mon, 22 Jan 2024 09:45:57 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRqsK-00BLD4-1H;
	Mon, 22 Jan 2024 09:45:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705916752; x=1737452752;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fzBcM62Pjhw6BIUME9G7wIpQ86AqUsEaiGEj2rJwCME=;
  b=D/jGFCN9djA0a87myGNqoUAZrUjIPH6+niGve5131jGm81F7KP78i6PY
   7LjFEaEdGyHaEdlDYqm1J7sK61DVR9oSpBIMaBVU/DVJLIPkBQJm+Awxe
   rF8Wq0PHlzsJbXAnESZGKVko54sF3i83FWIIl8Ve2hevkQb8ht6SZ+Nsr
   F4za0ASsmRmevbbVFTeuiEvd6K1GzS46t4mPZRGKeW9gSHryr4ohQbby/
   a3uWsVRwNpfPEYOBJ6zSThWY5QLr/se73gf/We6BaWmknt14ByjLa1t+e
   u+kAZDV8YRJgkwt+AEJ1lrXTDmW3gWpNSOTfgdM0fV+K0uvY89sz9QHzV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="22641633"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="22641633"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 01:45:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="778535368"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="778535368"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 01:45:42 -0800
From: Haibo Xu <haibo1.xu@intel.com>
To: 
Cc: xiaobo55x@gmail.com,
	ajones@ventanamicro.com,
	Haibo Xu <haibo1.xu@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	wchen <waylingii@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Sean Christopherson <seanjc@google.com>,
	Like Xu <likexu@tencent.com>,
	Peter Xu <peterx@redhat.com>,
	Vipin Sharma <vipinsh@google.com>,
	Thomas Huth <thuth@redhat.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Aaron Lewis <aaronlewis@google.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v5 03/12] KVM: arm64: selftests: Enable tuning of error margin in arch_timer test
Date: Mon, 22 Jan 2024 17:58:33 +0800
Message-Id: <e75f59a1957aa782807b6d361655bde83fce483c.1705916069.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705916069.git.haibo1.xu@intel.com>
References: <cover.1705916069.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_014552_450964_A42387DA 
X-CRM114-Status: GOOD (  15.63  )
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

There are intermittent failures occurred when stressing the
arch-timer test in a Qemu VM:

 Guest assert failed,  vcpu 0; stage; 4; iter: 3
 ==== Test Assertion Failure ====
   aarch64/arch_timer.c:196: config_iter + 1 == irq_iter
   pid=4048 tid=4049 errno=4 - Interrupted system call
      1  0x000000000040253b: test_vcpu_run at arch_timer.c:248
      2  0x0000ffffb60dd5c7: ?? ??:0
      3  0x0000ffffb6145d1b: ?? ??:0
   0x3 != 0x2 (config_iter + 1 != irq_iter)e

Further test and debug show that the timeout for an interrupt
to arrive do have random high fluctuation, espectially when
testing in an virtual environment.

To alleviate this issue, just expose the timeout value as user
configurable and print some hint message to increase the value
when hitting the failure..

Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../selftests/kvm/aarch64/arch_timer.c        | 32 +++++++++++++------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/kvm/aarch64/arch_timer.c b/tools/testing/selftests/kvm/aarch64/arch_timer.c
index 3260fefcc1b3..9b9a119bdd61 100644
--- a/tools/testing/selftests/kvm/aarch64/arch_timer.c
+++ b/tools/testing/selftests/kvm/aarch64/arch_timer.c
@@ -6,16 +6,18 @@
  * CVAL and TVAL registers. This consitutes the four stages in the test.
  * The guest's main thread configures the timer interrupt for a stage
  * and waits for it to fire, with a timeout equal to the timer period.
- * It asserts that the timeout doesn't exceed the timer period.
+ * It asserts that the timeout doesn't exceed the timer period plus
+ * a user configurable error margin(default to 100us).
  *
  * On the other hand, upon receipt of an interrupt, the guest's interrupt
  * handler validates the interrupt by checking if the architectural state
  * is in compliance with the specifications.
  *
  * The test provides command-line options to configure the timer's
- * period (-p), number of vCPUs (-n), and iterations per stage (-i).
- * To stress-test the timer stack even more, an option to migrate the
- * vCPUs across pCPUs (-m), at a particular rate, is also provided.
+ * period (-p), number of vCPUs (-n), iterations per stage (-i) and timer
+ * interrupt arrival error margin (-e). To stress-test the timer stack
+ * even more, an option to migrate the vCPUs across pCPUs (-m), at a
+ * particular rate, is also provided.
  *
  * Copyright (c) 2021, Google LLC.
  */
@@ -46,6 +48,7 @@ struct test_args {
 	uint32_t nr_iter;
 	uint32_t timer_period_ms;
 	uint32_t migration_freq_ms;
+	uint32_t timer_err_margin_us;
 	struct kvm_arm_counter_offset offset;
 };
 
@@ -54,6 +57,7 @@ static struct test_args test_args = {
 	.nr_iter = NR_TEST_ITERS_DEF,
 	.timer_period_ms = TIMER_TEST_PERIOD_MS_DEF,
 	.migration_freq_ms = TIMER_TEST_MIGRATION_FREQ_MS,
+	.timer_err_margin_us = TIMER_TEST_ERR_MARGIN_US,
 	.offset = { .reserved = 1 },
 };
 
@@ -190,10 +194,14 @@ static void guest_run_stage(struct test_vcpu_shared_data *shared_data,
 
 		/* Setup a timeout for the interrupt to arrive */
 		udelay(msecs_to_usecs(test_args.timer_period_ms) +
-			TIMER_TEST_ERR_MARGIN_US);
+			test_args.timer_err_margin_us);
 
 		irq_iter = READ_ONCE(shared_data->nr_iter);
-		GUEST_ASSERT_EQ(config_iter + 1, irq_iter);
+		__GUEST_ASSERT(config_iter + 1 == irq_iter,
+				"config_iter + 1 = 0x%lx, irq_iter = 0x%lx.\n"
+				"  Guest timer interrupt was not trigged within the specified\n"
+				"  interval, try to increase the error margin by [-e] option.\n",
+				config_iter + 1, irq_iter);
 	}
 }
 
@@ -408,8 +416,9 @@ static void test_vm_cleanup(struct kvm_vm *vm)
 
 static void test_print_help(char *name)
 {
-	pr_info("Usage: %s [-h] [-n nr_vcpus] [-i iterations] [-p timer_period_ms]\n",
-		name);
+	pr_info("Usage: %s [-h] [-n nr_vcpus] [-i iterations] [-p timer_period_ms]\n"
+		"\t\t    [-m migration_freq_ms] [-o counter_offset]\n"
+		"\t\t    [-e timer_err_margin_us]\n", name);
 	pr_info("\t-n: Number of vCPUs to configure (default: %u; max: %u)\n",
 		NR_VCPUS_DEF, KVM_MAX_VCPUS);
 	pr_info("\t-i: Number of iterations per stage (default: %u)\n",
@@ -419,6 +428,8 @@ static void test_print_help(char *name)
 	pr_info("\t-m: Frequency (in ms) of vCPUs to migrate to different pCPU. 0 to turn off (default: %u)\n",
 		TIMER_TEST_MIGRATION_FREQ_MS);
 	pr_info("\t-o: Counter offset (in counter cycles, default: 0)\n");
+	pr_info("\t-e: Interrupt arrival error margin (in us) of the guest timer (default: %u)\n",
+		TIMER_TEST_ERR_MARGIN_US);
 	pr_info("\t-h: print this help screen\n");
 }
 
@@ -426,7 +437,7 @@ static bool parse_args(int argc, char *argv[])
 {
 	int opt;
 
-	while ((opt = getopt(argc, argv, "hn:i:p:m:o:")) != -1) {
+	while ((opt = getopt(argc, argv, "hn:i:p:m:o:e:")) != -1) {
 		switch (opt) {
 		case 'n':
 			test_args.nr_vcpus = atoi_positive("Number of vCPUs", optarg);
@@ -445,6 +456,9 @@ static bool parse_args(int argc, char *argv[])
 		case 'm':
 			test_args.migration_freq_ms = atoi_non_negative("Frequency", optarg);
 			break;
+		case 'e':
+			test_args.timer_err_margin_us = atoi_non_negative("Error Margin", optarg);
+			break;
 		case 'o':
 			test_args.offset.counter_offset = strtol(optarg, NULL, 0);
 			test_args.offset.reserved = 0;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
