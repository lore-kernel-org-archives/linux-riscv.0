Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50985D73EB7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 02:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vm04Ylw8I9dR1GFqjeqe01E+VX5lMVovZyKfWiFaQnU=; b=QkPDB2BhmGTtar
	bBj28dNfUSo976AfzyZtTRsuVd/kVnglshXGtjvbXoyh9LQqgRJm3GW6rWhMhumjWTMrSXxRvQagc
	Do1OpEskybixbMSfmDqEvcdAn/g1SA36FmbFlPbDOmay6c7A8dMuOH4Y7QQTMIpOLq5KmWdO4OJH9
	TN9cOWlCEi1Do3EEUausFBBtcIyo/3PH3vWnVR/n0r1T2T8yPpPzeehuRxfCFAkKZ4sZnc4mgt/fg
	LYpITfBzrdJTFXdNH88PJaCNF2HzlXoH4FePlcuPS917rcYB/1V/bVSVeWFAc7iLZFzI2FDNearlY
	WZ4HTdJHUh5hcCDAtxtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vleb2-00000000ucP-21JV;
	Fri, 30 Jan 2026 02:50:57 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vleaq-00000000uVF-17HL
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jan 2026 02:50:45 +0000
X-UUID: 7314ce4cfd8611f0b0f03b4cfa9209d1-20260130
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:bb4e3d8a-b090-4137-a189-b36a8f85d569,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:984be26614926f2b1f5df97cfa91174d,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7314ce4cfd8611f0b0f03b4cfa9209d1-20260130
X-User: jiangfeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 502751534; Fri, 30 Jan 2026 10:50:34 +0800
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
Subject: [PATCH v7 2/8] lib/string_kunit: add correctness test for strnlen()
Date: Fri, 30 Jan 2026 10:50:12 +0800
Message-Id: <20260130025018.172925-3-jiangfeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260130025018.172925-1-jiangfeng@kylinos.cn>
References: <20260130025018.172925-1-jiangfeng@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_185044_651610_4F8E3106 
X-CRM114-Status: UNSURE (   9.04  )
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

Add a KUnit test for strnlen() to verify correctness across
different string lengths and memory alignments. Use vmalloc()
to place the NUL character at the page boundary to ensure
over-reads are detected.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Suggested-by: Kees Cook <kees@kernel.org>
Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
 lib/tests/string_kunit.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/lib/tests/string_kunit.c b/lib/tests/string_kunit.c
index 26962118768e..1c2d57e05624 100644
--- a/lib/tests/string_kunit.c
+++ b/lib/tests/string_kunit.c
@@ -133,6 +133,40 @@ static void string_test_strlen(struct kunit *test)
 	vfree(buf);
 }
 
+static void string_test_strnlen(struct kunit *test)
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
+
+			if (len > 0)
+				KUNIT_EXPECT_EQ(test, strnlen(s, len - 1), len - 1);
+			if (len > 1)
+				KUNIT_EXPECT_EQ(test, strnlen(s, len - 2), len - 2);
+
+			KUNIT_EXPECT_EQ(test, strnlen(s, len), len);
+
+			KUNIT_EXPECT_EQ(test, strnlen(s, len + 1), len);
+			KUNIT_EXPECT_EQ(test, strnlen(s, len + 2), len);
+			KUNIT_EXPECT_EQ(test, strnlen(s, len + 10), len);
+
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
@@ -648,6 +682,7 @@ static struct kunit_case string_test_cases[] = {
 	KUNIT_CASE(string_test_memset32),
 	KUNIT_CASE(string_test_memset64),
 	KUNIT_CASE(string_test_strlen),
+	KUNIT_CASE(string_test_strnlen),
 	KUNIT_CASE(string_test_strchr),
 	KUNIT_CASE(string_test_strnchr),
 	KUNIT_CASE(string_test_strspn),
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
