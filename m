Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656D7C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 17:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d+zgFoWMYI8N0T8Vm3n5jWcK2dOYHqNYtMlkRk4rQNk=; b=BQKiwdnLM7HWsS
	8Gdj29hYogkwUtQC7v5bAaTIQK3u9kYitIaZPZ/LCZVNnxD6qdgCWm04TCWULQEdw2pu+/ayuMtKJ
	3k0XmBfrwj7O57YgcAsJ8UtujFWmGYMGSJ4MOrhS3QYiv0C0HOQAZfx59HuP+HkfeLxE27Hjm4ytS
	hh+sKTAgbphS3bVi1IsHUWTzPeZD+n6btNB2CebGr/cuo4LexBbX7NZJtn3SHrOnZFPQ4vmZEu/tm
	yEgP/BnqbUAJ3roAhppt+GolXYTM7CVzbEaGFXZLdyeKhTDcPh+LtuiMpzEG0lXNlqbRGfN5u3QCi
	pqGC3okVVeqU9Ub+HF0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1sh9-00EHNy-3C;
	Wed, 24 May 2023 17:54:44 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1sh6-00EHMw-30
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 17:54:42 +0000
X-QQ-mid: bizesmtp63t1684950871teid7j3l
Received: from linux-lab-host.localdomain ( [116.30.125.36])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 May 2023 01:54:30 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: ILHsT53NKPiQNaLNfvtQg60iCEjU86KTaag2QHiPU3ih6Rb4YpBvqJza1CLGu
	LpFlDQrCd1CzUUzmNws22YxZUV8d6W8jYPZ2nrEDEaDmsZpm8iPmoW9lOOfcyOqguLm1+zY
	2K7WSkALc/5XCjQUw2A2znLCN1tjC1H9y9lzWCm0I/PH1PsorxoBge3kGufcq0lhKqef5e+
	CVmpEhsvbuFluOifXkdyczY4POc8Y4WJ4pvpPA80rp4wtPUOpsnYC4ZwPE+ZmXe13mDpm5R
	oYI+sqLkgRmeyX24IgJ2tlqgWzMkjR5iyKIG0UMIDDV0BFXbEJZqwkNZiE2lhmIzdCQFt3r
	amaHK22+U+HoGiOcPDSAkQo8WB4QmfyssStP9B443w1uR+/5UunbTM1SORuiw==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11833202980194447425
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	thomas@t-8ch.de
Subject: [PATCH 07/13] selftests/nolibc: remove the duplicated gettimeofday_bad2
Date: Thu, 25 May 2023 01:54:19 +0800
Message-Id: <f26de8e1abb27035442e9c7c58aecf18bb4e902c.1684949268.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1684949267.git.falcon@tinylab.org>
References: <cover.1684949267.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_105441_266841_ADD161B1 
X-CRM114-Status: UNSURE (   6.62  )
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

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index c86ff6018c7f..a9c07018ac9d 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -575,7 +575,6 @@ int run_syscall(int min, int max)
 #ifdef NOLIBC
 		CASE_TEST(gettimeofday_bad1); EXPECT_SYSER(1, gettimeofday((void *)1, NULL), -1, EFAULT); break;
 		CASE_TEST(gettimeofday_bad2); EXPECT_SYSER(1, gettimeofday(NULL, (void *)1), -1, EFAULT); break;
-		CASE_TEST(gettimeofday_bad2); EXPECT_SYSER(1, gettimeofday(NULL, (void *)1), -1, EFAULT); break;
 #endif
 		CASE_TEST(getpagesize);       EXPECT_SYSZR(1, test_getpagesize()); break;
 		CASE_TEST(ioctl_tiocinq);     EXPECT_SYSZR(1, ioctl(0, TIOCINQ, &tmp)); break;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
