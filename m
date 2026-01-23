Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3928D7235A
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 08:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3xv6bWLdx6JkUfFmfVw9z2uzflrsAcNeerKOAP41L4U=; b=WV5kbbtzmtZA67
	bprNQO8UkomkbOTB/mF7jRkJBWIFDMPQ3ns6arOPwh7ZXg8uLwARgJHH8zblOnPuz0jbLP1cNii+0
	m5nw9in8fMF0EX19xJUuCyX1p8Gv6qVz9q9mXNQxkSZh3aosIN6V0J+Kr6eOiysqWRUKpUW+kK8+4
	sTaLHW2w6NFVKJLqzlpFYYV6KUOg+xQDEgJa+s01mxneKZP4mmEGvTRN6Dhw4mehpgrPV8jKj5Kgf
	zjAMw159S70+vii6iE+niBOwx+Y6gL7aGfy8h+XD4tmd7IqjwNvuDg+EXTZvTFiRFRBz+KRlyc+Mo
	gyQlg3z4k85r1m8KpE1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjD0P-00000008VrJ-3bal;
	Fri, 23 Jan 2026 08:59:01 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjD0J-00000008Vmf-2lDk
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jan 2026 08:58:57 +0000
X-UUID: bd1f2a5cf83911f0b0f03b4cfa9209d1-20260123
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:b00e071a-dd14-4847-9045-bba7e2ba74fa,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:c826670df8c0c99825d5f32d8fca22d5,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bd1f2a5cf83911f0b0f03b4cfa9209d1-20260123
X-User: jiangfeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 532124729; Fri, 23 Jan 2026 16:58:51 +0800
From: Feng Jiang <jiangfeng@kylinos.cn>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	kees@kernel.org,
	andy@kernel.org,
	jiangfeng@kylinos.cn,
	ebiggers@kernel.org,
	martin.petersen@oracle.com,
	mingo@kernel.org,
	charlie@rivosinc.com,
	conor.dooley@microchip.com,
	samuel.holland@sifive.com,
	linus.walleij@linaro.org,
	nathan@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v4 5/8] lib/string_kunit: extend benchmarks to strnlen() and chr searches
Date: Fri, 23 Jan 2026 16:58:38 +0800
Message-Id: <20260123085841.212468-6-jiangfeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260123085841.212468-1-jiangfeng@kylinos.cn>
References: <20260123085841.212468-1-jiangfeng@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_005855_998455_FDEC67AF 
X-CRM114-Status: UNSURE (   6.72  )
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

Extend the string benchmarking suite to include strnlen(), strchr(),
and strrchr().

For character search functions strchr() and strrchr(), the benchmark
targets the NUL character. This ensures the entire string is scanned,
providing a consistent measure of full-length processing efficiency
comparable to strlen().

Suggested-by: Andy Shevchenko <andy@kernel.org>
Suggested-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
Acked-by: Andy Shevchenko <andy@kernel.org>
---
 lib/tests/string_kunit.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/lib/tests/string_kunit.c b/lib/tests/string_kunit.c
index 52798f426aa9..3d540ad78cda 100644
--- a/lib/tests/string_kunit.c
+++ b/lib/tests/string_kunit.c
@@ -857,6 +857,21 @@ static void string_bench_strlen(struct kunit *test)
 	STRING_BENCH_BUF(test, buf, len, strlen, buf);
 }
 
+static void string_bench_strnlen(struct kunit *test)
+{
+	STRING_BENCH_BUF(test, buf, len, strnlen, buf, len);
+}
+
+static void string_bench_strchr(struct kunit *test)
+{
+	STRING_BENCH_BUF(test, buf, len, strchr, buf, '\0');
+}
+
+static void string_bench_strrchr(struct kunit *test)
+{
+	STRING_BENCH_BUF(test, buf, len, strrchr, buf, '\0');
+}
+
 static struct kunit_case string_test_cases[] = {
 	KUNIT_CASE(string_test_memset16),
 	KUNIT_CASE(string_test_memset32),
@@ -883,6 +898,9 @@ static struct kunit_case string_test_cases[] = {
 	KUNIT_CASE(string_test_memtostr),
 	KUNIT_CASE(string_test_strends),
 	KUNIT_CASE(string_bench_strlen),
+	KUNIT_CASE(string_bench_strnlen),
+	KUNIT_CASE(string_bench_strchr),
+	KUNIT_CASE(string_bench_strrchr),
 	{}
 };
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
