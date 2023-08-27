Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DE3C83F11
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 01:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iLJZPM1rbQBMJuZwlnVI7SxoA6Kzc2r3oc3NWxyDUQw=; b=lb4UK6J8mVA6jJ
	yUhNQIa4qowvk2JPeLOzvcMWOICfshFkLeB84CpHY2q+iiCv4DFtGPCrb32/mMAqqVWP2DRDSjoZY
	9w2pKwHURWYkU8PWerAqVzHFpoOKG98NyhSH+670oUXk4lXd6ofQre6gSWUPZGOjJfjWVphxpjp9G
	jD8oF9lid5h+UDMUHQIl7vrhBZldQpkcM4oGnlV8m/0yYVSIXSWOLWODyrEjqQo1RnBQB81jimjQ0
	DJQq+zLx0v37lsBeWmxvbNkwXnzLKylfVQviA9VxSMn5/UwZ/jroS/nPjuIrSTsMVrGbTPWvtQObE
	RZwvImSq5pvPcNgfLGtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qa4YN-007McQ-01;
	Sun, 27 Aug 2023 01:26:59 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qa4YH-007Maj-2t
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 01:26:55 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-573675e6b43so506633eaf.0
        for <linux-riscv@lists.infradead.org>; Sat, 26 Aug 2023 18:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1693099612; x=1693704412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51CzmLExobdNojQV/8xztk6TetLzPUmBlLjWC0Th8zU=;
        b=m7qZdRv407cpgoxyHhwtM859LwQH/Zj8rhFGzC87zGoRGDL45ix/rP1aZuL80cBWFm
         DUqvuwdRK0wTD5TJr3ZfPhOnWAh3BCiy5VGCdvcChj/wCUedKz5HdvRU27lBiuAIELJ0
         ZMq6o52tP0c7qLP0g/Sm+nTo7Ckrbjfq2u9VICWZmLbhxAYLUdeVbcqtgw/75jNalkG9
         dIIPK+aj+lhf0l00Dlc/Pe3RXZT+zrxBBvhrj8EVnS7Q0BUX16rDy5d2s+vW733lRQ6+
         tK2PDtGdRL5EbT50ZkEcq4fqEaQDmeQdJ32G3r78HfqCB+JVWBwVsYN7iatWqV2bP+gm
         TfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693099612; x=1693704412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51CzmLExobdNojQV/8xztk6TetLzPUmBlLjWC0Th8zU=;
        b=i5RhiaBIMkCgQs1VTaWI02OHbPzs751CrOOm5BUn3qCVmFoxK00Asy/GNspOjrHuI0
         FM6mTA7gceyEapG2DmAB3VyRHX1E6Q1MjkZ4DsOOv10y/v6QFeMdnOob5k1grSTbTy14
         Awx2C8t96ojkAwbEf5eacAIo2lRSevbGFFGloBX20iMIK3vuxXJrvs7EziLNQc6XhyFx
         q3bCjLijsmplFSe5tIIEiPNJzcO0TguMLG5PbtbCqBADgsO++3158BazkO0qi7rd1vW8
         W9lzrt20Ta45U2tgor8EmKg8R7W+wZ7x5gjQ0jpXelWtdRfgF6sXplJNhcxvHNjDFZUH
         K79g==
X-Gm-Message-State: AOJu0YzPalk09ZkG2GKoj9r3Gw+JcHCZeKJ35oLLjas6PhuPQ7xpziZm
	nTVwAMcJq/kA1U+JH2wP+7IpjQ==
X-Google-Smtp-Source: AGHT+IFvk3wdXz8svKDCr5C9cRFRuEBUhu9SfN/ssh0HFACRuc4nx5PCahf2QTTUSsQ8BSkBngKdng==
X-Received: by 2002:a05:6358:248b:b0:132:d42f:8e19 with SMTP id m11-20020a056358248b00b00132d42f8e19mr23623473rwc.31.1693099612527;
        Sat, 26 Aug 2023 18:26:52 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jf6-20020a170903268600b001b869410ed2sm4357404plb.72.2023.08.26.18.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 18:26:51 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sat, 26 Aug 2023 18:26:10 -0700
Subject: [PATCH 5/5] riscv: Test checksum functions
MIME-Version: 1.0
Message-Id: <20230826-optimize_checksum-v1-5-937501b4522a@rivosinc.com>
References: <20230826-optimize_checksum-v1-0-937501b4522a@rivosinc.com>
In-Reply-To: <20230826-optimize_checksum-v1-0-937501b4522a@rivosinc.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_182653_932138_BAEAB46C 
X-CRM114-Status: GOOD (  15.73  )
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

Add Kconfig support for riscv specific testing modules. This was created
to supplement lib/checksum_kunit.c, and add tests for ip_fast_csum and
csum_ipv6_magic.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/Kconfig.debug              |   1 +
 arch/riscv/lib/Kconfig.debug          |  31 ++++++++++
 arch/riscv/lib/Makefile               |   2 +
 arch/riscv/lib/riscv_checksum_kunit.c | 111 ++++++++++++++++++++++++++++++++++
 4 files changed, 145 insertions(+)

diff --git a/arch/riscv/Kconfig.debug b/arch/riscv/Kconfig.debug
index e69de29bb2d1..53a84ec4f91f 100644
--- a/arch/riscv/Kconfig.debug
+++ b/arch/riscv/Kconfig.debug
@@ -0,0 +1 @@
+source "arch/riscv/lib/Kconfig.debug"
diff --git a/arch/riscv/lib/Kconfig.debug b/arch/riscv/lib/Kconfig.debug
new file mode 100644
index 000000000000..15fc83b68340
--- /dev/null
+++ b/arch/riscv/lib/Kconfig.debug
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "riscv Testing and Coverage"
+
+menuconfig RUNTIME_TESTING_MENU
+	bool "Runtime Testing"
+	def_bool y
+	help
+	  Enable riscv runtime testing.
+
+if RUNTIME_TESTING_MENU
+
+config RISCV_CHECKSUM_KUNIT
+	tristate "KUnit test riscv checksum functions at runtime" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  Enable this option to test the checksum functions at boot.
+
+	  KUnit tests run during boot and output the results to the debug log
+	  in TAP format (http://testanything.org/). Only useful for kernel devs
+	  running the KUnit test harness, and not intended for inclusion into a
+	  production build.
+
+	  For more information on KUnit and unit tests in general please refer
+	  to the KUnit documentation in Documentation/dev-tools/kunit/.
+
+	  If unsure, say N.
+
+endif # RUNTIME_TESTING_MENU
+
+endmenu # "riscv Testing and Coverage"
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 2aa1a4ad361f..1535a8c81430 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -12,3 +12,5 @@ lib-$(CONFIG_64BIT)	+= tishift.o
 lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
+
+obj-$(CONFIG_RISCV_CHECKSUM_KUNIT) += riscv_checksum_kunit.o
diff --git a/arch/riscv/lib/riscv_checksum_kunit.c b/arch/riscv/lib/riscv_checksum_kunit.c
new file mode 100644
index 000000000000..05b4710c907f
--- /dev/null
+++ b/arch/riscv/lib/riscv_checksum_kunit.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Test cases for checksum
+ */
+
+#include <linux/in6.h>
+
+#include <kunit/test.h>
+#include <net/checksum.h>
+#include <net/ip6_checksum.h>
+
+#define CHECK_EQ(lhs, rhs) KUNIT_ASSERT_EQ(test, lhs, rhs)
+
+static void test_csum_fold(struct kunit *test)
+{
+	unsigned int one = 1226127848;
+	unsigned int two = 446627905;
+	unsigned int three = 3644783064;
+	unsigned int four = 361842745;
+	unsigned int five = 4281073503;
+	unsigned int max = -1;
+
+	CHECK_EQ(0x7d02, csum_fold(one));
+	CHECK_EQ(0xe51f, csum_fold(two));
+	CHECK_EQ(0x2ce8, csum_fold(three));
+	CHECK_EQ(0xa235, csum_fold(four));
+	CHECK_EQ(0x174, csum_fold(five));
+	CHECK_EQ(0x0, csum_fold(max));
+}
+
+static void test_ip_fast_csum(struct kunit *test)
+{
+	unsigned char *average = { 0x1c, 0x00, 0x00, 0x45, 0x00, 0x00, 0x68,
+				   0x74, 0x00, 0x00, 0x11, 0x80, 0x01, 0x64,
+				   0xa8, 0xc0, 0xe9, 0x9c, 0x46, 0xab };
+	unsigned char *larger = { 0xa3, 0xde, 0x43, 0x41, 0x11, 0x19,
+				  0x2f, 0x73, 0x00, 0x00, 0xf1, 0xc5,
+				  0x31, 0xbb, 0xaa, 0xc1, 0x23, 0x5f,
+				  0x32, 0xde, 0x65, 0x39, 0xfe, 0xbc };
+	unsigned char *overflow = { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+				    0xff, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
+				    0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
+	unsigned char *max = { 0xff, 0xff, 0xff, 0xff, 0xff, 0xfd, 0xff, 0xff,
+			       0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+			       0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+			       0xff, 0xff, 0xff, 0xff, 0xff, 0xfd, 0xff, 0xff,
+			       0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+			       0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+			       0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
+
+	CHECK_EQ(0x598f, ip_fast_csum(average, 5));
+	CHECK_EQ(0xdd4f, ip_fast_csum(larger, 6));
+	CHECK_EQ(0xfffe, ip_fast_csum(overflow, 5));
+	CHECK_EQ(0x400, ip_fast_csum(max, 14));
+}
+
+static void test_csum_ipv6_magic(struct kunit *test)
+{
+	struct in6_addr saddr = {
+		.s6_addr = { 0xf8, 0x43, 0x43, 0xf0, 0xdc, 0xa0, 0x39, 0x92,
+			     0x43, 0x67, 0x12, 0x03, 0xe3, 0x32, 0xfe, 0xed }};
+	struct in6_addr daddr = {
+		.s6_addr = { 0xa8, 0x23, 0x46, 0xdc, 0xc8, 0x2d, 0xaa, 0xe3,
+			     0xdc, 0x66, 0x72, 0x43, 0xe2, 0x12, 0xee, 0xfd }};
+	u32 len = 1 << 10;
+	u8 proto = 17;
+	__wsum csum = 53;
+
+	CHECK_EQ(0x2fbb, csum_ipv6_magic(&saddr, &daddr, len, proto, csum));
+}
+
+static void test_do_csum(struct kunit *test)
+{
+	unsigned char *very_small = {0x32};
+	unsigned char *small = {0xd3, 0x43, 0xad, 0x46};
+	unsigned char *medium = {
+		0xa0, 0x13, 0xaa, 0xa6, 0x53, 0xac, 0xa3, 0x43
+	};
+	unsigned char *misaligned = medium + 1;
+	unsigned char *large = {
+		0xa0, 0x13, 0xaa, 0xa6, 0x53, 0xac, 0xa3, 0x43,
+		0xa0, 0x13, 0xaa, 0xa6, 0x53, 0xac, 0xa3, 0x43,
+		0xa0, 0x13, 0xaa, 0xa6, 0x53, 0xac, 0xa3, 0x43,
+		0xa0, 0x13, 0xaa, 0xa6, 0x53, 0xac, 0xa3, 0x43
+	};
+	unsigned char *large_misaligned = large + 3;
+
+	CHECK_EQ(0xffcd, ip_compute_csum(very_small, 1));
+	CHECK_EQ(0x757f, ip_compute_csum(small, 4));
+	CHECK_EQ(0x5e56, ip_compute_csum(misaligned, 7));
+	CHECK_EQ(0x469d, ip_compute_csum(large, 29));
+	CHECK_EQ(0x43ae, ip_compute_csum(large_misaligned, 28));
+}
+
+static struct kunit_case __refdata riscv_checksum_test_cases[] = {
+	KUNIT_CASE(test_csum_fold),
+	KUNIT_CASE(test_ip_fast_csum),
+	KUNIT_CASE(test_csum_ipv6_magic),
+	KUNIT_CASE(test_do_csum),
+	{}
+};
+
+static struct kunit_suite riscv_checksum_test_suite = {
+	.name = "riscv_checksum",
+	.test_cases = riscv_checksum_test_cases,
+};
+
+kunit_test_suites(&riscv_checksum_test_suite);
+
+MODULE_AUTHOR("Charlie Jenkins <charlie@rivosinc.com>");
+MODULE_LICENSE("GPL");

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
