Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C67EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 13:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yp92ESjfsjb3VO5Tve05o0hPCX6puOgy6PncFCUYYiA=; b=EKUllueO6LRiIp
	+dM5bOcLx0xbANSg1ba9HvXjIcEEXcndnFXh7eAin80an7nor9+CQw4wMc5V5XtjuuGQzXYDDBrII
	oiloagr0SFS13WMw4O4ILsmEGV6KZ8Is9t8KeXpHViFuwwsKFQrLSiLC3miBlc9N1ZY7GXbTvDeEy
	UPkU6JO5gHKPpup+3/I3KkBjDjekjIhkOmWO2f1qsxkTT54Uj9jlhpP/bljW6CTO0HIQ1kx1Qo2YU
	GvDOpfdY+rJ3iTuA6lQkNeMSmUhVrsvCDS8n15LuVDjPFdVbMq/lsXfd2LDQhQBui2qT9ml0fEy/c
	kkPZU9Wovsuw4OljbqiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEVZv-00FoaQ-0J;
	Wed, 28 Jun 2023 13:51:27 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEVZr-00FoZ8-2T
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 13:51:25 +0000
X-QQ-mid: bizesmtp62t1687960254t1k4fnuc
Received: from linux-lab-host.localdomain ( [116.30.129.193])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 28 Jun 2023 21:50:52 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: LE7C6P2vL8Rs71HKKnUKI/KsyIrvxJemr+QCXnBO0TehcHy+yUadv9WfiP7BO
	HumbA33LeCmpxXahC9MRtCsLp5durYPTvDlmaJANCO1MTNZEb96K4CiFu4Fl/voUN96haZ9
	ZXcXz4lYzLkh1CGfyBVFfJpuIPMmn7i6aYGvsP138KojvBcs/6/Gnegj72JAAmfLUO2AkYr
	IAf+MrlyOU2tFhoCORLxP8p1gN7+1CNaExSogNRUJPXZSOMYa4w1o2+VKtn7eSCuWW3+Jn7
	QbGg+iWGuMvOZIh1BQHkcnh8BLx3mRLxLqIcBeQ/8bNQkAlB1QJJaoayNC4N6eDso0yW2XO
	LBMnmsTl2FHwwFfqw7qGLOxkdTijLN0URhWT7t/v7RlefDPLcE=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15994507505466130744
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	david.laight@aculab.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 13/14] selftests/nolibc: add sbrk_0 to test current brk getting
Date: Wed, 28 Jun 2023 21:46:28 +0800
Message-Id: <f329ca3550f654501390d3fda46889367babfc60.1687957589.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687957589.git.falcon@tinylab.org>
References: <cover.1687957589.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_065124_100725_53EEA681 
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
