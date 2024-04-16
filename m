Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D0DC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 18:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VgD1+1LiXubw7imDQ68l9AdGyf1OVUES5kvmFKXjc3c=; b=m1cs1YaaA2NUs4
	6LZkSs0QZwd5S0M+dkThTOGCPi+k5qSUP/0XE144yOA5TX9ZZo7OhG6x2JHxLjirqboFgtzREK6en
	Hj4frTr9NwRq67ucMuQcU17GnDImXZiBldoq0JfZfn55rLeT4ZHdzURGauGQlVb8bIILz7fL4gfHu
	GAsR6gQNvCPhcw2/K152fuxPMHzp1VyD4DLRsdVAN6FgwYOlEq6w+F8AzuuC92SXoPaRuz2ixlPmm
	KabrB6HM4AviesKLDY0rdHeybBsXQpMUFv1UyEACxzSMv4DLfj1GoQUZFZNIMPClPJuxlG0f1+D/S
	fea5qU/EKIg7HJunnDdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnps-0000000DODg-318P;
	Tue, 16 Apr 2024 18:47:16 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnnw-0000000DMch-1vxl
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 18:45:23 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2a2d248a2e1so48783a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 11:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713293116; x=1713897916; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8dppvgVnh54sEjPJluz+VPGn0XVIgbI5aDFYcuHKMk=;
        b=f1oVQxnGu00S/P+A5hXedH2SAIwVEK9SAMMLcoN7YcfAhjUhSDLa7zNc5PbN94hU51
         SNXnfhB1cBcfWfPDy+/i1r4qqcON5RfxK5RIaxhcbueLd5ClfEWAUiTRNpGqo3PVT1A4
         vRJJBhWC4/sYw5J6qwpydmeiiooukEdt4cv3kLYzVOMmMGsuUWn7v3RUJ3zrFX1iOWv7
         +mscuI6JTra1M9ado4DDVEAprIfZtOSqO1IQaERGMfAqOaVOt2Q9b2W8ASESoAaqNCtt
         QbVaFOlQsCshBfJTcViXvNXuRSZww9ki81Zfh6tPb8spEFbqlPYFNMounACxIVFzOZ2H
         dHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713293116; x=1713897916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k8dppvgVnh54sEjPJluz+VPGn0XVIgbI5aDFYcuHKMk=;
        b=BEX9Vg+1NVvnDie/cSf83GoJPQo7jwDzeMqjiED/X0FNml/O5qWDB4rxUErxDPYznI
         JMN9s6tY2ldsZUzLYOP4TwmhV19hYTNStzWUP5tIPtAqhR5G9ePfNs3hvnrYr4HN60nr
         QpbUM6OqXZk/3YBNUR/sr4syRuAJTwNe/seToJewNOhvcCBFkTCzA+RTOAxbyK+3i7XQ
         KQXrv+oRM7hBaMEghVxXmj6Z7RRrSBYVGEPv7VjwyBJ7i/CDGPaUCAsoULMqYu74/0Q4
         5c1OHa+8XPtBTL6jbdGZkDVftXRNjssn+DER+Ya7ajAR0AN5tbzw0/Am8rim0a2A8MPm
         4OQg==
X-Forwarded-Encrypted: i=1; AJvYcCXnEplMQcIx85n83jZEf/vScz/CZCfogaR4vEebHNoyrYak5pERGOl2Nae+E5B3ZnFcj8IS9rKWXEAARdjXMu7da5O62+tmfqGooHQeAeIs
X-Gm-Message-State: AOJu0Yy2DFB+jJOYaQIZHheNQlIosI6+Xk2MYuWdrVrCnPvf9Mn3MR4p
	XHfEdvX0iL7OxO/29KEgfwZqw54lwBbIwZe7MMaQIuBtJXhHR1Yvmeq5CfUNUZw=
X-Google-Smtp-Source: AGHT+IHzc2MYBxQtrmJtlm+A3Ba+b1xBo3biutdeONIY5AZoPZgv68J1XHzbTpk7PKvAcyeeK8RTRQ==
X-Received: by 2002:a17:90b:1a88:b0:2a2:faf4:71da with SMTP id ng8-20020a17090b1a8800b002a2faf471damr4887452pjb.10.1713293115724;
        Tue, 16 Apr 2024 11:45:15 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id o19-20020a17090aac1300b002a269828bb8sm8883645pjq.40.2024.04.16.11.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 11:45:15 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Juergen Gross <jgross@suse.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	virtualization@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v7 24/24] KVM: riscv: selftests: Add commandline option for SBI PMU test
Date: Tue, 16 Apr 2024 11:44:21 -0700
Message-Id: <20240416184421.3693802-25-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416184421.3693802-1-atishp@rivosinc.com>
References: <20240416184421.3693802-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_114516_764898_B0D43BB4 
X-CRM114-Status: GOOD (  13.35  )
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

SBI PMU test comprises of multiple tests and user may want to run
only a subset depending on the platform. The most common case would
be to run all to validate all the tests. However, some platform may
not support all events or all ISA extensions.

The commandline option allows user to disable any set of tests if
they want to.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 .../selftests/kvm/riscv/sbi_pmu_test.c        | 73 ++++++++++++++++---
 1 file changed, 64 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
index 0fd9b76ae838..69bb94e6b227 100644
--- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
+++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
@@ -33,6 +33,13 @@ static unsigned long counter_mask_available;
 
 static bool illegal_handler_invoked;
 
+#define SBI_PMU_TEST_BASIC	BIT(0)
+#define SBI_PMU_TEST_EVENTS	BIT(1)
+#define SBI_PMU_TEST_SNAPSHOT	BIT(2)
+#define SBI_PMU_TEST_OVERFLOW	BIT(3)
+
+static int disabled_tests;
+
 unsigned long pmu_csr_read_num(int csr_num)
 {
 #define switchcase_csr_read(__csr_num, __val)		{\
@@ -608,19 +615,67 @@ static void test_vm_events_overflow(void *guest_code)
 	test_vm_destroy(vm);
 }
 
-int main(void)
+static void test_print_help(char *name)
+{
+	pr_info("Usage: %s [-h] [-d <test name>]\n", name);
+	pr_info("\t-d: Test to disable. Available tests are 'basic', 'events', 'snapshot', 'overflow'\n");
+	pr_info("\t-h: print this help screen\n");
+}
+
+static bool parse_args(int argc, char *argv[])
+{
+	int opt;
+
+	while ((opt = getopt(argc, argv, "hd:")) != -1) {
+		switch (opt) {
+		case 'd':
+			if (!strncmp("basic", optarg, 5))
+				disabled_tests |= SBI_PMU_TEST_BASIC;
+			else if (!strncmp("events", optarg, 6))
+				disabled_tests |= SBI_PMU_TEST_EVENTS;
+			else if (!strncmp("snapshot", optarg, 8))
+				disabled_tests |= SBI_PMU_TEST_SNAPSHOT;
+			else if (!strncmp("overflow", optarg, 8))
+				disabled_tests |= SBI_PMU_TEST_OVERFLOW;
+			else
+				goto done;
+			break;
+		case 'h':
+		default:
+			goto done;
+		}
+	}
+
+	return true;
+done:
+	test_print_help(argv[0]);
+	return false;
+}
+
+int main(int argc, char *argv[])
 {
-	test_vm_basic_test(test_pmu_basic_sanity);
-	pr_info("SBI PMU basic test : PASS\n");
+	if (!parse_args(argc, argv))
+		exit(KSFT_SKIP);
+
+	if (!(disabled_tests & SBI_PMU_TEST_BASIC)) {
+		test_vm_basic_test(test_pmu_basic_sanity);
+		pr_info("SBI PMU basic test : PASS\n");
+	}
 
-	test_vm_events_test(test_pmu_events);
-	pr_info("SBI PMU event verification test : PASS\n");
+	if (!(disabled_tests & SBI_PMU_TEST_EVENTS)) {
+		test_vm_events_test(test_pmu_events);
+		pr_info("SBI PMU event verification test : PASS\n");
+	}
 
-	test_vm_events_snapshot_test(test_pmu_events_snaphost);
-	pr_info("SBI PMU event verification with snapshot test : PASS\n");
+	if (!(disabled_tests & SBI_PMU_TEST_SNAPSHOT)) {
+		test_vm_events_snapshot_test(test_pmu_events_snaphost);
+		pr_info("SBI PMU event verification with snapshot test : PASS\n");
+	}
 
-	test_vm_events_overflow(test_pmu_events_overflow);
-	pr_info("SBI PMU event verification with overflow test : PASS\n");
+	if (!(disabled_tests & SBI_PMU_TEST_OVERFLOW)) {
+		test_vm_events_overflow(test_pmu_events_overflow);
+		pr_info("SBI PMU event verification with overflow test : PASS\n");
+	}
 
 	return 0;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
