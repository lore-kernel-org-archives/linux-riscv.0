Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE55D29DEC
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 08:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LUjQIObpjV9AKAXu34xsDlOn+Qpb7FlKQTFcthEENQM=; b=4HUWwZCrfcWQ+u
	6wwt+qvFWcrKCM4uRh1oR4gLLxc875DhE4100sAX92sOx2vszKTZ0g2vHyQTpFWo9JoATcH3qvnjL
	3jsU/J0A8NF6cq4g96tLRPZaTmvJ/9pD27zkkpOueFJdUXwbAjY1djJ5YqxxbgjLVNMyqTuaYG9j4
	nPlQWdaKVfIjnsFk+Zat++JBTo05SrlmfVAq7pedz1J4x3ijZxR4s7NNGmc5ena+IQopmKMzX5k3l
	sRXyZ1Y59BdxHrCumbxrNFNGJU9EV06okETb28PDGE+8hm8y6VGzwqJv36wVq41Iu57+XTif0qxdJ
	6sIZKPRRiUyst+HWXwlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZlQ-00000006jjz-3TMG;
	Tue, 13 Jan 2026 08:28:32 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZlN-00000006jik-2PA2
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 08:28:30 +0000
X-UUID: d45f9ca2f05911f0a38c85956e01ac42-20260113
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:39197dc9-ddb2-4e6e-a488-8721d5adc264,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:43240f47065a33ce9c3bff626d67e50b,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d45f9ca2f05911f0a38c85956e01ac42-20260113
X-User: jiangfeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1685290973; Tue, 13 Jan 2026 16:28:25 +0800
From: Feng Jiang <jiangfeng@kylinos.cn>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	kees@kernel.org,
	andy@kernel.org,
	akpm@linux-foundation.org,
	jiangfeng@kylinos.cn,
	ebiggers@kernel.org,
	martin.petersen@oracle.com,
	ardb@kernel.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	samuel.holland@sifive.com,
	linus.walleij@linaro.org,
	nathan@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 06/14] lib/string_kunit: add correctness test for strnlen
Date: Tue, 13 Jan 2026 16:27:40 +0800
Message-Id: <20260113082748.250916-7-jiangfeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260113082748.250916-1-jiangfeng@kylinos.cn>
References: <20260113082748.250916-1-jiangfeng@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_002829_920057_B58DE239 
X-CRM114-Status: UNSURE (   9.30  )
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
index 88da97e50c8e..89fe52378442 100644
--- a/lib/tests/string_kunit.c
+++ b/lib/tests/string_kunit.c
@@ -129,6 +129,35 @@ static void string_test_strlen(struct kunit *test)
 	}
 }
 
+static void string_test_strnlen(struct kunit *test)
+{
+	char *s;
+	size_t len, offset;
+	const size_t buf_size = STRING_TEST_MAX_LEN + STRING_TEST_MAX_OFFSET + 1;
+
+	s = kunit_kzalloc(test, buf_size, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, s);
+
+	memset(s, 'A', buf_size);
+	s[buf_size - 1] = '\0';
+
+	for (offset = 0; offset < STRING_TEST_MAX_OFFSET; offset++) {
+		for (len = 0; len <= STRING_TEST_MAX_LEN; len++) {
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
@@ -644,6 +673,7 @@ static struct kunit_case string_test_cases[] = {
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
