Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5654AEB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 13:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FpkstmRqfvGPyMHxTW9apmCkVeS8YrjjuiOmguts4tY=; b=DZ7sUOlkzgIrQw
	LIiD/onTLSbjp42DkN2LyE0Ou4pUzK2/WsiZ+aX+Qx24gkZyaH/7Jj6kQRAfjolEH0y4UD3GNOWbp
	J1LLXHrr21VNdiT1BHZpMZfVYhsycPgvHB+/dKeyDdihsAu0/7ktpU0S2T80Xn89/wxDBgoUaB6Ke
	YghQtjJ1x9SDHCPUsGSgzshSDCheFBpZKWbxe8SFosZJjRajQqU0x+YQL1ETRAa6gor6wGd545wGu
	axhi5/EzyqyP9R+aZHxjQUvOEC81nayKwMSTnDZd0HflYXLZW3Dke+wGuJsqz7O+0uKYlUzFcpnx2
	kAsu5bhJ/plcv2bNMtfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEVUj-00Fo0q-24;
	Wed, 28 Jun 2023 13:46:05 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEVUg-00Fnze-2E
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 13:46:04 +0000
X-QQ-mid: bizesmtp72t1687959924tdeldav3
Received: from linux-lab-host.localdomain ( [116.30.129.193])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 28 Jun 2023 21:45:23 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: 3M0okmaRx3hbfDVbYv/1Z/TLd6Ir+AB6pAGiQfbDE/hehL3KYjLzY6o73548z
	E4mqATphOaFmoSi4iLJvd5rkDgbj3ueAMfev9X3KkHCz19jtFSWtubU0dPubSCTu4iCZtvJ
	6+Me1uOjqWESpbZZ0nfkhRs9ifKfgHRoV/A3xmWTBTpwuoibmtb/mBCIo8x1WIRs0EnpGcJ
	LD6F9363XqkEJVSHTVo+dJZgHPzGJ+D4W3bMSJHbGgfHXOM0GPYKRc8q2Tkhzx/jYTAKkGT
	clMThOrDt5eosqiZH0yWeaojISGQtVAcbkIZMgDDMa3BwDki19OJ139cnQGqJvmWbcFoqxk
	4YIbWiWyq87TNjP1IrcPan2dJhbkyvpHO6eXxxP1QEqyl+ILZXhj7Xs+jvE6w==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12436359372428410090
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	david.laight@aculab.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 12/14] selftests/nolibc: add EXPECT_PTREQ, EXPECT_PTRNE and EXPECT_PTRER
Date: Wed, 28 Jun 2023 21:44:58 +0800
Message-Id: <1c24dab9b346455b627cfef34305ce8028c26156.1687957589.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687957589.git.falcon@tinylab.org>
References: <cover.1687957589.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_064603_030136_2E0459B4 
X-CRM114-Status: UNSURE (   9.86  )
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
- EXPECT_PTRER2() expects failure with two specified errnos.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 58 ++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 486334981e60..34af802dadfd 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -361,6 +361,64 @@ static int expect_ptrnz(const void *expr, int llen)
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
