Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB029EB64D9
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 15:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lc54DYloyDH5sQRcEL6fTGhy+x1G5gHUkCAmrpbyN5g=; b=2hTUMR8tYzVcXy
	dASodVzBzM5CSSxTN70J33PlMW7A75wrMnKK0juzWuiS2zZnEKsXxWr4yuuO1EgrSUsee9QIx+pWG
	fCO3DO/UZBAwy73bRcjmYzh/Uutz8jA+oZ932H8Tn0ZRgKvJHCulVIzL4jTmaYG4uEMNan9q0ENfO
	rA6DyxBMH1rZAudu0xN5OHCWUKYmjlmnBDH//2g1twFkIGEr6IQzP1IVFK0pSZIbjsla9yzsR/U5H
	W7yV7qazZ8FlpqwOJIOh/YUAZkCi4WS0H6mjNthbJKzq+DdlRgW93/jdvTdKQWRgqK1uFCX2kcTeX
	aZYudyaVIkDLsxAz8C3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHn17-004yF8-2u;
	Fri, 07 Jul 2023 15:05:05 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHn15-004yDt-1b
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 15:05:05 +0000
X-QQ-mid: bizesmtp86t1688742286tdi4pyen
Received: from linux-lab-host.localdomain ( [116.30.131.119])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Jul 2023 23:04:44 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: LE7C6P2vL8SOb2ot9Z4ClJPBG54oOkVEmnFkdgI7ol3U2CHkMdwXkXemITIbi
	djp+D/7qqCayMft9D4BLvUx1HdAK5PtsH0bKSsHvQQ+CQkH1NcscF1hU+hEdiActny/W++4
	6yGiFU5Cz2UjoqfospzFK3ZAlb9V9Z8HNBWYr7kfNzFTOIq05OxVwEbh6Hb0+GXFC6NojBw
	7Qtx8mUIxs/JUHjqS8OQABWAVMsbcFSCfrY0zgRT/BHTNmJuJF4kAf7bGtIxHkt0us2ClEh
	JFf+lGyIaYHHUbIp1aGNk98tQMfnK2RpSFzpwgXnA7ngEk22+dCmS++VBzsBk+5rHAQIBV4
	M7h6K18S8y+59KAI10TvychS9ca23hf+ByN50OBU8CyYuCwK1OflvnlqOuJKA==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4349370555613870298
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	david.laight@aculab.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v6 12/15] selftests/nolibc: add sbrk_0 to test current brk getting
Date: Fri,  7 Jul 2023 23:04:38 +0800
Message-Id: <1d45f48df9735f7c7cd52e2529712a7436c94355.1688739492.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1688739492.git.falcon@tinylab.org>
References: <cover.1688739492.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_080503_860338_8BF898B6 
X-CRM114-Status: UNSURE (   7.25  )
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

From musl 0.9.14 (to the latest version 1.2.3), both sbrk() and brk()
have almost been disabled for they conflict with malloc, only sbrk(0) is
still permitted as a way to get the current location of the program
break, let's support such case.

EXPECT_PTRNE() is used to expect sbrk() always successfully getting the
current break.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 8be675debf28..fde1b3c51a4a 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -633,6 +633,7 @@ int run_syscall(int min, int max)
 		CASE_TEST(kill_0);            EXPECT_SYSZR(1, kill(getpid(), 0)); break;
 		CASE_TEST(kill_CONT);         EXPECT_SYSZR(1, kill(getpid(), 0)); break;
 		CASE_TEST(kill_BADPID);       EXPECT_SYSER(1, kill(INT_MAX, 0), -1, ESRCH); break;
+		CASE_TEST(sbrk_0);            EXPECT_PTRNE(1, sbrk(0), (void *)-1); break;
 		CASE_TEST(sbrk);              if ((p1 = p2 = sbrk(4096)) != (void *)-1) p2 = sbrk(-4096); EXPECT_SYSZR(1, (p2 == (void *)-1) || p2 == p1); break;
 		CASE_TEST(brk);               EXPECT_SYSZR(1, brk(sbrk(0))); break;
 		CASE_TEST(chdir_root);        EXPECT_SYSZR(1, chdir("/")); break;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
