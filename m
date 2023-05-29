Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4B1C77B7E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 19:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MjIUTiimX+H8m77vJx9IWVh8IJv7iMRAbyuXi5NVkIo=; b=M/nSZgJYsDWCjT
	kduFyrhVgDhYMSL1lpPnZSGrFMPowM/7pUjn//hTtti9+Hhgu8+eKtrF9x1w6dMWMAPUGCe2m+C/N
	07r1f8mrVTEMg4FNyD5vqAaocqzNrFqRur2eoHcib3Tn6YBHYMRXXDFxPy/ukUabKtvbga5iTVWVW
	y/vPtzDSuXVvYZvpMLMIaTv1Py5OjNVARzZKP8WFY3c6Qzt3fABAWxE4s78QyaMC3gPt93snnRPHY
	/DQEJLPtjpiBTxDmSeZqbH+EayDuLBTj0E302egbQVkBlcZsJ1x5WlLmq+HtqMmhmi+9ZuhjQ3EQM
	N45qw3H1rUPJCdTySQew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3iqt-00BXuV-2Q;
	Mon, 29 May 2023 19:48:23 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3iqp-00BXsb-0h
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 19:48:20 +0000
X-QQ-mid: bizesmtp69t1685389686tvz8s19j
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 May 2023 03:48:05 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: dKvkn8qoLrH/qrejci3fihvIQXoBf5YJrhmGUUzcf6qh+6IazDSOYdwIhP/YW
	ORgu5EPCd6gOyYSDLJ50tIYOWHXJxLAHR+9ATsEoUhwa54b9uqgZV8rWyvxv5W1sGh3Dw0f
	yzw3WsCbvyXct5MtQJqJt/JFGFvi3IWadG8J3YkTbMp0ForpQJ/4qiirjssVz+7nPuHC5wH
	zOP+3TtFbEJQahQpwJpxiK5lh9V5fPTxAGAibu31tRi7EEfUpX+/b6G5EdjvKBHfJUrz/40
	IcdygC3t7OZS2n+o3MeIYbt6xp+apeSPMnuQC/Qj2LQQeDS/zt6WhRt3e8Ns8QuBKgJ8LoD
	RID1pt1s13NEExuGLJSuUmrq+riUGsiUJO5h+JsZIs+Q6yPZdUdER2Yi1BNlQ==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17992497824335630657
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v2 02/13] selftests/nolibc: support two errnos with EXPECT_SYSER2()
Date: Tue, 30 May 2023 03:47:55 +0800
Message-Id: <63510e8d586d2d20337f3bb2ff753db4e09bfe11.1685387484.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685387484.git.falcon@tinylab.org>
References: <cover.1685387484.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_124819_554175_7FAFAE23 
X-CRM114-Status: UNSURE (   9.73  )
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

Some functions may be implemented with different syscalls in different
platforms, these syscalls may set different errnos for the same
arguments, let's support such cases.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 7be2625f952d..bf63fc66e486 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -300,18 +300,24 @@ static int expect_sysne(int expr, int llen, int val)
 }
 
 
+#define EXPECT_SYSER2(cond, expr, expret, experr1, experr2)		\
+	do { if (!cond) pad_spc(llen, 64, "[SKIPPED]\n"); else ret += expect_syserr2(expr, expret, experr1, experr2, llen); } while (0)
+
 #define EXPECT_SYSER(cond, expr, expret, experr)			\
-	do { if (!cond) pad_spc(llen, 64, "[SKIPPED]\n"); else ret += expect_syserr(expr, expret, experr, llen); } while (0)
+	EXPECT_SYSER2(cond, expr, expret, experr, 0)
 
-static int expect_syserr(int expr, int expret, int experr, int llen)
+static int expect_syserr2(int expr, int expret, int experr1, int experr2, int llen)
 {
 	int ret = 0;
 	int _errno = errno;
 
 	llen += printf(" = %d %s ", expr, errorname(_errno));
-	if (expr != expret || _errno != experr) {
+	if (expr != expret || (_errno != experr1 && _errno != experr2)) {
 		ret = 1;
-		llen += printf(" != (%d %s) ", expret, errorname(experr));
+		if (experr2 == 0)
+			llen += printf(" != (%d %s) ", expret, errorname(experr1));
+		else
+			llen += printf(" != (%d %s %s) ", expret, errorname(experr1), errorname(experr2));
 		llen += pad_spc(llen, 64, "[FAIL]\n");
 	} else {
 		llen += pad_spc(llen, 64, " [OK]\n");
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
