Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26756C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 19:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dgMFs37sAQTGvRCSuACA+u7SVAeG6MJlx0BsIxfTZ5g=; b=rp3s0wVuOjOPM2
	TFodLDcbBCgp+9XUojroZBplJ+6dU2EKJjd6Om4nvF+1OB7dvBZWYA7Y22QqpsVQlTFxUC+2sepgD
	V1fmLynIM5Qa6VxAIjULWVebseUksZUbp1/ka7a1K0PaxgpZvTqNRKJiwBu3ve6hBndA9Lw24kp7C
	TJdFMQ54mDhmFn82JIJocnivKKBHsiTLaYmqH2itsD+gZhdgjgBH5OkHd0yN1B7kUhOs+wmw/P4KV
	wEJTJpe2GKydKiATfC/rnPCL4/oLRlXHGpn41zDeK9KN3jT8XRzRltZ6lkgzPqzNNDC18SJV9/83J
	+TZCgN88nk8OeWNgzLsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUtPb-00000000Gax-0old;
	Tue, 30 Jan 2024 19:04:47 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUtPQ-00000000GSj-42kl
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 19:04:38 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d50d0c98c3so894255ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 11:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706641475; x=1707246275; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4k3XgG6Vs4V2eymg6847wUAtUHshLOeTHqeR5jZPT4=;
        b=chipTjnDOQ2iPeQuVrcVjAexVze0818U0wwlqHjidN1H0mPSTJC6WW/nITwsGx86uZ
         ABfSSXlkD7UI3tUqDShP3DKMrLPZ6QjLtR5FXg3VbEqUI5UmWl1sFQSxpewCBcVc+6Qy
         8evT1ujNhaHD9zyZT60VQnAuftS1fbZNe8X+B0awxz9lvdk5c+0yZlNx9mLzYkpVktvj
         FYpjFpHXD1IVD8aDCKPIiTC7erNyrZms++J92JZQL7eU0I8ehOZg+e6Suf+06uWJNdQo
         fiMU7DnXbOa37ER3uES2ce7tttsOjRR8JFMzS+89wso0hBHs7TD+WIXftOUSu82xrg1q
         O9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706641475; x=1707246275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4k3XgG6Vs4V2eymg6847wUAtUHshLOeTHqeR5jZPT4=;
        b=ZTn0K1iWKac4OzGlD+11ZdcZt3biaNmAhwWyrPFc20npJMBQcUrSRhceXu9X7+rdUA
         BklMjvYjZ4az37nrT+8bvcEyHGL0SJif4a/MhkWuFKUAIPsP5ybo7xiUWzEOpTWQx0VO
         1RBoHMkyqT/YqLO/UkawQeG7ctg+JYCS43xq7wj7wt+lnjbmadCVbNa39vJZYtvqdirN
         8yZeOTd76HhE2TJe5srGXsck/2ms9NZSn9sN89R6eo7fkKh950j7mxWZBXehE5x0Ws9r
         OcOImHoGUXvWFM8ObwLKMDmocFiHwdcAKZiwq1grQwdlqCsebfp4CWU6mtd7wIQUV3J9
         PXMw==
X-Gm-Message-State: AOJu0Yxn9GOCWG+SdJD0krRfNrsjtpwSAKuIv2tdRelZ3bPhhl/h2Otn
	mVx7vHao/9goF0NMuJfiq98BBW4k9ql8gW0S8nMcLU+zYfBYM2OxBPdkkLE865g=
X-Google-Smtp-Source: AGHT+IFgptya8Q1OvyF+I3gPETTKvinxvv5APyOAribhmdoFU4/DBbXE6gQ2fksCvo6oajrQfoMLLw==
X-Received: by 2002:a17:90b:38e:b0:295:4b25:212b with SMTP id ga14-20020a17090b038e00b002954b25212bmr2367613pjb.4.1706641475147;
        Tue, 30 Jan 2024 11:04:35 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id f6-20020a17090aec8600b00295c3bb9318sm1196541pjy.54.2024.01.30.11.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 11:04:34 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 30 Jan 2024 11:04:31 -0800
Subject: [PATCH v2 2/3] selftests: riscv: Generalize mm selftests
MIME-Version: 1.0
Message-Id: <20240130-use_mmap_hint_address-v2-2-f34ebfd33053@rivosinc.com>
References: <20240130-use_mmap_hint_address-v2-0-f34ebfd33053@rivosinc.com>
In-Reply-To: <20240130-use_mmap_hint_address-v2-0-f34ebfd33053@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706641471; l=8041;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=FRDzzVwyS7nuVapUvX+XBqyYOrJdFna/LWspy9EPMlc=;
 b=rSHBvYDxfdS3K26d2oaN4+tX7NILBW5lAv4B0A2eQz8EBV0f0LtHqjJKt61QbdAbheOm3eOie
 DHnjVcEZiPTCMJdRG/c7TW+3+fDluHKlANMAtpDO0C6sTPtDfef+wRW
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_110437_020631_84C8D6ED 
X-CRM114-Status: GOOD (  13.70  )
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

The behavior of mmap on riscv is defined to not provide an address that
uses more bits than the hint address, if provided. Make the tests
reflect that.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/testing/selftests/riscv/mm/mmap_bottomup.c | 20 +----
 tools/testing/selftests/riscv/mm/mmap_default.c  | 20 +----
 tools/testing/selftests/riscv/mm/mmap_test.h     | 93 +++++++++++++-----------
 3 files changed, 53 insertions(+), 80 deletions(-)

diff --git a/tools/testing/selftests/riscv/mm/mmap_bottomup.c b/tools/testing/selftests/riscv/mm/mmap_bottomup.c
index 1757d19ca89b..bad8e854263d 100644
--- a/tools/testing/selftests/riscv/mm/mmap_bottomup.c
+++ b/tools/testing/selftests/riscv/mm/mmap_bottomup.c
@@ -8,27 +8,9 @@ TEST(infinite_rlimit)
 {
 // Only works on 64 bit
 #if __riscv_xlen == 64
-	struct addresses mmap_addresses;
-
 	EXPECT_EQ(BOTTOM_UP, memory_layout());
 
-	do_mmaps(&mmap_addresses);
-
-	EXPECT_NE(MAP_FAILED, mmap_addresses.no_hint);
-	EXPECT_NE(MAP_FAILED, mmap_addresses.on_37_addr);
-	EXPECT_NE(MAP_FAILED, mmap_addresses.on_38_addr);
-	EXPECT_NE(MAP_FAILED, mmap_addresses.on_46_addr);
-	EXPECT_NE(MAP_FAILED, mmap_addresses.on_47_addr);
-	EXPECT_NE(MAP_FAILED, mmap_addresses.on_55_addr);
-	EXPECT_NE(MAP_FAILED, mmap_addresses.on_56_addr);
-
-	EXPECT_GT(1UL << 47, (unsigned long)mmap_addresses.no_hint);
-	EXPECT_GT(1UL << 38, (unsigned long)mmap_addresses.on_37_addr);
-	EXPECT_GT(1UL << 38, (unsigned long)mmap_addresses.on_38_addr);
-	EXPECT_GT(1UL << 38, (unsigned long)mmap_addresses.on_46_addr);
-	EXPECT_GT(1UL << 47, (unsigned long)mmap_addresses.on_47_addr);
-	EXPECT_GT(1UL << 47, (unsigned long)mmap_addresses.on_55_addr);
-	EXPECT_GT(1UL << 56, (unsigned long)mmap_addresses.on_56_addr);
+	TEST_MMAPS;
 #endif
 }
 
diff --git a/tools/testing/selftests/riscv/mm/mmap_default.c b/tools/testing/selftests/riscv/mm/mmap_default.c
index c63c60b9397e..a3874778d795 100644
--- a/tools/testing/selftests/riscv/mm/mmap_default.c
+++ b/tools/testing/selftests/riscv/mm/mmap_default.c
@@ -8,27 +8,9 @@ TEST(default_rlimit)
 {
 // Only works on 64 bit
 #if __riscv_xlen == 64
-	struct addresses mmap_addresses;
-
 	EXPECT_EQ(TOP_DOWN, memory_layout());
 
-	do_mmaps(&mmap_addresses);
-
-	EXPECT_NE(MAP_FAILED, mmap_addresses.no_hint);
-	EXPECT_NE(MAP_FAILED, mmap_addresses.on_37_addr);
-	EXPECT_NE(MAP_FAILED, mmap_addresses.on_38_addr);
-	EXPECT_NE(MAP_FAILED, mmap_addresses.on_46_addr);
-	EXPECT_NE(MAP_FAILED, mmap_addresses.on_47_addr);
-	EXPECT_NE(MAP_FAILED, mmap_addresses.on_55_addr);
-	EXPECT_NE(MAP_FAILED, mmap_addresses.on_56_addr);
-
-	EXPECT_GT(1UL << 47, (unsigned long)mmap_addresses.no_hint);
-	EXPECT_GT(1UL << 38, (unsigned long)mmap_addresses.on_37_addr);
-	EXPECT_GT(1UL << 38, (unsigned long)mmap_addresses.on_38_addr);
-	EXPECT_GT(1UL << 38, (unsigned long)mmap_addresses.on_46_addr);
-	EXPECT_GT(1UL << 47, (unsigned long)mmap_addresses.on_47_addr);
-	EXPECT_GT(1UL << 47, (unsigned long)mmap_addresses.on_55_addr);
-	EXPECT_GT(1UL << 56, (unsigned long)mmap_addresses.on_56_addr);
+	TEST_MMAPS;
 #endif
 }
 
diff --git a/tools/testing/selftests/riscv/mm/mmap_test.h b/tools/testing/selftests/riscv/mm/mmap_test.h
index 9b8434f62f57..93face2b3118 100644
--- a/tools/testing/selftests/riscv/mm/mmap_test.h
+++ b/tools/testing/selftests/riscv/mm/mmap_test.h
@@ -4,60 +4,69 @@
 #include <sys/mman.h>
 #include <sys/resource.h>
 #include <stddef.h>
+#include <strings.h>
+#include "../../kselftest_harness.h"
 
 #define TOP_DOWN 0
 #define BOTTOM_UP 1
 
-struct addresses {
-	int *no_hint;
-	int *on_37_addr;
-	int *on_38_addr;
-	int *on_46_addr;
-	int *on_47_addr;
-	int *on_55_addr;
-	int *on_56_addr;
+uint64_t random_addresses[] = {
+	0x19764f0d73b3a9f0, 0x016049584cecef59, 0x3580bdd3562f4acd,
+	0x1164219f20b17da0, 0x07d97fcb40ff2373, 0x76ec528921272ee7,
+	0x4dd48c38a3de3f70, 0x2e11415055f6997d, 0x14b43334ac476c02,
+	0x375a60795aff19f6, 0x47f3051725b8ee1a, 0x4e697cf240494a9f,
+	0x456b59b5c2f9e9d1, 0x101724379d63cb96, 0x7fe9ad31619528c1,
+	0x2f417247c495c2ea, 0x329a5a5b82943a5e, 0x06d7a9d6adcd3827,
+	0x327b0b9ee37f62d5, 0x17c7b1851dfd9b76, 0x006ebb6456ec2cd9,
+	0x00836cd14146a134, 0x00e5c4dcde7126db, 0x004c29feadf75753,
+	0x00d8b20149ed930c, 0x00d71574c269387a, 0x0006ebe4a82acb7a,
+	0x0016135df51f471b, 0x00758bdb55455160, 0x00d0bdd949b13b32,
+	0x00ecea01e7c5f54b, 0x00e37b071b9948b1, 0x0011fdd00ff57ab3,
+	0x00e407294b52f5ea, 0x00567748c200ed20, 0x000d073084651046,
+	0x00ac896f4365463c, 0x00eb0d49a0b26216, 0x0066a2564a982a31,
+	0x002e0d20237784ae, 0x0000554ff8a77a76, 0x00006ce07a54c012,
+	0x000009570516d799, 0x00000954ca15b84d, 0x0000684f0d453379,
+	0x00002ae5816302b5, 0x0000042403fb54bf, 0x00004bad7392bf30,
+	0x00003e73bfa4b5e3, 0x00005442c29978e0, 0x00002803f11286b6,
+	0x000073875d745fc6, 0x00007cede9cb8240, 0x000027df84cc6a4f,
+	0x00006d7e0e74242a, 0x00004afd0b836e02, 0x000047d0e837cd82,
+	0x00003b42405efeda, 0x00001531bafa4c95, 0x00007172cae34ac4,
+	0x0000002732f06b2b, 0x00000012cbf8fd0b, 0x0000001fcc6af0e8,
 };
 
-static inline void do_mmaps(struct addresses *mmap_addresses)
-{
-	/*
-	 * Place all of the hint addresses on the boundaries of mmap
-	 * sv39, sv48, sv57
-	 * User addresses end at 1<<38, 1<<47, 1<<56 respectively
-	 */
-	void *on_37_bits = (void *)(1UL << 37);
-	void *on_38_bits = (void *)(1UL << 38);
-	void *on_46_bits = (void *)(1UL << 46);
-	void *on_47_bits = (void *)(1UL << 47);
-	void *on_55_bits = (void *)(1UL << 55);
-	void *on_56_bits = (void *)(1UL << 56);
 
-	int prot = PROT_READ | PROT_WRITE;
-	int flags = MAP_PRIVATE | MAP_ANONYMOUS;
+#define PROT (PROT_READ | PROT_WRITE)
+#define FLAGS (MAP_PRIVATE | MAP_ANONYMOUS)
+
+/* mmap must return a value that doesn't use more bits than the hint address. */
+static inline unsigned long get_max_value(unsigned long input)
+{
+	unsigned long max_bit = (1UL << (ffsl(input) - 1));
 
-	mmap_addresses->no_hint =
-		mmap(NULL, 5 * sizeof(int), prot, flags, 0, 0);
-	mmap_addresses->on_37_addr =
-		mmap(on_37_bits, 5 * sizeof(int), prot, flags, 0, 0);
-	mmap_addresses->on_38_addr =
-		mmap(on_38_bits, 5 * sizeof(int), prot, flags, 0, 0);
-	mmap_addresses->on_46_addr =
-		mmap(on_46_bits, 5 * sizeof(int), prot, flags, 0, 0);
-	mmap_addresses->on_47_addr =
-		mmap(on_47_bits, 5 * sizeof(int), prot, flags, 0, 0);
-	mmap_addresses->on_55_addr =
-		mmap(on_55_bits, 5 * sizeof(int), prot, flags, 0, 0);
-	mmap_addresses->on_56_addr =
-		mmap(on_56_bits, 5 * sizeof(int), prot, flags, 0, 0);
+	return max_bit + (max_bit - 1);
 }
 
+#define TEST_MMAPS                                                            \
+	({                                                                    \
+		void *mmap_addr;                                              \
+		for (int i = 0; i < ARRAY_SIZE(random_addresses); i++) {      \
+			mmap_addr = mmap((void *)random_addresses[i],         \
+					 5 * sizeof(int), PROT, FLAGS, 0, 0); \
+			EXPECT_NE(MAP_FAILED, mmap_addr);                     \
+			EXPECT_GE((void *)get_max_value(random_addresses[i]), \
+				  mmap_addr);                                 \
+			mmap_addr = mmap((void *)random_addresses[i],         \
+					 5 * sizeof(int), PROT, FLAGS, 0, 0); \
+			EXPECT_NE(MAP_FAILED, mmap_addr);                     \
+			EXPECT_GE((void *)get_max_value(random_addresses[i]), \
+				  mmap_addr);                                 \
+		}                                                             \
+	})
+
 static inline int memory_layout(void)
 {
-	int prot = PROT_READ | PROT_WRITE;
-	int flags = MAP_PRIVATE | MAP_ANONYMOUS;
-
-	void *value1 = mmap(NULL, sizeof(int), prot, flags, 0, 0);
-	void *value2 = mmap(NULL, sizeof(int), prot, flags, 0, 0);
+	void *value1 = mmap(NULL, sizeof(int), PROT, FLAGS, 0, 0);
+	void *value2 = mmap(NULL, sizeof(int), PROT, FLAGS, 0, 0);
 
 	return value2 > value1;
 }

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
