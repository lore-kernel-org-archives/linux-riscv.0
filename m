Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53963CD11C2
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 00:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5i7A55VetpQ+8RaKDZI+nxKe83wjIvTzfo9Hliuj5Rk=; b=IBT3bW4F5J+7m/
	XnnyH2ubRtqnQ5qbHG+SCuxu2z/IJG16eY4nkBhIBtkTFzYmpjPzrZqOHWKZBECn5rLhLHsCAMoNz
	VHg8OOiwrm9+Y8Q0orp3bMNRQpX4gXXHAP6bFsYrrwG8izuiwhXnr0bz1P8pjlJBglOX/HJOBXOQv
	9kFx0uRrPu0YSgEG/noSJxTPA82akK9pKEs22IB3EzrV2xMGSzoi45x/DnXzCuuEHA7HMgZg+0jEv
	rVm6+2ukgQMpd0MmvvZi69d2anR4HET4JDGPYFFjh2wXVF0nR/KQhknvxrn+tH8AkTlXmcrzP6BOZ
	orlTpLSRK9WFgxpIdq9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rui1v-00000009buU-3ogb;
	Thu, 11 Apr 2024 00:11:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rui0S-00000009ae1-0VSz
	for linux-riscv@bombadil.infradead.org;
	Thu, 11 Apr 2024 00:09:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tLia834y+X9tlrjVFjCEV4aQslhHW6gNjSHeO9Lbrys=; b=AEIMicaXMKFJq9GIAxOMI0daUi
	sP8z0hMYYjt8SuqxvdVVBxFmFpo2cjREArgbi7TSRgOAmVrxyG9CSn4TEuICklzVwFkmJN9S96px/
	RZabZb1ITbJVAxJKNi7TL1vBCpgfj/P3ok6gM3/9e3xT+my0CmEk1qVkALArf4srkCOs8H5ZZkQ6U
	SvY4ktTVoIomaXIaFM8+6ugmhliXjwXSKEATjC1HPAgVmjthpAQhQ6BBx6WoqAv+TIAqnEWB3hWvY
	24lQ36n2fzihKz5e404xAR8jNV96uk7otBHzH/AdIY4vZ5ZoQixGyD9Djy4QsyQliUNtjmneuSL/K
	+G7DZeCg==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rui0G-00000008K4v-0BZL
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 00:09:26 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1e0bfc42783so62298065ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 17:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712794152; x=1713398952; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLia834y+X9tlrjVFjCEV4aQslhHW6gNjSHeO9Lbrys=;
        b=XhtGqlD/dUJ5IZhh35FRrdxFcoRfFbwGOb14Ukj3EuWQyQNdDs9ZieJun55BawTq2b
         pqWGIhQ+SxRCg0FUMWyxKUBMJFM10TDvXS1NgvMSXc6mnl+seVg7AjEsm+Mdcb1AGCc8
         MMm3I3U5ppnK3VEv2CD+F/XfiXK/SFEHb1mV1eL4Z0VFEAT4GH9GZRXEVZxXMfa2liOy
         0FEAmffSZe1Py605mKVKLyOZDzjVxkDhSotc0rvOJOeVbihP0Pcfh4Q5UP5RL8TH4G1K
         JJjmsYdwaH8GoGDOCjTr3tMQw5NdrhDJSrUfTUblvsCjl/5/1Vo2HlzQuAGfuby2Vgsb
         oyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712794152; x=1713398952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLia834y+X9tlrjVFjCEV4aQslhHW6gNjSHeO9Lbrys=;
        b=s2Cc0Ugl3mjGT0k2pMBV6G+N0fytI4wFdpuX9dNjm1kwqYP/HpMx6eiluTRAQAKVHO
         2+oZ1oa1lcQrQFD47Fp1YplQ9jSLmoO2uxAzVb7I4ANvkEeLCX373Cb7hIL4Udb0bcR5
         GbNjmX2b/xWPiubt7r/KIc2w34FDrpbN3hmGzOHGTEyM80mPf2hlPcNNixb5uLm3Q4OO
         M5h+AfmC0L59ZelzKuegyVXv8Y7JXG+JbgzrHQlSY8ZN9Saw1L6u8K33K95OCDb9kGff
         qJwzaeU/dTj4+s2ql5BD3GdcLOYGIfoRgegkbIUS0LyUc/U1cu8kE8n4ErrcvdL/7gyK
         vNjw==
X-Forwarded-Encrypted: i=1; AJvYcCVPxgNGjxjPkXvFQp07YTEFaq0kvRuA6XlThMVAVF3GFn5yYi0V/nJqWcD/QLWJ6dg3bJCcG+MZVt4BZGmcDtcUaq1/mIpQfcROFEyempkS
X-Gm-Message-State: AOJu0YxQhiCkXj5RfxlevjKFbNbdsreRGyoHE6oG80kKdfoLPv1iWRUE
	6dTzxXwy731a+AddgqYSRf4vYpwaVK27SS1xD52vmXpxfTpSD/8tLmHOl5hwLFM=
X-Google-Smtp-Source: AGHT+IEBm3O3QxbfldIjrwscHpX7a8J2zp8FjCH5WuQpHu2gdn7/EG4AoSaaS2YDQBteQAhuqRWwog==
X-Received: by 2002:a17:902:eb88:b0:1e5:5559:c4a7 with SMTP id q8-20020a170902eb8800b001e55559c4a7mr85239plg.51.1712794152327;
        Wed, 10 Apr 2024 17:09:12 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902684700b001e3d8a70780sm130351pln.171.2024.04.10.17.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 17:09:11 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
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
Subject: [PATCH v6 24/24] KVM: riscv: selftests: Add commandline option for SBI PMU test
Date: Wed, 10 Apr 2024 17:07:52 -0700
Message-Id: <20240411000752.955910-25-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411000752.955910-1-atishp@rivosinc.com>
References: <20240411000752.955910-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_010921_166390_F069FE85 
X-CRM114-Status: GOOD (  13.62  )
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

The commandline option allows user to disable particular test if they
want to.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 .../selftests/kvm/riscv/sbi_pmu_test.c        | 77 ++++++++++++++++---
 1 file changed, 68 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
index 0fd9b76ae838..57025b07a403 100644
--- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
+++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
@@ -33,6 +33,16 @@ static unsigned long counter_mask_available;
 
 static bool illegal_handler_invoked;
 
+enum sbi_pmu_test_id {
+	SBI_PMU_TEST_BASIC = 0,
+	SBI_PMU_TEST_EVENTS,
+	SBI_PMU_TEST_SNAPSHOT,
+	SBI_PMU_TEST_OVERFLOW,
+	SBI_PMU_TEST_MAX,
+};
+
+static int disabled_test_id = SBI_PMU_TEST_MAX;
+
 unsigned long pmu_csr_read_num(int csr_num)
 {
 #define switchcase_csr_read(__csr_num, __val)		{\
@@ -608,19 +618,68 @@ static void test_vm_events_overflow(void *guest_code)
 	test_vm_destroy(vm);
 }
 
-int main(void)
+static void test_print_help(char *name)
 {
-	test_vm_basic_test(test_pmu_basic_sanity);
-	pr_info("SBI PMU basic test : PASS\n");
+	pr_info("Usage: %s [-h] [-d <test name>]\n", name);
+	pr_info("\t-d: Test to disable. Available tests are 'basic', 'events', 'snapshot', 'overflow'\n");
+	pr_info("\t-h: print this help screen\n");
+}
 
-	test_vm_events_test(test_pmu_events);
-	pr_info("SBI PMU event verification test : PASS\n");
+static bool parse_args(int argc, char *argv[])
+{
+	int opt;
+
+	while ((opt = getopt(argc, argv, "hd:")) != -1) {
+		switch (opt) {
+		case 'd':
+			if (!strncmp("basic", optarg, 5))
+				disabled_test_id = SBI_PMU_TEST_BASIC;
+			else if (!strncmp("events", optarg, 6))
+				disabled_test_id = SBI_PMU_TEST_EVENTS;
+			else if (!strncmp("snapshot", optarg, 8))
+				disabled_test_id = SBI_PMU_TEST_SNAPSHOT;
+			else if (!strncmp("overflow", optarg, 8))
+				disabled_test_id = SBI_PMU_TEST_OVERFLOW;
+			else
+				goto done;
+			break;
+		break;
+		case 'h':
+		default:
+			goto done;
+		}
+	}
 
-	test_vm_events_snapshot_test(test_pmu_events_snaphost);
-	pr_info("SBI PMU event verification with snapshot test : PASS\n");
+	return true;
+done:
+	test_print_help(argv[0]);
+	return false;
+}
 
-	test_vm_events_overflow(test_pmu_events_overflow);
-	pr_info("SBI PMU event verification with overflow test : PASS\n");
+int main(int argc, char *argv[])
+{
+	if (!parse_args(argc, argv))
+		exit(KSFT_SKIP);
+
+	if (disabled_test_id != SBI_PMU_TEST_BASIC) {
+		test_vm_basic_test(test_pmu_basic_sanity);
+		pr_info("SBI PMU basic test : PASS\n");
+	}
+
+	if (disabled_test_id != SBI_PMU_TEST_EVENTS) {
+		test_vm_events_test(test_pmu_events);
+		pr_info("SBI PMU event verification test : PASS\n");
+	}
+
+	if (disabled_test_id != SBI_PMU_TEST_SNAPSHOT) {
+		test_vm_events_snapshot_test(test_pmu_events_snaphost);
+		pr_info("SBI PMU event verification with snapshot test : PASS\n");
+	}
+
+	if (disabled_test_id != SBI_PMU_TEST_OVERFLOW) {
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
