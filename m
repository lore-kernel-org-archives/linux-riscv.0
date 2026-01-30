Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1268D73EB2
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 02:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8m8nvwMGWON0BfFTRmOFJKvO+fiTRfAkO8ISX8UwLGE=; b=Lh09Ho2eaWNKpN
	fQQPUnoFUcGmtdMnQbikwt2rDhJRHzIzbhY3Yk/NypE1R6pKNxjn9t81I8xgeIppuN+r+9pfmtHvW
	pHAqG+0DLr7nXbfICVsGuWrjlmb2iOGMcsUXFhV03qJffX62/gZVQessd7EkmF1MOj3Uhir3+/zFb
	sIDGM1Y71zuLe3BpIb0jNXehhkpiYAWjsrZ4WwTJLjKXSo/eHCLD2EVjdts4++gD+BfLMzTOlQEIm
	IDgAHTNpYMRTD0rW9ZJmyO/XLM+N+EyfAaTyBXX+l1jcWt4fYVbs85mslqh5QnftEJXo0G4NnT3Bw
	sUORecsBnrWVzUyeF2Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vleb1-00000000ubb-02iY;
	Fri, 30 Jan 2026 02:50:55 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vleap-00000000uVE-46Hk
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jan 2026 02:50:45 +0000
X-UUID: 737d9008fd8611f0b0f03b4cfa9209d1-20260130
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:5b8f9c2c-906d-435a-81c7-e8a40f2af792,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:e4cae6f387abc8d0840510319f4bfa37,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 737d9008fd8611f0b0f03b4cfa9209d1-20260130
X-User: jiangfeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 790434504; Fri, 30 Jan 2026 10:50:35 +0800
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
Subject: [PATCH v7 3/8] lib/string_kunit: add correctness test for strrchr()
Date: Fri, 30 Jan 2026 10:50:13 +0800
Message-Id: <20260130025018.172925-4-jiangfeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260130025018.172925-1-jiangfeng@kylinos.cn>
References: <20260130025018.172925-1-jiangfeng@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_185044_327360_FE706C1B 
X-CRM114-Status: UNSURE (   9.10  )
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

Add a KUnit test for strrchr() to verify correctness across
different string lengths and memory alignments. Use vmalloc()
to place the NUL character at the page boundary to ensure
over-reads are detected.

Suggested-by: Kees Cook <kees@kernel.org>
Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
 lib/tests/string_kunit.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/lib/tests/string_kunit.c b/lib/tests/string_kunit.c
index 1c2d57e05624..2bed641e1eae 100644
--- a/lib/tests/string_kunit.c
+++ b/lib/tests/string_kunit.c
@@ -190,6 +190,36 @@ static void string_test_strchr(struct kunit *test)
 	KUNIT_ASSERT_NULL(test, result);
 }
 
+static void string_test_strrchr(struct kunit *test)
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
+			KUNIT_EXPECT_PTR_EQ(test, strrchr(s, 'Z'), NULL);
+
+			if (len > 0)
+				KUNIT_EXPECT_PTR_EQ(test, strrchr(s, 'A'), s + len - 1);
+			else
+				KUNIT_EXPECT_PTR_EQ(test, strrchr(s, 'A'), NULL);
+
+			s[len] = 'A';
+		}
+	}
+
+	vfree(buf);
+}
+
 static void string_test_strnchr(struct kunit *test)
 {
 	const char *test_string = "abcdefghijkl";
@@ -685,6 +715,7 @@ static struct kunit_case string_test_cases[] = {
 	KUNIT_CASE(string_test_strnlen),
 	KUNIT_CASE(string_test_strchr),
 	KUNIT_CASE(string_test_strnchr),
+	KUNIT_CASE(string_test_strrchr),
 	KUNIT_CASE(string_test_strspn),
 	KUNIT_CASE(string_test_strcmp),
 	KUNIT_CASE(string_test_strcmp_long_strings),
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
