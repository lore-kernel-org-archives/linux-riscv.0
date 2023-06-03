Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30EEC77B7A
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 08:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MgNsZqPGJZr2vwbkNha/cJGpY8/mRBLLCuXnj9BPcMM=; b=AN3a4RwzIasC2i
	vqpWfLOvfqSJaz/xcdatcxsvdGa6Mig2DCYJCw3EgkaYhsK6py3018lryeF2KPyN2eyH2RSTM+v1Z
	yHz+ehl1u2u95iWGKXP6mojtc3NOPJSqsdBUEfSGruTK/rRFMi3Zw9vG5D753wjOAjEw0tcymw9Ut
	Xd5DhSmyJOrs6QkSlj6/M//MMErJwVUxN+W8/ed8Amm/WnwVOa6avvPyEZfro2Mx1e6F3tZIcoQ+O
	5SCRuRCcDq7C8+BcKxUutzmrwU1kF+wh1oME2g8FtXoVktAuYVEZGlHqcPFrUnaB0m+SGVoRd0vO1
	l1c/9v3FzwKOXnmEzUpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5MOh-0094Se-0q;
	Sat, 03 Jun 2023 08:14:03 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5MOe-0094RQ-2s
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jun 2023 08:14:02 +0000
X-QQ-mid: bizesmtp81t1685780027txyb6un4
Received: from linux-lab-host.localdomain ( [119.123.130.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 03 Jun 2023 16:13:46 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: OFQdrTmJ2CRnGX8nVsKHr+YHzlkPZt5cNCRThmliWSmaPWUuX+pWuPeCQB+Y8
	JAfkpUn4w/DJAP1he/6M6/LIY+/AKW0VDoLH6gY98CM1dwtMvU3KdeSla8x9I65C6c0zhCD
	5GVxav2Y/twBS7c81AJzmqjCmamH64ivTPSG5MEs0J7mbN5L9hQhZlHZVC6T4MhKNkYBx2n
	AAzFJJ+WvSyRQD+Y28jCE+3/LpyzXP+sN05kqIsroD8fn1ddQxDdAblDbh0421O0z2ZpRAe
	eTYQNVt7ysvNJbIEPEkE1QtaKOM4UOF1bIDUVEBFZUwhVUUYB9VMT/5bDGhPMDlKzmP1kk/
	EVzZu8CpRkCu6YK13JMMnBVFyCE0Tke3T/K0PmxriXuJIVr8KaQ3IRdq8GrMUdI5vs59tVX
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1522453405928296276
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v3 09/12] selftests/nolibc: support two errnos with EXPECT_SYSER2()
Date: Sat,  3 Jun 2023 16:13:40 +0800
Message-Id: <220827b791ed94a465d03545caa490fdbbd47d1f.1685777982.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685777982.git.falcon@tinylab.org>
References: <cover.1685777982.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_011401_227939_68C5A15E 
X-CRM114-Status: UNSURE (   9.14  )
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

Suggested-by: Willy Tarreau <w@1wt.eu>
Link: https://lore.kernel.org/linux-riscv/20230528113325.GJ1956@1wt.eu/
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index a8fcad801cf2..a1c402ce32f4 100644
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
