Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145B1EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 15:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ueCZ5twdJ4pVFUq6lBt3AFMOjASD3+pB3Ip7BDh1clA=; b=PI4nTjaf9ANuVJ
	Ni4mWQjtRrMU8oDJ7v8Tf5sjHXCkpOMQsXKWa56ncc8D1+yMqmX5lUN9iEHI2rFkJ8kxOaHTFzLx8
	7ZRtanG3GPhnaghmGeD8ANDU5I6DEFUr4w7G2BSLTz6jt5z0YzIaADB1LBB95lfY0utN7MHr4u3+x
	y399au4b9xSACvQrDQvMHe5id2eUiODmY+NnkYxN9ZKXAtTZEtwGeBAOAaGhlIli7M1UMRhiMO2gW
	1xWfN406JT8es/xhODHsaXrwNEsjbQebr6OxlhpIlaqXQ2AVjTOU9HWB+CRiNGI7N7f7m+hHGc7iX
	5Thbmj+ETLxHm4sWtc0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHn2V-004yQS-25;
	Fri, 07 Jul 2023 15:06:31 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHn2S-004yPA-10
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 15:06:29 +0000
X-QQ-mid: bizesmtp72t1688742370t5qefwef
Received: from linux-lab-host.localdomain ( [116.30.131.119])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Jul 2023 23:06:09 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: 3M0okmaRx3hzmnpwX7/mep5Hi+aL1BsPnbLb2Ne734KOZ+87748VonTMKdRIp
	EFDKQ10JOaI9H1K/u2Yfwm8Ia6Dla25b2yBF2VOfTaGbJ/qyULz0sUU/SWH5h85TZzJwQ+a
	ztzbh/G5rkZFJYZ4liyhe7BpLWnr+cG4Cso4RfBaWwkjZAKRX31UJCpxkIJvbOU/LUOgxD5
	Qgl3up7OJ42WsGe4o8iGLxOPxd9rbypRPLBrFdawoixcB5WOgHOgR4cSe7KnQuCPj8OcVdY
	+ZeJXUx7dr7R+2CsEhy7RZm+kHa23A8+dd3hyEJ1r0fouvYK1X4bs88rqWmwsePtF9ARtvj
	XfrFvCXbpGEVTpwnrQq6gBVuH6ZDkORFuY53Ge7nNia4nbM0CqdRjoa1eF15Q==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12075169014602729724
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	david.laight@aculab.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v6 13/15] selftests/nolibc: add mmap_bad test case
Date: Fri,  7 Jul 2023 23:05:49 +0800
Message-Id: <fdc400ae881aa3819978d43cea7004df7b276551.1688739493.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1688739492.git.falcon@tinylab.org>
References: <cover.1688739492.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_080628_672570_6CB31F6F 
X-CRM114-Status: UNSURE (   6.09  )
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

The length argument of mmap() must be greater than 0, passing a zero
length argument expects failure with -EINVAL.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index fde1b3c51a4a..4026772ed4c5 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -669,6 +669,7 @@ int run_syscall(int min, int max)
 		CASE_TEST(lseek_m1);          EXPECT_SYSER(1, lseek(-1, 0, SEEK_SET), -1, EBADF); break;
 		CASE_TEST(lseek_0);           EXPECT_SYSER(1, lseek(0, 0, SEEK_SET), -1, ESPIPE); break;
 		CASE_TEST(mkdir_root);        EXPECT_SYSER(1, mkdir("/", 0755), -1, EEXIST); break;
+		CASE_TEST(mmap_bad);          EXPECT_PTRER(1, mmap(NULL, 0, PROT_READ, MAP_PRIVATE, 0, 0), MAP_FAILED, EINVAL); break;
 		CASE_TEST(open_tty);          EXPECT_SYSNE(1, tmp = open("/dev/null", 0), -1); if (tmp != -1) close(tmp); break;
 		CASE_TEST(open_blah);         EXPECT_SYSER(1, tmp = open("/proc/self/blah", 0), -1, ENOENT); if (tmp != -1) close(tmp); break;
 		CASE_TEST(poll_null);         EXPECT_SYSZR(1, poll(NULL, 0, 0)); break;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
