Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BF4C19776
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 20:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ljVZyvnxz7rBIWOWGWthDB7+WwDF/hSkfvxJau7I2RE=; b=bYRD7p0W7Z/8/6
	b5OKgkZLgqqCPBmus0Jo/HxdhDWkrce0YNrx1EFp+pdUSf2EJkw9nrd87dEFhMn6dxBXWm5vhEjnS
	4NlYC4Q8WFjOZIcCn6LZtw6S9oxPZSoElvSx/893YSibyLqKHc8ET/P0pL8WmvbedbLCzT0v+d6RA
	ZevOa9+xoIWr++pdaUVyFbxQTUZfIt+Gon67uxcrrdzmeIy/Lo7Ktx94UHMXyXcExcUxhcX+hDVb6
	TJUOU0tspWM/xfdAr3+FGP4CiVTZJT1NyYNHVZcQyJVU6sfEBeH7oJChmNS6C64WXvhehtKWmIESs
	+ZB3kuUbQQ0a4fCZ01Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnO1E-00000005LGB-0h9d;
	Wed, 26 Feb 2025 20:28:36 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNxz-00000005KSV-0Euf
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 20:25:16 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-22328dca22fso2348315ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Feb 2025 12:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740601514; x=1741206314; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+xf5rb3O3ZrwcS1pmKysmwXefhXbLuGjQJfAu9gHOI=;
        b=dXeIdpkCePzWenDydTTLOy7FUhFTAR9lXw83tlUuwbuXzMtyJoXoq/FqZeinDZQ0Gv
         lvb16e2gkbyNYqmQg2ryNJAi1wLMUIc8AuYWk72tTTo7K7z2dU2bqKq6SjA2Wwa5dye+
         uBVOulcSfOFxa7Hc2n2Bx3xjbrvIZOhaDT2/U8NOMtLHJhdeIpQHjyz/RB/XZAB0Q8Pf
         AEwut6THsLtCrxaVtxSAbYCTz17IRTCce10tdVAPa/6h43dNS4K/TB37tTAqjxmdga+5
         dttFo8PG/xGP2o2h9CSaE5acnVZe1zLNiNTK6Zssejbl4JT/c6ycSnSXOHkMswjNTWH1
         Y2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740601514; x=1741206314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+xf5rb3O3ZrwcS1pmKysmwXefhXbLuGjQJfAu9gHOI=;
        b=iLSDsHx5FbYecFm7pIyrBOjhudBqw5hiFVF48fDfmPwAVIGO+jM0b2R0gVlSb6PQ6q
         UlEYHAt/g/yay6LGN7GTM7rpnr5u0BLLrY5RCD8eqqLBHNYsBqd05fl4mDYzGZxGnz0U
         mideUkcLUjut0pf7QwFjZK6lNvnkLOhPUoJd86UMtZ2wRk9HsIkI9oNh7hd+avskyGpB
         De5jGZQHtLAz+usug4gXE6UNVq1HGBGvCvmhRdw8B4eUq7tZ/jJxni31WAxh0BIxtRF9
         2AYZOlCn/uS9gyiTJP/fmQWbNpiMy9ejhkFAl611PS79eGZIf+Gfs2UNgwhP20uMk9IA
         zpAg==
X-Forwarded-Encrypted: i=1; AJvYcCVBf+09X7gCVaAasww7WzYcBBMH40ISvJWDoEjqyP5aSdSJDTsfvFI3llmBybGrkMuk/BUmWjXqgll12Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt7mxYehZZtIMPKzzk72MbfRg9pkrcNaVBcfWTR0jor7MqiLOw
	rwCFT57bQlNv7d40bTOeUEapP27GUNsjeWgFLl0z4AP+nWQMw2uqx6O8737sR04=
X-Gm-Gg: ASbGncuiNoKLmq5paEWButLro/Qjz0s5/PJKNJePK1Fn6zDnBro7mBXp1aEr4cQ9xpE
	f7nl+oV3iWrRNhjYgQbeCbvgXDwtyYz7jOAnDTTfn+X2je6mI9IbN/2HWAJ3DHi1IQo7MXmu5Rr
	ewp0RWXErYc6i8gdJjH5OcHvNTkH8psoVKkjT1T64wcwcWUTNOKfAg773RhDvizpXo7Coo8W31G
	vdsWm4EsbdNWn0vVjdWm6+lUY2BS+zc9Ptrr6T99xxxg+E5M4MNAI7ImKCN+ZlSCbcuT6NCCDCp
	W1PXo0PQnFJFlqecut3tgch2KyXAI26yUJv/oi4=
X-Google-Smtp-Source: AGHT+IHw0vBB+PSny2qMliUf6DTVa+ZvGcPh/rPnK0tt+c9UR1fNAKJeSn8VDRagyarmbZCnK8Ejgg==
X-Received: by 2002:a05:6a00:a26:b0:72d:3b2e:fef9 with SMTP id d2e1a72fcca58-734791aa184mr14536500b3a.20.1740601514558;
        Wed, 26 Feb 2025 12:25:14 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f7de2sm4100963b3a.106.2025.02.26.12.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 12:25:14 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 26 Feb 2025 12:25:06 -0800
Subject: [PATCH 4/4] KVM: riscv: selftests: Allow number of interrupts to
 be configurable
MIME-Version: 1.0
Message-Id: <20250226-kvm_pmu_improve-v1-4-74c058c2bf6d@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250226_122515_103145_FCBAAE57 
X-CRM114-Status: GOOD (  18.19  )
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

It is helpful to vary the number of the LCOFI interrupts generated
by the overflow test. Allow additional argument for overflow test
to accommodate that. It can be easily cross-validated with
/proc/interrupts output in the host.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c | 36 ++++++++++++++++++++----
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
index 533b76d0de82..7c273a1adb17 100644
--- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
+++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
@@ -39,8 +39,10 @@ static bool illegal_handler_invoked;
 #define SBI_PMU_TEST_SNAPSHOT	BIT(2)
 #define SBI_PMU_TEST_OVERFLOW	BIT(3)
 
+#define SBI_PMU_OVERFLOW_IRQNUM_DEFAULT 5
 struct test_args {
 	int disabled_tests;
+	int overflow_irqnum;
 };
 
 static struct test_args targs;
@@ -478,7 +480,7 @@ static void test_pmu_events_snaphost(void)
 
 static void test_pmu_events_overflow(void)
 {
-	int num_counters = 0;
+	int num_counters = 0, i = 0;
 
 	/* Verify presence of SBI PMU and minimum requrired SBI version */
 	verify_sbi_requirement_assert();
@@ -495,11 +497,15 @@ static void test_pmu_events_overflow(void)
 	 * Qemu supports overflow for cycle/instruction.
 	 * This test may fail on any platform that do not support overflow for these two events.
 	 */
-	test_pmu_event_overflow(SBI_PMU_HW_CPU_CYCLES);
-	GUEST_ASSERT_EQ(vcpu_shared_irq_count, 1);
+	for (i = 0; i < targs.overflow_irqnum; i++)
+		test_pmu_event_overflow(SBI_PMU_HW_CPU_CYCLES);
+	GUEST_ASSERT_EQ(vcpu_shared_irq_count, targs.overflow_irqnum);
+
+	vcpu_shared_irq_count = 0;
 
-	test_pmu_event_overflow(SBI_PMU_HW_INSTRUCTIONS);
-	GUEST_ASSERT_EQ(vcpu_shared_irq_count, 2);
+	for (i = 0; i < targs.overflow_irqnum; i++)
+		test_pmu_event_overflow(SBI_PMU_HW_INSTRUCTIONS);
+	GUEST_ASSERT_EQ(vcpu_shared_irq_count, targs.overflow_irqnum);
 
 	GUEST_DONE();
 }
@@ -621,8 +627,11 @@ static void test_vm_events_overflow(void *guest_code)
 
 static void test_print_help(char *name)
 {
-	pr_info("Usage: %s [-h] [-t <test name>]\n", name);
+	pr_info("Usage: %s [-h] [-t <test name>] [-n <number of LCOFI interrupt for overflow test>]\n",
+		name);
 	pr_info("\t-t: Test to run (default all). Available tests are 'basic', 'events', 'snapshot', 'overflow'\n");
+	pr_info("\t-n: Number of LCOFI interrupt to trigger for each event in overflow test (default: %d)\n",
+		SBI_PMU_OVERFLOW_IRQNUM_DEFAULT);
 	pr_info("\t-h: print this help screen\n");
 }
 
@@ -631,6 +640,8 @@ static bool parse_args(int argc, char *argv[])
 	int opt;
 	int temp_disabled_tests = SBI_PMU_TEST_BASIC | SBI_PMU_TEST_EVENTS | SBI_PMU_TEST_SNAPSHOT |
 				  SBI_PMU_TEST_OVERFLOW;
+	int overflow_interrupts = -1;
+
 	while ((opt = getopt(argc, argv, "h:t:n:")) != -1) {
 		switch (opt) {
 		case 't':
@@ -646,12 +657,24 @@ static bool parse_args(int argc, char *argv[])
 				goto done;
 			targs.disabled_tests = temp_disabled_tests;
 			break;
+		case 'n':
+			overflow_interrupts = atoi_positive("Number of LCOFI", optarg);
+			break;
 		case 'h':
 		default:
 			goto done;
 		}
 	}
 
+	if (overflow_interrupts > 0) {
+		if (targs.disabled_tests & SBI_PMU_TEST_OVERFLOW) {
+			pr_info("-n option is only available for overflow test\n");
+			goto done;
+		} else {
+			targs.overflow_irqnum = overflow_interrupts;
+		}
+	}
+
 	return true;
 done:
 	test_print_help(argv[0]);
@@ -661,6 +684,7 @@ static bool parse_args(int argc, char *argv[])
 int main(int argc, char *argv[])
 {
 	targs.disabled_tests = 0;
+	targs.overflow_irqnum = SBI_PMU_OVERFLOW_IRQNUM_DEFAULT;
 
 	if (!parse_args(argc, argv))
 		exit(KSFT_SKIP);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
