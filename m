Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FD1C07C79
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 23:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VgD1+1LiXubw7imDQ68l9AdGyf1OVUES5kvmFKXjc3c=; b=1rxbwEYiiJfZom
	l8LY5Vop9uQuoa8KSBsvHS0YzinH1V6oPpUs76Fl0xoYuGhtfnA3vtOXTaPgSz28/S1t1mvL0ok7G
	PlV9f/p6S8ZUd9WGM5PXbJz8p1Q62ZLJ0tBkhhfvn4S0OBSsxkWisLF+bMgB2LuNdy1ujR5hnAIco
	ZkLv6xVhfBEhbRNAtNJ59upmUDrrJBstJ7/dGxuNcgjwzd4EOdKsUwdQ3EkYbhTnPJmUOYE4xHXZq
	tGwEckjh1Ff8sEnS4Ln8MbKd0Aab8YsOAYyhHg1mdeEOAVi/sE75lk/KvVSTTnrqFCv3RZ7ujZEfb
	PR+NQPMBWLRHEXrVWQLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxzi-00000007KZN-32QU;
	Fri, 19 Apr 2024 23:50:14 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxy0-00000007J6J-3jIB
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 23:48:33 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1e2c725e234so28949575ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 16:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713570508; x=1714175308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8dppvgVnh54sEjPJluz+VPGn0XVIgbI5aDFYcuHKMk=;
        b=e3/P7yRXpg8WfeI6KiycwM6MZVUhzRCAQ36NtSu4MldD16eIpgvIGlj08yWerLvfQn
         3mf6O0HUNj+LxJPZtNuGIVEFSiFkYmGKhuTSJOcICNhoOgqDpmOOdpKxCEtrZIUTsm0c
         oYUEm0RDeHhdl7aAitS6x8eYFMjLgv2oLkW1nKXQOax5rlmzPtg7fWZnNJYjzDaG94IN
         +UltRVXsbSPvLNVydopsi59xv++AytfSY8TUefzAo78pBOPjurAVL+USA5s0CN4oJUL9
         xTJ24Epd5mREtGS6WiJjfAOWQjWtJ6yIGEVVStZuyfbdqSF6FhMKtia6v/dq0JERCrLY
         Srlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713570508; x=1714175308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k8dppvgVnh54sEjPJluz+VPGn0XVIgbI5aDFYcuHKMk=;
        b=fkpjtC94zKqWI5tP+lDk3JO343vV5in0Uj/IEmKpAuqXhGxRNywOqcbpEAjxcHgH/v
         0cfCU1MBdITdFQogLzTErFdsGSBsB1jSZcI/dPKE+31pJ6D2Bp0enuOUEfJmiG6tcwQt
         GU2oCJM14jgDH65yYc+X4gbN3Sp0hRHCBKtDm48rVsEQ3Rup0SJPNULQ+PRIfH97m76I
         /CGuyAMGSOWvNUqOvXssn0DLQSyjv0Ivg/+pFEGoQh3oiQW6T1woTXMbNqEB+Du5kVSD
         8IH1Qj8SQves6ddcHfvu/3Y77IaVVgUi6lffCBxWBihwz6f5Y7sPULdqc81q1f0F4R5i
         I4lg==
X-Forwarded-Encrypted: i=1; AJvYcCWRuYiL8fXKwmwZ37JwXz8yarKuXMUiAHFAHDPcAlDoKAOjDq3KvgjdR6UxlWrjQ7xVPw+U+FqudNezWOv/EWhY6iHeOtI6kuTV+nny2V1D
X-Gm-Message-State: AOJu0YxhmhIFARwGsCLTQOFK4VFvpNxTkNc4G1VnfcKHsokS24YWdY2c
	C4vD79OoTk/VMsKh03PGOotLtTjHVo8iHBOfiLdo+QarIUOFB2Bfj2rOzVFCQsY=
X-Google-Smtp-Source: AGHT+IHbjuIAogidEThPU7h7cHQTwDfEmDJ2h82WDXmnVpxSpsttceYeTWH4EZKWjzfHpnNFMkjLQg==
X-Received: by 2002:a17:903:41ca:b0:1e0:9964:76f4 with SMTP id u10-20020a17090341ca00b001e0996476f4mr5588251ple.14.1713570508238;
        Fri, 19 Apr 2024 16:48:28 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id w17-20020a170902d11100b001e42f215f33sm3924017plw.85.2024.04.19.16.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 16:48:27 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	samuel.holland@sifive.com,
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
Subject: [PATCH v8 24/24] KVM: riscv: selftests: Add commandline option for SBI PMU test
Date: Sat, 20 Apr 2024 08:17:40 -0700
Message-Id: <20240420151741.962500-25-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240420151741.962500-1-atishp@rivosinc.com>
References: <20240420151741.962500-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_164829_273998_B7CAC0A4 
X-CRM114-Status: GOOD (  13.39  )
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
