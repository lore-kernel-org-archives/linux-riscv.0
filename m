Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CB7D73EB2
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 02:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nZVpAXpGGoNi20qF3IXEda4KMykW/JS9L8a3Y2IIliw=; b=3fGnLSYrrfaScA
	pAUjWf+sUTFsGO/SDQbiawd53XsquC4r6ytTtp5lnTMuM6nng+Qk2gv08UhYSlVoGucVbQegM1yM4
	BN9U5Dk+QnYCEdRGRJD4+RUtWlCZzbLsj+fGvHhvO2/27B2q71xCoPH9yfjQcjfvSli0JM4WbY9/h
	TAx5ALzyOKDoPXWdLeuFGph9nqp9i+8h+lleEfLp7YuQyVwUEbaM9l/yhKHykUkePOCaRxqcq9Rjt
	8kjJhXqbO4BZD0ETb4EwT3t/YHI7u+J8jMNi6ywz5sMGnU6r8nbP6fLUN5QWmovmwt3SZKnJBBOoX
	vtg8VK4oTZe/hFe0dtZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vleaq-00000000uXe-3xPy;
	Fri, 30 Jan 2026 02:50:44 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vleao-00000000uVH-0zCN
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jan 2026 02:50:44 +0000
X-UUID: 72acacd6fd8611f0b0f03b4cfa9209d1-20260130
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:3a394fd2-a942-44c1-93c2-95d1243cc759,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:a9d874c,CLOUDID:da19a108f6faa902453c68c6cfc2ad68,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 72acacd6fd8611f0b0f03b4cfa9209d1-20260130
X-User: jiangfeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2145541441; Fri, 30 Jan 2026 10:50:33 +0800
From: Feng Jiang <jiangfeng@kylinos.cn>
To: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	kees@kernel.org,
	andy@kernel.org,
	jiangfeng@kylinos.cn,
	ebiggers@kernel.org,
	martin.petersen@oracle.com,
	herbert@gondor.apana.org.au,
	samuel.holland@sifive.com,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	charlie@rivosinc.com,
	nathan@kernel.org,
	linusw@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v7 1/8] lib/string_kunit: add correctness test for strlen()
Date: Fri, 30 Jan 2026 10:50:11 +0800
Message-Id: <20260130025018.172925-2-jiangfeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260130025018.172925-1-jiangfeng@kylinos.cn>
References: <20260130025018.172925-1-jiangfeng@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_185042_576064_FEEC4771 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

Add a KUnit test for strlen() to verify correctness across
different string lengths and memory alignments. Use vmalloc()
to place the NUL character at the page boundary to ensure
over-reads are detected.

Suggested-by: Kees Cook <kees@kernel.org>
Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
 lib/tests/string_kunit.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/lib/tests/string_kunit.c b/lib/tests/string_kunit.c
index f9a8e557ba77..26962118768e 100644
--- a/lib/tests/string_kunit.c
+++ b/lib/tests/string_kunit.c
@@ -6,10 +6,12 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <kunit/test.h>
+#include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/printk.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <linux/vmalloc.h>
 
 #define STRCMP_LARGE_BUF_LEN 2048
 #define STRCMP_CHANGE_POINT 1337
@@ -17,6 +19,9 @@
 #define STRCMP_TEST_EXPECT_LOWER(test, fn, ...) KUNIT_EXPECT_LT(test, fn(__VA_ARGS__), 0)
 #define STRCMP_TEST_EXPECT_GREATER(test, fn, ...) KUNIT_EXPECT_GT(test, fn(__VA_ARGS__), 0)
 
+#define STRING_TEST_MAX_LEN	128
+#define STRING_TEST_MAX_OFFSET	16
+
 static void string_test_memset16(struct kunit *test)
 {
 	unsigned i, j, k;
@@ -104,6 +109,30 @@ static void string_test_memset64(struct kunit *test)
 	}
 }
 
+static void string_test_strlen(struct kunit *test)
+{
+	size_t buf_size;
+	char *buf, *s;
+
+	buf_size = PAGE_ALIGN(STRING_TEST_MAX_LEN + STRING_TEST_MAX_OFFSET + 1);
+	buf = vmalloc(buf_size);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
+
+	memset(buf, 'A', buf_size);
+
+	for (size_t offset = 0; offset < STRING_TEST_MAX_OFFSET; offset++) {
+		for (size_t len = 0; len <= STRING_TEST_MAX_LEN; len++) {
+			s = buf + buf_size - 1 - offset - len;
+			s[len] = '\0';
+			KUNIT_EXPECT_EQ_MSG(test, strlen(s), len,
+				"offset:%zu len:%zu", offset, len);
+			s[len] = 'A';
+		}
+	}
+
+	vfree(buf);
+}
+
 static void string_test_strchr(struct kunit *test)
 {
 	const char *test_string = "abcdefghijkl";
@@ -618,6 +647,7 @@ static struct kunit_case string_test_cases[] = {
 	KUNIT_CASE(string_test_memset16),
 	KUNIT_CASE(string_test_memset32),
 	KUNIT_CASE(string_test_memset64),
+	KUNIT_CASE(string_test_strlen),
 	KUNIT_CASE(string_test_strchr),
 	KUNIT_CASE(string_test_strnchr),
 	KUNIT_CASE(string_test_strspn),
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
