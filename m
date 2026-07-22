Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3449DC44512
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 06:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ivgHMyjvv5BqaTP+4xazdsxL/dFxlDzIf9No1FsKjh8=; b=iuf/HnGYU2KFsN
	6sgflwLVPgTD47i2UEaCMnbJ5NunkemiTzMwDyhwCTcsBAGxodXu6W4UrOPrR6ryoqKKKnMx+C5Sb
	onpbCLeGhCYU0jaHIAcrm2O/BcEdIWVEnF7brcA0IWUDJEH/nxP8CoAhvS5jQiKjaro8Hza1ytUbD
	7lwyJQuhGw8/5QWD76qdfUyemw3LuZ90d7AHudUyHa45pKpbwJXSGAlTIizSOHDRLRcDxsKUf1xsn
	oemIFGgZL9/gM5gPCcyWK4R0bxHo60qw3Atj1UskVJ++f3t3QGY37/CAKZ/UxG3wmtUuIjv9/8VNt
	LWlsLtrmx4E+OFShQxOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQg7-0000000AzGQ-3PoI;
	Wed, 22 Jul 2026 06:43:39 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQg4-0000000AzFE-3KRK
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 06:43:38 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4h4l871gggz5B10G;
	Wed, 22 Jul 2026 14:43:35 +0800 (CST)
Received: from szxlzmapp04.zte.com.cn ([10.5.231.166])
	by mse-fl1.zte.com.cn with SMTP id 66M6hPBW061860;
	Wed, 22 Jul 2026 14:43:25 +0800 (+08)
	(envelope-from gao.rui@zte.com.cn)
Received: from localhost.localdomain (unknown [10.234.74.162])
	by smtp (Zmail) with SMTP;
	Wed, 22 Jul 2026 14:43:27 +0800
X-Zmail-TransId: 3e816a60668f00d-a0abd
X-Zmail-LocalSMTP: 1
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-Zmail-RealSender: gao.rui@zte.com.cn
From: Gao Rui <gao.rui@zte.com.cn>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Feng Jiang <jiangfeng@kylinos.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Gao Rui <gao.rui@zte.com.cn>, Kees Cook <kees@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org
Subject: [PATCH 2/2] kunit: string: add strnlen SIZE_MAX test coverage
Date: Wed, 22 Jul 2026 14:40:27 +0800
Message-ID: <20260722064037.1111467-3-gao.rui@zte.com.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20260722064037.1111467-1-gao.rui@zte.com.cn>
References: <20260722064037.1111467-1-gao.rui@zte.com.cn>
MIME-Version: 1.0
X-MAIL: mse-fl1.zte.com.cn 66M6hPBW061860
X-TLS: YES
X-ENVELOPE-SENDER: gao.rui@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Wed, 22 Jul 2026 14:43:35 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A606697.000/4h4l871gggz5B10G
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_234337_049236_160E3612 
X-CRM114-Status: GOOD (  10.26  )
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

Extend string_test_strnlen to validate strnlen behavior with
SIZE_MAX input:

- Add explicit test case for strnlen(s, SIZE_MAX).
- Ensure fallback to generic path returns correct length when
  string has no NUL terminator.
- Complements existing tests for non-terminated strings and
  boundary conditions.

This improves KUnit coverage for extreme inputs and verifies
the correctness of the new fallback logic in strnlen.S.

Signed-off-by: Gao Rui <gao.rui@zte.com.cn>
---
 lib/tests/string_kunit.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/lib/tests/string_kunit.c b/lib/tests/string_kunit.c
index 0819ace5b027..8e2e8980aa75 100644
--- a/lib/tests/string_kunit.c
+++ b/lib/tests/string_kunit.c
@@ -155,6 +155,16 @@ static void string_test_strnlen(struct kunit *test)
 
 	for (size_t offset = 0; offset < STRING_TEST_MAX_OFFSET; offset++) {
 		for (size_t len = 0; len <= STRING_TEST_MAX_LEN; len++) {
+			/* Test strings without NUL terminator */
+			s = buf + buf_size - offset - len;
+			if (len > 0)
+				KUNIT_EXPECT_EQ(test, strnlen(s, len - 1), len - 1);
+			if (len > 1)
+				KUNIT_EXPECT_EQ(test, strnlen(s, len - 2), len - 2);
+
+			KUNIT_EXPECT_EQ(test, strnlen(s, len), len);
+
+			/* Test strings with NUL terminator */
 			s = buf + buf_size - 1 - offset - len;
 			s[len] = '\0';
 
@@ -169,6 +179,9 @@ static void string_test_strnlen(struct kunit *test)
 			KUNIT_EXPECT_EQ(test, strnlen(s, len + 2), len);
 			KUNIT_EXPECT_EQ(test, strnlen(s, len + 10), len);
 
+			/* Test Count overflow fallback */
+			KUNIT_EXPECT_EQ(test, strnlen(s, SSIZE_MAX), len);
+
 			s[len] = 'A';
 		}
 	}
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
