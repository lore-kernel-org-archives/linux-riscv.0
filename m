Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD13EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 15:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KG45XHdsHC86haWl9aVMYDA/diEgKy8SOfnqaypx8fw=; b=L0+V/fA8Pm8yGP
	1PcbMDb9+pAdBrZxB27wc3LDDSCcequu9RAvqXhRSKWxuUvW0IZzc1qGn5rcklSYuAV4ElcPgSbMv
	sFiN8n4R3We6dbHKhHTNLI1qUBSHNY3Gi6niSZQJMSgDuPYRc7Irv3+UV2s0/aeEg7efZfwE8n6Ix
	J/BlGAjP7NS4+hG05wzInxNZ4RT6chlYZYHgpJqfxB/oGs7jfFR4EmQF6MwQwk/YsDJfPTvKJTQpb
	qvCt53R/gDc7jiuRf4NlF+vBtra+eyBDrPzVZwVPJLmiGhe328oAec/gpF+CBLcEjeeL+cuWO33ce
	6OL83pjw9WauBOqlxSLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHn03-004y4W-1y;
	Fri, 07 Jul 2023 15:03:59 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHn00-004y2q-08
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 15:03:57 +0000
X-QQ-mid: bizesmtp67t1688742215t9bcbq7j
Received: from linux-lab-host.localdomain ( [116.30.131.119])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Jul 2023 23:03:34 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: ttAhR/+4RmnN6nx3iljloJFFxC//J57L6V9h3PxADUXe0+b7w1eDps9vJaZOn
	mn9JnbeD3nNYt2VsoSba+gB6pGj899tAN6ryR8zpRDrkOTDVEHXgh0of9Yyv8BcQAfM97D2
	g2fMfc3LDxLKjw9FJwWuCuMyMOe5AINO51aaVWYKTTeWgAXzNiyUr8HQJ+HRdU/kDuceTuW
	trYrBgn1FORbXZufjh6X3yYFmOZszVuJxwEYbpmV/DohrTADWUBJLFrfubtSoJ+YBzzvAum
	e5mSH8c0ZQi8JQKddt3LY5y3rSBJP0O7HRqRNpa2ATMPhfavAtpjt5bZCnHolzcLXkDKr2/
	7zcOjZezqMfR30WpbgqtGxf2RdnL963KDMLTEjNRrPPWoUWpLWENiWDlDdimm2JozmewsN2
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7898572542868346834
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	david.laight@aculab.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v6 11/15] selftests/nolibc: add EXPECT_PTREQ, EXPECT_PTRNE and EXPECT_PTRER
Date: Fri,  7 Jul 2023 23:03:26 +0800
Message-Id: <c8731f470b344d3fc8db30f6112c4e0c7d7d5765.1688739492.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1688739492.git.falcon@tinylab.org>
References: <cover.1688739492.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_080356_396675_2289D15F 
X-CRM114-Status: UNSURE (   9.81  )
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

The syscalls like sbrk() and mmap() return pointers, to test them, more
pointer compare test macros are required, add them:

- EXPECT_PTREQ() expects two equal pointers.
- EXPECT_PTRNE() expects two non-equal pointers.
- EXPECT_PTRER() expects failure with a specified errno.
- EXPECT_PTRER2() expects failure with one of two specified errnos.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 58 ++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index b759fb25d375..8be675debf28 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -364,6 +364,64 @@ static int expect_ptrnz(const void *expr, int llen)
 	return ret;
 }
 
+#define EXPECT_PTREQ(cond, expr, cmp)				\
+	do { if (!cond) pad_spc(llen, 64, "[SKIPPED]\n"); else ret += expect_ptreq(expr, llen, cmp); } while (0)
+
+static int expect_ptreq(const void *expr, int llen, const void *cmp)
+{
+	int ret = 0;
+
+	llen += printf(" = <%p> ", expr);
+	if (expr != cmp) {
+		ret = 1;
+		llen += pad_spc(llen, 64, "[FAIL]\n");
+	} else {
+		llen += pad_spc(llen, 64, " [OK]\n");
+	}
+	return ret;
+}
+
+#define EXPECT_PTRNE(cond, expr, cmp)				\
+	do { if (!cond) pad_spc(llen, 64, "[SKIPPED]\n"); else ret += expect_ptrne(expr, llen, cmp); } while (0)
+
+static int expect_ptrne(const void *expr, int llen, const void *cmp)
+{
+	int ret = 0;
+
+	llen += printf(" = <%p> ", expr);
+	if (expr == cmp) {
+		ret = 1;
+		llen += pad_spc(llen, 64, "[FAIL]\n");
+	} else {
+		llen += pad_spc(llen, 64, " [OK]\n");
+	}
+	return ret;
+}
+
+#define EXPECT_PTRER2(cond, expr, expret, experr1, experr2)		\
+	do { if (!cond) pad_spc(llen, 64, "[SKIPPED]\n"); else ret += expect_ptrerr2(expr, expret, experr1, experr2, llen); } while (0)
+
+#define EXPECT_PTRER(cond, expr, expret, experr)			\
+	EXPECT_PTRER2(cond, expr, expret, experr, 0)
+
+static int expect_ptrerr2(const void *expr, const void *expret, int experr1, int experr2, int llen)
+{
+	int ret = 0;
+	int _errno = errno;
+
+	llen += printf(" = <%p> %s ", expr, errorname(_errno));
+	if (expr != expret || (_errno != experr1 && _errno != experr2)) {
+		ret = 1;
+		if (experr2 == 0)
+			llen += printf(" != (<%p> %s) ", expret, errorname(experr1));
+		else
+			llen += printf(" != (<%p> %s %s) ", expret, errorname(experr1), errorname(experr2));
+		llen += pad_spc(llen, 64, "[FAIL]\n");
+	} else {
+		llen += pad_spc(llen, 64, " [OK]\n");
+	}
+	return ret;
+}
 
 #define EXPECT_STRZR(cond, expr)				\
 	do { if (!cond) pad_spc(llen, 64, "[SKIPPED]\n"); else ret += expect_strzr(expr, llen); } while (0)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
