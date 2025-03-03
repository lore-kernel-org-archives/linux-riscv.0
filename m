Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D482C282D0
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 22:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NsFgeJoNMw6zhif2yd6c7Q9WJQBXNUk69M/89m6RsmI=; b=kXvBWEKvwuaQIr
	rHHQJ6Bz0laFLDovX4TnE7qEF1vSJWXDvodEEoBRctBgL43BbGCiD4z/iztgSOZ6dzGOI1sqcTJLP
	LlTWt5Bj97S02TVbg1cE7pQZVZKKHHyf1Lv7SrT4Ce1uBlbNtwEGN8Ct4bUy+c8zJq3r0S31nT6Ed
	09tbXsQoN/3eTtFrmYj8HCLk4Te3+9x/hjVrGT2i0Dh4TTzibA7gNRzRvLfmIkU7hX/PDV0++RRE5
	z87ofAn8cCkqZItl1vDQvt0RGuq3jQ1AOYdJszZq6eWxLjb0hAHELuOPgIDSGuwuDVIH/7dEuSvnn
	SaPE6Z9q+DPjE6f8ckkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpEf1-00000002W33-2SS0;
	Mon, 03 Mar 2025 22:53:19 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpEey-00000002Vxp-03U7
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 22:53:17 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-22374f56453so82803475ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Mar 2025 14:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741042395; x=1741647195; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSJ9VliM2a+aTryqldG0CH+Q28sfdpKDs8cwc/DPQU0=;
        b=SK9bzEOvlJ/WgfCCYl0a6q/GLS8bSqZ5yKU9MZ2M2HsP5v8n3WZqvu4PO7QAJLcBGO
         2rNseWsGP+YfIJjrhcnTli1S7baePrUijmOSHkFoxt4RdDQ/pHNmQzXCV6Vi11JuDfKg
         DxqJAfh5Z/DBen7g1iXt0NFtithVgmhSoAiCmya3TdytTA/zRNOOWCSMGk+o+yjqwvLQ
         OKKZjp98tmuWQbKng5p+DFhPDKXFwQPSEwipb0ZQDRXqnlnGdwPLvh4CXidbe37MFl43
         OByuxsoFtCsIj2YtdWvvW2VYMrWtzFlZOII5qezsFvhqC2FEMirQVvLULVK0cQkC3i1Z
         5aTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741042395; x=1741647195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSJ9VliM2a+aTryqldG0CH+Q28sfdpKDs8cwc/DPQU0=;
        b=nLm4o472kthjdnc4GK71YMDxqoJisftYkVBf3dulXAjwFF2RyvyFI+6OmkvBVG6Ssi
         pIt5ANA5PGpsYPM6dfJnkzDjEbnDJ6z23fghUU/vOvZQSh5lH4IBKLPfg8ETHu8T6YZK
         eqfmkYhZFjslm5FGMN35vhfrnJgqPg/ZGVE+PvHMvmzshNcFiqhG68q5wzzr+iQUi1tY
         /kbg9/RIimfKyZJaCIlkUZ5XUvm+xJ/C7SBmaQy673WOFfvvqsS/sf4KeJ0Xr3EapSUA
         wFThpJ/dDN04rVcaP2WroONUI9WotuljJA++dnyZaIzbviR4lZzx2QkDvbn9oHxd4MFF
         oqbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKZhBJHod6kAne+G65FGaefvrRk6Spaf7XMkf7A1ak2HUExK6Tb6BuEiiP8OrGoekmeO1pKYIjRGoqzg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNIpVgWPHmZWQgzesZeQG9vV10PqOtuBkcSZm20nV7QsGj1SBv
	7as6QJue5Tn1ltD/Aa8jBQtf7ETFE5SxcBPNCJVqFy7nZ6EPQJY6mJoKtmXZVrg=
X-Gm-Gg: ASbGncuNIHKGfwI7Ii/9n5afEYC4JIWeQsIRE8pdOZ32QWNA6K1c/Xin9h8N1NU2ZJB
	+dB37VhEDUyPdKNkuoSh6ggaWX3ih4Hs4cAatb3Ymu//rQrqPCgPbat2yvOhXpPv/leZFu34Jvi
	ACGa+iOFgN4EfkwAmwjgGudWTaUEt/1ll93nDeeRFjA8Ncr5NtN/3Bz18c8u4eD1PV/8MzoA71h
	4Ai5G6tqwT0l2k263DNcaBC3TaC4jpkBo2GqApL2yHOM7iTU9QB68TPZpM9xzok7plbyNSN8b3z
	aRRp8o0j+55rs/A0iFlw9u5hDvJACklOtrhi9gqy3/upwrlHlPhRA9hw4A==
X-Google-Smtp-Source: AGHT+IFgJxk7LwSBEIbBrY7Dr1CLOJZk/TMcnbzG8visvcRF+/r9iXWzrvGMz6kqm+x+c1jOver7mQ==
X-Received: by 2002:a05:6a00:244d:b0:736:5504:e8af with SMTP id d2e1a72fcca58-7365504e9edmr9350148b3a.24.1741042395376;
        Mon, 03 Mar 2025 14:53:15 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a003eb4fsm9440601b3a.129.2025.03.03.14.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 14:53:15 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 03 Mar 2025 14:53:08 -0800
Subject: [PATCH v2 3/4] KVM: riscv: selftests: Change command line option
MIME-Version: 1.0
Message-Id: <20250303-kvm_pmu_improve-v2-3-41d177e45929@rivosinc.com>
References: <20250303-kvm_pmu_improve-v2-0-41d177e45929@rivosinc.com>
In-Reply-To: <20250303-kvm_pmu_improve-v2-0-41d177e45929@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_145316_095632_4804ADBD 
X-CRM114-Status: GOOD (  15.56  )
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

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c | 40 +++++++++++++++---------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
index 284bc80193bd..de66099235d9 100644
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
+	while ((opt = getopt(argc, argv, "ht:")) != -1) {
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
