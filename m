Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DC5C5472D
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 16:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KPphnS086HejY9ivlVHE2c2F7rVcxvAZeUVF2UwU80M=; b=Cj9aDXp8wnpQ7k
	3d/dCAvzNTaWWDavu+xDDn3UXEIacIojRNfFExMK+Yn1Bc47z4pWmPBIfsTPIkhjvo6p9tsbanbLP
	VTjfkWQQPTNr03jUtCCL09DeOjOaW5in/LJunQFuvo09Jmo2OupnLqPX8l5PdaAZiYlmGt+UwWVuV
	l52qtIxLYMZZMlyr4sFE3WPA5fiicZSnInrqVysVKj3Lv5bk1xePLcjAqhK1oYKaasKyFah41dv+r
	Fa2cXXviPCuFBECH7Ro3yMMDxuGni+GCSUuVuVAt6ZdCvCtBzO/BMhMxMRWhyL5/kYNV7f8o8E98h
	8kj7rnXLS0NJkfyUPc5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sicio-000000082Bc-110O;
	Mon, 26 Aug 2024 16:37:38 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siciA-000000081yK-2MMz
	for linux-riscv@lists.infradead.org;
	Mon, 26 Aug 2024 16:36:59 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7cd967d8234so2643309a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 26 Aug 2024 09:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724690217; x=1725295017; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jyfpHkRCjhLtdbTlosfWbXODPnxDh+jAyWl8r9ADKzs=;
        b=oslHDjMdzD+s1aL52F9cvcx8o2GrSblT3FxX2kqiSlLpq+ILCUojS5CS/G7aUOEAgy
         B86tZP4V/CLhlHYYTGVT74xvPPvu642YRRPTOztbZ0INZAKZw8bw9QcUf3KQY96KWd2M
         DJpDeinv5fT3Yp8b5IVAd/I3DfruK1WfsS08VaZFeEDEzERA3O3FTxwMQk7OYVUTdSTj
         2PnwjP7wJ/j3JLpPsqPnWUT3etCMcom5BRyP3LyizTn/IPNmYFRVQjisMwFvS2xwbcVe
         WsQEhdzt4zYz1DNrJGe1PMsqC+p6fxeSY3tjiOgYstWrymi4KkZdnf9F9qgjR4slVVhc
         qWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724690217; x=1725295017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jyfpHkRCjhLtdbTlosfWbXODPnxDh+jAyWl8r9ADKzs=;
        b=vu4PM1h/jNNySCVAh+9rGS1ajWYYtAd9fYHb+Tqzd7R7yLPDsKNkTpxMQHHPLWLSlC
         /1X13aYNdswdpRif8qbTp7E4jAD1GS/czCs/bP6WSr1au/mfRMoGI/+R3yNwgQFzcfuN
         W4jUrsNgwAnYOaOxu+P8mcSBm0sHJ2P0hrI/9tAyUInmAPsAn+T3UYIzp06hD5lq96Ck
         stF7gWthUSYkwcHe/GT625vY3tJLkvgPpp1Fa2u7tdNZVWa9qWA6bumVp1MK5fOGPrXd
         pUwCrLcerYnPlGxwwsSOCGqMHvuUt/QoRputlg5Onu/wJSqZSTTpuH61QgFvMM+o1lTw
         pNBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ+U7YR0ASyITzbE84NLsmaCrQkQv9E8AkJPdwVKeEkporMwkBhPez6z4T6osp+Lcmq6kiG7GG5LiMWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEXf+yq3AhdK/mLlqnWV7qKKIprSSjle1rq1OlrE3dU0XZqN99
	9j5DV5RT9blfxtLJy0bLh/VwJyiBQe9xD/AJgUKKZQQhzBja0vUj87HERIdWldY=
X-Google-Smtp-Source: AGHT+IGZ/x4l1FTmg52AZCkbdAqsiXQsKwT7c6jA8ClJsBrzG9ck1DoxguZRXf7OQBkRjZM+sphMdw==
X-Received: by 2002:a05:6a20:2d12:b0:1c0:e77b:d37 with SMTP id adf61e73a8af0-1ccc084ccc8mr139670637.9.1724690216866;
        Mon, 26 Aug 2024 09:36:56 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143434052dsm7174708b3a.217.2024.08.26.09.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 09:36:56 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 26 Aug 2024 09:36:46 -0700
Subject: [PATCH 2/3] riscv: selftests: Remove mmap hint address checks
MIME-Version: 1.0
Message-Id: <20240826-riscv_mmap-v1-2-cd8962afe47f@rivosinc.com>
References: <20240826-riscv_mmap-v1-0-cd8962afe47f@rivosinc.com>
In-Reply-To: <20240826-riscv_mmap-v1-0-cd8962afe47f@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Shuah Khan <shuah@kernel.org>, Yangyu Chen <cyy@cyyself.name>, 
 Levi Zim <rsworktech@outlook.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5291; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=HDsj2Iaiaqr0/P+OTbqzWLV9QTcsoSrod0Sf8cvdy58=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9qZ9coFrAmrTixv7tobLN5XHO36JXdD2n6hyDVh+2x+O
 6YmBH3oKGVhEONgkBVTZOG51sDceke/7Kho2QSYOaxMIEMYuDgFYCJSTgx/+HdXXj440Z1jWfWZ
 MuWtfKpvV5/2WjM1LdciV/jtRSePXwz/1D5fPH7mlvGDlDf3ItQW5Tw+2C15InMOJ3+irWqJQ/R
 qNgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_093658_642433_76B75C50 
X-CRM114-Status: GOOD (  10.22  )
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

The mmap behavior that restricts the addresses returned by mmap caused
unexpected behavior, so get rid of the test cases that check that
behavior.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: 73d05262a2ca ("selftests: riscv: Generalize mm selftests")
---
 tools/testing/selftests/riscv/mm/mmap_bottomup.c |  2 -
 tools/testing/selftests/riscv/mm/mmap_default.c  |  2 -
 tools/testing/selftests/riscv/mm/mmap_test.h     | 67 ------------------------
 3 files changed, 71 deletions(-)

diff --git a/tools/testing/selftests/riscv/mm/mmap_bottomup.c b/tools/testing/selftests/riscv/mm/mmap_bottomup.c
index 7f7d3eb8b9c9..f9ccae50349b 100644
--- a/tools/testing/selftests/riscv/mm/mmap_bottomup.c
+++ b/tools/testing/selftests/riscv/mm/mmap_bottomup.c
@@ -7,8 +7,6 @@
 TEST(infinite_rlimit)
 {
 	EXPECT_EQ(BOTTOM_UP, memory_layout());
-
-	TEST_MMAPS;
 }
 
 TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/riscv/mm/mmap_default.c b/tools/testing/selftests/riscv/mm/mmap_default.c
index 2ba3ec990006..3f53b6ecc326 100644
--- a/tools/testing/selftests/riscv/mm/mmap_default.c
+++ b/tools/testing/selftests/riscv/mm/mmap_default.c
@@ -7,8 +7,6 @@
 TEST(default_rlimit)
 {
 	EXPECT_EQ(TOP_DOWN, memory_layout());
-
-	TEST_MMAPS;
 }
 
 TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/riscv/mm/mmap_test.h b/tools/testing/selftests/riscv/mm/mmap_test.h
index 3b29ca3bb3d4..75918d15919f 100644
--- a/tools/testing/selftests/riscv/mm/mmap_test.h
+++ b/tools/testing/selftests/riscv/mm/mmap_test.h
@@ -10,76 +10,9 @@
 #define TOP_DOWN 0
 #define BOTTOM_UP 1
 
-#if __riscv_xlen == 64
-uint64_t random_addresses[] = {
-	0x19764f0d73b3a9f0, 0x016049584cecef59, 0x3580bdd3562f4acd,
-	0x1164219f20b17da0, 0x07d97fcb40ff2373, 0x76ec528921272ee7,
-	0x4dd48c38a3de3f70, 0x2e11415055f6997d, 0x14b43334ac476c02,
-	0x375a60795aff19f6, 0x47f3051725b8ee1a, 0x4e697cf240494a9f,
-	0x456b59b5c2f9e9d1, 0x101724379d63cb96, 0x7fe9ad31619528c1,
-	0x2f417247c495c2ea, 0x329a5a5b82943a5e, 0x06d7a9d6adcd3827,
-	0x327b0b9ee37f62d5, 0x17c7b1851dfd9b76, 0x006ebb6456ec2cd9,
-	0x00836cd14146a134, 0x00e5c4dcde7126db, 0x004c29feadf75753,
-	0x00d8b20149ed930c, 0x00d71574c269387a, 0x0006ebe4a82acb7a,
-	0x0016135df51f471b, 0x00758bdb55455160, 0x00d0bdd949b13b32,
-	0x00ecea01e7c5f54b, 0x00e37b071b9948b1, 0x0011fdd00ff57ab3,
-	0x00e407294b52f5ea, 0x00567748c200ed20, 0x000d073084651046,
-	0x00ac896f4365463c, 0x00eb0d49a0b26216, 0x0066a2564a982a31,
-	0x002e0d20237784ae, 0x0000554ff8a77a76, 0x00006ce07a54c012,
-	0x000009570516d799, 0x00000954ca15b84d, 0x0000684f0d453379,
-	0x00002ae5816302b5, 0x0000042403fb54bf, 0x00004bad7392bf30,
-	0x00003e73bfa4b5e3, 0x00005442c29978e0, 0x00002803f11286b6,
-	0x000073875d745fc6, 0x00007cede9cb8240, 0x000027df84cc6a4f,
-	0x00006d7e0e74242a, 0x00004afd0b836e02, 0x000047d0e837cd82,
-	0x00003b42405efeda, 0x00001531bafa4c95, 0x00007172cae34ac4,
-};
-#else
-uint32_t random_addresses[] = {
-	0x8dc302e0, 0x929ab1e0, 0xb47683ba, 0xea519c73, 0xa19f1c90, 0xc49ba213,
-	0x8f57c625, 0xadfe5137, 0x874d4d95, 0xaa20f09d, 0xcf21ebfc, 0xda7737f1,
-	0xcedf392a, 0x83026c14, 0xccedca52, 0xc6ccf826, 0xe0cd9415, 0x997472ca,
-	0xa21a44c1, 0xe82196f5, 0xa23fd66b, 0xc28d5590, 0xd009cdce, 0xcf0be646,
-	0x8fc8c7ff, 0xe2a85984, 0xa3d3236b, 0x89a0619d, 0xc03db924, 0xb5d4cc1b,
-	0xb96ee04c, 0xd191da48, 0xb432a000, 0xaa2bebbc, 0xa2fcb289, 0xb0cca89b,
-	0xb0c18d6a, 0x88f58deb, 0xa4d42d1c, 0xe4d74e86, 0x99902b09, 0x8f786d31,
-	0xbec5e381, 0x9a727e65, 0xa9a65040, 0xa880d789, 0x8f1b335e, 0xfc821c1e,
-	0x97e34be4, 0xbbef84ed, 0xf447d197, 0xfd7ceee2, 0xe632348d, 0xee4590f4,
-	0x958992a5, 0xd57e05d6, 0xfd240970, 0xc5b0dcff, 0xd96da2c2, 0xa7ae041d,
-};
-#endif
-
-// Only works on 64 bit
-#if __riscv_xlen == 64
 #define PROT (PROT_READ | PROT_WRITE)
 #define FLAGS (MAP_PRIVATE | MAP_ANONYMOUS)
 
-/* mmap must return a value that doesn't use more bits than the hint address. */
-static inline unsigned long get_max_value(unsigned long input)
-{
-	unsigned long max_bit = (1UL << (((sizeof(unsigned long) * 8) - 1 -
-					  __builtin_clzl(input))));
-
-	return max_bit + (max_bit - 1);
-}
-
-#define TEST_MMAPS                                                            \
-	({                                                                    \
-		void *mmap_addr;                                              \
-		for (int i = 0; i < ARRAY_SIZE(random_addresses); i++) {      \
-			mmap_addr = mmap((void *)random_addresses[i],         \
-					 5 * sizeof(int), PROT, FLAGS, 0, 0); \
-			EXPECT_NE(MAP_FAILED, mmap_addr);                     \
-			EXPECT_GE((void *)get_max_value(random_addresses[i]), \
-				  mmap_addr);                                 \
-			mmap_addr = mmap((void *)random_addresses[i],         \
-					 5 * sizeof(int), PROT, FLAGS, 0, 0); \
-			EXPECT_NE(MAP_FAILED, mmap_addr);                     \
-			EXPECT_GE((void *)get_max_value(random_addresses[i]), \
-				  mmap_addr);                                 \
-		}                                                             \
-	})
-#endif /* __riscv_xlen == 64 */
-
 static inline int memory_layout(void)
 {
 	void *value1 = mmap(NULL, sizeof(int), PROT, FLAGS, 0, 0);

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
