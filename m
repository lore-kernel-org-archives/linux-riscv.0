Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34852CF6BE6
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 02:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uRrqw6SIySmkDXzCoCPVO5UKU+VF4ngy69jGmxu4ui8=; b=p6aRL2+zT8+2bF
	6RvZp7cp3kFnHBTYI4jW1TKpUEj92Xj42XjIVnGlWNu3HSKhT7E5LoI51DvDFVU+lsIzGLUhNv0hH
	O1xewZXo0q73WtnPljGxWJnDKoo6VEAj8ErsbsNxr24QWV/P8aYwGmrbYRmbCLFJmSdKm4v1PsxeI
	ZkkoGqO9KeX8sUz6xG67vSbgN2igToPX+8apfHmIs4sNqpN/Edi7PLQ2WBDT1gaaI6P1fX/Y27yLG
	Mw18RIdSBf98kQm4bQ0umFxyLhfESxIma+rLhbZkhV9N3XUU68cCc4LHdmnMXfbSRjdBIwBVQQnhR
	2r1q10X8ntuZx8kdolsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJOn-0000000E4ks-246m;
	Wed, 07 Jan 2026 02:35:49 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJOl-0000000E4ja-2hxz
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 02:35:48 +0000
X-UUID: 8fd19cdaeb7111f0a38c85956e01ac42-20260107
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:0b59dcfc-61be-4163-8256-0e9613874fa2,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:793e51c660485b9dec2c3df733cba7b8,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8fd19cdaeb7111f0a38c85956e01ac42-20260107
X-User: jiangfeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 515336848; Wed, 07 Jan 2026 10:35:42 +0800
From: Feng Jiang <jiangfeng@kylinos.cn>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	kees@kernel.org,
	andy@kernel.org,
	jiangfeng@kylinos.cn,
	ebiggers@kernel.org,
	martin.petersen@oracle.com,
	Jason@zx2c4.com,
	conor.dooley@microchip.com,
	samuel.holland@sifive.com,
	charlie@rivosinc.com,
	ajones@ventanamicro.com,
	nathan@kernel.org,
	linus.walleij@linaro.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH 2/5] lib/string_kunit: add test case for strnlen
Date: Wed,  7 Jan 2026 10:35:14 +0800
Message-Id: <20260107023517.46840-3-jiangfeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260107023517.46840-1-jiangfeng@kylinos.cn>
References: <20260107023517.46840-1-jiangfeng@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_183547_990788_93AAC6F5 
X-CRM114-Status: UNSURE (   9.67  )
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
different string lengths and memory alignments.

Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
 lib/tests/string_kunit.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/lib/tests/string_kunit.c b/lib/tests/string_kunit.c
index 9f4fc72f0886..1d08850e439c 100644
--- a/lib/tests/string_kunit.c
+++ b/lib/tests/string_kunit.c
@@ -126,6 +126,35 @@ static void string_test_strlen(struct kunit *test)
 	}
 }
 
+static void string_test_strnlen(struct kunit *test)
+{
+	char *s;
+	size_t len, offset;
+	const size_t buf_size = 16 + 128 + 1; /* max_offset + max_len + '\0' */
+
+	s = kunit_kzalloc(test, buf_size, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, s);
+
+	memset(s, 'A', buf_size);
+	s[buf_size - 1] = '\0';
+
+	for (offset = 0; offset < 16; offset++) {
+		for (len = 0; len <= 128; len++) {
+			s[offset + len] = '\0';
+
+			if (len > 0)
+				KUNIT_EXPECT_EQ(test, strnlen(s + offset, len - 1), len - 1);
+
+			KUNIT_EXPECT_EQ(test, strnlen(s + offset, len), len);
+
+			KUNIT_EXPECT_EQ(test, strnlen(s + offset, len + 1), len);
+			KUNIT_EXPECT_EQ(test, strnlen(s + offset, len + 10), len);
+
+			s[offset + len] = 'A';
+		}
+	}
+}
+
 static void string_test_strchr(struct kunit *test)
 {
 	const char *test_string = "abcdefghijkl";
@@ -641,6 +670,7 @@ static struct kunit_case string_test_cases[] = {
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
