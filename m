Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC6DC1B0FF
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 20:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJNPw7KzqVnRiK/FqwZ0LbOsmLCZnshhYOfalfwURaw=; b=ANRMEmYU/dJJas
	1LvBy9Tz7EF11k3XedVQ1PZUH+zAztTe3QGa1iAwuH+aRcQxsifsXNSBT9OTibQWFfq1kbjBA2v3S
	wkLWHDiGxORWanMPehVLXm3m6fGEcihQ++UG6XeednNTzu+UIucm5RpGijUTOEZ0Rd8cTdVxyHJzM
	twtmQ5OhJ1WAGESuP0Cv5PETHqWNthG9Xs/Pa2hHuSk2W93J3cqCL4/VpuZ0cbmxTYv6T12T+4Uqk
	5VvGnPviac9QYNAChKORn1r46T+u8pkfaQ7t93QVwt15MiAvr1nxl7DsWEqiTjdYwwZiIp+xhUn9S
	wmgxA5uIFFN8kFN5n/AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnO1D-00000005LFX-20DS;
	Wed, 26 Feb 2025 20:28:35 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNxy-00000005KRf-1rsd
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 20:25:16 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2211cd4463cso2660105ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Feb 2025 12:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740601513; x=1741206313; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUL9vPYfIsBYwLRgV8qB6RCZqGNjsrfsVU1Ka6aFYBY=;
        b=kD3VJdllQQ55pUbEzMJY3nD+gu+XD+QQE+GwCdqy57QhYi1Iv+wgZqgtXDxAGDPGDo
         r2VYP3rGNhOJHGkLggDOTZZwOv2/A1oJyXb2jx/5s6bpW2m1rd5NCUlvuiYJcey2PElH
         dGyGO2SOsU+5Wud+w/VOOzXQOppCFSFbOFyApKmPZZRztao77yPAFsgXWHniz3/5IH87
         6ypiidAFKhpqbmnaw7Z4Peogkfm7W3pHA0QtSnqqJ+Yhv8wr0TteYhylidJ5UNmbYYiI
         LL1T4W6Z3jeB8XFGjrUQNWBEIIoi858ixx0mcKzQO9NF6PIdKEfKw94JpohFdv4kC8XN
         uoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740601513; x=1741206313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CUL9vPYfIsBYwLRgV8qB6RCZqGNjsrfsVU1Ka6aFYBY=;
        b=ihOouMkAlGm2r2zemVXdcv4jyappRCBf6o3p7iqTL27mEebGktcmNCg6GqXfTFmvjt
         OszgjOkAX0A+hbFtZJwKBFFJtH4/OTdJ4AbxbB98HO9jJb+xZM+iDttq3aQZjWpKc1um
         ZOr9LfJkIXN6KpGYPuf70XstV71Xz4bYVInp5g4iwyQv0yKKGmDPdutSd9QSKqWXf+Ff
         KC+XiJfJB6MB9qGkmiw63jZlAbfN+qfZBDb7XqEtZcvJe7z+hl580gnppnQmYlldLc0B
         VITp1Q96ekSOlkosgCCQQ5zKC23sK8HgaevFKQc/DEOwBfTXgTuGJEM/21jwNx4toqG9
         BVIw==
X-Forwarded-Encrypted: i=1; AJvYcCXhj8uPdPMYFymmptvF0tIPbr/5efVgTQVLj0jU0TWdfiYt+B6Asv0MGzvQyI/ltHZHhfvfqGjWubGOWg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe8HYrGlIti0Lzj+AELugYCgKlQ42CD5rzlFi3POtLn7+JzGZW
	aO+hB2XPT5Sa2bKTkmENPwsU/GOsVW6sZuv7fgE5wpi1gj3YAf6XhBjnmX7w7Vg=
X-Gm-Gg: ASbGncuAse965HLexqqJ1iFP0rP9wt+k/Caw7qFFPK+A+F97a+ucA8485WbH4rsFbkc
	ixab1ScFL1Zquwyije4q1D7G0j4kqKHhg+KxXtNmnFuGpdjCYp+luses9ZHe8hF0mbbZ4zqQayE
	n75NF2SBEtTciJPAZSlwc34hc0AeL8XAiwKmRYFd5Os2ZIyJ8imwdYSnNKp9ny7uB/7DDpW0/Q7
	EX7aZ6huvjIg4ZAHpx4QUGEl3h+5H1HzwSYu4JdOdXEVTAwvc4SOO+GUlht2KLr/GkpiOYfmHi9
	vvLcgwCrWpwieGAnsATe7Yz4qs8Hst1DsA/bphU=
X-Google-Smtp-Source: AGHT+IHVxqxBZKHrXRbMLQx94rePhcj/KMG3dvOa85IKXsVDVZmW7p4O5rV92MpOYiz4YyuBZBfk6Q==
X-Received: by 2002:a05:6a00:1828:b0:732:5b10:572b with SMTP id d2e1a72fcca58-734790cbaf5mr13305359b3a.10.1740601513545;
        Wed, 26 Feb 2025 12:25:13 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f7de2sm4100963b3a.106.2025.02.26.12.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 12:25:13 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 26 Feb 2025 12:25:05 -0800
Subject: [PATCH 3/4] KVM: riscv: selftests: Change command line option
MIME-Version: 1.0
Message-Id: <20250226-kvm_pmu_improve-v1-3-74c058c2bf6d@rivosinc.com>
References: <20250226-kvm_pmu_improve-v1-0-74c058c2bf6d@rivosinc.com>
In-Reply-To: <20250226-kvm_pmu_improve-v1-0-74c058c2bf6d@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_122514_491946_917104E3 
X-CRM114-Status: GOOD (  15.60  )
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

The PMU test commandline option takes an argument to disable a
certain test. The initial assumption behind this was a common use case
is just to run all the test most of the time. However, running a single
test seems more useful instead. Especially, the overflow test has been
helpful to validate PMU virtualizaiton interrupt changes.

Switching the command line option to run a single test instead
of disabling a single test also allows to provide additional
test specific arguments to the test. The default without any options
remains unchanged which continues to run all the tests.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c | 40 +++++++++++++++---------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
index 284bc80193bd..533b76d0de82 100644
--- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
+++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
@@ -39,7 +39,11 @@ static bool illegal_handler_invoked;
 #define SBI_PMU_TEST_SNAPSHOT	BIT(2)
 #define SBI_PMU_TEST_OVERFLOW	BIT(3)
 
-static int disabled_tests;
+struct test_args {
+	int disabled_tests;
+};
+
+static struct test_args targs;
 
 unsigned long pmu_csr_read_num(int csr_num)
 {
@@ -604,7 +608,11 @@ static void test_vm_events_overflow(void *guest_code)
 	vcpu_init_vector_tables(vcpu);
 	/* Initialize guest timer frequency. */
 	timer_freq = vcpu_get_reg(vcpu, RISCV_TIMER_REG(frequency));
+
+	/* Export the shared variables to the guest */
 	sync_global_to_guest(vm, timer_freq);
+	sync_global_to_guest(vm, vcpu_shared_irq_count);
+	sync_global_to_guest(vm, targs);
 
 	run_vcpu(vcpu);
 
@@ -613,28 +621,30 @@ static void test_vm_events_overflow(void *guest_code)
 
 static void test_print_help(char *name)
 {
-	pr_info("Usage: %s [-h] [-d <test name>]\n", name);
-	pr_info("\t-d: Test to disable. Available tests are 'basic', 'events', 'snapshot', 'overflow'\n");
+	pr_info("Usage: %s [-h] [-t <test name>]\n", name);
+	pr_info("\t-t: Test to run (default all). Available tests are 'basic', 'events', 'snapshot', 'overflow'\n");
 	pr_info("\t-h: print this help screen\n");
 }
 
 static bool parse_args(int argc, char *argv[])
 {
 	int opt;
-
-	while ((opt = getopt(argc, argv, "hd:")) != -1) {
+	int temp_disabled_tests = SBI_PMU_TEST_BASIC | SBI_PMU_TEST_EVENTS | SBI_PMU_TEST_SNAPSHOT |
+				  SBI_PMU_TEST_OVERFLOW;
+	while ((opt = getopt(argc, argv, "h:t:n:")) != -1) {
 		switch (opt) {
-		case 'd':
+		case 't':
 			if (!strncmp("basic", optarg, 5))
-				disabled_tests |= SBI_PMU_TEST_BASIC;
+				temp_disabled_tests &= ~SBI_PMU_TEST_BASIC;
 			else if (!strncmp("events", optarg, 6))
-				disabled_tests |= SBI_PMU_TEST_EVENTS;
+				temp_disabled_tests &= ~SBI_PMU_TEST_EVENTS;
 			else if (!strncmp("snapshot", optarg, 8))
-				disabled_tests |= SBI_PMU_TEST_SNAPSHOT;
+				temp_disabled_tests &= ~SBI_PMU_TEST_SNAPSHOT;
 			else if (!strncmp("overflow", optarg, 8))
-				disabled_tests |= SBI_PMU_TEST_OVERFLOW;
+				temp_disabled_tests &= ~SBI_PMU_TEST_OVERFLOW;
 			else
 				goto done;
+			targs.disabled_tests = temp_disabled_tests;
 			break;
 		case 'h':
 		default:
@@ -650,25 +660,27 @@ static bool parse_args(int argc, char *argv[])
 
 int main(int argc, char *argv[])
 {
+	targs.disabled_tests = 0;
+
 	if (!parse_args(argc, argv))
 		exit(KSFT_SKIP);
 
-	if (!(disabled_tests & SBI_PMU_TEST_BASIC)) {
+	if (!(targs.disabled_tests & SBI_PMU_TEST_BASIC)) {
 		test_vm_basic_test(test_pmu_basic_sanity);
 		pr_info("SBI PMU basic test : PASS\n");
 	}
 
-	if (!(disabled_tests & SBI_PMU_TEST_EVENTS)) {
+	if (!(targs.disabled_tests & SBI_PMU_TEST_EVENTS)) {
 		test_vm_events_test(test_pmu_events);
 		pr_info("SBI PMU event verification test : PASS\n");
 	}
 
-	if (!(disabled_tests & SBI_PMU_TEST_SNAPSHOT)) {
+	if (!(targs.disabled_tests & SBI_PMU_TEST_SNAPSHOT)) {
 		test_vm_events_snapshot_test(test_pmu_events_snaphost);
 		pr_info("SBI PMU event verification with snapshot test : PASS\n");
 	}
 
-	if (!(disabled_tests & SBI_PMU_TEST_OVERFLOW)) {
+	if (!(targs.disabled_tests & SBI_PMU_TEST_OVERFLOW)) {
 		test_vm_events_overflow(test_pmu_events_overflow);
 		pr_info("SBI PMU event verification with overflow test : PASS\n");
 	}

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
