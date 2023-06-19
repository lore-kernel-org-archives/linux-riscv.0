Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6CBEB64DB
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 15:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yp92ESjfsjb3VO5Tve05o0hPCX6puOgy6PncFCUYYiA=; b=EfJYODku3vCXfo
	StSA0UObGk7XPojK3M2jS4BaVuZbe0DaIdJ9B7itouKepRFHpCp31BtJrM/ocRwcfRXbgekel/5vr
	c5p6ysNlneofKyzYCoWYjSp6p2ooTrQK9nbYKUHeB0i7MFS41X13iJ5NZ6Pk9ElODDEpYecODnaWC
	vfPiFx147OZpUNWPXoewHe/jOyae44IPlfGY5ck7PJ0TzxGlJSedGNumD9GXoZAulD+o4fP5fWrZw
	Vusw0qHuPszZUt0gT21G/1kpvackEaMQ/2HAiwFfXqzCVtgKXJe1SlusEqg4IwHV4a0QlKJ72PANp
	YLqGFhhXulveqGZqREuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBHDX-008r4o-1V;
	Mon, 19 Jun 2023 15:54:59 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBHDT-008r3X-39
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 15:54:57 +0000
X-QQ-mid: bizesmtp88t1687190077tbbjb744
Received: from linux-lab-host.localdomain ( [116.30.126.60])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 Jun 2023 23:54:36 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: 7jw2iSiCazrClih7lQSw1lHt5a5sEA2WAD1UMQ9RMYxH4lPlMP9RlLSFyxJtv
	j+1aODH0kfVvVUG+Hy8dMmNAmWCFvsk7cZphwRrkAIZmNzeRcqbsnR/b9YWp4mLgpZYF8ld
	1Z2z/0qDH1rmprRPceUvjzkuQXRO5Dnej7ew6HFEXPKN76cwi5AkJzV4Piq3D1EF4ZqlAgb
	J0QjvClC5shv0UDB2arUdlC8rfhsKGMNY9guCj6qdEvcw1uJFuz9xx6PEb4iLKZBwtyNtiA
	9QJE/Iu05lxs6gtg6Q0YYXvOdh+oKy6Jy6Ckk5ArTaEIK5YorKlbnR/0/zKNqR5/pxE+LAy
	83PDzWkqpozLdwmYpDUci7RfDcCowkFAAhvNqPTgaagQ0fEoys/YTJD6UYrAA==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2291941404729433177
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: david.laight@aculab.com,
	arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v4 09/10] selftests/nolibc: add sbrk_0 to test current brk getting
Date: Mon, 19 Jun 2023 23:54:15 +0800
Message-Id: <105b488a94953ec8e7b4555bbc89c8e5a17e2c8f.1687187451.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687187451.git.falcon@tinylab.org>
References: <cover.1687187451.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_085456_312568_B94AFB80 
X-CRM114-Status: UNSURE (   7.15  )
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
still permitted as a way to get the current brk, let's support such
case.

EXPECT_PTRNE() is used to expect sbrk() always successfully getting the
current brk.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 34af802dadfd..80ab29e2887c 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -630,6 +630,7 @@ int run_syscall(int min, int max)
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
